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
private class IBMAssistantV2Test {
  private static String VERSION;

  private static String ASSISTANT_ID;
  private static String SESSION_ID;
  private static String TIMEZONE;
  private static Long TURN_COUNT;
  private static String USER_ID;
  private static String GROUP_STR;
  private static List<Long> LOCATION;
  private static Double CONFIDENCE;
  private static String ENTITY;
  private static IBMWatsonMapModel KEY_VAL;
  private static String VALUE;
  private static String INTENT;
  private static String TEXT;
  private static String SUGGESTION_ID;
  private static String MESSAGE;
  private static String CONDITIONS;
  private static String TITLE;
  private static String DIALOG_NODE;
  private static String NAME;
  private static String RESULT_VARIABLE;
  private static String CREDENTIALS;
  private static String DESCRIPTION;
  private static Long TIME_VAL;
  private static String SOURCE;
  private static String TOPIC;
  private static String LABEL;
  private static String ACTION_TYPE;
  private static String BRANCH_EXITED_REASON;
  private static String INFO;
  private static String BUTTON;
  private static String USER_DEFINED;
  private static String RESPONSE_TYPE;
  private static String PREFERENCE;
  private static String HEADER_NAME;
  private static String HEADER_VAL;

  private static IBMAssistantV2 service;

  static {
    VERSION = '2019-02-28';
    ASSISTANT_ID = 'assistant_id';
    SESSION_ID = 'session_id';
    TIMEZONE = 'timezone';
    TURN_COUNT = 10;
    USER_ID = 'user_id';
    GROUP_STR = 'group';
    LOCATION = new List<Long> { 1, 2 };
    CONFIDENCE = 0.0;
    ENTITY = 'entity';
    KEY_VAL = new IBMWatsonMapModel();
    KEY_VAL.put('key', 'value');
    VALUE = 'value';
    INTENT = 'intent';
    TEXT = 'text';
    SUGGESTION_ID = 'suggestion_id';
    MESSAGE = 'message';
    CONDITIONS = 'conditions';
    TITLE = 'title';
    DIALOG_NODE = 'dialog_node';
    NAME = 'name';
    RESULT_VARIABLE = 'result_variable';
    CREDENTIALS = 'credentials';
    DESCRIPTION = 'description';
    TIME_VAL = 1234;
    SOURCE = 'source';
    TOPIC = 'topic';
    LABEL = 'label';
    ACTION_TYPE = 'client';
    BRANCH_EXITED_REASON = 'completed';
    INFO = 'info';
    BUTTON = 'button';
    USER_DEFINED = 'user_defined';
    RESPONSE_TYPE = 'type';
    PREFERENCE = 'preference';
    HEADER_NAME = 'Test-Header';
    HEADER_VAL = 'test_value';

    service = new IBMAssistantV2(VERSION, new IBMWatsonNoAuthAuthenticator());
  }

  static testMethod void testCaptureGroup() {
    Test.startTest();

    IBMAssistantV2Models.CaptureGroup captureGroup = new IBMAssistantV2Models.CaptureGroupBuilder()
      .xgroup(GROUP_STR)
      .location(LOCATION)
      .build();

    System.assertEquals(GROUP_STR, captureGroup.getXgroup());
    System.assertEquals(LOCATION, captureGroup.getLocation());
    Test.stopTest();
  }

  static testMethod void testCreateSessionOptions() {
    Test.startTest();

    IBMAssistantV2Models.CreateSessionOptions createSessionOptions = new IBMAssistantV2Models.CreateSessionOptionsBuilder()
        .assistantId(ASSISTANT_ID)
        .build();
    createSessionOptions = createSessionOptions.newBuilder().build();

    System.assertEquals(ASSISTANT_ID, createSessionOptions.assistantId());
    Test.stopTest();
  }

  static testMethod void testDeleteSessionOptions() {
    Test.startTest();

    IBMAssistantV2Models.DeleteSessionOptions deleteSessionOptions = new IBMAssistantV2Models.DeleteSessionOptionsBuilder()
        .assistantId(ASSISTANT_ID)
        .sessionId(SESSION_ID)
        .build();
    deleteSessionOptions = deleteSessionOptions.newBuilder().build();

    System.assertEquals(ASSISTANT_ID, deleteSessionOptions.assistantId());
    System.assertEquals(SESSION_ID, deleteSessionOptions.sessionId());
    Test.stopTest();
  }

  static testMethod void testMessageContextGlobalSystem() {
    Test.startTest();

    IBMAssistantV2Models.MessageContextGlobalSystem messageContextGlobalSystem = new IBMAssistantV2Models.MessageContextGlobalSystemBuilder()
      .timezone(TIMEZONE)
      .turnCount(TURN_COUNT)
      .userId(USER_ID)
      .build();

    System.assertEquals(TIMEZONE, messageContextGlobalSystem.getTimezone());
    System.assertEquals(TURN_COUNT, messageContextGlobalSystem.getTurnCount());
    System.assertEquals(USER_ID, messageContextGlobalSystem.getUserId());
    Test.stopTest();
  }

  static testMethod void testMessageContextGlobal() {
    Test.startTest();

    IBMAssistantV2Models.MessageContextGlobalSystem messageContextGlobalSystem = new IBMAssistantV2Models.MessageContextGlobalSystem();

    IBMAssistantV2Models.MessageContextGlobal messageContextGlobal = new IBMAssistantV2Models.MessageContextGlobalBuilder()
      .xsystem(messageContextGlobalSystem)
      .build();

    System.assertEquals(messageContextGlobalSystem, messageContextGlobal.getXsystem());
    Test.stopTest();
  }

  static testMethod void testMessageContext() {
    Test.startTest();

    IBMAssistantV2Models.MessageContextGlobal messageContextGlobal = new IBMAssistantV2Models.MessageContextGlobal();
    IBMAssistantV2Models.MessageContextSkills messageContextSkills = new IBMAssistantV2Models.MessageContextSkills();

    IBMAssistantV2Models.MessageContext messageContext = new IBMAssistantV2Models.MessageContextBuilder()
      .xglobal(messageContextGlobal)
      .skills(messageContextSkills)
      .build();

    System.assertEquals(messageContextGlobal, messageContext.getXglobal());
    System.assertEquals(messageContextSkills, messageContext.getSkills());
    Test.stopTest();
  }

  static testMethod void testMessageInput() {
    Test.startTest();

    IBMAssistantV2Models.RuntimeEntity entity1 = new IBMAssistantV2Models.RuntimeEntityBuilder()
      .entity(ENTITY)
      .location(LOCATION)
      .value(VALUE)
      .build();
    IBMAssistantV2Models.RuntimeEntity entity2 = new IBMAssistantV2Models.RuntimeEntityBuilder()
      .entity(ENTITY)
      .location(LOCATION)
      .value(VALUE)
      .build();
    List<IBMAssistantV2Models.RuntimeEntity> entityList = new List<IBMAssistantV2Models.RuntimeEntity>();
    entityList.add(entity1);
    IBMAssistantV2Models.RuntimeIntent intent1 = new IBMAssistantV2Models.RuntimeIntentBuilder()
      .confidence(CONFIDENCE)
      .intent(INTENT)
      .build();
    IBMAssistantV2Models.RuntimeIntent intent2 = new IBMAssistantV2Models.RuntimeIntentBuilder()
      .confidence(CONFIDENCE)
      .intent(INTENT)
      .build();
    List<IBMAssistantV2Models.RuntimeIntent> intentList = new List<IBMAssistantV2Models.RuntimeIntent>();
    intentList.add(intent1);
    IBMAssistantV2Models.MessageInputOptions inputOptions = new IBMAssistantV2Models.MessageInputOptions();

    IBMAssistantV2Models.MessageInput messageInput = new IBMAssistantV2Models.MessageInputBuilder()
        .messageType(TEXT)
        .entities(entityList)
        .addEntities(entity2)
        .intents(intentList)
        .addIntents(intent2)
        .options(inputOptions)
        .suggestionId(SUGGESTION_ID)
        .text(TEXT)
        .build();
    messageInput = messageInput.newBuilder().build();

    entityList.add(entity2);
    intentList.add(intent2);
    System.assertEquals(TEXT, messageInput.getMessageType());
    System.assertEquals(entityList, messageInput.getEntities());
    System.assertEquals(intentList, messageInput.getIntents());
    System.assertEquals(inputOptions, messageInput.getOptions());
    System.assertEquals(SUGGESTION_ID, messageInput.getSuggestionId());
    System.assertEquals(TEXT, messageInput.getText());
    Test.stopTest();
  }

  static testMethod void testMessageInputOptions() {
    Test.startTest();

    IBMAssistantV2Models.MessageInputOptions inputOptions = new IBMAssistantV2Models.MessageInputOptionsBuilder()
      .alternateIntents(true)
      .debug(true)
      .restart(true)
      .returnContext(true)
      .build();

    System.assert(inputOptions.getAlternateIntents());
    System.assert(inputOptions.getDebug());
    System.assert(inputOptions.getRestart());
    System.assert(inputOptions.getReturnContext());
    Test.stopTest();
  }

  static testMethod void testMessageOptions() {
    Test.startTest();

    IBMAssistantV2Models.MessageContext messageContext = new IBMAssistantV2Models.MessageContext();
    IBMAssistantV2Models.MessageInput messageInput = new IBMAssistantV2Models.MessageInputBuilder().build();

    IBMAssistantV2Models.MessageOptions messageOptions = new IBMAssistantV2Models.MessageOptionsBuilder()
        .assistantId(ASSISTANT_ID)
        .context(messageContext)
        .input(messageInput)
        .sessionId(SESSION_ID)
        .build();
    messageOptions = messageOptions.newBuilder().build();

    System.assertEquals(ASSISTANT_ID, messageOptions.assistantId());
    System.assertEquals(messageContext, messageOptions.context());
    System.assertEquals(messageInput, messageOptions.input());
    System.assertEquals(SESSION_ID, messageOptions.sessionId());
    Test.stopTest();
  }

  static testMethod void testRuntimeEntity() {
    Test.startTest();

    IBMAssistantV2Models.CaptureGroup captureGroup = new IBMAssistantV2Models.CaptureGroupBuilder()
      .xgroup(GROUP_STR)
      .build();
    List<IBMAssistantV2Models.CaptureGroup> captureGroupList = new List<IBMAssistantV2Models.CaptureGroup> { captureGroup };
    IBMAssistantV2Models.RuntimeEntity runtimeEntity = new IBMAssistantV2Models.RuntimeEntityBuilder()
      .confidence(CONFIDENCE)
      .entity(ENTITY)
      .groups(captureGroupList)
      .location(LOCATION)
      .metadata(KEY_VAL)
      .value(VALUE)
      .build();

    System.assertEquals(CONFIDENCE, runtimeEntity.getConfidence());
    System.assertEquals(ENTITY, runtimeEntity.getEntity());
    System.assertEquals(captureGroupList, runtimeEntity.getGroups());
    System.assertEquals(LOCATION, runtimeEntity.getLocation());
    System.assertEquals(KEY_VAL, runtimeEntity.getMetadata());
    System.assertEquals(VALUE, runtimeEntity.getValue());
    Test.stopTest();
  }

  static testMethod void testRuntimeIntent() {
    Test.startTest();

    IBMAssistantV2Models.RuntimeIntent runtimeIntent = new IBMAssistantV2Models.RuntimeIntentBuilder()
      .confidence(CONFIDENCE)
      .intent(INTENT)
      .build();

    System.assertEquals(CONFIDENCE, runtimeIntent.getConfidence());
    System.assertEquals(INTENT, runtimeIntent.getIntent());
    Test.stopTest();
  }

  static testMethod void testRuntimeResponseGeneric() {
    Test.startTest();

    IBMAssistantV2Models.DialogNodeOutputOptionsElement option1 = new IBMAssistantV2Models.DialogNodeOutputOptionsElement();
    IBMAssistantV2Models.DialogNodeOutputOptionsElement option2 = new IBMAssistantV2Models.DialogNodeOutputOptionsElement();
    List<IBMAssistantV2Models.DialogNodeOutputOptionsElement> options = new List<IBMAssistantV2Models.DialogNodeOutputOptionsElement> { option1 };
    IBMAssistantV2Models.DialogSuggestion suggestion1 = new IBMAssistantV2Models.DialogSuggestion();
    IBMAssistantV2Models.DialogSuggestion suggestion2 = new IBMAssistantV2Models.DialogSuggestion();
    List<IBMAssistantV2Models.DialogSuggestion> suggestions = new List<IBMAssistantV2Models.DialogSuggestion> { suggestion1 };

    IBMAssistantV2Models.RuntimeResponseGeneric generic = new IBMAssistantV2Models.RuntimeResponseGenericBuilder()
      .responseType(RESPONSE_TYPE)
      .text(TEXT)
      .xtime(TIME_VAL)
      .typing(true)
      .source(SOURCE)
      .title(TITLE)
      .description(DESCRIPTION)
      .preference(PREFERENCE)
      .options(options)
      .messageToHumanAgent(MESSAGE)
      .topic(TOPIC)
      .suggestions(suggestions)
      .addOptions(option2)
      .addSuggestions(suggestion2)
      .build();
    generic = generic.newBuilder().build();

    options.add(option2);
    suggestions.add(suggestion2);

    System.assertEquals(RESPONSE_TYPE, generic.getResponseType());
    System.assertEquals(TEXT, generic.getText());
    System.assertEquals(TIME_VAL, generic.getXtime());
    System.assert(generic.getTyping());
    System.assertEquals(SOURCE, generic.getSource());
    System.assertEquals(TITLE, generic.getTitle());
    System.assertEquals(DESCRIPTION, generic.getDescription());
    System.assertEquals(PREFERENCE, generic.getPreference());
    System.assertEquals(options, generic.getOptions());
    System.assertEquals(MESSAGE, generic.getMessageToHumanAgent());
    System.assertEquals(TOPIC, generic.getTopic());
    System.assertEquals(suggestions, generic.getSuggestions());

    Test.stopTest();
  }

  static testMethod void testMessage() {
    String body = IBMWatsonMockResponses.messageResponseV2();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV2Models.MessageOptions messageOptions = new IBMAssistantV2Models.MessageOptionsBuilder()
      .assistantId(ASSISTANT_ID)
      .sessionId(SESSION_ID)
      .build();
    IBMAssistantV2Models.MessageResponse response = service.message(messageOptions);

    System.assert(response.getContext() != null);
    System.assert(response.getOutput() != null);

    System.assertEquals(ACTION_TYPE, response.getOutput().getActions().get(0).getXType());
    System.assertEquals(NAME, response.getOutput().getActions().get(0).getName());
    System.assertEquals(KEY_VAL, response.getOutput().getActions().get(0).getParameters());
    System.assertEquals(RESULT_VARIABLE, response.getOutput().getActions().get(0).getResultVariable());
    System.assertEquals(CREDENTIALS, response.getOutput().getActions().get(0).getCredentials());
    System.assertEquals(BRANCH_EXITED_REASON, response.getOutput().getDebug().getBranchExitedReason());
    System.assertEquals(INFO, response.getOutput().getDebug().getLogMessages().get(0).getLevel());
    System.assertEquals(MESSAGE, response.getOutput().getDebug().getLogMessages().get(0).getMessage());
    System.assertEquals(CONDITIONS, response.getOutput().getDebug().getNodesVisited().get(0).getConditions());
    System.assertEquals(TITLE, response.getOutput().getDebug().getNodesVisited().get(0).getTitle());
    System.assertEquals(DIALOG_NODE, response.getOutput().getDebug().getNodesVisited().get(0).getDialogNode());
    System.assert(response.getOutput().getDebug().getBranchExited());
    System.assertEquals(DESCRIPTION, response.getOutput().getGeneric().get(0).getDescription());
    System.assertEquals(TEXT, response.getOutput().getGeneric().get(0).getResponseType());
    System.assertEquals(BUTTON, response.getOutput().getGeneric().get(0).getPreference());
    System.assertEquals(TEXT, response.getOutput().getGeneric().get(0).getText());
    System.assertEquals(TIME_VAL, response.getOutput().getGeneric().get(0).getXtime());
    System.assert(response.getOutput().getGeneric().get(0).getTyping());
    System.assertEquals(SOURCE, response.getOutput().getGeneric().get(0).getSource());
    System.assertEquals(TITLE, response.getOutput().getGeneric().get(0).getTitle());
    System.assertEquals(MESSAGE, response.getOutput().getGeneric().get(0).getMessageToHumanAgent());
    System.assertEquals(TOPIC, response.getOutput().getGeneric().get(0).getTopic());
    System.assertEquals(LABEL, response.getOutput().getGeneric().get(0).getOptions().get(0).getLabel());
    System.assert(response.getOutput().getGeneric().get(0).getOptions().get(0).getValue().getInput() != null);
    System.assertEquals(LABEL, response.getOutput().getGeneric().get(0).getSuggestions().get(0).getLabel());
    System.assert(response.getOutput().getGeneric().get(0).getSuggestions().get(0).getValue() != null);
    System.assertEquals(KEY_VAL, response.getOutput().getUserDefined());
    Test.stopTest();
  }

  static testMethod void testCreateSession() {
    String body = IBMWatsonMockResponses.sessionResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV2Models.CreateSessionOptions createSessionOptions = new IBMAssistantV2Models.CreateSessionOptionsBuilder()
        .assistantId(ASSISTANT_ID)
        .addHeader(HEADER_NAME, HEADER_VAL)
        .build();
    IBMAssistantV2Models.SessionResponse response = service.createSession(createSessionOptions);

    System.assert(response != null);
    System.assertEquals(SESSION_ID, response.getSessionId());
    Test.stopTest();
  }

  static testMethod void testDeleteSession() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV2Models.DeleteSessionOptions deleteSessionOptions = new IBMAssistantV2Models.DeleteSessionOptionsBuilder()
        .assistantId(ASSISTANT_ID)
        .sessionId(SESSION_ID)
        .addHeader(HEADER_NAME, HEADER_VAL)
        .build();
    service.deleteSession(deleteSessionOptions);

    Test.stopTest();
  }

  static testMethod void testMessageContextSkills() {
    Test.startTest();

    IBMAssistantV2Models.MessageContextSkills messageContextSkills = new IBMAssistantV2Models.MessageContextSkills();
    messageContextSkills.put(NAME, USER_DEFINED);

    System.assert(messageContextSkills.getDynamicProperties().containsKey(NAME));
    System.assertEquals(USER_DEFINED, messageContextSkills.getDynamicProperties().get(NAME));

    Test.stopTest();
  }
}