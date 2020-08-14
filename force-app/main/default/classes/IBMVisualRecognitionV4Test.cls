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
private class IBMVisualRecognitionV4Test {
  private static String VERSION;
  private static String COLLECTION_ID;
  private static String IMAGE_URL;
  private static String TRAINING_DATA;
  private static String OBJECT_VAL;
  private static Long TOP;
  private static Long LEFT;
  private static Long WIDTH;
  private static Long HEIGHT;
  private static String IMAGE_ID;
  private static Double THRESHOLD;
  private static String NAME;
  private static String DESCRIPTION;
  private static Long IMAGE_COUNT;
  private static String CUSTOMER_ID;
  private static String IMAGE_TYPE;
  private static String FILENAME;
  private static String ARCHIVE_FILENAME;
  private static String SOURCE_URL;
  private static String RESOLVED_URL;
  private static Double SCORE;
  private static String CODE;
  private static String MESSAGE;
  private static String MORE_INFO;
  private static String ERROR_TYPE;
  private static String TRACE;
  private static String ANALYZE_OPTIONS_FEATURES;
  private static String GET_JPEG_IMAGE_SIZE;
  private static String HEADER_NAME;
  private static String HEADER_VALUE;

  private static IBMWatsonFile testFile;
  private static IBMVisualRecognitionV4Models.TrainingDataObject trainingDataObject;
  private static IBMVisualRecognitionV4Models.Location location;
  private static IBMVisualRecognitionV4Models.TrainingStatus trainingStatus;
  private static IBMVisualRecognitionV4Models.ObjectTrainingStatus objectTrainingStatus;
  private static Datetime testDate;

  private static IBMVisualRecognitionV4 service;

  static {
    VERSION = '2019-02-11';
    COLLECTION_ID = '123456789';
    IMAGE_URL = 'www.image.jpg';
    TRAINING_DATA = 'training_data';
    OBJECT_VAL = 'object';
    TOP = 0L;
    LEFT = 10L;
    WIDTH = 100L;
    HEIGHT = 200L;
    IMAGE_ID = 'image_id';
    THRESHOLD = 12.0;
    NAME = 'name';
    DESCRIPTION = 'description';
    IMAGE_COUNT = 50L;
    CUSTOMER_ID = 'customer_id';
    IMAGE_TYPE = 'file';
    FILENAME = 'filename';
    ARCHIVE_FILENAME = 'archive_filename';
    SOURCE_URL = 'source_url';
    RESOLVED_URL = 'resolved_url';
    SCORE = 5.0;
    CODE = 'code';
    MESSAGE = 'message';
    MORE_INFO = 'more_info';
    ERROR_TYPE = 'field';
    TRACE = 'trace';
    ANALYZE_OPTIONS_FEATURES = 'objects';
    GET_JPEG_IMAGE_SIZE = 'full';
    HEADER_NAME = 'Header-Name';
    HEADER_VALUE = 'header_value';

    // create test models
    testFile = new IBMWatsonFile.FileBuilder()
        .name('image.jpg')
        .description('Test JPEG image file')
        .contentType('image/jpeg')
        .body(blob.valueOf('Test string that is not an image'))
        .build();
    location = new IBMVisualRecognitionV4Models.LocationBuilder()
        .top(TOP)
        .left(LEFT)
        .height(HEIGHT)
        .width(WIDTH)
        .build();
    trainingDataObject = new IBMVisualRecognitionV4Models.TrainingDataObjectBuilder().build();
    objectTrainingStatus = new IBMVisualRecognitionV4Models.ObjectTrainingStatusBuilder()
        .ready(true)
        .inProgress(true)
        .dataChanged(true)
        .latestFailed(true)
        .description(DESCRIPTION)
        .build();
    trainingStatus = new IBMVisualRecognitionV4Models.TrainingStatusBuilder()
        .objects(objectTrainingStatus)
        .build();
    testDate = (Datetime) JSON.deserialize('"1995-06-12T01:11:11.111Z"', Datetime.class);

    service = new IBMVisualRecognitionV4(VERSION, new IBMWatsonNoAuthAuthenticator());
  }

  static testMethod void testAddImagesOptions() {
    Test.startTest();
    List<IBMWatsonFile> imageList = new List<IBMWatsonFile> { testFile };
    List<String> imageUrlList = new List<String> { IMAGE_URL };

    IBMVisualRecognitionV4Models.AddImagesOptions options = new IBMVisualRecognitionV4Models.AddImagesOptionsBuilder()
        .imagesFile(imageList)
        .addImagesFile(testFile)
        .imageUrl(imageUrlList)
        .addImageUrl(IMAGE_URL)
        .collectionId(COLLECTION_ID)
        .trainingData(TRAINING_DATA)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(2, options.imagesFile().size());
    System.assertEquals(testFile, options.imagesFile().get(0));
    System.assertEquals(2, options.imageUrl().size());
    System.assertEquals(IMAGE_URL, options.imageUrl().get(0));
    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(TRAINING_DATA, options.trainingData());
    Test.stopTest();
  }

  static testMethod void testAddImageTrainingDataOptions() {
    Test.startTest();
    List<IBMVisualRecognitionV4Models.TrainingDataObject> objectList = new List<IBMVisualRecognitionV4Models.TrainingDataObject> { trainingDataObject };

    IBMVisualRecognitionV4Models.AddImageTrainingDataOptions options = new IBMVisualRecognitionV4Models.AddImageTrainingDataOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .imageId(IMAGE_ID)
        .objects(objectList)
        .addObjects(trainingDataObject)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(IMAGE_ID, options.imageId());
    System.assertEquals(2, options.objects().size());
    System.assertEquals(trainingDataObject, options.objects().get(0));
    Test.stopTest();
  }

  static testMethod void testAnalyzeOptions() {
    Test.startTest();
    List<String> collectionIdList = new List<String> { COLLECTION_ID };
    List<String> featureList = new List<String> { ANALYZE_OPTIONS_FEATURES };
    List<IBMWatsonFile> imageList = new List<IBMWatsonFile> { testFile };
    List<String> imageUrlList = new List<String> { IMAGE_URL };

    IBMVisualRecognitionV4Models.AnalyzeOptions options = new IBMVisualRecognitionV4Models.AnalyzeOptionsBuilder()
        .collectionIds(collectionIdList)
        .addCollectionIds(COLLECTION_ID)
        .features(featureList)
        .addFeatures(ANALYZE_OPTIONS_FEATURES)
        .imagesFile(imageList)
        .addImagesFile(testFile)
        .imageUrl(imageUrlList)
        .addImageUrl(IMAGE_URL)
        .threshold(THRESHOLD)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(2, options.collectionIds().size());
    System.assertEquals(COLLECTION_ID, options.collectionIds().get(0));
    System.assertEquals(2, options.features().size());
    System.assertEquals(ANALYZE_OPTIONS_FEATURES, options.features().get(0));
    System.assertEquals(2, options.imagesFile().size());
    System.assertEquals(testFile, options.imagesFile().get(0));
    System.assertEquals(2, options.imageUrl().size());
    System.assertEquals(IMAGE_URL, options.imageUrl().get(0));
    System.assertEquals(THRESHOLD, options.threshold());
    Test.stopTest();
  }

  static testMethod void testCreateCollectionOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.CreateCollectionOptions options = new IBMVisualRecognitionV4Models.CreateCollectionOptionsBuilder()
        .name(NAME)
        .description(DESCRIPTION)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(NAME, options.name());
    System.assertEquals(DESCRIPTION, options.description());
    Test.stopTest();
  }

  static testMethod void testDeleteCollectionOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.DeleteCollectionOptions options = new IBMVisualRecognitionV4Models.DeleteCollectionOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    Test.stopTest();
  }

  static testMethod void testDeleteImageOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.DeleteImageOptions options = new IBMVisualRecognitionV4Models.DeleteImageOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .imageId(IMAGE_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(IMAGE_ID, options.imageId());
    Test.stopTest();
  }

  static testMethod void testDeleteUserDataOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.DeleteUserDataOptions options = new IBMVisualRecognitionV4Models.DeleteUserDataOptionsBuilder()
        .customerId(CUSTOMER_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(CUSTOMER_ID, options.customerId());
    Test.stopTest();
  }

  static testMethod void testGetCollectionOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.GetCollectionOptions options = new IBMVisualRecognitionV4Models.GetCollectionOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    Test.stopTest();
  }

  static testMethod void testGetImageDetailsOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.GetImageDetailsOptions options = new IBMVisualRecognitionV4Models.GetImageDetailsOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .imageId(IMAGE_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(IMAGE_ID, options.imageId());
    Test.stopTest();
  }

  static testMethod void testGetJpegImageOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.GetJpegImageOptions options = new IBMVisualRecognitionV4Models.GetJpegImageOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .imageId(IMAGE_ID)
        .size(GET_JPEG_IMAGE_SIZE)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(IMAGE_ID, options.imageId());
    System.assertEquals(GET_JPEG_IMAGE_SIZE, options.size());
    Test.stopTest();
  }

  static testMethod void testListCollectionsOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.ListCollectionsOptions options = new IBMVisualRecognitionV4Models.ListCollectionsOptionsBuilder()
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assert(options != null);
    Test.stopTest();
  }

  static testMethod void testListImagesOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.ListImagesOptions options = new IBMVisualRecognitionV4Models.ListImagesOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    Test.stopTest();
  }

  static testMethod void testLocation() {
    Test.startTest();
    IBMVisualRecognitionV4Models.Location location = new IBMVisualRecognitionV4Models.LocationBuilder()
        .top(TOP)
        .left(LEFT)
        .width(WIDTH)
        .height(HEIGHT)
        .build();
    location = location.newBuilder().build();

    System.assertEquals(TOP, location.getTop());
    System.assertEquals(LEFT, location.getLeft());
    System.assertEquals(WIDTH, location.getWidth());
    System.assertEquals(HEIGHT, location.getHeight());
    Test.stopTest();
  }

  static testMethod void testObjectTrainingStatus() {
    Test.startTest();
    IBMVisualRecognitionV4Models.ObjectTrainingStatus trainingStatus = new IBMVisualRecognitionV4Models.ObjectTrainingStatusBuilder()
        .ready(true)
        .inProgress(true)
        .dataChanged(true)
        .latestFailed(true)
        .description(DESCRIPTION)
        .build();
    trainingStatus = trainingStatus.newBuilder().build();

    System.assert(trainingStatus.getReady());
    System.assert(trainingStatus.getInProgress());
    System.assert(trainingStatus.getDataChanged());
    System.assert(trainingStatus.getLatestFailed());
    System.assertEquals(DESCRIPTION, trainingStatus.getDescription());
    Test.stopTest();
  }

  static testMethod void testTrainingStatus() {
    Test.startTest();
    IBMVisualRecognitionV4Models.TrainingStatus trainingStatus = new IBMVisualRecognitionV4Models.TrainingStatusBuilder()
        .objects(objectTrainingStatus)
        .build();
    trainingStatus = trainingStatus.newBuilder().build();

    System.assertEquals(objectTrainingStatus, trainingStatus.getObjects());
    Test.stopTest();
  }

  static testMethod void testTrainOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.TrainOptions options = new IBMVisualRecognitionV4Models.TrainOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    Test.stopTest();
  }

  static testMethod void testUpdateCollectionOptions() {
    Test.startTest();
    IBMVisualRecognitionV4Models.UpdateCollectionOptions options = new IBMVisualRecognitionV4Models.UpdateCollectionOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .name(NAME)
        .description(DESCRIPTION)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    options = options.newBuilder().build();

    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(NAME, options.name());
    System.assertEquals(DESCRIPTION, options.description());
    Test.stopTest();
  }

  static testMethod void testAnalyze() {
    String body = IBMWatsonMockResponses.analyzeResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.AnalyzeOptions options = new IBMVisualRecognitionV4Models.AnalyzeOptionsBuilder()
        .addCollectionIds(COLLECTION_ID)
        .addFeatures(ANALYZE_OPTIONS_FEATURES)
        .addImagesFile(testFile)
        .addImageUrl(IMAGE_URL)
        .threshold(THRESHOLD)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.AnalyzeResponse response = service.analyze(options);

    System.assertEquals(IMAGE_TYPE, response.getImages().get(0).getSource().getXType());
    System.assertEquals(FILENAME, response.getImages().get(0).getSource().getFilename());
    System.assertEquals(ARCHIVE_FILENAME, response.getImages().get(0).getSource().getArchiveFilename());
    System.assertEquals(SOURCE_URL, response.getImages().get(0).getSource().getSourceUrl());
    System.assertEquals(RESOLVED_URL, response.getImages().get(0).getSource().getResolvedUrl());
    System.assertEquals(HEIGHT, response.getImages().get(0).getDimensions().getHeight());
    System.assertEquals(WIDTH, response.getImages().get(0).getDimensions().getWidth());
    System.assertEquals(COLLECTION_ID, response.getImages().get(0).getObjects().getCollections().get(0).getCollectionId());
    System.assertEquals(OBJECT_VAL,
        response.getImages().get(0).getObjects().getCollections().get(0).getObjects().get(0).getXObject());
    System.assertEquals(TOP,
        response.getImages().get(0).getObjects().getCollections().get(0).getObjects().get(0).getLocation().getTop());
    System.assertEquals(LEFT,
        response.getImages().get(0).getObjects().getCollections().get(0).getObjects().get(0).getLocation().getLeft());
    System.assertEquals(WIDTH,
        response.getImages().get(0).getObjects().getCollections().get(0).getObjects().get(0).getLocation().getWidth());
    System.assertEquals(HEIGHT,
        response.getImages().get(0).getObjects().getCollections().get(0).getObjects().get(0).getLocation().getHeight());
    System.assertEquals(SCORE,
        response.getImages().get(0).getObjects().getCollections().get(0).getObjects().get(0).getScore());
    System.assertEquals(CODE, response.getImages().get(0).getErrors().get(0).getCode());
    System.assertEquals(MESSAGE, response.getImages().get(0).getErrors().get(0).getMessage());
    System.assertEquals(MORE_INFO, response.getImages().get(0).getErrors().get(0).getMoreInfo());
    System.assertEquals(ERROR_TYPE, response.getImages().get(0).getErrors().get(0).getTarget().getXType());
    System.assertEquals(NAME, response.getImages().get(0).getErrors().get(0).getTarget().getName());
    System.assertEquals(CODE, response.getWarnings().get(0).getCode());
    System.assertEquals(MESSAGE, response.getWarnings().get(0).getMessage());
    System.assertEquals(MORE_INFO, response.getWarnings().get(0).getMoreInfo());
    System.assertEquals(TRACE, response.getTrace());
    Test.stopTest();
  }

  private static void assertCollection(IBMVisualRecognitionV4Models.Collection response) {
    System.assertEquals(COLLECTION_ID, response.getCollectionId());
    System.assertEquals(NAME, response.getName());
    System.assertEquals(DESCRIPTION, response.getDescription());
    System.assertEquals(testDate, response.getCreated());
    System.assertEquals(testDate, response.getUpdated());
    System.assertEquals(IMAGE_COUNT, response.getImageCount());
    System.assert(response.getTrainingStatus().getObjects().getReady());
    System.assert(response.getTrainingStatus().getObjects().getInProgress());
    System.assert(response.getTrainingStatus().getObjects().getDataChanged());
    System.assert(response.getTrainingStatus().getObjects().getLatestFailed());
    System.assertEquals(DESCRIPTION, response.getTrainingStatus().getObjects().getDescription());
  }

  static testMethod void testCreateCollection() {
    String body = IBMWatsonMockResponses.visRecCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.CreateCollectionOptions options = new IBMVisualRecognitionV4Models.CreateCollectionOptionsBuilder()
        .name(NAME)
        .description(DESCRIPTION)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.Collection response = service.createCollection(options);

    assertCollection(response);
    Test.stopTest();
  }

  private static void assertCollectionsList(IBMVisualRecognitionV4Models.CollectionsList response) {
    System.assertEquals(COLLECTION_ID, response.getCollections().get(0).getCollectionId());
    System.assertEquals(NAME, response.getCollections().get(0).getName());
    System.assertEquals(DESCRIPTION, response.getCollections().get(0).getDescription());
    System.assertEquals(testDate, response.getCollections().get(0).getCreated());
    System.assertEquals(testDate, response.getCollections().get(0).getUpdated());
    System.assertEquals(IMAGE_COUNT, response.getCollections().get(0).getImageCount());
    System.assert(response.getCollections().get(0).getTrainingStatus().getObjects().getReady());
    System.assert(response.getCollections().get(0).getTrainingStatus().getObjects().getInProgress());
    System.assert(response.getCollections().get(0).getTrainingStatus().getObjects().getDataChanged());
    System.assert(response.getCollections().get(0).getTrainingStatus().getObjects().getLatestFailed());
    System.assertEquals(DESCRIPTION, response.getCollections().get(0).getTrainingStatus().getObjects().getDescription());
  }

  static testMethod void testListCollections() {
    String body = IBMWatsonMockResponses.collectionsList();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.ListCollectionsOptions options = new IBMVisualRecognitionV4Models.ListCollectionsOptionsBuilder()
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.CollectionsList response = service.listCollections(options);

    assertCollectionsList(response);
    Test.stopTest();
  }

  static testMethod void testGetCollection() {
    String body = IBMWatsonMockResponses.visRecCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.GetCollectionOptions options = new IBMVisualRecognitionV4Models.GetCollectionOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.Collection response = service.getCollection(options);

    assertCollection(response);
    Test.stopTest();
  }

  static testMethod void testUpdateCollection() {
    String body = IBMWatsonMockResponses.visRecCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.UpdateCollectionOptions options = new IBMVisualRecognitionV4Models.UpdateCollectionOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .name(NAME)
        .description(DESCRIPTION)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.Collection response = service.updateCollection(options);

    assertCollection(response);
    Test.stopTest();
  }

  static testMethod void testDeleteCollection() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.DeleteCollectionOptions options = new IBMVisualRecognitionV4Models.DeleteCollectionOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    service.deleteCollection(options);

    Test.stopTest();
  }

  private static void assertImageDetails(IBMVisualRecognitionV4Models.ImageDetails response) {
    System.assertEquals(IMAGE_ID, response.getImageId());
    System.assertEquals(testDate, response.getCreated());
    System.assertEquals(testDate, response.getUpdated());
    System.assertEquals(IMAGE_TYPE, response.getSource().getXType());
    System.assertEquals(FILENAME, response.getSource().getFilename());
    System.assertEquals(ARCHIVE_FILENAME, response.getSource().getArchiveFilename());
    System.assertEquals(SOURCE_URL, response.getSource().getSourceUrl());
    System.assertEquals(RESOLVED_URL, response.getSource().getResolvedUrl());
    System.assertEquals(HEIGHT, response.getDimensions().getHeight());
    System.assertEquals(WIDTH, response.getDimensions().getWidth());
    System.assertEquals(CODE, response.getErrors().get(0).getCode());
    System.assertEquals(MESSAGE, response.getErrors().get(0).getMessage());
    System.assertEquals(MORE_INFO, response.getErrors().get(0).getMoreInfo());
    System.assertEquals(ERROR_TYPE, response.getErrors().get(0).getTarget().getXType());
    System.assertEquals(NAME, response.getErrors().get(0).getTarget().getName());
    System.assertEquals(OBJECT_VAL, response.getTrainingData().getObjects().get(0).getXObject());
    System.assertEquals(TOP, response.getTrainingData().getObjects().get(0).getLocation().getTop());
    System.assertEquals(LEFT, response.getTrainingData().getObjects().get(0).getLocation().getLeft());
    System.assertEquals(WIDTH, response.getTrainingData().getObjects().get(0).getLocation().getWidth());
    System.assertEquals(HEIGHT, response.getTrainingData().getObjects().get(0).getLocation().getHeight());
  }

  static testMethod void testAddImages() {
    String body = IBMWatsonMockResponses.imageDetailsList();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.AddImagesOptions options = new IBMVisualRecognitionV4Models.AddImagesOptionsBuilder()
        .addImagesFile(testFile)
        .addImageUrl(IMAGE_URL)
        .collectionId(COLLECTION_ID)
        .trainingData(TRAINING_DATA)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.ImageDetailsList response = service.addImages(options);

    assertImageDetails(response.getImages().get(0));
    System.assertEquals(CODE, response.getWarnings().get(0).getCode());
    System.assertEquals(MESSAGE, response.getWarnings().get(0).getMessage());
    System.assertEquals(MORE_INFO, response.getWarnings().get(0).getMoreInfo());
    System.assertEquals(TRACE, response.getTrace());
    Test.stopTest();
  }

  static testMethod void testListImages() {
    String body = IBMWatsonMockResponses.imageSummaryList();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.ListImagesOptions options = new IBMVisualRecognitionV4Models.ListImagesOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.ImageSummaryList response = service.listImages(options);

    System.assertEquals(IMAGE_ID, response.getImages().get(0).getImageId());
    System.assertEquals(testDate, response.getImages().get(0).getUpdated());
    Test.stopTest();
  }

  static testMethod void testGetImageDetails() {
    String body = IBMWatsonMockResponses.imageDetails();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.GetImageDetailsOptions options = new IBMVisualRecognitionV4Models.GetImageDetailsOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .imageId(IMAGE_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.ImageDetails response = service.getImageDetails(options);

    assertImageDetails(response);
    Test.stopTest();
  }

  static testMethod void testDeleteImage() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.DeleteImageOptions options = new IBMVisualRecognitionV4Models.DeleteImageOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .imageId(IMAGE_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    service.deleteImage(options);

    Test.stopTest();
  }

  static testMethod void testTrain() {
    String body = IBMWatsonMockResponses.visRecCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.TrainOptions options = new IBMVisualRecognitionV4Models.TrainOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.Collection response = service.train(options);

    assertCollection(response);
    Test.stopTest();
  }

  static testMethod void testAddImageTrainingData() {
    String body = IBMWatsonMockResponses.trainingDataObjects();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMVisualRecognitionV4Models.AddImageTrainingDataOptions options = new IBMVisualRecognitionV4Models.AddImageTrainingDataOptionsBuilder()
        .collectionId(COLLECTION_ID)
        .imageId(IMAGE_ID)
        .addObjects(trainingDataObject)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    IBMVisualRecognitionV4Models.TrainingDataObjects response = service.addImageTrainingData(options);

    System.assertEquals(OBJECT_VAL, response.getObjects().get(0).getXObject());
    System.assertEquals(TOP, response.getObjects().get(0).getLocation().getTop());
    System.assertEquals(LEFT, response.getObjects().get(0).getLocation().getLeft());
    System.assertEquals(WIDTH, response.getObjects().get(0).getLocation().getWidth());
    System.assertEquals(HEIGHT, response.getObjects().get(0).getLocation().getHeight());
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

    IBMVisualRecognitionV4Models.DeleteUserDataOptions options = new IBMVisualRecognitionV4Models.DeleteUserDataOptionsBuilder()
        .customerId(CUSTOMER_ID)
        .addHeader(HEADER_NAME, HEADER_VALUE)
        .build();
    service.deleteUserData(options);

    Test.stopTest();
  }
}