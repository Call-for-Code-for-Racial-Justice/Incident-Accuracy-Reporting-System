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
private class IBMWatsonIAMAuthenticatorTest {
  private static final String URL = 'https://test.url';
  private static final String APIKEY = '123456789';
  private static final String CLIENT_ID = 'client_id';
  private static final String CLIENT_SECRET = 'client_sEcReT';
  private static final String VALID_TOKEN = 'aaaa-1111';

  static testMethod void testMissingApikey() {
    Test.startTest();
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator((String) null);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyApikey() {
    Test.startTest();
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator('');
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testMissingClientId() {
    Test.startTest();
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(APIKEY, URL, null, CLIENT_SECRET, null);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyClientId() {
    Test.startTest();
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(APIKEY, URL, '', CLIENT_SECRET, null);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testMissingClientSecret() {
    Test.startTest();
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(APIKEY, URL, CLIENT_ID, null, null);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyClientSecret() {
    Test.startTest();
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(APIKEY, URL, CLIENT_ID, '', null);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testMissingApikeyMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(props);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyApikeyMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_APIKEY, '');
    try {
      IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(props);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testCorrectConfig() {
    Test.startTest();
    String firstHeaderKey = 'Test-Header-1';
    String firstHeaderValue = 'value1';
    String secondHeaderKey = 'Test-Header-2';
    String secondHeaderValue = 'value2';
    Map<String, String> testHeaders = new Map<String, String>();
    testHeaders.put(firstHeaderKey, firstHeaderValue);
    testHeaders.put(secondHeaderKey, secondHeaderValue);
    IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(APIKEY, URL, CLIENT_ID, CLIENT_SECRET, testHeaders);

    System.assertEquals(IBMWatsonCredentialUtils.AUTH_TYPE_IAM, authenticator.authenticationType());
    System.assertEquals(APIKEY, authenticator.getApiKey());
    System.assertEquals(URL, authenticator.getURL());
    System.assertEquals(CLIENT_ID, authenticator.getClientId());
    System.assertEquals(CLIENT_SECRET, authenticator.getClientSecret());
    Map<String, String> actualHeaders = authenticator.getHeaders();
    System.assertEquals(firstHeaderValue, actualHeaders.get(firstHeaderKey));
    System.assertEquals(secondHeaderValue, actualHeaders.get(secondHeaderKey));
    Test.stopTest();
  }

  static testMethod void testCorrectConfigMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_APIKEY, APIKEY);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_URL, URL);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_CLIENT_ID, CLIENT_ID);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_CLIENT_SECRET, CLIENT_SECRET);
    IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(props);

    System.assertEquals(IBMWatsonCredentialUtils.AUTH_TYPE_IAM, authenticator.authenticationType());
    System.assertEquals(APIKEY, authenticator.getApiKey());
    System.assertEquals(URL, authenticator.getURL());
    System.assertEquals(CLIENT_ID, authenticator.getClientId());
    System.assertEquals(CLIENT_SECRET, authenticator.getClientSecret());
    System.assert(authenticator.getHeaders() == null);
    Test.stopTest();
  }

  static testMethod void testCorrectConfigMapApikey() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_APIKEY, APIKEY);
    IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(props);

    System.assertEquals(IBMWatsonCredentialUtils.AUTH_TYPE_IAM, authenticator.authenticationType());
    System.assertEquals(APIKEY, authenticator.getApiKey());
    Test.stopTest();
  }

  static testMethod void testAuthenticateNewAndStoredToken() {
    String body = IBMWatsonMockResponses.validTokenData();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(APIKEY);

    IBMWatsonRequest.Builder builder = new IBMWatsonRequest.Builder().url(URL);
    authenticator.authenticate(builder);
    IBMWatsonRequest request = builder.build();

    String authHeader = request.header(IBMWatsonHttpHeaders.AUTHORIZATION);
    System.assert(authHeader != null);
    System.assertEquals('Bearer ' + VALID_TOKEN, authHeader);

    // authenticating again should reuse the token, since it's still valid
    authenticator.authenticate(builder);
    request = builder.build();
    authHeader = request.header(IBMWatsonHttpHeaders.AUTHORIZATION);
    System.assertEquals('Bearer ' + VALID_TOKEN, authHeader);
    Test.stopTest();
  }

  /**
   * Tests that if the stored access token is expired, it can be refreshed properly.
   */
  static testMethod void getTokenAfterRefresh() {
    String body = IBMWatsonMockResponses.expiredTokenData();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    // force authenticator to store the token
    IBMWatsonIAMAuthenticator authenticator = new IBMWatsonIAMAuthenticator(APIKEY);
    IBMWatsonRequest.Builder builder = new IBMWatsonRequest.Builder().url(URL);
    authenticator.authenticate(builder);

    // authenticator should detect the expiration and request a new token when we try to authenticate again
    String newBody = IBMWatsonMockResponses.validTokenData();
    IBMWatsonMockHttpResponse newMockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      newBody,
      null);
    Test.setMock(HttpCalloutMock.class, newMockResponse);
    authenticator.authenticate(builder);

    IBMWatsonRequest request = builder.build();
    String authHeader = request.header(IBMWatsonHttpHeaders.AUTHORIZATION);
    System.assertEquals('Bearer ' + VALID_TOKEN, authHeader);
    Test.stopTest();
  }
}