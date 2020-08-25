/*
 * (C) Copyright IBM Corp. 2019, 2020.
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

/**
 * This class provides an IBMWatsonAuthenticator implementation for the "CloudPakForData" environment.
 * This authenticator will use the configured url, username and password values to automatically fetch
 * an access token from the Token Server.
 * When the access token expires, a new access token will be fetched.
 */
public class IBMWatsonCloudPakForDataAuthenticator extends IBMWatsonTokenRequestBasedAuthenticator implements IBMWatsonAuthenticator {

  // This is the suffix we'll need to add to the user-supplied URL to retrieve an access token.
  private static final String URL_SUFFIX = '/v1/preauth/validateAuth';

  // The cached value of the Authorization header.
  private String authHeader;
  private String url;
  private IBMWatsonCP4DToken tokenData;

  // Force the use of non-default constructors
  private IBMWatsonCloudPakForDataAuthenticator() {}

  /**
   * Constructs an IBMWatsonCloudPakForDataAuthenticator with required properties.
   *
   * @param url the base URL associated with the token server. The path "/v1/preauth/validateAuth" will be appended to
   *            this value automatically.
   * @param username the username to be used when retrieving the access token
   * @param password the password to be used when retrieving the access token
   */
  public IBMWatsonCloudPakForDataAuthenticator(String url, String username, String password) {
    init(url, username, password, null);
  }

  /**
   * Constructs an IBMWatsonCloudPakForDataAuthenticator with all properties.
   *
   * @param url the base URL associated with the token server. The path "/v1/preauth/validateAuth" will be appended to
   *            this value automatically.
   * @param username the username to be used when retrieving the access token
   * @param password the password to be used when retrieving the access token
   * @param headers a set of user-supplied headers to be included in token server interactions
   */
  public IBMWatsonCloudPakForDataAuthenticator(String url, String username, String password, Map<String, String> headers) {
    init(url, username, password, headers);
  }

  /**
   * Construct an IBMWatsonCloudPakForDataAuthenticator instance using properties retrieved from the specified Map.
   *
   * @param config a map containing the configuration properties
   */
  public IBMWatsonCloudPakForDataAuthenticator(Map<String, String> config) {
    init(config.get(IBMWatsonCredentialUtils.PROP_NAME_URL), config.get(IBMWatsonCredentialUtils.PROP_NAME_USERNAME),
      config.get(IBMWatsonCredentialUtils.PROP_NAME_PASSWORD), null);
  }

  /**
   * Initializes the authenticator with all the specified properties.
   *
   * @param url the base URL associated with the token server. The path "/v1/preauth/validateAuth" will be appended to
   *          this value automatically.
   * @param username the username to be used when retrieving the access token
   * @param password the password to be used when retrieving the access token
   * @param headers a set of user-supplied headers to be included in token server interactions
   */
  private void init(String url, String username, String password, Map<String, String> headers) {
    this.url = url;
    setBasicAuthInfo(username, password);
    setHeaders(headers);
    this.validate();
  }

  public String getUrl() {
    return this.url;
  }

  public override String authenticationType() {
    return IBMWatsonCredentialUtils.AUTH_TYPE_CP4D;
  }

  public override void authenticate(IBMWatsonRequest.Builder requestBuilder) {
    String headerValue = constructBearerTokenAuthHeader(getToken());
    if (headerValue != null) {
      requestBuilder.addHeader(IBMWatsonHttpHeaders.AUTHORIZATION, headerValue);
    }
  }

  public override void validate() {
    if (String.isBlank(url)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException(String.format(ERRORMSG_PROP_MISSING, new String[]{ 'url' }));
    }

    if (String.isBlank(getUsername())) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException(String.format(ERRORMSG_PROP_MISSING, new String[]{ 'username' }));
    }

    if (String.isBlank(getPassword())) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException(String.format(ERRORMSG_PROP_MISSING, new String[]{ 'password' }));
    }
  }

  public String getToken() {
    String token;

    if (this.tokenData == null || !this.tokenData.isTokenValid()) {
      // request new token
      this.tokenData = requestToken();
    }
    token = tokenData.getAccessToken();

    return token;
  }

  private IBMWatsonCP4DToken requestToken() {
    // Form a GET request to retrieve the access token.
    String requestUrl = this.url;
    if (!requestUrl.endsWith(URL_SUFFIX)) {
      requestUrl += URL_SUFFIX;
    }
    requestUrl = requestUrl.replace('//', '/');

    // Invoke the GET request.
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(requestUrl);
    IBMWatsonCP4DTokenResponse response = (IBMWatsonCP4DTokenResponse) invokeRequest(builder.build(), IBMWatsonCP4DTokenResponse.class);

    // Construct a new IBMWatsonICP4DToken object from the response and return it.
    return new IBMWatsonCP4DToken(response);
  }
}