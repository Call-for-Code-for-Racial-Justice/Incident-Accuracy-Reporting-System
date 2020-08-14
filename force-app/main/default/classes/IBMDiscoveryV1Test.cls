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
private class IBMDiscoveryV1Test {
  private static final String VERSION = '2019-04-30';
  private static final String ENVIRONMENT_ID = '5ae96bb9-80e5-43ea-916e-1f3412fbc283';
  private static final String CONFIGURATION_ID = 'configuration_id';

  private static String HEADER_KEY;
  private static String HEADER_VAL;
  private static String DESTINATION_FIELD;
  private static String SOURCE_FIELD;
  private static String ENRICHMENT_NAME;
  private static String TEXT;
  private static String TOKEN;
  private static String PART_OF_SPEECH;
  private static List<String> TOKENS;

  private static IBMDiscoveryV1 service;

  static {
    HEADER_KEY = 'Header-Key';
    HEADER_VAL = 'header_val';
    DESTINATION_FIELD = 'destination_field';
    SOURCE_FIELD = 'source_field';
    ENRICHMENT_NAME = 'enrichment_name';
    TEXT = 'text';
    TOKEN = 'token';
    PART_OF_SPEECH = 'noun';
    TOKENS = new List<String> { TOKEN };
    service = new IBMDiscoveryV1(VERSION, new IBMWatsonNoAuthAuthenticator());
  }

  static testMethod void testNluEnrichmentConcepts() {
    Test.startTest();
    Long lim = 5L;

    IBMDiscoveryV1Models.NluEnrichmentConcepts concepts = new IBMDiscoveryV1Models.NluEnrichmentConceptsBuilder()
      .xlimit(lim)
      .build();

    System.assertEquals(lim, concepts.getXlimit());
    Test.stopTest();
  }

  static testMethod void testRetrievalDetails() {
    Test.startTest();
    String retrievalStrategy = 'relevancy_training';

    IBMDiscoveryV1Models.RetrievalDetails retrievalDetails = new IBMDiscoveryV1Models.RetrievalDetails();
    retrievalDetails.setDocumentRetrievalStrategy(retrievalStrategy);

    System.assertEquals(retrievalStrategy, retrievalDetails.getDocumentRetrievalStrategy());
    Test.stopTest();
  }

  /**
   *  Test Successfully creating a new environment.
   *
   */
  static testMethod void testCreateEnvironment() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String text = 'test_environment';
    IBMDiscoveryV1Models.CreateEnvironmentOptions options = new IBMDiscoveryV1Models.CreateEnvironmentOptionsBuilder()
      .name(text)
      .description('test_environment description')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Environment resp =
      service.createEnvironment(options);
    System.assertEquals(resp.getName(), 'test_environment');
    System.assertEquals(resp.getIndexCapacity().getDocuments().getIndexed(), 0);
    System.assertEquals(resp.getIndexCapacity().getDocuments().getMaximumAllowed(), 1000000);
    System.assertEquals(resp.getIndexCapacity().getDiskUsage().getUsedBytes(), 0);
    System.assertEquals(resp.getIndexCapacity().getDiskUsage().getMaximumAllowedBytes(), 99345920);
    resp.setName('test');
    resp.setDescription('test');
    resp.setSize('XS');
    IBMDiscoveryV1Models.IndexCapacity indexCapacity = new IBMDiscoveryV1Models.IndexCapacity();
    IBMDiscoveryV1Models.EnvironmentDocuments environmentDocuments = new IBMDiscoveryV1Models.EnvironmentDocuments();
    indexCapacity.setDocuments(environmentDocuments);
    IBMDiscoveryV1Models.DiskUsage diskUsage = new IBMDiscoveryV1Models.DiskUsage();
    indexCapacity.setDiskUsage(diskUsage);
    resp.setIndexCapacity(indexCapacity);
    System.assertEquals(resp.getDescription(), 'test');
    System.assertEquals(resp.getSize(), 'XS');

    Test.stopTest();
  }


  /**
    *  Test error while creating a new environment with empty name.
    *
    */
  static testMethod void testCreateEnvironmentEmpty() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    try {
      String text = '';
      IBMDiscoveryV1Models.CreateEnvironmentOptions options = new IBMDiscoveryV1Models.CreateEnvironmentOptionsBuilder()
        .name(text)
        .description('test_environment description')
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
      options = options.newBuilder().build();
      IBMDiscoveryV1Models.Environment resp =
        service.createEnvironment(options);
    }
    catch(Exception exptn) {
      System.assertEquals(exptn.getMessage(), 'createEnvironmentOptions cannot be null');

    }
    Test.stopTest();
  }


  /**
   *  Test listing the environments.
   *
   */
  static testMethod void testListEnvironment() {
    String body = IBMWatsonMockResponses.listEnvironmentsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String text = 'test_environment';
    IBMDiscoveryV1Models.ListEnvironmentsOptions options = new IBMDiscoveryV1Models.ListEnvironmentsOptionsBuilder()
      .name(text)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.ListEnvironmentsResponse resp =
      service.listEnvironments(options);

    System.assertEquals(resp.getEnvironments().size(), 2);
    Test.stopTest();
  }


  /**
   *  Test deleting an environment.
   *
   * Use environment id as parameter to delete environment
   */
  static testMethod void testDeleteEnvironment() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String text = '5ae96bb9-80e5-43ea-916e-1f3412fbc283';
    IBMDiscoveryV1Models.DeleteEnvironmentOptions options = new IBMDiscoveryV1Models.DeleteEnvironmentOptionsBuilder()
      .environmentId(text)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteEnvironment(options);
    Test.stopTest();
  }

  /**
   *  Test deleting an environment error with empty environment id.
   */
  static testMethod void testDeleteEnvironmentEmpty() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    try {
      String text = '';
      IBMDiscoveryV1Models.DeleteEnvironmentOptions options = new IBMDiscoveryV1Models.DeleteEnvironmentOptionsBuilder()
        .environmentId(text)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
      options = options.newBuilder().build();
      service.deleteEnvironment(options);
    }
    catch(Exception exptn) {
      System.assertEquals(exptn.getMessage(), 'environmentId cannot be empty');

    }
    Test.stopTest();
  }

  /**
   *  Test get the environment.
   *
   */
  static testMethod void testGetEnvironment() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String text = '5ae96bb9-80e5-43ea-916e-1f3412fbc283';
    IBMDiscoveryV1Models.GetEnvironmentOptions options = new IBMDiscoveryV1Models.GetEnvironmentOptionsBuilder()
      .environmentId(text)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Environment resp =
      service.getEnvironment(options);

    System.assertEquals(resp.getName(), 'test_environment');
    Test.stopTest();
  }

  /**
   *  Test get the environment error.
   *
   */
  static testMethod void testGetEnvironmentEmpty() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String text = '5ae96bb9-80e5-43ea-916e-1f3412fbc283';
    try {
      IBMDiscoveryV1Models.GetEnvironmentOptions options = new IBMDiscoveryV1Models.GetEnvironmentOptionsBuilder()
        .environmentId(text)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
      options = options.newBuilder().build();
      IBMDiscoveryV1Models.Environment resp =
        service.getEnvironment(options);
    }
    catch(Exception exptn) {
      System.assertEquals(exptn.getMessage(), 'getEnvironmentOptions cannot be null');
    }
    Test.stopTest();
  }

   /**
   *  Test update the environment.
   *
   */
  static testMethod void testUpdateEnvironment() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.UpdateEnvironmentOptions options = new IBMDiscoveryV1Models.UpdateEnvironmentOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .name('test_environment')
      .description('test_environment description')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Environment resp =
      service.updateEnvironment(options);
    System.assertEquals(resp.getName(), 'test_environment');
    Test.stopTest();
  }
  /**
   *  Test update the environment error.
   *
   */
  static testMethod void testUpdateEnvironmentEmpty() {
    String body = IBMWatsonMockResponses.environment();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    try{
      IBMDiscoveryV1Models.UpdateEnvironmentOptions options = new IBMDiscoveryV1Models.UpdateEnvironmentOptionsBuilder()
        .environmentId(ENVIRONMENT_ID)
        .name('')
        .description('test_environment description')
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
      options = options.newBuilder().build();
      IBMDiscoveryV1Models.Environment resp =
        service.updateEnvironment(options);
    }
    catch(Exception exptn) {
      System.assertEquals(exptn.getMessage(), 'updateEnvironmentOptions cannot be null');
    }
    Test.stopTest();
  }

  /**
   *  Test list fields in a collection.
   *
   */
  static testMethod void testListCollectionsFields() {
    String body = IBMWatsonMockResponses.listCollectionFieldsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> collectionIds= new List<String> { 'Collection1', 'Collection2' };
    IBMDiscoveryV1Models.ListFieldsOptions options = new IBMDiscoveryV1Models.ListFieldsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionIds(collectionIds)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.ListCollectionFieldsResponse resp =
      service.listFields(options);
    System.assertEquals(resp.getFields().size(), 4);
    Test.stopTest();
  }

  /**
   *  Test create configuration
   *
   */
  static testMethod void testCreateConfiguration() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.XPathPatterns patterns = new IBMDiscoveryV1Models.XPathPatternsBuilder()
      .xpaths(new List<String>{ 'xpath' })
      .build();
    IBMDiscoveryV1Models.HtmlSettings html = new IBMDiscoveryV1Models.HtmlSettingsBuilder()
      .excludeContent(patterns)
      .excludeTagAttributes(new List<String>{ 'attribute' })
      .excludeTagsCompletely(new List<String>{ 'tag' })
      .excludeTagsKeepContent(new List<String>{ 'tag' })
      .keepContent(patterns)
      .keepTagAttributes(new List<String>{ 'tag' })
      .build();
    IBMDiscoveryV1Models.NormalizationOperation normalizationOperation = new IBMDiscoveryV1Models.NormalizationOperationBuilder()
      .destinationField('field')
      .operation('operation')
      .sourceField('field')
      .build();
    IBMDiscoveryV1Models.FontSetting fontSetting = new IBMDiscoveryV1Models.FontSettingBuilder()
      .bold(true)
      .italic(true)
      .level(10)
      .maxSize(10)
      .minSize(10)
      .name('name')
      .build();
    IBMDiscoveryV1Models.PdfHeadingDetection pdfHeadingDetection = new IBMDiscoveryV1Models.PdfHeadingDetectionBuilder()
      .fonts(new List<IBMDiscoveryV1Models.FontSetting>{ fontSetting })
      .build();
    IBMDiscoveryV1Models.PdfSettings pdfSettings = new IBMDiscoveryV1Models.PdfSettingsBuilder()
      .heading(pdfHeadingDetection)
      .build();
    IBMDiscoveryV1Models.SegmentSettings segment = new IBMDiscoveryV1Models.SegmentSettingsBuilder()
      .enabled(true)
      .selectorTags(new List<String>{ 'tag' })
      .annotatedFields(new List<String>{ 'field' })
      .build();
    IBMDiscoveryV1Models.WordStyle style = new IBMDiscoveryV1Models.WordStyleBuilder()
      .level(10)
      .names(new List<String>{ 'name' })
      .build();
    IBMDiscoveryV1Models.WordHeadingDetection wordHeading = new IBMDiscoveryV1Models.WordHeadingDetectionBuilder()
      .fonts(new List<IBMDiscoveryV1Models.FontSetting>{ fontSetting })
      .styles(new List<IBMDiscoveryV1Models.WordStyle>{ style })
      .build();
    IBMDiscoveryV1Models.WordSettings word = new IBMDiscoveryV1Models.WordSettingsBuilder()
      .heading(wordHeading)
      .build();
    IBMDiscoveryV1Models.Conversions conversions = new IBMDiscoveryV1Models.ConversionsBuilder()
      .html(html)
      .jsonNormalizations(new List<IBMDiscoveryV1Models.NormalizationOperation>{ normalizationOperation })
      .pdf(pdfSettings)
      .segment(segment)
      .word(word)
      .build();
    IBMDiscoveryV1Models.Enrichment enrichment = new IBMDiscoveryV1Models.EnrichmentBuilder()
      .description('test description')
      .destinationField(DESTINATION_FIELD)
      .sourceField(SOURCE_FIELD)
      .enrichment(ENRICHMENT_NAME)
      .build();
    IBMDiscoveryV1Models.CreateConfigurationOptions options = new IBMDiscoveryV1Models.CreateConfigurationOptionsBuilder(ENVIRONMENT_ID, 'test_environment')
      .environmentId(ENVIRONMENT_ID)
      .name('test_environment')
      .description('test_environment description')
      .addEnrichments(enrichment)
      .enrichments(new List<IBMDiscoveryV1Models.Enrichment> { enrichment })
      .addNormalizations(normalizationOperation)
      .normalizations(new List<IBMDiscoveryV1Models.NormalizationOperation>{normalizationOperation})
      .conversions(conversions)
      .addHeader('Test-Header', 'test_value')
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Configuration resp =
      service.createConfiguration(options);
    System.assertEquals(resp.getName(), 'IBM News');
    System.assertEquals(resp.getConfigurationId(), '448e3545-51ca-4530-a03b-6ff282ceac2e');
    System.assertEquals(resp.getCreated(),(Datetime)JSON.deserialize('"2015-08-24T18:42:25.324Z"',Datetime.class));
    System.assertEquals(resp.getUpdated(),(Datetime)JSON.deserialize('"2015-08-24T18:42:25.324Z"',Datetime.class));
    Test.stopTest();
  }

  /**
   *  Test create configuration validator error
   *
   */
  static testMethod void testCreateConfigurationEmpty() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    try {
      IBMDiscoveryV1Models.CreateConfigurationOptions options = new IBMDiscoveryV1Models.CreateConfigurationOptionsBuilder()
        .name('test_environment')
        .description('test_environment description')
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
      options = options.newBuilder().build();
      IBMDiscoveryV1Models.Configuration resp =
        service.createConfiguration(options);
    }
    catch(Exception exptn) {
      System.assertEquals(exptn.getMessage(), 'environmentId cannot be empty');
    }
    Test.stopTest();
  }

  /**
   *  Test delete configuration
   *
   */
  static testMethod void testDeleteConfiguration() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.DeleteConfigurationOptions options = new IBMDiscoveryV1Models.DeleteConfigurationOptionsBuilder(ENVIRONMENT_ID, CONFIGURATION_ID)
      .environmentId(ENVIRONMENT_ID)
      .configurationId(CONFIGURATION_ID)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteConfiguration(options);
    Test.stopTest();
  }

  /**
   *  Test get configuration
   *
   */
  static testMethod void testGetConfiguration() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.GetConfigurationOptions options = new IBMDiscoveryV1Models.GetConfigurationOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .configurationId(CONFIGURATION_ID)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Configuration resp =
      service.getConfiguration(options);
    System.assertEquals(resp.getName(), 'IBM News');
    Test.stopTest();
  }

  /**
   *  Test list configurations
   *
   */
  static testMethod void testListConfigurations() {
    String body = IBMWatsonMockResponses.listConfigurationsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.ListConfigurationsOptions options = new IBMDiscoveryV1Models.ListConfigurationsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.ListConfigurationsResponse resp =
      service.listConfigurations(options);
    System.assertEquals(resp.getConfigurations().size(), 1);
    Test.stopTest();
  }

  /**
   *  Test update configuration
   *
   */
  static testMethod void testUpdateConfiguration() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.UpdateConfigurationOptions options = new IBMDiscoveryV1Models.UpdateConfigurationOptionsBuilder(ENVIRONMENT_ID, CONFIGURATION_ID, 'test_environment')
      .name('test_environment')
      .description('test_environment description')
      .configurationId(CONFIGURATION_ID)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Configuration resp =
      service.updateConfiguration(options);
    System.assertEquals(resp.getName(), 'IBM News');
    Test.stopTest();
  }

  /**
   *  Test update configuration validator error
   *
   */
  static testMethod void testUpdateConfigurationEmpty() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    try {
      IBMDiscoveryV1Models.UpdateConfigurationOptions options = new IBMDiscoveryV1Models.UpdateConfigurationOptionsBuilder()
        .environmentId(ENVIRONMENT_ID)
        .name('test_environment')
        .description('test_environment description')
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
      options = options.newBuilder().build();
      IBMDiscoveryV1Models.Configuration resp =
        service.updateConfiguration(options);
    }
    catch(Exception exptn) {
      System.assertEquals(exptn.getMessage(), 'configurationId cannot be empty');
    }
    Test.stopTest();
  }

  /**
   *  Test create collection
   *
   */
  static testMethod void testCreateCollection() {
    String body = IBMWatsonMockResponses.collection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.CreateCollectionOptions options = new IBMDiscoveryV1Models.CreateCollectionOptionsBuilder(ENVIRONMENT_ID, CONFIGURATION_ID)
      .environmentId(ENVIRONMENT_ID)
      .configurationId(CONFIGURATION_ID)
      .name('test_environment')
      .description('test_environment description')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .language('de')
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Collection resp =
      service.createCollection(options);
    System.assertEquals(resp.getName(), 'test-collection');
    Test.stopTest();
  }

  /**
   *  Test delete collection
   *
   */
  static testMethod void testDeleteCollection() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.DeleteCollectionOptions options = new IBMDiscoveryV1Models.DeleteCollectionOptionsBuilder(ENVIRONMENT_ID, CONFIGURATION_ID)
      .environmentId(ENVIRONMENT_ID)
      .collectionId(CONFIGURATION_ID)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteCollection(options);
    Test.stopTest();
  }

  /**
   *  Test get collection
   *
   */
  static testMethod void testGetCollection() {
    String body = IBMWatsonMockResponses.collection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.GetCollectionOptions options = new IBMDiscoveryV1Models.GetCollectionOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Collection resp =
      service.getCollection(options);
    System.assertEquals(resp.getName(), 'test-collection');
    System.assertEquals(resp.getCollectionId(), '800e58e4-198d-45eb-be87-74e1d6df4e96');
    System.assertEquals(resp.getCreated(),(Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    System.assertEquals(resp.getUpdated(),(Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    System.assertEquals(resp.getStatus(), 'active');
    System.assertEquals(resp.getConfigurationId(), '3c4fff84-1500-455c-b125-eaa2d319f6d3');
    System.assertEquals(resp.getLanguage(), 'de');
    System.assertEquals(resp.getDescription(), 'A test collection to show as an example');
    System.assertEquals(resp.getDocumentCounts().getAvailable(), 0);
    System.assertEquals(resp.getDocumentCounts().getProcessing(), 0);
    System.assertEquals(resp.getDocumentCounts().getFailed(), 0);
    System.assertEquals(100, resp.getDocumentCounts().getPending());
    System.assertEquals(resp.getDiskUsage().getUsedBytes(), 260);
    System.assertEquals(resp.getTrainingStatus().getTotalExamples(), 0);
    System.assertEquals(resp.getTrainingStatus().getAvailable(), false);
    System.assertEquals(resp.getTrainingStatus().getProcessing(), false);
    System.assertEquals(resp.getTrainingStatus().getMinimumQueriesAdded(), false);
    System.assertEquals(resp.getTrainingStatus().getMinimumExamplesAdded(), false);
    System.assertEquals(resp.getTrainingStatus().getSufficientLabelDiversity(), false);
    System.assertEquals(resp.getTrainingStatus().getNotices(), 0);
    System.assertEquals(resp.getTrainingStatus().getSuccessfullyTrained(), (Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    System.assertEquals(resp.getTrainingStatus().getDataUpdated(), (Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    Test.stopTest();
  }

  /**
   *  Test get trained collection
   *
   */
  static testMethod void testGetCollectionTrained() {
    String body = IBMWatsonMockResponses.collectionTrained();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.GetCollectionOptions options = new IBMDiscoveryV1Models.GetCollectionOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Collection resp =
      service.getCollection(options);
    System.assertEquals(resp.getName(), 'test-collection');
    System.assertEquals(resp.getCollectionId(), '800e58e4-198d-45eb-be87-74e1d6df4e96');
    System.assertEquals(resp.getCreated(),(Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    System.assertEquals(resp.getUpdated(),(Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    System.assertEquals(resp.getStatus(), 'active');
    System.assertEquals(resp.getConfigurationId(), '3c4fff84-1500-455c-b125-eaa2d319f6d3');
    System.assertEquals(resp.getLanguage(), 'de');
    System.assertEquals(resp.getDescription(), 'A trained test collection to show as an example');
    System.assertEquals(resp.getDocumentCounts().getAvailable(), 0);
    System.assertEquals(resp.getDocumentCounts().getProcessing(), 0);
    System.assertEquals(resp.getDocumentCounts().getFailed(), 0);
    System.assertEquals(100, resp.getDocumentCounts().getPending());
    System.assertEquals(resp.getDiskUsage().getUsedBytes(), 260);
    System.assertEquals(resp.getTrainingStatus().getTotalExamples(), 10);
    System.assertEquals(resp.getTrainingStatus().getAvailable(), true);
    System.assertEquals(resp.getTrainingStatus().getProcessing(), false);
    System.assertEquals(resp.getTrainingStatus().getMinimumQueriesAdded(), true);
    System.assertEquals(resp.getTrainingStatus().getMinimumExamplesAdded(), true);
    System.assertEquals(resp.getTrainingStatus().getSufficientLabelDiversity(), true);
    System.assertEquals(resp.getTrainingStatus().getNotices(), 0);
    System.assertEquals(resp.getTrainingStatus().getSuccessfullyTrained(), (Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    System.assertEquals(resp.getTrainingStatus().getDataUpdated(), (Datetime)JSON.deserialize('"2017-07-14T12:55:40.652Z"',Datetime.class));
    Test.stopTest();
  }

  /**
   *  Test list collections
   *
   */
  static testMethod void testListCollections() {
    String body = IBMWatsonMockResponses.listCollectionsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.ListCollectionsOptions options = new IBMDiscoveryV1Models.ListCollectionsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.ListCollectionsResponse resp =
      service.listCollections(options);
    System.assertEquals(resp.getCollections().size(), 1);
    Test.stopTest();
  }
  /**
   *  Test update collection
   *
   */
  static testMethod void testUpdateCollection() {
    String body = IBMWatsonMockResponses.collection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.UpdateCollectionOptions options = new IBMDiscoveryV1Models.UpdateCollectionOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .name('test_environment')
      .description('test_environment description')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Collection resp =
      service.updateCollection(options);
    System.assertEquals(resp.getName(), 'test-collection');
    Test.stopTest();
  }

  /**
   *  Test update collection validator error
   *
   */
  static testMethod void testUpdateCollectionEmpty() {
    String body = IBMWatsonMockResponses.collection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    try {
      IBMDiscoveryV1Models.UpdateCollectionOptions options = new IBMDiscoveryV1Models.UpdateCollectionOptionsBuilder()
        .environmentId(ENVIRONMENT_ID)
        .name('test_environment')
        .description('test_environment description')
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
      options = options.newBuilder().build();
      IBMDiscoveryV1Models.Collection resp =
        service.updateCollection(options);
    }
    catch(Exception exptn) {
      System.assertEquals(exptn.getMessage(), 'collectionId cannot be empty');
    }
    Test.stopTest();
  }

  /**
   *  Test list fields in a single collection. (IBMDiscoveryV1.listCollectionFields)
   *
   */
  static testMethod void testListCollectionFields() {
    String body = IBMWatsonMockResponses.listCollectionFieldsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> collectionIds= new List<String>{'Collection1', 'Collection2'};
    IBMDiscoveryV1Models.ListCollectionFieldsOptions options = new IBMDiscoveryV1Models.ListCollectionFieldsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.ListCollectionFieldsResponse resp =
      service.listCollectionFields(options);
    System.assertEquals(resp.getFields().size(), 4);
    Test.stopTest();
  }

  /**
   *  Test delete document
   *
   */
  static testMethod void testDeleteDocument() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.DeleteDocumentOptions options = new IBMDiscoveryV1Models.DeleteDocumentOptionsBuilder(ENVIRONMENT_ID, '5ae96bb9-80e5-43ea-916e-1f3412fbc283', '5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .documentId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteDocument(options);
    Test.stopTest();
  }

  /**
   *  Test get document
   *
   */
  static testMethod void testGetDocumentStatus() {
    String body = IBMWatsonMockResponses.documentStatus();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.GetDocumentStatusOptions options = new IBMDiscoveryV1Models.GetDocumentStatusOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .documentId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.DocumentStatus resp =
      service.getDocumentStatus(options);
    System.assertEquals(resp.getStatus(), 'available with notices');
    System.assertEquals(resp.getDocumentId(), 'f1360220-ea2d-4271-9d62-89a910b13c37');
    System.assertEquals(resp.getConfigurationId(), 'e8b9d793-b163-452a-9373-bce07efb510b');
    System.assertEquals(resp.getStatusDescription(), 'Document is successfully ingested but was indexed with warnings');
    System.assertEquals(resp.getFilename(), 'instructions.html');
    System.assertEquals(resp.getFileType(), 'html');
    System.assertEquals(resp.getSha1(), 'de9f2c7fd25e1b3afad3e85a0bd17d9b100db4b3');
    System.assertEquals(resp.getNotices()[0].getNoticeId(), 'index_342');
    System.assertEquals(resp.getNotices()[0].getSeverity(), 'warning');
    System.assertEquals(resp.getNotices()[0].getStep(), 'indexing');
    System.assertEquals(resp.getNotices()[0].getDescription(), 'something bad happened');
    System.assertEquals(resp.getNotices()[0].getDocumentId(), 'f1360220-ea2d-4271-9d62-89a910b13c37');
    System.assertEquals(resp.getNotices()[0].getCreated(),(Datetime)JSON.deserialize('"2015-08-24T18:42:25.324Z"',Datetime.class));
    resp.setFilename('instructions1.html');
    resp.setFileType('html');
    resp.setSha1('de9f2c7fd25e1b3afad3e85a0bd17d9b100db4b3');
    System.assertEquals(resp.getFilename(), 'instructions1.html');
    Test.stopTest();
  }

  /**
   *  Test Query documents in multiple collections.
   *
   */
  static testMethod void testFederatedQuery() {
    String body = IBMWatsonMockResponses.queryResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String fields = 'field1,field2';
    String collectionIds = 'Collection1, Collection2';
    IBMDiscoveryV1Models.FederatedQueryOptions options = new IBMDiscoveryV1Models.FederatedQueryOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionIds(collectionIds)
      .xReturn(fields)
      .xSort(fields)
      .similar(true)
      .similarDocumentIds('doc1,doc2')
      .similarFields('field1,field2')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.QueryResponse resp =
      service.federatedQuery(options);
    System.assertEquals(resp.getResults().size(), 1);
    Test.stopTest();
  }

  /**
   *  Test query multiple collection system notices
   *
   */
  static testMethod void testFederatedQueryNotices() {
    String body = IBMWatsonMockResponses.queryNoticesResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> collectionIds = new List<String> { 'Collection1', 'Collection2' };
    IBMDiscoveryV1Models.FederatedQueryNoticesOptions options = new IBMDiscoveryV1Models.FederatedQueryNoticesOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .addCollectionIds('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .collectionIds(collectionIds)
      .addXReturn('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addXSort('asc')
      .filter('test')
      .query('test')
      .naturalLanguageQuery('test')
      .aggregation('test')
      .count(10)
      .xReturn(new List<String> { 'test' })
      .offset(10)
      .xSort(new List<String>{'test'})
      .highlight(true)
      .deduplicateField('test')
      .similar(true)
      .similarDocumentIds(new List<String> { 'doc1', 'doc2' })
      .similarFields(new List<String> { 'field1', 'field2' })
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.QueryNoticesResponse resp =
      service.federatedQueryNotices(options);
    System.assertEquals(resp.getResults().size(), 1);
    resp.setMatchingResults(4);
    IBMDiscoveryV1Models.QueryNoticesResult queryNoticesResult = new IBMDiscoveryV1Models.QueryNoticesResult();
    queryNoticesResult.setId('5ae96bb9-80e5-43ea-916e-1f3412fbc283');
    IBMWatsonMapModel mapModel= new IBMWatsonMapModel();
    mapModel.put('key', 'value');
    queryNoticesResult.setMetadata(mapModel);
    queryNoticesResult.setCollectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283');
    resp.setResults(new List<IBMDiscoveryV1Models.QueryNoticesResult>{queryNoticesResult});
    IBMDiscoveryV1Models.QueryAggregation queryAggregation= new IBMDiscoveryV1Models.QueryAggregation();
    queryAggregation.setXType('test');
    queryAggregation.setField('test');
    queryAggregation.setMatch('test');
    queryAggregation.setCount(10);
    queryAggregation.setValue(10);
    queryAggregation.setPath('test');
    queryAggregation.setTimesliceInterval('test');
    queryAggregation.setAnomaly(true);
    queryAggregation.setSize(10);
    IBMDiscoveryV1Models.TopHitsResults hits = new IBMDiscoveryV1Models.TopHitsResults();
    hits.setMatchingResults(10);
    queryAggregation.setHits(hits);
    queryAggregation.setMatchingResults(4);
    IBMDiscoveryV1Models.AggregationResult aggregationResult= new IBMDiscoveryV1Models.AggregationResult();
    aggregationResult.setKey('test');
    aggregationResult.setMatchingResults(3);
    aggregationResult.setAggregations(null);
    queryAggregation.setResults(new List<IBMDiscoveryV1Models.AggregationResult>{aggregationResult});
    resp.setAggregations(new List<IBMDiscoveryV1Models.QueryAggregation>{queryAggregation});
    IBMDiscoveryV1Models.QueryPassages queryPassages= new IBMDiscoveryV1Models.QueryPassages();
    queryPassages.setDocumentId('5ae96bb9-80e5-43ea-916e-1f3412fbc283');
    queryPassages.setPassageText('test');
    queryPassages.setField('test');
    queryPassages.setPassageScore(2);
    queryPassages.setStartOffset(2);
    queryPassages.setEndOffset(2);
    resp.setPassages(new List<IBMDiscoveryV1Models.QueryPassages>{queryPassages});
    resp.setDuplicatesRemoved(2);
    System.assertEquals(resp.getMatchingResults(), 4);
    System.assertEquals(resp.getResults()[0].getCollectionId(), '5ae96bb9-80e5-43ea-916e-1f3412fbc283');
    System.assertEquals(resp.getAggregations()[0].getXtype(), 'test');
    System.assertEquals(resp.getPassages()[0].getField(), 'test');
    System.assertEquals(resp.getDuplicatesRemoved(), 2);
    System.assertEquals(queryNoticesResult.getId(), '5ae96bb9-80e5-43ea-916e-1f3412fbc283');
    System.assertEquals(queryNoticesResult.getMetadata().get('key'), 'value');
    System.assertEquals(queryNoticesResult.getCollectionId(), '5ae96bb9-80e5-43ea-916e-1f3412fbc283');
    System.assertEquals(queryAggregation.getResults()[0].getKey(), 'test');
    System.assertEquals(aggregationResult.getMatchingResults(), 3);
    System.assertEquals(aggregationResult.getAggregations(), null);
    System.assertEquals(queryAggregation.getXtype(), 'test');
    System.assertEquals(queryAggregation.getField(), 'test');
    System.assertEquals(queryAggregation.getMatch(), 'test');
    System.assertEquals(queryAggregation.getCount(), 10);
    System.assertEquals(queryAggregation.getValue(), 10);
    System.assertEquals(queryAggregation.getPath(), 'test');
    System.assertEquals(queryAggregation.getTimesliceInterval(), 'test');
    System.assertEquals(queryAggregation.getAnomaly(), true);
    System.assertEquals(queryAggregation.getSize(), 10);
    System.assert(queryAggregation.getHits() != null);
    System.assertEquals(queryAggregation.getMatchingResults(), 4);
    System.assertEquals(queryPassages.getDocumentId(), '5ae96bb9-80e5-43ea-916e-1f3412fbc283');
    System.assertEquals(queryPassages.getPassageText(), 'test');
    System.assertEquals(queryPassages.getField(), 'test');
    System.assertEquals(queryPassages.getPassageScore(), 2);
    System.assertEquals(queryPassages.getStartOffset(), 2);
    System.assertEquals(queryPassages.getEndOffset(), 2);
    Test.stopTest();
  }

  /**
   *  Test Query documents in single collection.
   *
   */
  static testMethod void testQuery() {
    String body = IBMWatsonMockResponses.queryResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String retrievalStrategy = 'relevancy_training';
    List<String> collectionIds = new List<String> { 'Collection1', 'Collection2' };
    IBMDiscoveryV1Models.QueryOptions options = new IBMDiscoveryV1Models.QueryOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .xReturn('return1,return2')
      .xSort('sort1,sort2')
      .passagesFields('passage1,passage2')
      .similar(true)
      .similarDocumentIds('doc1,doc2')
      .similarFields('field1,field2')
      .xWatsonLoggingOptOut(true)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.QueryResponse resp =
      service.query(options);
    System.assertEquals(resp.getResults().size(), 1);
    System.assertEquals(retrievalStrategy, resp.getRetrievalDetails().getDocumentRetrievalStrategy());
    Test.stopTest();
  }

  /**
   *  Test query collection system notices
   *
   */
  static testMethod void testQueryNotices() {
    String body = IBMWatsonMockResponses.queryNoticesResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> collectionIds = new List<String> { 'Collection1', 'Collection2' };
    IBMDiscoveryV1Models.QueryNoticesOptions options = new IBMDiscoveryV1Models.QueryNoticesOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .xReturn(collectionIds)
      .xSort(collectionIds)
      .passagesFields(collectionIds)
      .similar(true)
      .similarDocumentIds(new List<String> { 'doc1', 'doc2' })
      .similarFields(new List<String> { 'field1', 'field2' })
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.QueryNoticesResponse resp =
      service.queryNotices(options);
    System.assertEquals(resp.getResults().size(), 1);
    System.assertEquals('030ba125-29db-43f2-8552-f941ae30a7a8', resp.getResults().get(0).getId());
    System.assertEquals('f1360220-ea2d-4271-9d62-89a910b13c37', resp.getResults().get(0).getCollectionId());
    System.assertEquals(200, resp.getResults().get(0).getCode());
    System.assertEquals('instructions.html', resp.getResults().get(0).getFilename());
    System.assertEquals('html', resp.getResults().get(0).getFileType());
    System.assertEquals('de9f2c7fd25e1b3afad3e85a0bd17d9b100db4b3', resp.getResults().get(0).getSha1());
    System.assertEquals('xpath_not_found', resp.getResults().get(0).getNotices().get(0).getNoticeId());
    System.assertEquals('030ba125-29db-43f2-8552-f941ae30a7a8', resp.getResults().get(0).getNotices().get(0).getDocumentId());
    System.assertEquals('warning', resp.getResults().get(0).getNotices().get(0).getSeverity());
    System.assertEquals('html-to-html', resp.getResults().get(0).getNotices().get(0).getStep());
    System.assertEquals('The xpath expression boom was not found.', resp.getResults().get(0).getNotices().get(0).getDescription());
    Test.stopTest();
  }


  /**
   *  Test adding a query to the training data in single collection.
   *
   */
  static testMethod void testAddTrainingData() {
    String body = IBMWatsonMockResponses.trainingQuery();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> collectionIds = new List<String> { 'Collection1', 'Collection2' };
    IBMDiscoveryV1Models.TrainingExample trainingExample = new IBMDiscoveryV1Models.TrainingExampleBuilder()
      .documentId('string')
      .crossReference('string')
      .relevance(0)
      .build();
    IBMDiscoveryV1Models.AddTrainingDataOptions options = new IBMDiscoveryV1Models.AddTrainingDataOptionsBuilder(ENVIRONMENT_ID, '5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .naturalLanguageQuery('en')
      .filter('test')
      .addExamples(trainingExample)
      .examples(new List<IBMDiscoveryV1Models.TrainingExample> { trainingExample })
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.TrainingQuery resp =
      service.addTrainingData(options);
    System.assertEquals(resp.getExamples().size(), 1);
    System.assertEquals(resp.getExamples()[0].getDocumentId(), 'string');
    System.assertEquals(resp.getExamples()[0].getCrossReference(), 'string');
    System.assertEquals(resp.getExamples()[0].getRelevance(), 0);

    Test.stopTest();
  }

  /**
   *  Test adding a query to the training data in single collection.
   *
   */
  static testMethod void testCreateTrainingExample() {
    String body = IBMWatsonMockResponses.trainingExample();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> collectionIds= new List<String> { 'Collection1', 'Collection2' };
    IBMDiscoveryV1Models.TrainingExample trainingExample = new IBMDiscoveryV1Models.TrainingExampleBuilder()
      .documentId('string')
      .crossReference('string')
      .relevance(0)
      .build();
    IBMDiscoveryV1Models.CreateTrainingExampleOptions options = new IBMDiscoveryV1Models.CreateTrainingExampleOptionsBuilder(ENVIRONMENT_ID, '5ae96bb9-80e5-43ea-916e-1f3412fbc283', '5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .queryId('en')
      .trainingExample(trainingExample)
      .documentId('test')
      .relevance(2)
      .crossReference('test')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.TrainingExample resp =
      service.createTrainingExample(options);
    System.assertEquals(resp.getRelevance(), 2);
    Test.stopTest();
  }

   /**
   *  Test delete training data for a collection
   *
   */
  static testMethod void testDeleteAllTrainingData() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();    

    IBMDiscoveryV1Models.DeleteAllTrainingDataOptions options = new IBMDiscoveryV1Models.DeleteAllTrainingDataOptionsBuilder(ENVIRONMENT_ID, '5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteAllTrainingData(options);
    Test.stopTest();
  }

  /**
   *  Test delete training data and all associated examples from the training data set
   *
   */
  static testMethod void testDeleteTrainingData() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.DeleteTrainingDataOptions options = new IBMDiscoveryV1Models.DeleteTrainingDataOptionsBuilder(ENVIRONMENT_ID, '5ae96bb9-80e5-43ea-916e-1f3412fbc283', '5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .queryId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteTrainingData(options);
    Test.stopTest();
  }

   /**
   *  Test get training data
   *
   */
  static testMethod void testGetTrainingData() {
    String body = IBMWatsonMockResponses.trainingQuery();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.GetTrainingDataOptions options = new IBMDiscoveryV1Models.GetTrainingDataOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .queryId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.TrainingQuery resp =
      service.getTrainingData(options);

    System.assertEquals(resp.getExamples().size(), 1);
    System.assertEquals(resp.getFilter(), 'string');
    Test.stopTest();
  }

  /**
   *  Test get training example
   *
   */
  static testMethod void testGetTrainingExample() {
    String body = IBMWatsonMockResponses.trainingExample();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.GetTrainingExampleOptions options = new IBMDiscoveryV1Models.GetTrainingExampleOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .queryId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .exampleId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.TrainingExample resp =
      service.getTrainingExample(options);

    System.assertEquals(resp.getRelevance(), 2);
    Test.stopTest();
  }

  /**
   *  Test list training data
   *
   */
  static testMethod void testListTrainingData() {
    String body = IBMWatsonMockResponses.trainingDataSet();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.ListTrainingDataOptions options = new IBMDiscoveryV1Models.ListTrainingDataOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.TrainingDataSet resp =
      service.listTrainingData(options);

    System.assertEquals(resp.getQueries()[0].getExamples().size(), 1);
    System.assertEquals(resp.getQueries()[0].getFilter(), 'string');
    Test.stopTest();
  }

  /**
   *  Test adding a query to the training data in single collection.
   *
   */
  static testMethod void testUpdateTrainingExample() {
    String body = IBMWatsonMockResponses.trainingExample();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> collectionIds= new List<String>{'Collection1', 'Collection2'};
    IBMDiscoveryV1Models.UpdateTrainingExampleOptions options = new IBMDiscoveryV1Models.UpdateTrainingExampleOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .queryId('en')
      .exampleId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .relevance(2)
      .crossReference('test')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.TrainingExample resp =
      service.updateTrainingExample(options);
    System.assertEquals(resp.getRelevance(), 2);
    Test.stopTest();
  }

  /**
   *  Test collection model
   *
   */
  static testMethod void testCollectionModel() {
    Test.startTest();
    IBMDiscoveryV1Models.Collection resp = new IBMDiscoveryV1Models.Collection();
    //set the value
    resp.setName('test-collection');
    resp.setConfigurationId('3c4fff84-1500-455c-b125-eaa2d319f6d3');
    resp.setLanguage('de');
    resp.setDescription('A test collection to show as an example');
    IBMDiscoveryV1Models.DocumentCounts dc= new IBMDiscoveryV1Models.DocumentCounts();
    resp.setDocumentCounts(dc);
    IBMDiscoveryV1Models.CollectionDiskUsage cdu= new IBMDiscoveryV1Models.CollectionDiskUsage();
    resp.setDiskUsage(cdu);
    IBMDiscoveryV1Models.TrainingStatus ts= new IBMDiscoveryV1Models.TrainingStatus();
    ts.setTotalExamples(0);
    ts.setAvailable(false);
    ts.setProcessing(false);
    ts.setMinimumQueriesAdded(false);
    ts.setMinimumExamplesAdded(false);
    ts.setSufficientLabelDiversity(false);
    ts.setNotices(0);
    ts.setSuccessfullyTrained(null);
    ts.setDataUpdated(null);
    resp.setTrainingStatus(ts);
    //test the returned values
    System.assertEquals(resp.getName(), 'test-collection');
    System.assertEquals(resp.getConfigurationId(), '3c4fff84-1500-455c-b125-eaa2d319f6d3');
    System.assertEquals(resp.getLanguage(), 'de');
    System.assertEquals(resp.getDescription(), 'A test collection to show as an example');
    System.assertEquals(resp.getTrainingStatus().getTotalExamples(), 0);
    System.assertEquals(resp.getTrainingStatus().getAvailable(), false);
    System.assertEquals(resp.getTrainingStatus().getProcessing(), false);
    System.assertEquals(resp.getTrainingStatus().getMinimumQueriesAdded(), false);
    System.assertEquals(resp.getTrainingStatus().getMinimumExamplesAdded(), false);
    System.assertEquals(resp.getTrainingStatus().getSufficientLabelDiversity(), false);
    System.assertEquals(resp.getTrainingStatus().getNotices(), 0);
    System.assertEquals(resp.getTrainingStatus().getSuccessfullyTrained(), null);
    System.assertEquals(resp.getTrainingStatus().getDataUpdated(), null);
    Test.stopTest();
  }

   /**
   *  Test configuration model
   *
   */
  static testMethod void testConfigurationModel() {
    String body = IBMWatsonMockResponses.configuration();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMDiscoveryV1Models.XPathPatterns xPathPatterns = new IBMDiscoveryV1Models.XPathPatternsBuilder()
      .xpaths(new List<String>{ 'xpath1' })
      .build();
    IBMDiscoveryV1Models.HtmlSettings html = new IBMDiscoveryV1Models.HtmlSettingsBuilder()
      .excludeContent(xPathPatterns)
      .excludeTagAttributes(new List<String> { 'ExAtt1' })
      .excludeTagsCompletely(new List<String> { 'Tag1', 'Tag2' })
      .excludeTagsKeepContent(new List<String> { 'KeepCntent1', 'KeepCntent2' })
      .keepContent(xPathPatterns)
      .keepTagAttributes(new List<String> { 'tag' })
      .build();
    IBMDiscoveryV1Models.NormalizationOperation normalizationOperation = new IBMDiscoveryV1Models.NormalizationOperationBuilder()
      .destinationField('test destination')
      .operation('test operation')
      .sourceField('test source')
      .build();
    IBMDiscoveryV1Models.FontSetting fontSetting = new IBMDiscoveryV1Models.FontSettingBuilder()
      .bold(true)
      .italic(true)
      .level(1)
      .maxSize(10)
      .minSize(4)
      .name('ariel')
      .build();
    IBMDiscoveryV1Models.PdfHeadingDetection pdfHeadingDetection = new IBMDiscoveryV1Models.PdfHeadingDetectionBuilder()
      .fonts(new List<IBMDiscoveryV1Models.FontSetting> { fontSetting })
      .build();
    IBMDiscoveryV1Models.PdfSettings pdfSettings = new IBMDiscoveryV1Models.PdfSettingsBuilder()
      .heading(pdfHeadingDetection)
      .build();
    IBMDiscoveryV1Models.WordStyle style = new IBMDiscoveryV1Models.WordStyleBuilder()
      .level(1)
      .names(new List<String> { 'Style1', 'Style2' })
      .build();
    IBMDiscoveryV1Models.WordHeadingDetection wordHeading = new IBMDiscoveryV1Models.WordHeadingDetectionBuilder()
      .fonts(new List<IBMDiscoveryV1Models.FontSetting> { fontSetting })
      .styles(new List<IBMDiscoveryV1Models.WordStyle> { style })
      .build();
    IBMDiscoveryV1Models.WordSettings word = new IBMDiscoveryV1Models.WordSettingsBuilder()
      .heading(wordHeading)
      .build();
    IBMDiscoveryV1Models.Conversions conversions = new IBMDiscoveryV1Models.ConversionsBuilder()
      .html(html)
      .jsonNormalizations(new List<IBMDiscoveryV1Models.NormalizationOperation>{ normalizationOperation })
      .pdf(pdfSettings)
      .word(word)
      .build();
    IBMDiscoveryV1Models.NluEnrichmentEmotion enrichmentEmotion = new IBMDiscoveryV1Models.NluEnrichmentEmotionBuilder()
      .document(true)
      .targets(new List<String> { 'Target1', 'Target2' })
      .build();
    enrichmentEmotion = enrichmentEmotion.newBuilder().build();
    IBMDiscoveryV1Models.NluEnrichmentEntities enrichmentEntities = new IBMDiscoveryV1Models.NluEnrichmentEntitiesBuilder()
      .emotion(true)
      .xlimit(5)
      .mentions(true)
      .mentionTypes(true)
      .model('test')
      .sentenceLocations(true)
      .sentiment(true)
      .build();
    enrichmentEntities = enrichmentEntities.newBuilder().build();
    IBMDiscoveryV1Models.NluEnrichmentKeywords enrichmentKeywords = new IBMDiscoveryV1Models.NluEnrichmentKeywordsBuilder()
      .emotion(true)
      .xlimit(5)
      .sentiment(true)
      .build();
    enrichmentKeywords = enrichmentKeywords.newBuilder().build();
    IBMDiscoveryV1Models.NluEnrichmentRelations enrichmentRelations = new IBMDiscoveryV1Models.NluEnrichmentRelationsBuilder()
      .model('test')
      .build();
    IBMDiscoveryV1Models.NluEnrichmentSemanticRoles enrichmentSemanticRoles = new IBMDiscoveryV1Models.NluEnrichmentSemanticRolesBuilder()
      .entities(true)
      .keywords(true)
      .xlimit(5)
      .build();
    enrichmentSemanticRoles = enrichmentSemanticRoles.newBuilder().build();
    IBMDiscoveryV1Models.NluEnrichmentSentiment enrichmentSentiment = new IBMDiscoveryV1Models.NluEnrichmentSentimentBuilder()
      .document(true)
      .targets(new List<String>{'Target1', 'Target2'})
      .build();
    enrichmentSentiment = enrichmentSentiment.newBuilder().build();
    IBMDiscoveryV1Models.NluEnrichmentFeatures enrichmentFeatures = new IBMDiscoveryV1Models.NluEnrichmentFeaturesBuilder()
      .emotion(enrichmentEmotion)
      .entities(enrichmentEntities)
      .keywords(enrichmentKeywords)
      .relations(enrichmentRelations)
      .semanticRoles(enrichmentSemanticRoles)
      .sentiment(enrichmentSentiment)
      .build();
    enrichmentFeatures = enrichmentFeatures.newBuilder().build();
    IBMDiscoveryV1Models.EnrichmentOptions enrichmentOptions = new IBMDiscoveryV1Models.EnrichmentOptionsBuilder()
      .features(enrichmentFeatures)
      .model('test')
      .language('en')
      .build();
    IBMDiscoveryV1Models.Enrichment enrichment = new IBMDiscoveryV1Models.EnrichmentBuilder()
      .description('test Description')
      .destinationField('test Description')
      .sourceField('test Description')
      .overwrite(true)
      .enrichment('test Description')
      .ignoreDownstreamErrors(true)
      .options(enrichmentOptions)
      .build();
    IBMDiscoveryV1Models.Configuration configuration = new IBMDiscoveryV1Models.ConfigurationBuilder()
      .name('test-collection')
      .description('A test collection to show as an example')
      .enrichments(new List<IBMDiscoveryV1Models.Enrichment> { enrichment })
      .normalizations(new List<IBMDiscoveryV1Models.NormalizationOperation> { normalizationOperation })
      .conversions(conversions)
      .build();
    IBMDiscoveryV1Models.CreateConfigurationOptions options = new IBMDiscoveryV1Models.CreateConfigurationOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .configuration(configuration)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Configuration resp =
      service.createConfiguration(options);
    System.assertEquals(resp.getName(), 'IBM News');
    System.assertEquals(configuration.getName(), 'test-collection');
    System.assertEquals(configuration.getDescription(), 'A test collection to show as an example');
    System.assertEquals(configuration.getConversions().getPdf().getHeading().getFonts()[0].getLevel(), 1);
    System.assertEquals(fontSetting.getMinSize(), 4);
    System.assertEquals(fontSetting.getMaxSize(), 10);
    System.assertEquals(fontSetting.getBold(), true);
    System.assertEquals(fontSetting.getItalic(), true);
    System.assertEquals(fontSetting.getName(), 'ariel');
    System.assertEquals(configuration.getConversions().getWord().getHeading().getFonts()[0].getLevel(), 1);
    System.assertEquals(configuration.getConversions().getWord().getHeading().getStyles()[0].getLevel(), 1);
    System.assertEquals(configuration.getConversions().getWord().getHeading().getStyles()[0].getNames()[0], 'Style1');
    System.assertEquals(configuration.getConversions().getHtml().getExcludeTagsCompletely()[0], 'Tag1');
    System.assertEquals(configuration.getConversions().getHtml().getExcludeTagsKeepContent()[0], 'KeepCntent1');
    System.assertEquals(configuration.getConversions().getHtml().getKeepTagAttributes()[0], 'tag');
    System.assertEquals(configuration.getConversions().getHtml().getExcludeTagAttributes()[0], 'ExAtt1');
    System.assertEquals(configuration.getConversions().getHtml().getKeepContent().getXpaths()[0], 'xpath1');
    System.assertEquals(configuration.getConversions().getHtml().getExcludeContent().getXpaths()[0], 'xpath1');
    System.assertEquals(configuration.getConversions().getJsonNormalizations()[0].getOperation(), 'test operation');
    System.assertEquals(normalizationOperation.getSourceField(), 'test source');
    System.assertEquals(normalizationOperation.getDestinationField(), 'test destination');
    System.assertEquals(configuration.getNormalizations()[0].getOperation(), 'test operation');
    System.assertEquals(configuration.getEnrichments()[0].getDescription(), 'test Description');
    System.assertEquals(enrichment.getDestinationField(), 'test Description');
    System.assertEquals(enrichment.getSourceField(), 'test Description');
    System.assertEquals(enrichment.getOverwrite(), true);
    System.assertEquals(enrichment.getEnrichment(), 'test Description');
    System.assertEquals(enrichment.getIgnoreDownstreamErrors(), true);
    System.assertEquals(enrichmentOptions.getModel(), 'test');
    System.assertEquals(enrichmentOptions.getFeatures().getEmotion().getDocument(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getEmotion().getTargets()[0], 'Target1');
    System.assertEquals(enrichmentOptions.getFeatures().getEntities().getEmotion(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getEntities().getXlimit(), 5);
    System.assertEquals(enrichmentOptions.getFeatures().getEntities().getMentions(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getEntities().getMentionTypes(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getEntities().getModel(), 'test');
    System.assertEquals(enrichmentOptions.getFeatures().getEntities().getSentenceLocations(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getEntities().getSentiment(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getKeywords().getEmotion(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getKeywords().getXlimit(), 5);
    System.assertEquals(enrichmentOptions.getFeatures().getKeywords().getSentiment(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getRelations().getModel(), 'test');
    System.assertEquals(enrichmentOptions.getFeatures().getSemanticRoles().getEntities(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getSemanticRoles().getKeywords(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getSemanticRoles().getXlimit(), 5);
    System.assertEquals(enrichmentOptions.getFeatures().getSentiment().getDocument(), true);
    System.assertEquals(enrichmentOptions.getFeatures().getSentiment().getTargets()[0], 'Target1');
    Test.stopTest();
  }

  /**
   *  Test deleting the example with the given ID for the training data query.
   */
  static testMethod void testDeleteTrainingExample() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String text = '5ae96bb9-80e5-43ea-916e-1f3412fbc283';
    IBMDiscoveryV1Models.DeleteTrainingExampleOptions options = new IBMDiscoveryV1Models.DeleteTrainingExampleOptionsBuilder('test', 'test', 'test', 'test')
      .environmentId(ENVIRONMENT_ID)
      .collectionId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .queryId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .exampleId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteTrainingExample(options);
    Test.stopTest();
  }

  /**
   *  Add a document.
   *
   * then test using testGetDocumentStatus if document is loaded successfully
   */
  static testMethod void testAddDocument() {
    String body = IBMWatsonMockResponses.documentAccepted();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    Attachment att = new Attachment(Body=Blob.valueOf('test string'),
      Name='test.txt',
      Description='test description',
      ContentType='text/plain');
    IBMWatsonFile testfile = new IBMWatsonFile.FileBuilder()
      .attachment(att)
      .build();

    IBMDiscoveryV1Models.AddDocumentOptions options = new IBMDiscoveryV1Models.AddDocumentOptionsBuilder()
      .environmentId('environment_id')
      .collectionId('collection_id')
      .file(testfile)
      .filename('test.txt')
      .fileContentType('text/plain')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
     //you can add more attributes using following builder method. This step is not necessary
     options = options.newBuilder().build();
    IBMDiscoveryV1Models.DocumentAccepted resp =
      service.addDocument(options);
    System.assertEquals(resp.getDocumentId(), 'f1360220-ea2d-4271-9d62-89a910b13c37');
    System.assertEquals(resp.getStatus(), 'processing');
    Test.stopTest();
  }

  /**
   *  Update a document.
   *
   */
  static testMethod void testUpdateDocument() {
    String body = IBMWatsonMockResponses.documentAccepted();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMWatsonFile testfile= new IBMWatsonFile.FileBuilder()
      .body(Blob.valueOf('test string'))
      .name('test.txt')
      .description('test description')
      .contentType('text/plain')
      .build();
    IBMDiscoveryV1Models.UpdateDocumentOptions options = new IBMDiscoveryV1Models.UpdateDocumentOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId('collection_id')
      .documentId('5ae96bb9-80e5-43ea-916e-1f3412fbc283')
      .file(testfile)
      .filename('test.txt')
      .fileContentType('text/plain')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.DocumentAccepted resp =
      service.updateDocument(options);
    System.assertEquals(resp.getDocumentId(), 'f1360220-ea2d-4271-9d62-89a910b13c37');
    System.assertEquals(resp.getStatus(), 'processing');
    Test.stopTest();
  }

  static testMethod void testCreateExpansions() {
    String body = IBMWatsonMockResponses.expansionsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> expansion1InputTerms = new List<String> { 'weekday', 'week day' };
    List<String> expansion1ExpandedTerms = new List<String> { 'monday', 'tuesday', 'wednesday', 'thursday', 'friday' };
    List<String> expansion2InputTerms = new List<String> { 'weekend', 'week end' };
    List<String> expansion2ExpandedTerms = new List<String> { 'saturday', 'sunday' };
    IBMDiscoveryV1Models.Expansion expansion1 = new IBMDiscoveryV1Models.ExpansionBuilder()
      .inputTerms(expansion1InputTerms)
      .expandedTerms(expansion1ExpandedTerms)
      .build();
    IBMDiscoveryV1Models.Expansion expansion2 = new IBMDiscoveryV1Models.ExpansionBuilder()
      .inputTerms(expansion2InputTerms)
      .expandedTerms(expansion2ExpandedTerms)
      .build();
    IBMDiscoveryV1Models.Expansions expansions = new IBMDiscoveryV1Models.ExpansionsBuilder()
      .expansions(new List<IBMDiscoveryV1Models.Expansion> { expansion1, expansion2 })
      .build();

    IBMDiscoveryV1Models.CreateExpansionsOptions createOptions = new IBMDiscoveryV1Models.CreateExpansionsOptionsBuilder()
        .environmentId('environment_id')
        .collectionId('collection_id')
        .expansions(expansions)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    IBMDiscoveryV1Models.Expansions createResults = service.createExpansions(createOptions);

    System.assertEquals(expansion1, createResults.getExpansions().get(0));
    System.assertEquals(expansion2, createResults.getExpansions().get(1));
    Test.stopTest();
  }

  static testMethod void testListExpansions() {
    String body = IBMWatsonMockResponses.expansionsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> expansion1InputTerms = new List<String> { 'weekday', 'week day' };
    List<String> expansion1ExpandedTerms = new List<String> { 'monday', 'tuesday', 'wednesday', 'thursday', 'friday' };
    List<String> expansion2InputTerms = new List<String> { 'weekend', 'week end' };
    List<String> expansion2ExpandedTerms = new List<String> { 'saturday', 'sunday' };
    IBMDiscoveryV1Models.Expansion expansion1 = new IBMDiscoveryV1Models.ExpansionBuilder()
      .inputTerms(expansion1InputTerms)
      .expandedTerms(expansion1ExpandedTerms)
      .build();
    IBMDiscoveryV1Models.Expansion expansion2 = new IBMDiscoveryV1Models.ExpansionBuilder()
      .inputTerms(expansion2InputTerms)
      .expandedTerms(expansion2ExpandedTerms)
      .build();
    IBMDiscoveryV1Models.Expansions expansions = new IBMDiscoveryV1Models.ExpansionsBuilder()
      .expansions(new List<IBMDiscoveryV1Models.Expansion> { expansion1, expansion2 })
      .build();

    IBMDiscoveryV1Models.ListExpansionsOptions listOptions = new IBMDiscoveryV1Models.ListExpansionsOptionsBuilder()
        .environmentId('environment_id')
        .collectionId('collection_id')
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    IBMDiscoveryV1Models.Expansions listResults = service.listExpansions(listOptions);

    System.assertEquals(expansion1, listResults.getExpansions().get(0));
    System.assertEquals(expansion2, listResults.getExpansions().get(1));
    Test.stopTest();
  }

  static testMethod void testDeleteExpansions() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.DeleteExpansionsOptions deleteOptions = new IBMDiscoveryV1Models.DeleteExpansionsOptionsBuilder()
        .environmentId('environment_id')
        .collectionId('collection_id')
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    service.deleteExpansions(deleteOptions);

    Test.stopTest();
  }

  /**
   *  Test deleting the example with the given ID for the training data query.
   */
  static testMethod void testDeleteUserData() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customerId = 'salesforce_sdk_test_id';
    IBMDiscoveryV1Models.DeleteUserDataOptions options = new IBMDiscoveryV1Models.DeleteUserDataOptionsBuilder()
      .customerId(customerId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    service.deleteUserData(options);
    Test.stopTest();
  }

  static testMethod void testCredentialDetails() {
    Test.startTest();
    String clientId = 'client_id';
    String clientSecret = 'client_secret';
    String sourceType = 'salesforce';
    String enterpriseId = 'enterprise_id';
    String organizationUrl = 'organization_url';
    String passphrase = 'passphrase';
    String password = 'password';
    String privateKey = 'private_key';
    String publicKeyId = 'public_key_id';
    String siteCollectionPath = 'site_collection_path';
    String credentialType = 'username_password';
    String url = 'login.salesforce.com';
    String username = 'user@email.address';
    String gatewayId = 'gateway_id';
    String sourceVersion = 'source_version';
    String webApplicationUrl = 'web_application_url';
    String domain = 'domain';
    String accessKeyId = 'access_key_id';
    String endpoint = 'endpoint';
    String secretAccessKey = 'secret_access_key';

    IBMDiscoveryV1Models.CredentialDetails details = new IBMDiscoveryV1Models.CredentialDetailsBuilder()
      .clientId(clientId)
      .clientSecret(clientSecret)
      .credentialType(credentialType)
      .enterpriseId(enterpriseId)
      .organizationUrl(organizationUrl)
      .passphrase(passphrase)
      .password(password)
      .privateKey(privateKey)
      .publicKeyId(publicKeyId)
      .siteCollectionPath(siteCollectionPath)
      .url(url)
      .username(username)
      .gatewayId(gatewayId)
      .sourceVersion(sourceVersion)
      .webApplicationUrl(webApplicationUrl)
      .domain(domain)
      .accessKeyId(accessKeyId)
      .endpoint(endpoint)
      .secretAccessKey(secretAccessKey)
      .build();

    System.assertEquals(clientId, details.getClientId());
    System.assertEquals(clientSecret, details.getClientSecret());
    System.assertEquals(credentialType, details.getCredentialType());
    System.assertEquals(enterpriseId, details.getEnterpriseId());
    System.assertEquals(organizationUrl, details.getOrganizationUrl());
    System.assertEquals(passphrase, details.getPassphrase());
    System.assertEquals(password, details.getPassword());
    System.assertEquals(privateKey, details.getPrivateKey());
    System.assertEquals(publicKeyId, details.getPublicKeyId());
    System.assertEquals(siteCollectionPath, details.getSiteCollectionPath());
    System.assertEquals(url, details.getUrl());
    System.assertEquals(username, details.getUsername());
    System.assertEquals(gatewayId, details.getGatewayId());
    System.assertEquals(sourceVersion, details.getSourceVersion());
    System.assertEquals(webApplicationUrl, details.getWebApplicationUrl());
    System.assertEquals(domain, details.getDomain());
    System.assertEquals(accessKeyId, details.getAccessKeyId());
    System.assertEquals(endpoint, details.getEndpoint());
    System.assertEquals(secretAccessKey, details.getSecretAccessKey());
    Test.stopTest();
  }

  static testMethod void testCreateCredentials() {
    String body = IBMWatsonMockResponses.credentials();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String sourceType = 'salesforce';
    String credentialType = 'username_password';
    String url = 'login.salesforce.com';
    String username = 'user@email.address';
    String status = 'connected';
    IBMDiscoveryV1Models.CredentialDetails details = new IBMDiscoveryV1Models.CredentialDetailsBuilder()
      .clientId('client_id')
      .clientSecret('client_secret')
      .credentialType(credentialType)
      .enterpriseId('enterprise_id')
      .organizationUrl('organization_url')
      .passphrase('passphrase')
      .password('password')
      .privateKey('private_key')
      .publicKeyId('public_key_id')
      .siteCollectionPath('site_collection_path')
      .url(url)
      .username(username)
      .gatewayId('gateway_id')
      .sourceVersion('source_version')
      .webApplicationUrl('web_application_url')
      .domain('domain')
      .build();
    IBMDiscoveryV1Models.Credentials credentials = new IBMDiscoveryV1Models.CredentialsBuilder()
      .sourceType(sourceType)
      .credentialDetails(details)
      .status(status)
      .build();

    IBMDiscoveryV1Models.CreateCredentialsOptions options = new IBMDiscoveryV1Models.CreateCredentialsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .sourceType(sourceType)
      .credentials(credentials)
      .credentialDetails(details)
      .status(status)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Credentials credentialsResponse = service.createCredentials(options);

    System.assertEquals(sourceType, credentialsResponse.getSourceType());
    System.assertEquals(credentialType, credentialsResponse.getCredentialDetails().getCredentialType());
    System.assertEquals(url, credentialsResponse.getCredentialDetails().getUrl());
    System.assertEquals(username, credentialsResponse.getCredentialDetails().getUsername());
    System.assertEquals(status, credentialsResponse.getStatus());

    Test.stopTest();
  }

  static testMethod void testDeleteCredentials() {
    String body='';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.DeleteCredentialsOptions options = new IBMDiscoveryV1Models.DeleteCredentialsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .credentialId('credential_id')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();
    service.deleteCredentials(options);

    Test.stopTest();
  }

  static testMethod void testGetCredentials() {
    String body = IBMWatsonMockResponses.credentials();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.GetCredentialsOptions options = new IBMDiscoveryV1Models.GetCredentialsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .credentialId('credential_id')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Credentials credentialsResponse = service.getCredentials(options);

    System.assert(credentialsResponse != null);

    Test.stopTest();
  }

  static testMethod void testListCredentials() {
    String body = IBMWatsonMockResponses.credentialList();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV1Models.ListCredentialsOptions options = new IBMDiscoveryV1Models.ListCredentialsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.CredentialsList credentialsResponse = service.listCredentials(options);

    System.assert(credentialsResponse != null);

    Test.stopTest();
  }

  static testMethod void testUpdateCredentials() {
    String body = IBMWatsonMockResponses.credentials();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String sourceType = 'salesforce';
    String credentialType = 'username_password';
    String url = 'login.salesforce.com';
    String username = 'user@email.address';
    String status = 'connected';

    IBMDiscoveryV1Models.CredentialDetails newDetails = new IBMDiscoveryV1Models.CredentialDetailsBuilder()
      .clientId('client_id')
      .clientSecret('client_secret')
      .credentialType(credentialType)
      .enterpriseId('enterprise_id')
      .organizationUrl('organization_url')
      .passphrase('passphrase')
      .password('password')
      .privateKey('private_key')
      .publicKeyId('public_key_id')
      .siteCollectionPath('site_collection_path')
      .url(url)
      .username(username)
      .build();
    IBMDiscoveryV1Models.Credentials newCredentials = new IBMDiscoveryV1Models.CredentialsBuilder()
      .sourceType(sourceType)
      .credentialDetails(newDetails)
      .build();

    IBMDiscoveryV1Models.UpdateCredentialsOptions options = new IBMDiscoveryV1Models.UpdateCredentialsOptionsBuilder()
      .environmentId(ENVIRONMENT_ID)
      .credentialId('credential_id')
      .sourceType(sourceType)
      .credentials(newCredentials)
      .credentialDetails(newDetails)
      .status(status)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();
    IBMDiscoveryV1Models.Credentials credentialsResponse = service.updateCredentials(options);

    System.assertEquals(sourceType, credentialsResponse.getSourceType());
    System.assertEquals(credentialType, credentialsResponse.getCredentialDetails().getCredentialType());
    System.assertEquals(url, credentialsResponse.getCredentialDetails().getUrl());
    System.assertEquals(username, credentialsResponse.getCredentialDetails().getUsername());

    Test.stopTest();
  }

  static testMethod void testCreateEvent() {
    String body = IBMWatsonMockResponses.createEventResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String dateString = '"2017-07-14T12:55:40.652Z"';
    Datetime dateValue = (Datetime) JSON.deserialize('"2017-07-14T12:55:40.652Z"', Datetime.class);
    Long displayRank = 1L;
    String sessionToken = 'mock_session_token';
    String eventType = 'click';
    String collectionId = 'mock_collid';
    String documentId = 'mock_docid';
    String queryId = 'mock_queryid';

    IBMDiscoveryV1Models.EventData eventData = new IBMDiscoveryV1Models.EventDataBuilder()
      .environmentId(ENVIRONMENT_ID)
      .collectionId(collectionId)
      .documentId(documentId)
      .displayRank(displayRank)
      .sessionToken(sessionToken)
      .clientTimestamp(dateValue)
      .build();
    IBMDiscoveryV1Models.CreateEventOptions createEventOptions = new IBMDiscoveryV1Models.CreateEventOptionsBuilder()
      .xtype(eventType)
      .data(eventData)
      .build();
    createEventOptions = createEventOptions.newBuilder().build();
    IBMDiscoveryV1Models.CreateEventResponse response = service.createEvent(createEventOptions);

    System.assertEquals(eventType, response.getXtype());
    System.assertEquals(ENVIRONMENT_ID, response.getData().getEnvironmentId());
    System.assertEquals(collectionId, response.getData().getCollectionId());
    System.assertEquals(documentId, response.getData().getDocumentId());
    System.assertEquals(displayRank, response.getData().getDisplayRank());
    System.assertEquals(queryId, response.getData().getQueryId());
    System.assertEquals(sessionToken, response.getData().getSessionToken());

    Test.stopTest();
  }

  static testMethod void testGetMetricsEventRate() {
    String body = IBMWatsonMockResponses.metricResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String dateString = '"2017-07-14T12:55:40.652Z"';
    Datetime dateValue = (Datetime) JSON.deserialize('"2017-07-14T12:55:40.652Z"', Datetime.class);
    String interval = '1d';
    Long key = 1533513600000L;
    Datetime keyAsString = (Datetime) JSON.deserialize('"2018-08-05T20:00:00.000"', Datetime.class);
    Double eventRate = 0.0;
    String eventType = 'click';
    String resultType = 'document';

    IBMDiscoveryV1Models.GetMetricsEventRateOptions options = new IBMDiscoveryV1Models.GetMetricsEventRateOptionsBuilder()
      .startTime(dateValue)
      .endTime(dateValue)
      .resultType(resultType)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();

    IBMDiscoveryV1Models.MetricResponse response = service.getMetricsEventRate(options);

    System.assert(!response.getAggregations().isEmpty());
    System.assertEquals(interval, response.getAggregations().get(0).getInterval());
    System.assertEquals(eventType, response.getAggregations().get(0).getEventType());
    System.assert(!response.getAggregations().get(0).getResults().isEmpty());
    System.assertEquals(key, response.getAggregations().get(0).getResults().get(0).getKey());
    System.assertEquals(keyAsString, response.getAggregations().get(0).getResults().get(0).getKeyAsString());
    System.assertEquals(eventRate, response.getAggregations().get(0).getResults().get(0).getEventRate());

    Test.stopTest();
  }

  static testMethod void testGetMetricsQuery() {
    String body = IBMWatsonMockResponses.metricResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String dateString = '"2017-07-14T12:55:40.652Z"';
    Datetime dateValue = (Datetime) JSON.deserialize('"2017-07-14T12:55:40.652Z"', Datetime.class);
    String interval = '1d';
    Long key = 1533513600000L;
    Datetime keyAsString = (Datetime) JSON.deserialize('"2018-08-05T20:00:00.000"', Datetime.class);
    Double eventRate = 0.0;
    String eventType = 'click';
    String resultType = 'document';

    IBMDiscoveryV1Models.GetMetricsQueryOptions options = new IBMDiscoveryV1Models.GetMetricsQueryOptionsBuilder()
      .startTime(dateValue)
      .endTime(dateValue)
      .resultType(resultType)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();

    IBMDiscoveryV1Models.MetricResponse response = service.getMetricsQuery(options);

    System.assert(!response.getAggregations().isEmpty());
    System.assertEquals(interval, response.getAggregations().get(0).getInterval());
    System.assertEquals(eventType, response.getAggregations().get(0).getEventType());
    System.assert(!response.getAggregations().get(0).getResults().isEmpty());
    System.assertEquals(key, response.getAggregations().get(0).getResults().get(0).getKey());
    System.assertEquals(keyAsString, response.getAggregations().get(0).getResults().get(0).getKeyAsString());
    System.assertEquals(eventRate, response.getAggregations().get(0).getResults().get(0).getEventRate());

    Test.stopTest();
  }

  static testMethod void testGetMetricsQueryEvent() {
    String body = IBMWatsonMockResponses.metricResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String dateString = '"2017-07-14T12:55:40.652Z"';
    Datetime dateValue = (Datetime) JSON.deserialize('"2017-07-14T12:55:40.652Z"', Datetime.class);
    String interval = '1d';
    Long key = 1533513600000L;
    Datetime keyAsString = (Datetime) JSON.deserialize('"2018-08-05T20:00:00.000"', Datetime.class);
    Double eventRate = 0.0;
    String eventType = 'click';
    String resultType = 'document';

    IBMDiscoveryV1Models.GetMetricsQueryEventOptions options = new IBMDiscoveryV1Models.GetMetricsQueryEventOptionsBuilder()
      .startTime(dateValue)
      .endTime(dateValue)
      .resultType(resultType)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();

    IBMDiscoveryV1Models.MetricResponse response = service.getMetricsQueryEvent(options);

    System.assert(!response.getAggregations().isEmpty());
    System.assertEquals(interval, response.getAggregations().get(0).getInterval());
    System.assertEquals(eventType, response.getAggregations().get(0).getEventType());
    System.assert(!response.getAggregations().get(0).getResults().isEmpty());
    System.assertEquals(key, response.getAggregations().get(0).getResults().get(0).getKey());
    System.assertEquals(keyAsString, response.getAggregations().get(0).getResults().get(0).getKeyAsString());
    System.assertEquals(eventRate, response.getAggregations().get(0).getResults().get(0).getEventRate());

    Test.stopTest();
  }

  static testMethod void testGetMetricsQueryNoResults() {
    String body = IBMWatsonMockResponses.metricResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String dateString = '"2017-07-14T12:55:40.652Z"';
    Datetime dateValue = (Datetime) JSON.deserialize('"2017-07-14T12:55:40.652Z"', Datetime.class);
    String interval = '1d';
    Long key = 1533513600000L;
    Datetime keyAsString = (Datetime) JSON.deserialize('"2018-08-05T20:00:00.000"', Datetime.class);
    Double eventRate = 0.0;
    String eventType = 'click';
    String resultType = 'document';

    IBMDiscoveryV1Models.GetMetricsQueryNoResultsOptions options = new IBMDiscoveryV1Models.GetMetricsQueryNoResultsOptionsBuilder()
      .startTime(dateValue)
      .endTime(dateValue)
      .resultType(resultType)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();

    IBMDiscoveryV1Models.MetricResponse response = service.getMetricsQueryNoResults(options);

    System.assert(!response.getAggregations().isEmpty());
    System.assertEquals(interval, response.getAggregations().get(0).getInterval());
    System.assertEquals(eventType, response.getAggregations().get(0).getEventType());
    System.assert(!response.getAggregations().get(0).getResults().isEmpty());
    System.assertEquals(key, response.getAggregations().get(0).getResults().get(0).getKey());
    System.assertEquals(keyAsString, response.getAggregations().get(0).getResults().get(0).getKeyAsString());
    System.assertEquals(eventRate, response.getAggregations().get(0).getResults().get(0).getEventRate());

    Test.stopTest();
  }

  static testMethod void testGetMetricsQueryTokenEvent() {
    String body = IBMWatsonMockResponses.metricTokenResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    Long count = 10L;
    String key = 'beat';
    Double eventRate = 0.0;
    Long matchingResults = 117L;
    String eventType = 'click';

    IBMDiscoveryV1Models.GetMetricsQueryTokenEventOptions options = new IBMDiscoveryV1Models.GetMetricsQueryTokenEventOptionsBuilder()
      .count(count)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();

    IBMDiscoveryV1Models.MetricTokenResponse response = service.getMetricsQueryTokenEvent(options);

    System.assert(!response.getAggregations().isEmpty());
    System.assertEquals(eventType, response.getAggregations().get(0).getEventType());
    System.assert(!response.getAggregations().get(0).getResults().isEmpty());
    System.assertEquals(key, response.getAggregations().get(0).getResults().get(0).getKey());
    System.assertEquals(matchingResults, response.getAggregations().get(0).getResults().get(0).getMatchingResults());
    System.assertEquals(eventRate, response.getAggregations().get(0).getResults().get(0).getEventRate());

    Test.stopTest();
  }

  static testMethod void testQueryLog() {
    String body = IBMWatsonMockResponses.logQueryResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    List<String> sortList = new List<String> { 'field_a' };
    String extraSort = 'field_b';
    String filter = 'filter';
    String naturalLanguageQuery = 'Who beat Ken Jennings in Jeopardy!';
    Long count = 5L;
    Long offset = 5L;
    Long matchingResults = 2L;
    String customerId = '';
    String sessionToken = 'mock_session_token';
    String eventType = 'query';
    Long resultCount = 0L;
    String dateString = '"2017-07-14T12:55:40.652Z"';
    Datetime dateValue = (Datetime) JSON.deserialize('"2017-07-14T12:55:40.652Z"', Datetime.class);
    String queryId = 'mock_queryid';

    IBMDiscoveryV1Models.QueryLogOptions options = new IBMDiscoveryV1Models.QueryLogOptionsBuilder()
      .xSort(sortList)
      .addXSort(extraSort)
      .count(count)
      .filter(filter)
      .offset(offset)
      .query(naturalLanguageQuery)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    options = options.newBuilder().build();

    IBMDiscoveryV1Models.LogQueryResponse response = service.queryLog(options);

    System.assertEquals(matchingResults, response.getMatchingResults());
    System.assert(!response.getResults().isEmpty());
    System.assertEquals(ENVIRONMENT_ID, response.getResults().get(0).getEnvironmentId());
    System.assertEquals(customerId, response.getResults().get(0).getCustomerId());
    System.assertEquals(queryId, response.getResults().get(0).getQueryId());
    System.assertEquals(sessionToken, response.getResults().get(0).getSessionToken());
    System.assertEquals(eventType, response.getResults().get(0).getEventType());
    System.assert(response.getResults().get(0).getDocumentResults().getResults() != null);
    System.assertEquals(resultCount, response.getResults().get(0).getDocumentResults().getCount());

    Test.stopTest();
  }

  static testMethod void testTokenDictRule() {
    Test.startTest();

    String text = 'text';
    String partOfSpeech = 'noun';
    List<String> readings = new List<String> { 'reading 1', 'reading 2' };
    List<String> tokens = new List<String> { 'token 1', 'token 2' };

    IBMDiscoveryV1Models.TokenDictRule tokenDictRule = new IBMDiscoveryV1Models.TokenDictRuleBuilder()
      .text(text)
      .partOfSpeech(partOfSpeech)
      .readings(readings)
      .tokens(tokens)
      .build();

    System.assertEquals(text, tokenDictRule.getText());
    System.assertEquals(partOfSpeech, tokenDictRule.getPartOfSpeech());
    System.assertEquals(readings, tokenDictRule.getReadings());
    System.assertEquals(tokens, tokenDictRule.getTokens());

    Test.stopTest();
  }

  static testMethod void testCreateTokenizationDictionaryOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    IBMDiscoveryV1Models.TokenDictRule firstTokenDictRule = new IBMDiscoveryV1Models.TokenDictRuleBuilder()
      .text(TEXT)
      .tokens(TOKENS)
      .partOfSpeech(PART_OF_SPEECH)
      .build();
    IBMDiscoveryV1Models.TokenDictRule secondTokenDictRule = new IBMDiscoveryV1Models.TokenDictRuleBuilder()
      .text(TEXT)
      .tokens(TOKENS)
      .partOfSpeech(PART_OF_SPEECH)
      .build();
    List<IBMDiscoveryV1Models.TokenDictRule> tokenDictRuleList = new List<IBMDiscoveryV1Models.TokenDictRule>();
    tokenDictRuleList.add(firstTokenDictRule);

    IBMDiscoveryV1Models.CreateTokenizationDictionaryOptions createOptions = new IBMDiscoveryV1Models.CreateTokenizationDictionaryOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .tokenizationRules(tokenDictRuleList)
      .addTokenizationRules(secondTokenDictRule)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    createOptions = createOptions.newBuilder().build();

    tokenDictRuleList.add(secondTokenDictRule);

    System.assertEquals(environmentId, createOptions.environmentId());
    System.assertEquals(collectionId, createOptions.collectionId());
    System.assertEquals(tokenDictRuleList, createOptions.tokenizationRules());

    Test.stopTest(); 
  }

  static testMethod void testGetTokenizationDictionaryStatusOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    IBMDiscoveryV1Models.GetTokenizationDictionaryStatusOptions getOptions = new IBMDiscoveryV1Models.GetTokenizationDictionaryStatusOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    getOptions = getOptions.newBuilder().build();

    System.assertEquals(environmentId, getOptions.environmentId());
    System.assertEquals(collectionId, getOptions.collectionId());

    Test.stopTest();
  }

  static testMethod void testDeleteTokenizationDictionaryOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    IBMDiscoveryV1Models.DeleteTokenizationDictionaryOptions deleteOptions = new IBMDiscoveryV1Models.DeleteTokenizationDictionaryOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    deleteOptions = deleteOptions.newBuilder().build();

    System.assertEquals(environmentId, deleteOptions.environmentId());
    System.assertEquals(collectionId, deleteOptions.collectionId());

    Test.stopTest();
  }

  static testMethod void testCreateTokenizationDictionary() {
    String body = IBMWatsonMockResponses.tokenDictStatusResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    IBMDiscoveryV1Models.TokenDictRule tokenDictRule = new IBMDiscoveryV1Models.TokenDictRuleBuilder()
      .text(TEXT)
      .tokens(TOKENS)
      .partOfSpeech(PART_OF_SPEECH)
      .build();

    IBMDiscoveryV1Models.CreateTokenizationDictionaryOptions createOptions = new IBMDiscoveryV1Models.CreateTokenizationDictionaryOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .tokenizationRules(new List<IBMDiscoveryV1Models.TokenDictRule> { tokenDictRule })
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    createOptions = createOptions.newBuilder().build();
    IBMDiscoveryV1Models.TokenDictStatusResponse response = service.createTokenizationDictionary(createOptions);

    System.assertEquals('active', response.getStatus());
    System.assertEquals('tokenization_dictionary', response.getXtype());

    Test.stopTest();
  }

  static testMethod void testGetTokenizationDictionaryStatus() {
    String body = IBMWatsonMockResponses.tokenDictStatusResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    IBMDiscoveryV1Models.GetTokenizationDictionaryStatusOptions getOptions = new IBMDiscoveryV1Models.GetTokenizationDictionaryStatusOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    IBMDiscoveryV1Models.TokenDictStatusResponse response = service.getTokenizationDictionaryStatus(getOptions);

    System.assertEquals('active', response.getStatus());
    System.assertEquals('tokenization_dictionary', response.getXtype());

    Test.stopTest();
  }

  static testMethod void testDeleteTokenizationDictionary() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    IBMDiscoveryV1Models.DeleteTokenizationDictionaryOptions deleteOptions = new IBMDiscoveryV1Models.DeleteTokenizationDictionaryOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteTokenizationDictionary(deleteOptions);

    Test.stopTest();
  }

  static testMethod void testCreateStopwordListOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    String testFilename = 'test_filename';
    IBMWatsonFile testfile= new IBMWatsonFile.FileBuilder()
      .body(Blob.valueOf('test string'))
      .contentType('text/plain')
      .build();

    IBMDiscoveryV1Models.CreateStopwordListOptions createStopwordListOptions = new IBMDiscoveryV1Models.CreateStopwordListOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .stopwordFile(testfile)
      .stopwordFilename(testFilename)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    createStopwordListOptions = createStopwordListOptions.newBuilder().build();

    System.assertEquals(environmentId, createStopwordListOptions.environmentId());
    System.assertEquals(collectionId, createStopwordListOptions.collectionId());
    System.assertEquals(testfile, createStopwordListOptions.stopwordFile());
    System.assertEquals(testFilename, createStopwordListOptions.stopwordFilename());

    Test.stopTest();
  }

  static testMethod void testCreateStopwordList() {
    String body = IBMWatsonMockResponses.tokenDictStatusResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';
    String testFilename = 'test_filename';
    IBMWatsonFile testfile= new IBMWatsonFile.FileBuilder()
      .body(Blob.valueOf('test string'))
      .contentType('text/plain')
      .build();

    IBMDiscoveryV1Models.CreateStopwordListOptions createStopwordListOptions = new IBMDiscoveryV1Models.CreateStopwordListOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .stopwordFile(testfile)
      .stopwordFilename(testFilename)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    createStopwordListOptions = createStopwordListOptions.newBuilder().build();
    IBMDiscoveryV1Models.TokenDictStatusResponse response = service.createStopwordList(createStopwordListOptions);

    System.assertEquals('active', response.getStatus());
    System.assertEquals('tokenization_dictionary', response.getXtype());

    Test.stopTest();
  }

  static testMethod void testDeleteStopwordListOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';

    IBMDiscoveryV1Models.DeleteStopwordListOptions deleteStopwordListOptions = new IBMDiscoveryV1Models.DeleteStopwordListOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    deleteStopwordListOptions = deleteStopwordListOptions.newBuilder().build();

    System.assertEquals(environmentId, deleteStopwordListOptions.environmentId());
    System.assertEquals(collectionId, deleteStopwordListOptions.collectionId());

    Test.stopTest();
  }

  static testMethod void testDeleteStopwordList() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';

    IBMDiscoveryV1Models.DeleteStopwordListOptions deleteStopwordListOptions = new IBMDiscoveryV1Models.DeleteStopwordListOptionsBuilder()
      .environmentId(environmentId)
      .collectionId(collectionId)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    deleteStopwordListOptions = deleteStopwordListOptions.newBuilder().build();
    service.deleteStopwordList(deleteStopwordListOptions);

    Test.stopTest();
  }

  static testMethod void testGetStopwordListStatusOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';

    IBMDiscoveryV1Models.GetStopwordListStatusOptions getStopwordListStatusOptions = new IBMDiscoveryV1Models.GetStopwordListStatusOptionsBuilder()
        .environmentId(environmentId)
        .collectionId(collectionId)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    getStopwordListStatusOptions = getStopwordListStatusOptions.newBuilder().build();

    System.assertEquals(environmentId, getStopwordListStatusOptions.environmentId());
    System.assertEquals(collectionId, getStopwordListStatusOptions.collectionId());

    Test.stopTest();
  }

  static testMethod void testGetStopwordListStatus() {
    String body = IBMWatsonMockResponses.tokenDictStatusResponseStopwords();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String collectionId = 'collection_id';

    IBMDiscoveryV1Models.GetStopwordListStatusOptions getStopwordListStatusOptions = new IBMDiscoveryV1Models.GetStopwordListStatusOptionsBuilder()
        .environmentId(environmentId)
        .collectionId(collectionId)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    IBMDiscoveryV1Models.TokenDictStatusResponse response = service.getStopwordListStatus(getStopwordListStatusOptions);

    System.assertEquals('active', response.getStatus());
    System.assertEquals('stopwords', response.getXtype());

    Test.stopTest();
  }

  static testMethod void testCreateGatewayOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String name = 'name';

    IBMDiscoveryV1Models.CreateGatewayOptions createGatewayOptions = new IBMDiscoveryV1Models.CreateGatewayOptionsBuilder()
        .environmentId(environmentId)
        .name(name)
        .build();
    createGatewayOptions = createGatewayOptions.newBuilder().build();

    System.assertEquals(environmentId, createGatewayOptions.environmentId());
    System.assertEquals(name, createGatewayOptions.name());

    Test.stopTest();
  }

  static testMethod void testCreateGateway() {
    String body = IBMWatsonMockResponses.gatewayResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String name = 'name';

    String gatewayId = 'gateway_id';
    String status = 'connected';
    String token = 'token';
    String tokenId = 'token_id';

    IBMDiscoveryV1Models.CreateGatewayOptions createGatewayOptions = new IBMDiscoveryV1Models.CreateGatewayOptionsBuilder()
        .environmentId(environmentId)
        .name(name)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    IBMDiscoveryV1Models.Gateway response = service.createGateway(createGatewayOptions);

    System.assertEquals(gatewayId, response.getGatewayId());
    System.assertEquals(name, response.getName());
    System.assertEquals(status, response.getStatus());
    System.assertEquals(token, response.getToken());
    System.assertEquals(tokenId, response.getTokenId());

    Test.stopTest();
  }

  static testMethod void testDeleteGatewayOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String gatewayId = 'gateway_id';

    IBMDiscoveryV1Models.DeleteGatewayOptions deleteGatewayOptions = new IBMDiscoveryV1Models.DeleteGatewayOptionsBuilder()
        .environmentId(environmentId)
        .gatewayId(gatewayId)
        .build();
    deleteGatewayOptions = deleteGatewayOptions.newBuilder().build();

    System.assertEquals(environmentId, deleteGatewayOptions.environmentId());
    System.assertEquals(gatewayId, deleteGatewayOptions.gatewayId());

    Test.stopTest();
  }

  static testMethod void testDeleteGateway() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String gatewayId = 'gateway_id';

    IBMDiscoveryV1Models.DeleteGatewayOptions deleteGatewayOptions = new IBMDiscoveryV1Models.DeleteGatewayOptionsBuilder()
        .environmentId(environmentId)
        .gatewayId(gatewayId)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    service.deleteGateway(deleteGatewayOptions);

    Test.stopTest();
  }

  static testMethod void testGetGatewayOptions() {
    Test.startTest();

    String environmentId = 'environment_id';
    String gatewayId = 'gateway_id';

    IBMDiscoveryV1Models.GetGatewayOptions getGatewayOptions = new IBMDiscoveryV1Models.GetGatewayOptionsBuilder()
        .environmentId(environmentId)
        .gatewayId(gatewayId)
        .build();
    getGatewayOptions = getGatewayOptions.newBuilder().build();

    System.assertEquals(environmentId, getGatewayOptions.environmentId());
    System.assertEquals(gatewayId, getGatewayOptions.gatewayId());

    Test.stopTest();
  }

  static testMethod void testGetGateway() {
    String body = IBMWatsonMockResponses.gatewayResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';
    String gatewayId = 'gateway_id';

    String name = 'name';
    String status = 'connected';
    String token = 'token';
    String tokenId = 'token_id';

    IBMDiscoveryV1Models.GetGatewayOptions getGatewayOptions = new IBMDiscoveryV1Models.GetGatewayOptionsBuilder()
        .environmentId(environmentId)
        .gatewayId(gatewayId)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    IBMDiscoveryV1Models.Gateway response = service.getGateway(getGatewayOptions);

    System.assertEquals(gatewayId, response.getGatewayId());
    System.assertEquals(name, response.getName());
    System.assertEquals(status, response.getStatus());
    System.assertEquals(token, response.getToken());
    System.assertEquals(tokenId, response.getTokenId());

    Test.stopTest();
  }

  static testMethod void testListGatewaysOptions() {
    Test.startTest();

    String environmentId = 'environment_id';

    IBMDiscoveryV1Models.ListGatewaysOptions listGatewaysOptions = new IBMDiscoveryV1Models.ListGatewaysOptionsBuilder()
        .environmentId(environmentId)
        .build();
    listGatewaysOptions = listGatewaysOptions.newBuilder().build();

    System.assertEquals(environmentId, listGatewaysOptions.environmentId());

    Test.stopTest();
  }

  static testMethod void testListGateways() {
    String body = IBMWatsonMockResponses.listGatewaysResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String environmentId = 'environment_id';

    String gatewayId = 'gateway_id_1';
    String name = 'name';
    String status = 'connected';
    String token = 'token';
    String tokenId = 'token_id';

    IBMDiscoveryV1Models.ListGatewaysOptions listGatewaysOptions = new IBMDiscoveryV1Models.ListGatewaysOptionsBuilder()
        .environmentId(environmentId)
        .addHeader(HEADER_KEY, HEADER_VAL)
        .build();
    IBMDiscoveryV1Models.GatewayList response = service.listGateways(listGatewaysOptions);

    System.assertEquals(gatewayId, response.getGateways().get(0).getGatewayId());
    System.assertEquals(name, response.getGateways().get(0).getName());
    System.assertEquals(status, response.getGateways().get(0).getStatus());
    System.assertEquals(token, response.getGateways().get(0).getToken());
    System.assertEquals(tokenId, response.getGateways().get(0).getTokenId());

    Test.stopTest();
  }

  static testMethod void testSourceOptionsWebCrawl() {
    Test.startTest();
    String url = 'url';
    String crawlSpeed = 'crawl_speed';
    Long maximumHops = 1L;
    Long requestTimeout = 2000L;
    List<String> blacklist = new List<String>{ 'badsite.com' };

    IBMDiscoveryV1Models.SourceOptionsWebCrawl sourceOptionsWebCrawl = new IBMDiscoveryV1Models.SourceOptionsWebCrawlBuilder()
      .url(url)
      .limitToStartingHosts(true)
      .crawlSpeed(crawlSpeed)
      .allowUntrustedCertificate(true)
      .maximumHops(maximumHops)
      .requestTimeout(requestTimeout)
      .overrideRobotsTxt(true)
      .blacklist(blacklist)
      .build();

    System.assertEquals(url, sourceOptionsWebCrawl.getUrl());
    System.assert(sourceOptionsWebCrawl.getLimitToStartingHosts());
    System.assertEquals(crawlSpeed, sourceOptionsWebCrawl.getCrawlSpeed());
    System.assert(sourceOptionsWebCrawl.getAllowUntrustedCertificate());
    System.assertEquals(maximumHops, sourceOptionsWebCrawl.getMaximumHops());
    System.assertEquals(requestTimeout, sourceOptionsWebCrawl.getRequestTimeout());
    System.assert(sourceOptionsWebCrawl.getOverrideRobotsTxt());
    System.assertEquals(blacklist, sourceOptionsWebCrawl.getBlacklist());
    Test.stopTest();
  }

  static testMethod void testSourceOptionsBuckets() {
    Test.startTest();
    String name = 'name';
    Long testLimit = 9000L;

    IBMDiscoveryV1Models.SourceOptionsBuckets sourceOptionsBuckets = new IBMDiscoveryV1Models.SourceOptionsBucketsBuilder()
      .name(name)
      .xlimit(testLimit)
      .build();

    System.assertEquals(name, sourceOptionsBuckets.getName());
    System.assertEquals(testLimit, sourceOptionsBuckets.getXlimit());
    Test.stopTest();
  }

  static testMethod void testSourceOptions() {
    Test.startTest();
    String folderOwnerUserId = 'folder_owner_user_id';
    String folderId = 'folder_id';
    Long testLimit = 10L;
    String objectName = 'object_name';
    String siteCollectionPath = 'site_collection_path';
    String url = 'url';
    Long maximumHops = 5L;
    Long requestTimeout = 2L;
    String bucketName = 'bucket_name';
    String crawlSpeed = 'aggressive';

    IBMDiscoveryV1Models.SourceOptionsFolder folder = new IBMDiscoveryV1Models.SourceOptionsFolderBuilder()
      .ownerUserId(folderOwnerUserId)
      .folderId(folderId)
      .xlimit(testLimit)
      .build();
    IBMDiscoveryV1Models.SourceOptionsObject sourceObject = new IBMDiscoveryV1Models.SourceOptionsObjectBuilder()
      .name(objectName)
      .xlimit(testLimit)
      .build();
    IBMDiscoveryV1Models.SourceOptionsSiteColl siteColl = new IBMDiscoveryV1Models.SourceOptionsSiteCollBuilder()
      .siteCollectionPath(siteCollectionPath)
      .xlimit(testLimit)
      .build();
    IBMDiscoveryV1Models.SourceOptionsWebCrawl webCrawl = new IBMDiscoveryV1Models.SourceOptionsWebCrawlBuilder()
      .url(url)
      .limitToStartingHosts(true)
      .crawlSpeed(crawlSpeed)
      .allowUntrustedCertificate(true)
      .maximumHops(maximumHops)
      .requestTimeout(requestTimeout)
      .overrideRobotsTxt(true)
      .build();
    IBMDiscoveryV1Models.SourceOptionsBuckets buckets = new IBMDiscoveryV1Models.SourceOptionsBucketsBuilder()
      .name(bucketName)
      .xlimit(testLimit)
      .build();
    IBMDiscoveryV1Models.SourceOptions sourceOptions = new IBMDiscoveryV1Models.SourceOptionsBuilder()
      .folders(new List<IBMDiscoveryV1Models.SourceOptionsFolder> { folder })
      .siteCollections(new List<IBMDiscoveryV1Models.SourceOptionsSiteColl> { siteColl })
      .urls(new List<IBMDiscoveryV1Models.SourceOptionsWebCrawl> { webCrawl })
      .buckets(new List<IBMDiscoveryV1Models.SourceOptionsBuckets> { buckets })
      .objects(new List<IBMDiscoveryV1Models.SourceOptionsObject> { sourceObject })
      .crawlAllBuckets(true)
      .build();

    System.assertEquals(folderOwnerUserId, sourceOptions.getFolders().get(0).getOwnerUserId());
    System.assertEquals(folderId, sourceOptions.getFolders().get(0).getFolderId());
    System.assertEquals(testLimit, sourceOptions.getFolders().get(0).getXlimit());
    System.assertEquals(objectName, sourceOptions.getObjects().get(0).getName());
    System.assertEquals(testLimit, sourceOptions.getObjects().get(0).getXlimit());
    System.assertEquals(siteCollectionPath, sourceOptions.getSiteCollections().get(0).getSiteCollectionPath());
    System.assertEquals(testLimit, sourceOptions.getSiteCollections().get(0).getXlimit());
    System.assertEquals(url, sourceOptions.getUrls().get(0).getUrl());
    System.assert(sourceOptions.getUrls().get(0).getLimitToStartingHosts());
    System.assertEquals(crawlSpeed, sourceOptions.getUrls().get(0).getCrawlSpeed());
    System.assert(sourceOptions.getUrls().get(0).getAllowUntrustedCertificate());
    System.assertEquals(maximumHops, sourceOptions.getUrls().get(0).getMaximumHops());
    System.assertEquals(requestTimeout, sourceOptions.getUrls().get(0).getRequestTimeout());
    System.assert(sourceOptions.getUrls().get(0).getOverrideRobotsTxt());
    System.assertEquals(bucketName, sourceOptions.getBuckets().get(0).getName());
    System.assertEquals(testLimit, sourceOptions.getBuckets().get(0).getXlimit());
    System.assert(sourceOptions.getCrawlAllBuckets());
    Test.stopTest();
  }

  static testMethod void testSourceStatus() {
    Test.startTest();

    String status = 'status';
    String dateString = '"2017-07-14T12:55:40.652Z"';
    Datetime dateValue = (Datetime) JSON.deserialize(dateString, Datetime.class);

    IBMDiscoveryV1Models.SourceStatus sourceStatus = new IBMDiscoveryV1Models.SourceStatus();
    sourceStatus.setStatus(status);
    sourceStatus.setNextCrawl(dateValue);

    System.assertEquals(status, sourceStatus.getStatus());
    System.assertEquals(dateValue, sourceStatus.getNextCrawl());

    Test.stopTest();
  }

  static testMethod void testCollectionCrawlStatus() {
    Test.startTest();

    IBMDiscoveryV1Models.SourceStatus sourceStatus = new IBMDiscoveryV1Models.SourceStatus();
    IBMDiscoveryV1Models.CollectionCrawlStatus crawlStatus = new IBMDiscoveryV1Models.CollectionCrawlStatus();
    crawlStatus.setSourceCrawl(sourceStatus);

    System.assertEquals(sourceStatus, crawlStatus.getSourceCrawl());

    Test.stopTest();
  }

  static testMethod void testSduStatus() {
    Test.startTest();

    Long annotatedPages = 1L;
    Long pages = 2L;
    Long documents = 3L;
    IBMDiscoveryV1Models.SduStatusCustomFields customFields = new IBMDiscoveryV1Models.SduStatusCustomFields();

    IBMDiscoveryV1Models.SduStatus sduStatus = new IBMDiscoveryV1Models.SduStatus();
    sduStatus.setEnabled(true);
    sduStatus.setTotalAnnotatedPages(annotatedPages);
    sduStatus.setTotalPages(pages);
    sduStatus.setTotalDocuments(documents);
    sduStatus.setCustomFields(customFields);

    System.assert(sduStatus.getEnabled());
    System.assertEquals(annotatedPages, sduStatus.getTotalAnnotatedPages());
    System.assertEquals(pages, sduStatus.getTotalPages());
    System.assertEquals(documents, sduStatus.getTotalDocuments());
    System.assertEquals(customFields, sduStatus.getCustomFields());

    Test.stopTest();
  }

  static testMethod void testSduStatusCustomFields() {
    Test.startTest();

    Long defined = 1L;
    Long maximumAllowed = 2L;

    IBMDiscoveryV1Models.SduStatusCustomFields customFields = new IBMDiscoveryV1Models.SduStatusCustomFields();
    customFields.setDefined(defined);
    customFields.setMaximumAllowed(maximumAllowed);

    System.assertEquals(defined, customFields.getDefined());
    System.assertEquals(maximumAllowed, customFields.getMaximumAllowed());

    Test.stopTest();
  }
}