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
private class IBMVisualRecognitionV3Test {
  private static String VERSION;
  private static String HEADER_KEY;
  private static String HEADER_VAL;

  private static String CLASS_VAL;
  private static Double SCORE;
  private static String TYPE_HEIRARCHY;

  private static IBMVisualRecognitionV3 service;

  static {
    VERSION = '2018-03-19';
    HEADER_KEY = 'Header-Key';
    HEADER_VAL = 'header_val';
    CLASS_VAL = 'class';
    SCORE = 10.0;
    TYPE_HEIRARCHY = 'type_heirarchy';

    service = new IBMVisualRecognitionV3(VERSION, new IBMWatsonNoAuthAuthenticator());
  }

  static testMethod void testModelClass() {
    Test.startTest();
    IBMVisualRecognitionV3Models.ModelClass modelClass = new IBMVisualRecognitionV3Models.ModelClass();
    modelClass.setXClass(CLASS_VAL);

    System.assertEquals(CLASS_VAL, modelClass.getXClass());
    Test.stopTest();
  }

  static testMethod void testClassResult() {
    Test.startTest();
    IBMVisualRecognitionV3Models.ClassResult classResult = new IBMVisualRecognitionV3Models.ClassResult();
    classResult.setXClass(CLASS_VAL);
    classResult.setScore(SCORE);
    classResult.setTypeHierarchy(TYPE_HEIRARCHY);

    System.assertEquals(CLASS_VAL, classResult.getXClass());
    System.assertEquals(SCORE, classResult.getScore());
    System.assertEquals(TYPE_HEIRARCHY, classResult.getTypeHierarchy());
    Test.stopTest();
  }

  static testMethod void testClassify() {
    String body = IBMWatsonMockResponses.classifiedImages();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMVisualRecognitionV3Models.ClassifyOptions options = new IBMVisualRecognitionV3Models.ClassifyOptionsBuilder()
      .url('http://www.indya101.com/gallery/Actors_TV/Sumeet_Sachdev/2011/12/27/Sumeet_Sachdevjpg_3_arnem.jpg')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMVisualRecognitionV3Models.ClassifiedImages resp = service.classify(options);
    System.assertEquals(resp.getImagesProcessed(),0);
    System.assertEquals(resp.getImages()[0].getSourceUrl(), 'string');
    System.assertEquals(resp.getImages()[0].getResolvedUrl(), 'string');
    System.assertEquals(resp.getImages()[0].getImage(), 'string');
    System.assertEquals(resp.getImages()[0].getError().getErrorId(), 'string');
    System.assertEquals(resp.getImages()[0].getError().getDescription(), 'string');
    System.assertEquals(resp.getImages()[0].getClassifiers()[0].getName(), 'string');
    System.assertEquals(resp.getImages()[0].getClassifiers()[0].getClassifierId(), 'string');
    System.assertEquals(resp.getImages()[0].getClassifiers()[0].getClasses()[0].getXClass(), 'string');
    System.assertEquals(resp.getImages()[0].getClassifiers()[0].getClasses()[0].getScore(),0);
    System.assertEquals(resp.getImages()[0].getClassifiers()[0].getClasses()[0].getTypeHierarchy(), 'string');
    System.assertEquals(resp.getWarnings()[0].getWarningId(), 'string');
    System.assertEquals(resp.getWarnings()[0].getDescription(), 'string');
    Test.stopTest();
  }
  /**
   *  Test Analyze text, HTML, or a public webpage.
   *
   */
  static testMethod void testClassifyFile() {
    String body = IBMWatsonMockResponses.classifiedImages();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    Attachment att = new Attachment(Body=Blob.valueOf('test string'),
      Name='test.txt',
      Description='test description',
      ContentType='text/plain');
    IBMWatsonFile testfile=new IBMWatsonFile.FileBuilder()
      .attachment(att)
      .build();
    IBMVisualRecognitionV3Models.ClassifyOptions options = new IBMVisualRecognitionV3Models.ClassifyOptionsBuilder()
      .acceptLanguage('en')
      .imagesFile(testfile)
      .imagesFilename(att.Name)
      .imagesFileContentType(att.ContentType)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMVisualRecognitionV3Models.ClassifiedImages resp = service.classify(options);
     System.assertEquals(resp.getImagesProcessed(),0);
    System.assertEquals(resp.getImages()[0].getSourceUrl(), 'string');
    System.assertEquals(resp.getImages()[0].getResolvedUrl(), 'string');
    Test.stopTest();
  }
  /**
   *  Test Create a classifier.
   *
   */
  static testMethod void testCreateClassifier() {
    String body = IBMWatsonMockResponses.classifier();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    Attachment att = new Attachment(Body=Blob.valueOf('test string'),
      Name='test.txt',
      Description='test description',
      ContentType='text/plain');
    IBMWatsonFile testfile = new IBMWatsonFile.FileBuilder()
      .body(att.Body)
      .name(att.Name)
      .description(att.Description)
      .contentType(att.ContentType)
      .build();
    Map<String, IBMWatsonFile> positiveExamples = new Map<String,IBMWatsonFile>();
    positiveExamples.put('test', testfile);
    Map<String, String> positiveExampleFilenames = new Map<String, String>();
    positiveExampleFilenames.put('test', 'test_file');
    IBMVisualRecognitionV3Models.CreateClassifierOptions options = new IBMVisualRecognitionV3Models.CreateClassifierOptionsBuilder()
      .name('test')
      .positiveExamples(positiveExamples)
      .addPositiveExamples('other_test', testfile)
      .negativeExamples(testfile)
      .negativeExamplesFilename('test')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMVisualRecognitionV3Models.Classifier resp = service.createClassifier(options);
    System.assertEquals(resp.getClassifierId(), 'string');
    System.assertEquals(resp.getName(), 'string');
    System.assertEquals(resp.getOwner(), 'string');
    System.assertEquals(resp.getStatus(), 'ready');
    System.assertEquals(resp.getExplanation(), 'string');
    System.assertEquals(resp.getClasses()[0].getXClass(), 'string');
    Test.stopTest();
  }
  /**
   *  Test Get a classifier.
   *
   */
  static testMethod void testGetClassifier() {
    String body = IBMWatsonMockResponses.classifier();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    Attachment att = new Attachment(Body=Blob.valueOf('test string'),
      Name='test.txt',
      Description='test description',
      ContentType='text/plain');
    IBMWatsonFile testfile = new IBMWatsonFile.FileBuilder()
      .body(att.Body)
      .name(att.Name)
      .description(att.Description)
      .contentType(att.ContentType)
      .build();
    IBMVisualRecognitionV3Models.GetClassifierOptions options = new IBMVisualRecognitionV3Models.GetClassifierOptionsBuilder('classifierId')
      .classifierId('classifierId')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMVisualRecognitionV3Models.Classifier resp = service.getClassifier(options);
    System.assertEquals(resp.getClassifierId(), 'string');
    Test.stopTest();
  }
  /**
   *  Test Update a classifier.
   *
   */
  static testMethod void testUpdateClassifier() {
    String body = IBMWatsonMockResponses.classifier();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    Attachment att = new Attachment(Body=Blob.valueOf('test string'),
      Name='test.txt',
      Description='test description',
      ContentType='text/plain');
    IBMWatsonFile testfile = new IBMWatsonFile.FileBuilder()
      .body(att.Body)
      .name(att.Name)
      .description(att.Description)
      .contentType(att.ContentType)
      .build();
    Map<String, IBMWatsonFile> positiveExamples = new Map<String,IBMWatsonFile>();
    positiveExamples.put('test', testfile);
    Map<String, String> positiveExampleFilenames = new Map<String, String>();
    positiveExampleFilenames.put('test', 'test_file');
    IBMVisualRecognitionV3Models.UpdateClassifierOptions options = new IBMVisualRecognitionV3Models.UpdateClassifierOptionsBuilder()
      .classifierId('classifierId')
      .positiveExamples(positiveExamples)
      .addPositiveExamples('other_test', testfile)
      .negativeExamples(testfile)
      .negativeExamplesFilename('test')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMVisualRecognitionV3Models.Classifier resp = service.updateClassifier(options);
    System.assertEquals(resp.getClassifierId(), 'string');
    Test.stopTest();
  }
  /**
   *  Test Delete a classifier.
   *
   */
  static testMethod void testDeleteClassifier() {
    String body = IBMWatsonMockResponses.classifier();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    Attachment att = new Attachment(Body=Blob.valueOf('test string'),
      Name='test.txt',
      Description='test description',
      ContentType='text/plain');
    IBMWatsonFile testfile = new IBMWatsonFile.FileBuilder()
      .body(att.Body)
      .name(att.Name)
      .description(att.Description)
      .contentType(att.ContentType)
      .build();
    IBMVisualRecognitionV3Models.DeleteClassifierOptions options = new IBMVisualRecognitionV3Models.DeleteClassifierOptionsBuilder('classifierId')
      .classifierId('classifierId')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteClassifier(options);
    Test.stopTest();
  }
  /**
   *  Test List classifiers.
   *
   */
  static testMethod void testListClassifiers() {
    String body = IBMWatsonMockResponses.classifiers();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMVisualRecognitionV3Models.ListClassifiersOptions options = new IBMVisualRecognitionV3Models.ListClassifiersOptionsBuilder()
      .verbose(true)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMVisualRecognitionV3Models.Classifiers resp = service.listClassifiers(options);
    System.assertEquals(resp.getClassifiers()[0].getClassifierId(), 'string');
    Test.stopTest();
  }

  static testMethod void testDeleteUserData() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customerId = 'salesforce_sdk_test_id';
    IBMVisualRecognitionV3Models.DeleteUserDataOptions deleteOptions = new IBMVisualRecognitionV3Models.DeleteUserDataOptionsBuilder()
      .customerId(customerId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteUserData(deleteOptions);

    Test.stopTest();
  }
}