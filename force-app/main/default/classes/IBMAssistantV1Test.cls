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
private class IBMAssistantV1Test {

  private static String workspaceName;
  private static String workspaceDescription;
  private static String workspaceLanguage;
  private static String workspaceId;
  private static IBMWatsonMapModel metadata;
  private static String timeCreated;
  private static String timeUpdated;
  private static Boolean learningOptOut;
  private static String intentName;
  private static String intentDescription;
  private static String exampleText;
  private static String entityName;
  private static String entityDescription;
  private static String valueName;
  private static String valueType;
  private static String valuePattern;
  private static String valueSynonym;
  private static String counterexampleText;
  private static String refreshUrl;
  private static String nextUrl;
  private static Long paginationTotal;
  private static Long paginationMatched;
  private static Double confidence;
  private static Long entityLocation;
  private static String messageInput;
  private static Boolean alternateIntents;
  private static String conversationId;
  private static String systemResponseKey;
  private static Long systemResponseValue;
  private static String messageResponse;
  private static String nodeVisited;
  private static String nodeVisitedDetailsNode;
  private static String nodeVisitedDetailsTitle;
  private static String nodeVisitedDetailsCondition;
  private static String logMessageLevel;
  private static String logMessageText;
  private static String requestTimestamp;
  private static String responseTimestamp;
  private static String logId;
  private static Boolean fuzzyMatch;
  private static String dialogNodeName;
  private static String dialogNodeDescription;
  private static String dialogNodeTitle;
  private static String dialogNodeConditions;
  private static String dialogNodeParent;
  private static String dialogNodePreviousSibling;
  private static IBMAssistantV1Models.DialogNodeOutput dialogNodeOutput;
  private static IBMWatsonMapModel dialogNodeContext;
  private static String nextStepBehavior;
  private static String nextStepDialogNode;
  private static String nextStepSelector;
  private static String actionName;
  private static String actionType;
  private static IBMWatsonMapModel actionParameters;
  private static String actionResultVariable;
  private static String actionCredentials;
  private static String dialogNodeType;
  private static String dialogNodeEventName;
  private static String dialogNodeVariable;
  private static String dialogNodeDigressIn;
  private static String dialogNodeDigressOut;
  private static String dialogNodeDigressOutSlots;
  private static String nextCursor;
  private static String refreshCursor;
  private static String responseType;
  private static String text;
  private static Long testTime;
  private static String source;
  private static String title;
  private static String description;
  private static String preference;
  private static String label;
  private static String messageToHumanAgent;
  private static String topic;
  private static String headerKey;
  private static String headerVal;

  private static IBMAssistantV1 service;

  static {
    workspaceName = 'test_workspace';
    workspaceDescription = 'Description of ' + workspaceName;
    workspaceLanguage = 'en';
    workspaceId = '123456789';
    metadata = new IBMWatsonMapModel();
    metadata.put('code', 'test_code');
    timeCreated = '"2015-12-06T23:53:59.153Z"';
    timeUpdated = '"2017-10-18T15:44:56.800"';
    learningOptOut = false;
    intentName = 'test_intent';
    intentDescription = 'Description of ' + intentName;
    exampleText = 'Example of ' + intentName;
    entityName = 'test_entity';
    entityDescription = 'Description of ' + entityName;
    valueName = 'Value of ' + entityName;
    valueType = 'value_type';
    valuePattern = 'test_pattern';
    valueSynonym = 'Synonym for value of ' + entityName;
    counterexampleText = 'Counterexample for ' + workspaceName;
    refreshUrl = '/v1/workspaces?version=2016-01-24&page_limit=1';
    nextUrl = '/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1';
    paginationTotal = 1;
    paginationMatched = 1;
    confidence = 0.314159;
    entityLocation = 10;
    messageInput = 'This is a message';
    alternateIntents = false;
    conversationId = '0000000';
    systemResponseKey = 'dialog_turn_counter';
    systemResponseValue = 5;
    messageResponse = 'This is a response';
    nodeVisited = 'node_1';
    nodeVisitedDetailsNode = 'node';
    nodeVisitedDetailsTitle = 'node_title';
    nodeVisitedDetailsCondition = '#condition';
    logMessageLevel = 'warn';
    logMessageText = 'test_warning';
    requestTimestamp = '2017-12-06T23:53:59.153Z';
    responseTimestamp = '2017-12-06T23:54:59.153Z';
    logId = '987654321';
    fuzzyMatch = false;
    dialogNodeName = 'dialog_node';
    dialogNodeDescription = 'Description of ' + dialogNodeName;
    dialogNodeTitle = 'dialog_node_title';
    dialogNodeConditions = '#test';
    dialogNodeParent = 'parent';
    dialogNodePreviousSibling = 'sibling';
    dialogNodeOutput = new IBMAssistantV1Models.DialogNodeOutput();
    dialogNodeOutput.put('text', 'output text');
    dialogNodeContext = new IBMWatsonMapModel();
    dialogNodeContext.put('context', 'context_val');
    nextStepBehavior = 'behavior';
    nextStepDialogNode = 'next_dialog_node';
    nextStepSelector = 'body';
    actionName = 'action';
    actionType = 'server';
    actionParameters = new IBMWatsonMapModel();
    actionParameters.put('param_1', 'param_1_val');
    actionResultVariable = 'action_var';
    actionCredentials = 'creds';
    dialogNodeType = 'standard';
    dialogNodeEventName = 'dialog_node_event';
    dialogNodeVariable = 'dialog_node_var';
    dialogNodeDigressIn = 'returns';
    dialogNodeDigressOut = 'allow_all';
    dialogNodeDigressOutSlots = 'allow_all';
    nextCursor = 'next_cursor';
    refreshCursor = 'refresh_cursor';
    responseType = 'response_type';
    text = 'text';
    testTime = 200L;
    source = 'source';
    title = 'title';
    description = 'description';
    preference = 'preference';
    label = 'label';
    messageToHumanAgent = 'message_to_human_agent';
    topic = 'topic';
    headerKey = 'Test-Header';
    headerVal = 'test_value';

    service = new IBMAssistantV1('2019-02-28', new IBMWatsonNoAuthAuthenticator());
  }

  static testMethod void testCreateWorkspace() {
    String body = IBMWatsonMockResponses.workspace();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.Counterexample counterexample = new IBMAssistantV1Models.CounterexampleBuilder('text')
      .text(counterexampleText)
      .build();
    counterexample = counterexample.newBuilder().build();
    IBMAssistantV1Models.Example createExample = new IBMAssistantV1Models.ExampleBuilder('example').text('example').build();
    createExample = createExample.newBuilder().build();
    IBMAssistantV1Models.CreateIntent createIntent = new IBMAssistantV1Models.CreateIntentBuilder(intentName)
      .intent(intentName)
      .description('test')
      .examples(new List<IBMAssistantV1Models.Example>{createExample})
      .addExamples(createExample)
      .created((Datetime) JSON.deserialize(timeCreated, Datetime.class))
      .updated((Datetime) JSON.deserialize(timeUpdated, Datetime.class))
      .build();
    createIntent = createIntent.newBuilder().build();
    IBMAssistantV1Models.DialogNodeAction dialogNodeAction = new IBMAssistantV1Models.DialogNodeActionBuilder()
      .name('test')
      .xType('test')
      .parameters(metadata)
      .resultVariable('test')
      .credentials('test')
      .build();
    IBMAssistantV1Models.DialogNodeNextStep dialogNodeNextStep=new IBMAssistantV1Models.DialogNodeNextStepBuilder()
      .behavior('test')
      .dialogNode('test')
      .selector('test')
      .build();
    String userLabel = 'user_label';
    IBMAssistantV1Models.DialogNode createDialogNode = new IBMAssistantV1Models.DialogNodeBuilder()
      .addActions(dialogNodeAction)
      .dialogNode('test')
      .description('test')
      .conditions('test')
      .parent('test')
      .previousSibling('test')
      .output(dialogNodeOutput)
      .context(metadata)
      .metadata(metadata)
      .nextStep(dialogNodeNextStep)
      .actions(new List<IBMAssistantV1Models.DialogNodeAction>{dialogNodeAction})
      .title('test')
      .xType('test')
      .eventName('test')
      .variable('test')
      .userLabel(userLabel)
      .build();
    createDialogNode = createDialogNode.newBuilder().build();
    IBMAssistantV1Models.CreateValue createValue = new IBMAssistantV1Models.CreateValueBuilder('test')
      .addSynonyms('test')
      .addPatterns('test')
      .value('test')
      .metadata(metadata)
      .synonyms(new List<String>{'test1', 'test2'})
      .patterns(new List<String>{'test1', 'test2'})
      .xType('test')
      .build();
    createValue = createValue.newBuilder().build();
    IBMAssistantV1Models.CreateEntity createEntity = new IBMAssistantV1Models.CreateEntityBuilder('test')
      .addValues(createValue)
      .entity('test')
      .description('test')
      .metadata(metadata)
      .values(new List<IBMAssistantV1Models.CreateValue>{createValue})
      .created((Datetime) JSON.deserialize(timeCreated, Datetime.class))
      .updated((Datetime) JSON.deserialize(timeUpdated, Datetime.class))
      .build();
    createEntity = createEntity.newBuilder().build();
    IBMAssistantV1Models.WorkspaceSystemSettingsDisambiguation disambiguation = new IBMAssistantV1Models.WorkspaceSystemSettingsDisambiguationBuilder()
      .enabled(true)
      .noneOfTheAbovePrompt('none of the above')
      .prompt('prompt')
      .sensitivity('high')
      .build();
    IBMAssistantV1Models.WorkspaceSystemSettingsTooling tooling = new IBMAssistantV1Models.WorkspaceSystemSettingsToolingBuilder()
      .storeGenericResponses(true)
      .build();
    IBMWatsonMapModel humanAgentAssist = new IBMWatsonMapModel();
    humanAgentAssist.put('help', 'ok');
    IBMAssistantV1Models.WorkspaceSystemSettings systemSettings = new IBMAssistantV1Models.WorkspaceSystemSettingsBuilder()
      .disambiguation(disambiguation)
      .tooling(tooling)
      .humanAgentAssist(humanAgentAssist)
      .build();

    IBMAssistantV1Models.CreateWorkspaceOptions createWorkspaceOptions = new IBMAssistantV1Models.CreateWorkspaceOptionsBuilder()
      .name(workspaceName)
      .description(workspaceDescription)
      .addCounterexamples(counterexample)
      .counterexamples(new List<IBMAssistantV1Models.Counterexample>{counterexample})
      .addIntents(createIntent)
      .intents(new List<IBMAssistantV1Models.CreateIntent>{createIntent})
      .addDialogNodes(createDialogNode)
      .dialogNodes(new List<IBMAssistantV1Models.DialogNode>{createDialogNode})
      .addentities(createEntity)
      .entities(new List<IBMAssistantV1Models.CreateEntity>{createEntity})
      .language(workspaceLanguage)
      .systemSettings(systemSettings)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createWorkspaceOptions = createWorkspaceOptions.newBuilder().build();
    IBMAssistantV1Models.Workspace response = service.createWorkspace(createWorkspaceOptions);

    System.assertEquals(response.getName(), workspaceName);
    System.assertEquals(response.getDescription(), workspaceDescription);
    System.assertEquals(response.getLanguage(), workspaceLanguage);
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getWorkspaceId(), workspaceId);
    System.assertEquals(response.getLearningOptOut(), learningOptOut);
    System.assert(response.getSystemSettings() != null);
    System.assertEquals(response.getSystemSettings().getDisambiguation().getNoneOfTheAbovePrompt(), disambiguation.getNoneOfTheAbovePrompt());
    System.assertEquals(response.getSystemSettings().getDisambiguation().getPrompt(), disambiguation.getPrompt());
    System.assertEquals(response.getSystemSettings().getDisambiguation().getSensitivity(), disambiguation.getSensitivity());
    System.assertEquals(response.getSystemSettings().getDisambiguation().getEnabled(), disambiguation.getEnabled());
    System.assertEquals(response.getSystemSettings().getTooling().getStoreGenericResponses(), tooling.getStoreGenericResponses());
    Test.stopTest();
  }

  static testMethod void testDeleteWorkspace() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteWorkspaceOptions deleteOptions = new IBMAssistantV1Models.DeleteWorkspaceOptionsBuilder()
      .workspaceId(workspaceId)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteWorkspace(deleteOptions);

    Test.stopTest();
  }

  static testMethod void testGetWorkspace() {
    String body = IBMWatsonMockResponses.workspaceExport();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String xsort = 'stable';

    IBMAssistantV1Models.GetWorkspaceOptions getOptions = new IBMAssistantV1Models.GetWorkspaceOptionsBuilder()
      .workspaceId(workspaceId)
      .xexport(true)
      .includeAudit(true)
      .xsort(xsort)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();

    System.assertEquals(workspaceId, getOptions.workspaceId());
    System.assert(getOptions.xexport());
    System.assert(getOptions.includeAudit());
    System.assertEquals(xsort, getOptions.xsort());

    IBMAssistantV1Models.Workspace response = service.getWorkspace(getOptions);

    System.assertEquals(response.getName(), workspaceName);
    System.assertEquals(response.getDescription(), workspaceDescription);
    System.assertEquals(response.getLanguage(), workspaceLanguage);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getIntents().get(0).getIntent(), intentName);
    System.assertEquals(response.getIntents().get(0).getDescription(), intentDescription);
    System.assertEquals(response.getIntents().get(0).getExamples().get(0).getText(), exampleText);
    System.assertEquals(response.getEntities().get(0).getEntity(), entityName);
    System.assertEquals(response.getEntities().get(0).getDescription(), entityDescription);
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getValue(), valueName);
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getSynonyms().get(0), valueSynonym);
    System.assertEquals(response.getCounterexamples().get(0).getText(), counterexampleText);
    System.assertEquals(response.getDialogNodes(), new List<IBMAssistantV1Models.DialogNode>());
    Test.stopTest();
  }

  static testMethod void updateWorkspace() {
    String body = IBMWatsonMockResponses.workspace();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMAssistantV1Models.WorkspaceSystemSettingsDisambiguation disambiguation = new IBMAssistantV1Models.WorkspaceSystemSettingsDisambiguationBuilder()
      .enabled(true)
      .noneOfTheAbovePrompt('none of the above')
      .prompt('prompt')
      .sensitivity('high')
      .build();
    IBMAssistantV1Models.WorkspaceSystemSettingsTooling tooling = new IBMAssistantV1Models.WorkspaceSystemSettingsToolingBuilder()
      .storeGenericResponses(true)
      .build();
    IBMWatsonMapModel humanAgentAssist = new IBMWatsonMapModel();
    humanAgentAssist.put('help', 'ok');
    IBMAssistantV1Models.WorkspaceSystemSettings systemSettings = new IBMAssistantV1Models.WorkspaceSystemSettingsBuilder()
      .disambiguation(disambiguation)
      .tooling(tooling)
      .humanAgentAssist(humanAgentAssist)
      .build();

    IBMAssistantV1Models.UpdateWorkspaceOptions updateOptions = new IBMAssistantV1Models.UpdateWorkspaceOptionsBuilder()
      .workspaceId(workspaceId)
      .systemSettings(systemSettings)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.Workspace response = service.updateWorkspace(updateOptions);

    System.assertEquals(response.getName(), workspaceName);
    System.assertEquals(response.getDescription(), workspaceDescription);
    System.assertEquals(response.getLanguage(), workspaceLanguage);
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getWorkspaceId(), workspaceId);
    System.assertEquals(response.getLearningOptOut(), learningOptOut);
    System.assert(response.getSystemSettings() != null);
    System.assertEquals(response.getSystemSettings().getDisambiguation().getNoneOfTheAbovePrompt(), disambiguation.getNoneOfTheAbovePrompt());
    System.assertEquals(response.getSystemSettings().getDisambiguation().getSensitivity(), disambiguation.getSensitivity());
    System.assertEquals(response.getSystemSettings().getDisambiguation().getPrompt(), disambiguation.getPrompt());
    System.assertEquals(response.getSystemSettings().getDisambiguation().getEnabled(), disambiguation.getEnabled());
    System.assertEquals(response.getSystemSettings().getTooling().getStoreGenericResponses(), tooling.getStoreGenericResponses());
    Test.stopTest();
  }

  static testMethod void testListWorkspaces() {
    String body = IBMWatsonMockResponses.workspaceCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListWorkspacesOptions listOptions = new IBMAssistantV1Models.ListWorkspacesOptionsBuilder()
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.WorkspaceCollection response = service.listWorkspaces(listOptions);

    System.assertEquals(response.getWorkspaces().get(0).getName(), workspaceName);
    System.assertEquals(response.getWorkspaces().get(0).getDescription(), workspaceDescription);
    System.assertEquals(response.getWorkspaces().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getWorkspaces().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getWorkspaces().get(0).getMetadata(), metadata);
    System.assertEquals(response.getWorkspaces().get(0).getWorkspaceId(), workspaceId);
    System.assertEquals(response.getWorkspaces().get(0).getLearningOptOut(), learningOptOut);
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    Test.stopTest();
  }

  static testMethod void createValue() {
    String body = IBMWatsonMockResponses.value();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.CreateValue createValue = new IBMAssistantV1Models.CreateValueBuilder()
      .value('value')
      .build();
    createValue = createValue.newBuilder().build();
    IBMAssistantV1Models.CreateValueOptions createOptions = new IBMAssistantV1Models.CreateValueOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .metadata(metadata)
      .addPatterns(valuePattern)
      .addSynonyms(valueSynonym)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.Value response = service.createValue(createOptions);

    System.assertEquals(response.getValue(), valueName);
    System.assertEquals(response.getXType(), valueType);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getPatterns().get(0), valuePattern);
    System.assertEquals(response.getSynonyms().get(0), valueSynonym);
    Test.stopTest();
  }

  static testMethod void deleteValue() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteValueOptions deleteOptions = new IBMAssistantV1Models.DeleteValueOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteValue(deleteOptions);

    Test.stopTest();
  }

  static testMethod void getValue() {
    String body = IBMWatsonMockResponses.value();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.GetValueOptions getOptions = new IBMAssistantV1Models.GetValueOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .xexport(true)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();
    IBMAssistantV1Models.Value response = service.getValue(getOptions);

    System.assertEquals(response.getValue(), valueName);
    System.assertEquals(response.getXType(), valueType);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getPatterns().get(0), valuePattern);
    System.assertEquals(response.getSynonyms().get(0), valueSynonym);
    Test.stopTest();
  }

  static testMethod void updateValue() {
    String body = IBMWatsonMockResponses.value();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.UpdateValueOptions updateOptions = new IBMAssistantV1Models.UpdateValueOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .newMetadata(metadata)
      .addNewPatterns(valuePattern)
      .addNewSynonyms(valueSynonym)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.Value response = service.updateValue(updateOptions);

    System.assertEquals(response.getValue(), valueName);
    System.assertEquals(response.getXType(), valueType);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getPatterns().get(0), valuePattern);
    System.assertEquals(response.getSynonyms().get(0), valueSynonym);
    Test.stopTest();
  }

  static testMethod void listValues() {
    String body = IBMWatsonMockResponses.valueCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListValuesOptions listOptions = new IBMAssistantV1Models.ListValuesOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.ValueCollection response = service.listValues(listOptions);

    System.assertEquals(response.getValues().get(0).getValue(), valueName);
    System.assertEquals(response.getValues().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getValues().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getValues().get(0).getMetadata(), metadata);
    System.assertEquals(response.getValues().get(0).getPatterns().get(0), valuePattern);
    System.assertEquals(response.getValues().get(0).getSynonyms().get(0), valueSynonym);
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    Test.stopTest();
  }

  static testMethod void testContext() {
    Test.startTest();
    String conversationId = 'conversation_id';

    IBMAssistantV1Models.SystemResponse systemResponse = new IBMAssistantV1Models.SystemResponse();
    IBMAssistantV1Models.MessageContextMetadata metadata = new IBMAssistantV1Models.MessageContextMetadata();
    IBMAssistantV1Models.Context context = new IBMAssistantV1Models.ContextBuilder()
      .conversationId(conversationId)
      .xsystem(systemResponse)
      .metadata(metadata)
      .build();

    System.assertEquals(conversationId, context.getConversationId());
    System.assertEquals(systemResponse, context.getXsystem());
    System.assertEquals(metadata, context.getMetadata());
    Test.stopTest();
  }

  static testMethod void testMessageContextMetadata() {
    Test.startTest();
    String deployment = 'deployment';
    String userId = 'user_id';

    IBMAssistantV1Models.MessageContextMetadata metadata = new IBMAssistantV1Models.MessageContextMetadataBuilder()
      .deployment(deployment)
      .userId(userId)
      .build();

    System.assertEquals(deployment, metadata.getDeployment());
    System.assertEquals(userId, metadata.getUserId());
    Test.stopTest();
  }

  static testMethod void message() {
    String body = IBMWatsonMockResponses.messageResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.MessageInput input = new IBMAssistantV1Models.MessageInputBuilder()
      .text(messageInput)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    input = input.newBuilder().build();
    IBMAssistantV1Models.MessageOptions messageOptions = new IBMAssistantV1Models.MessageOptionsBuilder()
      .workspaceId(workspaceId)
      .input(input)
      .alternateIntents(alternateIntents)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    messageOptions = messageOptions.newBuilder().build();
    IBMAssistantV1Models.MessageResponse response = service.message(messageOptions);

    System.assertEquals(response.getIntents().get(0).getIntent(), intentName);
    System.assertEquals(response.getIntents().get(0).getConfidence(), confidence);
    System.assertEquals(response.getEntities().get(0).getEntity(), entityName);
    System.assertEquals(response.getEntities().get(0).getLocation().get(0), entityLocation);
    System.assertEquals(response.getEntities().get(0).getValue(), valueName);
    System.assertEquals(response.getEntities().get(0).getConfidence(), confidence);
    System.assertEquals(response.getInput().getText(), messageInput);
    System.assertEquals(response.getAlternateIntents(), alternateIntents);
    System.assertEquals(response.getContext().getConversationId(), conversationId);
    System.assertEquals(Long.valueOf((String) response.getContext().getXsystem().get(systemResponseKey)), systemResponseValue);
    System.assertEquals(response.getOutput().getText().get(0), messageResponse);
    System.assertEquals(response.getOutput().getNodesVisited().get(0), nodeVisited);
    System.assertEquals(response.getOutput().getNodesVisitedDetails().get(0).getDialogNode(), nodeVisitedDetailsNode);
    System.assertEquals(response.getOutput().getNodesVisitedDetails().get(0).getTitle(), nodeVisitedDetailsTitle);
    System.assertEquals(response.getOutput().getNodesVisitedDetails().get(0).getConditions(), nodeVisitedDetailsCondition);
    System.assertEquals(response.getOutput().getLogMessages().get(0).getLevel(), logMessageLevel);
    System.assertEquals(response.getOutput().getLogMessages().get(0).getMsg(), logMessageText);
    System.assertEquals(response.getOutput().getGeneric().get(0).getDescription(), description);
    System.assertEquals(response.getOutput().getGeneric().get(0).getDialogNode(), dialogNodeName);
    System.assertEquals(response.getOutput().getGeneric().get(0).getMessageToHumanAgent(), messageToHumanAgent);
    System.assertEquals(response.getOutput().getGeneric().get(0).getOptions().get(0).getLabel(), label);
    System.assertEquals(response.getOutput().getGeneric().get(0).getOptions().get(0).getValue().getInput().getText(), text);
    System.assertEquals(response.getOutput().getGeneric().get(0).getOptions().get(0).getValue().getIntents().get(0).getIntent(), intentName);
    System.assertEquals(response.getOutput().getGeneric().get(0).getOptions().get(0).getValue().getEntities().get(0).getEntity(), entityName);
    System.assertEquals(response.getOutput().getGeneric().get(0).getPreference(), preference);
    System.assertEquals(response.getOutput().getGeneric().get(0).getResponseType(), responseType);
    System.assertEquals(response.getOutput().getGeneric().get(0).getSource(), source);
    System.assertEquals(response.getOutput().getGeneric().get(0).getSuggestions().get(0).getDialogNode(), dialogNodeName);
    System.assertEquals(response.getOutput().getGeneric().get(0).getSuggestions().get(0).getLabel(), label);
    System.assertEquals(response.getOutput().getGeneric().get(0).getSuggestions().get(0).getValue().getInput().getText(), text);
    System.assertEquals(response.getOutput().getGeneric().get(0).getSuggestions().get(0).getValue().getIntents().get(0).getIntent(), intentName);
    System.assertEquals(response.getOutput().getGeneric().get(0).getSuggestions().get(0).getValue().getIntents().get(0).getConfidence(), confidence);
    System.assertEquals(response.getOutput().getGeneric().get(0).getSuggestions().get(0).getValue().getEntities().get(0).getEntity(), entityName);
    System.assertEquals(response.getOutput().getGeneric().get(0).getText(), text);
    System.assertEquals(response.getOutput().getGeneric().get(0).getTitle(), title);
    System.assertEquals(response.getOutput().getGeneric().get(0).getTopic(), topic);
    System.assert(response.getOutput().getGeneric().get(0).getTyping());
    System.assertEquals(response.getOutput().getGeneric().get(0).getXtime(), testTime);
    System.assertEquals(response.getActions().get(0).getName(), actionName);
    System.assertEquals(response.getActions().get(0).getXType(), actionType);
    System.assertEquals(response.getActions().get(0).getParameters(), actionParameters);
    System.assertEquals(response.getActions().get(0).getResultVariable(), actionResultVariable);
    System.assertEquals(response.getActions().get(0).getCredentials(), actionCredentials);
    Test.stopTest();
  }

  static testMethod void createIntent() {
    String body = IBMWatsonMockResponses.intent();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.CreateIntentOptions createOptions = new IBMAssistantV1Models.CreateIntentOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .description(intentDescription)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.Intent response = service.createIntent(createOptions);

    System.assertEquals(response.getIntent(), intentName);
    System.assertEquals(response.getDescription(), intentDescription);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void deleteIntent() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteIntentOptions deleteOptions = new IBMAssistantV1Models.DeleteIntentOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteIntent(deleteOptions);

    Test.stopTest();
  }

  static testMethod void getIntent() {
    String body = IBMWatsonMockResponses.intentExport();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.GetIntentOptions getOptions = new IBMAssistantV1Models.GetIntentOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .xexport(true)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();
    IBMAssistantV1Models.Intent response = service.getIntent(getOptions);

    System.assertEquals(response.getIntent(), intentName);
    System.assertEquals(response.getDescription(), intentDescription);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getExamples().get(0).getText(), exampleText);
    System.assertEquals(response.getExamples().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getExamples().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void listIntents() {
    String body = IBMWatsonMockResponses.intentCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListIntentsOptions listOptions = new IBMAssistantV1Models.ListIntentsOptionsBuilder()
      .workspaceId(workspaceId)
      .xexport(true)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.IntentCollection response = service.listIntents(listOptions);

    System.assertEquals(response.getIntents().get(0).getIntent(), intentName);
    System.assertEquals(response.getIntents().get(0).getDescription(), intentDescription);
    System.assertEquals(response.getIntents().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getIntents().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getIntents().get(0).getExamples().get(0).getText(), exampleText);
    System.assertEquals(response.getIntents().get(0).getExamples().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getIntents().get(0).getExamples().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    System.assertEquals(response.getPagination().getNextCursor(), nextCursor);
    System.assertEquals(response.getPagination().getRefreshCursor(), refreshCursor);
    Test.stopTest();
  }

  static testMethod void updateIntent() {
    String body = IBMWatsonMockResponses.intent();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.UpdateIntentOptions updateOptions = new IBMAssistantV1Models.UpdateIntentOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .newDescription(intentDescription)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.Intent response = service.updateIntent(updateOptions);

    System.assertEquals(response.getIntent(), intentName);
    System.assertEquals(response.getDescription(), intentDescription);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void createExample() {
    String body = IBMWatsonMockResponses.example();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.Mention mentions1 = new IBMAssistantV1Models.MentionBuilder()
      .entity('entity')
      .location(new List<Long> { 0L, 10L })
      .build();
    List<IBMAssistantV1Models.Mention> mentionsList = new List<IBMAssistantV1Models.Mention>();
    mentionsList.add(mentions1);
    IBMAssistantV1Models.Mention mentions2 = new IBMAssistantV1Models.MentionBuilder()
      .entity('second_entity')
      .location(new List<Long> { 0L, 10L })
      .build();

    IBMAssistantV1Models.CreateExampleOptions createOptions = new IBMAssistantV1Models.CreateExampleOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .text(exampleText)
      .mentions(mentionsList)
      .addMentions(mentions2)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.Example response = service.createExample(createOptions);

    mentionsList.add(mentions2);

    System.assertEquals(response.getText(), exampleText);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void deleteExample() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteExampleOptions deleteOptions = new IBMAssistantV1Models.DeleteExampleOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .text('example A')
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteExample(deleteOptions);

    Test.stopTest();
  }

  static testMethod void getExample() {
    String body = IBMWatsonMockResponses.example();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.GetExampleOptions getOptions = new IBMAssistantV1Models.GetExampleOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .text(exampleText)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();
    IBMAssistantV1Models.Example response = service.getExample(getOptions);

    System.assertEquals(response.getText(), exampleText);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void listExamples() {
    String body = IBMWatsonMockResponses.exampleCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListExamplesOptions listOptions = new IBMAssistantV1Models.ListExamplesOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.ExampleCollection response = service.listExamples(listOptions);

    System.assertEquals(response.getExamples().get(0).getText(), exampleText);
    System.assertEquals(response.getExamples().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getExamples().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    Test.stopTest();
  }

  static testMethod void updateExample() {
    String body = IBMWatsonMockResponses.example();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.Mention mentions1 = new IBMAssistantV1Models.MentionBuilder()
      .entity('entity')
      .location(new List<Long> { 0L, 10L })
      .build();
    List<IBMAssistantV1Models.Mention> mentionsList = new List<IBMAssistantV1Models.Mention>();
    mentionsList.add(mentions1);
    IBMAssistantV1Models.Mention mentions2 = new IBMAssistantV1Models.MentionBuilder()
      .entity('second_entity')
      .location(new List<Long> { 0L, 10L })
      .build();

    IBMAssistantV1Models.UpdateExampleOptions updateOptions = new IBMAssistantV1Models.UpdateExampleOptionsBuilder()
      .workspaceId(workspaceId)
      .intent(intentName)
      .text(exampleText)
      .newText(exampleText)
      .newMentions(mentionsList)
      .addNewMentions(mentions2)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.Example response = service.updateExample(updateOptions);

    System.assertEquals(response.getText(), exampleText);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void createEntity() {
    String body = IBMWatsonMockResponses.entity();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.CreateEntityOptions createOptions = new IBMAssistantV1Models.CreateEntityOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .description(entityDescription)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.Entity response = service.createEntity(createOptions);

    System.assertEquals(response.getEntity(), entityName);
    System.assertEquals(response.getDescription(), entityDescription);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getFuzzyMatch(), fuzzyMatch);
    Test.stopTest();
  }

  static testMethod void deleteEntity() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteEntityOptions deleteOptions = new IBMAssistantV1Models.DeleteEntityOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteEntity(deleteOptions);

    Test.stopTest();
  }

  static testMethod void getEntity() {
    String body = IBMWatsonMockResponses.entityExport();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.GetEntityOptions getOptions = new IBMAssistantV1Models.GetEntityOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .xexport(true)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();
    IBMAssistantV1Models.Entity response = service.getEntity(getOptions);

    System.assertEquals(response.getEntity(), entityName);
    System.assertEquals(response.getDescription(), entityDescription);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getFuzzyMatch(), fuzzyMatch);
    System.assertEquals(response.getValues().get(0).getValue(), valueName);
    System.assertEquals(response.getValues().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getValues().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getValues().get(0).getMetadata(), metadata);
    System.assertEquals(response.getValues().get(0).getPatterns().get(0), valuePattern);
    System.assertEquals(response.getValues().get(0).getSynonyms().get(0), valueSynonym);
    Test.stopTest();
  }

  static testMethod void listEntities() {
    String body = IBMWatsonMockResponses.entityCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListEntitiesOptions listOptions = new IBMAssistantV1Models.ListEntitiesOptionsBuilder()
      .workspaceId(workspaceId)
      .xexport(true)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.EntityCollection response = service.listEntities(listOptions);

    System.assertEquals(response.getEntities().get(0).getEntity(), entityName);
    System.assertEquals(response.getEntities().get(0).getDescription(), entityDescription);
    System.assertEquals(response.getEntities().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getEntities().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getEntities().get(0).getMetadata(), metadata);
    System.assertEquals(response.getEntities().get(0).getFuzzyMatch(), fuzzyMatch);
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getValue(), valueName);
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getMetadata(), metadata);
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getPatterns().get(0), valuePattern);
    System.assertEquals(response.getEntities().get(0).getValues().get(0).getSynonyms().get(0), valueSynonym);
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    Test.stopTest();
  }

  static testMethod void updateEntity() {
    String body = IBMWatsonMockResponses.entity();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.UpdateEntityOptions updateOptions = new IBMAssistantV1Models.UpdateEntityOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .newDescription(entityDescription)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.Entity response = service.updateEntity(updateOptions);

    System.assertEquals(response.getEntity(), entityName);
    System.assertEquals(response.getDescription(), entityDescription);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getFuzzyMatch(), fuzzyMatch);
    Test.stopTest();
  }

  static testMethod void createSynonym() {
    String body = IBMWatsonMockResponses.synonym();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.Synonym synonym = new IBMAssistantV1Models.SynonymBuilder()
      .synonym('synonym')
      .build();
    synonym = synonym.newBuilder().build();
    IBMAssistantV1Models.CreateSynonymOptions createOptions = new IBMAssistantV1Models.CreateSynonymOptionsBuilder()
      .synonym(synonym)
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .synonym(valueSynonym)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.Synonym response = service.createSynonym(createOptions);

    System.assertEquals(response.getSynonym(), valueSynonym);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void deleteSynonym() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteSynonymOptions deleteOptions = new IBMAssistantV1Models.DeleteSynonymOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .synonym(valueSynonym)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteSynonym(deleteOptions);

    Test.stopTest();
  }

  static testMethod void getSynonym() {
    String body = IBMWatsonMockResponses.synonym();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.GetSynonymOptions getOptions = new IBMAssistantV1Models.GetSynonymOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .synonym(valueSynonym)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();
    IBMAssistantV1Models.Synonym response = service.getSynonym(getOptions);

    System.assertEquals(response.getSynonym(), valueSynonym);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void listSynonyms() {
    String body = IBMWatsonMockResponses.synonymCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListSynonymsOptions listOptions = new IBMAssistantV1Models.ListSynonymsOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.SynonymCollection response = service.listSynonyms(listOptions);

    System.assertEquals(response.getSynonyms().get(0).getSynonym(), valueSynonym);
    System.assertEquals(response.getSynonyms().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getSynonyms().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    Test.stopTest();
  }

  static testMethod void updateSynonym() {
    String body = IBMWatsonMockResponses.synonym();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.UpdateSynonymOptions updateOptions = new IBMAssistantV1Models.UpdateSynonymOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entityName)
      .value(valueName)
      .synonym(valueSynonym)
      .newSynonym(valueSynonym)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.Synonym response = service.updateSynonym(updateOptions);

    System.assertEquals(response.getSynonym(), valueSynonym);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void createDialogNode() {
    String body = IBMWatsonMockResponses.dialogNode();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
        200,
        'Success',
        body,
        null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String userLabel = 'user_label';
    IBMAssistantV1Models.CreateDialogNodeOptions createOptions = new IBMAssistantV1Models.CreateDialogNodeOptionsBuilder()
      .workspaceId(workspaceId)
      .dialogNode(dialogNodeName)
      .digressIn(dialogNodeDigressIn)
      .digressOut(dialogNodeDigressOut)
      .digressOutSlots(dialogNodeDigressOutSlots)
      .userLabel(userLabel)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.DialogNode response = service.createDialogNode(createOptions);

    System.assertEquals(response.getDialogNode(), dialogNodeName);
    System.assertEquals(response.getDescription(), dialogNodeDescription);
    System.assertEquals(response.getTitle(), dialogNodeTitle);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getConditions(), dialogNodeConditions);
    System.assertEquals(response.getParent(), dialogNodeParent);
    System.assertEquals(response.getPreviousSibling(), dialogNodePreviousSibling);
    System.assertEquals(response.getNextStep().getDialogNode(), nextStepDialogNode);
    System.assertEquals(response.getNextStep().getBehavior(), nextStepBehavior);
    System.assertEquals(response.getNextStep().getSelector(), nextStepSelector);
    System.assertEquals(response.getOutput(), dialogNodeOutput);
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getContext(), dialogNodeContext);
    System.assertEquals(response.getActions().get(0).getName(), actionName);
    System.assertEquals(response.getActions().get(0).getXType(), actionType);
    System.assertEquals(response.getActions().get(0).getParameters(), actionParameters);
    System.assertEquals(response.getActions().get(0).getResultVariable(), actionResultVariable);
    System.assertEquals(response.getActions().get(0).getCredentials(), actionCredentials);
    System.assertEquals(response.getXType(), dialogNodeType);
    System.assertEquals(response.getEventName(), dialogNodeEventName);
    System.assertEquals(response.getVariable(), dialogNodeVariable);
    System.assertEquals(response.getDigressIn(), dialogNodeDigressIn);
    System.assertEquals(response.getDigressOut(), dialogNodeDigressOut);
    System.assertEquals(response.getDigressOutSlots(), dialogNodeDigressOutSlots);
    Test.stopTest();
  }

  static testMethod void deleteDialogNode() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteDialogNodeOptions deleteOptions = new IBMAssistantV1Models.DeleteDialogNodeOptionsBuilder()
      .workspaceId(workspaceId)
      .dialogNode(dialogNodeName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteDialogNode(deleteOptions);

    Test.stopTest();
  }

  static testMethod void getDialogNode() {
    String body = IBMWatsonMockResponses.dialogNode();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.GetDialogNodeOptions getOptions = new IBMAssistantV1Models.GetDialogNodeOptionsBuilder()
      .workspaceId(workspaceId)
      .dialogNode(dialogNodeName)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();
    IBMAssistantV1Models.DialogNode response = service.getDialogNode(getOptions);

    System.assertEquals(response.getDialogNode(), dialogNodeName);
    System.assertEquals(response.getDescription(), dialogNodeDescription);
    System.assertEquals(response.getTitle(), dialogNodeTitle);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getConditions(), dialogNodeConditions);
    System.assertEquals(response.getParent(), dialogNodeParent);
    System.assertEquals(response.getPreviousSibling(), dialogNodePreviousSibling);
    System.assertEquals(response.getNextStep().getDialogNode(), nextStepDialogNode);
    System.assertEquals(response.getNextStep().getBehavior(), nextStepBehavior);
    System.assertEquals(response.getNextStep().getSelector(), nextStepSelector);
    System.assertEquals(response.getOutput(), dialogNodeOutput);
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getContext(), dialogNodeContext);
    System.assertEquals(response.getActions().get(0).getName(), actionName);
    System.assertEquals(response.getActions().get(0).getXType(), actionType);
    System.assertEquals(response.getActions().get(0).getParameters(), actionParameters);
    System.assertEquals(response.getActions().get(0).getResultVariable(), actionResultVariable);
    System.assertEquals(response.getActions().get(0).getCredentials(), actionCredentials);
    System.assertEquals(response.getXType(), dialogNodeType);
    System.assertEquals(response.getEventName(), dialogNodeEventName);
    System.assertEquals(response.getVariable(), dialogNodeVariable);
    Test.stopTest();
  }

  static testMethod void listDialogNodes() {
    String body = IBMWatsonMockResponses.dialogNodeCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListDialogNodesOptions listOptions = new IBMAssistantV1Models.ListDialogNodesOptionsBuilder()
      .workspaceId(workspaceId)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.DialogNodeCollection response = service.listDialogNodes(listOptions);

    System.assertEquals(response.getDialogNodes().get(0).getDialogNode(), dialogNodeName);
    System.assertEquals(response.getDialogNodes().get(0).getDescription(), dialogNodeDescription);
    System.assertEquals(response.getDialogNodes().get(0).getTitle(), dialogNodeTitle);
    System.assertEquals(response.getDialogNodes().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getDialogNodes().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getDialogNodes().get(0).getConditions(), dialogNodeConditions);
    System.assertEquals(response.getDialogNodes().get(0).getParent(), dialogNodeParent);
    System.assertEquals(response.getDialogNodes().get(0).getPreviousSibling(), dialogNodePreviousSibling);
    System.assertEquals(response.getDialogNodes().get(0).getNextStep().getDialogNode(), nextStepDialogNode);
    System.assertEquals(response.getDialogNodes().get(0).getNextStep().getBehavior(), nextStepBehavior);
    System.assertEquals(response.getDialogNodes().get(0).getNextStep().getSelector(), nextStepSelector);
    System.assertEquals(response.getDialogNodes().get(0).getOutput(), dialogNodeOutput);
    System.assertEquals(response.getDialogNodes().get(0).getMetadata(), metadata);
    System.assertEquals(response.getDialogNodes().get(0).getContext(), dialogNodeContext);
    System.assertEquals(response.getDialogNodes().get(0).getActions().get(0).getName(), actionName);
    System.assertEquals(response.getDialogNodes().get(0).getActions().get(0).getParameters(), actionParameters);
    System.assertEquals(response.getDialogNodes().get(0).getActions().get(0).getResultVariable(), actionResultVariable);
    System.assertEquals(response.getDialogNodes().get(0).getActions().get(0).getCredentials(), actionCredentials);
    System.assertEquals(response.getDialogNodes().get(0).getEventName(), dialogNodeEventName);
    System.assertEquals(response.getDialogNodes().get(0).getVariable(), dialogNodeVariable);
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    Test.stopTest();
  }

  static testMethod void updateDialogNode() {
    String body = IBMWatsonMockResponses.dialogNode();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String newUserLabel = 'new_user_label';

    IBMAssistantV1Models.UpdateDialogNodeOptions updateOptions = new IBMAssistantV1Models.UpdateDialogNodeOptionsBuilder()
      .workspaceId(workspaceId)
      .dialogNode(dialogNodeName)
      .newDialogNode(dialogNodeName)
      .newDescription(dialogNodeDescription)
      .newDigressIn(dialogNodeDigressIn)
      .newDigressOut(dialogNodeDigressOut)
      .newDigressOutSlots(dialogNodeDigressOutSlots)
      .newUserLabel(newUserLabel)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.DialogNode response = service.updateDialogNode(updateOptions);

    System.assertEquals(response.getDialogNode(), dialogNodeName);
    System.assertEquals(response.getDescription(), dialogNodeDescription);
    System.assertEquals(response.getTitle(), dialogNodeTitle);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getConditions(), dialogNodeConditions);
    System.assertEquals(response.getParent(), dialogNodeParent);
    System.assertEquals(response.getPreviousSibling(), dialogNodePreviousSibling);
    System.assertEquals(response.getNextStep().getDialogNode(), nextStepDialogNode);
    System.assertEquals(response.getNextStep().getBehavior(), nextStepBehavior);
    System.assertEquals(response.getNextStep().getSelector(), nextStepSelector);
    System.assertEquals(response.getOutput(), dialogNodeOutput);
    System.assertEquals(response.getMetadata(), metadata);
    System.assertEquals(response.getContext(), dialogNodeContext);
    System.assertEquals(response.getActions().get(0).getName(), actionName);
    System.assertEquals(response.getActions().get(0).getParameters(), actionParameters);
    System.assertEquals(response.getActions().get(0).getResultVariable(), actionResultVariable);
    System.assertEquals(response.getActions().get(0).getCredentials(), actionCredentials);
    System.assertEquals(response.getEventName(), dialogNodeEventName);
    System.assertEquals(response.getVariable(), dialogNodeVariable);
    System.assertEquals(response.getDigressIn(), dialogNodeDigressIn);
    System.assertEquals(response.getDigressOut(), dialogNodeDigressOut);
    System.assertEquals(response.getDigressOutSlots(), dialogNodeDigressOutSlots);
    Test.stopTest();
  }

  static testMethod void listLogs() {
    String body = IBMWatsonMockResponses.logCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListLogsOptions listOptions = new IBMAssistantV1Models.ListLogsOptionsBuilder()
      .workspaceId(workspaceId)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.LogCollection response = service.listLogs(listOptions);

    System.assertEquals(response.getLogs().get(0).getRequest().getInput().getText(), messageInput);
    System.assertEquals(response.getLogs().get(0).getResponse().getIntents().get(0).getIntent(), intentName);
    System.assertEquals(response.getLogs().get(0).getResponse().getIntents().get(0).getConfidence(), confidence);
    System.assertEquals(response.getLogs().get(0).getResponse().getEntities().get(0).getEntity(), entityName);
    System.assertEquals(response.getLogs().get(0).getResponse().getEntities().get(0).getLocation().get(0), entityLocation);
    System.assertEquals(response.getLogs().get(0).getResponse().getEntities().get(0).getValue(), valueName);
    System.assertEquals(response.getLogs().get(0).getResponse().getEntities().get(0).getConfidence(), confidence);
    System.assertEquals(response.getLogs().get(0).getResponse().getInput().getText(), messageInput);
    System.assertEquals(response.getLogs().get(0).getResponse().getAlternateIntents(), alternateIntents);
    System.assertEquals(response.getLogs().get(0).getResponse().getContext().getConversationId(), conversationId);
    System.assertEquals(Long.valueOf((String)response.getLogs().get(0).getResponse().getContext().getXsystem().get(systemResponseKey)), systemResponseValue);
    System.assertEquals(response.getLogs().get(0).getResponse().getOutput().getText().get(0), messageResponse);
    System.assertEquals(response.getLogs().get(0).getResponse().getOutput().getNodesVisited().get(0), nodeVisited);
    System.assertEquals(response.getLogs().get(0).getResponse().getOutput().getLogMessages().get(0).getLevel(), logMessageLevel);
    System.assertEquals(response.getLogs().get(0).getResponse().getOutput().getLogMessages().get(0).getMsg(), logMessageText);
    System.assertEquals(response.getLogs().get(0).getLanguage(), workspaceLanguage);
    System.assertEquals(response.getLogs().get(0).getWorkspaceId(), workspaceId);
    System.assertEquals(response.getLogs().get(0).getRequestTimestamp(), requestTimestamp);
    System.assertEquals(response.getLogs().get(0).getResponseTimestamp(), responseTimestamp);
    System.assertEquals(response.getLogs().get(0).getLogId(), logId);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    System.assertEquals(response.getPagination().getNextCursor(), nextCursor);
    Test.stopTest();
  }

  static testMethod void testCreateCounterexample() {
    String body = IBMWatsonMockResponses.counterexample();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.Counterexample counterexample = new IBMAssistantV1Models.CounterexampleBuilder()
      .text('text')
      .build();
    counterexample = counterexample.newBuilder().build();
    IBMAssistantV1Models.CreateCounterexampleOptions createOptions = new IBMAssistantV1Models.CreateCounterexampleOptionsBuilder()
      .counterexample(counterexample)
      .workspaceId(workspaceId)
      .text(counterexampleText)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.Counterexample response = service.createCounterexample(createOptions);

    System.assertEquals(response.getText(), counterexampleText);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void testCreateCounterexample2() {
    String body = IBMWatsonMockResponses.counterexample();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.CreateCounterexampleOptions createOptions =
      new IBMAssistantV1Models.CreateCounterexampleOptionsBuilder(workspaceId,counterexampleText)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    createOptions = createOptions.newBuilder().build();
    IBMAssistantV1Models.Counterexample response = service.createCounterexample(createOptions);

    System.assertEquals(response.getText(), counterexampleText);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void testDeleteCounterexample() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.DeleteCounterexampleOptions deleteOptions = new IBMAssistantV1Models.DeleteCounterexampleOptionsBuilder()
      .workspaceId(workspaceId)
      .text(counterexampleText)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteCounterexample(deleteOptions);

    Test.stopTest();
  }

  static testMethod void testGetCounterexample() {
    String body = IBMWatsonMockResponses.counterexample();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.GetCounterexampleOptions getOptions = new IBMAssistantV1Models.GetCounterexampleOptionsBuilder()
      .workspaceId(workspaceId)
      .text(counterexampleText)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    getOptions = getOptions.newBuilder().build();
    IBMAssistantV1Models.Counterexample response = service.getCounterexample(getOptions);

    System.assertEquals(response.getText(), counterexampleText);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    Test.stopTest();
  }

  static testMethod void testListCounterexamples() {
    String body = IBMWatsonMockResponses.counterexampleCollection();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.ListCounterexamplesOptions listOptions = new IBMAssistantV1Models.ListCounterexamplesOptionsBuilder()
      .workspaceId(workspaceId)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listOptions = listOptions.newBuilder().build();
    IBMAssistantV1Models.CounterexampleCollection response = service.listCounterexamples(listOptions);

    System.assertEquals(response.getCounterexamples().get(0).getText(), counterexampleText);
    System.assertEquals(response.getCounterexamples().get(0).getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getCounterexamples().get(0).getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
    System.assertEquals(response.getPagination().getRefreshUrl(), refreshUrl);
    System.assertEquals(response.getPagination().getNextUrl(), nextUrl);
    System.assertEquals(response.getPagination().getTotal(), paginationTotal);
    System.assertEquals(response.getPagination().getMatched(), paginationMatched);
    Test.stopTest();
  }

  static testMethod void testUpdateCounterexample() {
    String body = IBMWatsonMockResponses.counterexample();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMAssistantV1Models.UpdateCounterexampleOptions updateOptions = new IBMAssistantV1Models.UpdateCounterexampleOptionsBuilder()
      .workspaceId(workspaceId)
      .text(counterexampleText)
      .newText(counterexampleText)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    updateOptions = updateOptions.newBuilder().build();
    IBMAssistantV1Models.Counterexample response = service.updateCounterexample(updateOptions);

    System.assertEquals(response.getText(), counterexampleText);
    System.assertEquals(response.getCreated(), (Datetime) JSON.deserialize(timeCreated, Datetime.class));
    System.assertEquals(response.getUpdated(), (Datetime) JSON.deserialize(timeUpdated, Datetime.class));
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
    IBMAssistantV1Models.DeleteUserDataOptions deleteOptions = new IBMAssistantV1Models.DeleteUserDataOptionsBuilder()
      .customerId(customerId)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    deleteOptions = deleteOptions.newBuilder().build();
    service.deleteUserData(deleteOptions);

    Test.stopTest();
  }

  static testMethod void testListMentions() {
    String body = IBMWatsonMockResponses.mentions();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    String entity = 'amenity';

    IBMAssistantV1Models.ListMentionsOptions listMentionsOptions = new IBMAssistantV1Models.ListMentionsOptionsBuilder()
      .workspaceId(workspaceId)
      .entity(entity)
      .addHeader(headerKey, headerVal)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    listMentionsOptions = listMentionsOptions.newBuilder().build();
    IBMAssistantV1Models.EntityMentionCollection response = service.listMentions(listMentionsOptions);

    System.assert(!response.getExamples().isEmpty());

    Test.stopTest();
  }
}