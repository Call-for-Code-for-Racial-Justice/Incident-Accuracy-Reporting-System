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

public class IBMWatsonCredentialUtils {
  private static final String BASIC = 'Basic ';
  private static final String CREDENTIAL_FILE_NAME = 'ibm_credentials';

  /**
   * Valid authentication types.
   */
  public static final String AUTH_TYPE_BASIC = 'basic';
  public static final String AUTH_TYPE_NO_AUTH = 'noauth';
  public static final String AUTH_TYPE_IAM = 'iam';
  public static final String AUTH_TYPE_CP4D = 'cp4d';
  public static final String AUTH_TYPE_BEARER_TOKEN = 'bearerToken';

  /**
   * Constants which define the names of external config properties (e.g. credential file).
   */
  public static final String PROP_NAME_AUTH_TYPE = 'AUTH_TYPE';
  public static final String PROP_NAME_USERNAME = 'USERNAME';
  public static final String PROP_NAME_PASSWORD = 'PASSWORD';
  public static final String PROP_NAME_BEARER_TOKEN = 'BEARER_TOKEN';
  public static final String PROP_NAME_URL = 'AUTH_URL';
  public static final String PROP_NAME_APIKEY = 'APIKEY';
  public static final String PROP_NAME_CLIENT_ID = 'CLIENT_ID';
  public static final String PROP_NAME_CLIENT_SECRET = 'CLIENT_SECRET';


  private IBMWatsonCredentialUtils() {
    // This is a utility class - no instantiation allowed.
  }

  public static String toBasicAuth(String username, String password) {
    Blob blobValue = Blob.valueOf(username + ':' + password);
    return BASIC + EncodingUtil.base64Encode(blobValue);
  }

  /**
   * Returns true if the supplied value begins or ends with curly brackets or quotation marks.
   *
   * @param credentialValue the credential value to check
   * @return true if the value starts or ends with these characters and is therefore invalid
   */
  public static Boolean hasBadStartOrEndChar(String credentialValue) {
    return credentialValue.startsWith('{')
      || credentialValue.startsWith('"')
      || credentialValue.endsWith('}')
      || credentialValue.endsWith('"');
  }

  private static String getCredentialFileBody() {
    String fileContents = null;
    try {
      StaticResource credentialFileResource = [SELECT Id, Body FROM StaticResource WHERE Name = :CREDENTIAL_FILE_NAME LIMIT 1];
      fileContents = credentialFileResource.Body.toString();
    } catch (QueryException e) {
      System.debug(System.LoggingLevel.INFO, 'Could not find credential file in Static Resources');
    }
    return fileContents;
  }

  public static Map<String, String> parseCredentialFile(String serviceName, String fileContents) {
    Map<String, String> props = new Map<String, String>();

    String[] lineList = fileContents.split('\r\n');
    for (String line : lineList) {
      String[] keyAndVal = line.split('=');
      String lowercaseKey = keyAndVal[0].toLowerCase();
      Integer serviceNameLength = serviceName.length();

      if (lowercaseKey.contains(serviceName)) {
        String credentialType = lowercaseKey.substring(serviceNameLength + 1);
        String credentialValue = keyAndVal[1];
        if (String.isNotBlank(credentialType) && String.isNotBlank(credentialValue)) {
          props.put(credentialType.toUpperCase(), credentialValue);
        }
      }
    }

    return props;
  }

  public static Map<String, String> getFileCredentialsAsMap(String serviceName) {
    Map<String, String> fileCredentials = new Map<String, String>();
    String fileContents = getCredentialFileBody();

    if (fileContents != null) {
      fileCredentials = parseCredentialFile(serviceName, fileContents);
    }

    return fileCredentials;
  }
}