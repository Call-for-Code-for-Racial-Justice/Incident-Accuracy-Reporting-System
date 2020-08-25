/*
 * (C) Copyright IBM Corp. 2018, 2020.
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
 * Represents response from IAM API.
 */
public class IBMWatsonIAMToken extends IBMWatsonAbstractToken implements IBMWatsonTokenServerResponse {
  private String accessToken;
  private String refreshToken;
  private String tokenType;
  private Long expiresIn;
  private Long expiration;

  public Long getExpiresIn() {
    return expiresIn;
  }

  public Long getExpiration() {
    return expiration;
  }

  public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
    if (jsonMap == null) {
      return null;
    }

    // replace any names that are different between the API and SDK
    Map<String, String> propertyNameMapping = new Map<String, String> {
      'access_token' => 'accessToken',
      'refresh_token' => 'refreshToken',
      'token_type' => 'tokenType',
      'expires_in' => 'expiresIn'
    };
    jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
    jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

    IBMWatsonIAMToken ret = (IBMWatsonIAMToken) super.deserialize(jsonString, jsonMap, classType);

    return ret;    
  }

  /**
   * Returns true iff this object holds a valid non-expired access token.
   * @return true if token is valid and not expired, false otherwise
   */
  public override boolean isTokenValid() {
    if (getAccessToken() == null || getExpiresIn() == null || getExpiration() == null) {
      return false;
    }

    Double fractionOfTimeToLive = 0.8;
    Long timeToLive = getExpiresIn();
    Long expirationTime = getExpiration();
    Double refreshTime = expirationTime - (timeToLive * (1.0 - fractionOfTimeToLive));
    Double currentTime = Math.floor(System.now().getTime() / 1000);

    return currentTime < refreshTime;
  }

  public override String getAccessToken() {
    return this.accessToken;
  }
}