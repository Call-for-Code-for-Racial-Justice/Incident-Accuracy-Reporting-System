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

/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 *
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class IBMSpeechToTextV1Test {
  private static String URL = 'https://stream.watsonplatform.net/speech-to-text/api';
  private static String username = 'username';
  private static String password = 'password';
  private static String callbackBaseURL = 'https://ibmdf17-watson-dxhub.my.salesforce.com/';

  private static String headerKey;
  private static String headerVal;
  private static String contentType;
  private static String model;
  private static String callbackUrl;
  private static String events;
  private static String userToken;
  private static Long resultsTtl;
  private static String languageCustomizationId;
  private static String acousticCustomizationId;
  private static String baseModelVersion;
  private static Double customizationWeight;
  private static Long inactivityTimeout;
  private static List<String> keywords;
  private static Double keywordsThreshold;
  private static Long maxAlternatives;
  private static Double wordAlternativesThreshold;
  private static String customizationId;
  private static String grammarName;
  private static Double processingMetricsInterval;
  private static Double samplingInterval;
  private static Double endTime;
  private static Double signalToNoiseRatio;
  private static Double speechRatio;
  private static Double highFrequencyLoss;
  private static Double beginVal;
  private static Double endVal;
  private static Long count;
  private static Double received;
  private static Double seenByEngine;
  private static Double transcription;
  private static Double speakerLabels;
  private static Double wallClockSinceFirstByteReceived;
  private static String wordTypeToAdd;
  private static String customLanguageModelId;
  private static String description;
  private static String warningId;
  private static String updated;
  private static Double endOfPhraseSilenceTime;

  private static IBMSpeechToTextV1 service;

  static {
    headerKey = 'Test-Header';
    headerVal = 'test_val';
    contentType = IBMWatsonHttpMediaType.AUDIO_WAV;
    model = 'model';
    callbackUrl = 'callback.com';
    events = 'events';
    userToken = 'token';
    resultsTtl = 5L;
    languageCustomizationId = 'language-id';
    acousticCustomizationId = 'acoustic-id';
    baseModelVersion = 'v1';
    customizationWeight = 10.0;
    inactivityTimeout = 1000L;
    keywords = new List<String> { 'keyword1' };
    keywordsThreshold = 5.0;
    maxAlternatives = 50L;
    wordAlternativesThreshold = 3.0;
    customizationId = 'customization-id';
    grammarName = 'grammar';
    processingMetricsInterval = 15.0;
    samplingInterval = 0.1;
    endTime = 0.2;
    signalToNoiseRatio = 0.3;
    speechRatio = 0.4;
    highFrequencyLoss = 0.5;
    beginVal = 3.1;
    endVal = 6.2;
    count = 10L;
    received = 300.0;
    seenByEngine = 400.0;
    transcription = 500.0;
    speakerLabels = 600.0;
    wallClockSinceFirstByteReceived = 47.0;
    wordTypeToAdd = 'all';
    customLanguageModelId = 'custom-language-id';
    description = 'description';
    warningId = 'warning_id';
    updated = '2019-10-11T19:16:58.547Z';
    endOfPhraseSilenceTime = 2.0;

    service = new IBMSpeechToTextV1(new IBMWatsonNoAuthAuthenticator());
  }

  static testMethod void getModelTest() {
    String body = IBMWatsonMockResponses.speechToTextGetModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.GetModelOptions getModelOptions = new IBMSpeechToTextV1Models.GetModelOptionsBuilder('en-US_NarrowbandModel')
      .modelId('en-US_NarrowbandModel')
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.SpeechModel speechModel = service.getModel(getModelOptions);
    System.assertEquals(speechModel.getName(), 'en-US_NarrowbandModel');
    System.assertEquals(speechModel.getLanguage(), 'en-US');
    System.assertEquals(speechModel.getUrl(), 'https://stream.watsonplatform.net/speech-to-text/api/v1/models/en-US_NarrowbandModel');
    System.assertEquals(speechModel.getRate(),8000);
    System.assertEquals(speechModel.getdescription(), 'US English narrowband model.');
    System.assertEquals(speechModel.getSupportedFeatures().getCustomLanguageModel(),true);
    System.assertEquals(speechModel.getSupportedFeatures().getSpeakerLabels(),true);
    getModelOptions = getModelOptions.newBuilder().build();

    Test.stopTest();
  }

  static testMethod void listModelsTest() {
    String body = IBMWatsonMockResponses.speechToTextListModels();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.ListModelsOptions listModelsOptions = new IBMSpeechToTextV1Models.ListModelsOptionsBuilder()
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.SpeechModels speechModels = service.listModels(listModelsOptions);
    System.assertEquals(speechModels.getModels()[0].getName(), 'en-US_NarrowbandModel');
    System.assertEquals(speechModels.getModels()[0].getLanguage(), 'en-US');
    listModelsOptions = listModelsOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void createJobTest() {
    String body = IBMWatsonMockResponses.speechToTextCheckJobCreate();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMWatsonFile audioFile = new IBMWatsonFile.FileBuilder()
      .name('audioTestFile.mp3')
      .description('Test audio file')
      .contentType('audio/mp3')
      .body(blob.valueOf('Test string not an audio content'))
      .build();
    IBMSpeechToTextV1Models.CreateJobOptions createJobOptions = new IBMSpeechToTextV1Models.CreateJobOptionsBuilder()
      .audio(audioFile)
      .contentType('audio/mp3')
      .addKeywords('TestKeyword')
      .callbackUrl(callbackBaseURL)
      .events('recognitions.started,recognitions.completed,recognitions.failed')
      .userToken('TestUserToken')
      .resultsTtl(12)
      .model('en-US_BroadbandModel')
      .customizationId('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .acousticCustomizationId('825485d7-af3f-44e7-b1ea-76130dec8a61')
      .customizationWeight((double)0.4)
      .inactivityTimeout(5)
      .keywords(new List<String>{'KeywordTest1', 'KeywordTest2'})
      .keywordsThreshold((double)0.4)
      .maxAlternatives(10)
      .wordAlternativesThreshold((double)0.4)
      .wordConfidence(false)
      .timestamps(false)
      .profanityFilter(true)
      .smartFormatting(true)
      .speakerLabels(true)
      .baseModelVersion('version')
      .endOfPhraseSilenceTime(endOfPhraseSilenceTime)
      .splitTranscriptAtPhraseEnd(true)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.RecognitionJob createJob = service.createJob(createJobOptions);
    System.assertEquals(createJob.getUrl(), 'string');
    System.assertEquals(createJob.getId(), 'string');
    System.assertEquals(createJob.getStatus(), 'waiting');
    System.assertEquals(createJob.getCreated(), 'string');
    System.assertEquals(createJob.getUpdated(), 'string');
    System.assertEquals(createJob.getUserToken(), 'string');
    System.assertEquals(createJob.getresults()[0].getresults()[0].getXFinal(),true);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getAlternatives()[0].getTranscript(), 'string');
    System.assertEquals(createJob.getresults()[0].getresults()[0].getAlternatives()[0].getConfidence(),0);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getKeywordsResult().get('keyword')[0].getNormalizedText(), 'string');
    System.assertEquals(createJob.getresults()[0].getresults()[0].getKeywordsResult().get('keyword')[0].getStartTime(),0);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getKeywordsResult().get('keyword')[0].getEndTime(),0);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getKeywordsResult().get('keyword')[0].getConfidence(),0);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getWordAlternatives()[0].getStartTime(),0);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getWordAlternatives()[0].getEndTime(),0);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getWordAlternatives()[0].getAlternatives()[0].getConfidence(),0);
    System.assertEquals(createJob.getresults()[0].getresults()[0].getWordAlternatives()[0].getAlternatives()[0].getWord(), 'string');
    System.assertEquals('end_of_data', createJob.getResults().get(0).getResults().get(0).getEndOfUtterance());
    System.assertEquals(createJob.getresults()[0].getResultIndex(),0);
    System.assertEquals(createJob.getresults()[0].getSpeakerLabels()[0].getXfrom(),0);
    System.assertEquals(createJob.getresults()[0].getSpeakerLabels()[0].getTo(),0);
    System.assertEquals(createJob.getresults()[0].getSpeakerLabels()[0].getSpeaker(),0);
    System.assertEquals(createJob.getresults()[0].getSpeakerLabels()[0].getConfidence(),0);
    System.assertEquals(createJob.getresults()[0].getSpeakerLabels()[0].getXFinal(),true);
    System.assertEquals(createJob.getresults()[0].getWarnings()[0], 'string');
    System.assertEquals(createJob.getWarnings()[0], 'string');
    createJobOptions = createJobOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void checkJobTest() {
    String body = IBMWatsonMockResponses.speechToTextCheckJob();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.CheckJobOptionsBuilder CheckJobOptionsBuilder = new IBMSpeechToTextV1Models.CheckJobOptionsBuilder();
    IBMSpeechToTextV1Models.CheckJobOptions checkJobOptions = new IBMSpeechToTextV1Models.CheckJobOptionsBuilder('56d09f2c-e020-11e7-9ee3-33bf91161141')
      .id('56d09f2c-e020-11e7-9ee3-33bf91161141')
      .addHeader(headerKey, headerVal)
      .build();
    checkJobOptions = checkJobOptions.newBuilder().build();
    IBMSpeechToTextV1Models.RecognitionJob checkJob = service.checkJob(checkJobOptions);
    System.assertEquals(checkJob.getStatus(), 'failed');
    Test.stopTest();
  }

  static testMethod void checkJobsTest() {
    String body = IBMWatsonMockResponses.speechToTextCheckJobs();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.CheckJobsOptions checkJobsOptions = new IBMSpeechToTextV1Models.CheckJobsOptionsBuilder()
      .addHeader(headerKey, headerVal)
      .build();
    checkJobsOptions = checkJobsOptions.newBuilder().build();
    IBMSpeechToTextV1Models.RecognitionJobs checkJobs = service.checkJobs(checkJobsOptions);
    System.assertEquals(checkJobs.getRecognitions()[0].getStatus(), 'completed');
    Test.stopTest();
  }

  static testMethod void deleteJobTest() {
    String body = IBMWatsonMockResponses.speechToTextDeleteJob();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.DeleteJobOptions deleteJobOptions = new IBMSpeechToTextV1Models.DeleteJobOptionsBuilder('56d09f2c-e020-11e7-9ee3-33bf91161141')
      .id('56d09f2c-e020-11e7-9ee3-33bf91161141')
      .addHeader(headerKey, headerVal)
      .build();
    service.deleteJob(deleteJobOptions);
    deleteJobOptions = deleteJobOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void registerCallbackTest() {
    String body = IBMWatsonMockResponses.speechToTextRegisterCallback();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.RegisterCallbackOptions registerCallbackOptions = new IBMSpeechToTextV1Models.RegisterCallbackOptionsBuilder(callbackBaseURL)
      .callbackUrl(callbackBaseURL)
      .userSecret('UserSecretTest')
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.RegisterStatus registerCallback = service.registerCallback(registerCallbackOptions);
    System.assertEquals(registerCallback.getStatus(), 'created');
    System.assertEquals(registerCallback.getUrl(), 'https://ibmdf17-watson-dxhub.my.salesforce.com/');
    registerCallbackOptions = registerCallbackOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void unregisterCallbackTest() {
    String body = IBMWatsonMockResponses.speechToTextUnRegisterCallback();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.UnregisterCallbackOptions unregisterCallbackOptions = new IBMSpeechToTextV1Models.UnregisterCallbackOptionsBuilder(callbackBaseURL)
      .addHeader(headerKey, headerVal)
      .build();
    unregisterCallbackOptions = unregisterCallbackOptions.newBuilder().build();
    service.unregisterCallback(unregisterCallbackOptions);
    Test.stopTest();
  }

  static testMethod void createLanguageModelTest() {
    String body = IBMWatsonMockResponses.speechToTextCreateLanguageModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String name = 'custom_model';
    String baseModelName = 'en-US_BroadbandModel';
    IBMSpeechToTextV1Models.CreateLanguageModelOptions createLanguageModelOptions = new IBMSpeechToTextV1Models.CreateLanguageModelOptionsBuilder()
      .name(name)
      .baseModelName(baseModelName)
      .dialect('en-US')
      .description('model description')
      .addHeader(headerKey, headerVal)
      .build();
    createLanguageModelOptions = createLanguageModelOptions.newBuilder().build();
    IBMSpeechToTextV1Models.LanguageModel languageModel = service.createLanguageModel(createLanguageModelOptions);
    System.assertEquals(languageModel.getCustomizationId(), '74f4807e-b5ff-4866-824e-6bba1a84fe96');
    System.assertEquals(languageModel.getOwner(), '952e2069-9ece-48d8-96c9-0206b4473819');
    System.assertEquals(languageModel.getBaseModelName(), 'en-US_BroadbandModel');
    System.assertEquals(languageModel.getCreated(), '2017-12-11T17:57:06.654Z');
    System.assertEquals(languageModel.getName(), 'custom acoustic');
    System.assertEquals(languageModel.getDescription(), 'customization');
    System.assertEquals(languageModel.getProgress(),0);
    System.assertEquals(languageModel.getLanguage(), 'en-US');
    System.assertEquals(languageModel.getStatus(), 'ready');
    System.assertEquals(languageModel.getDialect(), 'customization');
    System.assertEquals(languageModel.getWarnings(), 'customization');
    Test.stopTest();
  }

  static testMethod void addWordTest() {
    String body = IBMWatsonMockResponses.speechToTextAddWord();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String wordName = 'tornado';
    IBMSpeechToTextV1Models.AddWordOptions addWordOptions = new IBMSpeechToTextV1Models.AddWordOptionsBuilder()
      .customizationId(customizationId)
      .wordName(wordName)
      .addSoundsLike('tornado')
      .word('tornado')
      .soundsLike(new List<String>{'tornado', 'hurricane'})
      .displayAs('tornado')
      .addHeader(headerKey, headerVal)
      .build();
    service.addWord(addWordOptions);
    addWordOptions = addWordOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void addWordsTest() {
    String body = IBMWatsonMockResponses.speechToTextAddWord();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    IBMSpeechToTextV1Models.CustomWord customWord = new IBMSpeechToTextV1Models.CustomWordBuilder()
      .word('tornado')
      .soundsLike(new List<String> { 'tornado', 'hurricane' })
      .displayAs('tornado')
      .build();
    IBMSpeechToTextV1Models.AddWordsOptions addWordsOptions = new IBMSpeechToTextV1Models.AddWordsOptionsBuilder()
      .customizationId(customizationId)
      .words(new List<IBMSpeechToTextV1Models.CustomWord> { customWord })
      .addHeader(headerKey, headerVal)
      .build();
    service.addWords(addWordsOptions);
    addWordsOptions = addWordsOptions.newBuilder().build();
    System.assertEquals(customWord.getSoundsLike().size(),2);
    System.assertEquals(customWord.getWord(), 'tornado');
    System.assertEquals(customWord.getDisplayAs(), 'tornado');
    Test.stopTest();
  }

  static testMethod void createAcousticModelTest() {
    String body = IBMWatsonMockResponses.speechToTextCreateAcousticModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String name = 'AccousticModelName';
    String baseModelName = 'en-US_BroadbandModel';
    IBMSpeechToTextV1Models.CreateAcousticModelOptions createAcousticModelOptions = new IBMSpeechToTextV1Models.CreateAcousticModelOptionsBuilder()
      .name(name)
      .baseModelName(baseModelName)
      .description('test')
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.AcousticModel AcousticModel = service.createAcousticModel(createAcousticModelOptions);
    createAcousticModelOptions = createAcousticModelOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void deleteLanguageModelTest() {
    String body = IBMWatsonMockResponses.speechToTextDeleteLanguageModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.DeleteLanguageModelOptions deleteLanguageModelOptions = new IBMSpeechToTextV1Models.DeleteLanguageModelOptionsBuilder('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .customizationId('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .addHeader(headerKey, headerVal)
      .build();
    service.deleteLanguageModel(deleteLanguageModelOptions);
    deleteLanguageModelOptions = deleteLanguageModelOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void addAudioTest() {
    String body = IBMWatsonMockResponses.speechToTextAddAudio();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMWatsonFile audio = new IBMWatsonFile.FileBuilder()
      .name('audioTestFile.mp3')
      .description('Test audio file')
      .contentType('audio/mp3')
      .body(blob.valueOf('Test string not an audio content'))
      .build();
    String audioName = 'audio';
    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    IBMSpeechToTextV1Models.AddAudioOptions addAudioOptions = new IBMSpeechToTextV1Models.AddAudioOptionsBuilder()
      .audioResource(audio)
      .contentType('audio/mp3')
      .customizationId(customizationId)
      .audioName(audioName)
      .containedContentType('audio/mp3')
      .allowOverwrite(false)
      .addHeader(headerKey, headerVal)
      .build();
    service.addAudio(addAudioOptions);
    addAudioOptions = addAudioOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void getLanguageModelTest() {
    String body = IBMWatsonMockResponses.speechToTextGetLanguageModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.GetLanguageModelOptions getLanguageModelOptions = new IBMSpeechToTextV1Models.GetLanguageModelOptionsBuilder('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .customizationId('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.LanguageModel languageModel = service.getLanguageModel(getLanguageModelOptions);
    System.assertEquals(languageModel.getCustomizationId(), 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5');
    System.assertEquals(languageModel.getOwner(), '952e2069-9ece-48d8-96c9-0206b4473819');
    System.assertEquals(languageModel.getBaseModelName(), 'en-US_BroadbandModel');
    System.assertEquals(languageModel.getCreated(), '2017-12-11T17:50:11.862Z');
    System.assertEquals(languageModel.getName(), 'custom_en_US');
    System.assertEquals(languageModel.getDescription(), 'language customization');
    System.assertEquals(languageModel.getProgress(),100);
    System.assertEquals(languageModel.getLanguage(), 'en-US');
    System.assertEquals(languageModel.getStatus(), 'available');
    System.assertEquals(languageModel.getDialect(), 'customization');
    System.assertEquals(languageModel.getWarnings(), 'customization');
    System.assertEquals(updated, languageModel.getUpdated());
    getLanguageModelOptions = getLanguageModelOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void listLanguageModelsTest() {
    String body = IBMWatsonMockResponses.speechToTextListLanguageModels();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.ListLanguageModelsOptions listLanguageModelsOptions = new IBMSpeechToTextV1Models.ListLanguageModelsOptionsBuilder()
      .language('en-US')
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.LanguageModels languageModels = service.listLanguageModels(listLanguageModelsOptions);
    System.assertEquals(languageModels.getCustomizations()[0].getCustomizationId(), 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5');
    listLanguageModelsOptions = listLanguageModelsOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void resetLanguageModelTest() {
    String body = IBMWatsonMockResponses.speechToTextListLanguageModels();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.ResetLanguageModelOptions resetLanguageModelOptions = new IBMSpeechToTextV1Models.ResetLanguageModelOptionsBuilder('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .customizationId('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .addHeader(headerKey, headerVal)
      .build();
    service.resetLanguageModel(resetLanguageModelOptions);
    resetLanguageModelOptions = resetLanguageModelOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void trainLanguageModelTest() {
    String body = IBMWatsonMockResponses.speechToTextTrainLanguageModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.TrainLanguageModelOptions trainLanguageModelOptions = new IBMSpeechToTextV1Models.TrainLanguageModelOptionsBuilder()
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    trainLanguageModelOptions = trainLanguageModelOptions.newBuilder().build();
    IBMSpeechToTextV1Models.TrainingResponse response = service.trainLanguageModel(trainLanguageModelOptions);

    Test.stopTest();
  }

  static testMethod void trainAcousticModelTest() {
    String body = IBMWatsonMockResponses.speechToTextTrainLanguageModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.TrainAcousticModelOptions options = new IBMSpeechToTextV1Models.TrainAcousticModelOptionsBuilder()
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();
    IBMSpeechToTextV1Models.TrainingResponse response = service.trainAcousticModel(options);

    Test.stopTest();
  }

  static testMethod void upgradeLanguageModelTest() {
    String body = IBMWatsonMockResponses.speechToTextUpgradeLanguageModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    IBMSpeechToTextV1Models.UpgradeLanguageModelOptions upgradeLanguageModelOptions = new IBMSpeechToTextV1Models.UpgradeLanguageModelOptionsBuilder(customizationId)
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    upgradeLanguageModelOptions = upgradeLanguageModelOptions.newBuilder().build();
    service.upgradeLanguageModel(upgradeLanguageModelOptions);
    Test.stopTest();
  }

  static testMethod void addCorpusTest() {
    String body = IBMWatsonMockResponses.speechToTextDeleteCorpus();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String corpusName = 'custom_corpus';
    IBMWatsonFile corpusFile = new IBMWatsonFile.FileBuilder()
      .name('corpora.txt')
      .description('Test corpora file')
      .contentType('text/plain')
      .body(blob.valueOf('What causes autoimmune hepatitis?'))
      .build();
    IBMSpeechToTextV1Models.AddCorpusOptions addCorpusOptions = new IBMSpeechToTextV1Models.AddCorpusOptionsBuilder(customizationId, corpusName, corpusFile)
      .customizationId(customizationId)
      .corpusName(corpusName)
      .allowOverwrite(true)
      .corpusFile(corpusFile)
      .addHeader(headerKey, headerVal)
      .build();
    service.addCorpus(addCorpusOptions);
    addCorpusOptions = addCorpusOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void deleteCorpusTest() {
    String body = IBMWatsonMockResponses.speechToTextDeleteCorpus();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String corpusName = 'custom_corpus';
    IBMSpeechToTextV1Models.DeleteCorpusOptions deleteCorpusOptions = new IBMSpeechToTextV1Models.DeleteCorpusOptionsBuilder(customizationId, corpusName)
      .customizationId(customizationId)
      .corpusName(corpusName)
      .addHeader(headerKey, headerVal)
      .build();
    service.deleteCorpus(deleteCorpusOptions);
    deleteCorpusOptions = deleteCorpusOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void getCorpusTest() {
    String body = IBMWatsonMockResponses.speechToTextGetCorpus();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String corpusName = 'custom_corpus';
    IBMSpeechToTextV1Models.GetCorpusOptions getCorpusOptions = new IBMSpeechToTextV1Models.GetCorpusOptionsBuilder(customizationId, corpusName)
      .customizationId(customizationId)
      .corpusName(corpusName)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.Corpus corpus = service.getCorpus(getCorpusOptions);
    System.assertEquals(corpus.getError(), 'none');
    System.assertEquals(corpus.getName(), 'custom_corpus');
    System.assertEquals(corpus.getTotalWords(),160);
    System.assertEquals(corpus.getOutOfVocabularyWords(),3);
    System.assertEquals(corpus.getStatus(), 'analyzed');
    getCorpusOptions = getCorpusOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void listCorporaTest() {
    String body = IBMWatsonMockResponses.speechToTextListCorpora();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.ListCorporaOptions listCorporaOptions = new IBMSpeechToTextV1Models.ListCorporaOptionsBuilder('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .customizationId('d0bdc477-59e6-4e45-86f3-1a9a39664eb5')
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.Corpora corpora = service.listCorpora(listCorporaOptions);
    System.assertEquals(corpora.getCorpora()[0].getName(), 'custom_corpus');
    listCorporaOptions = listCorporaOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void deleteWordTest() {
    String body = IBMWatsonMockResponses.speechToTextDeleteWord();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String wordName = 'WatsonSDK';
    IBMSpeechToTextV1Models.DeleteWordOptions deleteWordOptions = new IBMSpeechToTextV1Models.DeleteWordOptionsBuilder(customizationId, wordName)
      .customizationId(customizationId)
      .wordName(wordName)
      .addHeader(headerKey, headerVal)
      .build();
    service.deleteWord(deleteWordOptions);
    deleteWordOptions = deleteWordOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void getWordTest() {
    String body = IBMWatsonMockResponses.speechToTextGetWord();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String wordName = 'WatsonSDK';
    IBMSpeechToTextV1Models.GetWordOptions getWordOptions = new IBMSpeechToTextV1Models.GetWordOptionsBuilder(customizationId, wordName)
      .customizationId(customizationId)
      .wordName(wordName)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.Word wordResult =  service.getWord(getWordOptions);
    System.assertEquals(wordResult.getDisplayAs(), 'words matter');
    System.assertEquals(wordResult.getSoundsLike()[0], 'words matter');
    System.assertEquals(wordResult.getSource()[0], 'custom_corpus');
    System.assertEquals(wordResult.getWord(), 'words matter');
    System.assertEquals(wordResult.getError()[0].getElement(), 'custom_corpus');
    System.assertEquals(wordResult.getCount(),2);
    getWordOptions = getWordOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void listWordsTest() {
    String body = IBMWatsonMockResponses.speechToTextListWords();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String wordType = 'all';
    String sortField = 'count';
    IBMSpeechToTextV1Models.ListWordsOptions listWordsOptions = new IBMSpeechToTextV1Models.ListWordsOptionsBuilder(customizationId)
      .customizationId(customizationId)
      .wordType(wordType)
      .xsort(sortField)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.Words wordList = service.listWords(listWordsOptions);
    System.assertEquals(wordList.getWords()[0].getDisplayAs(), 'words matter');
    listWordsOptions = listWordsOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void deleteAcousticModelTest() {
    String body = IBMWatsonMockResponses.speechToTextDeleteAcousticModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    IBMSpeechToTextV1Models.DeleteAcousticModelOptions deleteAcousticModelOptions = new IBMSpeechToTextV1Models.DeleteAcousticModelOptionsBuilder(customizationId)
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    service.deleteAcousticModel(deleteAcousticModelOptions);
    deleteAcousticModelOptions = deleteAcousticModelOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void getAcousticModelTest() {
    String body = IBMWatsonMockResponses.speechToTextGetAcousticModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    IBMSpeechToTextV1Models.GetAcousticModelOptions getAcousticModelOptions = new IBMSpeechToTextV1Models.GetAcousticModelOptionsBuilder(customizationId)
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.AcousticModel acousticModel = service.getAcousticModel(getAcousticModelOptions);
    System.assertEquals(acousticModel.getCustomizationId(), '825485d7-af3f-44e7-b1ea-76130dec8a61');
    System.assertEquals(acousticModel.getOwner(), '952e2069-9ece-48d8-96c9-0206b4473819');
    System.assertEquals(acousticModel.getBaseModelName(), 'en-US_BroadbandModel');
    System.assertEquals(acousticModel.getCreated(), '2017-12-11T17:57:06.654Z');
    System.assertEquals(acousticModel.getName(), 'custom acoustic');
    System.assertEquals(acousticModel.getDescription(), 'customization');
    System.assertEquals(acousticModel.getProgress(),0);
    System.assertEquals(acousticModel.getLanguage(), 'en-US');
    System.assertEquals(acousticModel.getStatus(), 'ready');
    System.assertEquals(acousticModel.getWarnings(), 'customization');
    System.assertEquals(updated, acousticModel.getUpdated());
    getAcousticModelOptions = getAcousticModelOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void upgradeAcousticModelOptionsTest() {
    Test.startTest();

    String customizationId = 'customizationId';
    String customLanguageModelId = 'customLanguageModelId';

    IBMSpeechToTextV1Models.UpgradeAcousticModelOptions upgradeAcousticModelOptions = new IBMSpeechToTextV1Models.UpgradeAcousticModelOptionsBuilder()
      .customizationId(customizationId)
      .customLanguageModelId(customLanguageModelId)
      .force(true)
      .addHeader(headerKey, headerVal)
      .build();
      upgradeAcousticModelOptions = upgradeAcousticModelOptions.newBuilder().build();

    System.assertEquals(customizationId, upgradeAcousticModelOptions.customizationId());
    System.assertEquals(customLanguageModelId, upgradeAcousticModelOptions.customLanguageModelId());
    System.assert(upgradeAcousticModelOptions.force() == true);
    Test.stopTest();
  }

  static testMethod void upgradeAcousticModelTest() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'customizationId';
    String customLanguageModelId = 'customLanguageModelId';

    IBMSpeechToTextV1Models.UpgradeAcousticModelOptions upgradeAcousticModelOptions = new IBMSpeechToTextV1Models.UpgradeAcousticModelOptionsBuilder()
      .customizationId(customizationId)
      .customLanguageModelId(customLanguageModelId)
      .addHeader(headerKey, headerVal)
      .build();
    upgradeAcousticModelOptions = upgradeAcousticModelOptions.newBuilder().build();
    service.upgradeAcousticModel(upgradeAcousticModelOptions);
    Test.stopTest();
  }

  static testMethod void listAcousticModelsTest() {
    String body = IBMWatsonMockResponses.speechToTextListAcousticModels();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMSpeechToTextV1Models.ListAcousticModelsOptions listAcousticModelsOptions = new IBMSpeechToTextV1Models.ListAcousticModelsOptionsBuilder()
      .language('en-US')
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.AcousticModels acousticModels = service.listAcousticModels(listAcousticModelsOptions);
    System.assertEquals(acousticModels.getCustomizations()[0].getCustomizationId(), '825485d7-af3f-44e7-b1ea-76130dec8a61');
    listAcousticModelsOptions = listAcousticModelsOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void resetAcousticModelTest() {
    String body = IBMWatsonMockResponses.speechToTextResetAcousticModel();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    IBMSpeechToTextV1Models.ResetAcousticModelOptions resetAcousticModelOptions = new IBMSpeechToTextV1Models.ResetAcousticModelOptionsBuilder(customizationId)
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    service.resetAcousticModel(resetAcousticModelOptions);
    resetAcousticModelOptions = resetAcousticModelOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void deleteAudioTest() {
    String body = IBMWatsonMockResponses.speechToTextDeleteAudio();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String audioName = 'WatsonSDKAudio';
    IBMSpeechToTextV1Models.DeleteAudioOptions deleteAudioOptions = new IBMSpeechToTextV1Models.DeleteAudioOptionsBuilder(customizationId, audioName)
      .customizationId(customizationId)
      .audioName(audioName)
      .addHeader(headerKey, headerVal)
      .build();
    service.deleteAudio(deleteAudioOptions);
    deleteAudioOptions = deleteAudioOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void getAudioTest() {
    String body = IBMWatsonMockResponses.speechToTextGetAudio();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    String audioName = 'WatsonSDKAudio';
    IBMSpeechToTextV1Models.GetAudioOptions getAudioOptions = new IBMSpeechToTextV1Models.GetAudioOptionsBuilder(customizationId, audioName)
      .customizationId(customizationId)
      .audioName(audioName)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.AudioListing audioListing = service.getAudio(getAudioOptions);
//    System.assertEquals(audioListing.getTotalMinutesOfAudio(),0);
    System.assertEquals(audioListing.getDuration(),0);
    System.assertEquals(audioListing.getName(), 'string');
    System.assertEquals(audioListing.getDetails().getXtype(), 'audio');
    System.assertEquals(audioListing.getStatus(), 'ok');
    System.assertEquals(audioListing.getAudio()[0].getDuration(),0);
    System.assertEquals(audioListing.getAudio()[0].getName(), 'string');
    System.assertEquals(audioListing.getAudio()[0].getDetails().getXtype(), 'audio');
    System.assertEquals(audioListing.getAudio()[0].getDetails().getCodec(), 'string');
    System.assertEquals(audioListing.getAudio()[0].getDetails().getCompression(), 'zip');
    System.assertEquals(audioListing.getAudio()[0].getDetails().getFrequency(),0);
    System.assertEquals(audioListing.getcontainer().getDetails().getFrequency(),0);
    System.assertEquals(audioListing.getAudio()[0].getStatus(), 'ok');
    getAudioOptions = getAudioOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void listAudioTest() {
    String body = IBMWatsonMockResponses.speechToTextGetAudio();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'd0bdc477-59e6-4e45-86f3-1a9a39664eb5';
    IBMSpeechToTextV1Models.ListAudioOptions listAudioOptions = new IBMSpeechToTextV1Models.ListAudioOptionsBuilder(customizationId)
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.AudioResources AudioResources = service.listAudio(listAudioOptions);
    listAudioOptions = listAudioOptions.newBuilder().build();
    Test.stopTest();
  }

  static testMethod void recognizeTest() {
    String body = IBMWatsonMockResponses.speechToTextRecognize();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMWatsonFile audio = new IBMWatsonFile.FileBuilder()
      .name('audioTestFile.mp3')
      .description('Test audio file')
      .contentType('audio/mp3')
      .body(blob.valueOf('Test string not an audio content'))
      .build();
    String fileContentType = 'audio/mp3';
    IBMSpeechToTextV1Models.RecognizeOptions recognizeOptions = new IBMSpeechToTextV1Models.RecognizeOptionsBuilder()
      .audio(audio)
      .contentType(fileContentType)
      .endOfPhraseSilenceTime(endOfPhraseSilenceTime)
      .splitTranscriptAtPhraseEnd(true)
      .addHeader(headerKey, headerVal)
      .build();
    IBMSpeechToTextV1Models.SpeechRecognitionResults speechResults = service.recognize(recognizeOptions);
    System.assertEquals(speechResults.getResults()[0].getWordAlternatives()[0].getStartTime(),0.14);
    System.assertEquals(speechResults.getResults()[0].getWordAlternatives()[0].getEndTime(),0.28);
    System.assertEquals(speechResults.getResults()[0].getWordAlternatives()[0].getAlternatives()[0].getConfidence(),1);
    System.assertEquals(speechResults.getResults()[0].getWordAlternatives()[0].getAlternatives()[0].getWord(), 'a');
    System.assertEquals('end_of_data', speechResults.getResults().get(0).getEndOfUtterance());
    System.assertEquals(speechResults.getAudioMetrics().getSamplingInterval(), samplingInterval);
    System.assert(speechResults.getAudioMetrics().getAccumulated().getXfinal());
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getEndTime(), endTime);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getSpeechRatio(), speechRatio);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getHighFrequencyLoss(), highFrequencyLoss);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getSignalToNoiseRatio(), signalToNoiseRatio);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getDirectCurrentOffset()[0].getXbegin(), beginVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getDirectCurrentOffset()[0].getXend(), endVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getDirectCurrentOffset()[0].getCount(), count);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getClippingRate()[0].getXbegin(), beginVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getClippingRate()[0].getXend(), endVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getClippingRate()[0].getCount(), count);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getSpeechLevel()[0].getXbegin(), beginVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getSpeechLevel()[0].getXend(), endVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getSpeechLevel()[0].getCount(), count);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getNonSpeechLevel()[0].getXbegin(), beginVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getNonSpeechLevel()[0].getXend(), endVal);
    System.assertEquals(speechResults.getAudioMetrics().getAccumulated().getNonSpeechLevel()[0].getCount(), count);
    System.assertEquals(speechResults.getProcessingMetrics().getProcessedAudio().getReceived(), received);
    System.assertEquals(speechResults.getProcessingMetrics().getProcessedAudio().getSeenByEngine(), seenByEngine);
    System.assertEquals(speechResults.getProcessingMetrics().getProcessedAudio().getTranscription(), transcription);
    System.assertEquals(speechResults.getProcessingMetrics().getProcessedAudio().getSpeakerLabels(), speakerLabels);
    System.assertEquals(speechResults.getProcessingMetrics().getWallClockSinceFirstByteReceived(), wallClockSinceFirstByteReceived);
    System.assert(speechResults.getProcessingMetrics().getPeriodic());
    recognizeOptions = recognizeOptions.newBuilder().build();
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
    IBMSpeechToTextV1Models.DeleteUserDataOptions deleteOptions = new IBMSpeechToTextV1Models.DeleteUserDataOptionsBuilder()
      .customerId(customerId)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteUserData(deleteOptions);

    Test.stopTest();
  }

  static testMethod void testAddGrammarOptions() {
    Test.startTest();

    String customizationId = 'id';
    String grammarName = 'grammar_name';
    IBMWatsonFile testfile= new IBMWatsonFile.FileBuilder()
      .body(Blob.valueOf('test string'))
      .contentType('text/plain')
      .build();
    String contentType = 'application/srgs';

    IBMSpeechToTextV1Models.AddGrammarOptions addGrammarOptions = new IBMSpeechToTextV1Models.AddGrammarOptionsBuilder()
      .customizationId(customizationId)
      .grammarName(grammarName)
      .grammarFile(testfile)
      .contentType(contentType)
      .allowOverwrite(true)
      .addHeader(headerKey, headerVal)
      .build();
    addGrammarOptions = addGrammarOptions.newBuilder().build();

    System.assertEquals(customizationId, addGrammarOptions.customizationId());
    System.assertEquals(grammarName, addGrammarOptions.grammarName());
    System.assertEquals(testfile, addGrammarOptions.grammarFile());
    System.assertEquals(contentType, addGrammarOptions.contentType());
    System.assert(addGrammarOptions.allowOverwrite());

    Test.stopTest();
  }

  static testMethod void testAddGrammar() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'id';
    String grammarName = 'grammar_name';
    IBMWatsonFile testfile= new IBMWatsonFile.FileBuilder()
      .body(Blob.valueOf('test string'))
      .contentType('text/plain')
      .build();
    String contentType = 'application/srgs';

    IBMSpeechToTextV1Models.AddGrammarOptions addGrammarOptions = new IBMSpeechToTextV1Models.AddGrammarOptionsBuilder()
      .customizationId(customizationId)
      .grammarName(grammarName)
      .grammarFile(testfile)
      .contentType(contentType)
      .addHeader(headerKey, headerVal)
      .build();
    addGrammarOptions = addGrammarOptions.newBuilder().build();
    service.addGrammar(addGrammarOptions);

    Test.stopTest();
  }

  static testMethod void testListGrammarsOptions() {
    Test.startTest();

    String customizationId = 'id';

    IBMSpeechToTextV1Models.ListGrammarsOptions listGrammarsOptions = new IBMSpeechToTextV1Models.ListGrammarsOptionsBuilder()
      .customizationId(customizationId)
      .build();
    listGrammarsOptions = listGrammarsOptions.newBuilder().build();

    System.assertEquals(customizationId, listGrammarsOptions.customizationId());

    Test.stopTest();
  }

  static testMethod void testListGrammars() {
    String body = IBMWatsonMockResponses.listGrammarsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'id';

    Long outOfVocabularyWords = 10L;
    String name = 'name_1';
    String status = 'analyzed';

    IBMSpeechToTextV1Models.ListGrammarsOptions listGrammarsOptions = new IBMSpeechToTextV1Models.ListGrammarsOptionsBuilder()
      .customizationId(customizationId)
      .addHeader(headerKey, headerVal)
      .build();
    listGrammarsOptions = listGrammarsOptions.newBuilder().build();
    IBMSpeechToTextV1Models.Grammars response = service.listGrammars(listGrammarsOptions);

    System.assertEquals(outOfVocabularyWords, response.getGrammars().get(0).getOutOfVocabularyWords());
    System.assertEquals(name, response.getGrammars().get(0).getName());
    System.assertEquals(status, response.getGrammars().get(0).getStatus());
    System.assert(response.getGrammars().get(0).getError() == null);

    Test.stopTest();
  }

  static testMethod void testGetGrammarOptions() {
    Test.startTest();

    String customizationId = 'id';
    String grammarName = 'grammar_name';

    IBMSpeechToTextV1Models.GetGrammarOptions getGrammarOptions = new IBMSpeechToTextV1Models.GetGrammarOptionsBuilder()
      .customizationId(customizationId)
      .grammarName(grammarName)
      .build();
    getGrammarOptions = getGrammarOptions.newBuilder().build();

    System.assertEquals(customizationId, getGrammarOptions.customizationId());
    System.assertEquals(grammarName, getGrammarOptions.grammarName());

    Test.stopTest();
  }

  static testMethod void testGetGrammar() {
    String body = IBMWatsonMockResponses.getGrammarResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'id';
    String grammarName = 'grammar_name';

    Long outOfVocabularyWords = 10L;
    String status = 'analyzed';

    IBMSpeechToTextV1Models.GetGrammarOptions getGrammarOptions = new IBMSpeechToTextV1Models.GetGrammarOptionsBuilder()
      .customizationId(customizationId)
      .grammarName(grammarName)
      .addHeader(headerKey, headerVal)
      .build();
    getGrammarOptions = getGrammarOptions.newBuilder().build();
    IBMSpeechToTextV1Models.Grammar response = service.getGrammar(getGrammarOptions);

    System.assertEquals(outOfVocabularyWords, response.getOutOfVocabularyWords());
    System.assertEquals(grammarName, response.getName());
    System.assertEquals(status, response.getStatus());
    System.assert(response.getError() == null);

    Test.stopTest();
  }

  static testMethod void testDeleteGrammarOptions() {
    Test.startTest();

    String customizationId = 'id';
    String grammarName = 'grammar_name';

    IBMSpeechToTextV1Models.DeleteGrammarOptions deleteGrammarOptions = new IBMSpeechToTextV1Models.DeleteGrammarOptionsBuilder()
      .customizationId(customizationId)
      .grammarName(grammarName)
      .build();
    deleteGrammarOptions = deleteGrammarOptions.newBuilder().build();

    System.assertEquals(customizationId, deleteGrammarOptions.customizationId());
    System.assertEquals(grammarName, deleteGrammarOptions.grammarName());

    Test.stopTest();
  }

  static testMethod void testDeleteGrammar() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String customizationId = 'id';
    String grammarName = 'grammar_name';

    IBMSpeechToTextV1Models.DeleteGrammarOptions deleteGrammarOptions = new IBMSpeechToTextV1Models.DeleteGrammarOptionsBuilder()
      .customizationId(customizationId)
      .grammarName(grammarName)
      .addHeader(headerKey, headerVal)
      .build();
    deleteGrammarOptions = deleteGrammarOptions.newBuilder().build();
    service.deleteGrammar(deleteGrammarOptions);

    Test.stopTest();
  }

  static testMethod void testCreateJobOptions() {
    Test.startTest();

    Attachment audioAttachment = new Attachment(Body = Blob.valueOf('job'),
      Name='job.wav',
      Description='audio for job',
      ContentType='audio/wav');
    IBMWatsonFile audio = new IBMWatsonFile.FileBuilder()
      .attachment(audioAttachment)
      .build();
    String newKeyword = 'keyword2';

    IBMSpeechToTextV1Models.CreateJobOptions options = new IBMSpeechToTextV1Models.CreateJobOptionsBuilder()
      .audio(audio)
      .contentType(contentType)
      .model(model)
      .callbackUrl(callbackUrl)
      .events(events)
      .userToken(userToken)
      .resultsTtl(resultsTtl)
      .languageCustomizationId(languageCustomizationId)
      .acousticCustomizationId(acousticCustomizationId)
      .baseModelVersion(baseModelVersion)
      .customizationWeight(customizationWeight)
      .inactivityTimeout(inactivityTimeout)
      .keywords(keywords)
      .addKeywords(newKeyword)
      .keywordsThreshold(keywordsThreshold)
      .maxAlternatives(maxAlternatives)
      .wordAlternativesThreshold(wordAlternativesThreshold)
      .wordConfidence(true)
      .timestamps(true)
      .profanityFilter(true)
      .smartFormatting(true)
      .speakerLabels(true)
      .customizationId(customizationId)
      .grammarName(grammarName)
      .redaction(true)
      .processingMetrics(true)
      .processingMetricsInterval(processingMetricsInterval)
      .audioMetrics(true)
      .endOfPhraseSilenceTime(endOfPhraseSilenceTime)
      .splitTranscriptAtPhraseEnd(true)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(audio, options.audio());
    System.assertEquals(contentType, options.contentType());
    System.assertEquals(model, options.model());
    System.assertEquals(callbackUrl, options.callbackUrl());
    System.assertEquals(events, options.events());
    System.assertEquals(userToken, options.userToken());
    System.assertEquals(resultsTtl, options.resultsTtl());
    System.assertEquals(languageCustomizationId, options.languageCustomizationId());
    System.assertEquals(acousticCustomizationId, options.acousticCustomizationId());
    System.assertEquals(baseModelVersion, options.baseModelVersion());
    System.assertEquals(customizationWeight, options.customizationWeight());
    System.assertEquals(inactivityTimeout, options.inactivityTimeout());
    System.assert(options.keywords().contains(keywords.get(0)));
    System.assert(options.keywords().contains(newKeyword));
    System.assertEquals(keywordsThreshold, options.keywordsThreshold());
    System.assertEquals(maxAlternatives, options.maxAlternatives());
    System.assertEquals(wordAlternativesThreshold, options.wordAlternativesThreshold());
    System.assert(options.wordConfidence());
    System.assert(options.timestamps());
    System.assert(options.profanityFilter());
    System.assert(options.speakerLabels());
    System.assertEquals(customizationId, options.customizationId());
    System.assertEquals(grammarName, options.grammarName());
    System.assert(options.redaction());
    System.assert(options.processingMetrics());
    System.assertEquals(processingMetricsInterval, options.processingMetricsInterval());
    System.assert(options.audioMetrics());
    System.assertEquals(endOfPhraseSilenceTime, options.endOfPhraseSilenceTime());
    System.assert(options.splitTranscriptAtPhraseEnd());

    Test.stopTest();
  }

  static testMethod void testRecognizeOptions() {
    Test.startTest();

    Attachment audioAttachment = new Attachment(Body = Blob.valueOf('audio'),
      Name='audio.wav',
      Description='audio for recognition',
      ContentType='audio/wav');
    IBMWatsonFile audio = new IBMWatsonFile.FileBuilder()
      .attachment(audioAttachment)
      .build();
    String newKeyword = 'keyword2';

    IBMSpeechToTextV1Models.RecognizeOptions options = new IBMSpeechToTextV1Models.RecognizeOptionsBuilder()
      .audio(audio)
      .contentType(contentType)
      .model(model)
      .languageCustomizationId(languageCustomizationId)
      .acousticCustomizationId(acousticCustomizationId)
      .baseModelVersion(baseModelVersion)
      .customizationWeight(customizationWeight)
      .inactivityTimeout(inactivityTimeout)
      .keywords(keywords)
      .addKeywords(newKeyword)
      .keywordsThreshold(keywordsThreshold)
      .maxAlternatives(maxAlternatives)
      .wordAlternativesThreshold(wordAlternativesThreshold)
      .wordConfidence(true)
      .timestamps(true)
      .profanityFilter(true)
      .smartFormatting(true)
      .speakerLabels(true)
      .customizationId(customizationId)
      .grammarName(grammarName)
      .redaction(true)
      .audioMetrics(true)
      .endOfPhraseSilenceTime(endOfPhraseSilenceTime)
      .splitTranscriptAtPhraseEnd(true)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(audio, options.audio());
    System.assertEquals(contentType, options.contentType());
    System.assertEquals(model, options.model());
    System.assertEquals(languageCustomizationId, options.languageCustomizationId());
    System.assertEquals(acousticCustomizationId, options.acousticCustomizationId());
    System.assertEquals(baseModelVersion, options.baseModelVersion());
    System.assertEquals(customizationWeight, options.customizationWeight());
    System.assertEquals(inactivityTimeout, options.inactivityTimeout());
    System.assert(options.keywords().contains(keywords.get(0)));
    System.assert(options.keywords().contains(newKeyword));
    System.assertEquals(keywordsThreshold, options.keywordsThreshold());
    System.assertEquals(maxAlternatives, options.maxAlternatives());
    System.assertEquals(wordAlternativesThreshold, options.wordAlternativesThreshold());
    System.assert(options.wordConfidence());
    System.assert(options.timestamps());
    System.assert(options.profanityFilter());
    System.assert(options.speakerLabels());
    System.assertEquals(customizationId, options.customizationId());
    System.assertEquals(grammarName, options.grammarName());
    System.assert(options.redaction());
    System.assert(options.audioMetrics());
    System.assertEquals(endOfPhraseSilenceTime, options.endOfPhraseSilenceTime());
    System.assert(options.splitTranscriptAtPhraseEnd());

    Test.stopTest();
  }

  static testMethod void testTrainLanguageModelOptions() {
    Test.startTest();

    IBMSpeechToTextV1Models.TrainLanguageModelOptions options = new IBMSpeechToTextV1Models.TrainLanguageModelOptionsBuilder()
      .customizationId(customizationId)
      .wordTypeToAdd(wordTypeToAdd)
      .customizationWeight(customizationWeight)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(customizationId, options.customizationId());
    System.assertEquals(wordTypeToAdd, options.wordTypeToAdd());
    System.assertEquals(customizationWeight, options.customizationWeight());

    Test.stopTest();
  }

  static testMethod void testTrainAcousticModelOptions() {
    Test.startTest();

    IBMSpeechToTextV1Models.TrainAcousticModelOptions options = new IBMSpeechToTextV1Models.TrainAcousticModelOptionsBuilder()
      .customizationId(customizationId)
      .customLanguageModelId(customLanguageModelId)
      .addHeader(headerKey, headerVal)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(customizationId, options.customizationId());
    System.assertEquals(customLanguageModelId, options.customLanguageModelId());

    Test.stopTest();
  }
}