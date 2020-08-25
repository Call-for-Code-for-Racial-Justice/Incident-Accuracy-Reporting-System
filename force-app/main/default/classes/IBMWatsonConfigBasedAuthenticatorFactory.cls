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
 * This class serves as an IBMWatsonAuthenticator factory.
 * It will detect and use various configuration sources in order to produce an IBMWatsonAuthenticator instance.
 */
public class IBMWatsonConfigBasedAuthenticatorFactory {

  // hidden since this is a utility class
  private IBMWatsonConfigBasedAuthenticatorFactory() {}

  /**
   * Retrieves authentication configuration information for the specified cloud service,
   * and returns an IBMWatsonAuthenticator instance, or null if the configuration information could not be found.
   *
   * @param serviceName the name of the cloud service whose authentication information should be retrieved
   * @return an IBMWatsonAuthenticator that reflects the properties that were found in the various config sources
   */
  public static IBMWatsonAuthenticator getAuthenticator(String serviceName) {
    IBMWatsonAuthenticator authenticator = null;

    // Check to see if this service has any properties defined in a credential file.
    Map<String, String> authProps = IBMWatsonCredentialUtils.getFileCredentialsAsMap(serviceName);

    // Now create an authenticator from the map.
    if (!authProps.isEmpty()) {
      authenticator = createAuthenticator(authProps);
    }

    return authenticator;
  }

  /**
   * Instantiates an IBMWatsonAuthenticator that reflects the properties contains in the specified Map.
   *
   * @param props a Map containing configuration properties
   * @return an IBMWatsonAuthenticator instance
   */
  public static IBMWatsonAuthenticator createAuthenticator(Map<String, String> props) {
    IBMWatsonAuthenticator authenticator = null;

    // If auth type was not specified, we'll use "iam" as the default.
    String authType = props.get(IBMWatsonCredentialUtils.PROP_NAME_AUTH_TYPE);
    if (String.isBlank(authType)) {
      authType = IBMWatsonCredentialUtils.AUTH_TYPE_IAM;
    }

    if (authType.equalsIgnoreCase(IBMWatsonCredentialUtils.AUTH_TYPE_NO_AUTH)) {
      authenticator = new IBMWatsonNoAuthAuthenticator();
    } else if (authType.equalsIgnoreCase(IBMWatsonCredentialUtils.AUTH_TYPE_BASIC)) {
      authenticator = new IBMWatsonBasicAuthenticator(props);
    } else if (authType.equalsIgnoreCase(IBMWatsonCredentialUtils.AUTH_TYPE_IAM)) {
      authenticator = new IBMWatsonIAMAuthenticator(props);
    } else if (authType.equalsIgnoreCase(IBMWatsonCredentialUtils.AUTH_TYPE_CP4D)) {
      authenticator = new IBMWatsonCloudPakForDataAuthenticator(props);
    } else if (authType.equalsIgnoreCase(IBMWatsonCredentialUtils.AUTH_TYPE_BEARER_TOKEN)) {
      authenticator = new IBMWatsonBearerTokenAuthenticator(props);
    }

    return authenticator;
  }
}