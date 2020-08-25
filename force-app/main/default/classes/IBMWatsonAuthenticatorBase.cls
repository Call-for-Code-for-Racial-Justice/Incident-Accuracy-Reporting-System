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
 * This is a common base class used with the various IBMWatsonAuthenticator implementations.
 */
public virtual class IBMWatsonAuthenticatorBase {

  /**
   * Common error messages.
   */
  public static final String ERRORMSG_PROP_MISSING = 'The {0} property is required but was not specified.';
  public static final String ERRORMSG_PROP_INVALID =
      'The {0} property is invalid. Please remove any surrounding \'{\', \'}\', or \" characters.';
  public static final String ERRORMSG_REQ_FAILED = 'Error while fetching access token from token service.';

  /**
   * Returns a "Basic" Authorization header value for the specified username and password.
   * @param username the username
   * @param password the password
   * @return the Authorization header value in the form "Basic &lt;encoded username and password&gt;"
   */
  public static String constructBasicAuthHeader(String username, String password) {
    if (String.isNotBlank(username) && String.isNotBlank(password)) {
      Blob authBlob = Blob.valueOf(username + ':' + password);
      return 'Basic ' + EncodingUtil.base64Encode(authBlob);
    }
    return null;
  }

  /**
   * Returns a "Bearer" Authorization header value for the specified bearer token.
   * @param bearerToken the token value to be included in the header
   * @return the Authorization header value in the form "Bearer &lt;bearerToken&gt;"
   */
  public static String constructBearerTokenAuthHeader(String bearerToken) {
    if (String.isNotBlank(bearerToken)) {
      return 'Bearer ' + bearerToken;
    }
    return null;
  }
}