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
 * This class provides an IBMWatsonAuthenticator implementation for IAM (Identity and Access Management).
 * This authenticator will use the url and apikey values to automatically fetch
 * an access token from the Token Server.
 * When the access token expires, a new access token will be fetched.
 */
public class IBMWatsonIAMAuthenticator extends IBMWatsonTokenRequestBasedAuthenticator implements IBMWatsonAuthenticator {
  private static final String DEFAULT_IAM_URL = 'https://iam.cloud.ibm.com/identity/token';
  private static final String GRANT_TYPE = 'grant_type';
  private static final String REQUEST_GRANT_TYPE = 'urn:ibm:params:oauth:grant-type:apikey';
  private static final String API_KEY = 'apikey';
  private static final String RESPONSE_TYPE = 'response_type';
  private static final String CLOUD_IAM = 'cloud_iam';

  private String apikey;
  private String url;
  private IBMWatsonIAMToken tokenData;

  // Force the use of non-default constructors
  private IBMWatsonIAMAuthenticator() {}

  /**
   * Constructs an IBMWatsonIAMAuthenticator with required properties.
   *
   * @param apikey the apikey to be used when retrieving the access token
   */
  public IBMWatsonIAMAuthenticator(String apikey) {
    init(apikey, null, null, null, null);
  }

  /**
   * Constructs an IBMWatsonIAMAuthenticator with all properties.
   *
   * @param apikey the apikey to be used when retrieving the access token
   * @param url the URL representing the token server endpoint
   * @param clientId the clientId to be used in token server interactions
   * @param clientSecret the clientSecret to be used in token server interactions
   * @param headers a set of user-supplied headers to be included in token server interactions
   */
  public IBMWatsonIAMAuthenticator(String apikey, String url, String clientId, String clientSecret, Map<String, String> headers) {
    init(apikey, url, clientId, clientSecret, headers);
  }

  /**
   * Construct an IBMWatsonIAMAuthenticator instance using properties retrieved from the specified Map.
   *
   * @param config a map containing the configuration properties
   */
  public IBMWatsonIAMAuthenticator(Map<String, String> config) {
    String apikey = config.get(IBMWatsonCredentialUtils.PROP_NAME_APIKEY);
    if (String.isBlank(apikey)) {
      config.get('IAM_APIKEY');
    }
    init(apikey, config.get(IBMWatsonCredentialUtils.PROP_NAME_URL), config.get(IBMWatsonCredentialUtils.PROP_NAME_CLIENT_ID),
      config.get(IBMWatsonCredentialUtils.PROP_NAME_CLIENT_SECRET), null);
  }

  /**
   * Initializes the authenticator with all the specified properties.
   *
   * @param apikey the apikey to be used when retrieving the access token
   * @param url the URL representing the token server endpoint
   * @param clientId the clientId to be used in token server interactions
   * @param clientSecret the clientSecret to be used in token server interactions
   * @param headers a set of user-supplied headers to be included in token server interactions
   */
  private void init(String apikey, String url, String clientId, String clientSecret, Map<String, String> headers) {
    this.apikey = apikey;
    if (String.isBlank(url)) {
      url = DEFAULT_IAM_URL;
    }
    this.url = url;
    setHeaders(headers);
    setClientIdAndSecret(clientId, clientSecret);
  }

  /**
   * @return the apikey configured on this IBMWatsonIAMAuthenticator.
   */
  public String getApiKey() {
    return this.apikey;
  }

  /**
   * @return the URL configured on this IBMWatsonIAMAuthenticator.
   */
  public String getURL() {
    return this.url;
  }

  /**
   * Sets the URL on this IBMWatsonIAMAuthenticator.
   * @param url the URL representing the IAM token server endpoint
   */
  public void setURL(String url) {
    if (String.isBlank(url)) {
      url = DEFAULT_IAM_URL;
    }
    this.url = url;
  }

  /**
   * @return the clientId configured on this IBMWatsonIAMAuthenticator.
   */
  public String getClientId() {
    return getUsername();
  }

  /**
   * @return the clientSecret configured on this IBMWatsonIAMAuthenticator.
   */
  public String getClientSecret() {
    return getPassword();
  }

  /**
   * Sets the clientId and clientSecret on this IBMWatsonIAMAuthenticator.
   *
   * @param clientId the clientId to use in interactions with the token server
   * @param clientSecret the clientSecret to use in interactions with the token server
   */
  public void setClientIdAndSecret(String clientId, String clientSecret) {
    setBasicAuthInfo(clientId, clientSecret);
    this.validate();
  }

  public override String authenticationType() {
    return IBMWatsonCredentialUtils.AUTH_TYPE_IAM;
  }

  public override void authenticate(IBMWatsonRequest.Builder requestBuilder) {
    String headerValue = constructBearerTokenAuthHeader(getToken());
    if (headerValue != null) {
      requestBuilder.addHeader(IBMWatsonHttpHeaders.AUTHORIZATION, headerValue);
    }
  }

  public override void validate() {
    if (String.isBlank(this.apikey)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException(String.format(ERRORMSG_PROP_MISSING, new String[]{ 'apikey' }));
    }
    if (IBMWatsonCredentialUtils.hasBadStartOrEndChar(this.apikey)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException(String.format(ERRORMSG_PROP_INVALID, new String[]{ 'apikey' }));
    }

    if (String.isBlank(getUsername()) && String.isBlank(getPassword())) {
      // both empty is ok
    } else {
      if (String.isBlank(getUsername())) {
        throw new IBMWatsonServiceExceptions.IllegalArgumentException(String.format(ERRORMSG_PROP_MISSING, new String[]{ 'clientId' }));
      }
      if (String.isBlank(getPassword())) {
        throw new IBMWatsonServiceExceptions.IllegalArgumentException(String.format(ERRORMSG_PROP_MISSING, new String[]{ 'clientSecret' }));
      }
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

  private IBMWatsonIAMToken requestToken() {
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(this.url);

    builder.addHeader(IBMWatsonHttpHeaders.CONTENT_TYPE, IBMWatsonHttpMediaType.APPLICATION_FORM_URLENCODED);

    IBMWatsonFormBody formBody = new IBMWatsonFormBody.Builder()
      .add(GRANT_TYPE, REQUEST_GRANT_TYPE)
      .add(API_KEY, apiKey)
      .add(RESPONSE_TYPE, CLOUD_IAM)
      .build();
    builder.body(formBody);

    IBMWatsonIAMToken response = (IBMWatsonIAMToken) invokeRequest(builder.build(), IBMWatsonIAMToken.class);
    return response;
  }
}