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
private class IBMWatsonBearerTokenAuthenticatorTest {
  static testMethod void testSuccess() {
    Test.startTest();
    String token = 'abc-123';

    IBMWatsonBearerTokenAuthenticator authenticator = new IBMWatsonBearerTokenAuthenticator(token);
    System.assertEquals(IBMWatsonCredentialUtils.AUTH_TYPE_BEARER_TOKEN, authenticator.authenticationType());
    System.assertEquals(token, authenticator.getBearerToken());

    IBMWatsonRequest.Builder builder = new IBMWatsonRequest.Builder().url('https://test.com');
    authenticator.authenticate(builder);
    IBMWatsonRequest request = builder.build();

    String authHeader = request.header(IBMWatsonHttpHeaders.AUTHORIZATION);
    System.assert(authHeader != null);
    System.assertEquals('Bearer ' + token, authHeader);

    // change token and verify again
    token = 'xyz-789';
    authenticator.setBearerToken(token);
    builder = new IBMWatsonRequest.Builder().url('https://test.com');
    authenticator.authenticate(builder);
    request = builder.build();
    authHeader = request.header(IBMWatsonHttpHeaders.AUTHORIZATION);
    System.assert(authHeader != null);
    System.assertEquals('Bearer ' + token, authHeader);
    Test.stopTest();
  }

  static testMethod void testMissingBearerToken() {
    Test.startTest();
    try {
      IBMWatsonBearerTokenAuthenticator authenticator = new IBMWatsonBearerTokenAuthenticator((String) null);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyBearerToken() {
    Test.startTest();
    try {
      IBMWatsonBearerTokenAuthenticator authenticator = new IBMWatsonBearerTokenAuthenticator('');
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testMissingBearerTokenMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    try {
      IBMWatsonBearerTokenAuthenticator authenticator = new IBMWatsonBearerTokenAuthenticator(props);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyBearerTokenMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_BEARER_TOKEN, '');
    try {
      IBMWatsonBearerTokenAuthenticator authenticator = new IBMWatsonBearerTokenAuthenticator(props);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testGoodMapConfig() {
    Test.startTest();
    String token = 'abc-123';
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_BEARER_TOKEN, token);
    IBMWatsonBearerTokenAuthenticator authenticator = new IBMWatsonBearerTokenAuthenticator(props);
    System.assertEquals(IBMWatsonCredentialUtils.AUTH_TYPE_BEARER_TOKEN, authenticator.authenticationType());
    System.assertEquals(token, authenticator.getBearerToken());
    Test.stopTest();
  }
}