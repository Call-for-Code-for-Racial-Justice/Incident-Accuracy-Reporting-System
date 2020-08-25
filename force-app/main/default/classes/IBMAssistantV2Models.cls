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

public class IBMAssistantV2Models {
  /**
   * CaptureGroup.
   */
  public class CaptureGroup extends IBMWatsonGenericModel {
    private String xGroup;
    private List<Long> location;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public CaptureGroup() { }

    /**
     * Gets the xGroup.
     *
     * A recognized capture group for the entity.
     *
     * @return the xGroup
     */
    @AuraEnabled
    public String getXGroup() {
      return xGroup;
    }

    /**
     * Gets the location.
     *
     * Zero-based character offsets that indicate where the entity value begins and ends in the input text.
     *
     * @return the location
     */
    @AuraEnabled
    public List<Long> getLocation() {
      return location;
    }
  
    private CaptureGroup(CaptureGroupBuilder builder) {
      IBMWatsonValidator.notNull(builder.xGroup, 'xGroup cannot be null');
      this.xGroup = builder.xGroup;
      this.location = builder.location;
    }

    /**
     * New builder.
     *
     * @return a CaptureGroup builder
     */
    public CaptureGroupBuilder newBuilder() {
      return new CaptureGroupBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'group' => 'xGroup'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CaptureGroup ret = (CaptureGroup) super.deserialize(jsonString, jsonMap, classType);
      CaptureGroupBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xGroup' => 'group'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * CaptureGroup Builder.
   */
  public class CaptureGroupBuilder {
    private String xGroup;
    private List<Long> location;

    private CaptureGroupBuilder(CaptureGroup captureGroup) {
      this.xGroup = captureGroup.xGroup;
      this.location = captureGroup.location;
    }

    /**
     * Instantiates a new builder.
     */
    public CaptureGroupBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param xGroup the xGroup
     */
    public CaptureGroupBuilder(String xGroup) {
      this.xGroup = xGroup;
    }

    /**
     * Builds a CaptureGroup.
     *
     * @return the captureGroup
     */
    public CaptureGroup build() {
      return new CaptureGroup(this);
    }

    /**
     * Adds an location to location.
     *
     * @param location the new location
     * @return the CaptureGroup builder
     */
    public CaptureGroupBuilder addLocation(Long location) {
      IBMWatsonValidator.notNull(location, 'location cannot be null');
      if (this.location == null) {
        this.location = new List<Long>();
      }
      this.location.add(location);
      return this;
    }

    /**
     * Set the xGroup.
     *
     * @param xGroup the xGroup
     * @return the CaptureGroup builder
     */
    public CaptureGroupBuilder xGroup(String xGroup) {
      this.xGroup = xGroup;
      return this;
    }

    /**
     * Set the location.
     * Existing location will be replaced.
     *
     * @param location the location
     * @return the CaptureGroup builder
     */
    public CaptureGroupBuilder location(List<Long> location) {
      this.location = location;
      return this;
    }
  }

  /**
   * The createSession options.
   */
  public class CreateSessionOptions extends IBMWatsonOptionsModel {
    private String assistantId;

    /**
     * Gets the assistantId.
     *
     * Unique identifier of the assistant. To find the assistant ID in the Watson Assistant user interface, open the
     * assistant settings and click **API Details**. For information about creating assistants, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-assistant-add#assistant-add-task).
     *
     * **Note:** Currently, the v2 API does not support creating assistants.
     *
     * @return the assistantId
     */
    public String assistantId() {
      return assistantId;
    }

    private CreateSessionOptions(CreateSessionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.assistantId, 'assistantId cannot be empty');
      assistantId = builder.assistantId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateSessionOptions builder
     */
    public CreateSessionOptionsBuilder newBuilder() {
      return new CreateSessionOptionsBuilder(this);
    }
  }

  /**
   * CreateSessionOptions Builder.
   */
  public class CreateSessionOptionsBuilder extends IBMWatsonOptionsModel {
    private String assistantId;

    private CreateSessionOptionsBuilder(CreateSessionOptions createSessionOptions) {
      assistantId = createSessionOptions.assistantId;
      this.requestHeaders.putAll(createSessionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateSessionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param assistantId the assistantId
     */
    public CreateSessionOptionsBuilder(String assistantId) {
      this.assistantId = assistantId;
    }

    /**
     * Builds a CreateSessionOptions.
     *
     * @return the createSessionOptions
     */
    public CreateSessionOptions build() {
      return new CreateSessionOptions(this);
    }

    /**
     * Set the assistantId.
     *
     * @param assistantId the assistantId
     * @return the CreateSessionOptions builder
     */
    public CreateSessionOptionsBuilder assistantId(String assistantId) {
      this.assistantId = assistantId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateSessionOptions builder
     */
    public CreateSessionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteSession options.
   */
  public class DeleteSessionOptions extends IBMWatsonOptionsModel {
    private String assistantId;
    private String sessionId;

    /**
     * Gets the assistantId.
     *
     * Unique identifier of the assistant. To find the assistant ID in the Watson Assistant user interface, open the
     * assistant settings and click **API Details**. For information about creating assistants, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-assistant-add#assistant-add-task).
     *
     * **Note:** Currently, the v2 API does not support creating assistants.
     *
     * @return the assistantId
     */
    public String assistantId() {
      return assistantId;
    }

    /**
     * Gets the sessionId.
     *
     * Unique identifier of the session.
     *
     * @return the sessionId
     */
    public String sessionId() {
      return sessionId;
    }

    private DeleteSessionOptions(DeleteSessionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.assistantId, 'assistantId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.sessionId, 'sessionId cannot be empty');
      assistantId = builder.assistantId;
      sessionId = builder.sessionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteSessionOptions builder
     */
    public DeleteSessionOptionsBuilder newBuilder() {
      return new DeleteSessionOptionsBuilder(this);
    }
  }

  /**
   * DeleteSessionOptions Builder.
   */
  public class DeleteSessionOptionsBuilder extends IBMWatsonOptionsModel {
    private String assistantId;
    private String sessionId;

    private DeleteSessionOptionsBuilder(DeleteSessionOptions deleteSessionOptions) {
      assistantId = deleteSessionOptions.assistantId;
      sessionId = deleteSessionOptions.sessionId;
      this.requestHeaders.putAll(deleteSessionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteSessionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param assistantId the assistantId
     * @param sessionId the sessionId
     */
    public DeleteSessionOptionsBuilder(String assistantId, String sessionId) {
      this.assistantId = assistantId;
      this.sessionId = sessionId;
    }

    /**
     * Builds a DeleteSessionOptions.
     *
     * @return the deleteSessionOptions
     */
    public DeleteSessionOptions build() {
      return new DeleteSessionOptions(this);
    }

    /**
     * Set the assistantId.
     *
     * @param assistantId the assistantId
     * @return the DeleteSessionOptions builder
     */
    public DeleteSessionOptionsBuilder assistantId(String assistantId) {
      this.assistantId = assistantId;
      return this;
    }

    /**
     * Set the sessionId.
     *
     * @param sessionId the sessionId
     * @return the DeleteSessionOptions builder
     */
    public DeleteSessionOptionsBuilder sessionId(String sessionId) {
      this.sessionId = sessionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteSessionOptions builder
     */
    public DeleteSessionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Dialog log message details.
   */
  public class DialogLogMessage extends IBMWatsonGenericModel {
    private String level;
    private String message;

    /**
     * Gets the level.
     *
     * The severity of the log message.
     *
     * @return the level
     */
    @AuraEnabled
    public String getLevel() {
      return level;
    }

    /**
     * Gets the message.
     *
     * The text of the log message.
     *
     * @return the message
     */
    @AuraEnabled
    public String getMessage() {
      return message;
    }

    /**
     * Sets the level.
     *
     * @param level the new level
     */
    public void setLevel(final String level) {
      this.level = level;
    }

    /**
     * Sets the message.
     *
     * @param message the new message
     */
    public void setMessage(final String message) {
      this.message = message;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogLogMessage ret = (DialogLogMessage) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * DialogNodeAction.
   */
  public class DialogNodeAction extends IBMWatsonGenericModel {
    private String name;
    private String xType;
    private IBMWatsonMapModel parameters;
    private String resultVariable;
    private String credentials;

    /**
     * Gets the name.
     *
     * The name of the action.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the xType.
     *
     * The type of action to invoke.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the parameters.
     *
     * A map of key/value pairs to be provided to the action.
     *
     * @return the parameters
     */
    @AuraEnabled
    public IBMWatsonMapModel getParameters() {
      return parameters;
    }

    /**
     * Gets the resultVariable.
     *
     * The location in the dialog context where the result of the action is stored.
     *
     * @return the resultVariable
     */
    @AuraEnabled
    public String getResultVariable() {
      return resultVariable;
    }

    /**
     * Gets the credentials.
     *
     * The name of the context variable that the client application will use to pass in credentials for the action.
     *
     * @return the credentials
     */
    @AuraEnabled
    public String getCredentials() {
      return credentials;
    }

    /**
     * Sets the name.
     *
     * @param name the new name
     */
    public void setName(final String name) {
      this.name = name;
    }

    /**
     * Sets the xType.
     *
     * @param xType the new xType
     */
    public void setXType(final String xType) {
      this.xType = xType;
    }

    /**
     * Sets the parameters.
     *
     * @param parameters the new parameters
     */
    public void setParameters(final IBMWatsonMapModel parameters) {
      this.parameters = parameters;
    }

    /**
     * Sets the resultVariable.
     *
     * @param resultVariable the new resultVariable
     */
    public void setResultVariable(final String resultVariable) {
      this.resultVariable = resultVariable;
    }

    /**
     * Sets the credentials.
     *
     * @param credentials the new credentials
     */
    public void setCredentials(final String credentials) {
      this.credentials = credentials;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType',
        'result_variable' => 'resultVariable'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DialogNodeAction ret = (DialogNodeAction) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for parameters
      Map<String, Object> parametersMap = (Map<String, Object>) jsonMap.get('parameters');
      IBMWatsonMapModel newParameters = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(parametersMap, true), parametersMap, IBMWatsonMapModel.class);
      ret.setParameters(newParameters);

      return ret;
    }
  }

  /**
   * DialogNodeOutputOptionsElement.
   */
  public class DialogNodeOutputOptionsElement extends IBMWatsonGenericModel {
    private String label;
    private DialogNodeOutputOptionsElementValue value;

    /**
     * Gets the label.
     *
     * The user-facing label for the option.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
    }

    /**
     * Gets the value.
     *
     * An object defining the message input to be sent to the assistant if the user selects the corresponding option.
     *
     * @return the value
     */
    @AuraEnabled
    public DialogNodeOutputOptionsElementValue getValue() {
      return value;
    }

    /**
     * Sets the label.
     *
     * @param label the new label
     */
    public void setLabel(final String label) {
      this.label = label;
    }

    /**
     * Sets the value.
     *
     * @param value the new value
     */
    public void setValue(final DialogNodeOutputOptionsElementValue value) {
      this.value = value;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogNodeOutputOptionsElement ret = (DialogNodeOutputOptionsElement) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for value
      Map<String, Object> valueMap = (Map<String, Object>) jsonMap.get('value');
      DialogNodeOutputOptionsElementValue newValue = (DialogNodeOutputOptionsElementValue) new DialogNodeOutputOptionsElementValue().deserialize(JSON.serialize(valueMap, true), valueMap, DialogNodeOutputOptionsElementValue.class);
      ret.setValue(newValue);

      return ret;
    }
  }

  /**
   * An object defining the message input to be sent to the assistant if the user selects the corresponding option.
   */
  public class DialogNodeOutputOptionsElementValue extends IBMWatsonGenericModel {
    private MessageInput input;

    /**
     * Gets the input.
     *
     * An input object that includes the input text.
     *
     * @return the input
     */
    @AuraEnabled
    public MessageInput getInput() {
      return input;
    }

    /**
     * Sets the input.
     *
     * @param input the new input
     */
    public void setInput(final MessageInput input) {
      this.input = input;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogNodeOutputOptionsElementValue ret = (DialogNodeOutputOptionsElementValue) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for input
      Map<String, Object> inputMap = (Map<String, Object>) jsonMap.get('input');
      MessageInput newInput = (MessageInput) new MessageInput().deserialize(JSON.serialize(inputMap, true), inputMap, MessageInput.class);
      ret.setInput(newInput);

      return ret;
    }
  }

  /**
   * DialogNodesVisited.
   */
  public class DialogNodesVisited extends IBMWatsonGenericModel {
    private String dialogNode;
    private String title;
    private String conditions;

    /**
     * Gets the dialogNode.
     *
     * A dialog node that was triggered during processing of the input message.
     *
     * @return the dialogNode
     */
    @AuraEnabled
    public String getDialogNode() {
      return dialogNode;
    }

    /**
     * Gets the title.
     *
     * The title of the dialog node.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the conditions.
     *
     * The conditions that trigger the dialog node.
     *
     * @return the conditions
     */
    @AuraEnabled
    public String getConditions() {
      return conditions;
    }

    /**
     * Sets the dialogNode.
     *
     * @param dialogNode the new dialogNode
     */
    public void setDialogNode(final String dialogNode) {
      this.dialogNode = dialogNode;
    }

    /**
     * Sets the title.
     *
     * @param title the new title
     */
    public void setTitle(final String title) {
      this.title = title;
    }

    /**
     * Sets the conditions.
     *
     * @param conditions the new conditions
     */
    public void setConditions(final String conditions) {
      this.conditions = conditions;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dialog_node' => 'dialogNode'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DialogNodesVisited ret = (DialogNodesVisited) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * DialogSuggestion.
   */
  public class DialogSuggestion extends IBMWatsonGenericModel {
    private String label;
    private DialogSuggestionValue value;
    private IBMWatsonMapModel output;

    /**
     * Gets the label.
     *
     * The user-facing label for the disambiguation option. This label is taken from the **title** or **user_label**
     * property of the corresponding dialog node, depending on the disambiguation options.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
    }

    /**
     * Gets the value.
     *
     * An object defining the message input to be sent to the assistant if the user selects the corresponding
     * disambiguation option.
     *
     * @return the value
     */
    @AuraEnabled
    public DialogSuggestionValue getValue() {
      return value;
    }

    /**
     * Gets the output.
     *
     * The dialog output that will be returned from the Watson Assistant service if the user selects the corresponding
     * option.
     *
     * @return the output
     */
    @AuraEnabled
    public IBMWatsonMapModel getOutput() {
      return output;
    }

    /**
     * Sets the label.
     *
     * @param label the new label
     */
    public void setLabel(final String label) {
      this.label = label;
    }

    /**
     * Sets the value.
     *
     * @param value the new value
     */
    public void setValue(final DialogSuggestionValue value) {
      this.value = value;
    }

    /**
     * Sets the output.
     *
     * @param output the new output
     */
    public void setOutput(final IBMWatsonMapModel output) {
      this.output = output;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogSuggestion ret = (DialogSuggestion) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for value
      Map<String, Object> valueMap = (Map<String, Object>) jsonMap.get('value');
      DialogSuggestionValue newValue = (DialogSuggestionValue) new DialogSuggestionValue().deserialize(JSON.serialize(valueMap, true), valueMap, DialogSuggestionValue.class);
      ret.setValue(newValue);

      // calling custom deserializer for output
      Map<String, Object> outputMap = (Map<String, Object>) jsonMap.get('output');
      IBMWatsonMapModel newOutput = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(outputMap, true), outputMap, IBMWatsonMapModel.class);
      ret.setOutput(newOutput);

      return ret;
    }
  }

  /**
   * An object defining the message input to be sent to the assistant if the user selects the corresponding
   * disambiguation option.
   */
  public class DialogSuggestionValue extends IBMWatsonGenericModel {
    private MessageInput input;

    /**
     * Gets the input.
     *
     * An input object that includes the input text.
     *
     * @return the input
     */
    @AuraEnabled
    public MessageInput getInput() {
      return input;
    }

    /**
     * Sets the input.
     *
     * @param input the new input
     */
    public void setInput(final MessageInput input) {
      this.input = input;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogSuggestionValue ret = (DialogSuggestionValue) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for input
      Map<String, Object> inputMap = (Map<String, Object>) jsonMap.get('input');
      MessageInput newInput = (MessageInput) new MessageInput().deserialize(JSON.serialize(inputMap, true), inputMap, MessageInput.class);
      ret.setInput(newInput);

      return ret;
    }
  }

  /**
   * MessageContext.
   */
  public class MessageContext extends IBMWatsonGenericModel {
    private MessageContextGlobal xGlobal;
    private MessageContextSkills skills;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageContext() { }

    /**
     * Gets the xGlobal.
     *
     * Information that is shared by all skills used by the Assistant.
     *
     * @return the xGlobal
     */
    @AuraEnabled
    public MessageContextGlobal getXGlobal() {
      return xGlobal;
    }

    /**
     * Gets the skills.
     *
     * Information specific to particular skills used by the Assistant.
     *
     * **Note:** Currently, only a single property named `main skill` is supported. This object contains variables that
     * apply to the dialog skill used by the assistant.
     *
     * @return the skills
     */
    @AuraEnabled
    public MessageContextSkills getSkills() {
      return skills;
    }
  
    private MessageContext(MessageContextBuilder builder) {
      this.xGlobal = builder.xGlobal;
      this.skills = builder.skills;
    }

    /**
     * New builder.
     *
     * @return a MessageContext builder
     */
    public MessageContextBuilder newBuilder() {
      return new MessageContextBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'global' => 'xGlobal'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageContext ret = (MessageContext) super.deserialize(jsonString, jsonMap, classType);
      MessageContextBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for xGlobal
      Map<String, Object> xGlobalMap = (Map<String, Object>) jsonMap.get('xGlobal');
      MessageContextGlobal newXGlobal = (MessageContextGlobal) new MessageContextGlobal().deserialize(JSON.serialize(xGlobalMap, true), xGlobalMap, MessageContextGlobal.class);
      retBuilder.xGlobal(newXGlobal);

      // calling custom deserializer for skills
      Map<String, Object> skillsMap = (Map<String, Object>) jsonMap.get('skills');
      MessageContextSkills newSkills = (MessageContextSkills) new MessageContextSkills().deserialize(JSON.serialize(skillsMap, true), skillsMap, MessageContextSkills.class);
      retBuilder.skills(newSkills);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xGlobal' => 'global'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for xGlobal
      if (xGlobal != null) {
        String xGlobalJsonString = JSON.serialize(xGlobal.replacePropertyNames(), true);
        String xGlobalKey = 'xGlobal';
        if (propertyNameMapping.containsKey(xGlobalKey)) {
          xGlobalKey = propertyNameMapping.get(xGlobalKey);
        }
        jsonMap.put(xGlobalKey, JSON.deserializeUntyped(xGlobalJsonString));
      }

      // performing custom serialization for skills
      if (skills != null) {
        String skillsJsonString = JSON.serialize(skills.replacePropertyNames(), true);
        String skillsKey = 'skills';
        if (propertyNameMapping.containsKey(skillsKey)) {
          skillsKey = propertyNameMapping.get(skillsKey);
        }
        jsonMap.put(skillsKey, JSON.deserializeUntyped(skillsJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * MessageContext Builder.
   */
  public class MessageContextBuilder {
    private MessageContextGlobal xGlobal;
    private MessageContextSkills skills;

    private MessageContextBuilder(MessageContext messageContext) {
      this.xGlobal = messageContext.xGlobal;
      this.skills = messageContext.skills;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageContextBuilder() {
    }

    /**
     * Builds a MessageContext.
     *
     * @return the messageContext
     */
    public MessageContext build() {
      return new MessageContext(this);
    }

    /**
     * Set the xGlobal.
     *
     * @param xGlobal the xGlobal
     * @return the MessageContext builder
     */
    public MessageContextBuilder xGlobal(MessageContextGlobal xGlobal) {
      this.xGlobal = xGlobal;
      return this;
    }

    /**
     * Set the skills.
     *
     * @param skills the skills
     * @return the MessageContext builder
     */
    public MessageContextBuilder skills(MessageContextSkills skills) {
      this.skills = skills;
      return this;
    }
  }

  /**
   * Information that is shared by all skills used by the Assistant.
   */
  public class MessageContextGlobal extends IBMWatsonGenericModel {
    private MessageContextGlobalSystem xSystem;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageContextGlobal() { }

    /**
     * Gets the xSystem.
     *
     * Built-in system properties that apply to all skills used by the assistant.
     *
     * @return the xSystem
     */
    @AuraEnabled
    public MessageContextGlobalSystem getXSystem() {
      return xSystem;
    }
  
    private MessageContextGlobal(MessageContextGlobalBuilder builder) {
      this.xSystem = builder.xSystem;
    }

    /**
     * New builder.
     *
     * @return a MessageContextGlobal builder
     */
    public MessageContextGlobalBuilder newBuilder() {
      return new MessageContextGlobalBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'system' => 'xSystem'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageContextGlobal ret = (MessageContextGlobal) super.deserialize(jsonString, jsonMap, classType);
      MessageContextGlobalBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for xSystem
      Map<String, Object> xSystemMap = (Map<String, Object>) jsonMap.get('xSystem');
      MessageContextGlobalSystem newXSystem = (MessageContextGlobalSystem) new MessageContextGlobalSystem().deserialize(JSON.serialize(xSystemMap, true), xSystemMap, MessageContextGlobalSystem.class);
      retBuilder.xSystem(newXSystem);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xSystem' => 'system'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for xSystem
      if (xSystem != null) {
        String xSystemJsonString = JSON.serialize(xSystem.replacePropertyNames(), true);
        String xSystemKey = 'xSystem';
        if (propertyNameMapping.containsKey(xSystemKey)) {
          xSystemKey = propertyNameMapping.get(xSystemKey);
        }
        jsonMap.put(xSystemKey, JSON.deserializeUntyped(xSystemJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * MessageContextGlobal Builder.
   */
  public class MessageContextGlobalBuilder {
    private MessageContextGlobalSystem xSystem;

    private MessageContextGlobalBuilder(MessageContextGlobal messageContextGlobal) {
      this.xSystem = messageContextGlobal.xSystem;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageContextGlobalBuilder() {
    }

    /**
     * Builds a MessageContextGlobal.
     *
     * @return the messageContextGlobal
     */
    public MessageContextGlobal build() {
      return new MessageContextGlobal(this);
    }

    /**
     * Set the xSystem.
     *
     * @param xSystem the xSystem
     * @return the MessageContextGlobal builder
     */
    public MessageContextGlobalBuilder xSystem(MessageContextGlobalSystem xSystem) {
      this.xSystem = xSystem;
      return this;
    }
  }

  /**
   * Built-in system properties that apply to all skills used by the assistant.
   */
  public class MessageContextGlobalSystem extends IBMWatsonGenericModel {
    private String timezone;
    private String userId;
    private Long turnCount;
    private String locale;
    private String referenceTime;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageContextGlobalSystem() { }

    /**
     * Gets the timezone.
     *
     * The user time zone. The assistant uses the time zone to correctly resolve relative time references.
     *
     * @return the timezone
     */
    @AuraEnabled
    public String getTimezone() {
      return timezone;
    }

    /**
     * Gets the userId.
     *
     * A string value that identifies the user who is interacting with the assistant. The client must provide a unique
     * identifier for each individual end user who accesses the application. For Plus and Premium plans, this user ID is
     * used to identify unique users for billing purposes. This string cannot contain carriage return, newline, or tab
     * characters.
     *
     * @return the userId
     */
    @AuraEnabled
    public String getUserId() {
      return userId;
    }

    /**
     * Gets the turnCount.
     *
     * A counter that is automatically incremented with each turn of the conversation. A value of 1 indicates that this
     * is the the first turn of a new conversation, which can affect the behavior of some skills (for example,
     * triggering the start node of a dialog).
     *
     * @return the turnCount
     */
    @AuraEnabled
    public Long getTurnCount() {
      return turnCount;
    }

    /**
     * Gets the locale.
     *
     * The language code for localization in the user input. The specified locale overrides the default for the
     * assistant, and is used for interpreting entity values in user input such as date values. For example,
     * `04/03/2018` might be interpreted either as April 3 or March 4, depending on the locale.
     *
     *  This property is included only if the new system entities are enabled for the skill.
     *
     * @return the locale
     */
    @AuraEnabled
    public String getLocale() {
      return locale;
    }

    /**
     * Gets the referenceTime.
     *
     * The base time for interpreting any relative time mentions in the user input. The specified time overrides the
     * current server time, and is used to calculate times mentioned in relative terms such as `now` or `tomorrow`. This
     * can be useful for simulating past or future times for testing purposes, or when analyzing documents such as news
     * articles.
     *
     * This value must be a UTC time value formatted according to ISO 8601 (for example, `2019-06-26T12:00:00Z` for noon
     * on 26 June 2019.
     *
     * This property is included only if the new system entities are enabled for the skill.
     *
     * @return the referenceTime
     */
    @AuraEnabled
    public String getReferenceTime() {
      return referenceTime;
    }
  
    private MessageContextGlobalSystem(MessageContextGlobalSystemBuilder builder) {
      this.timezone = builder.timezone;
      this.userId = builder.userId;
      this.turnCount = builder.turnCount;
      this.locale = builder.locale;
      this.referenceTime = builder.referenceTime;
    }

    /**
     * New builder.
     *
     * @return a MessageContextGlobalSystem builder
     */
    public MessageContextGlobalSystemBuilder newBuilder() {
      return new MessageContextGlobalSystemBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'user_id' => 'userId',
        'turn_count' => 'turnCount',
        'reference_time' => 'referenceTime'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageContextGlobalSystem ret = (MessageContextGlobalSystem) super.deserialize(jsonString, jsonMap, classType);
      MessageContextGlobalSystemBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'userId' => 'user_id',
        'turnCount' => 'turn_count',
        'referenceTime' => 'reference_time'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * MessageContextGlobalSystem Builder.
   */
  public class MessageContextGlobalSystemBuilder {
    private String timezone;
    private String userId;
    private Long turnCount;
    private String locale;
    private String referenceTime;

    private MessageContextGlobalSystemBuilder(MessageContextGlobalSystem messageContextGlobalSystem) {
      this.timezone = messageContextGlobalSystem.timezone;
      this.userId = messageContextGlobalSystem.userId;
      this.turnCount = messageContextGlobalSystem.turnCount;
      this.locale = messageContextGlobalSystem.locale;
      this.referenceTime = messageContextGlobalSystem.referenceTime;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageContextGlobalSystemBuilder() {
    }

    /**
     * Builds a MessageContextGlobalSystem.
     *
     * @return the messageContextGlobalSystem
     */
    public MessageContextGlobalSystem build() {
      return new MessageContextGlobalSystem(this);
    }

    /**
     * Set the timezone.
     *
     * @param timezone the timezone
     * @return the MessageContextGlobalSystem builder
     */
    public MessageContextGlobalSystemBuilder timezone(String timezone) {
      this.timezone = timezone;
      return this;
    }

    /**
     * Set the userId.
     *
     * @param userId the userId
     * @return the MessageContextGlobalSystem builder
     */
    public MessageContextGlobalSystemBuilder userId(String userId) {
      this.userId = userId;
      return this;
    }

    /**
     * Set the turnCount.
     *
     * @param turnCount the turnCount
     * @return the MessageContextGlobalSystem builder
     */
    public MessageContextGlobalSystemBuilder turnCount(Long turnCount) {
      this.turnCount = turnCount;
      return this;
    }

    /**
     * Set the locale.
     *
     * @param locale the locale
     * @return the MessageContextGlobalSystem builder
     */
    public MessageContextGlobalSystemBuilder locale(String locale) {
      this.locale = locale;
      return this;
    }

    /**
     * Set the referenceTime.
     *
     * @param referenceTime the referenceTime
     * @return the MessageContextGlobalSystem builder
     */
    public MessageContextGlobalSystemBuilder referenceTime(String referenceTime) {
      this.referenceTime = referenceTime;
      return this;
    }
  }

  /**
   * Contains information specific to a particular skill used by the Assistant.
   */
  public class MessageContextSkill extends IBMWatsonGenericModel {
    private IBMWatsonMapModel userDefined;
    private IBMWatsonMapModel xSystem;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageContextSkill() { }

    /**
     * Gets the userDefined.
     *
     * Arbitrary variables that can be read and written by a particular skill.
     *
     * @return the userDefined
     */
    @AuraEnabled
    public IBMWatsonMapModel getUserDefined() {
      return userDefined;
    }

    /**
     * Gets the xSystem.
     *
     * For internal use only.
     *
     * @return the xSystem
     */
    @AuraEnabled
    public IBMWatsonMapModel getXSystem() {
      return xSystem;
    }
  
    private MessageContextSkill(MessageContextSkillBuilder builder) {
      this.userDefined = builder.userDefined;
      this.xSystem = builder.xSystem;
    }

    /**
     * New builder.
     *
     * @return a MessageContextSkill builder
     */
    public MessageContextSkillBuilder newBuilder() {
      return new MessageContextSkillBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'user_defined' => 'userDefined',
        'system' => 'xSystem'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageContextSkill ret = (MessageContextSkill) super.deserialize(jsonString, jsonMap, classType);
      MessageContextSkillBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for userDefined
      Map<String, Object> userDefinedMap = (Map<String, Object>) jsonMap.get('userDefined');
      IBMWatsonMapModel newUserDefined = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(userDefinedMap, true), userDefinedMap, IBMWatsonMapModel.class);
      retBuilder.userDefined(newUserDefined);

      // calling custom deserializer for xSystem
      Map<String, Object> xSystemMap = (Map<String, Object>) jsonMap.get('xSystem');
      IBMWatsonMapModel newXSystem = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(xSystemMap, true), xSystemMap, IBMWatsonMapModel.class);
      retBuilder.xSystem(newXSystem);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'userDefined' => 'user_defined',
        'xSystem' => 'system'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for userDefined
      if (userDefined != null) {
        String userDefinedJsonString = JSON.serialize(userDefined.replacePropertyNames(), true);
        String userDefinedKey = 'userDefined';
        if (propertyNameMapping.containsKey(userDefinedKey)) {
          userDefinedKey = propertyNameMapping.get(userDefinedKey);
        }
        jsonMap.put(userDefinedKey, JSON.deserializeUntyped(userDefinedJsonString));
      }

      // performing custom serialization for xSystem
      if (xSystem != null) {
        String xSystemJsonString = JSON.serialize(xSystem.replacePropertyNames(), true);
        String xSystemKey = 'xSystem';
        if (propertyNameMapping.containsKey(xSystemKey)) {
          xSystemKey = propertyNameMapping.get(xSystemKey);
        }
        jsonMap.put(xSystemKey, JSON.deserializeUntyped(xSystemJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * MessageContextSkill Builder.
   */
  public class MessageContextSkillBuilder {
    private IBMWatsonMapModel userDefined;
    private IBMWatsonMapModel xSystem;

    private MessageContextSkillBuilder(MessageContextSkill messageContextSkill) {
      this.userDefined = messageContextSkill.userDefined;
      this.xSystem = messageContextSkill.xSystem;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageContextSkillBuilder() {
    }

    /**
     * Builds a MessageContextSkill.
     *
     * @return the messageContextSkill
     */
    public MessageContextSkill build() {
      return new MessageContextSkill(this);
    }

    /**
     * Set the userDefined.
     *
     * @param userDefined the userDefined
     * @return the MessageContextSkill builder
     */
    public MessageContextSkillBuilder userDefined(IBMWatsonMapModel userDefined) {
      this.userDefined = userDefined;
      return this;
    }

    /**
     * Set the xSystem.
     *
     * @param xSystem the xSystem
     * @return the MessageContextSkill builder
     */
    public MessageContextSkillBuilder xSystem(IBMWatsonMapModel xSystem) {
      this.xSystem = xSystem;
      return this;
    }
  }

  /**
   * Information specific to particular skills used by the Assistant.

**Note:** Currently, only a single property named `main skill` is supported. This object contains variables that apply to the dialog skill used by the assistant.
   */
  public class MessageContextSkills extends IBMWatsonDynamicModel {
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageContextSkills() { }

    /**
     * Gets the dynamic properties attached to MessageContextSkills.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private MessageContextSkills(MessageContextSkillsBuilder builder) {
    }

    /**
     * New builder.
     *
     * @return a MessageContextSkills builder
     */
    public MessageContextSkillsBuilder newBuilder() {
      return new MessageContextSkillsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      MessageContextSkills ret = (MessageContextSkills) super.deserialize(jsonString, jsonMap, classType);
      MessageContextSkillsBuilder retBuilder = ret.newBuilder();

      MessageContextSkills builderResult = retBuilder.build();
      Set<String> baseProps = ((Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true))).keySet();

      for (String key : jsonMap.keySet()) {
        if (!baseProps.contains(key)) {
          builderResult.put(key, jsonMap.get(key));
        }
      }

      return builderResult;
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      jsonMap = IBMWatsonJSONUtil.raiseAdditionalProperties(jsonMap);

      return jsonMap;
    }
  }

  /**
   * MessageContextSkills Builder.
   */
  public class MessageContextSkillsBuilder {

    private MessageContextSkillsBuilder(MessageContextSkills messageContextSkills) {
    }

    /**
     * Instantiates a new builder.
     */
    public MessageContextSkillsBuilder() { }

    /**
     * Builds a MessageContextSkills.
     *
     * @return the messageContextSkills
     */
    public MessageContextSkills build() {
      return new MessageContextSkills(this);
    }
  }

  /**
   * An input object that includes the input text.
   */
  public class MessageInput extends IBMWatsonGenericModel {
    private String messageType;
    private String text;
    private MessageInputOptions options;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private String suggestionId;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageInput() { }

    /**
     * Gets the messageType.
     *
     * The type of user input. Currently, only text input is supported.
     *
     * @return the messageType
     */
    @AuraEnabled
    public String getMessageType() {
      return messageType;
    }

    /**
     * Gets the text.
     *
     * The text of the user input. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the options.
     *
     * Optional properties that control how the assistant responds.
     *
     * @return the options
     */
    @AuraEnabled
    public MessageInputOptions getOptions() {
      return options;
    }

    /**
     * Gets the intents.
     *
     * Intents to use when evaluating the user input. Include intents from the previous response to continue using those
     * intents rather than trying to recognize intents in the new input.
     *
     * @return the intents
     */
    @AuraEnabled
    public List<RuntimeIntent> getIntents() {
      return intents;
    }

    /**
     * Gets the entities.
     *
     * Entities to use when evaluating the message. Include entities from the previous response to continue using those
     * entities rather than detecting entities in the new input.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<RuntimeEntity> getEntities() {
      return entities;
    }

    /**
     * Gets the suggestionId.
     *
     * For internal use only.
     *
     * @return the suggestionId
     */
    @AuraEnabled
    public String getSuggestionId() {
      return suggestionId;
    }
  
    private MessageInput(MessageInputBuilder builder) {
      this.messageType = builder.messageType;
      this.text = builder.text;
      this.options = builder.options;
      this.intents = builder.intents;
      this.entities = builder.entities;
      this.suggestionId = builder.suggestionId;
    }

    /**
     * New builder.
     *
     * @return a MessageInput builder
     */
    public MessageInputBuilder newBuilder() {
      return new MessageInputBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'message_type' => 'messageType',
        'suggestion_id' => 'suggestionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageInput ret = (MessageInput) super.deserialize(jsonString, jsonMap, classType);
      MessageInputBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for options
      Map<String, Object> optionsMap = (Map<String, Object>) jsonMap.get('options');
      MessageInputOptions newOptions = (MessageInputOptions) new MessageInputOptions().deserialize(JSON.serialize(optionsMap, true), optionsMap, MessageInputOptions.class);
      retBuilder.options(newOptions);

      // calling custom deserializer for intents
      List<RuntimeIntent> newIntents = new List<RuntimeIntent>();
      List<RuntimeIntent> deserializedIntents = ret.getIntents();
      if (deserializedIntents != null) {
        for (Integer i = 0; i < deserializedIntents.size(); i++) {
          RuntimeIntent currentItem = ret.getIntents().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('intents');
          RuntimeIntent newItem = (RuntimeIntent) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RuntimeIntent.class);
          newIntents.add(newItem);
        }
        retBuilder.intents(newIntents);
      }

      // calling custom deserializer for entities
      List<RuntimeEntity> newEntities = new List<RuntimeEntity>();
      List<RuntimeEntity> deserializedEntities = ret.getEntities();
      if (deserializedEntities != null) {
        for (Integer i = 0; i < deserializedEntities.size(); i++) {
          RuntimeEntity currentItem = ret.getEntities().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('entities');
          RuntimeEntity newItem = (RuntimeEntity) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RuntimeEntity.class);
          newEntities.add(newItem);
        }
        retBuilder.entities(newEntities);
      }

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'messageType' => 'message_type',
        'suggestionId' => 'suggestion_id'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for options
      if (options != null) {
        String optionsJsonString = JSON.serialize(options.replacePropertyNames(), true);
        String optionsKey = 'options';
        if (propertyNameMapping.containsKey(optionsKey)) {
          optionsKey = propertyNameMapping.get(optionsKey);
        }
        jsonMap.put(optionsKey, JSON.deserializeUntyped(optionsJsonString));
      }

      // performing custom serialization for intents
      if (intents != null) {
        List<Object> intentsJsonList = new List<Object>();
        for (RuntimeIntent listItem : intents) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          intentsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String intentsKey = 'intents';
        if (propertyNameMapping.containsKey(intentsKey)) {
          intentsKey = propertyNameMapping.get(intentsKey);
        }
        jsonMap.put(intentsKey, intentsJsonList);
      }

      // performing custom serialization for entities
      if (entities != null) {
        List<Object> entitiesJsonList = new List<Object>();
        for (RuntimeEntity listItem : entities) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          entitiesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String entitiesKey = 'entities';
        if (propertyNameMapping.containsKey(entitiesKey)) {
          entitiesKey = propertyNameMapping.get(entitiesKey);
        }
        jsonMap.put(entitiesKey, entitiesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * MessageInput Builder.
   */
  public class MessageInputBuilder {
    private String messageType;
    private String text;
    private MessageInputOptions options;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private String suggestionId;

    private MessageInputBuilder(MessageInput messageInput) {
      this.messageType = messageInput.messageType;
      this.text = messageInput.text;
      this.options = messageInput.options;
      this.intents = messageInput.intents;
      this.entities = messageInput.entities;
      this.suggestionId = messageInput.suggestionId;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageInputBuilder() {
    }

    /**
     * Builds a MessageInput.
     *
     * @return the messageInput
     */
    public MessageInput build() {
      return new MessageInput(this);
    }

    /**
     * Adds an intents to intents.
     *
     * @param intents the new intents
     * @return the MessageInput builder
     */
    public MessageInputBuilder addIntents(RuntimeIntent intents) {
      IBMWatsonValidator.notNull(intents, 'intents cannot be null');
      if (this.intents == null) {
        this.intents = new List<RuntimeIntent>();
      }
      this.intents.add(intents);
      return this;
    }

    /**
     * Adds an entities to entities.
     *
     * @param entities the new entities
     * @return the MessageInput builder
     */
    public MessageInputBuilder addEntities(RuntimeEntity entities) {
      IBMWatsonValidator.notNull(entities, 'entities cannot be null');
      if (this.entities == null) {
        this.entities = new List<RuntimeEntity>();
      }
      this.entities.add(entities);
      return this;
    }

    /**
     * Set the messageType.
     *
     * @param messageType the messageType
     * @return the MessageInput builder
     */
    public MessageInputBuilder messageType(String messageType) {
      this.messageType = messageType;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the MessageInput builder
     */
    public MessageInputBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the options.
     *
     * @param options the options
     * @return the MessageInput builder
     */
    public MessageInputBuilder options(MessageInputOptions options) {
      this.options = options;
      return this;
    }

    /**
     * Set the intents.
     * Existing intents will be replaced.
     *
     * @param intents the intents
     * @return the MessageInput builder
     */
    public MessageInputBuilder intents(List<RuntimeIntent> intents) {
      this.intents = intents;
      return this;
    }

    /**
     * Set the entities.
     * Existing entities will be replaced.
     *
     * @param entities the entities
     * @return the MessageInput builder
     */
    public MessageInputBuilder entities(List<RuntimeEntity> entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the suggestionId.
     *
     * @param suggestionId the suggestionId
     * @return the MessageInput builder
     */
    public MessageInputBuilder suggestionId(String suggestionId) {
      this.suggestionId = suggestionId;
      return this;
    }
  }

  /**
   * Optional properties that control how the assistant responds.
   */
  public class MessageInputOptions extends IBMWatsonGenericModel {
    private Boolean debug;
    private Boolean restart;
    private Boolean alternateIntents;
    private Boolean returnContext;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageInputOptions() { }

    /**
     * Gets the debug.
     *
     * Whether to return additional diagnostic information. Set to `true` to return additional information under the
     * `output.debug` key.
     *
     * @return the debug
     */
    @AuraEnabled
    public Boolean getDebug() {
      return debug;
    }

    /**
     * Gets the restart.
     *
     * Whether to restart dialog processing at the root of the dialog, regardless of any previously visited nodes.
     * **Note:** This does not affect `turn_count` or any other context variables.
     *
     * @return the restart
     */
    @AuraEnabled
    public Boolean getRestart() {
      return restart;
    }

    /**
     * Gets the alternateIntents.
     *
     * Whether to return more than one intent. Set to `true` to return all matching intents.
     *
     * @return the alternateIntents
     */
    @AuraEnabled
    public Boolean getAlternateIntents() {
      return alternateIntents;
    }

    /**
     * Gets the returnContext.
     *
     * Whether to return session context with the response. If you specify `true`, the response will include the
     * `context` property.
     *
     * @return the returnContext
     */
    @AuraEnabled
    public Boolean getReturnContext() {
      return returnContext;
    }
  
    private MessageInputOptions(MessageInputOptionsBuilder builder) {
      this.debug = builder.debug;
      this.restart = builder.restart;
      this.alternateIntents = builder.alternateIntents;
      this.returnContext = builder.returnContext;
    }

    /**
     * New builder.
     *
     * @return a MessageInputOptions builder
     */
    public MessageInputOptionsBuilder newBuilder() {
      return new MessageInputOptionsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'alternate_intents' => 'alternateIntents',
        'return_context' => 'returnContext'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageInputOptions ret = (MessageInputOptions) super.deserialize(jsonString, jsonMap, classType);
      MessageInputOptionsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'alternateIntents' => 'alternate_intents',
        'returnContext' => 'return_context'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * MessageInputOptions Builder.
   */
  public class MessageInputOptionsBuilder {
    private Boolean debug;
    private Boolean restart;
    private Boolean alternateIntents;
    private Boolean returnContext;

    private MessageInputOptionsBuilder(MessageInputOptions messageInputOptions) {
      this.debug = messageInputOptions.debug;
      this.restart = messageInputOptions.restart;
      this.alternateIntents = messageInputOptions.alternateIntents;
      this.returnContext = messageInputOptions.returnContext;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageInputOptionsBuilder() {
    }

    /**
     * Builds a MessageInputOptions.
     *
     * @return the messageInputOptions
     */
    public MessageInputOptions build() {
      return new MessageInputOptions(this);
    }

    /**
     * Set the debug.
     *
     * @param debug the debug
     * @return the MessageInputOptions builder
     */
    public MessageInputOptionsBuilder debug(Boolean debug) {
      this.debug = debug;
      return this;
    }

    /**
     * Set the restart.
     *
     * @param restart the restart
     * @return the MessageInputOptions builder
     */
    public MessageInputOptionsBuilder restart(Boolean restart) {
      this.restart = restart;
      return this;
    }

    /**
     * Set the alternateIntents.
     *
     * @param alternateIntents the alternateIntents
     * @return the MessageInputOptions builder
     */
    public MessageInputOptionsBuilder alternateIntents(Boolean alternateIntents) {
      this.alternateIntents = alternateIntents;
      return this;
    }

    /**
     * Set the returnContext.
     *
     * @param returnContext the returnContext
     * @return the MessageInputOptions builder
     */
    public MessageInputOptionsBuilder returnContext(Boolean returnContext) {
      this.returnContext = returnContext;
      return this;
    }
  }

  /**
   * The message options.
   */
  public class MessageOptions extends IBMWatsonOptionsModel {
    private String assistantId;
    private String sessionId;
    private MessageInput input;
    private MessageContext context;

    /**
     * Gets the assistantId.
     *
     * Unique identifier of the assistant. To find the assistant ID in the Watson Assistant user interface, open the
     * assistant settings and click **API Details**. For information about creating assistants, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-assistant-add#assistant-add-task).
     *
     * **Note:** Currently, the v2 API does not support creating assistants.
     *
     * @return the assistantId
     */
    public String assistantId() {
      return assistantId;
    }

    /**
     * Gets the sessionId.
     *
     * Unique identifier of the session.
     *
     * @return the sessionId
     */
    public String sessionId() {
      return sessionId;
    }

    /**
     * Gets the input.
     *
     * An input object that includes the input text.
     *
     * @return the input
     */
    public MessageInput input() {
      return input;
    }

    /**
     * Gets the context.
     *
     * State information for the conversation. The context is stored by the assistant on a per-session basis. You can
     * use this property to set or modify context variables, which can also be accessed by dialog nodes.
     *
     * @return the context
     */
    public MessageContext context() {
      return context;
    }

    private MessageOptions(MessageOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.assistantId, 'assistantId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.sessionId, 'sessionId cannot be empty');
      assistantId = builder.assistantId;
      sessionId = builder.sessionId;
      input = builder.input;
      context = builder.context;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a MessageOptions builder
     */
    public MessageOptionsBuilder newBuilder() {
      return new MessageOptionsBuilder(this);
    }
  }

  /**
   * MessageOptions Builder.
   */
  public class MessageOptionsBuilder extends IBMWatsonOptionsModel {
    private String assistantId;
    private String sessionId;
    private MessageInput input;
    private MessageContext context;

    private MessageOptionsBuilder(MessageOptions messageOptions) {
      assistantId = messageOptions.assistantId;
      sessionId = messageOptions.sessionId;
      input = messageOptions.input;
      context = messageOptions.context;
      this.requestHeaders.putAll(messageOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public MessageOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param assistantId the assistantId
     * @param sessionId the sessionId
     */
    public MessageOptionsBuilder(String assistantId, String sessionId) {
      this.assistantId = assistantId;
      this.sessionId = sessionId;
    }

    /**
     * Builds a MessageOptions.
     *
     * @return the messageOptions
     */
    public MessageOptions build() {
      return new MessageOptions(this);
    }

    /**
     * Set the assistantId.
     *
     * @param assistantId the assistantId
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder assistantId(String assistantId) {
      this.assistantId = assistantId;
      return this;
    }

    /**
     * Set the sessionId.
     *
     * @param sessionId the sessionId
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder sessionId(String sessionId) {
      this.sessionId = sessionId;
      return this;
    }

    /**
     * Set the input.
     *
     * @param input the input
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder input(MessageInput input) {
      this.input = input;
      return this;
    }

    /**
     * Set the context.
     *
     * @param context the context
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder context(MessageContext context) {
      this.context = context;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Assistant output to be rendered or processed by the client.
   */
  public class MessageOutput extends IBMWatsonGenericModel {
    private List<RuntimeResponseGeneric> generic;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private List<DialogNodeAction> actions;
    private MessageOutputDebug debug;
    private IBMWatsonMapModel userDefined;

    /**
     * Gets the generic.
     *
     * Output intended for any channel. It is the responsibility of the client application to implement the supported
     * response types.
     *
     * @return the generic
     */
    @AuraEnabled
    public List<RuntimeResponseGeneric> getGeneric() {
      return generic;
    }

    /**
     * Gets the intents.
     *
     * An array of intents recognized in the user input, sorted in descending order of confidence.
     *
     * @return the intents
     */
    @AuraEnabled
    public List<RuntimeIntent> getIntents() {
      return intents;
    }

    /**
     * Gets the entities.
     *
     * An array of entities identified in the user input.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<RuntimeEntity> getEntities() {
      return entities;
    }

    /**
     * Gets the actions.
     *
     * An array of objects describing any actions requested by the dialog node.
     *
     * @return the actions
     */
    @AuraEnabled
    public List<DialogNodeAction> getActions() {
      return actions;
    }

    /**
     * Gets the debug.
     *
     * Additional detailed information about a message response and how it was generated.
     *
     * @return the debug
     */
    @AuraEnabled
    public MessageOutputDebug getDebug() {
      return debug;
    }

    /**
     * Gets the userDefined.
     *
     * An object containing any custom properties included in the response. This object includes any arbitrary
     * properties defined in the dialog JSON editor as part of the dialog node output.
     *
     * @return the userDefined
     */
    @AuraEnabled
    public IBMWatsonMapModel getUserDefined() {
      return userDefined;
    }

    /**
     * Sets the generic.
     *
     * @param generic the new generic
     */
    public void setGeneric(final List<RuntimeResponseGeneric> generic) {
      this.generic = generic;
    }

    /**
     * Sets the intents.
     *
     * @param intents the new intents
     */
    public void setIntents(final List<RuntimeIntent> intents) {
      this.intents = intents;
    }

    /**
     * Sets the entities.
     *
     * @param entities the new entities
     */
    public void setEntities(final List<RuntimeEntity> entities) {
      this.entities = entities;
    }

    /**
     * Sets the actions.
     *
     * @param actions the new actions
     */
    public void setActions(final List<DialogNodeAction> actions) {
      this.actions = actions;
    }

    /**
     * Sets the debug.
     *
     * @param debug the new debug
     */
    public void setDebug(final MessageOutputDebug debug) {
      this.debug = debug;
    }

    /**
     * Sets the userDefined.
     *
     * @param userDefined the new userDefined
     */
    public void setUserDefined(final IBMWatsonMapModel userDefined) {
      this.userDefined = userDefined;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'user_defined' => 'userDefined'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageOutput ret = (MessageOutput) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for generic
      List<RuntimeResponseGeneric> newGeneric = new List<RuntimeResponseGeneric>();
      List<RuntimeResponseGeneric> deserializedGeneric = ret.getGeneric();
      if (deserializedGeneric != null) {
        for (Integer i = 0; i < deserializedGeneric.size(); i++) {
          RuntimeResponseGeneric currentItem = ret.getGeneric().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('generic');
          RuntimeResponseGeneric newItem = (RuntimeResponseGeneric) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RuntimeResponseGeneric.class);
          newGeneric.add(newItem);
        }
        ret.generic = newGeneric;
      }

      // calling custom deserializer for intents
      List<RuntimeIntent> newIntents = new List<RuntimeIntent>();
      List<RuntimeIntent> deserializedIntents = ret.getIntents();
      if (deserializedIntents != null) {
        for (Integer i = 0; i < deserializedIntents.size(); i++) {
          RuntimeIntent currentItem = ret.getIntents().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('intents');
          RuntimeIntent newItem = (RuntimeIntent) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RuntimeIntent.class);
          newIntents.add(newItem);
        }
        ret.intents = newIntents;
      }

      // calling custom deserializer for entities
      List<RuntimeEntity> newEntities = new List<RuntimeEntity>();
      List<RuntimeEntity> deserializedEntities = ret.getEntities();
      if (deserializedEntities != null) {
        for (Integer i = 0; i < deserializedEntities.size(); i++) {
          RuntimeEntity currentItem = ret.getEntities().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('entities');
          RuntimeEntity newItem = (RuntimeEntity) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RuntimeEntity.class);
          newEntities.add(newItem);
        }
        ret.entities = newEntities;
      }

      // calling custom deserializer for actions
      List<DialogNodeAction> newActions = new List<DialogNodeAction>();
      List<DialogNodeAction> deserializedActions = ret.getActions();
      if (deserializedActions != null) {
        for (Integer i = 0; i < deserializedActions.size(); i++) {
          DialogNodeAction currentItem = ret.getActions().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('actions');
          DialogNodeAction newItem = (DialogNodeAction) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNodeAction.class);
          newActions.add(newItem);
        }
        ret.actions = newActions;
      }

      // calling custom deserializer for debug
      Map<String, Object> debugMap = (Map<String, Object>) jsonMap.get('debug');
      MessageOutputDebug newDebug = (MessageOutputDebug) new MessageOutputDebug().deserialize(JSON.serialize(debugMap, true), debugMap, MessageOutputDebug.class);
      ret.setDebug(newDebug);

      // calling custom deserializer for userDefined
      Map<String, Object> userDefinedMap = (Map<String, Object>) jsonMap.get('userDefined');
      IBMWatsonMapModel newUserDefined = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(userDefinedMap, true), userDefinedMap, IBMWatsonMapModel.class);
      ret.setUserDefined(newUserDefined);

      return ret;
    }
  }

  /**
   * Additional detailed information about a message response and how it was generated.
   */
  public class MessageOutputDebug extends IBMWatsonGenericModel {
    private List<DialogNodesVisited> nodesVisited;
    private List<DialogLogMessage> logMessages;
    private Boolean branchExited;
    private String branchExitedReason;

    /**
     * Gets the nodesVisited.
     *
     * An array of objects containing detailed diagnostic information about the nodes that were triggered during
     * processing of the input message.
     *
     * @return the nodesVisited
     */
    @AuraEnabled
    public List<DialogNodesVisited> getNodesVisited() {
      return nodesVisited;
    }

    /**
     * Gets the logMessages.
     *
     * An array of up to 50 messages logged with the request.
     *
     * @return the logMessages
     */
    @AuraEnabled
    public List<DialogLogMessage> getLogMessages() {
      return logMessages;
    }

    /**
     * Gets the branchExited.
     *
     * Assistant sets this to true when this message response concludes or interrupts a dialog.
     *
     * @return the branchExited
     */
    @AuraEnabled
    public Boolean getBranchExited() {
      return branchExited;
    }

    /**
     * Gets the branchExitedReason.
     *
     * When `branch_exited` is set to `true` by the Assistant, the `branch_exited_reason` specifies whether the dialog
     * completed by itself or got interrupted.
     *
     * @return the branchExitedReason
     */
    @AuraEnabled
    public String getBranchExitedReason() {
      return branchExitedReason;
    }

    /**
     * Sets the nodesVisited.
     *
     * @param nodesVisited the new nodesVisited
     */
    public void setNodesVisited(final List<DialogNodesVisited> nodesVisited) {
      this.nodesVisited = nodesVisited;
    }

    /**
     * Sets the logMessages.
     *
     * @param logMessages the new logMessages
     */
    public void setLogMessages(final List<DialogLogMessage> logMessages) {
      this.logMessages = logMessages;
    }

    /**
     * Sets the branchExited.
     *
     * @param branchExited the new branchExited
     */
    public void setBranchExited(final Boolean branchExited) {
      this.branchExited = branchExited;
    }

    /**
     * Sets the branchExitedReason.
     *
     * @param branchExitedReason the new branchExitedReason
     */
    public void setBranchExitedReason(final String branchExitedReason) {
      this.branchExitedReason = branchExitedReason;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'nodes_visited' => 'nodesVisited',
        'log_messages' => 'logMessages',
        'branch_exited' => 'branchExited',
        'branch_exited_reason' => 'branchExitedReason'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageOutputDebug ret = (MessageOutputDebug) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for nodesVisited
      List<DialogNodesVisited> newNodesVisited = new List<DialogNodesVisited>();
      List<DialogNodesVisited> deserializedNodesVisited = ret.getNodesVisited();
      if (deserializedNodesVisited != null) {
        for (Integer i = 0; i < deserializedNodesVisited.size(); i++) {
          DialogNodesVisited currentItem = ret.getNodesVisited().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('nodesVisited');
          DialogNodesVisited newItem = (DialogNodesVisited) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNodesVisited.class);
          newNodesVisited.add(newItem);
        }
        ret.nodesVisited = newNodesVisited;
      }

      // calling custom deserializer for logMessages
      List<DialogLogMessage> newLogMessages = new List<DialogLogMessage>();
      List<DialogLogMessage> deserializedLogMessages = ret.getLogMessages();
      if (deserializedLogMessages != null) {
        for (Integer i = 0; i < deserializedLogMessages.size(); i++) {
          DialogLogMessage currentItem = ret.getLogMessages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('logMessages');
          DialogLogMessage newItem = (DialogLogMessage) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogLogMessage.class);
          newLogMessages.add(newItem);
        }
        ret.logMessages = newLogMessages;
      }

      return ret;
    }
  }

  /**
   * A response from the Watson Assistant service.
   */
  public class MessageResponse extends IBMWatsonResponseModel {
    private MessageOutput output;
    private MessageContext context;

    /**
     * Gets the output.
     *
     * Assistant output to be rendered or processed by the client.
     *
     * @return the output
     */
    @AuraEnabled
    public MessageOutput getOutput() {
      return output;
    }

    /**
     * Gets the context.
     *
     * State information for the conversation. The context is stored by the assistant on a per-session basis. You can
     * use this property to access context variables.
     *
     * **Note:** The context is included in message responses only if **return_context**=`true` in the message request.
     *
     * @return the context
     */
    @AuraEnabled
    public MessageContext getContext() {
      return context;
    }

    /**
     * Sets the output.
     *
     * @param output the new output
     */
    public void setOutput(final MessageOutput output) {
      this.output = output;
    }

    /**
     * Sets the context.
     *
     * @param context the new context
     */
    public void setContext(final MessageContext context) {
      this.context = context;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      MessageResponse ret = (MessageResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for output
      Map<String, Object> outputMap = (Map<String, Object>) jsonMap.get('output');
      MessageOutput newOutput = (MessageOutput) new MessageOutput().deserialize(JSON.serialize(outputMap, true), outputMap, MessageOutput.class);
      ret.setOutput(newOutput);

      // calling custom deserializer for context
      Map<String, Object> contextMap = (Map<String, Object>) jsonMap.get('context');
      MessageContext newContext = (MessageContext) new MessageContext().deserialize(JSON.serialize(contextMap, true), contextMap, MessageContext.class);
      ret.setContext(newContext);

      return ret;
    }
  }

  /**
   * The entity value that was recognized in the user input.
   */
  public class RuntimeEntity extends IBMWatsonGenericModel {
    private String entity;
    private List<Long> location;
    private String value;
    private Double confidence;
    private IBMWatsonMapModel metadata;
    private List<CaptureGroup> groups;
    private RuntimeEntityInterpretation interpretation;
    private List<RuntimeEntityAlternative> alternatives;
    private RuntimeEntityRole role;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public RuntimeEntity() { }

    /**
     * Gets the entity.
     *
     * An entity detected in the input.
     *
     * @return the entity
     */
    @AuraEnabled
    public String getEntity() {
      return entity;
    }

    /**
     * Gets the location.
     *
     * An array of zero-based character offsets that indicate where the detected entity values begin and end in the
     * input text.
     *
     * @return the location
     */
    @AuraEnabled
    public List<Long> getLocation() {
      return location;
    }

    /**
     * Gets the value.
     *
     * The term in the input text that was recognized as an entity value.
     *
     * @return the value
     */
    @AuraEnabled
    public String getValue() {
      return value;
    }

    /**
     * Gets the confidence.
     *
     * A decimal percentage that represents Watson's confidence in the recognized entity.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata for the entity.
     *
     * @return the metadata
     */
    @AuraEnabled
    public IBMWatsonMapModel getMetadata() {
      return metadata;
    }

    /**
     * Gets the groups.
     *
     * The recognized capture groups for the entity, as defined by the entity pattern.
     *
     * @return the groups
     */
    @AuraEnabled
    public List<CaptureGroup> getGroups() {
      return groups;
    }

    /**
     * Gets the interpretation.
     *
     * An object containing detailed information about the entity recognized in the user input. This property is
     * included only if the new system entities are enabled for the skill.
     *
     * For more information about how the new system entities are interpreted, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-beta-system-entities).
     *
     * @return the interpretation
     */
    @AuraEnabled
    public RuntimeEntityInterpretation getInterpretation() {
      return interpretation;
    }

    /**
     * Gets the alternatives.
     *
     * An array of possible alternative values that the user might have intended instead of the value returned in the
     * **value** property. This property is returned only for `@sys-time` and `@sys-date` entities when the user's input
     * is ambiguous.
     *
     * This property is included only if the new system entities are enabled for the skill.
     *
     * @return the alternatives
     */
    @AuraEnabled
    public List<RuntimeEntityAlternative> getAlternatives() {
      return alternatives;
    }

    /**
     * Gets the role.
     *
     * An object describing the role played by a system entity that is specifies the beginning or end of a range
     * recognized in the user input. This property is included only if the new system entities are enabled for the
     * skill.
     *
     * @return the role
     */
    @AuraEnabled
    public RuntimeEntityRole getRole() {
      return role;
    }
  
    private RuntimeEntity(RuntimeEntityBuilder builder) {
      IBMWatsonValidator.notNull(builder.entity, 'entity cannot be null');
      IBMWatsonValidator.notNull(builder.location, 'location cannot be null');
      IBMWatsonValidator.notNull(builder.value, 'value cannot be null');
      this.entity = builder.entity;
      this.location = builder.location;
      this.value = builder.value;
      this.confidence = builder.confidence;
      this.metadata = builder.metadata;
      this.groups = builder.groups;
      this.interpretation = builder.interpretation;
      this.alternatives = builder.alternatives;
      this.role = builder.role;
    }

    /**
     * New builder.
     *
     * @return a RuntimeEntity builder
     */
    public RuntimeEntityBuilder newBuilder() {
      return new RuntimeEntityBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      RuntimeEntity ret = (RuntimeEntity) super.deserialize(jsonString, jsonMap, classType);
      RuntimeEntityBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      IBMWatsonMapModel newMetadata = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(metadataMap, true), metadataMap, IBMWatsonMapModel.class);
      retBuilder.metadata(newMetadata);

      // calling custom deserializer for groups
      List<CaptureGroup> newGroups = new List<CaptureGroup>();
      List<CaptureGroup> deserializedGroups = ret.getGroups();
      if (deserializedGroups != null) {
        for (Integer i = 0; i < deserializedGroups.size(); i++) {
          CaptureGroup currentItem = ret.getGroups().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('groups');
          CaptureGroup newItem = (CaptureGroup) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), CaptureGroup.class);
          newGroups.add(newItem);
        }
        retBuilder.groups(newGroups);
      }

      // calling custom deserializer for interpretation
      Map<String, Object> interpretationMap = (Map<String, Object>) jsonMap.get('interpretation');
      RuntimeEntityInterpretation newInterpretation = (RuntimeEntityInterpretation) new RuntimeEntityInterpretation().deserialize(JSON.serialize(interpretationMap, true), interpretationMap, RuntimeEntityInterpretation.class);
      retBuilder.interpretation(newInterpretation);

      // calling custom deserializer for alternatives
      List<RuntimeEntityAlternative> newAlternatives = new List<RuntimeEntityAlternative>();
      List<RuntimeEntityAlternative> deserializedAlternatives = ret.getAlternatives();
      if (deserializedAlternatives != null) {
        for (Integer i = 0; i < deserializedAlternatives.size(); i++) {
          RuntimeEntityAlternative currentItem = ret.getAlternatives().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('alternatives');
          RuntimeEntityAlternative newItem = (RuntimeEntityAlternative) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RuntimeEntityAlternative.class);
          newAlternatives.add(newItem);
        }
        retBuilder.alternatives(newAlternatives);
      }

      // calling custom deserializer for role
      Map<String, Object> roleMap = (Map<String, Object>) jsonMap.get('role');
      RuntimeEntityRole newRole = (RuntimeEntityRole) new RuntimeEntityRole().deserialize(JSON.serialize(roleMap, true), roleMap, RuntimeEntityRole.class);
      retBuilder.role(newRole);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for metadata
      if (metadata != null) {
        String metadataJsonString = JSON.serialize(metadata.replacePropertyNames(), true);
        jsonMap.put('metadata', JSON.deserializeUntyped(metadataJsonString));
      }

      // performing custom serialization for groups
      if (groups != null) {
        List<Object> groupsJsonList = new List<Object>();
        for (CaptureGroup listItem : groups) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          groupsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('groups', groupsJsonList);
      }

      // performing custom serialization for interpretation
      if (interpretation != null) {
        String interpretationJsonString = JSON.serialize(interpretation.replacePropertyNames(), true);
        jsonMap.put('interpretation', JSON.deserializeUntyped(interpretationJsonString));
      }

      // performing custom serialization for alternatives
      if (alternatives != null) {
        List<Object> alternativesJsonList = new List<Object>();
        for (RuntimeEntityAlternative listItem : alternatives) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          alternativesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('alternatives', alternativesJsonList);
      }

      // performing custom serialization for role
      if (role != null) {
        String roleJsonString = JSON.serialize(role.replacePropertyNames(), true);
        jsonMap.put('role', JSON.deserializeUntyped(roleJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * RuntimeEntity Builder.
   */
  public class RuntimeEntityBuilder {
    private String entity;
    private List<Long> location;
    private String value;
    private Double confidence;
    private IBMWatsonMapModel metadata;
    private List<CaptureGroup> groups;
    private RuntimeEntityInterpretation interpretation;
    private List<RuntimeEntityAlternative> alternatives;
    private RuntimeEntityRole role;

    private RuntimeEntityBuilder(RuntimeEntity runtimeEntity) {
      this.entity = runtimeEntity.entity;
      this.location = runtimeEntity.location;
      this.value = runtimeEntity.value;
      this.confidence = runtimeEntity.confidence;
      this.metadata = runtimeEntity.metadata;
      this.groups = runtimeEntity.groups;
      this.interpretation = runtimeEntity.interpretation;
      this.alternatives = runtimeEntity.alternatives;
      this.role = runtimeEntity.role;
    }

    /**
     * Instantiates a new builder.
     */
    public RuntimeEntityBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param entity the entity
     * @param location the location
     * @param value the value
     */
    public RuntimeEntityBuilder(String entity, List<Long> location, String value) {
      this.entity = entity;
      this.location = location;
      this.value = value;
    }

    /**
     * Builds a RuntimeEntity.
     *
     * @return the runtimeEntity
     */
    public RuntimeEntity build() {
      return new RuntimeEntity(this);
    }

    /**
     * Adds an location to location.
     *
     * @param location the new location
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder addLocation(Long location) {
      IBMWatsonValidator.notNull(location, 'location cannot be null');
      if (this.location == null) {
        this.location = new List<Long>();
      }
      this.location.add(location);
      return this;
    }

    /**
     * Adds an groups to groups.
     *
     * @param groups the new groups
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder addGroups(CaptureGroup groups) {
      IBMWatsonValidator.notNull(groups, 'groups cannot be null');
      if (this.groups == null) {
        this.groups = new List<CaptureGroup>();
      }
      this.groups.add(groups);
      return this;
    }

    /**
     * Adds an alternatives to alternatives.
     *
     * @param alternatives the new alternatives
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder addAlternatives(RuntimeEntityAlternative alternatives) {
      IBMWatsonValidator.notNull(alternatives, 'alternatives cannot be null');
      if (this.alternatives == null) {
        this.alternatives = new List<RuntimeEntityAlternative>();
      }
      this.alternatives.add(alternatives);
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the location.
     * Existing location will be replaced.
     *
     * @param location the location
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder location(List<Long> location) {
      this.location = location;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the confidence.
     *
     * @param confidence the confidence
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder confidence(Double confidence) {
      this.confidence = confidence;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the groups.
     * Existing groups will be replaced.
     *
     * @param groups the groups
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder groups(List<CaptureGroup> groups) {
      this.groups = groups;
      return this;
    }

    /**
     * Set the interpretation.
     *
     * @param interpretation the interpretation
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder interpretation(RuntimeEntityInterpretation interpretation) {
      this.interpretation = interpretation;
      return this;
    }

    /**
     * Set the alternatives.
     * Existing alternatives will be replaced.
     *
     * @param alternatives the alternatives
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder alternatives(List<RuntimeEntityAlternative> alternatives) {
      this.alternatives = alternatives;
      return this;
    }

    /**
     * Set the role.
     *
     * @param role the role
     * @return the RuntimeEntity builder
     */
    public RuntimeEntityBuilder role(RuntimeEntityRole role) {
      this.role = role;
      return this;
    }
  }

  /**
   * An alternative value for the recognized entity.
   */
  public class RuntimeEntityAlternative extends IBMWatsonGenericModel {
    private String value;
    private Double confidence;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public RuntimeEntityAlternative() { }

    /**
     * Gets the value.
     *
     * The entity value that was recognized in the user input.
     *
     * @return the value
     */
    @AuraEnabled
    public String getValue() {
      return value;
    }

    /**
     * Gets the confidence.
     *
     * A decimal percentage that represents Watson's confidence in the recognized entity.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }
  
    private RuntimeEntityAlternative(RuntimeEntityAlternativeBuilder builder) {
      this.value = builder.value;
      this.confidence = builder.confidence;
    }

    /**
     * New builder.
     *
     * @return a RuntimeEntityAlternative builder
     */
    public RuntimeEntityAlternativeBuilder newBuilder() {
      return new RuntimeEntityAlternativeBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      RuntimeEntityAlternative ret = (RuntimeEntityAlternative) super.deserialize(jsonString, jsonMap, classType);
      RuntimeEntityAlternativeBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * RuntimeEntityAlternative Builder.
   */
  public class RuntimeEntityAlternativeBuilder {
    private String value;
    private Double confidence;

    private RuntimeEntityAlternativeBuilder(RuntimeEntityAlternative runtimeEntityAlternative) {
      this.value = runtimeEntityAlternative.value;
      this.confidence = runtimeEntityAlternative.confidence;
    }

    /**
     * Instantiates a new builder.
     */
    public RuntimeEntityAlternativeBuilder() {
    }

    /**
     * Builds a RuntimeEntityAlternative.
     *
     * @return the runtimeEntityAlternative
     */
    public RuntimeEntityAlternative build() {
      return new RuntimeEntityAlternative(this);
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the RuntimeEntityAlternative builder
     */
    public RuntimeEntityAlternativeBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the confidence.
     *
     * @param confidence the confidence
     * @return the RuntimeEntityAlternative builder
     */
    public RuntimeEntityAlternativeBuilder confidence(Double confidence) {
      this.confidence = confidence;
      return this;
    }
  }

  /**
   * RuntimeEntityInterpretation.
   */
  public class RuntimeEntityInterpretation extends IBMWatsonGenericModel {
    private String calendarType;
    private String datetimeLink;
    private String festival;
    private String granularity;
    private String rangeLink;
    private String rangeModifier;
    private Double relativeDay;
    private Double relativeMonth;
    private Double relativeWeek;
    private Double relativeWeekend;
    private Double relativeYear;
    private Double specificDay;
    private String specificDayOfWeek;
    private Double specificMonth;
    private Double specificQuarter;
    private Double specificYear;
    private Double numericValue;
    private String subtype;
    private String partOfDay;
    private Double relativeHour;
    private Double relativeMinute;
    private Double relativeSecond;
    private Double specificHour;
    private Double specificMinute;
    private Double specificSecond;
    private String timezone;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public RuntimeEntityInterpretation() { }

    /**
     * Gets the calendarType.
     *
     * The calendar used to represent a recognized date (for example, `Gregorian`).
     *
     * @return the calendarType
     */
    @AuraEnabled
    public String getCalendarType() {
      return calendarType;
    }

    /**
     * Gets the datetimeLink.
     *
     * A unique identifier used to associate a recognized time and date. If the user input contains a date and time that
     * are mentioned together (for example, `Today at 5`, the same **datetime_link** value is returned for both the
     * `@sys-date` and `@sys-time` entities).
     *
     * @return the datetimeLink
     */
    @AuraEnabled
    public String getDatetimeLink() {
      return datetimeLink;
    }

    /**
     * Gets the festival.
     *
     * A locale-specific holiday name (such as `thanksgiving` or `christmas`). This property is included when a
     * `@sys-date` entity is recognized based on a holiday name in the user input.
     *
     * @return the festival
     */
    @AuraEnabled
    public String getFestival() {
      return festival;
    }

    /**
     * Gets the granularity.
     *
     * The precision or duration of a time range specified by a recognized `@sys-time` or `@sys-date` entity.
     *
     * @return the granularity
     */
    @AuraEnabled
    public String getGranularity() {
      return granularity;
    }

    /**
     * Gets the rangeLink.
     *
     * A unique identifier used to associate multiple recognized `@sys-date`, `@sys-time`, or `@sys-number` entities
     * that are recognized as a range of values in the user's input (for example, `from July 4 until July 14` or `from
     * 20 to 25`).
     *
     * @return the rangeLink
     */
    @AuraEnabled
    public String getRangeLink() {
      return rangeLink;
    }

    /**
     * Gets the rangeModifier.
     *
     * The word in the user input that indicates that a `sys-date` or `sys-time` entity is part of an implied range
     * where only one date or time is specified (for example, `since` or `until`).
     *
     * @return the rangeModifier
     */
    @AuraEnabled
    public String getRangeModifier() {
      return rangeModifier;
    }

    /**
     * Gets the relativeDay.
     *
     * A recognized mention of a relative day, represented numerically as an offset from the current date (for example,
     * `-1` for `yesterday` or `10` for `in ten days`).
     *
     * @return the relativeDay
     */
    @AuraEnabled
    public Double getRelativeDay() {
      return relativeDay;
    }

    /**
     * Gets the relativeMonth.
     *
     * A recognized mention of a relative month, represented numerically as an offset from the current month (for
     * example, `1` for `next month` or `-3` for `three months ago`).
     *
     * @return the relativeMonth
     */
    @AuraEnabled
    public Double getRelativeMonth() {
      return relativeMonth;
    }

    /**
     * Gets the relativeWeek.
     *
     * A recognized mention of a relative week, represented numerically as an offset from the current week (for example,
     * `2` for `in two weeks` or `-1` for `last week).
     *
     * @return the relativeWeek
     */
    @AuraEnabled
    public Double getRelativeWeek() {
      return relativeWeek;
    }

    /**
     * Gets the relativeWeekend.
     *
     * A recognized mention of a relative date range for a weekend, represented numerically as an offset from the
     * current weekend (for example, `0` for `this weekend` or `-1` for `last weekend`).
     *
     * @return the relativeWeekend
     */
    @AuraEnabled
    public Double getRelativeWeekend() {
      return relativeWeekend;
    }

    /**
     * Gets the relativeYear.
     *
     * A recognized mention of a relative year, represented numerically as an offset from the current year (for example,
     * `1` for `next year` or `-5` for `five years ago`).
     *
     * @return the relativeYear
     */
    @AuraEnabled
    public Double getRelativeYear() {
      return relativeYear;
    }

    /**
     * Gets the specificDay.
     *
     * A recognized mention of a specific date, represented numerically as the date within the month (for example, `30`
     * for `June 30`.).
     *
     * @return the specificDay
     */
    @AuraEnabled
    public Double getSpecificDay() {
      return specificDay;
    }

    /**
     * Gets the specificDayOfWeek.
     *
     * A recognized mention of a specific day of the week as a lowercase string (for example, `monday`).
     *
     * @return the specificDayOfWeek
     */
    @AuraEnabled
    public String getSpecificDayOfWeek() {
      return specificDayOfWeek;
    }

    /**
     * Gets the specificMonth.
     *
     * A recognized mention of a specific month, represented numerically (for example, `7` for `July`).
     *
     * @return the specificMonth
     */
    @AuraEnabled
    public Double getSpecificMonth() {
      return specificMonth;
    }

    /**
     * Gets the specificQuarter.
     *
     * A recognized mention of a specific quarter, represented numerically (for example, `3` for `the third quarter`).
     *
     * @return the specificQuarter
     */
    @AuraEnabled
    public Double getSpecificQuarter() {
      return specificQuarter;
    }

    /**
     * Gets the specificYear.
     *
     * A recognized mention of a specific year (for example, `2016`).
     *
     * @return the specificYear
     */
    @AuraEnabled
    public Double getSpecificYear() {
      return specificYear;
    }

    /**
     * Gets the numericValue.
     *
     * A recognized numeric value, represented as an integer or double.
     *
     * @return the numericValue
     */
    @AuraEnabled
    public Double getNumericValue() {
      return numericValue;
    }

    /**
     * Gets the subtype.
     *
     * The type of numeric value recognized in the user input (`integer` or `rational`).
     *
     * @return the subtype
     */
    @AuraEnabled
    public String getSubtype() {
      return subtype;
    }

    /**
     * Gets the partOfDay.
     *
     * A recognized term for a time that was mentioned as a part of the day in the user's input (for example, `morning`
     * or `afternoon`).
     *
     * @return the partOfDay
     */
    @AuraEnabled
    public String getPartOfDay() {
      return partOfDay;
    }

    /**
     * Gets the relativeHour.
     *
     * A recognized mention of a relative hour, represented numerically as an offset from the current hour (for example,
     * `3` for `in three hours` or `-1` for `an hour ago`).
     *
     * @return the relativeHour
     */
    @AuraEnabled
    public Double getRelativeHour() {
      return relativeHour;
    }

    /**
     * Gets the relativeMinute.
     *
     * A recognized mention of a relative time, represented numerically as an offset in minutes from the current time
     * (for example, `5` for `in five minutes` or `-15` for `fifteen minutes ago`).
     *
     * @return the relativeMinute
     */
    @AuraEnabled
    public Double getRelativeMinute() {
      return relativeMinute;
    }

    /**
     * Gets the relativeSecond.
     *
     * A recognized mention of a relative time, represented numerically as an offset in seconds from the current time
     * (for example, `10` for `in ten seconds` or `-30` for `thirty seconds ago`).
     *
     * @return the relativeSecond
     */
    @AuraEnabled
    public Double getRelativeSecond() {
      return relativeSecond;
    }

    /**
     * Gets the specificHour.
     *
     * A recognized specific hour mentioned as part of a time value (for example, `10` for `10:15 AM`.).
     *
     * @return the specificHour
     */
    @AuraEnabled
    public Double getSpecificHour() {
      return specificHour;
    }

    /**
     * Gets the specificMinute.
     *
     * A recognized specific minute mentioned as part of a time value (for example, `15` for `10:15 AM`.).
     *
     * @return the specificMinute
     */
    @AuraEnabled
    public Double getSpecificMinute() {
      return specificMinute;
    }

    /**
     * Gets the specificSecond.
     *
     * A recognized specific second mentioned as part of a time value (for example, `30` for `10:15:30 AM`.).
     *
     * @return the specificSecond
     */
    @AuraEnabled
    public Double getSpecificSecond() {
      return specificSecond;
    }

    /**
     * Gets the timezone.
     *
     * A recognized time zone mentioned as part of a time value (for example, `EST`).
     *
     * @return the timezone
     */
    @AuraEnabled
    public String getTimezone() {
      return timezone;
    }
  
    private RuntimeEntityInterpretation(RuntimeEntityInterpretationBuilder builder) {
      this.calendarType = builder.calendarType;
      this.datetimeLink = builder.datetimeLink;
      this.festival = builder.festival;
      this.granularity = builder.granularity;
      this.rangeLink = builder.rangeLink;
      this.rangeModifier = builder.rangeModifier;
      this.relativeDay = builder.relativeDay;
      this.relativeMonth = builder.relativeMonth;
      this.relativeWeek = builder.relativeWeek;
      this.relativeWeekend = builder.relativeWeekend;
      this.relativeYear = builder.relativeYear;
      this.specificDay = builder.specificDay;
      this.specificDayOfWeek = builder.specificDayOfWeek;
      this.specificMonth = builder.specificMonth;
      this.specificQuarter = builder.specificQuarter;
      this.specificYear = builder.specificYear;
      this.numericValue = builder.numericValue;
      this.subtype = builder.subtype;
      this.partOfDay = builder.partOfDay;
      this.relativeHour = builder.relativeHour;
      this.relativeMinute = builder.relativeMinute;
      this.relativeSecond = builder.relativeSecond;
      this.specificHour = builder.specificHour;
      this.specificMinute = builder.specificMinute;
      this.specificSecond = builder.specificSecond;
      this.timezone = builder.timezone;
    }

    /**
     * New builder.
     *
     * @return a RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder newBuilder() {
      return new RuntimeEntityInterpretationBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'calendar_type' => 'calendarType',
        'datetime_link' => 'datetimeLink',
        'range_link' => 'rangeLink',
        'range_modifier' => 'rangeModifier',
        'relative_day' => 'relativeDay',
        'relative_month' => 'relativeMonth',
        'relative_week' => 'relativeWeek',
        'relative_weekend' => 'relativeWeekend',
        'relative_year' => 'relativeYear',
        'specific_day' => 'specificDay',
        'specific_day_of_week' => 'specificDayOfWeek',
        'specific_month' => 'specificMonth',
        'specific_quarter' => 'specificQuarter',
        'specific_year' => 'specificYear',
        'numeric_value' => 'numericValue',
        'part_of_day' => 'partOfDay',
        'relative_hour' => 'relativeHour',
        'relative_minute' => 'relativeMinute',
        'relative_second' => 'relativeSecond',
        'specific_hour' => 'specificHour',
        'specific_minute' => 'specificMinute',
        'specific_second' => 'specificSecond'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      RuntimeEntityInterpretation ret = (RuntimeEntityInterpretation) super.deserialize(jsonString, jsonMap, classType);
      RuntimeEntityInterpretationBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'calendarType' => 'calendar_type',
        'datetimeLink' => 'datetime_link',
        'rangeLink' => 'range_link',
        'rangeModifier' => 'range_modifier',
        'relativeDay' => 'relative_day',
        'relativeMonth' => 'relative_month',
        'relativeWeek' => 'relative_week',
        'relativeWeekend' => 'relative_weekend',
        'relativeYear' => 'relative_year',
        'specificDay' => 'specific_day',
        'specificDayOfWeek' => 'specific_day_of_week',
        'specificMonth' => 'specific_month',
        'specificQuarter' => 'specific_quarter',
        'specificYear' => 'specific_year',
        'numericValue' => 'numeric_value',
        'partOfDay' => 'part_of_day',
        'relativeHour' => 'relative_hour',
        'relativeMinute' => 'relative_minute',
        'relativeSecond' => 'relative_second',
        'specificHour' => 'specific_hour',
        'specificMinute' => 'specific_minute',
        'specificSecond' => 'specific_second'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * RuntimeEntityInterpretation Builder.
   */
  public class RuntimeEntityInterpretationBuilder {
    private String calendarType;
    private String datetimeLink;
    private String festival;
    private String granularity;
    private String rangeLink;
    private String rangeModifier;
    private Double relativeDay;
    private Double relativeMonth;
    private Double relativeWeek;
    private Double relativeWeekend;
    private Double relativeYear;
    private Double specificDay;
    private String specificDayOfWeek;
    private Double specificMonth;
    private Double specificQuarter;
    private Double specificYear;
    private Double numericValue;
    private String subtype;
    private String partOfDay;
    private Double relativeHour;
    private Double relativeMinute;
    private Double relativeSecond;
    private Double specificHour;
    private Double specificMinute;
    private Double specificSecond;
    private String timezone;

    private RuntimeEntityInterpretationBuilder(RuntimeEntityInterpretation runtimeEntityInterpretation) {
      this.calendarType = runtimeEntityInterpretation.calendarType;
      this.datetimeLink = runtimeEntityInterpretation.datetimeLink;
      this.festival = runtimeEntityInterpretation.festival;
      this.granularity = runtimeEntityInterpretation.granularity;
      this.rangeLink = runtimeEntityInterpretation.rangeLink;
      this.rangeModifier = runtimeEntityInterpretation.rangeModifier;
      this.relativeDay = runtimeEntityInterpretation.relativeDay;
      this.relativeMonth = runtimeEntityInterpretation.relativeMonth;
      this.relativeWeek = runtimeEntityInterpretation.relativeWeek;
      this.relativeWeekend = runtimeEntityInterpretation.relativeWeekend;
      this.relativeYear = runtimeEntityInterpretation.relativeYear;
      this.specificDay = runtimeEntityInterpretation.specificDay;
      this.specificDayOfWeek = runtimeEntityInterpretation.specificDayOfWeek;
      this.specificMonth = runtimeEntityInterpretation.specificMonth;
      this.specificQuarter = runtimeEntityInterpretation.specificQuarter;
      this.specificYear = runtimeEntityInterpretation.specificYear;
      this.numericValue = runtimeEntityInterpretation.numericValue;
      this.subtype = runtimeEntityInterpretation.subtype;
      this.partOfDay = runtimeEntityInterpretation.partOfDay;
      this.relativeHour = runtimeEntityInterpretation.relativeHour;
      this.relativeMinute = runtimeEntityInterpretation.relativeMinute;
      this.relativeSecond = runtimeEntityInterpretation.relativeSecond;
      this.specificHour = runtimeEntityInterpretation.specificHour;
      this.specificMinute = runtimeEntityInterpretation.specificMinute;
      this.specificSecond = runtimeEntityInterpretation.specificSecond;
      this.timezone = runtimeEntityInterpretation.timezone;
    }

    /**
     * Instantiates a new builder.
     */
    public RuntimeEntityInterpretationBuilder() {
    }

    /**
     * Builds a RuntimeEntityInterpretation.
     *
     * @return the runtimeEntityInterpretation
     */
    public RuntimeEntityInterpretation build() {
      return new RuntimeEntityInterpretation(this);
    }

    /**
     * Set the calendarType.
     *
     * @param calendarType the calendarType
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder calendarType(String calendarType) {
      this.calendarType = calendarType;
      return this;
    }

    /**
     * Set the datetimeLink.
     *
     * @param datetimeLink the datetimeLink
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder datetimeLink(String datetimeLink) {
      this.datetimeLink = datetimeLink;
      return this;
    }

    /**
     * Set the festival.
     *
     * @param festival the festival
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder festival(String festival) {
      this.festival = festival;
      return this;
    }

    /**
     * Set the granularity.
     *
     * @param granularity the granularity
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder granularity(String granularity) {
      this.granularity = granularity;
      return this;
    }

    /**
     * Set the rangeLink.
     *
     * @param rangeLink the rangeLink
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder rangeLink(String rangeLink) {
      this.rangeLink = rangeLink;
      return this;
    }

    /**
     * Set the rangeModifier.
     *
     * @param rangeModifier the rangeModifier
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder rangeModifier(String rangeModifier) {
      this.rangeModifier = rangeModifier;
      return this;
    }

    /**
     * Set the relativeDay.
     *
     * @param relativeDay the relativeDay
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeDay(Double relativeDay) {
      this.relativeDay = relativeDay;
      return this;
    }

    /**
     * Set the relativeMonth.
     *
     * @param relativeMonth the relativeMonth
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeMonth(Double relativeMonth) {
      this.relativeMonth = relativeMonth;
      return this;
    }

    /**
     * Set the relativeWeek.
     *
     * @param relativeWeek the relativeWeek
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeWeek(Double relativeWeek) {
      this.relativeWeek = relativeWeek;
      return this;
    }

    /**
     * Set the relativeWeekend.
     *
     * @param relativeWeekend the relativeWeekend
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeWeekend(Double relativeWeekend) {
      this.relativeWeekend = relativeWeekend;
      return this;
    }

    /**
     * Set the relativeYear.
     *
     * @param relativeYear the relativeYear
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeYear(Double relativeYear) {
      this.relativeYear = relativeYear;
      return this;
    }

    /**
     * Set the specificDay.
     *
     * @param specificDay the specificDay
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificDay(Double specificDay) {
      this.specificDay = specificDay;
      return this;
    }

    /**
     * Set the specificDayOfWeek.
     *
     * @param specificDayOfWeek the specificDayOfWeek
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificDayOfWeek(String specificDayOfWeek) {
      this.specificDayOfWeek = specificDayOfWeek;
      return this;
    }

    /**
     * Set the specificMonth.
     *
     * @param specificMonth the specificMonth
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificMonth(Double specificMonth) {
      this.specificMonth = specificMonth;
      return this;
    }

    /**
     * Set the specificQuarter.
     *
     * @param specificQuarter the specificQuarter
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificQuarter(Double specificQuarter) {
      this.specificQuarter = specificQuarter;
      return this;
    }

    /**
     * Set the specificYear.
     *
     * @param specificYear the specificYear
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificYear(Double specificYear) {
      this.specificYear = specificYear;
      return this;
    }

    /**
     * Set the numericValue.
     *
     * @param numericValue the numericValue
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder numericValue(Double numericValue) {
      this.numericValue = numericValue;
      return this;
    }

    /**
     * Set the subtype.
     *
     * @param subtype the subtype
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder subtype(String subtype) {
      this.subtype = subtype;
      return this;
    }

    /**
     * Set the partOfDay.
     *
     * @param partOfDay the partOfDay
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder partOfDay(String partOfDay) {
      this.partOfDay = partOfDay;
      return this;
    }

    /**
     * Set the relativeHour.
     *
     * @param relativeHour the relativeHour
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeHour(Double relativeHour) {
      this.relativeHour = relativeHour;
      return this;
    }

    /**
     * Set the relativeMinute.
     *
     * @param relativeMinute the relativeMinute
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeMinute(Double relativeMinute) {
      this.relativeMinute = relativeMinute;
      return this;
    }

    /**
     * Set the relativeSecond.
     *
     * @param relativeSecond the relativeSecond
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder relativeSecond(Double relativeSecond) {
      this.relativeSecond = relativeSecond;
      return this;
    }

    /**
     * Set the specificHour.
     *
     * @param specificHour the specificHour
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificHour(Double specificHour) {
      this.specificHour = specificHour;
      return this;
    }

    /**
     * Set the specificMinute.
     *
     * @param specificMinute the specificMinute
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificMinute(Double specificMinute) {
      this.specificMinute = specificMinute;
      return this;
    }

    /**
     * Set the specificSecond.
     *
     * @param specificSecond the specificSecond
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder specificSecond(Double specificSecond) {
      this.specificSecond = specificSecond;
      return this;
    }

    /**
     * Set the timezone.
     *
     * @param timezone the timezone
     * @return the RuntimeEntityInterpretation builder
     */
    public RuntimeEntityInterpretationBuilder timezone(String timezone) {
      this.timezone = timezone;
      return this;
    }
  }

  /**
   * An object describing the role played by a system entity that is specifies the beginning or end of a range
   * recognized in the user input. This property is included only if the new system entities are enabled for the skill.
   */
  public class RuntimeEntityRole extends IBMWatsonGenericModel {
    private String xType;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public RuntimeEntityRole() { }

    /**
     * Gets the xType.
     *
     * The relationship of the entity to the range.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }
  
    private RuntimeEntityRole(RuntimeEntityRoleBuilder builder) {
      this.xType = builder.xType;
    }

    /**
     * New builder.
     *
     * @return a RuntimeEntityRole builder
     */
    public RuntimeEntityRoleBuilder newBuilder() {
      return new RuntimeEntityRoleBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      RuntimeEntityRole ret = (RuntimeEntityRole) super.deserialize(jsonString, jsonMap, classType);
      RuntimeEntityRoleBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xType' => 'type'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * RuntimeEntityRole Builder.
   */
  public class RuntimeEntityRoleBuilder {
    private String xType;

    private RuntimeEntityRoleBuilder(RuntimeEntityRole runtimeEntityRole) {
      this.xType = runtimeEntityRole.xType;
    }

    /**
     * Instantiates a new builder.
     */
    public RuntimeEntityRoleBuilder() {
    }

    /**
     * Builds a RuntimeEntityRole.
     *
     * @return the runtimeEntityRole
     */
    public RuntimeEntityRole build() {
      return new RuntimeEntityRole(this);
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the RuntimeEntityRole builder
     */
    public RuntimeEntityRoleBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }
  }

  /**
   * An intent identified in the user input.
   */
  public class RuntimeIntent extends IBMWatsonGenericModel {
    private String intent;
    private Double confidence;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public RuntimeIntent() { }

    /**
     * Gets the intent.
     *
     * The name of the recognized intent.
     *
     * @return the intent
     */
    @AuraEnabled
    public String getIntent() {
      return intent;
    }

    /**
     * Gets the confidence.
     *
     * A decimal percentage that represents Watson's confidence in the intent.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }
  
    private RuntimeIntent(RuntimeIntentBuilder builder) {
      IBMWatsonValidator.notNull(builder.intent, 'intent cannot be null');
      IBMWatsonValidator.notNull(builder.confidence, 'confidence cannot be null');
      this.intent = builder.intent;
      this.confidence = builder.confidence;
    }

    /**
     * New builder.
     *
     * @return a RuntimeIntent builder
     */
    public RuntimeIntentBuilder newBuilder() {
      return new RuntimeIntentBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      RuntimeIntent ret = (RuntimeIntent) super.deserialize(jsonString, jsonMap, classType);
      RuntimeIntentBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * RuntimeIntent Builder.
   */
  public class RuntimeIntentBuilder {
    private String intent;
    private Double confidence;

    private RuntimeIntentBuilder(RuntimeIntent runtimeIntent) {
      this.intent = runtimeIntent.intent;
      this.confidence = runtimeIntent.confidence;
    }

    /**
     * Instantiates a new builder.
     */
    public RuntimeIntentBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param intent the intent
     * @param confidence the confidence
     */
    public RuntimeIntentBuilder(String intent, Double confidence) {
      this.intent = intent;
      this.confidence = confidence;
    }

    /**
     * Builds a RuntimeIntent.
     *
     * @return the runtimeIntent
     */
    public RuntimeIntent build() {
      return new RuntimeIntent(this);
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the RuntimeIntent builder
     */
    public RuntimeIntentBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the confidence.
     *
     * @param confidence the confidence
     * @return the RuntimeIntent builder
     */
    public RuntimeIntentBuilder confidence(Double confidence) {
      this.confidence = confidence;
      return this;
    }
  }

  /**
   * RuntimeResponseGeneric.
   */
  public class RuntimeResponseGeneric extends IBMWatsonGenericModel {
    private String responseType;
    private String text;
    private Long xTime;
    private Boolean typing;
    private String source;
    private String title;
    private String description;
    private String preference;
    private List<DialogNodeOutputOptionsElement> options;
    private String messageToHumanAgent;
    private String topic;
    private List<DialogSuggestion> suggestions;
    private String header;
    private List<SearchResult> results;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public RuntimeResponseGeneric() { }

    /**
     * Gets the responseType.
     *
     * The type of response returned by the dialog node. The specified response type must be supported by the client
     * application or channel.
     *
     * **Note:** The **suggestion** response type is part of the disambiguation feature, which is only available for
     * Premium users.
     *
     * @return the responseType
     */
    @AuraEnabled
    public String getResponseType() {
      return responseType;
    }

    /**
     * Gets the text.
     *
     * The text of the response.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the xTime.
     *
     * How long to pause, in milliseconds.
     *
     * @return the xTime
     */
    @AuraEnabled
    public Long getXTime() {
      return xTime;
    }

    /**
     * Gets the typing.
     *
     * Whether to send a "user is typing" event during the pause.
     *
     * @return the typing
     */
    @AuraEnabled
    public Boolean getTyping() {
      return typing;
    }

    /**
     * Gets the source.
     *
     * The URL of the image.
     *
     * @return the source
     */
    @AuraEnabled
    public String getSource() {
      return source;
    }

    /**
     * Gets the title.
     *
     * The title or introductory text to show before the response.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the description.
     *
     * The description to show with the the response.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the preference.
     *
     * The preferred type of control to display.
     *
     * @return the preference
     */
    @AuraEnabled
    public String getPreference() {
      return preference;
    }

    /**
     * Gets the options.
     *
     * An array of objects describing the options from which the user can choose.
     *
     * @return the options
     */
    @AuraEnabled
    public List<DialogNodeOutputOptionsElement> getOptions() {
      return options;
    }

    /**
     * Gets the messageToHumanAgent.
     *
     * A message to be sent to the human agent who will be taking over the conversation.
     *
     * @return the messageToHumanAgent
     */
    @AuraEnabled
    public String getMessageToHumanAgent() {
      return messageToHumanAgent;
    }

    /**
     * Gets the topic.
     *
     * A label identifying the topic of the conversation, derived from the **user_label** property of the relevant node.
     *
     * @return the topic
     */
    @AuraEnabled
    public String getTopic() {
      return topic;
    }

    /**
     * Gets the suggestions.
     *
     * An array of objects describing the possible matching dialog nodes from which the user can choose.
     *
     * **Note:** The **suggestions** property is part of the disambiguation feature, which is only available for Premium
     * users.
     *
     * @return the suggestions
     */
    @AuraEnabled
    public List<DialogSuggestion> getSuggestions() {
      return suggestions;
    }

    /**
     * Gets the header.
     *
     * The title or introductory text to show before the response. This text is defined in the search skill
     * configuration.
     *
     * @return the header
     */
    @AuraEnabled
    public String getHeader() {
      return header;
    }

    /**
     * Gets the results.
     *
     * An array of objects containing search results.
     *
     * @return the results
     */
    @AuraEnabled
    public List<SearchResult> getResults() {
      return results;
    }
  
    private RuntimeResponseGeneric(RuntimeResponseGenericBuilder builder) {
      IBMWatsonValidator.notNull(builder.responseType, 'responseType cannot be null');
      this.responseType = builder.responseType;
      this.text = builder.text;
      this.xTime = builder.xTime;
      this.typing = builder.typing;
      this.source = builder.source;
      this.title = builder.title;
      this.description = builder.description;
      this.preference = builder.preference;
      this.options = builder.options;
      this.messageToHumanAgent = builder.messageToHumanAgent;
      this.topic = builder.topic;
      this.suggestions = builder.suggestions;
      this.header = builder.header;
      this.results = builder.results;
    }

    /**
     * New builder.
     *
     * @return a RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder newBuilder() {
      return new RuntimeResponseGenericBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'response_type' => 'responseType',
        'time' => 'xTime',
        'message_to_human_agent' => 'messageToHumanAgent'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      RuntimeResponseGeneric ret = (RuntimeResponseGeneric) super.deserialize(jsonString, jsonMap, classType);
      RuntimeResponseGenericBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for options
      List<DialogNodeOutputOptionsElement> newOptions = new List<DialogNodeOutputOptionsElement>();
      List<DialogNodeOutputOptionsElement> deserializedOptions = ret.getOptions();
      if (deserializedOptions != null) {
        for (Integer i = 0; i < deserializedOptions.size(); i++) {
          DialogNodeOutputOptionsElement currentItem = ret.getOptions().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('options');
          DialogNodeOutputOptionsElement newItem = (DialogNodeOutputOptionsElement) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNodeOutputOptionsElement.class);
          newOptions.add(newItem);
        }
        retBuilder.options(newOptions);
      }

      // calling custom deserializer for suggestions
      List<DialogSuggestion> newSuggestions = new List<DialogSuggestion>();
      List<DialogSuggestion> deserializedSuggestions = ret.getSuggestions();
      if (deserializedSuggestions != null) {
        for (Integer i = 0; i < deserializedSuggestions.size(); i++) {
          DialogSuggestion currentItem = ret.getSuggestions().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('suggestions');
          DialogSuggestion newItem = (DialogSuggestion) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogSuggestion.class);
          newSuggestions.add(newItem);
        }
        retBuilder.suggestions(newSuggestions);
      }

      // calling custom deserializer for results
      List<SearchResult> newResults = new List<SearchResult>();
      List<SearchResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          SearchResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          SearchResult newItem = (SearchResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SearchResult.class);
          newResults.add(newItem);
        }
        retBuilder.results(newResults);
      }

      return retBuilder.build();
    }
  }

  /**
   * RuntimeResponseGeneric Builder.
   */
  public class RuntimeResponseGenericBuilder {
    private String responseType;
    private String text;
    private Long xTime;
    private Boolean typing;
    private String source;
    private String title;
    private String description;
    private String preference;
    private List<DialogNodeOutputOptionsElement> options;
    private String messageToHumanAgent;
    private String topic;
    private List<DialogSuggestion> suggestions;
    private String header;
    private List<SearchResult> results;

    private RuntimeResponseGenericBuilder(RuntimeResponseGeneric runtimeResponseGeneric) {
      this.responseType = runtimeResponseGeneric.responseType;
      this.text = runtimeResponseGeneric.text;
      this.xTime = runtimeResponseGeneric.xTime;
      this.typing = runtimeResponseGeneric.typing;
      this.source = runtimeResponseGeneric.source;
      this.title = runtimeResponseGeneric.title;
      this.description = runtimeResponseGeneric.description;
      this.preference = runtimeResponseGeneric.preference;
      this.options = runtimeResponseGeneric.options;
      this.messageToHumanAgent = runtimeResponseGeneric.messageToHumanAgent;
      this.topic = runtimeResponseGeneric.topic;
      this.suggestions = runtimeResponseGeneric.suggestions;
      this.header = runtimeResponseGeneric.header;
      this.results = runtimeResponseGeneric.results;
    }

    /**
     * Instantiates a new builder.
     */
    public RuntimeResponseGenericBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param responseType the responseType
     */
    public RuntimeResponseGenericBuilder(String responseType) {
      this.responseType = responseType;
    }

    /**
     * Builds a RuntimeResponseGeneric.
     *
     * @return the runtimeResponseGeneric
     */
    public RuntimeResponseGeneric build() {
      return new RuntimeResponseGeneric(this);
    }

    /**
     * Adds an options to options.
     *
     * @param options the new options
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder addOptions(DialogNodeOutputOptionsElement options) {
      IBMWatsonValidator.notNull(options, 'options cannot be null');
      if (this.options == null) {
        this.options = new List<DialogNodeOutputOptionsElement>();
      }
      this.options.add(options);
      return this;
    }

    /**
     * Adds an suggestions to suggestions.
     *
     * @param suggestions the new suggestions
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder addSuggestions(DialogSuggestion suggestions) {
      IBMWatsonValidator.notNull(suggestions, 'suggestions cannot be null');
      if (this.suggestions == null) {
        this.suggestions = new List<DialogSuggestion>();
      }
      this.suggestions.add(suggestions);
      return this;
    }

    /**
     * Adds an results to results.
     *
     * @param results the new results
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder addResults(SearchResult results) {
      IBMWatsonValidator.notNull(results, 'results cannot be null');
      if (this.results == null) {
        this.results = new List<SearchResult>();
      }
      this.results.add(results);
      return this;
    }

    /**
     * Set the responseType.
     *
     * @param responseType the responseType
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder responseType(String responseType) {
      this.responseType = responseType;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the xTime.
     *
     * @param xTime the xTime
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder xTime(Long xTime) {
      this.xTime = xTime;
      return this;
    }

    /**
     * Set the typing.
     *
     * @param typing the typing
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder typing(Boolean typing) {
      this.typing = typing;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder source(String source) {
      this.source = source;
      return this;
    }

    /**
     * Set the title.
     *
     * @param title the title
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder title(String title) {
      this.title = title;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the preference.
     *
     * @param preference the preference
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder preference(String preference) {
      this.preference = preference;
      return this;
    }

    /**
     * Set the options.
     * Existing options will be replaced.
     *
     * @param options the options
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder options(List<DialogNodeOutputOptionsElement> options) {
      this.options = options;
      return this;
    }

    /**
     * Set the messageToHumanAgent.
     *
     * @param messageToHumanAgent the messageToHumanAgent
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder messageToHumanAgent(String messageToHumanAgent) {
      this.messageToHumanAgent = messageToHumanAgent;
      return this;
    }

    /**
     * Set the topic.
     *
     * @param topic the topic
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder topic(String topic) {
      this.topic = topic;
      return this;
    }

    /**
     * Set the suggestions.
     * Existing suggestions will be replaced.
     *
     * @param suggestions the suggestions
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder suggestions(List<DialogSuggestion> suggestions) {
      this.suggestions = suggestions;
      return this;
    }

    /**
     * Set the header.
     *
     * @param header the header
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder header(String header) {
      this.header = header;
      return this;
    }

    /**
     * Set the results.
     * Existing results will be replaced.
     *
     * @param results the results
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder results(List<SearchResult> results) {
      this.results = results;
      return this;
    }
  }

  /**
   * SearchResult.
   */
  public class SearchResult extends IBMWatsonGenericModel {
    private String id;
    private SearchResultMetadata resultMetadata;
    private String body;
    private String title;
    private String url;
    private SearchResultHighlight highlight;

    /**
     * Gets the id.
     *
     * The unique identifier of the document in the Discovery service collection.
     *
     * This property is included in responses from search skills, which are a beta feature available only to Plus or
     * Premium plan users.
     *
     * @return the id
     */
    @AuraEnabled
    public String getId() {
      return id;
    }

    /**
     * Gets the resultMetadata.
     *
     * An object containing search result metadata from the Discovery service.
     *
     * @return the resultMetadata
     */
    @AuraEnabled
    public SearchResultMetadata getResultMetadata() {
      return resultMetadata;
    }

    /**
     * Gets the body.
     *
     * A description of the search result. This is taken from an abstract, summary, or highlight field in the Discovery
     * service response, as specified in the search skill configuration.
     *
     * @return the body
     */
    @AuraEnabled
    public String getBody() {
      return body;
    }

    /**
     * Gets the title.
     *
     * The title of the search result. This is taken from a title or name field in the Discovery service response, as
     * specified in the search skill configuration.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the url.
     *
     * The URL of the original data object in its native data source.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the highlight.
     *
     * An object containing segments of text from search results with query-matching text highlighted using HTML <em>
     * tags.
     *
     * @return the highlight
     */
    @AuraEnabled
    public SearchResultHighlight getHighlight() {
      return highlight;
    }

    /**
     * Sets the id.
     *
     * @param id the new id
     */
    public void setId(final String id) {
      this.id = id;
    }

    /**
     * Sets the resultMetadata.
     *
     * @param resultMetadata the new resultMetadata
     */
    public void setResultMetadata(final SearchResultMetadata resultMetadata) {
      this.resultMetadata = resultMetadata;
    }

    /**
     * Sets the body.
     *
     * @param body the new body
     */
    public void setBody(final String body) {
      this.body = body;
    }

    /**
     * Sets the title.
     *
     * @param title the new title
     */
    public void setTitle(final String title) {
      this.title = title;
    }

    /**
     * Sets the url.
     *
     * @param url the new url
     */
    public void setUrl(final String url) {
      this.url = url;
    }

    /**
     * Sets the highlight.
     *
     * @param highlight the new highlight
     */
    public void setHighlight(final SearchResultHighlight highlight) {
      this.highlight = highlight;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'result_metadata' => 'resultMetadata'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SearchResult ret = (SearchResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for resultMetadata
      Map<String, Object> resultMetadataMap = (Map<String, Object>) jsonMap.get('resultMetadata');
      SearchResultMetadata newResultMetadata = (SearchResultMetadata) new SearchResultMetadata().deserialize(JSON.serialize(resultMetadataMap, true), resultMetadataMap, SearchResultMetadata.class);
      ret.setResultMetadata(newResultMetadata);

      // calling custom deserializer for highlight
      Map<String, Object> highlightMap = (Map<String, Object>) jsonMap.get('highlight');
      SearchResultHighlight newHighlight = (SearchResultHighlight) new SearchResultHighlight().deserialize(JSON.serialize(highlightMap, true), highlightMap, SearchResultHighlight.class);
      ret.setHighlight(newHighlight);

      return ret;
    }
  }

  /**
   * An object containing segments of text from search results with query-matching text highlighted using HTML <em> tags.
   */
  public class SearchResultHighlight extends IBMWatsonDynamicModel {
    private List<String> body;
    private List<String> title;
    private List<String> url;
    private Map<String, Object> additionalProperties;

    /**
     * Gets the body.
     *
     * @return the body
     */
    @AuraEnabled
    public List<String> getBody() {
      return body;
    }

    /**
     * Gets the title.
     *
     * @return the title
     */
    @AuraEnabled
    public List<String> getTitle() {
      return title;
    }

    /**
     * Gets the url.
     *
     * @return the url
     */
    @AuraEnabled
    public List<String> getUrl() {
      return url;
    }

    /**
     * Gets the dynamic properties attached to SearchResultHighlight.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    /**
     * Sets the body.
     *
     * @param body the new body
     */
    public void setBody(final List<String> body) {
      this.body = body;
    }

    /**
     * Sets the title.
     *
     * @param title the new title
     */
    public void setTitle(final List<String> title) {
      this.title = title;
    }

    /**
     * Sets the url.
     *
     * @param url the new url
     */
    public void setUrl(final List<String> url) {
      this.url = url;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SearchResultHighlight ret = (SearchResultHighlight) super.deserialize(jsonString, jsonMap, classType);

      Set<String> baseProps = ((Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true))).keySet();

      for (String key : jsonMap.keySet()) {
        if (!baseProps.contains(key)) {
          ret.put(key, jsonMap.get(key));
        }
      }

      return ret;
    }
  }

  /**
   * An object containing search result metadata from the Discovery service.
   */
  public class SearchResultMetadata extends IBMWatsonGenericModel {
    private Double confidence;
    private Double score;

    /**
     * Gets the confidence.
     *
     * The confidence score for the given result. For more information about how the confidence is calculated, see the
     * Discovery service [documentation](../discovery#query-your-collection).
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }

    /**
     * Gets the score.
     *
     * An unbounded measure of the relevance of a particular result, dependent on the query and matching document. A
     * higher score indicates a greater match to the query parameters.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Sets the confidence.
     *
     * @param confidence the new confidence
     */
    public void setConfidence(final Double confidence) {
      this.confidence = confidence;
    }

    /**
     * Sets the score.
     *
     * @param score the new score
     */
    public void setScore(final Double score) {
      this.score = score;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SearchResultMetadata ret = (SearchResultMetadata) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * SessionResponse.
   */
  public class SessionResponse extends IBMWatsonResponseModel {
    private String sessionId;

    /**
     * Gets the sessionId.
     *
     * The session ID.
     *
     * @return the sessionId
     */
    @AuraEnabled
    public String getSessionId() {
      return sessionId;
    }

    /**
     * Sets the sessionId.
     *
     * @param sessionId the new sessionId
     */
    public void setSessionId(final String sessionId) {
      this.sessionId = sessionId;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'session_id' => 'sessionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SessionResponse ret = (SessionResponse) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

}