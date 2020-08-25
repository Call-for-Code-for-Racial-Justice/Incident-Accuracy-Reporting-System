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

@isTest
private class IBMWatsonConfigBasedAuthFactoryTest {
  static testMethod void testCreateNoauth() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_AUTH_TYPE, IBMWatsonCredentialUtils.AUTH_TYPE_NO_AUTH);

    IBMWatsonAuthenticator authenticator = IBMWatsonConfigBasedAuthenticatorFactory.createAuthenticator(props);
    System.assert(authenticator instanceof IBMWatsonNoAuthAuthenticator);
    Test.stopTest();
  }

  static testMethod void testCreateBasic() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_AUTH_TYPE, IBMWatsonCredentialUtils.AUTH_TYPE_BASIC);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_USERNAME, 'username');
    props.put(IBMWatsonCredentialUtils.PROP_NAME_PASSWORD, 'password');

    IBMWatsonAuthenticator authenticator = IBMWatsonConfigBasedAuthenticatorFactory.createAuthenticator(props);
    System.assert(authenticator instanceof IBMWatsonBasicAuthenticator);
    Test.stopTest();
  }

  static testMethod void testCreateIAM() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_AUTH_TYPE, IBMWatsonCredentialUtils.AUTH_TYPE_IAM);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_APIKEY, 'apikey');

    IBMWatsonAuthenticator authenticator = IBMWatsonConfigBasedAuthenticatorFactory.createAuthenticator(props);
    System.assert(authenticator instanceof IBMWatsonIAMAuthenticator);
    Test.stopTest();
  }

  static testMethod void testCreateCP4D() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_AUTH_TYPE, IBMWatsonCredentialUtils.AUTH_TYPE_CP4D);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_URL, 'url');
    props.put(IBMWatsonCredentialUtils.PROP_NAME_USERNAME, 'username');
    props.put(IBMWatsonCredentialUtils.PROP_NAME_PASSWORD, 'password');

    IBMWatsonAuthenticator authenticator = IBMWatsonConfigBasedAuthenticatorFactory.createAuthenticator(props);
    System.assert(authenticator instanceof IBMWatsonCloudPakForDataAuthenticator);
    Test.stopTest();
  }

  static testMethod void testCreateBearerToken() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_AUTH_TYPE, IBMWatsonCredentialUtils.AUTH_TYPE_BEARER_TOKEN);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_BEARER_TOKEN, 'token');

    IBMWatsonAuthenticator authenticator = IBMWatsonConfigBasedAuthenticatorFactory.createAuthenticator(props);
    System.assert(authenticator instanceof IBMWatsonBearerTokenAuthenticator);
    Test.stopTest();
  }
}