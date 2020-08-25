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
private class IBMWatsonCP4DAuthenticatorTest {
  private static final String USERNAME = '123456789';
  private static final String PASSWORD = 'password';
  private static final String URL = 'https://test.url';
  private static final String VALID_TOKEN = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6IkFkbWluIiwicGVybWlzc2lvbnMiOlsiYWRtaW5pc3RyYXRvciIsIm1hbmFnZV9jYXRhbG9nIiwiYWNjZXNzX2NhdGFsb2ciLCJtYW5hZ2VfcG9saWNpZXMiLCJhY2Nlc3NfcG9saWNpZXMiLCJ2aXJ0dWFsaXplX3RyYW5zZm9ybSIsImNhbl9wcm92aXNpb24iLCJkZXBsb3ltZW50X2FkbWluIl0sInN1YiI6ImFkbWluIiwiaXNzIjoiS05PWFNTTyIsImF1ZCI6IkRTWCIsInVpZCI6Ijk5OSIsImlhdCI6MTU1OTMyODk1NSwiZXhwIjo5OTk5OTk5OTk5OTk5OTk5OTl9.GE-ML3JWmI3oB0z5mjMG3jFtYVVA5bQCsOTOOj9ab7PcgJc1mA5hn1sONkO0JAFADhUoAgpG4KgQef5tjnCSrtl1tbnDuhaP1DH4QKMCZOkWrKyfQ2X8P1jhyJmV-KpE4wuTrGdMoMVj4wVRZwnxMRSK6LhV6pIzyOLLYR21zcW_2KcKWxCYfIC7tiM1d2PSM5nWa_5Vb068F8PtdiFUElEYHYKrvmwpV57_k2jpXoY6zw8PDcIiWQe3g20w6vCB6zWhxbcFWyjMg1tPOZHgTNNskPShHQBbtZFsSrc7rkNPzttKF70m7_JqrRYUZDNN8TmuR9uyitwxEFkr2L0WDQ';

  static testMethod void testMissingUrl() {
    Test.startTest();
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(null, USERNAME, PASSWORD);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyUrl() {
    Test.startTest();
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator('', USERNAME, PASSWORD);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testMissingUsername() {
    Test.startTest();
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(URL, null, PASSWORD);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyUsername() {
    Test.startTest();
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(URL, '', PASSWORD);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testMissingPassword() {
    Test.startTest();
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(URL, USERNAME, null);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyPassword() {
    Test.startTest();
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(URL, USERNAME, '');
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testMissingUsernameMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_URL, URL);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_PASSWORD, PASSWORD);
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(props);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testEmptyUsernameMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_URL, URL);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_USERNAME, '');
    props.put(IBMWatsonCredentialUtils.PROP_NAME_PASSWORD, PASSWORD);
    try {
      IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(props);
    } catch (IBMWatsonServiceExceptions.IllegalArgumentException e) {
      System.assert(e != null);
    }
    Test.stopTest();
  }

  static testMethod void testCorrectConfigMap() {
    Test.startTest();
    Map<String, String> props = new Map<String, String>();
    props.put(IBMWatsonCredentialUtils.PROP_NAME_URL, URL);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_USERNAME, USERNAME);
    props.put(IBMWatsonCredentialUtils.PROP_NAME_PASSWORD, PASSWORD);
    IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(props);

    System.assertEquals(IBMWatsonCredentialUtils.AUTH_TYPE_CP4D, authenticator.authenticationType());
    System.assertEquals(URL, authenticator.getUrl());
    System.assertEquals(USERNAME, authenticator.getUsername());
    System.assertEquals(PASSWORD, authenticator.getPassword());
    System.assert(authenticator.getHeaders() == null);
    Test.stopTest();
  }

  static testMethod void testSetHeaders() {
    Test.startTest();
    IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(URL, USERNAME, PASSWORD);

    String firstHeaderKey = 'Test-Header-1';
    String firstHeaderValue = 'value1';
    String secondHeaderKey = 'Test-Header-2';
    String secondHeaderValue = 'value2';
    Map<String, String> testHeaders = new Map<String, String>();
    testHeaders.put(firstHeaderKey, firstHeaderValue);
    testHeaders.put(secondHeaderKey, secondHeaderValue);
    authenticator.setHeaders(testHeaders);

    Map<String, String> actualHeaders = authenticator.getHeaders();
    System.assertEquals(firstHeaderValue, actualHeaders.get(firstHeaderKey));
    System.assertEquals(secondHeaderValue, actualHeaders.get(secondHeaderKey));
    Test.stopTest();
  }

  static testMethod void testAuthenticateNewAndStoredToken() {
    String body = IBMWatsonMockResponses.validICP4DToken();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(URL, USERNAME, PASSWORD);

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
    String body = IBMWatsonMockResponses.expiredICP4DToken();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    // force authenticator to store the token
    IBMWatsonCloudPakForDataAuthenticator authenticator = new IBMWatsonCloudPakForDataAuthenticator(URL, USERNAME, PASSWORD);
    IBMWatsonRequest.Builder builder = new IBMWatsonRequest.Builder().url(URL);
    authenticator.authenticate(builder);

    // authenticator should detect the expiration and request a new token when we try to authenticate again
    String newBody = IBMWatsonMockResponses.validICP4DToken();
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