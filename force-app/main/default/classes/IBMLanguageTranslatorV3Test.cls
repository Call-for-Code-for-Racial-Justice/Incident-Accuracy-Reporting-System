/*
 * (C) Copyright IBM Corp. 2018, 2020.
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
private class IBMLanguageTranslatorV3Test {
  private static String version;
  private static String headerKey;
  private static String headerVal;
  private static String documentId;
  private static String accept;
  private static String fileContentType;
  private static String source;
  private static String target;
  private static String modelId;
  private static String filename;
  private static String baseModelId;
  private static Long wordCount;
  private static Long characterCount;
  private static String dateString;
  private static Datetime dateValue;
  private static String status;

  private static IBMLanguageTranslatorV3 service;

  static {
    version = '2018-05-01';
    headerKey = 'Test-Header';
    headerVal = 'test_value';
    documentId = 'id';
    accept = IBMWatsonHttpMediaType.APPLICATION_PDF;
    fileContentType = IBMWatsonHttpMediaType.TEXT_PLAIN;
    source = 'en';
    target = 'es';
    modelId = 'model-id';
    filename = 'test-file.txt';
    baseModelId = 'en-es';
    wordCount = 1L;
    characterCount = 2L;
    dateString = '"2018-08-24T08:20:30.5Z"';
    dateValue = (Datetime) JSON.deserialize(dateString, Datetime.class);
    status = 'available';

    service = new IBMLanguageTranslatorV3('2018-05-01', new IBMWatsonNoAuthAuthenticator());
  }

  /**
   *  Test translate
   */
  static testMethod void testTranslate() {
    String body = IBMWatsonMockResponses.Translate();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    String modelId = '3e7dfdbe-f757-4150-afee-458e71eb93fb';
    String source = 'en';
    String target = 'es';
    IBMLanguageTranslatorV3Models.TranslateOptions translateOptions =
      new IBMLanguageTranslatorV3Models.TranslateOptionsBuilder()
      .source(source)
      .target(target)
      .modelId(modelId)
      .text(new List<String>{'Hello'})
      .addText('World')
      .addHeader(headerKey, headerVal)
      .build();
    translateOptions = translateOptions.newBuilder().build();
    IBMLanguageTranslatorV3Models.TranslationResult translate =
      service.translate(translateOptions);
    System.assertEquals(translate.getWordCount(), 1);
    System.assertEquals(translate.getCharacterCount(), 5);
    System.assert(translate.getTranslations() != null);
    IBMLanguageTranslatorV3Models.TranslateOptionsBuilder newTranslateOptionsBuilder =
      translateOptions.newBuilder();
    translate.setWordCount(4);
    translate.setCharacterCount(10);
    Test.stopTest();
  }

  /**
   *  Test identify
   */
  static testMethod void testIdentify() {
    String body = IBMWatsonMockResponses.ListIdentifiableLanguages();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMLanguageTranslatorV3Models.IdentifyOptions identifyOptions =
      new IBMLanguageTranslatorV3Models.IdentifyOptionsBuilder()
      .text('sample')
      .addHeader(headerKey, headerVal)
      .build();
    identifyOptions = identifyOptions.newBuilder().build();
    IBMLanguageTranslatorV3Models.IdentifiedLanguages identify =
      service.identify(identifyOptions);
    Test.stopTest();
  }

  /**
   *  Test Identifiable Languages
   */
  static testMethod void testListIdentifiableLanguages() {
    String body = IBMWatsonMockResponses.ListIdentifiableLanguages();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMLanguageTranslatorV3Models.ListIdentifiableLanguagesOptions listIdentifiableLanguagesOptions =
      new IBMLanguageTranslatorV3Models.ListIdentifiableLanguagesOptionsBuilder()
      .addHeader(headerKey, headerVal)
      .build();
    listIdentifiableLanguagesOptions = listIdentifiableLanguagesOptions.newBuilder().build();
    IBMLanguageTranslatorV3Models.IdentifiableLanguages listIdentifiableLanguages =
      service.listIdentifiableLanguages(listIdentifiableLanguagesOptions);

    List<IBMLanguageTranslatorV3Models.IdentifiableLanguage> languageList = listIdentifiableLanguages.getLanguages();
    System.assert(languageList != null && languageList.size() == 4);
    IBMLanguageTranslatorV3Models.IdentifiableLanguage IdentifiableLanguage;
    for (Integer i = 0; i < languageList.size(); i++) {
      if (languageList[i].getLanguage() == 'af' && languageList[i].getName() == 'Afrikaans' ) {
        IdentifiableLanguage = languageList[i];
        break;
      }
    }
    System.assert(IdentifiableLanguage != null);
    IdentifiableLanguage.setLanguage('es');
    IdentifiableLanguage.setName('Spanish');
    Test.stopTest();
  }

  /**
   *  Test create a model
   */
  static testMethod void testCreateModel() {
    String body = IBMWatsonMockResponses.CreateModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    // Forced Glossary
    Attachment forcedGlossaryAttachment = new Attachment(Body = Blob.valueOf('glossary'),
      Name='glossary.txt',
      Description='language glossary',
      ContentType='text/plain');
    IBMWatsonFile forcedGlossary = new IBMWatsonFile.FileBuilder()
      .attachment(forcedGlossaryAttachment)
      .build();
    // Parallel Corpus
    Attachment parallelCorpusAttachment = new Attachment(Body = Blob.valueOf('parallelCorpus'),
      Name='parallelCorpus.txt',
      Description='parallelCorpus',
      ContentType='text/plain');
    IBMWatsonFile parallelCorpus = new IBMWatsonFile.FileBuilder()
      .attachment(parallelCorpusAttachment)
      .build();
    IBMLanguageTranslatorV3Models.CreateModelOptions createModelOptions =
      new IBMLanguageTranslatorV3Models.CreateModelOptionsBuilder()
      .name('custom-english-to-spanish')
      .baseModelId('en-es')
      .forcedGlossary(forcedGlossary)
      .parallelCorpus(parallelCorpus)
      .addHeader(headerKey, headerVal)
      .build();
    createModelOptions = createModelOptions.newBuilder().build();
    IBMLanguageTranslatorV3Models.TranslationModel TranslationModel =
      service.createModel(createModelOptions);
    System.assertEquals(TranslationModel.getModelId(), '3e7dfdbe-f757-4150-afee-458e71eb93fb');
    // name is optionally returned and this mockup does not
    System.assert(String.isBlank(TranslationModel.getName()));
    System.assert(String.isBlank(TranslationModel.getSource()));
    System.assert(String.isBlank(TranslationModel.getTarget()));
    System.assert(String.isBlank(TranslationModel.getBaseModelId()));
    System.assert(String.isBlank(TranslationModel.getDomain()));
    TranslationModel.getCustomizable();
    TranslationModel.getDefaultModel();
    System.assert(String.isBlank(TranslationModel.getOwner()));
    System.assert(String.isBlank(TranslationModel.getStatus()));
    TranslationModel.setModelId('3e7dfdbe-f757-4150-afee-458e71eb93fb');
    TranslationModel.setName('custom-english-to-spanish');
    TranslationModel.setSource('en');
    TranslationModel.setTarget('es');
    TranslationModel.setBaseModelId('3e7dfdbe-f757-4150-afee-458e71eb93fb');
    TranslationModel.setDomain('travel');
    TranslationModel.setCustomizable(true);
    TranslationModel.setDefaultModel(true);
    TranslationModel.setOwner('74a239fa-f2db-42ef-8737-7bf74f49e35f');
    IBMLanguageTranslatorV3Models.CreateModelOptionsBuilder newCreateModelOptionsBuilder1 =
      createModelOptions.newBuilder();
    IBMLanguageTranslatorV3Models.CreateModelOptionsBuilder newCreateModelOptionsBuilder2 =
      new IBMLanguageTranslatorV3Models.CreateModelOptionsBuilder('en-es');
    Test.stopTest();
  }

  /**
   *  Test delete a model
   */
  static testMethod void testDeleteModel() {
    String body = IBMWatsonMockResponses.DeleteModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMLanguageTranslatorV3Models.DeleteModelOptions deleteModelOptions =
      new IBMLanguageTranslatorV3Models.DeleteModelOptionsBuilder()
      .modelId('3e7dfdbe-f757-4150-afee-458e71eb93fb')
      .addHeader(headerKey, headerVal)
      .build();
    deleteModelOptions = deleteModelOptions.newBuilder().build();
    service.deleteModel(deleteModelOptions);
    IBMLanguageTranslatorV3Models.DeleteModelOptionsBuilder newDeleteModelOptionsBuilder1 =
      deleteModelOptions.newBuilder();
    IBMLanguageTranslatorV3Models.DeleteModelOptionsBuilder newDeleteModelOptionsBuilder2 =
      new IBMLanguageTranslatorV3Models.DeleteModelOptionsBuilder('3e7dfdbe-f757-4150-afee-458e71eb93fb');
    Test.stopTest();
  }

  /**
   *  Test get model data
   */
  static testMethod void testGetModel() {
    String body = IBMWatsonMockResponses.GetModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMLanguageTranslatorV3Models.GetModelOptions getModelOptions =
      new IBMLanguageTranslatorV3Models.GetModelOptionsBuilder()
      .modelId('3e7dfdbe-f757-4150-afee-458e71eb93fb')
      .addHeader(headerKey, headerVal)
      .build();
    getModelOptions = getModelOptions.newBuilder().build();
    IBMLanguageTranslatorV3Models.TranslationModel getModel =
      service.getModel(getModelOptions);
    IBMLanguageTranslatorV3Models.GetModelOptionsBuilder newGetModelOptionsBuilder1 =
      getModelOptions.newBuilder();
    IBMLanguageTranslatorV3Models.GetModelOptionsBuilder newGetModelOptionsBuilder2 =
      new IBMLanguageTranslatorV3Models.GetModelOptionsBuilder('3e7dfdbe-f757-4150-afee-458e71eb93fb');
    Test.stopTest();
  }

  /**
   *  Test list model data
   */
  static testMethod void testListModels() {
    String body = IBMWatsonMockResponses.ListModels();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMLanguageTranslatorV3Models.ListModelsOptions listModelsOptions =
      new IBMLanguageTranslatorV3Models.ListModelsOptionsBuilder()
      .source('en')
      .target('es')
      .xDefault(false)
      .addHeader(headerKey, headerVal)
      .build();
    listModelsOptions = listModelsOptions.newBuilder().build();
    IBMLanguageTranslatorV3Models.TranslationModels listModels =
      service.listModels(listModelsOptions);
    IBMLanguageTranslatorV3Models.ListModelsOptionsBuilder newListModelsOptionsBuilder =
      listModelsOptions.newBuilder();
    Test.stopTest();
  }

  static testMethod void testDeleteDocumentOptions() {
    Test.startTest();

    IBMLanguageTranslatorV3Models.DeleteDocumentOptions options = new IBMLanguageTranslatorV3Models.DeleteDocumentOptionsBuilder()
      .documentId(documentId)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(documentId, options.documentId());

    Test.stopTest();
  }

  static testMethod void testGetDocumentStatusOptions() {
    Test.startTest();

    IBMLanguageTranslatorV3Models.GetDocumentStatusOptions options = new IBMLanguageTranslatorV3Models.GetDocumentStatusOptionsBuilder()
      .documentId(documentId)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(documentId, options.documentId());

    Test.stopTest();
  }

  static testMethod void testGetTranslatedDocumentOptions() {
    Test.startTest();

    IBMLanguageTranslatorV3Models.GetTranslatedDocumentOptions options = new IBMLanguageTranslatorV3Models.GetTranslatedDocumentOptionsBuilder()
      .documentId(documentId)
      .accept(accept)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(documentId, options.documentId());
    System.assertEquals(accept, options.accept());

    Test.stopTest();
  }

  static testMethod void testListDocumentsOptions() {
    Test.startTest();

    IBMLanguageTranslatorV3Models.ListDocumentsOptions options = new IBMLanguageTranslatorV3Models.ListDocumentsOptionsBuilder()
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assert(options != null);

    Test.stopTest();
  }

  static testMethod void testTranslateDocumentOptions() {
    Test.startTest();

    Attachment documentAttachment = new Attachment(Body = Blob.valueOf('words'),
      Name='document.txt',
      Description='document to be translated',
      ContentType='text/plain');
    IBMWatsonFile document = new IBMWatsonFile.FileBuilder()
      .attachment(documentAttachment)
      .build();

    IBMLanguageTranslatorV3Models.TranslateDocumentOptions options = new IBMLanguageTranslatorV3Models.TranslateDocumentOptionsBuilder()
      .file(document)
      .filename(filename)
      .fileContentType(fileContentType)
      .modelId(modelId)
      .source(source)
      .target(target)
      .documentId(documentId)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(document, options.file());
    System.assertEquals(filename, options.filename());
    System.assertEquals(fileContentType, options.fileContentType());
    System.assertEquals(modelId, options.modelId());
    System.assertEquals(source, options.source());
    System.assertEquals(target, options.target());
    System.assertEquals(documentId, options.documentId());

    Test.stopTest();
  }

  static testMethod void testTranslateDocument() {
    String body = IBMWatsonMockResponses.languageTranslatorDocumentStatus();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    Attachment documentAttachment = new Attachment(Body = Blob.valueOf('words'),
      Name='document.txt',
      Description='document to be translated',
      ContentType='text/plain');
    IBMWatsonFile document = new IBMWatsonFile.FileBuilder()
      .attachment(documentAttachment)
      .build();

    IBMLanguageTranslatorV3Models.TranslateDocumentOptions options = new IBMLanguageTranslatorV3Models.TranslateDocumentOptionsBuilder()
      .file(document)
      .filename(filename)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();
    IBMLanguageTranslatorV3Models.DocumentStatus response = service.translateDocument(options);

    System.assertEquals(documentId, response.getDocumentId());
    System.assertEquals(filename, response.getFilename());
    System.assertEquals(status, response.getStatus());
    System.assertEquals(modelId, response.getModelId());
    System.assertEquals(baseModelId, response.getBaseModelId());
    System.assertEquals(source, response.getSource());
    System.assertEquals(target, response.getTarget());
    System.assertEquals(dateValue, response.getCreated());
    System.assertEquals(dateValue, response.getCompleted());
    System.assertEquals(wordCount, response.getWordCount());
    System.assertEquals(characterCount, response.getCharacterCount());

    Test.stopTest();
  }

  static testMethod void testListDocuments() {
    String body = IBMWatsonMockResponses.listDocuments();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMLanguageTranslatorV3Models.ListDocumentsOptions options = new IBMLanguageTranslatorV3Models.ListDocumentsOptionsBuilder()
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();
    IBMLanguageTranslatorV3Models.DocumentList response = service.listDocuments(options);

    System.assert(response.getDocuments().size() > 0);

    Test.stopTest();
  }

  static testMethod void testGetDocumentStatus() {
    String body = IBMWatsonMockResponses.languageTranslatorDocumentStatus();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMLanguageTranslatorV3Models.GetDocumentStatusOptions options = new IBMLanguageTranslatorV3Models.GetDocumentStatusOptionsBuilder()
      .documentId(documentId)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();
    IBMLanguageTranslatorV3Models.DocumentStatus response = service.getDocumentStatus(options);

    System.assert(response != null);

    Test.stopTest();
  }

  static testMethod void testDeleteDocument() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMLanguageTranslatorV3Models.DeleteDocumentOptions options = new IBMLanguageTranslatorV3Models.DeleteDocumentOptionsBuilder()
      .documentId(documentId)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();
    service.deleteDocument(options);

    Test.stopTest();
  }
}