/*
 * (C) Copyright IBM Corp. 2017, 2020.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 */

public abstract class IBMWatsonService {
  private String defaultServiceURL;
  private String serviceURL;
  private String userAgent;
  private String name;
  private IBMWatsonAuthenticator authenticator;
  private Map<String, String> defaultHeaders = null;

  private static final String USER_AGENT_FORMAT = 'watson-apis-salesforce-sdk-{0} {1}';
  private static final String SDK_VERSION = '5.3.0';
  private static final String ERRORMSG_NO_AUTHENTICATOR = 'Authentication information was not properly configured.';

  // Regular expression for JSON-related mimetypes.
  private static final Pattern JSON_MIME_PATTERN =
    Pattern.compile('(?i)application\\/((json)|(merge\\-patch\\+json))(;.*)?');
  private static final Pattern JSON_PATCH_MIME_PATTERN =
    Pattern.compile('(?i)application\\/json\\-patch\\+json(;.*)?');

  /**
   * Instantiates a new Watson service.
   *
   * @param name the service name
   * @param version the service version
   * @param authenticator the IBMWatsonAuthenticator implementation to use
   */
  protected IBMWatsonService(String name, String version, IBMWatsonAuthenticator authenticator) {
    this.name = name;
    this.userAgent = buildUserAgent(); // initialize the `User-Agent` value

    if (authenticator == null) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException(ERRORMSG_NO_AUTHENTICATOR);
    }
    this.authenticator = authenticator;

    // use service URL from credential file if it exists
    Map<String, String> props = IBMWatsonCredentialUtils.getFileCredentialsAsMap(name);
    String url = props.get(IBMWatsonCredentialUtils.PROP_NAME_URL);
    if (String.isNotBlank(url)) {
      setServiceURL(url);
    }
  }

  /**
   * Returns true iff the specified mimeType indicates a JSON-related content type.
   * (e.g. application/json, application/merge-patch+json, etc.).
   * @param mimeType the mimetype to consider
   * @return true if the mimeType indicates a JSON-related content type
   */
  public static boolean isJsonMimeType(String mimeType) {
    return mimeType != null && JSON_MIME_PATTERN.matcher(mimeType).matches();
  }

  /**
   * Returns true iff the specified mimeType indicates a JsonPatch-related content type.
   * (e.g. application/json-patch+json).
   * @param mimeType the mimetype to consider
   * @return true if the mimeType indicates a JSON-related content type
   */
  public static boolean isJsonPatchMimeType(String mimeType) {
    return mimeType != null && JSON_PATCH_MIME_PATTERN.matcher(mimeType).matches();
  }

  /**
   * Sets the service URL.
   *
   * @param serviceURL the new service URL. Will be ignored if empty or null
   */
  public void setServiceURL(String serviceURL) {
    if (IBMWatsonCredentialUtils.hasBadStartOrEndChar(serviceURL)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('The URL shouldn\'t start or end with curly brackets or '
          + 'quotes. Please remove any surrounding {, }, or " characters.');
    }

    if (String.isNotBlank(serviceURL)) {
      String newServiceURL = serviceURL.endsWith('/') ? serviceURL.removeEnd('/') : serviceURL;
      if (this.serviceURL == null) {
        this.defaultServiceURL = newServiceURL;
      }
      this.serviceURL = newServiceURL;
    } else {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('serviceURL cannot be null or empty');
    }
  }

  /**
   * Gets the service URL.
   *
   *
   * @return the service URL
   */
  public String getServiceURL() {
    return this.serviceURL;
  }

  /**
   * Returns the IBMWatsonAuthenticator instance currently set on this IBMWatsonService instance.
   *
   * @return the IBMWatsonAuthenticator instance
   */
  public IBMWatsonAuthenticator getAuthenticator() {
    return this.authenticator;
  }

  /**
   * Set the default headers to be used on every HTTP request.
   *
   * @param headers name value pairs of headers
   */
  public void setDefaultHeaders(Map<String, String> headers) {
    defaultHeaders = headers;
  }

  private static String buildUserAgent() {
    ApexClass ac = [Select ApiVersion From ApexClass Where Name = 'IBMWatsonService' LIMIT 1];
    return String.format(USER_AGENT_FORMAT, new List<String>{SDK_VERSION, String.valueOf(ac.ApiVersion)});
  }

  /**
   * Parses the IBMWatsonResponse.
   */
  protected Object processResponse(IBMWatsonResponse response, Type targetType) {
    if (targetType != null) {
      // this service is expecting a file response
      if (targetType == IBMWatsonFile.class) {
        String contentDisposition = response.getHeader(IBMWatsonHttpHeaders.CONTENT_DISPOSITION);
        String filename = 'result';
        if (contentDisposition != null) {
          filename = contentDisposition.substringAfter('filename=');
          if (String.isNotBlank(filename)) {
            filename = filename.replaceAll('"', '');
          }
        }
        String contentType = response.getHeader(IBMWatsonHttpHeaders.CONTENT_TYPE);
        IBMWatsonFile resFile = new IBMWatsonFile.FileBuilder()
          .name(filename)
          .description('Synthesize audio file')
          .contentType(contentType)
          .body(response.getBodyAsBlob())
          .build();
        return resFile;
      }
      else if (targetType.equals(String.class)) {
        return response.getBody();
      }
      // all other response types
      else{
        String responseText = response.getBody();
        if (String.isNotBlank(responseText)) {
          Object targetObject = targetType.newInstance();
          Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(responseText);
          String jsonString = JSON.serialize(jsonMap);
          if (targetObject instanceof IBMWatsonDynamicResponseModel) {
            return (IBMWatsonDynamicResponseModel) addResponseHeaders(response, ((IBMWatsonResponseModel) targetObject).deserialize(jsonString, jsonMap, targetType));
          } else {
            return (IBMWatsonResponseModel) addResponseHeaders(response, ((IBMWatsonResponseModel) targetObject).deserialize(jsonString, jsonMap, targetType));
          }
        }
      }
    }

    return null;
  }

  /**
   * Adds headers onto the model returned from the service.
   */
  private Object addResponseHeaders(IBMWatsonResponse response, Object responseObject) {
  	IBMWatsonResponseModel responseModel = (IBMWatsonResponseModel) responseObject;
    String[] headerKeys = response.getHeaderKeys();
    for (String key : headerKeys) {
      responseModel.addHeader(key, response.getHeader(key));
    }
    return responseModel;
  }

  /**
   * Executes the request and parses the response if successful, otherwise throws an exception.
   */
  protected Object createServiceCall(IBMWatsonRequest request, Type targetType) {
    if (request == null) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('request cannot be null');
    }

    IBMWatsonRequest.Builder builder = request.newBuilder();
    setDefaultHeaders(builder);

    if (String.isNotBlank(this.serviceURL)) {
      setAuthentication(builder);
    }

    // Execute the request
    IBMWatsonResponse response = IBMWatsonClient.executeRequest(builder.build());

    // if success, return the parsed the response
    if (response.isSuccessful()) {
      return processResponse(response, targetType);
    }

    // There was a client(4xx) or a server(5xx) error.
    // Get the error message and create the exception
    String error = response.getBody();
    Integer statusCode = response.getStatusCode();

    System.debug('IBMWatsonService.createServiceCall():' + error);

    if (statusCode == IBMWatsonHttpStatus.BAD_REQUEST) // HTTP 400
      throw new IBMWatsonServiceExceptions.BadRequestException(error != null ? error : 'Bad Request', response);

    if (statusCode == IBMWatsonHttpStatus.UNAUTHORIZED) // HTTP 401
      throw new IBMWatsonServiceExceptions.UnauthorizedException('Unauthorized: Access is denied due to invalid credentials. Tip: Check the service URL.', response);

    if (statusCode == IBMWatsonHttpStatus.FORBIDDEN) // HTTP 403
      throw new IBMWatsonServiceExceptions.ForbiddenException(error != null ? error : 'Forbidden: Service refuse the request', response);

    if (statusCode == IBMWatsonHttpStatus.NOT_FOUND) // HTTP 404
      throw new IBMWatsonServiceExceptions.NotFoundException(error != null ? error : 'Not found', response);

    if (statusCode == IBMWatsonHttpStatus.NOT_ACCEPTABLE) // HTTP 406
      throw new IBMWatsonServiceExceptions.ForbiddenException(error != null ? error : 'Forbidden: Service refuse the request', response);

    if (statusCode == IBMWatsonHttpStatus.CONFLICT) // HTTP 409
      throw new IBMWatsonServiceExceptions.ConflictException(error != null ? error : 'Conflict', response);

    if (statusCode == IBMWatsonHttpStatus.REQUEST_TOO_LONG) // HTTP 413
      throw new IBMWatsonServiceExceptions.RequestTooLargeException(error != null ? error : 'Request too large: The request entity is larger than the server is able to process', response);

    if (statusCode == IBMWatsonHttpStatus.UNSUPPORTED_MEDIA_TYPE) // HTTP 415
      throw new IBMWatsonServiceExceptions.UnsupportedException(error != null ? error : 'Unsupported Media Type', response);

    if (statusCode == IBMWatsonHttpStatus.TOO_MANY_REQUESTS) // HTTP 429
      throw new IBMWatsonServiceExceptions.TooManyRequestsException(error != null ? error : 'Too many requests', response);

    if (statusCode == IBMWatsonHttpStatus.INTERNAL_SERVER_ERROR) // HTTP 500
      throw new IBMWatsonServiceExceptions.InternalServerErrorException(error != null ? error : 'Internal Server Error', response);

    if (statusCode == IBMWatsonHttpStatus.SERVICE_UNAVAILABLE) // HTTP 503
      throw new IBMWatsonServiceExceptions.ServiceUnavailableException(error != null ? error : 'Service Unavailable', response);

    // if everything else fails
    throw new IBMWatsonServiceExceptions.ResponseException(statusCode, error, response);
  }

  /**
   * Sets the default headers including User-Agent.
   *
   * @param builder the new default headers
   */
  protected void setDefaultHeaders(IBMWatsonRequest.Builder builder) {
    if (defaultHeaders != null && !defaultHeaders.isEmpty()) {
      for (String key : defaultHeaders.keySet()) {
        builder.addHeader(key, defaultHeaders.get(key));
      }
      if (defaultHeaders.containsKey(IBMWatsonHttpHeaders.USER_AGENT) && defaultHeaders.get(IBMWatsonHttpHeaders.USER_AGENT) != null) {
        userAgent += ' ' + defaultHeaders.get(IBMWatsonHttpHeaders.USER_AGENT);
      }
    }
    builder.addHeader(IBMWatsonHttpHeaders.USER_AGENT, userAgent);
  }

  /**
   * Sets the authentication.
   *
   * @param builder the new authentication
   */
  protected virtual void setAuthentication(IBMWatsonRequest.Builder builder) {
    if (this.authenticator != null) {
      this.authenticator.authenticate(builder);
    } else {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException(ERRORMSG_NO_AUTHENTICATOR);
    }
  }
}