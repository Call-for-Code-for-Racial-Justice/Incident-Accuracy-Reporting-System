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

@isTest
private class IBMWatsonServiceTest {

  /**
   * Simple service to use for testing purposes.
   */
  class TestService extends IBMWatsonService {
    public TestService() {
      super('service', 'v1', new IBMWatsonNoAuthAuthenticator());
    }

    public TestClass testingMethod() {
      IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet('https://www.test.com');
      builder.query('test_query', 'test_val');
      return (TestClass) createServiceCall(builder.build(), TestClass.class);
    }

    public IBMWatsonFile testingMethodFile() {
      IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet('https://www.test.com');
      return (IBMWatsonFile) createServiceCall(builder.build(), IBMWatsonFile.class);
    }
  }

  /**
   * Simple response model to use for testing purposes.
   */
  class TestClass extends IBMWatsonResponseModel {
    public String test_key;

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }
      TestClass ret = (TestClass) super.deserialize(jsonString, jsonMap, classType);
      return ret;
    }
  }

  /**
    *  Test available Request methods that are not used in example but available for developers.
    *
    */
  static testMethod void testIBMWatsonRequest() {
    Test.startTest();
    Map<String, String> headers = new Map<String, String>{'test' => 'testvalue'};
    IBMWatsonRequest.Builder builder = new IBMWatsonRequest.Builder();
    builder.addHeader('test', 'testvalue');
    Test.stopTest();
  }

  /**
   *  Test bad request exception scenario.
   *
   */
  static testMethod void testBadRequestException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(400, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.BadRequestException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.BAD_REQUEST);
    }
    Test.stopTest();
  }

  /**
   *  Test conflict exception scenario.
   *
   */
  static testMethod void testConflictException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(409, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.ConflictException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.CONFLICT);
    }
    Test.stopTest();
  }

  /**
   *  Test forbidden exception scenario.
   *
   */
  static testMethod void testForbiddenException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(403, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.ForbiddenException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.FORBIDDEN);
    }
    Test.stopTest();
  }

  /**
   *  Test forbidden exception scenario 406.
   *
   */
  static testMethod void testNotAcceptableException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(406, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.ForbiddenException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.FORBIDDEN);
    }
    Test.stopTest();
  }

  /**
   *  Test internal server error exception scenario.
   *
   */
  static testMethod void testInternalServerErrorException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(500, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.InternalServerErrorException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.INTERNAL_SERVER_ERROR);
    }
    Test.stopTest();
  }

  /**
   *  Test not found exception scenario.
   *
   */
  static testMethod void testNotFoundException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(404, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.NotFoundException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.NOT_FOUND);
    }
    Test.stopTest();
  }

  /**
   *  Test request too large exception scenario.
   *
   */
  static testMethod void testRequestTooLargeException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(413, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.RequestTooLargeException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.REQUEST_TOO_LONG);
    }
    Test.stopTest();
  }

  /**
   *  Test response exception scenario.
   *
   */
  static testMethod void testResponseException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(519, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.ResponseException ex) {
      System.assertEquals(ex.getStatusCode(), 519);
    }
    Test.stopTest();
  }

  /**
   *  Test service unavailable exception scenario.
   *
   */
  static testMethod void testServiceUnavailableException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(503, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.ServiceUnavailableException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.SERVICE_UNAVAILABLE);
    }
    Test.stopTest();
  }

  /**
   *  Test too many requests exception scenario.
   *
   */
  static testMethod void testTooManyRequestsException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(429, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.TooManyRequestsException ex) {
      System.assertEquals(ex.getStatusCode(), 429);
    }
    Test.stopTest();
  }

  /**
   *  Test unauthorized exception scenario.
   *
   */
  static testMethod void testUnauthorizedException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(401, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.UnauthorizedException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.UNAUTHORIZED);
    }
    Test.stopTest();
  }
  /**
   *  Test unsupported exception scenario.
   *
   */
  static testMethod void testUnsupportedExceptionException() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(415, 'Error', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try {
      TestService testService = new TestService();
      TestClass testClass = testService.testingMethod();
    }
    catch(IBMWatsonServiceExceptions.UnsupportedException ex) {
      System.assertEquals(ex.getStatusCode(), IBMWatsonHttpStatus.UNSUPPORTED_MEDIA_TYPE);
    }
    Test.stopTest();
  }
  /**
   *  Test IBMWatsonValidator.
   *
   */
  static testMethod void testIBMWatsonValidator() {
    Test.startTest();
    try {
      Object obj = null;
      IBMWatsonValidator.notNull(obj, 'test message');
    }
    catch(Exception ex) {
      System.assertEquals(ex.getMessage(), 'test message');
    }
    try {
      IBMWatsonValidator.isNull('test', 'test message');
    }
    catch(Exception ex) {
      System.assertEquals(ex.getMessage(), 'test message');
    }
    try {
      List<String> strlist= new List<String>();
      IBMWatsonValidator.notEmpty(strlist, 'test message');
    }
    catch(Exception ex) {
      System.assertEquals(ex.getMessage(), 'test message');
    }
    Test.stopTest();
  }

  /**
   *  Test IBMWatsonResponse.
   *
   */
  static testMethod void testIBMWatsonResponse() {
    Test.startTest();
    HttpResponse resp = new HttpResponse();
    resp.setStatusCode(200);
    resp.setStatus('Success');
    resp.setBodyAsBlob(Blob.valueOf('test string'));
    resp.setHeader('key', 'value');
    resp.setHeader('Content-Type', 'text/plain');
    IBMWatsonResponse response= new IBMWatsonResponse('url', resp);
    System.assertEquals(response.getStatus(), 'Success');
    System.assertEquals(response.getHeaderKeys()[1], 'Content-Type');
    System.assertEquals(response.getBodyAsBlob(), Blob.valueOf('test string'));
    Test.stopTest();
  }

  /**
   *  Test IBMWatsonRequest.
   *
   */
  static testMethod void testIBMWatsonRequestBuild() {
    Test.startTest();
    IBMWatsonRequest request = new IBMWatsonRequest.builder()
      .url('https://watson-api-explorer.mybluemix.net')
      .method('POST', IBMWatsonRequestBody.create())
      .addHeader('key', 'value')
      .build();
    System.assertEquals(request.header('key'), 'value');
    System.assertEquals(request.getMethod(), 'POST');
    System.assertEquals(request.getHeadersByName('key').size(), 1);
    System.assert(request.toString().contains('POST'));

    Test.stopTest();
  }

  /**
   *  Test IBMWatsonMediaType.
   *
   */
  static testMethod void testIBMWatsonMediaType() {
    Test.startTest();
    IBMWatsonMediaType mediaType=IBMWatsonMediaType.Parse('text/plain');
    System.assertEquals(mediaType.toString(), 'text/plain');
    Object obj = null;
    System.assertEquals(IBMWatsonHttpMediaType.createAudioRaw(5), IBMWatsonHttpMediaType.AUDIO_RAW + '; rate=5');
    System.assertEquals(mediaType.equals(obj), false);
    System.assertEquals(mediaType.hashCode(), 817335912);

    Test.stopTest();
  }

   /**
   *  Test IBMWatsonMultipartBody.
   *
   */
  static testMethod void testIBMWatsonMultipartBody() {
    Test.startTest();
    IBMWatsonMultipartBody multipartBody = new IBMWatsonMultipartBody.Builder()
      .setType(IBMWatsonMultipartBody.FORM)
      .addPart(new Map<String, String>{'test' => 'test', 'Content-Disposition'=>'Content-Disposition'}, IBMWatsonRequestBody.create())
      .addFormDataPart('key', 'value')
      .build();
    System.assertEquals(multipartBody.parts().size(), 2);
    System.assert(multipartBody.getAllHeaders().get('Content-Type').contains('multipart/form-data; boundary'));
    Test.stopTest();
  }

  /**
   * Test getting response headers from response model.
   */
  static testMethod void testResponseHeaders() {
    Test.startTest();
    String body = '{"test_key":"test_value"}';
    Map<String, String> responseHeaders = new Map<String, String> { 'Test-Name' => 'test_val' };
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, responseHeaders);
    Test.setMock(HttpCalloutMock.class, mockResponse);

    TestService testService = new TestService();
    TestClass testClass = testService.testingMethod();

    System.assert(testClass.getHeaders() != null);
    System.assert(testClass.getHeaders().size() == 1);
    System.assert(testClass.getHeaders().get('Test-Name').equals('test_val'));
    Test.stopTest();
  }

  static testMethod void testDefaultHeaders() {
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', '', null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    String testUserAgent = 'Mozilla/5.0';
    TestService testService = new TestService();
    testService.setDefaultHeaders(new Map<String, String> { IBMWatsonHttpHeaders.USER_AGENT => testUserAgent });
    testService.testingMethod();
    Test.stopTest();
  }

  static testMethod void testFileResponse() {
    Map<String, String> responseHeaders = new Map<String, String> {
      IBMWatsonHttpHeaders.CONTENT_DISPOSITION => 'filename=testfile.txt',
      IBMWatsonHttpHeaders.CONTENT_TYPE => 'text/plain'
    };
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      'Catalonia is an autonomous community on the northeastern corner of Spain.',
      responseHeaders
    );
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    TestService testService = new TestService();
    IBMWatsonFile fileResponse = testService.testingMethodFile();
    System.assert(fileResponse != null);

    Test.stopTest();
  }
}