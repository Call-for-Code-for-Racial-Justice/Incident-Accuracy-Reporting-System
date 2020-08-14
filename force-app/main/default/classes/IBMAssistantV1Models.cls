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

public class IBMAssistantV1Models {
  /**
   * A recognized capture group for a pattern-based entity.
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
   * State information for the conversation. To maintain state, include the context from the previous response.
   */
  public class Context extends IBMWatsonDynamicModel {
    private String conversationId;
    private SystemResponse xSystem;
    private MessageContextMetadata metadata;
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Context() { }

    /**
     * Gets the conversationId.
     *
     * @return the conversationId
     */
    @AuraEnabled
    public String getConversationId() {
      return conversationId;
    }

    /**
     * Gets the xSystem.
     *
     * @return the xSystem
     */
    @AuraEnabled
    public SystemResponse getXSystem() {
      return xSystem;
    }

    /**
     * Gets the metadata.
     *
     * @return the metadata
     */
    @AuraEnabled
    public MessageContextMetadata getMetadata() {
      return metadata;
    }

    /**
     * Gets the dynamic properties attached to Context.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private Context(ContextBuilder builder) {
      this.conversationId = builder.conversationId;
      this.xSystem = builder.xSystem;
      this.metadata = builder.metadata;
    }

    /**
     * New builder.
     *
     * @return a Context builder
     */
    public ContextBuilder newBuilder() {
      return new ContextBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'conversation_id' => 'conversationId',
        'system' => 'xSystem'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Context ret = (Context) super.deserialize(jsonString, jsonMap, classType);
      ContextBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for xSystem
      Map<String, Object> xSystemMap = (Map<String, Object>) jsonMap.get('xSystem');
      SystemResponse newXSystem = (SystemResponse) new SystemResponse().deserialize(JSON.serialize(xSystemMap, true), xSystemMap, SystemResponse.class);
      retBuilder.xSystem(newXSystem);

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      MessageContextMetadata newMetadata = (MessageContextMetadata) new MessageContextMetadata().deserialize(JSON.serialize(metadataMap, true), metadataMap, MessageContextMetadata.class);
      retBuilder.metadata(newMetadata);

      Context builderResult = retBuilder.build();
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

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'conversationId' => 'conversation_id',
        'xSystem' => 'system'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.raiseAdditionalProperties(jsonMap);

      // performing custom serialization for xSystem
      if (xSystem != null) {
        String xSystemJsonString = JSON.serialize(xSystem.replacePropertyNames(), true);
        String xSystemKey = 'xSystem';
        if (propertyNameMapping.containsKey(xSystemKey)) {
          xSystemKey = propertyNameMapping.get(xSystemKey);
        }
        jsonMap.put(xSystemKey, JSON.deserializeUntyped(xSystemJsonString));
      }

      // performing custom serialization for metadata
      if (metadata != null) {
        String metadataJsonString = JSON.serialize(metadata.replacePropertyNames(), true);
        String metadataKey = 'metadata';
        if (propertyNameMapping.containsKey(metadataKey)) {
          metadataKey = propertyNameMapping.get(metadataKey);
        }
        jsonMap.put(metadataKey, JSON.deserializeUntyped(metadataJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * Context Builder.
   */
  public class ContextBuilder {
    private String conversationId;
    private SystemResponse xSystem;
    private MessageContextMetadata metadata;

    private ContextBuilder(Context context) {
      this.conversationId = context.conversationId;
      this.xSystem = context.xSystem;
      this.metadata = context.metadata;
    }

    /**
     * Instantiates a new builder.
     */
    public ContextBuilder() { }

    /**
     * Builds a Context.
     *
     * @return the context
     */
    public Context build() {
      return new Context(this);
    }

    /**
     * Set the conversationId.
     *
     * @param conversationId the conversationId
     * @return the Context builder
     */
    public ContextBuilder conversationId(String conversationId) {
      this.conversationId = conversationId;
      return this;
    }

    /**
     * Set the xSystem.
     *
     * @param xSystem the xSystem
     * @return the Context builder
     */
    public ContextBuilder xSystem(SystemResponse xSystem) {
      this.xSystem = xSystem;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the Context builder
     */
    public ContextBuilder metadata(MessageContextMetadata metadata) {
      this.metadata = metadata;
      return this;
    }
  }

  /**
   * Counterexample.
   */
  public class Counterexample extends IBMWatsonResponseModel {
    private String text;
    private Datetime created;
    private Datetime updated;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Counterexample() { }

    /**
     * Gets the text.
     *
     * The text of a user input marked as irrelevant input. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }
  
    private Counterexample(CounterexampleBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      this.text = builder.text;
      this.created = builder.created;
      this.updated = builder.updated;
    }

    /**
     * New builder.
     *
     * @return a Counterexample builder
     */
    public CounterexampleBuilder newBuilder() {
      return new CounterexampleBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Counterexample ret = (Counterexample) super.deserialize(jsonString, jsonMap, classType);
      CounterexampleBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * Counterexample Builder.
   */
  public class CounterexampleBuilder {
    private String text;
    private Datetime created;
    private Datetime updated;

    private CounterexampleBuilder(Counterexample counterexample) {
      this.text = counterexample.text;
      this.created = counterexample.created;
      this.updated = counterexample.updated;
    }

    /**
     * Instantiates a new builder.
     */
    public CounterexampleBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public CounterexampleBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a Counterexample.
     *
     * @return the counterexample
     */
    public Counterexample build() {
      return new Counterexample(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the Counterexample builder
     */
    public CounterexampleBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the Counterexample builder
     */
    public CounterexampleBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the Counterexample builder
     */
    public CounterexampleBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }
  }

  /**
   * CounterexampleCollection.
   */
  public class CounterexampleCollection extends IBMWatsonResponseModel {
    private List<Counterexample> counterexamples;
    private Pagination pagination;

    /**
     * Gets the counterexamples.
     *
     * An array of objects describing the examples marked as irrelevant input.
     *
     * @return the counterexamples
     */
    @AuraEnabled
    public List<Counterexample> getCounterexamples() {
      return counterexamples;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the counterexamples.
     *
     * @param counterexamples the new counterexamples
     */
    public void setCounterexamples(final List<Counterexample> counterexamples) {
      this.counterexamples = counterexamples;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      CounterexampleCollection ret = (CounterexampleCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for counterexamples
      List<Counterexample> newCounterexamples = new List<Counterexample>();
      List<Counterexample> deserializedCounterexamples = ret.getCounterexamples();
      if (deserializedCounterexamples != null) {
        for (Integer i = 0; i < deserializedCounterexamples.size(); i++) {
          Counterexample currentItem = ret.getCounterexamples().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('counterexamples');
          Counterexample newItem = (Counterexample) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Counterexample.class);
          newCounterexamples.add(newItem);
        }
        ret.counterexamples = newCounterexamples;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * The createCounterexample options.
   */
  public class CreateCounterexampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the text.
     *
     * The text of a user input marked as irrelevant input. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateCounterexampleOptions(CreateCounterexampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      workspaceId = builder.workspaceId;
      text = builder.text;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateCounterexampleOptions builder
     */
    public CreateCounterexampleOptionsBuilder newBuilder() {
      return new CreateCounterexampleOptionsBuilder(this);
    }
  }

  /**
   * CreateCounterexampleOptions Builder.
   */
  public class CreateCounterexampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;
    private Boolean includeAudit;

    private CreateCounterexampleOptionsBuilder(CreateCounterexampleOptions createCounterexampleOptions) {
      workspaceId = createCounterexampleOptions.workspaceId;
      text = createCounterexampleOptions.text;
      includeAudit = createCounterexampleOptions.includeAudit;
      this.requestHeaders.putAll(createCounterexampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateCounterexampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param text the text
     */
    public CreateCounterexampleOptionsBuilder(String workspaceId, String text) {
      this.workspaceId = workspaceId;
      this.text = text;
    }

    /**
     * Builds a CreateCounterexampleOptions.
     *
     * @return the createCounterexampleOptions
     */
    public CreateCounterexampleOptions build() {
      return new CreateCounterexampleOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the CreateCounterexampleOptions builder
     */
    public CreateCounterexampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the CreateCounterexampleOptions builder
     */
    public CreateCounterexampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateCounterexampleOptions builder
     */
    public CreateCounterexampleOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Set the counterexample.
     *
     * @param counterexample the counterexample
     * @return the CreateCounterexampleOptions builder
     */
    public CreateCounterexampleOptionsBuilder counterexample(Counterexample counterexample) {
      this.text = counterexample.getText();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateCounterexampleOptions builder
     */
    public CreateCounterexampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createDialogNode options.
   */
  public class CreateDialogNodeOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;
    private String description;
    private String conditions;
    private String parent;
    private String previousSibling;
    private DialogNodeOutput output;
    private IBMWatsonMapModel context;
    private IBMWatsonMapModel metadata;
    private DialogNodeNextStep nextStep;
    private String title;
    private String xType;
    private String eventName;
    private String variable;
    private List<DialogNodeAction> actions;
    private String digressIn;
    private String digressOut;
    private String digressOutSlots;
    private String userLabel;
    private Boolean disambiguationOptOut;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the dialogNode.
     *
     * The dialog node ID. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot characters.
     *
     * @return the dialogNode
     */
    public String dialogNode() {
      return dialogNode;
    }

    /**
     * Gets the description.
     *
     * The description of the dialog node. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the conditions.
     *
     * The condition that will trigger the dialog node. This string cannot contain carriage return, newline, or tab
     * characters.
     *
     * @return the conditions
     */
    public String conditions() {
      return conditions;
    }

    /**
     * Gets the parent.
     *
     * The ID of the parent dialog node. This property is omitted if the dialog node has no parent.
     *
     * @return the parent
     */
    public String parent() {
      return parent;
    }

    /**
     * Gets the previousSibling.
     *
     * The ID of the previous sibling dialog node. This property is omitted if the dialog node has no previous sibling.
     *
     * @return the previousSibling
     */
    public String previousSibling() {
      return previousSibling;
    }

    /**
     * Gets the output.
     *
     * The output of the dialog node. For more information about how to specify dialog node output, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-dialog-overview#dialog-overview-responses).
     *
     * @return the output
     */
    public DialogNodeOutput output() {
      return output;
    }

    /**
     * Gets the context.
     *
     * The context for the dialog node.
     *
     * @return the context
     */
    public IBMWatsonMapModel context() {
      return context;
    }

    /**
     * Gets the metadata.
     *
     * The metadata for the dialog node.
     *
     * @return the metadata
     */
    public IBMWatsonMapModel metadata() {
      return metadata;
    }

    /**
     * Gets the nextStep.
     *
     * The next step to execute following this dialog node.
     *
     * @return the nextStep
     */
    public DialogNodeNextStep nextStep() {
      return nextStep;
    }

    /**
     * Gets the title.
     *
     * The alias used to identify the dialog node. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot characters.
     *
     * @return the title
     */
    public String title() {
      return title;
    }

    /**
     * Gets the xType.
     *
     * How the dialog node is processed.
     *
     * @return the xType
     */
    public String xType() {
      return xType;
    }

    /**
     * Gets the eventName.
     *
     * How an `event_handler` node is processed.
     *
     * @return the eventName
     */
    public String eventName() {
      return eventName;
    }

    /**
     * Gets the variable.
     *
     * The location in the dialog context where output is stored.
     *
     * @return the variable
     */
    public String variable() {
      return variable;
    }

    /**
     * Gets the actions.
     *
     * An array of objects describing any actions to be invoked by the dialog node.
     *
     * @return the actions
     */
    public List<DialogNodeAction> actions() {
      return actions;
    }

    /**
     * Gets the digressIn.
     *
     * Whether this top-level dialog node can be digressed into.
     *
     * @return the digressIn
     */
    public String digressIn() {
      return digressIn;
    }

    /**
     * Gets the digressOut.
     *
     * Whether this dialog node can be returned to after a digression.
     *
     * @return the digressOut
     */
    public String digressOut() {
      return digressOut;
    }

    /**
     * Gets the digressOutSlots.
     *
     * Whether the user can digress to top-level nodes while filling out slots.
     *
     * @return the digressOutSlots
     */
    public String digressOutSlots() {
      return digressOutSlots;
    }

    /**
     * Gets the userLabel.
     *
     * A label that can be displayed externally to describe the purpose of the node to users.
     *
     * @return the userLabel
     */
    public String userLabel() {
      return userLabel;
    }

    /**
     * Gets the disambiguationOptOut.
     *
     * Whether the dialog node should be excluded from disambiguation suggestions.
     *
     * @return the disambiguationOptOut
     */
    public Boolean disambiguationOptOut() {
      return disambiguationOptOut;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateDialogNodeOptions(CreateDialogNodeOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notNull(builder.dialogNode, 'dialogNode cannot be null');
      workspaceId = builder.workspaceId;
      dialogNode = builder.dialogNode;
      description = builder.description;
      conditions = builder.conditions;
      parent = builder.parent;
      previousSibling = builder.previousSibling;
      output = builder.output;
      context = builder.context;
      metadata = builder.metadata;
      nextStep = builder.nextStep;
      title = builder.title;
      xType = builder.xType;
      eventName = builder.eventName;
      variable = builder.variable;
      actions = builder.actions;
      digressIn = builder.digressIn;
      digressOut = builder.digressOut;
      digressOutSlots = builder.digressOutSlots;
      userLabel = builder.userLabel;
      disambiguationOptOut = builder.disambiguationOptOut;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder newBuilder() {
      return new CreateDialogNodeOptionsBuilder(this);
    }
  }

  /**
   * CreateDialogNodeOptions Builder.
   */
  public class CreateDialogNodeOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;
    private String description;
    private String conditions;
    private String parent;
    private String previousSibling;
    private DialogNodeOutput output;
    private IBMWatsonMapModel context;
    private IBMWatsonMapModel metadata;
    private DialogNodeNextStep nextStep;
    private String title;
    private String xType;
    private String eventName;
    private String variable;
    private List<DialogNodeAction> actions;
    private String digressIn;
    private String digressOut;
    private String digressOutSlots;
    private String userLabel;
    private Boolean disambiguationOptOut;
    private Boolean includeAudit;

    private CreateDialogNodeOptionsBuilder(CreateDialogNodeOptions createDialogNodeOptions) {
      workspaceId = createDialogNodeOptions.workspaceId;
      dialogNode = createDialogNodeOptions.dialogNode;
      description = createDialogNodeOptions.description;
      conditions = createDialogNodeOptions.conditions;
      parent = createDialogNodeOptions.parent;
      previousSibling = createDialogNodeOptions.previousSibling;
      output = createDialogNodeOptions.output;
      context = createDialogNodeOptions.context;
      metadata = createDialogNodeOptions.metadata;
      nextStep = createDialogNodeOptions.nextStep;
      title = createDialogNodeOptions.title;
      xType = createDialogNodeOptions.xType;
      eventName = createDialogNodeOptions.eventName;
      variable = createDialogNodeOptions.variable;
      actions = createDialogNodeOptions.actions;
      digressIn = createDialogNodeOptions.digressIn;
      digressOut = createDialogNodeOptions.digressOut;
      digressOutSlots = createDialogNodeOptions.digressOutSlots;
      userLabel = createDialogNodeOptions.userLabel;
      disambiguationOptOut = createDialogNodeOptions.disambiguationOptOut;
      includeAudit = createDialogNodeOptions.includeAudit;
      this.requestHeaders.putAll(createDialogNodeOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateDialogNodeOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param dialogNode the dialogNode
     */
    public CreateDialogNodeOptionsBuilder(String workspaceId, String dialogNode) {
      this.workspaceId = workspaceId;
      this.dialogNode = dialogNode;
    }

    /**
     * Builds a CreateDialogNodeOptions.
     *
     * @return the createDialogNodeOptions
     */
    public CreateDialogNodeOptions build() {
      return new CreateDialogNodeOptions(this);
    }

    /**
     * Adds an actions to actions.
     *
     * @param actions the new actions
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder addActions(DialogNodeAction actions) {
      IBMWatsonValidator.notNull(actions, 'actions cannot be null');
      if (this.actions == null) {
        this.actions = new List<DialogNodeAction>();
      }
      this.actions.add(actions);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the conditions.
     *
     * @param conditions the conditions
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder conditions(String conditions) {
      this.conditions = conditions;
      return this;
    }

    /**
     * Set the parent.
     *
     * @param parent the parent
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder parent(String parent) {
      this.parent = parent;
      return this;
    }

    /**
     * Set the previousSibling.
     *
     * @param previousSibling the previousSibling
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder previousSibling(String previousSibling) {
      this.previousSibling = previousSibling;
      return this;
    }

    /**
     * Set the output.
     *
     * @param output the output
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder output(DialogNodeOutput output) {
      this.output = output;
      return this;
    }

    /**
     * Set the context.
     *
     * @param context the context
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder context(IBMWatsonMapModel context) {
      this.context = context;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the nextStep.
     *
     * @param nextStep the nextStep
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder nextStep(DialogNodeNextStep nextStep) {
      this.nextStep = nextStep;
      return this;
    }

    /**
     * Set the title.
     *
     * @param title the title
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder title(String title) {
      this.title = title;
      return this;
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the eventName.
     *
     * @param eventName the eventName
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder eventName(String eventName) {
      this.eventName = eventName;
      return this;
    }

    /**
     * Set the variable.
     *
     * @param variable the variable
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder variable(String variable) {
      this.variable = variable;
      return this;
    }

    /**
     * Set the actions.
     * Existing actions will be replaced.
     *
     * @param actions the actions
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder actions(List<DialogNodeAction> actions) {
      this.actions = actions;
      return this;
    }

    /**
     * Set the digressIn.
     *
     * @param digressIn the digressIn
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder digressIn(String digressIn) {
      this.digressIn = digressIn;
      return this;
    }

    /**
     * Set the digressOut.
     *
     * @param digressOut the digressOut
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder digressOut(String digressOut) {
      this.digressOut = digressOut;
      return this;
    }

    /**
     * Set the digressOutSlots.
     *
     * @param digressOutSlots the digressOutSlots
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder digressOutSlots(String digressOutSlots) {
      this.digressOutSlots = digressOutSlots;
      return this;
    }

    /**
     * Set the userLabel.
     *
     * @param userLabel the userLabel
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder userLabel(String userLabel) {
      this.userLabel = userLabel;
      return this;
    }

    /**
     * Set the disambiguationOptOut.
     *
     * @param disambiguationOptOut the disambiguationOptOut
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder disambiguationOptOut(Boolean disambiguationOptOut) {
      this.disambiguationOptOut = disambiguationOptOut;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder dialogNode(DialogNode dialogNode) {
      this.dialogNode = dialogNode.getDialogNode();
      this.description = dialogNode.getDescription();
      this.conditions = dialogNode.getConditions();
      this.parent = dialogNode.getParent();
      this.previousSibling = dialogNode.getPreviousSibling();
      this.output = dialogNode.getOutput();
      this.context = dialogNode.getContext();
      this.metadata = dialogNode.getMetadata();
      this.nextStep = dialogNode.getNextStep();
      this.title = dialogNode.getTitle();
      this.xType = dialogNode.getXType();
      this.eventName = dialogNode.getEventName();
      this.variable = dialogNode.getVariable();
      this.actions = dialogNode.getActions();
      this.digressIn = dialogNode.getDigressIn();
      this.digressOut = dialogNode.getDigressOut();
      this.digressOutSlots = dialogNode.getDigressOutSlots();
      this.userLabel = dialogNode.getUserLabel();
      this.disambiguationOptOut = dialogNode.getDisambiguationOptOut();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateDialogNodeOptions builder
     */
    public CreateDialogNodeOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * CreateEntity.
   */
  public class CreateEntity extends IBMWatsonGenericModel {
    private String entity;
    private String description;
    private IBMWatsonMapModel metadata;
    private Boolean fuzzyMatch;
    private Datetime created;
    private Datetime updated;
    private List<CreateValue> values;

    /**
     * Gets the entity.
     *
     * The name of the entity. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, and hyphen characters.
     * - If you specify an entity name beginning with the reserved prefix `sys-`, it must be the name of a system entity
     * that you want to enable. (Any entity content specified with the request is ignored.).
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the description.
     *
     * The description of the entity. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the entity.
     *
     * @return the metadata
     */
    public IBMWatsonMapModel metadata() {
      return metadata;
    }

    /**
     * Gets the fuzzyMatch.
     *
     * Whether to use fuzzy matching for the entity.
     *
     * @return the fuzzyMatch
     */
    public Boolean fuzzyMatch() {
      return fuzzyMatch;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    public Datetime created() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    public Datetime updated() {
      return updated;
    }

    /**
     * Gets the values.
     *
     * An array of objects describing the entity values.
     *
     * @return the values
     */
    public List<CreateValue> values() {
      return values;
    }
  
    private CreateEntity(CreateEntityBuilder builder) {
      IBMWatsonValidator.notNull(builder.entity, 'entity cannot be null');
      this.entity = builder.entity;
      this.description = builder.description;
      this.metadata = builder.metadata;
      this.fuzzyMatch = builder.fuzzyMatch;
      this.created = builder.created;
      this.updated = builder.updated;
      this.values = builder.values;
    }

    /**
     * New builder.
     *
     * @return a CreateEntity builder
     */
    public CreateEntityBuilder newBuilder() {
      return new CreateEntityBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'fuzzyMatch' => 'fuzzy_match'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for metadata
      if (metadata != null) {
        String metadataJsonString = JSON.serialize(metadata.replacePropertyNames(), true);
        String metadataKey = 'metadata';
        if (propertyNameMapping.containsKey(metadataKey)) {
          metadataKey = propertyNameMapping.get(metadataKey);
        }
        jsonMap.put(metadataKey, JSON.deserializeUntyped(metadataJsonString));
      }

      // performing custom serialization for values
      if (values != null) {
        List<Object> valuesJsonList = new List<Object>();
        for (CreateValue listItem : values) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          valuesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String valuesKey = 'values';
        if (propertyNameMapping.containsKey(valuesKey)) {
          valuesKey = propertyNameMapping.get(valuesKey);
        }
        jsonMap.put(valuesKey, valuesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * CreateEntity Builder.
   */
  public class CreateEntityBuilder {
    private String entity;
    private String description;
    private IBMWatsonMapModel metadata;
    private Boolean fuzzyMatch;
    private Datetime created;
    private Datetime updated;
    private List<CreateValue> values;

    private CreateEntityBuilder(CreateEntity createEntity) {
      this.entity = createEntity.entity;
      this.description = createEntity.description;
      this.metadata = createEntity.metadata;
      this.fuzzyMatch = createEntity.fuzzyMatch;
      this.created = createEntity.created;
      this.updated = createEntity.updated;
      this.values = createEntity.values;
    }

    /**
     * Instantiates a new builder.
     */
    public CreateEntityBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param entity the entity
     */
    public CreateEntityBuilder(String entity) {
      this.entity = entity;
    }

    /**
     * Builds a CreateEntity.
     *
     * @return the createEntity
     */
    public CreateEntity build() {
      return new CreateEntity(this);
    }

    /**
     * Adds an values to values.
     *
     * @param values the new values
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder addValues(CreateValue values) {
      IBMWatsonValidator.notNull(values, 'values cannot be null');
      if (this.values == null) {
        this.values = new List<CreateValue>();
      }
      this.values.add(values);
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the fuzzyMatch.
     *
     * @param fuzzyMatch the fuzzyMatch
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder fuzzyMatch(Boolean fuzzyMatch) {
      this.fuzzyMatch = fuzzyMatch;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }

    /**
     * Set the values.
     * Existing values will be replaced.
     *
     * @param values the values
     * @return the CreateEntity builder
     */
    public CreateEntityBuilder values(List<CreateValue> values) {
      this.values = values;
      return this;
    }
  }

  /**
   * The createEntity options.
   */
  public class CreateEntityOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String description;
    private IBMWatsonMapModel metadata;
    private Boolean fuzzyMatch;
    private List<CreateValue> values;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, and hyphen characters.
     * - If you specify an entity name beginning with the reserved prefix `sys-`, it must be the name of a system entity
     * that you want to enable. (Any entity content specified with the request is ignored.).
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the description.
     *
     * The description of the entity. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the entity.
     *
     * @return the metadata
     */
    public IBMWatsonMapModel metadata() {
      return metadata;
    }

    /**
     * Gets the fuzzyMatch.
     *
     * Whether to use fuzzy matching for the entity.
     *
     * @return the fuzzyMatch
     */
    public Boolean fuzzyMatch() {
      return fuzzyMatch;
    }

    /**
     * Gets the values.
     *
     * An array of objects describing the entity values.
     *
     * @return the values
     */
    public List<CreateValue> values() {
      return values;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateEntityOptions(CreateEntityOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notNull(builder.entity, 'entity cannot be null');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      description = builder.description;
      metadata = builder.metadata;
      fuzzyMatch = builder.fuzzyMatch;
      values = builder.values;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder newBuilder() {
      return new CreateEntityOptionsBuilder(this);
    }
  }

  /**
   * CreateEntityOptions Builder.
   */
  public class CreateEntityOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String description;
    private IBMWatsonMapModel metadata;
    private Boolean fuzzyMatch;
    private List<CreateValue> values;
    private Boolean includeAudit;

    private CreateEntityOptionsBuilder(CreateEntityOptions createEntityOptions) {
      workspaceId = createEntityOptions.workspaceId;
      entity = createEntityOptions.entity;
      description = createEntityOptions.description;
      metadata = createEntityOptions.metadata;
      fuzzyMatch = createEntityOptions.fuzzyMatch;
      values = createEntityOptions.values;
      includeAudit = createEntityOptions.includeAudit;
      this.requestHeaders.putAll(createEntityOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateEntityOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     */
    public CreateEntityOptionsBuilder(String workspaceId, String entity) {
      this.workspaceId = workspaceId;
      this.entity = entity;
    }

    /**
     * Builds a CreateEntityOptions.
     *
     * @return the createEntityOptions
     */
    public CreateEntityOptions build() {
      return new CreateEntityOptions(this);
    }

    /**
     * Adds an values to values.
     *
     * @param values the new values
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder addValues(CreateValue values) {
      IBMWatsonValidator.notNull(values, 'values cannot be null');
      if (this.values == null) {
        this.values = new List<CreateValue>();
      }
      this.values.add(values);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the fuzzyMatch.
     *
     * @param fuzzyMatch the fuzzyMatch
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder fuzzyMatch(Boolean fuzzyMatch) {
      this.fuzzyMatch = fuzzyMatch;
      return this;
    }

    /**
     * Set the values.
     * Existing values will be replaced.
     *
     * @param values the values
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder values(List<CreateValue> values) {
      this.values = values;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateEntityOptions builder
     */
    public CreateEntityOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createExample options.
   */
  public class CreateExampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;
    private List<Mention> mentions;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the text.
     *
     * The text of a user input example. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the mentions.
     *
     * An array of contextual entity mentions.
     *
     * @return the mentions
     */
    public List<Mention> mentions() {
      return mentions;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateExampleOptions(CreateExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      text = builder.text;
      mentions = builder.mentions;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder newBuilder() {
      return new CreateExampleOptionsBuilder(this);
    }
  }

  /**
   * CreateExampleOptions Builder.
   */
  public class CreateExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;
    private List<Mention> mentions;
    private Boolean includeAudit;

    private CreateExampleOptionsBuilder(CreateExampleOptions createExampleOptions) {
      workspaceId = createExampleOptions.workspaceId;
      intent = createExampleOptions.intent;
      text = createExampleOptions.text;
      mentions = createExampleOptions.mentions;
      includeAudit = createExampleOptions.includeAudit;
      this.requestHeaders.putAll(createExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     * @param text the text
     */
    public CreateExampleOptionsBuilder(String workspaceId, String intent, String text) {
      this.workspaceId = workspaceId;
      this.intent = intent;
      this.text = text;
    }

    /**
     * Builds a CreateExampleOptions.
     *
     * @return the createExampleOptions
     */
    public CreateExampleOptions build() {
      return new CreateExampleOptions(this);
    }

    /**
     * Adds an mentions to mentions.
     *
     * @param mentions the new mentions
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder addMentions(Mention mentions) {
      IBMWatsonValidator.notNull(mentions, 'mentions cannot be null');
      if (this.mentions == null) {
        this.mentions = new List<Mention>();
      }
      this.mentions.add(mentions);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the mentions.
     * Existing mentions will be replaced.
     *
     * @param mentions the mentions
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder mentions(List<Mention> mentions) {
      this.mentions = mentions;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Set the example.
     *
     * @param example the example
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder example(Example example) {
      this.text = example.getText();
      this.mentions = example.getMentions();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateExampleOptions builder
     */
    public CreateExampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * CreateIntent.
   */
  public class CreateIntent extends IBMWatsonGenericModel {
    private String intent;
    private String description;
    private Datetime created;
    private Datetime updated;
    private List<Example> examples;

    /**
     * Gets the intent.
     *
     * The name of the intent. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, hyphen, and dot characters.
     * - It cannot begin with the reserved prefix `sys-`.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the description.
     *
     * The description of the intent. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    public Datetime created() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    public Datetime updated() {
      return updated;
    }

    /**
     * Gets the examples.
     *
     * An array of user input examples for the intent.
     *
     * @return the examples
     */
    public List<Example> examples() {
      return examples;
    }
  
    private CreateIntent(CreateIntentBuilder builder) {
      IBMWatsonValidator.notNull(builder.intent, 'intent cannot be null');
      this.intent = builder.intent;
      this.description = builder.description;
      this.created = builder.created;
      this.updated = builder.updated;
      this.examples = builder.examples;
    }

    /**
     * New builder.
     *
     * @return a CreateIntent builder
     */
    public CreateIntentBuilder newBuilder() {
      return new CreateIntentBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for examples
      if (examples != null) {
        List<Object> examplesJsonList = new List<Object>();
        for (Example listItem : examples) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          examplesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('examples', examplesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * CreateIntent Builder.
   */
  public class CreateIntentBuilder {
    private String intent;
    private String description;
    private Datetime created;
    private Datetime updated;
    private List<Example> examples;

    private CreateIntentBuilder(CreateIntent createIntent) {
      this.intent = createIntent.intent;
      this.description = createIntent.description;
      this.created = createIntent.created;
      this.updated = createIntent.updated;
      this.examples = createIntent.examples;
    }

    /**
     * Instantiates a new builder.
     */
    public CreateIntentBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param intent the intent
     */
    public CreateIntentBuilder(String intent) {
      this.intent = intent;
    }

    /**
     * Builds a CreateIntent.
     *
     * @return the createIntent
     */
    public CreateIntent build() {
      return new CreateIntent(this);
    }

    /**
     * Adds an examples to examples.
     *
     * @param examples the new examples
     * @return the CreateIntent builder
     */
    public CreateIntentBuilder addExamples(Example examples) {
      IBMWatsonValidator.notNull(examples, 'examples cannot be null');
      if (this.examples == null) {
        this.examples = new List<Example>();
      }
      this.examples.add(examples);
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the CreateIntent builder
     */
    public CreateIntentBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateIntent builder
     */
    public CreateIntentBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the CreateIntent builder
     */
    public CreateIntentBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the CreateIntent builder
     */
    public CreateIntentBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }

    /**
     * Set the examples.
     * Existing examples will be replaced.
     *
     * @param examples the examples
     * @return the CreateIntent builder
     */
    public CreateIntentBuilder examples(List<Example> examples) {
      this.examples = examples;
      return this;
    }
  }

  /**
   * The createIntent options.
   */
  public class CreateIntentOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String description;
    private List<Example> examples;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The name of the intent. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, hyphen, and dot characters.
     * - It cannot begin with the reserved prefix `sys-`.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the description.
     *
     * The description of the intent. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the examples.
     *
     * An array of user input examples for the intent.
     *
     * @return the examples
     */
    public List<Example> examples() {
      return examples;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateIntentOptions(CreateIntentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notNull(builder.intent, 'intent cannot be null');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      description = builder.description;
      examples = builder.examples;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder newBuilder() {
      return new CreateIntentOptionsBuilder(this);
    }
  }

  /**
   * CreateIntentOptions Builder.
   */
  public class CreateIntentOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String description;
    private List<Example> examples;
    private Boolean includeAudit;

    private CreateIntentOptionsBuilder(CreateIntentOptions createIntentOptions) {
      workspaceId = createIntentOptions.workspaceId;
      intent = createIntentOptions.intent;
      description = createIntentOptions.description;
      examples = createIntentOptions.examples;
      includeAudit = createIntentOptions.includeAudit;
      this.requestHeaders.putAll(createIntentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateIntentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     */
    public CreateIntentOptionsBuilder(String workspaceId, String intent) {
      this.workspaceId = workspaceId;
      this.intent = intent;
    }

    /**
     * Builds a CreateIntentOptions.
     *
     * @return the createIntentOptions
     */
    public CreateIntentOptions build() {
      return new CreateIntentOptions(this);
    }

    /**
     * Adds an examples to examples.
     *
     * @param examples the new examples
     * @return the CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder addExamples(Example examples) {
      IBMWatsonValidator.notNull(examples, 'examples cannot be null');
      if (this.examples == null) {
        this.examples = new List<Example>();
      }
      this.examples.add(examples);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the examples.
     * Existing examples will be replaced.
     *
     * @param examples the examples
     * @return the CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder examples(List<Example> examples) {
      this.examples = examples;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateIntentOptions builder
     */
    public CreateIntentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createSynonym options.
   */
  public class CreateSynonymOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the synonym.
     *
     * The text of the synonym. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the synonym
     */
    public String synonym() {
      return synonym;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateSynonymOptions(CreateSynonymOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      IBMWatsonValidator.notNull(builder.synonym, 'synonym cannot be null');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      synonym = builder.synonym;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder newBuilder() {
      return new CreateSynonymOptionsBuilder(this);
    }
  }

  /**
   * CreateSynonymOptions Builder.
   */
  public class CreateSynonymOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;
    private Boolean includeAudit;

    private CreateSynonymOptionsBuilder(CreateSynonymOptions createSynonymOptions) {
      workspaceId = createSynonymOptions.workspaceId;
      entity = createSynonymOptions.entity;
      value = createSynonymOptions.value;
      synonym = createSynonymOptions.synonym;
      includeAudit = createSynonymOptions.includeAudit;
      this.requestHeaders.putAll(createSynonymOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateSynonymOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     * @param synonym the synonym
     */
    public CreateSynonymOptionsBuilder(String workspaceId, String entity, String value, String synonym) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
      this.synonym = synonym;
    }

    /**
     * Builds a CreateSynonymOptions.
     *
     * @return the createSynonymOptions
     */
    public CreateSynonymOptions build() {
      return new CreateSynonymOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the synonym.
     *
     * @param synonym the synonym
     * @return the CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder synonym(String synonym) {
      this.synonym = synonym;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Set the synonym.
     *
     * @param synonym the synonym
     * @return the CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder synonym(Synonym synonym) {
      this.synonym = synonym.getSynonym();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateSynonymOptions builder
     */
    public CreateSynonymOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * CreateValue.
   */
  public class CreateValue extends IBMWatsonGenericModel {
    private String value;
    private IBMWatsonMapModel metadata;
    private String xType;
    private List<String> synonyms;
    private List<String> patterns;
    private Datetime created;
    private Datetime updated;

    /**
     * Gets the value.
     *
     * The text of the entity value. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the entity value.
     *
     * @return the metadata
     */
    public IBMWatsonMapModel metadata() {
      return metadata;
    }

    /**
     * Gets the xType.
     *
     * Specifies the type of entity value.
     *
     * @return the xType
     */
    public String xType() {
      return xType;
    }

    /**
     * Gets the synonyms.
     *
     * An array of synonyms for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A synonym must conform to the following resrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the synonyms
     */
    public List<String> synonyms() {
      return synonyms;
    }

    /**
     * Gets the patterns.
     *
     * An array of patterns for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A pattern is a regular expression; for more information about how to specify a
     * pattern, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-entities#entities-create-dictionary-based).
     *
     * @return the patterns
     */
    public List<String> patterns() {
      return patterns;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    public Datetime created() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    public Datetime updated() {
      return updated;
    }
  
    private CreateValue(CreateValueBuilder builder) {
      IBMWatsonValidator.notNull(builder.value, 'value cannot be null');
      this.value = builder.value;
      this.metadata = builder.metadata;
      this.xType = builder.xType;
      this.synonyms = builder.synonyms;
      this.patterns = builder.patterns;
      this.created = builder.created;
      this.updated = builder.updated;
    }

    /**
     * New builder.
     *
     * @return a CreateValue builder
     */
    public CreateValueBuilder newBuilder() {
      return new CreateValueBuilder(this);
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

      // performing custom serialization for metadata
      if (metadata != null) {
        String metadataJsonString = JSON.serialize(metadata.replacePropertyNames(), true);
        String metadataKey = 'metadata';
        if (propertyNameMapping.containsKey(metadataKey)) {
          metadataKey = propertyNameMapping.get(metadataKey);
        }
        jsonMap.put(metadataKey, JSON.deserializeUntyped(metadataJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * CreateValue Builder.
   */
  public class CreateValueBuilder {
    private String value;
    private IBMWatsonMapModel metadata;
    private String xType;
    private List<String> synonyms;
    private List<String> patterns;
    private Datetime created;
    private Datetime updated;

    private CreateValueBuilder(CreateValue createValue) {
      this.value = createValue.value;
      this.metadata = createValue.metadata;
      this.xType = createValue.xType;
      this.synonyms = createValue.synonyms;
      this.patterns = createValue.patterns;
      this.created = createValue.created;
      this.updated = createValue.updated;
    }

    /**
     * Instantiates a new builder.
     */
    public CreateValueBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param value the value
     */
    public CreateValueBuilder(String value) {
      this.value = value;
    }

    /**
     * Builds a CreateValue.
     *
     * @return the createValue
     */
    public CreateValue build() {
      return new CreateValue(this);
    }

    /**
     * Adds an synonyms to synonyms.
     *
     * @param synonyms the new synonyms
     * @return the CreateValue builder
     */
    public CreateValueBuilder addSynonyms(String synonyms) {
      IBMWatsonValidator.notNull(synonyms, 'synonyms cannot be null');
      if (this.synonyms == null) {
        this.synonyms = new List<String>();
      }
      this.synonyms.add(synonyms);
      return this;
    }

    /**
     * Adds an patterns to patterns.
     *
     * @param patterns the new patterns
     * @return the CreateValue builder
     */
    public CreateValueBuilder addPatterns(String patterns) {
      IBMWatsonValidator.notNull(patterns, 'patterns cannot be null');
      if (this.patterns == null) {
        this.patterns = new List<String>();
      }
      this.patterns.add(patterns);
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the CreateValue builder
     */
    public CreateValueBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the CreateValue builder
     */
    public CreateValueBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the CreateValue builder
     */
    public CreateValueBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the synonyms.
     * Existing synonyms will be replaced.
     *
     * @param synonyms the synonyms
     * @return the CreateValue builder
     */
    public CreateValueBuilder synonyms(List<String> synonyms) {
      this.synonyms = synonyms;
      return this;
    }

    /**
     * Set the patterns.
     * Existing patterns will be replaced.
     *
     * @param patterns the patterns
     * @return the CreateValue builder
     */
    public CreateValueBuilder patterns(List<String> patterns) {
      this.patterns = patterns;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the CreateValue builder
     */
    public CreateValueBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the CreateValue builder
     */
    public CreateValueBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }
  }

  /**
   * The createValue options.
   */
  public class CreateValueOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private IBMWatsonMapModel metadata;
    private String xType;
    private List<String> synonyms;
    private List<String> patterns;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the entity value.
     *
     * @return the metadata
     */
    public IBMWatsonMapModel metadata() {
      return metadata;
    }

    /**
     * Gets the xType.
     *
     * Specifies the type of entity value.
     *
     * @return the xType
     */
    public String xType() {
      return xType;
    }

    /**
     * Gets the synonyms.
     *
     * An array of synonyms for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A synonym must conform to the following resrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the synonyms
     */
    public List<String> synonyms() {
      return synonyms;
    }

    /**
     * Gets the patterns.
     *
     * An array of patterns for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A pattern is a regular expression; for more information about how to specify a
     * pattern, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-entities#entities-create-dictionary-based).
     *
     * @return the patterns
     */
    public List<String> patterns() {
      return patterns;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateValueOptions(CreateValueOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notNull(builder.value, 'value cannot be null');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      metadata = builder.metadata;
      xType = builder.xType;
      synonyms = builder.synonyms;
      patterns = builder.patterns;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateValueOptions builder
     */
    public CreateValueOptionsBuilder newBuilder() {
      return new CreateValueOptionsBuilder(this);
    }
  }

  /**
   * CreateValueOptions Builder.
   */
  public class CreateValueOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private IBMWatsonMapModel metadata;
    private String xType;
    private List<String> synonyms;
    private List<String> patterns;
    private Boolean includeAudit;

    private CreateValueOptionsBuilder(CreateValueOptions createValueOptions) {
      workspaceId = createValueOptions.workspaceId;
      entity = createValueOptions.entity;
      value = createValueOptions.value;
      metadata = createValueOptions.metadata;
      xType = createValueOptions.xType;
      synonyms = createValueOptions.synonyms;
      patterns = createValueOptions.patterns;
      includeAudit = createValueOptions.includeAudit;
      this.requestHeaders.putAll(createValueOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateValueOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     */
    public CreateValueOptionsBuilder(String workspaceId, String entity, String value) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
    }

    /**
     * Builds a CreateValueOptions.
     *
     * @return the createValueOptions
     */
    public CreateValueOptions build() {
      return new CreateValueOptions(this);
    }

    /**
     * Adds an synonyms to synonyms.
     *
     * @param synonyms the new synonyms
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder addSynonyms(String synonyms) {
      IBMWatsonValidator.notNull(synonyms, 'synonyms cannot be null');
      if (this.synonyms == null) {
        this.synonyms = new List<String>();
      }
      this.synonyms.add(synonyms);
      return this;
    }

    /**
     * Adds an patterns to patterns.
     *
     * @param patterns the new patterns
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder addPatterns(String patterns) {
      IBMWatsonValidator.notNull(patterns, 'patterns cannot be null');
      if (this.patterns == null) {
        this.patterns = new List<String>();
      }
      this.patterns.add(patterns);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the synonyms.
     * Existing synonyms will be replaced.
     *
     * @param synonyms the synonyms
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder synonyms(List<String> synonyms) {
      this.synonyms = synonyms;
      return this;
    }

    /**
     * Set the patterns.
     * Existing patterns will be replaced.
     *
     * @param patterns the patterns
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder patterns(List<String> patterns) {
      this.patterns = patterns;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateValueOptions builder
     */
    public CreateValueOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createWorkspace options.
   */
  public class CreateWorkspaceOptions extends IBMWatsonOptionsModel {
    private String name;
    private String description;
    private String language;
    private IBMWatsonMapModel metadata;
    private Boolean learningOptOut;
    private WorkspaceSystemSettings systemSettings;
    private List<CreateIntent> intents;
    private List<CreateEntity> entities;
    private List<DialogNode> dialogNodes;
    private List<Counterexample> counterexamples;
    private List<Webhook> webhooks;
    private Boolean includeAudit;

    /**
     * Gets the name.
     *
     * The name of the workspace. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the workspace. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the language.
     *
     * The language of the workspace.
     *
     * @return the language
     */
    public String language() {
      return language;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the workspace.
     *
     * @return the metadata
     */
    public IBMWatsonMapModel metadata() {
      return metadata;
    }

    /**
     * Gets the learningOptOut.
     *
     * Whether training data from the workspace (including artifacts such as intents and entities) can be used by IBM
     * for general service improvements. `true` indicates that workspace training data is not to be used.
     *
     * @return the learningOptOut
     */
    public Boolean learningOptOut() {
      return learningOptOut;
    }

    /**
     * Gets the systemSettings.
     *
     * Global settings for the workspace.
     *
     * @return the systemSettings
     */
    public WorkspaceSystemSettings systemSettings() {
      return systemSettings;
    }

    /**
     * Gets the intents.
     *
     * An array of objects defining the intents for the workspace.
     *
     * @return the intents
     */
    public List<CreateIntent> intents() {
      return intents;
    }

    /**
     * Gets the entities.
     *
     * An array of objects describing the entities for the workspace.
     *
     * @return the entities
     */
    public List<CreateEntity> entities() {
      return entities;
    }

    /**
     * Gets the dialogNodes.
     *
     * An array of objects describing the dialog nodes in the workspace.
     *
     * @return the dialogNodes
     */
    public List<DialogNode> dialogNodes() {
      return dialogNodes;
    }

    /**
     * Gets the counterexamples.
     *
     * An array of objects defining input examples that have been marked as irrelevant input.
     *
     * @return the counterexamples
     */
    public List<Counterexample> counterexamples() {
      return counterexamples;
    }

    /**
     * Gets the webhooks.
     *
     * @return the webhooks
     */
    public List<Webhook> webhooks() {
      return webhooks;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private CreateWorkspaceOptions(CreateWorkspaceOptionsBuilder builder) {
      name = builder.name;
      description = builder.description;
      language = builder.language;
      metadata = builder.metadata;
      learningOptOut = builder.learningOptOut;
      systemSettings = builder.systemSettings;
      intents = builder.intents;
      entities = builder.entities;
      dialogNodes = builder.dialogNodes;
      counterexamples = builder.counterexamples;
      webhooks = builder.webhooks;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder newBuilder() {
      return new CreateWorkspaceOptionsBuilder(this);
    }
  }

  /**
   * CreateWorkspaceOptions Builder.
   */
  public class CreateWorkspaceOptionsBuilder extends IBMWatsonOptionsModel {
    private String name;
    private String description;
    private String language;
    private IBMWatsonMapModel metadata;
    private Boolean learningOptOut;
    private WorkspaceSystemSettings systemSettings;
    private List<CreateIntent> intents;
    private List<CreateEntity> entities;
    private List<DialogNode> dialogNodes;
    private List<Counterexample> counterexamples;
    private List<Webhook> webhooks;
    private Boolean includeAudit;

    private CreateWorkspaceOptionsBuilder(CreateWorkspaceOptions createWorkspaceOptions) {
      name = createWorkspaceOptions.name;
      description = createWorkspaceOptions.description;
      language = createWorkspaceOptions.language;
      metadata = createWorkspaceOptions.metadata;
      learningOptOut = createWorkspaceOptions.learningOptOut;
      systemSettings = createWorkspaceOptions.systemSettings;
      intents = createWorkspaceOptions.intents;
      entities = createWorkspaceOptions.entities;
      dialogNodes = createWorkspaceOptions.dialogNodes;
      counterexamples = createWorkspaceOptions.counterexamples;
      webhooks = createWorkspaceOptions.webhooks;
      includeAudit = createWorkspaceOptions.includeAudit;
      this.requestHeaders.putAll(createWorkspaceOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateWorkspaceOptionsBuilder() {
    }

    /**
     * Builds a CreateWorkspaceOptions.
     *
     * @return the createWorkspaceOptions
     */
    public CreateWorkspaceOptions build() {
      return new CreateWorkspaceOptions(this);
    }

    /**
     * Adds an intents to intents.
     *
     * @param intents the new intents
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder addIntents(CreateIntent intents) {
      IBMWatsonValidator.notNull(intents, 'intents cannot be null');
      if (this.intents == null) {
        this.intents = new List<CreateIntent>();
      }
      this.intents.add(intents);
      return this;
    }

    /**
     * Adds an entities to entities.
     *
     * @param entities the new entities
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder addEntities(CreateEntity entities) {
      IBMWatsonValidator.notNull(entities, 'entities cannot be null');
      if (this.entities == null) {
        this.entities = new List<CreateEntity>();
      }
      this.entities.add(entities);
      return this;
    }

    /**
     * Adds an dialogNodes to dialogNodes.
     *
     * @param dialogNodes the new dialogNodes
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder addDialogNodes(DialogNode dialogNodes) {
      IBMWatsonValidator.notNull(dialogNodes, 'dialogNodes cannot be null');
      if (this.dialogNodes == null) {
        this.dialogNodes = new List<DialogNode>();
      }
      this.dialogNodes.add(dialogNodes);
      return this;
    }

    /**
     * Adds an counterexamples to counterexamples.
     *
     * @param counterexamples the new counterexamples
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder addCounterexamples(Counterexample counterexamples) {
      IBMWatsonValidator.notNull(counterexamples, 'counterexamples cannot be null');
      if (this.counterexamples == null) {
        this.counterexamples = new List<Counterexample>();
      }
      this.counterexamples.add(counterexamples);
      return this;
    }

    /**
     * Adds an webhooks to webhooks.
     *
     * @param webhooks the new webhooks
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder addWebhooks(Webhook webhooks) {
      IBMWatsonValidator.notNull(webhooks, 'webhooks cannot be null');
      if (this.webhooks == null) {
        this.webhooks = new List<Webhook>();
      }
      this.webhooks.add(webhooks);
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the learningOptOut.
     *
     * @param learningOptOut the learningOptOut
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder learningOptOut(Boolean learningOptOut) {
      this.learningOptOut = learningOptOut;
      return this;
    }

    /**
     * Set the systemSettings.
     *
     * @param systemSettings the systemSettings
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder systemSettings(WorkspaceSystemSettings systemSettings) {
      this.systemSettings = systemSettings;
      return this;
    }

    /**
     * Set the intents.
     * Existing intents will be replaced.
     *
     * @param intents the intents
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder intents(List<CreateIntent> intents) {
      this.intents = intents;
      return this;
    }

    /**
     * Set the entities.
     * Existing entities will be replaced.
     *
     * @param entities the entities
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder entities(List<CreateEntity> entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the dialogNodes.
     * Existing dialogNodes will be replaced.
     *
     * @param dialogNodes the dialogNodes
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder dialogNodes(List<DialogNode> dialogNodes) {
      this.dialogNodes = dialogNodes;
      return this;
    }

    /**
     * Set the counterexamples.
     * Existing counterexamples will be replaced.
     *
     * @param counterexamples the counterexamples
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder counterexamples(List<Counterexample> counterexamples) {
      this.counterexamples = counterexamples;
      return this;
    }

    /**
     * Set the webhooks.
     * Existing webhooks will be replaced.
     *
     * @param webhooks the webhooks
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder webhooks(List<Webhook> webhooks) {
      this.webhooks = webhooks;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateWorkspaceOptions builder
     */
    public CreateWorkspaceOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteCounterexample options.
   */
  public class DeleteCounterexampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the text.
     *
     * The text of a user input counterexample (for example, `What are you wearing?`).
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    private DeleteCounterexampleOptions(DeleteCounterexampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.text, 'text cannot be empty');
      workspaceId = builder.workspaceId;
      text = builder.text;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteCounterexampleOptions builder
     */
    public DeleteCounterexampleOptionsBuilder newBuilder() {
      return new DeleteCounterexampleOptionsBuilder(this);
    }
  }

  /**
   * DeleteCounterexampleOptions Builder.
   */
  public class DeleteCounterexampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;

    private DeleteCounterexampleOptionsBuilder(DeleteCounterexampleOptions deleteCounterexampleOptions) {
      workspaceId = deleteCounterexampleOptions.workspaceId;
      text = deleteCounterexampleOptions.text;
      this.requestHeaders.putAll(deleteCounterexampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteCounterexampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param text the text
     */
    public DeleteCounterexampleOptionsBuilder(String workspaceId, String text) {
      this.workspaceId = workspaceId;
      this.text = text;
    }

    /**
     * Builds a DeleteCounterexampleOptions.
     *
     * @return the deleteCounterexampleOptions
     */
    public DeleteCounterexampleOptions build() {
      return new DeleteCounterexampleOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteCounterexampleOptions builder
     */
    public DeleteCounterexampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the DeleteCounterexampleOptions builder
     */
    public DeleteCounterexampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteCounterexampleOptions builder
     */
    public DeleteCounterexampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteDialogNode options.
   */
  public class DeleteDialogNodeOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the dialogNode.
     *
     * The dialog node ID (for example, `get_order`).
     *
     * @return the dialogNode
     */
    public String dialogNode() {
      return dialogNode;
    }

    private DeleteDialogNodeOptions(DeleteDialogNodeOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.dialogNode, 'dialogNode cannot be empty');
      workspaceId = builder.workspaceId;
      dialogNode = builder.dialogNode;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteDialogNodeOptions builder
     */
    public DeleteDialogNodeOptionsBuilder newBuilder() {
      return new DeleteDialogNodeOptionsBuilder(this);
    }
  }

  /**
   * DeleteDialogNodeOptions Builder.
   */
  public class DeleteDialogNodeOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;

    private DeleteDialogNodeOptionsBuilder(DeleteDialogNodeOptions deleteDialogNodeOptions) {
      workspaceId = deleteDialogNodeOptions.workspaceId;
      dialogNode = deleteDialogNodeOptions.dialogNode;
      this.requestHeaders.putAll(deleteDialogNodeOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteDialogNodeOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param dialogNode the dialogNode
     */
    public DeleteDialogNodeOptionsBuilder(String workspaceId, String dialogNode) {
      this.workspaceId = workspaceId;
      this.dialogNode = dialogNode;
    }

    /**
     * Builds a DeleteDialogNodeOptions.
     *
     * @return the deleteDialogNodeOptions
     */
    public DeleteDialogNodeOptions build() {
      return new DeleteDialogNodeOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteDialogNodeOptions builder
     */
    public DeleteDialogNodeOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the DeleteDialogNodeOptions builder
     */
    public DeleteDialogNodeOptionsBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteDialogNodeOptions builder
     */
    public DeleteDialogNodeOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteEntity options.
   */
  public class DeleteEntityOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    private DeleteEntityOptions(DeleteEntityOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteEntityOptions builder
     */
    public DeleteEntityOptionsBuilder newBuilder() {
      return new DeleteEntityOptionsBuilder(this);
    }
  }

  /**
   * DeleteEntityOptions Builder.
   */
  public class DeleteEntityOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;

    private DeleteEntityOptionsBuilder(DeleteEntityOptions deleteEntityOptions) {
      workspaceId = deleteEntityOptions.workspaceId;
      entity = deleteEntityOptions.entity;
      this.requestHeaders.putAll(deleteEntityOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteEntityOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     */
    public DeleteEntityOptionsBuilder(String workspaceId, String entity) {
      this.workspaceId = workspaceId;
      this.entity = entity;
    }

    /**
     * Builds a DeleteEntityOptions.
     *
     * @return the deleteEntityOptions
     */
    public DeleteEntityOptions build() {
      return new DeleteEntityOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteEntityOptions builder
     */
    public DeleteEntityOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the DeleteEntityOptions builder
     */
    public DeleteEntityOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteEntityOptions builder
     */
    public DeleteEntityOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteExample options.
   */
  public class DeleteExampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the text.
     *
     * The text of the user input example.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    private DeleteExampleOptions(DeleteExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      IBMWatsonValidator.notEmpty(builder.text, 'text cannot be empty');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      text = builder.text;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteExampleOptions builder
     */
    public DeleteExampleOptionsBuilder newBuilder() {
      return new DeleteExampleOptionsBuilder(this);
    }
  }

  /**
   * DeleteExampleOptions Builder.
   */
  public class DeleteExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;

    private DeleteExampleOptionsBuilder(DeleteExampleOptions deleteExampleOptions) {
      workspaceId = deleteExampleOptions.workspaceId;
      intent = deleteExampleOptions.intent;
      text = deleteExampleOptions.text;
      this.requestHeaders.putAll(deleteExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     * @param text the text
     */
    public DeleteExampleOptionsBuilder(String workspaceId, String intent, String text) {
      this.workspaceId = workspaceId;
      this.intent = intent;
      this.text = text;
    }

    /**
     * Builds a DeleteExampleOptions.
     *
     * @return the deleteExampleOptions
     */
    public DeleteExampleOptions build() {
      return new DeleteExampleOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteExampleOptions builder
     */
    public DeleteExampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the DeleteExampleOptions builder
     */
    public DeleteExampleOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the DeleteExampleOptions builder
     */
    public DeleteExampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteExampleOptions builder
     */
    public DeleteExampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteIntent options.
   */
  public class DeleteIntentOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    private DeleteIntentOptions(DeleteIntentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteIntentOptions builder
     */
    public DeleteIntentOptionsBuilder newBuilder() {
      return new DeleteIntentOptionsBuilder(this);
    }
  }

  /**
   * DeleteIntentOptions Builder.
   */
  public class DeleteIntentOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;

    private DeleteIntentOptionsBuilder(DeleteIntentOptions deleteIntentOptions) {
      workspaceId = deleteIntentOptions.workspaceId;
      intent = deleteIntentOptions.intent;
      this.requestHeaders.putAll(deleteIntentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteIntentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     */
    public DeleteIntentOptionsBuilder(String workspaceId, String intent) {
      this.workspaceId = workspaceId;
      this.intent = intent;
    }

    /**
     * Builds a DeleteIntentOptions.
     *
     * @return the deleteIntentOptions
     */
    public DeleteIntentOptions build() {
      return new DeleteIntentOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteIntentOptions builder
     */
    public DeleteIntentOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the DeleteIntentOptions builder
     */
    public DeleteIntentOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteIntentOptions builder
     */
    public DeleteIntentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteSynonym options.
   */
  public class DeleteSynonymOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the synonym.
     *
     * The text of the synonym.
     *
     * @return the synonym
     */
    public String synonym() {
      return synonym;
    }

    private DeleteSynonymOptions(DeleteSynonymOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      IBMWatsonValidator.notEmpty(builder.synonym, 'synonym cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      synonym = builder.synonym;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteSynonymOptions builder
     */
    public DeleteSynonymOptionsBuilder newBuilder() {
      return new DeleteSynonymOptionsBuilder(this);
    }
  }

  /**
   * DeleteSynonymOptions Builder.
   */
  public class DeleteSynonymOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;

    private DeleteSynonymOptionsBuilder(DeleteSynonymOptions deleteSynonymOptions) {
      workspaceId = deleteSynonymOptions.workspaceId;
      entity = deleteSynonymOptions.entity;
      value = deleteSynonymOptions.value;
      synonym = deleteSynonymOptions.synonym;
      this.requestHeaders.putAll(deleteSynonymOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteSynonymOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     * @param synonym the synonym
     */
    public DeleteSynonymOptionsBuilder(String workspaceId, String entity, String value, String synonym) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
      this.synonym = synonym;
    }

    /**
     * Builds a DeleteSynonymOptions.
     *
     * @return the deleteSynonymOptions
     */
    public DeleteSynonymOptions build() {
      return new DeleteSynonymOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteSynonymOptions builder
     */
    public DeleteSynonymOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the DeleteSynonymOptions builder
     */
    public DeleteSynonymOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the DeleteSynonymOptions builder
     */
    public DeleteSynonymOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the synonym.
     *
     * @param synonym the synonym
     * @return the DeleteSynonymOptions builder
     */
    public DeleteSynonymOptionsBuilder synonym(String synonym) {
      this.synonym = synonym;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteSynonymOptions builder
     */
    public DeleteSynonymOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteUserData options.
   */
  public class DeleteUserDataOptions extends IBMWatsonOptionsModel {
    private String customerId;

    /**
     * Gets the customerId.
     *
     * The customer ID for which all data is to be deleted.
     *
     * @return the customerId
     */
    public String customerId() {
      return customerId;
    }

    private DeleteUserDataOptions(DeleteUserDataOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.customerId, 'customerId cannot be null');
      customerId = builder.customerId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteUserDataOptions builder
     */
    public DeleteUserDataOptionsBuilder newBuilder() {
      return new DeleteUserDataOptionsBuilder(this);
    }
  }

  /**
   * DeleteUserDataOptions Builder.
   */
  public class DeleteUserDataOptionsBuilder extends IBMWatsonOptionsModel {
    private String customerId;

    private DeleteUserDataOptionsBuilder(DeleteUserDataOptions deleteUserDataOptions) {
      customerId = deleteUserDataOptions.customerId;
      this.requestHeaders.putAll(deleteUserDataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteUserDataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customerId the customerId
     */
    public DeleteUserDataOptionsBuilder(String customerId) {
      this.customerId = customerId;
    }

    /**
     * Builds a DeleteUserDataOptions.
     *
     * @return the deleteUserDataOptions
     */
    public DeleteUserDataOptions build() {
      return new DeleteUserDataOptions(this);
    }

    /**
     * Set the customerId.
     *
     * @param customerId the customerId
     * @return the DeleteUserDataOptions builder
     */
    public DeleteUserDataOptionsBuilder customerId(String customerId) {
      this.customerId = customerId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteUserDataOptions builder
     */
    public DeleteUserDataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteValue options.
   */
  public class DeleteValueOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    private DeleteValueOptions(DeleteValueOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteValueOptions builder
     */
    public DeleteValueOptionsBuilder newBuilder() {
      return new DeleteValueOptionsBuilder(this);
    }
  }

  /**
   * DeleteValueOptions Builder.
   */
  public class DeleteValueOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;

    private DeleteValueOptionsBuilder(DeleteValueOptions deleteValueOptions) {
      workspaceId = deleteValueOptions.workspaceId;
      entity = deleteValueOptions.entity;
      value = deleteValueOptions.value;
      this.requestHeaders.putAll(deleteValueOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteValueOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     */
    public DeleteValueOptionsBuilder(String workspaceId, String entity, String value) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
    }

    /**
     * Builds a DeleteValueOptions.
     *
     * @return the deleteValueOptions
     */
    public DeleteValueOptions build() {
      return new DeleteValueOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteValueOptions builder
     */
    public DeleteValueOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the DeleteValueOptions builder
     */
    public DeleteValueOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the DeleteValueOptions builder
     */
    public DeleteValueOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteValueOptions builder
     */
    public DeleteValueOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteWorkspace options.
   */
  public class DeleteWorkspaceOptions extends IBMWatsonOptionsModel {
    private String workspaceId;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    private DeleteWorkspaceOptions(DeleteWorkspaceOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteWorkspaceOptions builder
     */
    public DeleteWorkspaceOptionsBuilder newBuilder() {
      return new DeleteWorkspaceOptionsBuilder(this);
    }
  }

  /**
   * DeleteWorkspaceOptions Builder.
   */
  public class DeleteWorkspaceOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;

    private DeleteWorkspaceOptionsBuilder(DeleteWorkspaceOptions deleteWorkspaceOptions) {
      workspaceId = deleteWorkspaceOptions.workspaceId;
      this.requestHeaders.putAll(deleteWorkspaceOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteWorkspaceOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public DeleteWorkspaceOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a DeleteWorkspaceOptions.
     *
     * @return the deleteWorkspaceOptions
     */
    public DeleteWorkspaceOptions build() {
      return new DeleteWorkspaceOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the DeleteWorkspaceOptions builder
     */
    public DeleteWorkspaceOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteWorkspaceOptions builder
     */
    public DeleteWorkspaceOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * DialogNode.
   */
  public class DialogNode extends IBMWatsonResponseModel {
    private String dialogNode;
    private String description;
    private String conditions;
    private String parent;
    private String previousSibling;
    private DialogNodeOutput output;
    private IBMWatsonMapModel context;
    private IBMWatsonMapModel metadata;
    private DialogNodeNextStep nextStep;
    private String title;
    private String xType;
    private String eventName;
    private String variable;
    private List<DialogNodeAction> actions;
    private String digressIn;
    private String digressOut;
    private String digressOutSlots;
    private String userLabel;
    private Boolean disambiguationOptOut;
    private Boolean disabled;
    private Datetime created;
    private Datetime updated;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNode() { }

    /**
     * Gets the dialogNode.
     *
     * The dialog node ID. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot characters.
     *
     * @return the dialogNode
     */
    @AuraEnabled
    public String getDialogNode() {
      return dialogNode;
    }

    /**
     * Gets the description.
     *
     * The description of the dialog node. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the conditions.
     *
     * The condition that will trigger the dialog node. This string cannot contain carriage return, newline, or tab
     * characters.
     *
     * @return the conditions
     */
    @AuraEnabled
    public String getConditions() {
      return conditions;
    }

    /**
     * Gets the parent.
     *
     * The ID of the parent dialog node. This property is omitted if the dialog node has no parent.
     *
     * @return the parent
     */
    @AuraEnabled
    public String getParent() {
      return parent;
    }

    /**
     * Gets the previousSibling.
     *
     * The ID of the previous sibling dialog node. This property is omitted if the dialog node has no previous sibling.
     *
     * @return the previousSibling
     */
    @AuraEnabled
    public String getPreviousSibling() {
      return previousSibling;
    }

    /**
     * Gets the output.
     *
     * The output of the dialog node. For more information about how to specify dialog node output, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-dialog-overview#dialog-overview-responses).
     *
     * @return the output
     */
    @AuraEnabled
    public DialogNodeOutput getOutput() {
      return output;
    }

    /**
     * Gets the context.
     *
     * The context for the dialog node.
     *
     * @return the context
     */
    @AuraEnabled
    public IBMWatsonMapModel getContext() {
      return context;
    }

    /**
     * Gets the metadata.
     *
     * The metadata for the dialog node.
     *
     * @return the metadata
     */
    @AuraEnabled
    public IBMWatsonMapModel getMetadata() {
      return metadata;
    }

    /**
     * Gets the nextStep.
     *
     * The next step to execute following this dialog node.
     *
     * @return the nextStep
     */
    @AuraEnabled
    public DialogNodeNextStep getNextStep() {
      return nextStep;
    }

    /**
     * Gets the title.
     *
     * The alias used to identify the dialog node. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot characters.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the xType.
     *
     * How the dialog node is processed.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the eventName.
     *
     * How an `event_handler` node is processed.
     *
     * @return the eventName
     */
    @AuraEnabled
    public String getEventName() {
      return eventName;
    }

    /**
     * Gets the variable.
     *
     * The location in the dialog context where output is stored.
     *
     * @return the variable
     */
    @AuraEnabled
    public String getVariable() {
      return variable;
    }

    /**
     * Gets the actions.
     *
     * An array of objects describing any actions to be invoked by the dialog node.
     *
     * @return the actions
     */
    @AuraEnabled
    public List<DialogNodeAction> getActions() {
      return actions;
    }

    /**
     * Gets the digressIn.
     *
     * Whether this top-level dialog node can be digressed into.
     *
     * @return the digressIn
     */
    @AuraEnabled
    public String getDigressIn() {
      return digressIn;
    }

    /**
     * Gets the digressOut.
     *
     * Whether this dialog node can be returned to after a digression.
     *
     * @return the digressOut
     */
    @AuraEnabled
    public String getDigressOut() {
      return digressOut;
    }

    /**
     * Gets the digressOutSlots.
     *
     * Whether the user can digress to top-level nodes while filling out slots.
     *
     * @return the digressOutSlots
     */
    @AuraEnabled
    public String getDigressOutSlots() {
      return digressOutSlots;
    }

    /**
     * Gets the userLabel.
     *
     * A label that can be displayed externally to describe the purpose of the node to users.
     *
     * @return the userLabel
     */
    @AuraEnabled
    public String getUserLabel() {
      return userLabel;
    }

    /**
     * Gets the disambiguationOptOut.
     *
     * Whether the dialog node should be excluded from disambiguation suggestions.
     *
     * @return the disambiguationOptOut
     */
    @AuraEnabled
    public Boolean getDisambiguationOptOut() {
      return disambiguationOptOut;
    }

    /**
     * Gets the disabled.
     *
     * For internal use only.
     *
     * @return the disabled
     */
    @AuraEnabled
    public Boolean getDisabled() {
      return disabled;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }
  
    private DialogNode(DialogNodeBuilder builder) {
      IBMWatsonValidator.notNull(builder.dialogNode, 'dialogNode cannot be null');
      this.dialogNode = builder.dialogNode;
      this.description = builder.description;
      this.conditions = builder.conditions;
      this.parent = builder.parent;
      this.previousSibling = builder.previousSibling;
      this.output = builder.output;
      this.context = builder.context;
      this.metadata = builder.metadata;
      this.nextStep = builder.nextStep;
      this.title = builder.title;
      this.xType = builder.xType;
      this.eventName = builder.eventName;
      this.variable = builder.variable;
      this.actions = builder.actions;
      this.digressIn = builder.digressIn;
      this.digressOut = builder.digressOut;
      this.digressOutSlots = builder.digressOutSlots;
      this.userLabel = builder.userLabel;
      this.disambiguationOptOut = builder.disambiguationOptOut;
      this.disabled = builder.disabled;
      this.created = builder.created;
      this.updated = builder.updated;
    }

    /**
     * New builder.
     *
     * @return a DialogNode builder
     */
    public DialogNodeBuilder newBuilder() {
      return new DialogNodeBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dialog_node' => 'dialogNode',
        'previous_sibling' => 'previousSibling',
        'next_step' => 'nextStep',
        'type' => 'xType',
        'event_name' => 'eventName',
        'digress_in' => 'digressIn',
        'digress_out' => 'digressOut',
        'digress_out_slots' => 'digressOutSlots',
        'user_label' => 'userLabel',
        'disambiguation_opt_out' => 'disambiguationOptOut'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DialogNode ret = (DialogNode) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for output
      Map<String, Object> outputMap = (Map<String, Object>) jsonMap.get('output');
      DialogNodeOutput newOutput = (DialogNodeOutput) new DialogNodeOutput().deserialize(JSON.serialize(outputMap, true), outputMap, DialogNodeOutput.class);
      retBuilder.output(newOutput);

      // calling custom deserializer for context
      Map<String, Object> contextMap = (Map<String, Object>) jsonMap.get('context');
      IBMWatsonMapModel newContext = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(contextMap, true), contextMap, IBMWatsonMapModel.class);
      retBuilder.context(newContext);

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      IBMWatsonMapModel newMetadata = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(metadataMap, true), metadataMap, IBMWatsonMapModel.class);
      retBuilder.metadata(newMetadata);

      // calling custom deserializer for nextStep
      Map<String, Object> nextStepMap = (Map<String, Object>) jsonMap.get('nextStep');
      DialogNodeNextStep newNextStep = (DialogNodeNextStep) new DialogNodeNextStep().deserialize(JSON.serialize(nextStepMap, true), nextStepMap, DialogNodeNextStep.class);
      retBuilder.nextStep(newNextStep);

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
        retBuilder.actions(newActions);
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
        'dialogNode' => 'dialog_node',
        'previousSibling' => 'previous_sibling',
        'nextStep' => 'next_step',
        'xType' => 'type',
        'eventName' => 'event_name',
        'digressIn' => 'digress_in',
        'digressOut' => 'digress_out',
        'digressOutSlots' => 'digress_out_slots',
        'userLabel' => 'user_label',
        'disambiguationOptOut' => 'disambiguation_opt_out'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for output
      if (output != null) {
        String outputJsonString = JSON.serialize(output.replacePropertyNames(), true);
        String outputKey = 'output';
        if (propertyNameMapping.containsKey(outputKey)) {
          outputKey = propertyNameMapping.get(outputKey);
        }
        jsonMap.put(outputKey, JSON.deserializeUntyped(outputJsonString));
      }

      // performing custom serialization for context
      if (context != null) {
        String contextJsonString = JSON.serialize(context.replacePropertyNames(), true);
        String contextKey = 'context';
        if (propertyNameMapping.containsKey(contextKey)) {
          contextKey = propertyNameMapping.get(contextKey);
        }
        jsonMap.put(contextKey, JSON.deserializeUntyped(contextJsonString));
      }

      // performing custom serialization for metadata
      if (metadata != null) {
        String metadataJsonString = JSON.serialize(metadata.replacePropertyNames(), true);
        String metadataKey = 'metadata';
        if (propertyNameMapping.containsKey(metadataKey)) {
          metadataKey = propertyNameMapping.get(metadataKey);
        }
        jsonMap.put(metadataKey, JSON.deserializeUntyped(metadataJsonString));
      }

      // performing custom serialization for nextStep
      if (nextStep != null) {
        String nextStepJsonString = JSON.serialize(nextStep.replacePropertyNames(), true);
        String nextStepKey = 'nextStep';
        if (propertyNameMapping.containsKey(nextStepKey)) {
          nextStepKey = propertyNameMapping.get(nextStepKey);
        }
        jsonMap.put(nextStepKey, JSON.deserializeUntyped(nextStepJsonString));
      }

      // performing custom serialization for actions
      if (actions != null) {
        List<Object> actionsJsonList = new List<Object>();
        for (DialogNodeAction listItem : actions) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          actionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String actionsKey = 'actions';
        if (propertyNameMapping.containsKey(actionsKey)) {
          actionsKey = propertyNameMapping.get(actionsKey);
        }
        jsonMap.put(actionsKey, actionsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * DialogNode Builder.
   */
  public class DialogNodeBuilder {
    private String dialogNode;
    private String description;
    private String conditions;
    private String parent;
    private String previousSibling;
    private DialogNodeOutput output;
    private IBMWatsonMapModel context;
    private IBMWatsonMapModel metadata;
    private DialogNodeNextStep nextStep;
    private String title;
    private String xType;
    private String eventName;
    private String variable;
    private List<DialogNodeAction> actions;
    private String digressIn;
    private String digressOut;
    private String digressOutSlots;
    private String userLabel;
    private Boolean disambiguationOptOut;
    private Boolean disabled;
    private Datetime created;
    private Datetime updated;

    private DialogNodeBuilder(DialogNode dialogNode) {
      this.dialogNode = dialogNode.dialogNode;
      this.description = dialogNode.description;
      this.conditions = dialogNode.conditions;
      this.parent = dialogNode.parent;
      this.previousSibling = dialogNode.previousSibling;
      this.output = dialogNode.output;
      this.context = dialogNode.context;
      this.metadata = dialogNode.metadata;
      this.nextStep = dialogNode.nextStep;
      this.title = dialogNode.title;
      this.xType = dialogNode.xType;
      this.eventName = dialogNode.eventName;
      this.variable = dialogNode.variable;
      this.actions = dialogNode.actions;
      this.digressIn = dialogNode.digressIn;
      this.digressOut = dialogNode.digressOut;
      this.digressOutSlots = dialogNode.digressOutSlots;
      this.userLabel = dialogNode.userLabel;
      this.disambiguationOptOut = dialogNode.disambiguationOptOut;
      this.disabled = dialogNode.disabled;
      this.created = dialogNode.created;
      this.updated = dialogNode.updated;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param dialogNode the dialogNode
     */
    public DialogNodeBuilder(String dialogNode) {
      this.dialogNode = dialogNode;
    }

    /**
     * Builds a DialogNode.
     *
     * @return the dialogNode
     */
    public DialogNode build() {
      return new DialogNode(this);
    }

    /**
     * Adds an actions to actions.
     *
     * @param actions the new actions
     * @return the DialogNode builder
     */
    public DialogNodeBuilder addActions(DialogNodeAction actions) {
      IBMWatsonValidator.notNull(actions, 'actions cannot be null');
      if (this.actions == null) {
        this.actions = new List<DialogNodeAction>();
      }
      this.actions.add(actions);
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the DialogNode builder
     */
    public DialogNodeBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the DialogNode builder
     */
    public DialogNodeBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the conditions.
     *
     * @param conditions the conditions
     * @return the DialogNode builder
     */
    public DialogNodeBuilder conditions(String conditions) {
      this.conditions = conditions;
      return this;
    }

    /**
     * Set the parent.
     *
     * @param parent the parent
     * @return the DialogNode builder
     */
    public DialogNodeBuilder parent(String parent) {
      this.parent = parent;
      return this;
    }

    /**
     * Set the previousSibling.
     *
     * @param previousSibling the previousSibling
     * @return the DialogNode builder
     */
    public DialogNodeBuilder previousSibling(String previousSibling) {
      this.previousSibling = previousSibling;
      return this;
    }

    /**
     * Set the output.
     *
     * @param output the output
     * @return the DialogNode builder
     */
    public DialogNodeBuilder output(DialogNodeOutput output) {
      this.output = output;
      return this;
    }

    /**
     * Set the context.
     *
     * @param context the context
     * @return the DialogNode builder
     */
    public DialogNodeBuilder context(IBMWatsonMapModel context) {
      this.context = context;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the DialogNode builder
     */
    public DialogNodeBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the nextStep.
     *
     * @param nextStep the nextStep
     * @return the DialogNode builder
     */
    public DialogNodeBuilder nextStep(DialogNodeNextStep nextStep) {
      this.nextStep = nextStep;
      return this;
    }

    /**
     * Set the title.
     *
     * @param title the title
     * @return the DialogNode builder
     */
    public DialogNodeBuilder title(String title) {
      this.title = title;
      return this;
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the DialogNode builder
     */
    public DialogNodeBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the eventName.
     *
     * @param eventName the eventName
     * @return the DialogNode builder
     */
    public DialogNodeBuilder eventName(String eventName) {
      this.eventName = eventName;
      return this;
    }

    /**
     * Set the variable.
     *
     * @param variable the variable
     * @return the DialogNode builder
     */
    public DialogNodeBuilder variable(String variable) {
      this.variable = variable;
      return this;
    }

    /**
     * Set the actions.
     * Existing actions will be replaced.
     *
     * @param actions the actions
     * @return the DialogNode builder
     */
    public DialogNodeBuilder actions(List<DialogNodeAction> actions) {
      this.actions = actions;
      return this;
    }

    /**
     * Set the digressIn.
     *
     * @param digressIn the digressIn
     * @return the DialogNode builder
     */
    public DialogNodeBuilder digressIn(String digressIn) {
      this.digressIn = digressIn;
      return this;
    }

    /**
     * Set the digressOut.
     *
     * @param digressOut the digressOut
     * @return the DialogNode builder
     */
    public DialogNodeBuilder digressOut(String digressOut) {
      this.digressOut = digressOut;
      return this;
    }

    /**
     * Set the digressOutSlots.
     *
     * @param digressOutSlots the digressOutSlots
     * @return the DialogNode builder
     */
    public DialogNodeBuilder digressOutSlots(String digressOutSlots) {
      this.digressOutSlots = digressOutSlots;
      return this;
    }

    /**
     * Set the userLabel.
     *
     * @param userLabel the userLabel
     * @return the DialogNode builder
     */
    public DialogNodeBuilder userLabel(String userLabel) {
      this.userLabel = userLabel;
      return this;
    }

    /**
     * Set the disambiguationOptOut.
     *
     * @param disambiguationOptOut the disambiguationOptOut
     * @return the DialogNode builder
     */
    public DialogNodeBuilder disambiguationOptOut(Boolean disambiguationOptOut) {
      this.disambiguationOptOut = disambiguationOptOut;
      return this;
    }

    /**
     * Set the disabled.
     *
     * @param disabled the disabled
     * @return the DialogNode builder
     */
    public DialogNodeBuilder disabled(Boolean disabled) {
      this.disabled = disabled;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the DialogNode builder
     */
    public DialogNodeBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the DialogNode builder
     */
    public DialogNodeBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
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
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeAction() { }

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
  
    private DialogNodeAction(DialogNodeActionBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      IBMWatsonValidator.notNull(builder.resultVariable, 'resultVariable cannot be null');
      this.name = builder.name;
      this.xType = builder.xType;
      this.parameters = builder.parameters;
      this.resultVariable = builder.resultVariable;
      this.credentials = builder.credentials;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeAction builder
     */
    public DialogNodeActionBuilder newBuilder() {
      return new DialogNodeActionBuilder(this);
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
      DialogNodeActionBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for parameters
      Map<String, Object> parametersMap = (Map<String, Object>) jsonMap.get('parameters');
      IBMWatsonMapModel newParameters = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(parametersMap, true), parametersMap, IBMWatsonMapModel.class);
      retBuilder.parameters(newParameters);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xType' => 'type',
        'resultVariable' => 'result_variable'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for parameters
      if (parameters != null) {
        String parametersJsonString = JSON.serialize(parameters.replacePropertyNames(), true);
        String parametersKey = 'parameters';
        if (propertyNameMapping.containsKey(parametersKey)) {
          parametersKey = propertyNameMapping.get(parametersKey);
        }
        jsonMap.put(parametersKey, JSON.deserializeUntyped(parametersJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * DialogNodeAction Builder.
   */
  public class DialogNodeActionBuilder {
    private String name;
    private String xType;
    private IBMWatsonMapModel parameters;
    private String resultVariable;
    private String credentials;

    private DialogNodeActionBuilder(DialogNodeAction dialogNodeAction) {
      this.name = dialogNodeAction.name;
      this.xType = dialogNodeAction.xType;
      this.parameters = dialogNodeAction.parameters;
      this.resultVariable = dialogNodeAction.resultVariable;
      this.credentials = dialogNodeAction.credentials;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeActionBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param name the name
     * @param resultVariable the resultVariable
     */
    public DialogNodeActionBuilder(String name, String resultVariable) {
      this.name = name;
      this.resultVariable = resultVariable;
    }

    /**
     * Builds a DialogNodeAction.
     *
     * @return the dialogNodeAction
     */
    public DialogNodeAction build() {
      return new DialogNodeAction(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the DialogNodeAction builder
     */
    public DialogNodeActionBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the DialogNodeAction builder
     */
    public DialogNodeActionBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the parameters.
     *
     * @param parameters the parameters
     * @return the DialogNodeAction builder
     */
    public DialogNodeActionBuilder parameters(IBMWatsonMapModel parameters) {
      this.parameters = parameters;
      return this;
    }

    /**
     * Set the resultVariable.
     *
     * @param resultVariable the resultVariable
     * @return the DialogNodeAction builder
     */
    public DialogNodeActionBuilder resultVariable(String resultVariable) {
      this.resultVariable = resultVariable;
      return this;
    }

    /**
     * Set the credentials.
     *
     * @param credentials the credentials
     * @return the DialogNodeAction builder
     */
    public DialogNodeActionBuilder credentials(String credentials) {
      this.credentials = credentials;
      return this;
    }
  }

  /**
   * An array of dialog nodes.
   */
  public class DialogNodeCollection extends IBMWatsonResponseModel {
    private List<DialogNode> dialogNodes;
    private Pagination pagination;

    /**
     * Gets the dialogNodes.
     *
     * An array of objects describing the dialog nodes defined for the workspace.
     *
     * @return the dialogNodes
     */
    @AuraEnabled
    public List<DialogNode> getDialogNodes() {
      return dialogNodes;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the dialogNodes.
     *
     * @param dialogNodes the new dialogNodes
     */
    public void setDialogNodes(final List<DialogNode> dialogNodes) {
      this.dialogNodes = dialogNodes;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dialog_nodes' => 'dialogNodes'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DialogNodeCollection ret = (DialogNodeCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for dialogNodes
      List<DialogNode> newDialogNodes = new List<DialogNode>();
      List<DialogNode> deserializedDialogNodes = ret.getDialogNodes();
      if (deserializedDialogNodes != null) {
        for (Integer i = 0; i < deserializedDialogNodes.size(); i++) {
          DialogNode currentItem = ret.getDialogNodes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('dialogNodes');
          DialogNode newItem = (DialogNode) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNode.class);
          newDialogNodes.add(newItem);
        }
        ret.dialogNodes = newDialogNodes;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * The next step to execute following this dialog node.
   */
  public class DialogNodeNextStep extends IBMWatsonGenericModel {
    private String behavior;
    private String dialogNode;
    private String selector;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeNextStep() { }

    /**
     * Gets the behavior.
     *
     * What happens after the dialog node completes. The valid values depend on the node type:
     * - The following values are valid for any node:
     *   - `get_user_input`
     *   - `skip_user_input`
     *   - `jump_to`
     * - If the node is of type `event_handler` and its parent node is of type `slot` or `frame`, additional values are
     * also valid:
     *   - if **event_name**=`filled` and the type of the parent node is `slot`:
     *     - `reprompt`
     *     - `skip_all_slots`
     * - if **event_name**=`nomatch` and the type of the parent node is `slot`:
     *     - `reprompt`
     *     - `skip_slot`
     *     - `skip_all_slots`
     * - if **event_name**=`generic` and the type of the parent node is `frame`:
     *     - `reprompt`
     *     - `skip_slot`
     *     - `skip_all_slots`
     *      If you specify `jump_to`, then you must also specify a value for the `dialog_node` property.
     *
     * @return the behavior
     */
    @AuraEnabled
    public String getBehavior() {
      return behavior;
    }

    /**
     * Gets the dialogNode.
     *
     * The ID of the dialog node to process next. This parameter is required if **behavior**=`jump_to`.
     *
     * @return the dialogNode
     */
    @AuraEnabled
    public String getDialogNode() {
      return dialogNode;
    }

    /**
     * Gets the selector.
     *
     * Which part of the dialog node to process next.
     *
     * @return the selector
     */
    @AuraEnabled
    public String getSelector() {
      return selector;
    }
  
    private DialogNodeNextStep(DialogNodeNextStepBuilder builder) {
      IBMWatsonValidator.notNull(builder.behavior, 'behavior cannot be null');
      this.behavior = builder.behavior;
      this.dialogNode = builder.dialogNode;
      this.selector = builder.selector;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeNextStep builder
     */
    public DialogNodeNextStepBuilder newBuilder() {
      return new DialogNodeNextStepBuilder(this);
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

      DialogNodeNextStep ret = (DialogNodeNextStep) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeNextStepBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dialogNode' => 'dialog_node'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * DialogNodeNextStep Builder.
   */
  public class DialogNodeNextStepBuilder {
    private String behavior;
    private String dialogNode;
    private String selector;

    private DialogNodeNextStepBuilder(DialogNodeNextStep dialogNodeNextStep) {
      this.behavior = dialogNodeNextStep.behavior;
      this.dialogNode = dialogNodeNextStep.dialogNode;
      this.selector = dialogNodeNextStep.selector;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeNextStepBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param behavior the behavior
     */
    public DialogNodeNextStepBuilder(String behavior) {
      this.behavior = behavior;
    }

    /**
     * Builds a DialogNodeNextStep.
     *
     * @return the dialogNodeNextStep
     */
    public DialogNodeNextStep build() {
      return new DialogNodeNextStep(this);
    }

    /**
     * Set the behavior.
     *
     * @param behavior the behavior
     * @return the DialogNodeNextStep builder
     */
    public DialogNodeNextStepBuilder behavior(String behavior) {
      this.behavior = behavior;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the DialogNodeNextStep builder
     */
    public DialogNodeNextStepBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }

    /**
     * Set the selector.
     *
     * @param selector the selector
     * @return the DialogNodeNextStep builder
     */
    public DialogNodeNextStepBuilder selector(String selector) {
      this.selector = selector;
      return this;
    }
  }

  /**
   * The output of the dialog node. For more information about how to specify dialog node output, see the [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-dialog-overview#dialog-overview-responses).
   */
  public class DialogNodeOutput extends IBMWatsonDynamicModel {
    private List<DialogNodeOutputGeneric> generic;
    private DialogNodeOutputModifiers modifiers;
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeOutput() { }

    /**
     * Gets the generic.
     *
     * @return the generic
     */
    @AuraEnabled
    public List<DialogNodeOutputGeneric> getGeneric() {
      return generic;
    }

    /**
     * Gets the modifiers.
     *
     * @return the modifiers
     */
    @AuraEnabled
    public DialogNodeOutputModifiers getModifiers() {
      return modifiers;
    }

    /**
     * Gets the dynamic properties attached to DialogNodeOutput.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private DialogNodeOutput(DialogNodeOutputBuilder builder) {
      this.generic = builder.generic;
      this.modifiers = builder.modifiers;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeOutput builder
     */
    public DialogNodeOutputBuilder newBuilder() {
      return new DialogNodeOutputBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogNodeOutput ret = (DialogNodeOutput) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeOutputBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for generic
      List<DialogNodeOutputGeneric> newGeneric = new List<DialogNodeOutputGeneric>();
      List<DialogNodeOutputGeneric> deserializedGeneric = ret.getGeneric();
      if (deserializedGeneric != null) {
        for (Integer i = 0; i < deserializedGeneric.size(); i++) {
          DialogNodeOutputGeneric currentItem = ret.getGeneric().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('generic');
          DialogNodeOutputGeneric newItem = (DialogNodeOutputGeneric) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNodeOutputGeneric.class);
          newGeneric.add(newItem);
        }
        retBuilder.generic(newGeneric);
      }

      // calling custom deserializer for modifiers
      Map<String, Object> modifiersMap = (Map<String, Object>) jsonMap.get('modifiers');
      DialogNodeOutputModifiers newModifiers = (DialogNodeOutputModifiers) new DialogNodeOutputModifiers().deserialize(JSON.serialize(modifiersMap, true), modifiersMap, DialogNodeOutputModifiers.class);
      retBuilder.modifiers(newModifiers);

      DialogNodeOutput builderResult = retBuilder.build();
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

      // performing custom serialization for generic
      if (generic != null) {
        List<Object> genericJsonList = new List<Object>();
        for (DialogNodeOutputGeneric listItem : generic) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          genericJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('generic', genericJsonList);
      }

      // performing custom serialization for modifiers
      if (modifiers != null) {
        String modifiersJsonString = JSON.serialize(modifiers.replacePropertyNames(), true);
        jsonMap.put('modifiers', JSON.deserializeUntyped(modifiersJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * DialogNodeOutput Builder.
   */
  public class DialogNodeOutputBuilder {
    private List<DialogNodeOutputGeneric> generic;
    private DialogNodeOutputModifiers modifiers;

    private DialogNodeOutputBuilder(DialogNodeOutput dialogNodeOutput) {
      this.generic = dialogNodeOutput.generic;
      this.modifiers = dialogNodeOutput.modifiers;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeOutputBuilder() { }

    /**
     * Builds a DialogNodeOutput.
     *
     * @return the dialogNodeOutput
     */
    public DialogNodeOutput build() {
      return new DialogNodeOutput(this);
    }

    /**
     * Adds an generic to generic.
     *
     * @param generic the new generic
     * @return the DialogNodeOutput builder
     */
    public DialogNodeOutputBuilder addGeneric(DialogNodeOutputGeneric generic) {
      IBMWatsonValidator.notNull(generic, 'generic cannot be null');
      if (this.generic == null) {
        this.generic = new List<DialogNodeOutputGeneric>();
      }
      this.generic.add(generic);
      return this;
    }

    /**
     * Set the generic.
     * Existing generic will be replaced.
     *
     * @param generic the generic
     * @return the DialogNodeOutput builder
     */
    public DialogNodeOutputBuilder generic(List<DialogNodeOutputGeneric> generic) {
      this.generic = generic;
      return this;
    }

    /**
     * Set the modifiers.
     *
     * @param modifiers the modifiers
     * @return the DialogNodeOutput builder
     */
    public DialogNodeOutputBuilder modifiers(DialogNodeOutputModifiers modifiers) {
      this.modifiers = modifiers;
      return this;
    }
  }

  /**
   * DialogNodeOutputGeneric.
   */
  public class DialogNodeOutputGeneric extends IBMWatsonGenericModel {
    private String responseType;
    private List<DialogNodeOutputTextValuesElement> values;
    private String selectionPolicy;
    private String delimiter;
    private Long xTime;
    private Boolean typing;
    private String source;
    private String title;
    private String description;
    private String preference;
    private List<DialogNodeOutputOptionsElement> options;
    private String messageToHumanAgent;
    private String query;
    private String queryType;
    private String filter;
    private String discoveryVersion;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeOutputGeneric() { }

    /**
     * Gets the responseType.
     *
     * The type of response returned by the dialog node. The specified response type must be supported by the client
     * application or channel.
     *
     * **Note:** The **search_skill** response type is available only for Plus and Premium users, and is used only by
     * the v2 runtime API.
     *
     * @return the responseType
     */
    @AuraEnabled
    public String getResponseType() {
      return responseType;
    }

    /**
     * Gets the values.
     *
     * A list of one or more objects defining text responses. Required when **response_type**=`text`.
     *
     * @return the values
     */
    @AuraEnabled
    public List<DialogNodeOutputTextValuesElement> getValues() {
      return values;
    }

    /**
     * Gets the selectionPolicy.
     *
     * How a response is selected from the list, if more than one response is specified. Valid only when
     * **response_type**=`text`.
     *
     * @return the selectionPolicy
     */
    @AuraEnabled
    public String getSelectionPolicy() {
      return selectionPolicy;
    }

    /**
     * Gets the delimiter.
     *
     * The delimiter to use as a separator between responses when `selection_policy`=`multiline`.
     *
     * @return the delimiter
     */
    @AuraEnabled
    public String getDelimiter() {
      return delimiter;
    }

    /**
     * Gets the xTime.
     *
     * How long to pause, in milliseconds. The valid values are from 0 to 10000. Valid only when
     * **response_type**=`pause`.
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
     * Whether to send a "user is typing" event during the pause. Ignored if the channel does not support this event.
     * Valid only when **response_type**=`pause`.
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
     * The URL of the image. Required when **response_type**=`image`.
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
     * An optional title to show before the response. Valid only when **response_type**=`image` or `option`.
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
     * An optional description to show with the response. Valid only when **response_type**=`image` or `option`.
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
     * The preferred type of control to display, if supported by the channel. Valid only when
     * **response_type**=`option`.
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
     * An array of objects describing the options from which the user can choose. You can include up to 20 options.
     * Required when **response_type**=`option`.
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
     * An optional message to be sent to the human agent who will be taking over the conversation. Valid only when
     * **reponse_type**=`connect_to_agent`.
     *
     * @return the messageToHumanAgent
     */
    @AuraEnabled
    public String getMessageToHumanAgent() {
      return messageToHumanAgent;
    }

    /**
     * Gets the query.
     *
     * The text of the search query. This can be either a natural-language query or a query that uses the Discovery
     * query language syntax, depending on the value of the **query_type** property. For more information, see the
     * [Discovery service
     * documentation](https://cloud.ibm.com/docs/discovery/query-operators.html#query-operators). Required when
     * **response_type**=`search_skill`.
     *
     * @return the query
     */
    @AuraEnabled
    public String getQuery() {
      return query;
    }

    /**
     * Gets the queryType.
     *
     * The type of the search query. Required when **response_type**=`search_skill`.
     *
     * @return the queryType
     */
    @AuraEnabled
    public String getQueryType() {
      return queryType;
    }

    /**
     * Gets the filter.
     *
     * An optional filter that narrows the set of documents to be searched. For more information, see the [Discovery
     * service documentation]([Discovery service
     * documentation](https://cloud.ibm.com/docs/discovery/query-parameters.html#filter).
     *
     * @return the filter
     */
    @AuraEnabled
    public String getFilter() {
      return filter;
    }

    /**
     * Gets the discoveryVersion.
     *
     * The version of the Discovery service API to use for the query.
     *
     * @return the discoveryVersion
     */
    @AuraEnabled
    public String getDiscoveryVersion() {
      return discoveryVersion;
    }
  
    private DialogNodeOutputGeneric(DialogNodeOutputGenericBuilder builder) {
      IBMWatsonValidator.notNull(builder.responseType, 'responseType cannot be null');
      this.responseType = builder.responseType;
      this.values = builder.values;
      this.selectionPolicy = builder.selectionPolicy;
      this.delimiter = builder.delimiter;
      this.xTime = builder.xTime;
      this.typing = builder.typing;
      this.source = builder.source;
      this.title = builder.title;
      this.description = builder.description;
      this.preference = builder.preference;
      this.options = builder.options;
      this.messageToHumanAgent = builder.messageToHumanAgent;
      this.query = builder.query;
      this.queryType = builder.queryType;
      this.filter = builder.filter;
      this.discoveryVersion = builder.discoveryVersion;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder newBuilder() {
      return new DialogNodeOutputGenericBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'response_type' => 'responseType',
        'selection_policy' => 'selectionPolicy',
        'time' => 'xTime',
        'message_to_human_agent' => 'messageToHumanAgent',
        'query_type' => 'queryType',
        'discovery_version' => 'discoveryVersion'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DialogNodeOutputGeneric ret = (DialogNodeOutputGeneric) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeOutputGenericBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for values
      List<DialogNodeOutputTextValuesElement> newValues = new List<DialogNodeOutputTextValuesElement>();
      List<DialogNodeOutputTextValuesElement> deserializedValues = ret.getValues();
      if (deserializedValues != null) {
        for (Integer i = 0; i < deserializedValues.size(); i++) {
          DialogNodeOutputTextValuesElement currentItem = ret.getValues().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('values');
          DialogNodeOutputTextValuesElement newItem = (DialogNodeOutputTextValuesElement) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNodeOutputTextValuesElement.class);
          newValues.add(newItem);
        }
        retBuilder.values(newValues);
      }

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

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'responseType' => 'response_type',
        'selectionPolicy' => 'selection_policy',
        'xTime' => 'time',
        'messageToHumanAgent' => 'message_to_human_agent',
        'queryType' => 'query_type',
        'discoveryVersion' => 'discovery_version'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for values
      if (values != null) {
        List<Object> valuesJsonList = new List<Object>();
        for (DialogNodeOutputTextValuesElement listItem : values) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          valuesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String valuesKey = 'values';
        if (propertyNameMapping.containsKey(valuesKey)) {
          valuesKey = propertyNameMapping.get(valuesKey);
        }
        jsonMap.put(valuesKey, valuesJsonList);
      }

      // performing custom serialization for options
      if (options != null) {
        List<Object> optionsJsonList = new List<Object>();
        for (DialogNodeOutputOptionsElement listItem : options) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          optionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String optionsKey = 'options';
        if (propertyNameMapping.containsKey(optionsKey)) {
          optionsKey = propertyNameMapping.get(optionsKey);
        }
        jsonMap.put(optionsKey, optionsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * DialogNodeOutputGeneric Builder.
   */
  public class DialogNodeOutputGenericBuilder {
    private String responseType;
    private List<DialogNodeOutputTextValuesElement> values;
    private String selectionPolicy;
    private String delimiter;
    private Long xTime;
    private Boolean typing;
    private String source;
    private String title;
    private String description;
    private String preference;
    private List<DialogNodeOutputOptionsElement> options;
    private String messageToHumanAgent;
    private String query;
    private String queryType;
    private String filter;
    private String discoveryVersion;

    private DialogNodeOutputGenericBuilder(DialogNodeOutputGeneric dialogNodeOutputGeneric) {
      this.responseType = dialogNodeOutputGeneric.responseType;
      this.values = dialogNodeOutputGeneric.values;
      this.selectionPolicy = dialogNodeOutputGeneric.selectionPolicy;
      this.delimiter = dialogNodeOutputGeneric.delimiter;
      this.xTime = dialogNodeOutputGeneric.xTime;
      this.typing = dialogNodeOutputGeneric.typing;
      this.source = dialogNodeOutputGeneric.source;
      this.title = dialogNodeOutputGeneric.title;
      this.description = dialogNodeOutputGeneric.description;
      this.preference = dialogNodeOutputGeneric.preference;
      this.options = dialogNodeOutputGeneric.options;
      this.messageToHumanAgent = dialogNodeOutputGeneric.messageToHumanAgent;
      this.query = dialogNodeOutputGeneric.query;
      this.queryType = dialogNodeOutputGeneric.queryType;
      this.filter = dialogNodeOutputGeneric.filter;
      this.discoveryVersion = dialogNodeOutputGeneric.discoveryVersion;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeOutputGenericBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param responseType the responseType
     */
    public DialogNodeOutputGenericBuilder(String responseType) {
      this.responseType = responseType;
    }

    /**
     * Builds a DialogNodeOutputGeneric.
     *
     * @return the dialogNodeOutputGeneric
     */
    public DialogNodeOutputGeneric build() {
      return new DialogNodeOutputGeneric(this);
    }

    /**
     * Adds an values to values.
     *
     * @param values the new values
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder addValues(DialogNodeOutputTextValuesElement values) {
      IBMWatsonValidator.notNull(values, 'values cannot be null');
      if (this.values == null) {
        this.values = new List<DialogNodeOutputTextValuesElement>();
      }
      this.values.add(values);
      return this;
    }

    /**
     * Adds an options to options.
     *
     * @param options the new options
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder addOptions(DialogNodeOutputOptionsElement options) {
      IBMWatsonValidator.notNull(options, 'options cannot be null');
      if (this.options == null) {
        this.options = new List<DialogNodeOutputOptionsElement>();
      }
      this.options.add(options);
      return this;
    }

    /**
     * Set the responseType.
     *
     * @param responseType the responseType
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder responseType(String responseType) {
      this.responseType = responseType;
      return this;
    }

    /**
     * Set the values.
     * Existing values will be replaced.
     *
     * @param values the values
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder values(List<DialogNodeOutputTextValuesElement> values) {
      this.values = values;
      return this;
    }

    /**
     * Set the selectionPolicy.
     *
     * @param selectionPolicy the selectionPolicy
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder selectionPolicy(String selectionPolicy) {
      this.selectionPolicy = selectionPolicy;
      return this;
    }

    /**
     * Set the delimiter.
     *
     * @param delimiter the delimiter
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder delimiter(String delimiter) {
      this.delimiter = delimiter;
      return this;
    }

    /**
     * Set the xTime.
     *
     * @param xTime the xTime
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder xTime(Long xTime) {
      this.xTime = xTime;
      return this;
    }

    /**
     * Set the typing.
     *
     * @param typing the typing
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder typing(Boolean typing) {
      this.typing = typing;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder source(String source) {
      this.source = source;
      return this;
    }

    /**
     * Set the title.
     *
     * @param title the title
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder title(String title) {
      this.title = title;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the preference.
     *
     * @param preference the preference
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder preference(String preference) {
      this.preference = preference;
      return this;
    }

    /**
     * Set the options.
     * Existing options will be replaced.
     *
     * @param options the options
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder options(List<DialogNodeOutputOptionsElement> options) {
      this.options = options;
      return this;
    }

    /**
     * Set the messageToHumanAgent.
     *
     * @param messageToHumanAgent the messageToHumanAgent
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder messageToHumanAgent(String messageToHumanAgent) {
      this.messageToHumanAgent = messageToHumanAgent;
      return this;
    }

    /**
     * Set the query.
     *
     * @param query the query
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder query(String query) {
      this.query = query;
      return this;
    }

    /**
     * Set the queryType.
     *
     * @param queryType the queryType
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder queryType(String queryType) {
      this.queryType = queryType;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the discoveryVersion.
     *
     * @param discoveryVersion the discoveryVersion
     * @return the DialogNodeOutputGeneric builder
     */
    public DialogNodeOutputGenericBuilder discoveryVersion(String discoveryVersion) {
      this.discoveryVersion = discoveryVersion;
      return this;
    }
  }

  /**
   * Options that modify how specified output is handled.
   */
  public class DialogNodeOutputModifiers extends IBMWatsonGenericModel {
    private Boolean overwrite;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeOutputModifiers() { }

    /**
     * Gets the overwrite.
     *
     * Whether values in the output will overwrite output values in an array specified by previously executed dialog
     * nodes. If this option is set to `false`, new values will be appended to previously specified values.
     *
     * @return the overwrite
     */
    @AuraEnabled
    public Boolean getOverwrite() {
      return overwrite;
    }
  
    private DialogNodeOutputModifiers(DialogNodeOutputModifiersBuilder builder) {
      this.overwrite = builder.overwrite;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeOutputModifiers builder
     */
    public DialogNodeOutputModifiersBuilder newBuilder() {
      return new DialogNodeOutputModifiersBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogNodeOutputModifiers ret = (DialogNodeOutputModifiers) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeOutputModifiersBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * DialogNodeOutputModifiers Builder.
   */
  public class DialogNodeOutputModifiersBuilder {
    private Boolean overwrite;

    private DialogNodeOutputModifiersBuilder(DialogNodeOutputModifiers dialogNodeOutputModifiers) {
      this.overwrite = dialogNodeOutputModifiers.overwrite;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeOutputModifiersBuilder() {
    }

    /**
     * Builds a DialogNodeOutputModifiers.
     *
     * @return the dialogNodeOutputModifiers
     */
    public DialogNodeOutputModifiers build() {
      return new DialogNodeOutputModifiers(this);
    }

    /**
     * Set the overwrite.
     *
     * @param overwrite the overwrite
     * @return the DialogNodeOutputModifiers builder
     */
    public DialogNodeOutputModifiersBuilder overwrite(Boolean overwrite) {
      this.overwrite = overwrite;
      return this;
    }
  }

  /**
   * DialogNodeOutputOptionsElement.
   */
  public class DialogNodeOutputOptionsElement extends IBMWatsonGenericModel {
    private String label;
    private DialogNodeOutputOptionsElementValue value;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeOutputOptionsElement() { }

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
     * An object defining the message input to be sent to the Watson Assistant service if the user selects the
     * corresponding option.
     *
     * @return the value
     */
    @AuraEnabled
    public DialogNodeOutputOptionsElementValue getValue() {
      return value;
    }
  
    private DialogNodeOutputOptionsElement(DialogNodeOutputOptionsElementBuilder builder) {
      IBMWatsonValidator.notNull(builder.label, 'label cannot be null');
      IBMWatsonValidator.notNull(builder.value, 'value cannot be null');
      this.label = builder.label;
      this.value = builder.value;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeOutputOptionsElement builder
     */
    public DialogNodeOutputOptionsElementBuilder newBuilder() {
      return new DialogNodeOutputOptionsElementBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogNodeOutputOptionsElement ret = (DialogNodeOutputOptionsElement) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeOutputOptionsElementBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for value
      Map<String, Object> valueMap = (Map<String, Object>) jsonMap.get('value');
      DialogNodeOutputOptionsElementValue newValue = (DialogNodeOutputOptionsElementValue) new DialogNodeOutputOptionsElementValue().deserialize(JSON.serialize(valueMap, true), valueMap, DialogNodeOutputOptionsElementValue.class);
      retBuilder.value(newValue);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for value
      if (value != null) {
        String valueJsonString = JSON.serialize(value.replacePropertyNames(), true);
        jsonMap.put('value', JSON.deserializeUntyped(valueJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * DialogNodeOutputOptionsElement Builder.
   */
  public class DialogNodeOutputOptionsElementBuilder {
    private String label;
    private DialogNodeOutputOptionsElementValue value;

    private DialogNodeOutputOptionsElementBuilder(DialogNodeOutputOptionsElement dialogNodeOutputOptionsElement) {
      this.label = dialogNodeOutputOptionsElement.label;
      this.value = dialogNodeOutputOptionsElement.value;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeOutputOptionsElementBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param label the label
     * @param value the value
     */
    public DialogNodeOutputOptionsElementBuilder(String label, DialogNodeOutputOptionsElementValue value) {
      this.label = label;
      this.value = value;
    }

    /**
     * Builds a DialogNodeOutputOptionsElement.
     *
     * @return the dialogNodeOutputOptionsElement
     */
    public DialogNodeOutputOptionsElement build() {
      return new DialogNodeOutputOptionsElement(this);
    }

    /**
     * Set the label.
     *
     * @param label the label
     * @return the DialogNodeOutputOptionsElement builder
     */
    public DialogNodeOutputOptionsElementBuilder label(String label) {
      this.label = label;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the DialogNodeOutputOptionsElement builder
     */
    public DialogNodeOutputOptionsElementBuilder value(DialogNodeOutputOptionsElementValue value) {
      this.value = value;
      return this;
    }
  }

  /**
   * An object defining the message input to be sent to the Watson Assistant service if the user selects the
   * corresponding option.
   */
  public class DialogNodeOutputOptionsElementValue extends IBMWatsonGenericModel {
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeOutputOptionsElementValue() { }

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
     * Gets the intents.
     *
     * An array of intents to be used while processing the input.
     *
     * **Note:** This property is supported for backward compatibility with applications that use the v1 **Get response
     * to user input** method.
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
     * An array of entities to be used while processing the user input.
     *
     * **Note:** This property is supported for backward compatibility with applications that use the v1 **Get response
     * to user input** method.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<RuntimeEntity> getEntities() {
      return entities;
    }
  
    private DialogNodeOutputOptionsElementValue(DialogNodeOutputOptionsElementValueBuilder builder) {
      this.input = builder.input;
      this.intents = builder.intents;
      this.entities = builder.entities;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeOutputOptionsElementValue builder
     */
    public DialogNodeOutputOptionsElementValueBuilder newBuilder() {
      return new DialogNodeOutputOptionsElementValueBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogNodeOutputOptionsElementValue ret = (DialogNodeOutputOptionsElementValue) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeOutputOptionsElementValueBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for input
      Map<String, Object> inputMap = (Map<String, Object>) jsonMap.get('input');
      MessageInput newInput = (MessageInput) new MessageInput().deserialize(JSON.serialize(inputMap, true), inputMap, MessageInput.class);
      retBuilder.input(newInput);

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

      // performing custom serialization for input
      if (input != null) {
        String inputJsonString = JSON.serialize(input.replacePropertyNames(), true);
        jsonMap.put('input', JSON.deserializeUntyped(inputJsonString));
      }

      // performing custom serialization for intents
      if (intents != null) {
        List<Object> intentsJsonList = new List<Object>();
        for (RuntimeIntent listItem : intents) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          intentsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('intents', intentsJsonList);
      }

      // performing custom serialization for entities
      if (entities != null) {
        List<Object> entitiesJsonList = new List<Object>();
        for (RuntimeEntity listItem : entities) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          entitiesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('entities', entitiesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * DialogNodeOutputOptionsElementValue Builder.
   */
  public class DialogNodeOutputOptionsElementValueBuilder {
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;

    private DialogNodeOutputOptionsElementValueBuilder(DialogNodeOutputOptionsElementValue dialogNodeOutputOptionsElementValue) {
      this.input = dialogNodeOutputOptionsElementValue.input;
      this.intents = dialogNodeOutputOptionsElementValue.intents;
      this.entities = dialogNodeOutputOptionsElementValue.entities;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeOutputOptionsElementValueBuilder() {
    }

    /**
     * Builds a DialogNodeOutputOptionsElementValue.
     *
     * @return the dialogNodeOutputOptionsElementValue
     */
    public DialogNodeOutputOptionsElementValue build() {
      return new DialogNodeOutputOptionsElementValue(this);
    }

    /**
     * Adds an intents to intents.
     *
     * @param intents the new intents
     * @return the DialogNodeOutputOptionsElementValue builder
     */
    public DialogNodeOutputOptionsElementValueBuilder addIntents(RuntimeIntent intents) {
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
     * @return the DialogNodeOutputOptionsElementValue builder
     */
    public DialogNodeOutputOptionsElementValueBuilder addEntities(RuntimeEntity entities) {
      IBMWatsonValidator.notNull(entities, 'entities cannot be null');
      if (this.entities == null) {
        this.entities = new List<RuntimeEntity>();
      }
      this.entities.add(entities);
      return this;
    }

    /**
     * Set the input.
     *
     * @param input the input
     * @return the DialogNodeOutputOptionsElementValue builder
     */
    public DialogNodeOutputOptionsElementValueBuilder input(MessageInput input) {
      this.input = input;
      return this;
    }

    /**
     * Set the intents.
     * Existing intents will be replaced.
     *
     * @param intents the intents
     * @return the DialogNodeOutputOptionsElementValue builder
     */
    public DialogNodeOutputOptionsElementValueBuilder intents(List<RuntimeIntent> intents) {
      this.intents = intents;
      return this;
    }

    /**
     * Set the entities.
     * Existing entities will be replaced.
     *
     * @param entities the entities
     * @return the DialogNodeOutputOptionsElementValue builder
     */
    public DialogNodeOutputOptionsElementValueBuilder entities(List<RuntimeEntity> entities) {
      this.entities = entities;
      return this;
    }
  }

  /**
   * DialogNodeOutputTextValuesElement.
   */
  public class DialogNodeOutputTextValuesElement extends IBMWatsonGenericModel {
    private String text;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeOutputTextValuesElement() { }

    /**
     * Gets the text.
     *
     * The text of a response. This string can include newline characters (`\n`), Markdown tagging, or other special
     * characters, if supported by the channel.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }
  
    private DialogNodeOutputTextValuesElement(DialogNodeOutputTextValuesElementBuilder builder) {
      this.text = builder.text;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeOutputTextValuesElement builder
     */
    public DialogNodeOutputTextValuesElementBuilder newBuilder() {
      return new DialogNodeOutputTextValuesElementBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogNodeOutputTextValuesElement ret = (DialogNodeOutputTextValuesElement) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeOutputTextValuesElementBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * DialogNodeOutputTextValuesElement Builder.
   */
  public class DialogNodeOutputTextValuesElementBuilder {
    private String text;

    private DialogNodeOutputTextValuesElementBuilder(DialogNodeOutputTextValuesElement dialogNodeOutputTextValuesElement) {
      this.text = dialogNodeOutputTextValuesElement.text;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeOutputTextValuesElementBuilder() {
    }

    /**
     * Builds a DialogNodeOutputTextValuesElement.
     *
     * @return the dialogNodeOutputTextValuesElement
     */
    public DialogNodeOutputTextValuesElement build() {
      return new DialogNodeOutputTextValuesElement(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the DialogNodeOutputTextValuesElement builder
     */
    public DialogNodeOutputTextValuesElementBuilder text(String text) {
      this.text = text;
      return this;
    }
  }

  /**
   * DialogNodeVisitedDetails.
   */
  public class DialogNodeVisitedDetails extends IBMWatsonGenericModel {
    private String dialogNode;
    private String title;
    private String conditions;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogNodeVisitedDetails() { }

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
  
    private DialogNodeVisitedDetails(DialogNodeVisitedDetailsBuilder builder) {
      this.dialogNode = builder.dialogNode;
      this.title = builder.title;
      this.conditions = builder.conditions;
    }

    /**
     * New builder.
     *
     * @return a DialogNodeVisitedDetails builder
     */
    public DialogNodeVisitedDetailsBuilder newBuilder() {
      return new DialogNodeVisitedDetailsBuilder(this);
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

      DialogNodeVisitedDetails ret = (DialogNodeVisitedDetails) super.deserialize(jsonString, jsonMap, classType);
      DialogNodeVisitedDetailsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dialogNode' => 'dialog_node'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * DialogNodeVisitedDetails Builder.
   */
  public class DialogNodeVisitedDetailsBuilder {
    private String dialogNode;
    private String title;
    private String conditions;

    private DialogNodeVisitedDetailsBuilder(DialogNodeVisitedDetails dialogNodeVisitedDetails) {
      this.dialogNode = dialogNodeVisitedDetails.dialogNode;
      this.title = dialogNodeVisitedDetails.title;
      this.conditions = dialogNodeVisitedDetails.conditions;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogNodeVisitedDetailsBuilder() {
    }

    /**
     * Builds a DialogNodeVisitedDetails.
     *
     * @return the dialogNodeVisitedDetails
     */
    public DialogNodeVisitedDetails build() {
      return new DialogNodeVisitedDetails(this);
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the DialogNodeVisitedDetails builder
     */
    public DialogNodeVisitedDetailsBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }

    /**
     * Set the title.
     *
     * @param title the title
     * @return the DialogNodeVisitedDetails builder
     */
    public DialogNodeVisitedDetailsBuilder title(String title) {
      this.title = title;
      return this;
    }

    /**
     * Set the conditions.
     *
     * @param conditions the conditions
     * @return the DialogNodeVisitedDetails builder
     */
    public DialogNodeVisitedDetailsBuilder conditions(String conditions) {
      this.conditions = conditions;
      return this;
    }
  }

  /**
   * DialogSuggestion.
   */
  public class DialogSuggestion extends IBMWatsonGenericModel {
    private String label;
    private DialogSuggestionValue value;
    private DialogSuggestionOutput output;
    private String dialogNode;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogSuggestion() { }

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
     * An object defining the message input, intents, and entities to be sent to the Watson Assistant service if the
     * user selects the corresponding disambiguation option.
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
    public DialogSuggestionOutput getOutput() {
      return output;
    }

    /**
     * Gets the dialogNode.
     *
     * The ID of the dialog node that the **label** property is taken from. The **label** property is populated using
     * the value of the dialog node's **user_label** property.
     *
     * @return the dialogNode
     */
    @AuraEnabled
    public String getDialogNode() {
      return dialogNode;
    }
  
    private DialogSuggestion(DialogSuggestionBuilder builder) {
      IBMWatsonValidator.notNull(builder.label, 'label cannot be null');
      IBMWatsonValidator.notNull(builder.value, 'value cannot be null');
      this.label = builder.label;
      this.value = builder.value;
      this.output = builder.output;
      this.dialogNode = builder.dialogNode;
    }

    /**
     * New builder.
     *
     * @return a DialogSuggestion builder
     */
    public DialogSuggestionBuilder newBuilder() {
      return new DialogSuggestionBuilder(this);
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

      DialogSuggestion ret = (DialogSuggestion) super.deserialize(jsonString, jsonMap, classType);
      DialogSuggestionBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for value
      Map<String, Object> valueMap = (Map<String, Object>) jsonMap.get('value');
      DialogSuggestionValue newValue = (DialogSuggestionValue) new DialogSuggestionValue().deserialize(JSON.serialize(valueMap, true), valueMap, DialogSuggestionValue.class);
      retBuilder.value(newValue);

      // calling custom deserializer for output
      Map<String, Object> outputMap = (Map<String, Object>) jsonMap.get('output');
      DialogSuggestionOutput newOutput = (DialogSuggestionOutput) new DialogSuggestionOutput().deserialize(JSON.serialize(outputMap, true), outputMap, DialogSuggestionOutput.class);
      retBuilder.output(newOutput);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dialogNode' => 'dialog_node'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for value
      if (value != null) {
        String valueJsonString = JSON.serialize(value.replacePropertyNames(), true);
        String valueKey = 'value';
        if (propertyNameMapping.containsKey(valueKey)) {
          valueKey = propertyNameMapping.get(valueKey);
        }
        jsonMap.put(valueKey, JSON.deserializeUntyped(valueJsonString));
      }

      // performing custom serialization for output
      if (output != null) {
        String outputJsonString = JSON.serialize(output.replacePropertyNames(), true);
        String outputKey = 'output';
        if (propertyNameMapping.containsKey(outputKey)) {
          outputKey = propertyNameMapping.get(outputKey);
        }
        jsonMap.put(outputKey, JSON.deserializeUntyped(outputJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * DialogSuggestion Builder.
   */
  public class DialogSuggestionBuilder {
    private String label;
    private DialogSuggestionValue value;
    private DialogSuggestionOutput output;
    private String dialogNode;

    private DialogSuggestionBuilder(DialogSuggestion dialogSuggestion) {
      this.label = dialogSuggestion.label;
      this.value = dialogSuggestion.value;
      this.output = dialogSuggestion.output;
      this.dialogNode = dialogSuggestion.dialogNode;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogSuggestionBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param label the label
     * @param value the value
     */
    public DialogSuggestionBuilder(String label, DialogSuggestionValue value) {
      this.label = label;
      this.value = value;
    }

    /**
     * Builds a DialogSuggestion.
     *
     * @return the dialogSuggestion
     */
    public DialogSuggestion build() {
      return new DialogSuggestion(this);
    }

    /**
     * Set the label.
     *
     * @param label the label
     * @return the DialogSuggestion builder
     */
    public DialogSuggestionBuilder label(String label) {
      this.label = label;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the DialogSuggestion builder
     */
    public DialogSuggestionBuilder value(DialogSuggestionValue value) {
      this.value = value;
      return this;
    }

    /**
     * Set the output.
     *
     * @param output the output
     * @return the DialogSuggestion builder
     */
    public DialogSuggestionBuilder output(DialogSuggestionOutput output) {
      this.output = output;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the DialogSuggestion builder
     */
    public DialogSuggestionBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }
  }

  /**
   * The dialog output that will be returned from the Watson Assistant service if the user selects the corresponding option.
   */
  public class DialogSuggestionOutput extends IBMWatsonDynamicModel {
    private List<String> nodesVisited;
    private List<DialogNodeVisitedDetails> nodesVisitedDetails;
    private List<String> text;
    private List<DialogSuggestionResponseGeneric> generic;
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogSuggestionOutput() { }

    /**
     * Gets the nodesVisited.
     *
     * @return the nodesVisited
     */
    @AuraEnabled
    public List<String> getNodesVisited() {
      return nodesVisited;
    }

    /**
     * Gets the nodesVisitedDetails.
     *
     * @return the nodesVisitedDetails
     */
    @AuraEnabled
    public List<DialogNodeVisitedDetails> getNodesVisitedDetails() {
      return nodesVisitedDetails;
    }

    /**
     * Gets the text.
     *
     * @return the text
     */
    @AuraEnabled
    public List<String> getText() {
      return text;
    }

    /**
     * Gets the generic.
     *
     * @return the generic
     */
    @AuraEnabled
    public List<DialogSuggestionResponseGeneric> getGeneric() {
      return generic;
    }

    /**
     * Gets the dynamic properties attached to DialogSuggestionOutput.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private DialogSuggestionOutput(DialogSuggestionOutputBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      this.nodesVisited = builder.nodesVisited;
      this.nodesVisitedDetails = builder.nodesVisitedDetails;
      this.text = builder.text;
      this.generic = builder.generic;
    }

    /**
     * New builder.
     *
     * @return a DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder newBuilder() {
      return new DialogSuggestionOutputBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'nodes_visited' => 'nodesVisited',
        'nodes_visited_details' => 'nodesVisitedDetails'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DialogSuggestionOutput ret = (DialogSuggestionOutput) super.deserialize(jsonString, jsonMap, classType);
      DialogSuggestionOutputBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for nodesVisitedDetails
      List<DialogNodeVisitedDetails> newNodesVisitedDetails = new List<DialogNodeVisitedDetails>();
      List<DialogNodeVisitedDetails> deserializedNodesVisitedDetails = ret.getNodesVisitedDetails();
      if (deserializedNodesVisitedDetails != null) {
        for (Integer i = 0; i < deserializedNodesVisitedDetails.size(); i++) {
          DialogNodeVisitedDetails currentItem = ret.getNodesVisitedDetails().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('nodesVisitedDetails');
          DialogNodeVisitedDetails newItem = (DialogNodeVisitedDetails) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNodeVisitedDetails.class);
          newNodesVisitedDetails.add(newItem);
        }
        retBuilder.nodesVisitedDetails(newNodesVisitedDetails);
      }

      // calling custom deserializer for generic
      List<DialogSuggestionResponseGeneric> newGeneric = new List<DialogSuggestionResponseGeneric>();
      List<DialogSuggestionResponseGeneric> deserializedGeneric = ret.getGeneric();
      if (deserializedGeneric != null) {
        for (Integer i = 0; i < deserializedGeneric.size(); i++) {
          DialogSuggestionResponseGeneric currentItem = ret.getGeneric().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('generic');
          DialogSuggestionResponseGeneric newItem = (DialogSuggestionResponseGeneric) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogSuggestionResponseGeneric.class);
          newGeneric.add(newItem);
        }
        retBuilder.generic(newGeneric);
      }

      DialogSuggestionOutput builderResult = retBuilder.build();
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

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'nodesVisited' => 'nodes_visited',
        'nodesVisitedDetails' => 'nodes_visited_details'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.raiseAdditionalProperties(jsonMap);

      // performing custom serialization for nodesVisitedDetails
      if (nodesVisitedDetails != null) {
        List<Object> nodesVisitedDetailsJsonList = new List<Object>();
        for (DialogNodeVisitedDetails listItem : nodesVisitedDetails) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          nodesVisitedDetailsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String nodesVisitedDetailsKey = 'nodesVisitedDetails';
        if (propertyNameMapping.containsKey(nodesVisitedDetailsKey)) {
          nodesVisitedDetailsKey = propertyNameMapping.get(nodesVisitedDetailsKey);
        }
        jsonMap.put(nodesVisitedDetailsKey, nodesVisitedDetailsJsonList);
      }

      // performing custom serialization for generic
      if (generic != null) {
        List<Object> genericJsonList = new List<Object>();
        for (DialogSuggestionResponseGeneric listItem : generic) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          genericJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String genericKey = 'generic';
        if (propertyNameMapping.containsKey(genericKey)) {
          genericKey = propertyNameMapping.get(genericKey);
        }
        jsonMap.put(genericKey, genericJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * DialogSuggestionOutput Builder.
   */
  public class DialogSuggestionOutputBuilder {
    private List<String> nodesVisited;
    private List<DialogNodeVisitedDetails> nodesVisitedDetails;
    private List<String> text;
    private List<DialogSuggestionResponseGeneric> generic;

    private DialogSuggestionOutputBuilder(DialogSuggestionOutput dialogSuggestionOutput) {
      this.nodesVisited = dialogSuggestionOutput.nodesVisited;
      this.nodesVisitedDetails = dialogSuggestionOutput.nodesVisitedDetails;
      this.text = dialogSuggestionOutput.text;
      this.generic = dialogSuggestionOutput.generic;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogSuggestionOutputBuilder() { }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public DialogSuggestionOutputBuilder(List<String> text) {
      this.text = text;
    }

    /**
     * Builds a DialogSuggestionOutput.
     *
     * @return the dialogSuggestionOutput
     */
    public DialogSuggestionOutput build() {
      return new DialogSuggestionOutput(this);
    }

    /**
     * Adds an nodesVisited to nodesVisited.
     *
     * @param nodesVisited the new nodesVisited
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder addNodesVisited(String nodesVisited) {
      IBMWatsonValidator.notNull(nodesVisited, 'nodesVisited cannot be null');
      if (this.nodesVisited == null) {
        this.nodesVisited = new List<String>();
      }
      this.nodesVisited.add(nodesVisited);
      return this;
    }

    /**
     * Adds an nodesVisitedDetails to nodesVisitedDetails.
     *
     * @param nodesVisitedDetails the new nodesVisitedDetails
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder addNodesVisitedDetails(DialogNodeVisitedDetails nodesVisitedDetails) {
      IBMWatsonValidator.notNull(nodesVisitedDetails, 'nodesVisitedDetails cannot be null');
      if (this.nodesVisitedDetails == null) {
        this.nodesVisitedDetails = new List<DialogNodeVisitedDetails>();
      }
      this.nodesVisitedDetails.add(nodesVisitedDetails);
      return this;
    }

    /**
     * Adds an text to text.
     *
     * @param text the new text
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder addText(String text) {
      IBMWatsonValidator.notNull(text, 'text cannot be null');
      if (this.text == null) {
        this.text = new List<String>();
      }
      this.text.add(text);
      return this;
    }

    /**
     * Adds an generic to generic.
     *
     * @param generic the new generic
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder addGeneric(DialogSuggestionResponseGeneric generic) {
      IBMWatsonValidator.notNull(generic, 'generic cannot be null');
      if (this.generic == null) {
        this.generic = new List<DialogSuggestionResponseGeneric>();
      }
      this.generic.add(generic);
      return this;
    }

    /**
     * Set the nodesVisited.
     * Existing nodesVisited will be replaced.
     *
     * @param nodesVisited the nodesVisited
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder nodesVisited(List<String> nodesVisited) {
      this.nodesVisited = nodesVisited;
      return this;
    }

    /**
     * Set the nodesVisitedDetails.
     * Existing nodesVisitedDetails will be replaced.
     *
     * @param nodesVisitedDetails the nodesVisitedDetails
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder nodesVisitedDetails(List<DialogNodeVisitedDetails> nodesVisitedDetails) {
      this.nodesVisitedDetails = nodesVisitedDetails;
      return this;
    }

    /**
     * Set the text.
     * Existing text will be replaced.
     *
     * @param text the text
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder text(List<String> text) {
      this.text = text;
      return this;
    }

    /**
     * Set the generic.
     * Existing generic will be replaced.
     *
     * @param generic the generic
     * @return the DialogSuggestionOutput builder
     */
    public DialogSuggestionOutputBuilder generic(List<DialogSuggestionResponseGeneric> generic) {
      this.generic = generic;
      return this;
    }
  }

  /**
   * DialogSuggestionResponseGeneric.
   */
  public class DialogSuggestionResponseGeneric extends IBMWatsonGenericModel {
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
    private String dialogNode;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogSuggestionResponseGeneric() { }

    /**
     * Gets the responseType.
     *
     * The type of response returned by the dialog node. The specified response type must be supported by the client
     * application or channel.
     *
     * **Note:** The **suggestion** response type is part of the disambiguation feature, which is only available for
     * Plus and Premium users. The **search_skill** response type is available only for Plus and Premium users, and is
     * used only by the v2 runtime API.
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
     * Gets the dialogNode.
     *
     * The ID of the dialog node that the **topic** property is taken from. The **topic** property is populated using
     * the value of the dialog node's **user_label** property.
     *
     * @return the dialogNode
     */
    @AuraEnabled
    public String getDialogNode() {
      return dialogNode;
    }
  
    private DialogSuggestionResponseGeneric(DialogSuggestionResponseGenericBuilder builder) {
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
      this.dialogNode = builder.dialogNode;
    }

    /**
     * New builder.
     *
     * @return a DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder newBuilder() {
      return new DialogSuggestionResponseGenericBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'response_type' => 'responseType',
        'time' => 'xTime',
        'message_to_human_agent' => 'messageToHumanAgent',
        'dialog_node' => 'dialogNode'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DialogSuggestionResponseGeneric ret = (DialogSuggestionResponseGeneric) super.deserialize(jsonString, jsonMap, classType);
      DialogSuggestionResponseGenericBuilder retBuilder = ret.newBuilder();

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

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'responseType' => 'response_type',
        'xTime' => 'time',
        'messageToHumanAgent' => 'message_to_human_agent',
        'dialogNode' => 'dialog_node'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for options
      if (options != null) {
        List<Object> optionsJsonList = new List<Object>();
        for (DialogNodeOutputOptionsElement listItem : options) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          optionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String optionsKey = 'options';
        if (propertyNameMapping.containsKey(optionsKey)) {
          optionsKey = propertyNameMapping.get(optionsKey);
        }
        jsonMap.put(optionsKey, optionsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * DialogSuggestionResponseGeneric Builder.
   */
  public class DialogSuggestionResponseGenericBuilder {
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
    private String dialogNode;

    private DialogSuggestionResponseGenericBuilder(DialogSuggestionResponseGeneric dialogSuggestionResponseGeneric) {
      this.responseType = dialogSuggestionResponseGeneric.responseType;
      this.text = dialogSuggestionResponseGeneric.text;
      this.xTime = dialogSuggestionResponseGeneric.xTime;
      this.typing = dialogSuggestionResponseGeneric.typing;
      this.source = dialogSuggestionResponseGeneric.source;
      this.title = dialogSuggestionResponseGeneric.title;
      this.description = dialogSuggestionResponseGeneric.description;
      this.preference = dialogSuggestionResponseGeneric.preference;
      this.options = dialogSuggestionResponseGeneric.options;
      this.messageToHumanAgent = dialogSuggestionResponseGeneric.messageToHumanAgent;
      this.topic = dialogSuggestionResponseGeneric.topic;
      this.dialogNode = dialogSuggestionResponseGeneric.dialogNode;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogSuggestionResponseGenericBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param responseType the responseType
     */
    public DialogSuggestionResponseGenericBuilder(String responseType) {
      this.responseType = responseType;
    }

    /**
     * Builds a DialogSuggestionResponseGeneric.
     *
     * @return the dialogSuggestionResponseGeneric
     */
    public DialogSuggestionResponseGeneric build() {
      return new DialogSuggestionResponseGeneric(this);
    }

    /**
     * Adds an options to options.
     *
     * @param options the new options
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder addOptions(DialogNodeOutputOptionsElement options) {
      IBMWatsonValidator.notNull(options, 'options cannot be null');
      if (this.options == null) {
        this.options = new List<DialogNodeOutputOptionsElement>();
      }
      this.options.add(options);
      return this;
    }

    /**
     * Set the responseType.
     *
     * @param responseType the responseType
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder responseType(String responseType) {
      this.responseType = responseType;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the xTime.
     *
     * @param xTime the xTime
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder xTime(Long xTime) {
      this.xTime = xTime;
      return this;
    }

    /**
     * Set the typing.
     *
     * @param typing the typing
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder typing(Boolean typing) {
      this.typing = typing;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder source(String source) {
      this.source = source;
      return this;
    }

    /**
     * Set the title.
     *
     * @param title the title
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder title(String title) {
      this.title = title;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the preference.
     *
     * @param preference the preference
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder preference(String preference) {
      this.preference = preference;
      return this;
    }

    /**
     * Set the options.
     * Existing options will be replaced.
     *
     * @param options the options
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder options(List<DialogNodeOutputOptionsElement> options) {
      this.options = options;
      return this;
    }

    /**
     * Set the messageToHumanAgent.
     *
     * @param messageToHumanAgent the messageToHumanAgent
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder messageToHumanAgent(String messageToHumanAgent) {
      this.messageToHumanAgent = messageToHumanAgent;
      return this;
    }

    /**
     * Set the topic.
     *
     * @param topic the topic
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder topic(String topic) {
      this.topic = topic;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the DialogSuggestionResponseGeneric builder
     */
    public DialogSuggestionResponseGenericBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }
  }

  /**
   * An object defining the message input, intents, and entities to be sent to the Watson Assistant service if the user
   * selects the corresponding disambiguation option.
   */
  public class DialogSuggestionValue extends IBMWatsonGenericModel {
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public DialogSuggestionValue() { }

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
     * Gets the intents.
     *
     * An array of intents to be sent along with the user input.
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
     * An array of entities to be sent along with the user input.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<RuntimeEntity> getEntities() {
      return entities;
    }
  
    private DialogSuggestionValue(DialogSuggestionValueBuilder builder) {
      this.input = builder.input;
      this.intents = builder.intents;
      this.entities = builder.entities;
    }

    /**
     * New builder.
     *
     * @return a DialogSuggestionValue builder
     */
    public DialogSuggestionValueBuilder newBuilder() {
      return new DialogSuggestionValueBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DialogSuggestionValue ret = (DialogSuggestionValue) super.deserialize(jsonString, jsonMap, classType);
      DialogSuggestionValueBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for input
      Map<String, Object> inputMap = (Map<String, Object>) jsonMap.get('input');
      MessageInput newInput = (MessageInput) new MessageInput().deserialize(JSON.serialize(inputMap, true), inputMap, MessageInput.class);
      retBuilder.input(newInput);

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

      // performing custom serialization for input
      if (input != null) {
        String inputJsonString = JSON.serialize(input.replacePropertyNames(), true);
        jsonMap.put('input', JSON.deserializeUntyped(inputJsonString));
      }

      // performing custom serialization for intents
      if (intents != null) {
        List<Object> intentsJsonList = new List<Object>();
        for (RuntimeIntent listItem : intents) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          intentsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('intents', intentsJsonList);
      }

      // performing custom serialization for entities
      if (entities != null) {
        List<Object> entitiesJsonList = new List<Object>();
        for (RuntimeEntity listItem : entities) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          entitiesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('entities', entitiesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * DialogSuggestionValue Builder.
   */
  public class DialogSuggestionValueBuilder {
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;

    private DialogSuggestionValueBuilder(DialogSuggestionValue dialogSuggestionValue) {
      this.input = dialogSuggestionValue.input;
      this.intents = dialogSuggestionValue.intents;
      this.entities = dialogSuggestionValue.entities;
    }

    /**
     * Instantiates a new builder.
     */
    public DialogSuggestionValueBuilder() {
    }

    /**
     * Builds a DialogSuggestionValue.
     *
     * @return the dialogSuggestionValue
     */
    public DialogSuggestionValue build() {
      return new DialogSuggestionValue(this);
    }

    /**
     * Adds an intents to intents.
     *
     * @param intents the new intents
     * @return the DialogSuggestionValue builder
     */
    public DialogSuggestionValueBuilder addIntents(RuntimeIntent intents) {
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
     * @return the DialogSuggestionValue builder
     */
    public DialogSuggestionValueBuilder addEntities(RuntimeEntity entities) {
      IBMWatsonValidator.notNull(entities, 'entities cannot be null');
      if (this.entities == null) {
        this.entities = new List<RuntimeEntity>();
      }
      this.entities.add(entities);
      return this;
    }

    /**
     * Set the input.
     *
     * @param input the input
     * @return the DialogSuggestionValue builder
     */
    public DialogSuggestionValueBuilder input(MessageInput input) {
      this.input = input;
      return this;
    }

    /**
     * Set the intents.
     * Existing intents will be replaced.
     *
     * @param intents the intents
     * @return the DialogSuggestionValue builder
     */
    public DialogSuggestionValueBuilder intents(List<RuntimeIntent> intents) {
      this.intents = intents;
      return this;
    }

    /**
     * Set the entities.
     * Existing entities will be replaced.
     *
     * @param entities the entities
     * @return the DialogSuggestionValue builder
     */
    public DialogSuggestionValueBuilder entities(List<RuntimeEntity> entities) {
      this.entities = entities;
      return this;
    }
  }

  /**
   * Entity.
   */
  public class Entity extends IBMWatsonResponseModel {
    private String entity;
    private String description;
    private IBMWatsonMapModel metadata;
    private Boolean fuzzyMatch;
    private Datetime created;
    private Datetime updated;
    private List<Value> values;

    /**
     * Gets the entity.
     *
     * The name of the entity. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, and hyphen characters.
     * - If you specify an entity name beginning with the reserved prefix `sys-`, it must be the name of a system entity
     * that you want to enable. (Any entity content specified with the request is ignored.).
     *
     * @return the entity
     */
    @AuraEnabled
    public String getEntity() {
      return entity;
    }

    /**
     * Gets the description.
     *
     * The description of the entity. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the entity.
     *
     * @return the metadata
     */
    @AuraEnabled
    public IBMWatsonMapModel getMetadata() {
      return metadata;
    }

    /**
     * Gets the fuzzyMatch.
     *
     * Whether to use fuzzy matching for the entity.
     *
     * @return the fuzzyMatch
     */
    @AuraEnabled
    public Boolean getFuzzyMatch() {
      return fuzzyMatch;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the values.
     *
     * An array of objects describing the entity values.
     *
     * @return the values
     */
    @AuraEnabled
    public List<Value> getValues() {
      return values;
    }

    /**
     * Sets the entity.
     *
     * @param entity the new entity
     */
    public void setEntity(final String entity) {
      this.entity = entity;
    }

    /**
     * Sets the description.
     *
     * @param description the new description
     */
    public void setDescription(final String description) {
      this.description = description;
    }

    /**
     * Sets the metadata.
     *
     * @param metadata the new metadata
     */
    public void setMetadata(final IBMWatsonMapModel metadata) {
      this.metadata = metadata;
    }

    /**
     * Sets the fuzzyMatch.
     *
     * @param fuzzyMatch the new fuzzyMatch
     */
    public void setFuzzyMatch(final Boolean fuzzyMatch) {
      this.fuzzyMatch = fuzzyMatch;
    }

    /**
     * Sets the values.
     *
     * @param values the new values
     */
    public void setValues(final List<Value> values) {
      this.values = values;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'fuzzy_match' => 'fuzzyMatch'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Entity ret = (Entity) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      IBMWatsonMapModel newMetadata = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(metadataMap, true), metadataMap, IBMWatsonMapModel.class);
      ret.setMetadata(newMetadata);

      // calling custom deserializer for values
      List<Value> newValues = new List<Value>();
      List<Value> deserializedValues = ret.getValues();
      if (deserializedValues != null) {
        for (Integer i = 0; i < deserializedValues.size(); i++) {
          Value currentItem = ret.getValues().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('values');
          Value newItem = (Value) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Value.class);
          newValues.add(newItem);
        }
        ret.values = newValues;
      }

      return ret;
    }
  }

  /**
   * An array of objects describing the entities for the workspace.
   */
  public class EntityCollection extends IBMWatsonResponseModel {
    private List<Entity> entities;
    private Pagination pagination;

    /**
     * Gets the entities.
     *
     * An array of objects describing the entities defined for the workspace.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<Entity> getEntities() {
      return entities;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the entities.
     *
     * @param entities the new entities
     */
    public void setEntities(final List<Entity> entities) {
      this.entities = entities;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      EntityCollection ret = (EntityCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for entities
      List<Entity> newEntities = new List<Entity>();
      List<Entity> deserializedEntities = ret.getEntities();
      if (deserializedEntities != null) {
        for (Integer i = 0; i < deserializedEntities.size(); i++) {
          Entity currentItem = ret.getEntities().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('entities');
          Entity newItem = (Entity) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Entity.class);
          newEntities.add(newItem);
        }
        ret.entities = newEntities;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * An object describing a contextual entity mention.
   */
  public class EntityMention extends IBMWatsonGenericModel {
    private String text;
    private String intent;
    private List<Long> location;

    /**
     * Gets the text.
     *
     * The text of the user input example.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the intent.
     *
     * The name of the intent.
     *
     * @return the intent
     */
    @AuraEnabled
    public String getIntent() {
      return intent;
    }

    /**
     * Gets the location.
     *
     * An array of zero-based character offsets that indicate where the entity mentions begin and end in the input text.
     *
     * @return the location
     */
    @AuraEnabled
    public List<Long> getLocation() {
      return location;
    }

    /**
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the intent.
     *
     * @param intent the new intent
     */
    public void setIntent(final String intent) {
      this.intent = intent;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final List<Long> location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      EntityMention ret = (EntityMention) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * EntityMentionCollection.
   */
  public class EntityMentionCollection extends IBMWatsonResponseModel {
    private List<EntityMention> examples;
    private Pagination pagination;

    /**
     * Gets the examples.
     *
     * An array of objects describing the entity mentions defined for an entity.
     *
     * @return the examples
     */
    @AuraEnabled
    public List<EntityMention> getExamples() {
      return examples;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the examples.
     *
     * @param examples the new examples
     */
    public void setExamples(final List<EntityMention> examples) {
      this.examples = examples;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      EntityMentionCollection ret = (EntityMentionCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for examples
      List<EntityMention> newExamples = new List<EntityMention>();
      List<EntityMention> deserializedExamples = ret.getExamples();
      if (deserializedExamples != null) {
        for (Integer i = 0; i < deserializedExamples.size(); i++) {
          EntityMention currentItem = ret.getExamples().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('examples');
          EntityMention newItem = (EntityMention) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), EntityMention.class);
          newExamples.add(newItem);
        }
        ret.examples = newExamples;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * Example.
   */
  public class Example extends IBMWatsonResponseModel {
    private String text;
    private List<Mention> mentions;
    private Datetime created;
    private Datetime updated;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Example() { }

    /**
     * Gets the text.
     *
     * The text of a user input example. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the mentions.
     *
     * An array of contextual entity mentions.
     *
     * @return the mentions
     */
    @AuraEnabled
    public List<Mention> getMentions() {
      return mentions;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }
  
    private Example(ExampleBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      this.text = builder.text;
      this.mentions = builder.mentions;
      this.created = builder.created;
      this.updated = builder.updated;
    }

    /**
     * New builder.
     *
     * @return a Example builder
     */
    public ExampleBuilder newBuilder() {
      return new ExampleBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Example ret = (Example) super.deserialize(jsonString, jsonMap, classType);
      ExampleBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for mentions
      List<Mention> newMentions = new List<Mention>();
      List<Mention> deserializedMentions = ret.getMentions();
      if (deserializedMentions != null) {
        for (Integer i = 0; i < deserializedMentions.size(); i++) {
          Mention currentItem = ret.getMentions().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('mentions');
          Mention newItem = (Mention) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Mention.class);
          newMentions.add(newItem);
        }
        retBuilder.mentions(newMentions);
      }

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for mentions
      if (mentions != null) {
        List<Object> mentionsJsonList = new List<Object>();
        for (Mention listItem : mentions) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          mentionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('mentions', mentionsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * Example Builder.
   */
  public class ExampleBuilder {
    private String text;
    private List<Mention> mentions;
    private Datetime created;
    private Datetime updated;

    private ExampleBuilder(Example example) {
      this.text = example.text;
      this.mentions = example.mentions;
      this.created = example.created;
      this.updated = example.updated;
    }

    /**
     * Instantiates a new builder.
     */
    public ExampleBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public ExampleBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a Example.
     *
     * @return the example
     */
    public Example build() {
      return new Example(this);
    }

    /**
     * Adds an mentions to mentions.
     *
     * @param mentions the new mentions
     * @return the Example builder
     */
    public ExampleBuilder addMentions(Mention mentions) {
      IBMWatsonValidator.notNull(mentions, 'mentions cannot be null');
      if (this.mentions == null) {
        this.mentions = new List<Mention>();
      }
      this.mentions.add(mentions);
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the Example builder
     */
    public ExampleBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the mentions.
     * Existing mentions will be replaced.
     *
     * @param mentions the mentions
     * @return the Example builder
     */
    public ExampleBuilder mentions(List<Mention> mentions) {
      this.mentions = mentions;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the Example builder
     */
    public ExampleBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the Example builder
     */
    public ExampleBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }
  }

  /**
   * ExampleCollection.
   */
  public class ExampleCollection extends IBMWatsonResponseModel {
    private List<Example> examples;
    private Pagination pagination;

    /**
     * Gets the examples.
     *
     * An array of objects describing the examples defined for the intent.
     *
     * @return the examples
     */
    @AuraEnabled
    public List<Example> getExamples() {
      return examples;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the examples.
     *
     * @param examples the new examples
     */
    public void setExamples(final List<Example> examples) {
      this.examples = examples;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ExampleCollection ret = (ExampleCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for examples
      List<Example> newExamples = new List<Example>();
      List<Example> deserializedExamples = ret.getExamples();
      if (deserializedExamples != null) {
        for (Integer i = 0; i < deserializedExamples.size(); i++) {
          Example currentItem = ret.getExamples().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('examples');
          Example newItem = (Example) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Example.class);
          newExamples.add(newItem);
        }
        ret.examples = newExamples;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * The getCounterexample options.
   */
  public class GetCounterexampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the text.
     *
     * The text of a user input counterexample (for example, `What are you wearing?`).
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private GetCounterexampleOptions(GetCounterexampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.text, 'text cannot be empty');
      workspaceId = builder.workspaceId;
      text = builder.text;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetCounterexampleOptions builder
     */
    public GetCounterexampleOptionsBuilder newBuilder() {
      return new GetCounterexampleOptionsBuilder(this);
    }
  }

  /**
   * GetCounterexampleOptions Builder.
   */
  public class GetCounterexampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;
    private Boolean includeAudit;

    private GetCounterexampleOptionsBuilder(GetCounterexampleOptions getCounterexampleOptions) {
      workspaceId = getCounterexampleOptions.workspaceId;
      text = getCounterexampleOptions.text;
      includeAudit = getCounterexampleOptions.includeAudit;
      this.requestHeaders.putAll(getCounterexampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetCounterexampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param text the text
     */
    public GetCounterexampleOptionsBuilder(String workspaceId, String text) {
      this.workspaceId = workspaceId;
      this.text = text;
    }

    /**
     * Builds a GetCounterexampleOptions.
     *
     * @return the getCounterexampleOptions
     */
    public GetCounterexampleOptions build() {
      return new GetCounterexampleOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetCounterexampleOptions builder
     */
    public GetCounterexampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the GetCounterexampleOptions builder
     */
    public GetCounterexampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetCounterexampleOptions builder
     */
    public GetCounterexampleOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetCounterexampleOptions builder
     */
    public GetCounterexampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getDialogNode options.
   */
  public class GetDialogNodeOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the dialogNode.
     *
     * The dialog node ID (for example, `get_order`).
     *
     * @return the dialogNode
     */
    public String dialogNode() {
      return dialogNode;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private GetDialogNodeOptions(GetDialogNodeOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.dialogNode, 'dialogNode cannot be empty');
      workspaceId = builder.workspaceId;
      dialogNode = builder.dialogNode;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetDialogNodeOptions builder
     */
    public GetDialogNodeOptionsBuilder newBuilder() {
      return new GetDialogNodeOptionsBuilder(this);
    }
  }

  /**
   * GetDialogNodeOptions Builder.
   */
  public class GetDialogNodeOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;
    private Boolean includeAudit;

    private GetDialogNodeOptionsBuilder(GetDialogNodeOptions getDialogNodeOptions) {
      workspaceId = getDialogNodeOptions.workspaceId;
      dialogNode = getDialogNodeOptions.dialogNode;
      includeAudit = getDialogNodeOptions.includeAudit;
      this.requestHeaders.putAll(getDialogNodeOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetDialogNodeOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param dialogNode the dialogNode
     */
    public GetDialogNodeOptionsBuilder(String workspaceId, String dialogNode) {
      this.workspaceId = workspaceId;
      this.dialogNode = dialogNode;
    }

    /**
     * Builds a GetDialogNodeOptions.
     *
     * @return the getDialogNodeOptions
     */
    public GetDialogNodeOptions build() {
      return new GetDialogNodeOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetDialogNodeOptions builder
     */
    public GetDialogNodeOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the GetDialogNodeOptions builder
     */
    public GetDialogNodeOptionsBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetDialogNodeOptions builder
     */
    public GetDialogNodeOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetDialogNodeOptions builder
     */
    public GetDialogNodeOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getEntity options.
   */
  public class GetEntityOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private Boolean xExport;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private GetEntityOptions(GetEntityOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      xExport = builder.xExport;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetEntityOptions builder
     */
    public GetEntityOptionsBuilder newBuilder() {
      return new GetEntityOptionsBuilder(this);
    }
  }

  /**
   * GetEntityOptions Builder.
   */
  public class GetEntityOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private Boolean xExport;
    private Boolean includeAudit;

    private GetEntityOptionsBuilder(GetEntityOptions getEntityOptions) {
      workspaceId = getEntityOptions.workspaceId;
      entity = getEntityOptions.entity;
      xExport = getEntityOptions.xExport;
      includeAudit = getEntityOptions.includeAudit;
      this.requestHeaders.putAll(getEntityOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetEntityOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     */
    public GetEntityOptionsBuilder(String workspaceId, String entity) {
      this.workspaceId = workspaceId;
      this.entity = entity;
    }

    /**
     * Builds a GetEntityOptions.
     *
     * @return the getEntityOptions
     */
    public GetEntityOptions build() {
      return new GetEntityOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetEntityOptions builder
     */
    public GetEntityOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the GetEntityOptions builder
     */
    public GetEntityOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the GetEntityOptions builder
     */
    public GetEntityOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetEntityOptions builder
     */
    public GetEntityOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetEntityOptions builder
     */
    public GetEntityOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getExample options.
   */
  public class GetExampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the text.
     *
     * The text of the user input example.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private GetExampleOptions(GetExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      IBMWatsonValidator.notEmpty(builder.text, 'text cannot be empty');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      text = builder.text;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetExampleOptions builder
     */
    public GetExampleOptionsBuilder newBuilder() {
      return new GetExampleOptionsBuilder(this);
    }
  }

  /**
   * GetExampleOptions Builder.
   */
  public class GetExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;
    private Boolean includeAudit;

    private GetExampleOptionsBuilder(GetExampleOptions getExampleOptions) {
      workspaceId = getExampleOptions.workspaceId;
      intent = getExampleOptions.intent;
      text = getExampleOptions.text;
      includeAudit = getExampleOptions.includeAudit;
      this.requestHeaders.putAll(getExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     * @param text the text
     */
    public GetExampleOptionsBuilder(String workspaceId, String intent, String text) {
      this.workspaceId = workspaceId;
      this.intent = intent;
      this.text = text;
    }

    /**
     * Builds a GetExampleOptions.
     *
     * @return the getExampleOptions
     */
    public GetExampleOptions build() {
      return new GetExampleOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetExampleOptions builder
     */
    public GetExampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the GetExampleOptions builder
     */
    public GetExampleOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the GetExampleOptions builder
     */
    public GetExampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetExampleOptions builder
     */
    public GetExampleOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetExampleOptions builder
     */
    public GetExampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getIntent options.
   */
  public class GetIntentOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private Boolean xExport;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private GetIntentOptions(GetIntentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      xExport = builder.xExport;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetIntentOptions builder
     */
    public GetIntentOptionsBuilder newBuilder() {
      return new GetIntentOptionsBuilder(this);
    }
  }

  /**
   * GetIntentOptions Builder.
   */
  public class GetIntentOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private Boolean xExport;
    private Boolean includeAudit;

    private GetIntentOptionsBuilder(GetIntentOptions getIntentOptions) {
      workspaceId = getIntentOptions.workspaceId;
      intent = getIntentOptions.intent;
      xExport = getIntentOptions.xExport;
      includeAudit = getIntentOptions.includeAudit;
      this.requestHeaders.putAll(getIntentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetIntentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     */
    public GetIntentOptionsBuilder(String workspaceId, String intent) {
      this.workspaceId = workspaceId;
      this.intent = intent;
    }

    /**
     * Builds a GetIntentOptions.
     *
     * @return the getIntentOptions
     */
    public GetIntentOptions build() {
      return new GetIntentOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetIntentOptions builder
     */
    public GetIntentOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the GetIntentOptions builder
     */
    public GetIntentOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the GetIntentOptions builder
     */
    public GetIntentOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetIntentOptions builder
     */
    public GetIntentOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetIntentOptions builder
     */
    public GetIntentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getSynonym options.
   */
  public class GetSynonymOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the synonym.
     *
     * The text of the synonym.
     *
     * @return the synonym
     */
    public String synonym() {
      return synonym;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private GetSynonymOptions(GetSynonymOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      IBMWatsonValidator.notEmpty(builder.synonym, 'synonym cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      synonym = builder.synonym;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetSynonymOptions builder
     */
    public GetSynonymOptionsBuilder newBuilder() {
      return new GetSynonymOptionsBuilder(this);
    }
  }

  /**
   * GetSynonymOptions Builder.
   */
  public class GetSynonymOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;
    private Boolean includeAudit;

    private GetSynonymOptionsBuilder(GetSynonymOptions getSynonymOptions) {
      workspaceId = getSynonymOptions.workspaceId;
      entity = getSynonymOptions.entity;
      value = getSynonymOptions.value;
      synonym = getSynonymOptions.synonym;
      includeAudit = getSynonymOptions.includeAudit;
      this.requestHeaders.putAll(getSynonymOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetSynonymOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     * @param synonym the synonym
     */
    public GetSynonymOptionsBuilder(String workspaceId, String entity, String value, String synonym) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
      this.synonym = synonym;
    }

    /**
     * Builds a GetSynonymOptions.
     *
     * @return the getSynonymOptions
     */
    public GetSynonymOptions build() {
      return new GetSynonymOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetSynonymOptions builder
     */
    public GetSynonymOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the GetSynonymOptions builder
     */
    public GetSynonymOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the GetSynonymOptions builder
     */
    public GetSynonymOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the synonym.
     *
     * @param synonym the synonym
     * @return the GetSynonymOptions builder
     */
    public GetSynonymOptionsBuilder synonym(String synonym) {
      this.synonym = synonym;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetSynonymOptions builder
     */
    public GetSynonymOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetSynonymOptions builder
     */
    public GetSynonymOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getValue options.
   */
  public class GetValueOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private Boolean xExport;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private GetValueOptions(GetValueOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      xExport = builder.xExport;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetValueOptions builder
     */
    public GetValueOptionsBuilder newBuilder() {
      return new GetValueOptionsBuilder(this);
    }
  }

  /**
   * GetValueOptions Builder.
   */
  public class GetValueOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private Boolean xExport;
    private Boolean includeAudit;

    private GetValueOptionsBuilder(GetValueOptions getValueOptions) {
      workspaceId = getValueOptions.workspaceId;
      entity = getValueOptions.entity;
      value = getValueOptions.value;
      xExport = getValueOptions.xExport;
      includeAudit = getValueOptions.includeAudit;
      this.requestHeaders.putAll(getValueOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetValueOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     */
    public GetValueOptionsBuilder(String workspaceId, String entity, String value) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
    }

    /**
     * Builds a GetValueOptions.
     *
     * @return the getValueOptions
     */
    public GetValueOptions build() {
      return new GetValueOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetValueOptions builder
     */
    public GetValueOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the GetValueOptions builder
     */
    public GetValueOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the GetValueOptions builder
     */
    public GetValueOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the GetValueOptions builder
     */
    public GetValueOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetValueOptions builder
     */
    public GetValueOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetValueOptions builder
     */
    public GetValueOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getWorkspace options.
   */
  public class GetWorkspaceOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Boolean xExport;
    private Boolean includeAudit;
    private String xSort;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    /**
     * Gets the xSort.
     *
     * Indicates how the returned workspace data will be sorted. This parameter is valid only if **export**=`true`.
     * Specify `sort=stable` to sort all workspace objects by unique identifier, in ascending alphabetical order.
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    private GetWorkspaceOptions(GetWorkspaceOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      xExport = builder.xExport;
      includeAudit = builder.includeAudit;
      xSort = builder.xSort;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetWorkspaceOptions builder
     */
    public GetWorkspaceOptionsBuilder newBuilder() {
      return new GetWorkspaceOptionsBuilder(this);
    }
  }

  /**
   * GetWorkspaceOptions Builder.
   */
  public class GetWorkspaceOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Boolean xExport;
    private Boolean includeAudit;
    private String xSort;

    private GetWorkspaceOptionsBuilder(GetWorkspaceOptions getWorkspaceOptions) {
      workspaceId = getWorkspaceOptions.workspaceId;
      xExport = getWorkspaceOptions.xExport;
      includeAudit = getWorkspaceOptions.includeAudit;
      xSort = getWorkspaceOptions.xSort;
      this.requestHeaders.putAll(getWorkspaceOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetWorkspaceOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public GetWorkspaceOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a GetWorkspaceOptions.
     *
     * @return the getWorkspaceOptions
     */
    public GetWorkspaceOptions build() {
      return new GetWorkspaceOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the GetWorkspaceOptions builder
     */
    public GetWorkspaceOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the GetWorkspaceOptions builder
     */
    public GetWorkspaceOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the GetWorkspaceOptions builder
     */
    public GetWorkspaceOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the GetWorkspaceOptions builder
     */
    public GetWorkspaceOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetWorkspaceOptions builder
     */
    public GetWorkspaceOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Intent.
   */
  public class Intent extends IBMWatsonResponseModel {
    private String intent;
    private String description;
    private Datetime created;
    private Datetime updated;
    private List<Example> examples;

    /**
     * Gets the intent.
     *
     * The name of the intent. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, hyphen, and dot characters.
     * - It cannot begin with the reserved prefix `sys-`.
     *
     * @return the intent
     */
    @AuraEnabled
    public String getIntent() {
      return intent;
    }

    /**
     * Gets the description.
     *
     * The description of the intent. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the examples.
     *
     * An array of user input examples for the intent.
     *
     * @return the examples
     */
    @AuraEnabled
    public List<Example> getExamples() {
      return examples;
    }

    /**
     * Sets the intent.
     *
     * @param intent the new intent
     */
    public void setIntent(final String intent) {
      this.intent = intent;
    }

    /**
     * Sets the description.
     *
     * @param description the new description
     */
    public void setDescription(final String description) {
      this.description = description;
    }

    /**
     * Sets the examples.
     *
     * @param examples the new examples
     */
    public void setExamples(final List<Example> examples) {
      this.examples = examples;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Intent ret = (Intent) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for examples
      List<Example> newExamples = new List<Example>();
      List<Example> deserializedExamples = ret.getExamples();
      if (deserializedExamples != null) {
        for (Integer i = 0; i < deserializedExamples.size(); i++) {
          Example currentItem = ret.getExamples().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('examples');
          Example newItem = (Example) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Example.class);
          newExamples.add(newItem);
        }
        ret.examples = newExamples;
      }

      return ret;
    }
  }

  /**
   * IntentCollection.
   */
  public class IntentCollection extends IBMWatsonResponseModel {
    private List<Intent> intents;
    private Pagination pagination;

    /**
     * Gets the intents.
     *
     * An array of objects describing the intents defined for the workspace.
     *
     * @return the intents
     */
    @AuraEnabled
    public List<Intent> getIntents() {
      return intents;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the intents.
     *
     * @param intents the new intents
     */
    public void setIntents(final List<Intent> intents) {
      this.intents = intents;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      IntentCollection ret = (IntentCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for intents
      List<Intent> newIntents = new List<Intent>();
      List<Intent> deserializedIntents = ret.getIntents();
      if (deserializedIntents != null) {
        for (Integer i = 0; i < deserializedIntents.size(); i++) {
          Intent currentItem = ret.getIntents().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('intents');
          Intent newItem = (Intent) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Intent.class);
          newIntents.add(newItem);
        }
        ret.intents = newIntents;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * The listAllLogs options.
   */
  public class ListAllLogsOptions extends IBMWatsonOptionsModel {
    private String filter;
    private String xSort;
    private Long pageLimit;
    private String cursor;

    /**
     * Gets the filter.
     *
     * A cacheable parameter that limits the results to those matching the specified filter. You must specify a filter
     * query that includes a value for `language`, as well as a value for `request.context.system.assistant_id`,
     * `workspace_id`, or `request.context.metadata.deployment`. For more information, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-filter-reference#filter-reference).
     *
     * @return the filter
     */
    public String filter() {
      return filter;
    }

    /**
     * Gets the xSort.
     *
     * How to sort the returned log events. You can sort by **request_timestamp**. To reverse the sort order, prefix the
     * parameter value with a minus sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    private ListAllLogsOptions(ListAllLogsOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.filter, 'filter cannot be null');
      filter = builder.filter;
      xSort = builder.xSort;
      pageLimit = builder.pageLimit;
      cursor = builder.cursor;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListAllLogsOptions builder
     */
    public ListAllLogsOptionsBuilder newBuilder() {
      return new ListAllLogsOptionsBuilder(this);
    }
  }

  /**
   * ListAllLogsOptions Builder.
   */
  public class ListAllLogsOptionsBuilder extends IBMWatsonOptionsModel {
    private String filter;
    private String xSort;
    private Long pageLimit;
    private String cursor;

    private ListAllLogsOptionsBuilder(ListAllLogsOptions listAllLogsOptions) {
      filter = listAllLogsOptions.filter;
      xSort = listAllLogsOptions.xSort;
      pageLimit = listAllLogsOptions.pageLimit;
      cursor = listAllLogsOptions.cursor;
      this.requestHeaders.putAll(listAllLogsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListAllLogsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param filter the filter
     */
    public ListAllLogsOptionsBuilder(String filter) {
      this.filter = filter;
    }

    /**
     * Builds a ListAllLogsOptions.
     *
     * @return the listAllLogsOptions
     */
    public ListAllLogsOptions build() {
      return new ListAllLogsOptions(this);
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the ListAllLogsOptions builder
     */
    public ListAllLogsOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListAllLogsOptions builder
     */
    public ListAllLogsOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListAllLogsOptions builder
     */
    public ListAllLogsOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListAllLogsOptions builder
     */
    public ListAllLogsOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListAllLogsOptions builder
     */
    public ListAllLogsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listCounterexamples options.
   */
  public class ListCounterexamplesOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned counterexamples will be sorted. To reverse the sort order, prefix the value with
     * a minus sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListCounterexamplesOptions(ListCounterexamplesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListCounterexamplesOptions builder
     */
    public ListCounterexamplesOptionsBuilder newBuilder() {
      return new ListCounterexamplesOptionsBuilder(this);
    }
  }

  /**
   * ListCounterexamplesOptions Builder.
   */
  public class ListCounterexamplesOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListCounterexamplesOptionsBuilder(ListCounterexamplesOptions listCounterexamplesOptions) {
      workspaceId = listCounterexamplesOptions.workspaceId;
      pageLimit = listCounterexamplesOptions.pageLimit;
      xSort = listCounterexamplesOptions.xSort;
      cursor = listCounterexamplesOptions.cursor;
      includeAudit = listCounterexamplesOptions.includeAudit;
      this.requestHeaders.putAll(listCounterexamplesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListCounterexamplesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public ListCounterexamplesOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a ListCounterexamplesOptions.
     *
     * @return the listCounterexamplesOptions
     */
    public ListCounterexamplesOptions build() {
      return new ListCounterexamplesOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListCounterexamplesOptions builder
     */
    public ListCounterexamplesOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListCounterexamplesOptions builder
     */
    public ListCounterexamplesOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListCounterexamplesOptions builder
     */
    public ListCounterexamplesOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListCounterexamplesOptions builder
     */
    public ListCounterexamplesOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListCounterexamplesOptions builder
     */
    public ListCounterexamplesOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListCounterexamplesOptions builder
     */
    public ListCounterexamplesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listDialogNodes options.
   */
  public class ListDialogNodesOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned dialog nodes will be sorted. To reverse the sort order, prefix the value with a
     * minus sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListDialogNodesOptions(ListDialogNodesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListDialogNodesOptions builder
     */
    public ListDialogNodesOptionsBuilder newBuilder() {
      return new ListDialogNodesOptionsBuilder(this);
    }
  }

  /**
   * ListDialogNodesOptions Builder.
   */
  public class ListDialogNodesOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListDialogNodesOptionsBuilder(ListDialogNodesOptions listDialogNodesOptions) {
      workspaceId = listDialogNodesOptions.workspaceId;
      pageLimit = listDialogNodesOptions.pageLimit;
      xSort = listDialogNodesOptions.xSort;
      cursor = listDialogNodesOptions.cursor;
      includeAudit = listDialogNodesOptions.includeAudit;
      this.requestHeaders.putAll(listDialogNodesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListDialogNodesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public ListDialogNodesOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a ListDialogNodesOptions.
     *
     * @return the listDialogNodesOptions
     */
    public ListDialogNodesOptions build() {
      return new ListDialogNodesOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListDialogNodesOptions builder
     */
    public ListDialogNodesOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListDialogNodesOptions builder
     */
    public ListDialogNodesOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListDialogNodesOptions builder
     */
    public ListDialogNodesOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListDialogNodesOptions builder
     */
    public ListDialogNodesOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListDialogNodesOptions builder
     */
    public ListDialogNodesOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListDialogNodesOptions builder
     */
    public ListDialogNodesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listEntities options.
   */
  public class ListEntitiesOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Boolean xExport;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned entities will be sorted. To reverse the sort order, prefix the value with a minus
     * sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListEntitiesOptions(ListEntitiesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      xExport = builder.xExport;
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder newBuilder() {
      return new ListEntitiesOptionsBuilder(this);
    }
  }

  /**
   * ListEntitiesOptions Builder.
   */
  public class ListEntitiesOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Boolean xExport;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListEntitiesOptionsBuilder(ListEntitiesOptions listEntitiesOptions) {
      workspaceId = listEntitiesOptions.workspaceId;
      xExport = listEntitiesOptions.xExport;
      pageLimit = listEntitiesOptions.pageLimit;
      xSort = listEntitiesOptions.xSort;
      cursor = listEntitiesOptions.cursor;
      includeAudit = listEntitiesOptions.includeAudit;
      this.requestHeaders.putAll(listEntitiesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListEntitiesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public ListEntitiesOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a ListEntitiesOptions.
     *
     * @return the listEntitiesOptions
     */
    public ListEntitiesOptions build() {
      return new ListEntitiesOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListEntitiesOptions builder
     */
    public ListEntitiesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listExamples options.
   */
  public class ListExamplesOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned examples will be sorted. To reverse the sort order, prefix the value with a minus
     * sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListExamplesOptions(ListExamplesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder newBuilder() {
      return new ListExamplesOptionsBuilder(this);
    }
  }

  /**
   * ListExamplesOptions Builder.
   */
  public class ListExamplesOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListExamplesOptionsBuilder(ListExamplesOptions listExamplesOptions) {
      workspaceId = listExamplesOptions.workspaceId;
      intent = listExamplesOptions.intent;
      pageLimit = listExamplesOptions.pageLimit;
      xSort = listExamplesOptions.xSort;
      cursor = listExamplesOptions.cursor;
      includeAudit = listExamplesOptions.includeAudit;
      this.requestHeaders.putAll(listExamplesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListExamplesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     */
    public ListExamplesOptionsBuilder(String workspaceId, String intent) {
      this.workspaceId = workspaceId;
      this.intent = intent;
    }

    /**
     * Builds a ListExamplesOptions.
     *
     * @return the listExamplesOptions
     */
    public ListExamplesOptions build() {
      return new ListExamplesOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListExamplesOptions builder
     */
    public ListExamplesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listIntents options.
   */
  public class ListIntentsOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Boolean xExport;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned intents will be sorted. To reverse the sort order, prefix the value with a minus
     * sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListIntentsOptions(ListIntentsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      xExport = builder.xExport;
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder newBuilder() {
      return new ListIntentsOptionsBuilder(this);
    }
  }

  /**
   * ListIntentsOptions Builder.
   */
  public class ListIntentsOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private Boolean xExport;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListIntentsOptionsBuilder(ListIntentsOptions listIntentsOptions) {
      workspaceId = listIntentsOptions.workspaceId;
      xExport = listIntentsOptions.xExport;
      pageLimit = listIntentsOptions.pageLimit;
      xSort = listIntentsOptions.xSort;
      cursor = listIntentsOptions.cursor;
      includeAudit = listIntentsOptions.includeAudit;
      this.requestHeaders.putAll(listIntentsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListIntentsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public ListIntentsOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a ListIntentsOptions.
     *
     * @return the listIntentsOptions
     */
    public ListIntentsOptions build() {
      return new ListIntentsOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListIntentsOptions builder
     */
    public ListIntentsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listLogs options.
   */
  public class ListLogsOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String xSort;
    private String filter;
    private Long pageLimit;
    private String cursor;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the xSort.
     *
     * How to sort the returned log events. You can sort by **request_timestamp**. To reverse the sort order, prefix the
     * parameter value with a minus sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the filter.
     *
     * A cacheable parameter that limits the results to those matching the specified filter. For more information, see
     * the [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-filter-reference#filter-reference).
     *
     * @return the filter
     */
    public String filter() {
      return filter;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    private ListLogsOptions(ListLogsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      xSort = builder.xSort;
      filter = builder.filter;
      pageLimit = builder.pageLimit;
      cursor = builder.cursor;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListLogsOptions builder
     */
    public ListLogsOptionsBuilder newBuilder() {
      return new ListLogsOptionsBuilder(this);
    }
  }

  /**
   * ListLogsOptions Builder.
   */
  public class ListLogsOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String xSort;
    private String filter;
    private Long pageLimit;
    private String cursor;

    private ListLogsOptionsBuilder(ListLogsOptions listLogsOptions) {
      workspaceId = listLogsOptions.workspaceId;
      xSort = listLogsOptions.xSort;
      filter = listLogsOptions.filter;
      pageLimit = listLogsOptions.pageLimit;
      cursor = listLogsOptions.cursor;
      this.requestHeaders.putAll(listLogsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListLogsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public ListLogsOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a ListLogsOptions.
     *
     * @return the listLogsOptions
     */
    public ListLogsOptions build() {
      return new ListLogsOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListLogsOptions builder
     */
    public ListLogsOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListLogsOptions builder
     */
    public ListLogsOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the ListLogsOptions builder
     */
    public ListLogsOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListLogsOptions builder
     */
    public ListLogsOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListLogsOptions builder
     */
    public ListLogsOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListLogsOptions builder
     */
    public ListLogsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listMentions options.
   */
  public class ListMentionsOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private Boolean xExport;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListMentionsOptions(ListMentionsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      xExport = builder.xExport;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListMentionsOptions builder
     */
    public ListMentionsOptionsBuilder newBuilder() {
      return new ListMentionsOptionsBuilder(this);
    }
  }

  /**
   * ListMentionsOptions Builder.
   */
  public class ListMentionsOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private Boolean xExport;
    private Boolean includeAudit;

    private ListMentionsOptionsBuilder(ListMentionsOptions listMentionsOptions) {
      workspaceId = listMentionsOptions.workspaceId;
      entity = listMentionsOptions.entity;
      xExport = listMentionsOptions.xExport;
      includeAudit = listMentionsOptions.includeAudit;
      this.requestHeaders.putAll(listMentionsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListMentionsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     */
    public ListMentionsOptionsBuilder(String workspaceId, String entity) {
      this.workspaceId = workspaceId;
      this.entity = entity;
    }

    /**
     * Builds a ListMentionsOptions.
     *
     * @return the listMentionsOptions
     */
    public ListMentionsOptions build() {
      return new ListMentionsOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListMentionsOptions builder
     */
    public ListMentionsOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the ListMentionsOptions builder
     */
    public ListMentionsOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the ListMentionsOptions builder
     */
    public ListMentionsOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListMentionsOptions builder
     */
    public ListMentionsOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListMentionsOptions builder
     */
    public ListMentionsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listSynonyms options.
   */
  public class ListSynonymsOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned entity value synonyms will be sorted. To reverse the sort order, prefix the value
     * with a minus sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListSynonymsOptions(ListSynonymsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder newBuilder() {
      return new ListSynonymsOptionsBuilder(this);
    }
  }

  /**
   * ListSynonymsOptions Builder.
   */
  public class ListSynonymsOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListSynonymsOptionsBuilder(ListSynonymsOptions listSynonymsOptions) {
      workspaceId = listSynonymsOptions.workspaceId;
      entity = listSynonymsOptions.entity;
      value = listSynonymsOptions.value;
      pageLimit = listSynonymsOptions.pageLimit;
      xSort = listSynonymsOptions.xSort;
      cursor = listSynonymsOptions.cursor;
      includeAudit = listSynonymsOptions.includeAudit;
      this.requestHeaders.putAll(listSynonymsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListSynonymsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     */
    public ListSynonymsOptionsBuilder(String workspaceId, String entity, String value) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
    }

    /**
     * Builds a ListSynonymsOptions.
     *
     * @return the listSynonymsOptions
     */
    public ListSynonymsOptions build() {
      return new ListSynonymsOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListSynonymsOptions builder
     */
    public ListSynonymsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listValues options.
   */
  public class ListValuesOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private Boolean xExport;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the xExport.
     *
     * Whether to include all element content in the returned data. If **export**=`false`, the returned data includes
     * only information about the element itself. If **export**=`true`, all content, including subelements, is included.
     *
     * @return the xExport
     */
    public Boolean xExport() {
      return xExport;
    }

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned entity values will be sorted. To reverse the sort order, prefix the value with a
     * minus sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListValuesOptions(ListValuesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      xExport = builder.xExport;
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListValuesOptions builder
     */
    public ListValuesOptionsBuilder newBuilder() {
      return new ListValuesOptionsBuilder(this);
    }
  }

  /**
   * ListValuesOptions Builder.
   */
  public class ListValuesOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private Boolean xExport;
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListValuesOptionsBuilder(ListValuesOptions listValuesOptions) {
      workspaceId = listValuesOptions.workspaceId;
      entity = listValuesOptions.entity;
      xExport = listValuesOptions.xExport;
      pageLimit = listValuesOptions.pageLimit;
      xSort = listValuesOptions.xSort;
      cursor = listValuesOptions.cursor;
      includeAudit = listValuesOptions.includeAudit;
      this.requestHeaders.putAll(listValuesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListValuesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     */
    public ListValuesOptionsBuilder(String workspaceId, String entity) {
      this.workspaceId = workspaceId;
      this.entity = entity;
    }

    /**
     * Builds a ListValuesOptions.
     *
     * @return the listValuesOptions
     */
    public ListValuesOptions build() {
      return new ListValuesOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the xExport.
     *
     * @param xExport the xExport
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder xExport(Boolean xExport) {
      this.xExport = xExport;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListValuesOptions builder
     */
    public ListValuesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listWorkspaces options.
   */
  public class ListWorkspacesOptions extends IBMWatsonOptionsModel {
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    /**
     * Gets the pageLimit.
     *
     * The number of records to return in each page of results.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the xSort.
     *
     * The attribute by which returned workspaces will be sorted. To reverse the sort order, prefix the value with a
     * minus sign (`-`).
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the cursor.
     *
     * A token identifying the page of results to retrieve.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private ListWorkspacesOptions(ListWorkspacesOptionsBuilder builder) {
      pageLimit = builder.pageLimit;
      xSort = builder.xSort;
      cursor = builder.cursor;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListWorkspacesOptions builder
     */
    public ListWorkspacesOptionsBuilder newBuilder() {
      return new ListWorkspacesOptionsBuilder(this);
    }
  }

  /**
   * ListWorkspacesOptions Builder.
   */
  public class ListWorkspacesOptionsBuilder extends IBMWatsonOptionsModel {
    private Long pageLimit;
    private String xSort;
    private String cursor;
    private Boolean includeAudit;

    private ListWorkspacesOptionsBuilder(ListWorkspacesOptions listWorkspacesOptions) {
      pageLimit = listWorkspacesOptions.pageLimit;
      xSort = listWorkspacesOptions.xSort;
      cursor = listWorkspacesOptions.cursor;
      includeAudit = listWorkspacesOptions.includeAudit;
      this.requestHeaders.putAll(listWorkspacesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListWorkspacesOptionsBuilder() {
    }

    /**
     * Builds a ListWorkspacesOptions.
     *
     * @return the listWorkspacesOptions
     */
    public ListWorkspacesOptions build() {
      return new ListWorkspacesOptions(this);
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListWorkspacesOptions builder
     */
    public ListWorkspacesOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListWorkspacesOptions builder
     */
    public ListWorkspacesOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListWorkspacesOptions builder
     */
    public ListWorkspacesOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the ListWorkspacesOptions builder
     */
    public ListWorkspacesOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListWorkspacesOptions builder
     */
    public ListWorkspacesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Log.
   */
  public class Log extends IBMWatsonGenericModel {
    private MessageRequest request;
    private MessageResponse response;
    private String logId;
    private String requestTimestamp;
    private String responseTimestamp;
    private String workspaceId;
    private String language;

    /**
     * Gets the request.
     *
     * A request sent to the workspace, including the user input and context.
     *
     * @return the request
     */
    @AuraEnabled
    public MessageRequest getRequest() {
      return request;
    }

    /**
     * Gets the response.
     *
     * The response sent by the workspace, including the output text, detected intents and entities, and context.
     *
     * @return the response
     */
    @AuraEnabled
    public MessageResponse getResponse() {
      return response;
    }

    /**
     * Gets the logId.
     *
     * A unique identifier for the logged event.
     *
     * @return the logId
     */
    @AuraEnabled
    public String getLogId() {
      return logId;
    }

    /**
     * Gets the requestTimestamp.
     *
     * The timestamp for receipt of the message.
     *
     * @return the requestTimestamp
     */
    @AuraEnabled
    public String getRequestTimestamp() {
      return requestTimestamp;
    }

    /**
     * Gets the responseTimestamp.
     *
     * The timestamp for the system response to the message.
     *
     * @return the responseTimestamp
     */
    @AuraEnabled
    public String getResponseTimestamp() {
      return responseTimestamp;
    }

    /**
     * Gets the workspaceId.
     *
     * The unique identifier of the workspace where the request was made.
     *
     * @return the workspaceId
     */
    @AuraEnabled
    public String getWorkspaceId() {
      return workspaceId;
    }

    /**
     * Gets the language.
     *
     * The language of the workspace where the message request was made.
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Sets the request.
     *
     * @param request the new request
     */
    public void setRequest(final MessageRequest request) {
      this.request = request;
    }

    /**
     * Sets the response.
     *
     * @param response the new response
     */
    public void setResponse(final MessageResponse response) {
      this.response = response;
    }

    /**
     * Sets the logId.
     *
     * @param logId the new logId
     */
    public void setLogId(final String logId) {
      this.logId = logId;
    }

    /**
     * Sets the requestTimestamp.
     *
     * @param requestTimestamp the new requestTimestamp
     */
    public void setRequestTimestamp(final String requestTimestamp) {
      this.requestTimestamp = requestTimestamp;
    }

    /**
     * Sets the responseTimestamp.
     *
     * @param responseTimestamp the new responseTimestamp
     */
    public void setResponseTimestamp(final String responseTimestamp) {
      this.responseTimestamp = responseTimestamp;
    }

    /**
     * Sets the workspaceId.
     *
     * @param workspaceId the new workspaceId
     */
    public void setWorkspaceId(final String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Sets the language.
     *
     * @param language the new language
     */
    public void setLanguage(final String language) {
      this.language = language;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'log_id' => 'logId',
        'request_timestamp' => 'requestTimestamp',
        'response_timestamp' => 'responseTimestamp',
        'workspace_id' => 'workspaceId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Log ret = (Log) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for request
      Map<String, Object> requestMap = (Map<String, Object>) jsonMap.get('request');
      MessageRequest newRequest = (MessageRequest) new MessageRequest().deserialize(JSON.serialize(requestMap, true), requestMap, MessageRequest.class);
      ret.setRequest(newRequest);

      // calling custom deserializer for response
      Map<String, Object> responseMap = (Map<String, Object>) jsonMap.get('response');
      MessageResponse newResponse = (MessageResponse) new MessageResponse().deserialize(JSON.serialize(responseMap, true), responseMap, MessageResponse.class);
      ret.setResponse(newResponse);

      return ret;
    }
  }

  /**
   * LogCollection.
   */
  public class LogCollection extends IBMWatsonResponseModel {
    private List<Log> logs;
    private LogPagination pagination;

    /**
     * Gets the logs.
     *
     * An array of objects describing log events.
     *
     * @return the logs
     */
    @AuraEnabled
    public List<Log> getLogs() {
      return logs;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public LogPagination getPagination() {
      return pagination;
    }

    /**
     * Sets the logs.
     *
     * @param logs the new logs
     */
    public void setLogs(final List<Log> logs) {
      this.logs = logs;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final LogPagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      LogCollection ret = (LogCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for logs
      List<Log> newLogs = new List<Log>();
      List<Log> deserializedLogs = ret.getLogs();
      if (deserializedLogs != null) {
        for (Integer i = 0; i < deserializedLogs.size(); i++) {
          Log currentItem = ret.getLogs().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('logs');
          Log newItem = (Log) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Log.class);
          newLogs.add(newItem);
        }
        ret.logs = newLogs;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      LogPagination newPagination = (LogPagination) new LogPagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, LogPagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * Log message details.
   */
  public class LogMessage extends IBMWatsonGenericModel {
    private String level;
    private String msg;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public LogMessage() { }

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
     * Gets the msg.
     *
     * The text of the log message.
     *
     * @return the msg
     */
    @AuraEnabled
    public String getMsg() {
      return msg;
    }
  
    private LogMessage(LogMessageBuilder builder) {
      IBMWatsonValidator.notNull(builder.level, 'level cannot be null');
      IBMWatsonValidator.notNull(builder.msg, 'msg cannot be null');
      this.level = builder.level;
      this.msg = builder.msg;
    }

    /**
     * New builder.
     *
     * @return a LogMessage builder
     */
    public LogMessageBuilder newBuilder() {
      return new LogMessageBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      LogMessage ret = (LogMessage) super.deserialize(jsonString, jsonMap, classType);
      LogMessageBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * LogMessage Builder.
   */
  public class LogMessageBuilder {
    private String level;
    private String msg;

    private LogMessageBuilder(LogMessage logMessage) {
      this.level = logMessage.level;
      this.msg = logMessage.msg;
    }

    /**
     * Instantiates a new builder.
     */
    public LogMessageBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param level the level
     * @param msg the msg
     */
    public LogMessageBuilder(String level, String msg) {
      this.level = level;
      this.msg = msg;
    }

    /**
     * Builds a LogMessage.
     *
     * @return the logMessage
     */
    public LogMessage build() {
      return new LogMessage(this);
    }

    /**
     * Set the level.
     *
     * @param level the level
     * @return the LogMessage builder
     */
    public LogMessageBuilder level(String level) {
      this.level = level;
      return this;
    }

    /**
     * Set the msg.
     *
     * @param msg the msg
     * @return the LogMessage builder
     */
    public LogMessageBuilder msg(String msg) {
      this.msg = msg;
      return this;
    }
  }

  /**
   * The pagination data for the returned objects.
   */
  public class LogPagination extends IBMWatsonGenericModel {
    private String nextUrl;
    private Long matched;
    private String nextCursor;

    /**
     * Gets the nextUrl.
     *
     * The URL that will return the next page of results, if any.
     *
     * @return the nextUrl
     */
    @AuraEnabled
    public String getNextUrl() {
      return nextUrl;
    }

    /**
     * Gets the matched.
     *
     * Reserved for future use.
     *
     * @return the matched
     */
    @AuraEnabled
    public Long getMatched() {
      return matched;
    }

    /**
     * Gets the nextCursor.
     *
     * A token identifying the next page of results.
     *
     * @return the nextCursor
     */
    @AuraEnabled
    public String getNextCursor() {
      return nextCursor;
    }

    /**
     * Sets the nextUrl.
     *
     * @param nextUrl the new nextUrl
     */
    public void setNextUrl(final String nextUrl) {
      this.nextUrl = nextUrl;
    }

    /**
     * Sets the matched.
     *
     * @param matched the new matched
     */
    public void setMatched(final long matched) {
      this.matched = matched;
    }

    /**
     * Sets the nextCursor.
     *
     * @param nextCursor the new nextCursor
     */
    public void setNextCursor(final String nextCursor) {
      this.nextCursor = nextCursor;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'next_url' => 'nextUrl',
        'next_cursor' => 'nextCursor'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      LogPagination ret = (LogPagination) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A mention of a contextual entity.
   */
  public class Mention extends IBMWatsonGenericModel {
    private String entity;
    private List<Long> location;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Mention() { }

    /**
     * Gets the entity.
     *
     * The name of the entity.
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
     * An array of zero-based character offsets that indicate where the entity mentions begin and end in the input text.
     *
     * @return the location
     */
    @AuraEnabled
    public List<Long> getLocation() {
      return location;
    }
  
    private Mention(MentionBuilder builder) {
      IBMWatsonValidator.notNull(builder.entity, 'entity cannot be null');
      IBMWatsonValidator.notNull(builder.location, 'location cannot be null');
      this.entity = builder.entity;
      this.location = builder.location;
    }

    /**
     * New builder.
     *
     * @return a Mention builder
     */
    public MentionBuilder newBuilder() {
      return new MentionBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Mention ret = (Mention) super.deserialize(jsonString, jsonMap, classType);
      MentionBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * Mention Builder.
   */
  public class MentionBuilder {
    private String entity;
    private List<Long> location;

    private MentionBuilder(Mention mention) {
      this.entity = mention.entity;
      this.location = mention.location;
    }

    /**
     * Instantiates a new builder.
     */
    public MentionBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param entity the entity
     * @param location the location
     */
    public MentionBuilder(String entity, List<Long> location) {
      this.entity = entity;
      this.location = location;
    }

    /**
     * Builds a Mention.
     *
     * @return the mention
     */
    public Mention build() {
      return new Mention(this);
    }

    /**
     * Adds an location to location.
     *
     * @param location the new location
     * @return the Mention builder
     */
    public MentionBuilder addLocation(Long location) {
      IBMWatsonValidator.notNull(location, 'location cannot be null');
      if (this.location == null) {
        this.location = new List<Long>();
      }
      this.location.add(location);
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the Mention builder
     */
    public MentionBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the location.
     * Existing location will be replaced.
     *
     * @param location the location
     * @return the Mention builder
     */
    public MentionBuilder location(List<Long> location) {
      this.location = location;
      return this;
    }
  }

  /**
   * Metadata related to the message.
   */
  public class MessageContextMetadata extends IBMWatsonGenericModel {
    private String deployment;
    private String userId;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageContextMetadata() { }

    /**
     * Gets the deployment.
     *
     * A label identifying the deployment environment, used for filtering log data. This string cannot contain carriage
     * return, newline, or tab characters.
     *
     * @return the deployment
     */
    @AuraEnabled
    public String getDeployment() {
      return deployment;
    }

    /**
     * Gets the userId.
     *
     * A string value that identifies the user who is interacting with the workspace. The client must provide a unique
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
  
    private MessageContextMetadata(MessageContextMetadataBuilder builder) {
      this.deployment = builder.deployment;
      this.userId = builder.userId;
    }

    /**
     * New builder.
     *
     * @return a MessageContextMetadata builder
     */
    public MessageContextMetadataBuilder newBuilder() {
      return new MessageContextMetadataBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'user_id' => 'userId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageContextMetadata ret = (MessageContextMetadata) super.deserialize(jsonString, jsonMap, classType);
      MessageContextMetadataBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'userId' => 'user_id'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * MessageContextMetadata Builder.
   */
  public class MessageContextMetadataBuilder {
    private String deployment;
    private String userId;

    private MessageContextMetadataBuilder(MessageContextMetadata messageContextMetadata) {
      this.deployment = messageContextMetadata.deployment;
      this.userId = messageContextMetadata.userId;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageContextMetadataBuilder() {
    }

    /**
     * Builds a MessageContextMetadata.
     *
     * @return the messageContextMetadata
     */
    public MessageContextMetadata build() {
      return new MessageContextMetadata(this);
    }

    /**
     * Set the deployment.
     *
     * @param deployment the deployment
     * @return the MessageContextMetadata builder
     */
    public MessageContextMetadataBuilder deployment(String deployment) {
      this.deployment = deployment;
      return this;
    }

    /**
     * Set the userId.
     *
     * @param userId the userId
     * @return the MessageContextMetadata builder
     */
    public MessageContextMetadataBuilder userId(String userId) {
      this.userId = userId;
      return this;
    }
  }

  /**
   * An input object that includes the input text.
   */
  public class MessageInput extends IBMWatsonDynamicModel {
    private String text;
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageInput() { }

    /**
     * Gets the text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the dynamic properties attached to MessageInput.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private MessageInput(MessageInputBuilder builder) {
      this.text = builder.text;
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

      MessageInput ret = (MessageInput) super.deserialize(jsonString, jsonMap, classType);
      MessageInputBuilder retBuilder = ret.newBuilder();

      MessageInput builderResult = retBuilder.build();
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
   * MessageInput Builder.
   */
  public class MessageInputBuilder {
    private String text;

    private MessageInputBuilder(MessageInput messageInput) {
      this.text = messageInput.text;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageInputBuilder() { }

    /**
     * Builds a MessageInput.
     *
     * @return the messageInput
     */
    public MessageInput build() {
      return new MessageInput(this);
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
  }

  /**
   * The message options.
   */
  public class MessageOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private Boolean alternateIntents;
    private Context context;
    private OutputData output;
    private Boolean nodesVisitedDetails;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
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
     * Gets the intents.
     *
     * Intents to use when evaluating the user input. Include intents from the previous response to continue using those
     * intents rather than trying to recognize intents in the new input.
     *
     * @return the intents
     */
    public List<RuntimeIntent> intents() {
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
    public List<RuntimeEntity> entities() {
      return entities;
    }

    /**
     * Gets the alternateIntents.
     *
     * Whether to return more than one intent. A value of `true` indicates that all matching intents are returned.
     *
     * @return the alternateIntents
     */
    public Boolean alternateIntents() {
      return alternateIntents;
    }

    /**
     * Gets the context.
     *
     * State information for the conversation. To maintain state, include the context from the previous response.
     *
     * @return the context
     */
    public Context context() {
      return context;
    }

    /**
     * Gets the output.
     *
     * An output object that includes the response to the user, the dialog nodes that were triggered, and messages from
     * the log.
     *
     * @return the output
     */
    public OutputData output() {
      return output;
    }

    /**
     * Gets the nodesVisitedDetails.
     *
     * Whether to include additional diagnostic information about the dialog nodes that were visited during processing
     * of the message.
     *
     * @return the nodesVisitedDetails
     */
    public Boolean nodesVisitedDetails() {
      return nodesVisitedDetails;
    }

    private MessageOptions(MessageOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      input = builder.input;
      intents = builder.intents;
      entities = builder.entities;
      alternateIntents = builder.alternateIntents;
      context = builder.context;
      output = builder.output;
      nodesVisitedDetails = builder.nodesVisitedDetails;
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
    private String workspaceId;
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private Boolean alternateIntents;
    private Context context;
    private OutputData output;
    private Boolean nodesVisitedDetails;

    private MessageOptionsBuilder(MessageOptions messageOptions) {
      workspaceId = messageOptions.workspaceId;
      input = messageOptions.input;
      intents = messageOptions.intents;
      entities = messageOptions.entities;
      alternateIntents = messageOptions.alternateIntents;
      context = messageOptions.context;
      output = messageOptions.output;
      nodesVisitedDetails = messageOptions.nodesVisitedDetails;
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
     * @param workspaceId the workspaceId
     */
    public MessageOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
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
     * Adds an intents to intents.
     *
     * @param intents the new intents
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder addIntents(RuntimeIntent intents) {
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
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder addEntities(RuntimeEntity entities) {
      IBMWatsonValidator.notNull(entities, 'entities cannot be null');
      if (this.entities == null) {
        this.entities = new List<RuntimeEntity>();
      }
      this.entities.add(entities);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
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
     * Set the intents.
     * Existing intents will be replaced.
     *
     * @param intents the intents
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder intents(List<RuntimeIntent> intents) {
      this.intents = intents;
      return this;
    }

    /**
     * Set the entities.
     * Existing entities will be replaced.
     *
     * @param entities the entities
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder entities(List<RuntimeEntity> entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the alternateIntents.
     *
     * @param alternateIntents the alternateIntents
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder alternateIntents(Boolean alternateIntents) {
      this.alternateIntents = alternateIntents;
      return this;
    }

    /**
     * Set the context.
     *
     * @param context the context
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder context(Context context) {
      this.context = context;
      return this;
    }

    /**
     * Set the output.
     *
     * @param output the output
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder output(OutputData output) {
      this.output = output;
      return this;
    }

    /**
     * Set the nodesVisitedDetails.
     *
     * @param nodesVisitedDetails the nodesVisitedDetails
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder nodesVisitedDetails(Boolean nodesVisitedDetails) {
      this.nodesVisitedDetails = nodesVisitedDetails;
      return this;
    }

    /**
     * Set the messageRequest.
     *
     * @param messageRequest the messageRequest
     * @return the MessageOptions builder
     */
    public MessageOptionsBuilder messageRequest(MessageRequest messageRequest) {
      this.input = messageRequest.getInput();
      this.intents = messageRequest.getIntents();
      this.entities = messageRequest.getEntities();
      this.alternateIntents = messageRequest.getAlternateIntents();
      this.context = messageRequest.getContext();
      this.output = messageRequest.getOutput();
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
   * A request sent to the workspace, including the user input and context.
   */
  public class MessageRequest extends IBMWatsonGenericModel {
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private Boolean alternateIntents;
    private Context context;
    private OutputData output;
    private List<DialogNodeAction> actions;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public MessageRequest() { }

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
     * Gets the alternateIntents.
     *
     * Whether to return more than one intent. A value of `true` indicates that all matching intents are returned.
     *
     * @return the alternateIntents
     */
    @AuraEnabled
    public Boolean getAlternateIntents() {
      return alternateIntents;
    }

    /**
     * Gets the context.
     *
     * State information for the conversation. To maintain state, include the context from the previous response.
     *
     * @return the context
     */
    @AuraEnabled
    public Context getContext() {
      return context;
    }

    /**
     * Gets the output.
     *
     * An output object that includes the response to the user, the dialog nodes that were triggered, and messages from
     * the log.
     *
     * @return the output
     */
    @AuraEnabled
    public OutputData getOutput() {
      return output;
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
  
    private MessageRequest(MessageRequestBuilder builder) {
      this.input = builder.input;
      this.intents = builder.intents;
      this.entities = builder.entities;
      this.alternateIntents = builder.alternateIntents;
      this.context = builder.context;
      this.output = builder.output;
      this.actions = builder.actions;
    }

    /**
     * New builder.
     *
     * @return a MessageRequest builder
     */
    public MessageRequestBuilder newBuilder() {
      return new MessageRequestBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'alternate_intents' => 'alternateIntents'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageRequest ret = (MessageRequest) super.deserialize(jsonString, jsonMap, classType);
      MessageRequestBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for input
      Map<String, Object> inputMap = (Map<String, Object>) jsonMap.get('input');
      MessageInput newInput = (MessageInput) new MessageInput().deserialize(JSON.serialize(inputMap, true), inputMap, MessageInput.class);
      retBuilder.input(newInput);

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

      // calling custom deserializer for context
      Map<String, Object> contextMap = (Map<String, Object>) jsonMap.get('context');
      Context newContext = (Context) new Context().deserialize(JSON.serialize(contextMap, true), contextMap, Context.class);
      retBuilder.context(newContext);

      // calling custom deserializer for output
      Map<String, Object> outputMap = (Map<String, Object>) jsonMap.get('output');
      OutputData newOutput = (OutputData) new OutputData().deserialize(JSON.serialize(outputMap, true), outputMap, OutputData.class);
      retBuilder.output(newOutput);

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
        retBuilder.actions(newActions);
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
        'alternateIntents' => 'alternate_intents'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for input
      if (input != null) {
        String inputJsonString = JSON.serialize(input.replacePropertyNames(), true);
        String inputKey = 'input';
        if (propertyNameMapping.containsKey(inputKey)) {
          inputKey = propertyNameMapping.get(inputKey);
        }
        jsonMap.put(inputKey, JSON.deserializeUntyped(inputJsonString));
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

      // performing custom serialization for context
      if (context != null) {
        String contextJsonString = JSON.serialize(context.replacePropertyNames(), true);
        String contextKey = 'context';
        if (propertyNameMapping.containsKey(contextKey)) {
          contextKey = propertyNameMapping.get(contextKey);
        }
        jsonMap.put(contextKey, JSON.deserializeUntyped(contextJsonString));
      }

      // performing custom serialization for output
      if (output != null) {
        String outputJsonString = JSON.serialize(output.replacePropertyNames(), true);
        String outputKey = 'output';
        if (propertyNameMapping.containsKey(outputKey)) {
          outputKey = propertyNameMapping.get(outputKey);
        }
        jsonMap.put(outputKey, JSON.deserializeUntyped(outputJsonString));
      }

      // performing custom serialization for actions
      if (actions != null) {
        List<Object> actionsJsonList = new List<Object>();
        for (DialogNodeAction listItem : actions) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          actionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String actionsKey = 'actions';
        if (propertyNameMapping.containsKey(actionsKey)) {
          actionsKey = propertyNameMapping.get(actionsKey);
        }
        jsonMap.put(actionsKey, actionsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * MessageRequest Builder.
   */
  public class MessageRequestBuilder {
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private Boolean alternateIntents;
    private Context context;
    private OutputData output;
    private List<DialogNodeAction> actions;

    private MessageRequestBuilder(MessageRequest messageRequest) {
      this.input = messageRequest.input;
      this.intents = messageRequest.intents;
      this.entities = messageRequest.entities;
      this.alternateIntents = messageRequest.alternateIntents;
      this.context = messageRequest.context;
      this.output = messageRequest.output;
      this.actions = messageRequest.actions;
    }

    /**
     * Instantiates a new builder.
     */
    public MessageRequestBuilder() {
    }

    /**
     * Builds a MessageRequest.
     *
     * @return the messageRequest
     */
    public MessageRequest build() {
      return new MessageRequest(this);
    }

    /**
     * Adds an intents to intents.
     *
     * @param intents the new intents
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder addIntents(RuntimeIntent intents) {
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
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder addEntities(RuntimeEntity entities) {
      IBMWatsonValidator.notNull(entities, 'entities cannot be null');
      if (this.entities == null) {
        this.entities = new List<RuntimeEntity>();
      }
      this.entities.add(entities);
      return this;
    }

    /**
     * Adds an actions to actions.
     *
     * @param actions the new actions
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder addActions(DialogNodeAction actions) {
      IBMWatsonValidator.notNull(actions, 'actions cannot be null');
      if (this.actions == null) {
        this.actions = new List<DialogNodeAction>();
      }
      this.actions.add(actions);
      return this;
    }

    /**
     * Set the input.
     *
     * @param input the input
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder input(MessageInput input) {
      this.input = input;
      return this;
    }

    /**
     * Set the intents.
     * Existing intents will be replaced.
     *
     * @param intents the intents
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder intents(List<RuntimeIntent> intents) {
      this.intents = intents;
      return this;
    }

    /**
     * Set the entities.
     * Existing entities will be replaced.
     *
     * @param entities the entities
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder entities(List<RuntimeEntity> entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the alternateIntents.
     *
     * @param alternateIntents the alternateIntents
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder alternateIntents(Boolean alternateIntents) {
      this.alternateIntents = alternateIntents;
      return this;
    }

    /**
     * Set the context.
     *
     * @param context the context
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder context(Context context) {
      this.context = context;
      return this;
    }

    /**
     * Set the output.
     *
     * @param output the output
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder output(OutputData output) {
      this.output = output;
      return this;
    }

    /**
     * Set the actions.
     * Existing actions will be replaced.
     *
     * @param actions the actions
     * @return the MessageRequest builder
     */
    public MessageRequestBuilder actions(List<DialogNodeAction> actions) {
      this.actions = actions;
      return this;
    }
  }

  /**
   * The response sent by the workspace, including the output text, detected intents and entities, and context.
   */
  public class MessageResponse extends IBMWatsonResponseModel {
    private MessageInput input;
    private List<RuntimeIntent> intents;
    private List<RuntimeEntity> entities;
    private Boolean alternateIntents;
    private Context context;
    private OutputData output;
    private List<DialogNodeAction> actions;

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
     * Gets the alternateIntents.
     *
     * Whether to return more than one intent. A value of `true` indicates that all matching intents are returned.
     *
     * @return the alternateIntents
     */
    @AuraEnabled
    public Boolean getAlternateIntents() {
      return alternateIntents;
    }

    /**
     * Gets the context.
     *
     * State information for the conversation. To maintain state, include the context from the previous response.
     *
     * @return the context
     */
    @AuraEnabled
    public Context getContext() {
      return context;
    }

    /**
     * Gets the output.
     *
     * An output object that includes the response to the user, the dialog nodes that were triggered, and messages from
     * the log.
     *
     * @return the output
     */
    @AuraEnabled
    public OutputData getOutput() {
      return output;
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
     * Sets the input.
     *
     * @param input the new input
     */
    public void setInput(final MessageInput input) {
      this.input = input;
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
     * Sets the alternateIntents.
     *
     * @param alternateIntents the new alternateIntents
     */
    public void setAlternateIntents(final Boolean alternateIntents) {
      this.alternateIntents = alternateIntents;
    }

    /**
     * Sets the context.
     *
     * @param context the new context
     */
    public void setContext(final Context context) {
      this.context = context;
    }

    /**
     * Sets the output.
     *
     * @param output the new output
     */
    public void setOutput(final OutputData output) {
      this.output = output;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'alternate_intents' => 'alternateIntents'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MessageResponse ret = (MessageResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for input
      Map<String, Object> inputMap = (Map<String, Object>) jsonMap.get('input');
      MessageInput newInput = (MessageInput) new MessageInput().deserialize(JSON.serialize(inputMap, true), inputMap, MessageInput.class);
      ret.setInput(newInput);

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

      // calling custom deserializer for context
      Map<String, Object> contextMap = (Map<String, Object>) jsonMap.get('context');
      Context newContext = (Context) new Context().deserialize(JSON.serialize(contextMap, true), contextMap, Context.class);
      ret.setContext(newContext);

      // calling custom deserializer for output
      Map<String, Object> outputMap = (Map<String, Object>) jsonMap.get('output');
      OutputData newOutput = (OutputData) new OutputData().deserialize(JSON.serialize(outputMap, true), outputMap, OutputData.class);
      ret.setOutput(newOutput);

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

      return ret;
    }
  }

  /**
   * An output object that includes the response to the user, the dialog nodes that were triggered, and messages from the log.
   */
  public class OutputData extends IBMWatsonDynamicModel {
    private List<String> nodesVisited;
    private List<DialogNodeVisitedDetails> nodesVisitedDetails;
    private List<LogMessage> logMessages;
    private List<String> text;
    private List<RuntimeResponseGeneric> generic;
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public OutputData() { }

    /**
     * Gets the nodesVisited.
     *
     * @return the nodesVisited
     */
    @AuraEnabled
    public List<String> getNodesVisited() {
      return nodesVisited;
    }

    /**
     * Gets the nodesVisitedDetails.
     *
     * @return the nodesVisitedDetails
     */
    @AuraEnabled
    public List<DialogNodeVisitedDetails> getNodesVisitedDetails() {
      return nodesVisitedDetails;
    }

    /**
     * Gets the logMessages.
     *
     * @return the logMessages
     */
    @AuraEnabled
    public List<LogMessage> getLogMessages() {
      return logMessages;
    }

    /**
     * Gets the text.
     *
     * @return the text
     */
    @AuraEnabled
    public List<String> getText() {
      return text;
    }

    /**
     * Gets the generic.
     *
     * @return the generic
     */
    @AuraEnabled
    public List<RuntimeResponseGeneric> getGeneric() {
      return generic;
    }

    /**
     * Gets the dynamic properties attached to OutputData.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private OutputData(OutputDataBuilder builder) {
      IBMWatsonValidator.notNull(builder.logMessages, 'logMessages cannot be null');
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      this.nodesVisited = builder.nodesVisited;
      this.nodesVisitedDetails = builder.nodesVisitedDetails;
      this.logMessages = builder.logMessages;
      this.text = builder.text;
      this.generic = builder.generic;
    }

    /**
     * New builder.
     *
     * @return a OutputData builder
     */
    public OutputDataBuilder newBuilder() {
      return new OutputDataBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'nodes_visited' => 'nodesVisited',
        'nodes_visited_details' => 'nodesVisitedDetails',
        'log_messages' => 'logMessages'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      OutputData ret = (OutputData) super.deserialize(jsonString, jsonMap, classType);
      OutputDataBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for nodesVisitedDetails
      List<DialogNodeVisitedDetails> newNodesVisitedDetails = new List<DialogNodeVisitedDetails>();
      List<DialogNodeVisitedDetails> deserializedNodesVisitedDetails = ret.getNodesVisitedDetails();
      if (deserializedNodesVisitedDetails != null) {
        for (Integer i = 0; i < deserializedNodesVisitedDetails.size(); i++) {
          DialogNodeVisitedDetails currentItem = ret.getNodesVisitedDetails().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('nodesVisitedDetails');
          DialogNodeVisitedDetails newItem = (DialogNodeVisitedDetails) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNodeVisitedDetails.class);
          newNodesVisitedDetails.add(newItem);
        }
        retBuilder.nodesVisitedDetails(newNodesVisitedDetails);
      }

      // calling custom deserializer for logMessages
      List<LogMessage> newLogMessages = new List<LogMessage>();
      List<LogMessage> deserializedLogMessages = ret.getLogMessages();
      if (deserializedLogMessages != null) {
        for (Integer i = 0; i < deserializedLogMessages.size(); i++) {
          LogMessage currentItem = ret.getLogMessages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('logMessages');
          LogMessage newItem = (LogMessage) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), LogMessage.class);
          newLogMessages.add(newItem);
        }
        retBuilder.logMessages(newLogMessages);
      }

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
        retBuilder.generic(newGeneric);
      }

      OutputData builderResult = retBuilder.build();
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

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'nodesVisited' => 'nodes_visited',
        'nodesVisitedDetails' => 'nodes_visited_details',
        'logMessages' => 'log_messages'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.raiseAdditionalProperties(jsonMap);

      // performing custom serialization for nodesVisitedDetails
      if (nodesVisitedDetails != null) {
        List<Object> nodesVisitedDetailsJsonList = new List<Object>();
        for (DialogNodeVisitedDetails listItem : nodesVisitedDetails) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          nodesVisitedDetailsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String nodesVisitedDetailsKey = 'nodesVisitedDetails';
        if (propertyNameMapping.containsKey(nodesVisitedDetailsKey)) {
          nodesVisitedDetailsKey = propertyNameMapping.get(nodesVisitedDetailsKey);
        }
        jsonMap.put(nodesVisitedDetailsKey, nodesVisitedDetailsJsonList);
      }

      // performing custom serialization for logMessages
      if (logMessages != null) {
        List<Object> logMessagesJsonList = new List<Object>();
        for (LogMessage listItem : logMessages) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          logMessagesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String logMessagesKey = 'logMessages';
        if (propertyNameMapping.containsKey(logMessagesKey)) {
          logMessagesKey = propertyNameMapping.get(logMessagesKey);
        }
        jsonMap.put(logMessagesKey, logMessagesJsonList);
      }

      // performing custom serialization for generic
      if (generic != null) {
        List<Object> genericJsonList = new List<Object>();
        for (RuntimeResponseGeneric listItem : generic) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          genericJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String genericKey = 'generic';
        if (propertyNameMapping.containsKey(genericKey)) {
          genericKey = propertyNameMapping.get(genericKey);
        }
        jsonMap.put(genericKey, genericJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * OutputData Builder.
   */
  public class OutputDataBuilder {
    private List<String> nodesVisited;
    private List<DialogNodeVisitedDetails> nodesVisitedDetails;
    private List<LogMessage> logMessages;
    private List<String> text;
    private List<RuntimeResponseGeneric> generic;

    private OutputDataBuilder(OutputData outputData) {
      this.nodesVisited = outputData.nodesVisited;
      this.nodesVisitedDetails = outputData.nodesVisitedDetails;
      this.logMessages = outputData.logMessages;
      this.text = outputData.text;
      this.generic = outputData.generic;
    }

    /**
     * Instantiates a new builder.
     */
    public OutputDataBuilder() { }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param logMessages the logMessages
     * @param text the text
     */
    public OutputDataBuilder(List<LogMessage> logMessages, List<String> text) {
      this.logMessages = logMessages;
      this.text = text;
    }

    /**
     * Builds a OutputData.
     *
     * @return the outputData
     */
    public OutputData build() {
      return new OutputData(this);
    }

    /**
     * Adds an nodesVisited to nodesVisited.
     *
     * @param nodesVisited the new nodesVisited
     * @return the OutputData builder
     */
    public OutputDataBuilder addNodesVisited(String nodesVisited) {
      IBMWatsonValidator.notNull(nodesVisited, 'nodesVisited cannot be null');
      if (this.nodesVisited == null) {
        this.nodesVisited = new List<String>();
      }
      this.nodesVisited.add(nodesVisited);
      return this;
    }

    /**
     * Adds an nodesVisitedDetails to nodesVisitedDetails.
     *
     * @param nodesVisitedDetails the new nodesVisitedDetails
     * @return the OutputData builder
     */
    public OutputDataBuilder addNodesVisitedDetails(DialogNodeVisitedDetails nodesVisitedDetails) {
      IBMWatsonValidator.notNull(nodesVisitedDetails, 'nodesVisitedDetails cannot be null');
      if (this.nodesVisitedDetails == null) {
        this.nodesVisitedDetails = new List<DialogNodeVisitedDetails>();
      }
      this.nodesVisitedDetails.add(nodesVisitedDetails);
      return this;
    }

    /**
     * Adds an logMessages to logMessages.
     *
     * @param logMessages the new logMessages
     * @return the OutputData builder
     */
    public OutputDataBuilder addLogMessages(LogMessage logMessages) {
      IBMWatsonValidator.notNull(logMessages, 'logMessages cannot be null');
      if (this.logMessages == null) {
        this.logMessages = new List<LogMessage>();
      }
      this.logMessages.add(logMessages);
      return this;
    }

    /**
     * Adds an text to text.
     *
     * @param text the new text
     * @return the OutputData builder
     */
    public OutputDataBuilder addText(String text) {
      IBMWatsonValidator.notNull(text, 'text cannot be null');
      if (this.text == null) {
        this.text = new List<String>();
      }
      this.text.add(text);
      return this;
    }

    /**
     * Adds an generic to generic.
     *
     * @param generic the new generic
     * @return the OutputData builder
     */
    public OutputDataBuilder addGeneric(RuntimeResponseGeneric generic) {
      IBMWatsonValidator.notNull(generic, 'generic cannot be null');
      if (this.generic == null) {
        this.generic = new List<RuntimeResponseGeneric>();
      }
      this.generic.add(generic);
      return this;
    }

    /**
     * Set the nodesVisited.
     * Existing nodesVisited will be replaced.
     *
     * @param nodesVisited the nodesVisited
     * @return the OutputData builder
     */
    public OutputDataBuilder nodesVisited(List<String> nodesVisited) {
      this.nodesVisited = nodesVisited;
      return this;
    }

    /**
     * Set the nodesVisitedDetails.
     * Existing nodesVisitedDetails will be replaced.
     *
     * @param nodesVisitedDetails the nodesVisitedDetails
     * @return the OutputData builder
     */
    public OutputDataBuilder nodesVisitedDetails(List<DialogNodeVisitedDetails> nodesVisitedDetails) {
      this.nodesVisitedDetails = nodesVisitedDetails;
      return this;
    }

    /**
     * Set the logMessages.
     * Existing logMessages will be replaced.
     *
     * @param logMessages the logMessages
     * @return the OutputData builder
     */
    public OutputDataBuilder logMessages(List<LogMessage> logMessages) {
      this.logMessages = logMessages;
      return this;
    }

    /**
     * Set the text.
     * Existing text will be replaced.
     *
     * @param text the text
     * @return the OutputData builder
     */
    public OutputDataBuilder text(List<String> text) {
      this.text = text;
      return this;
    }

    /**
     * Set the generic.
     * Existing generic will be replaced.
     *
     * @param generic the generic
     * @return the OutputData builder
     */
    public OutputDataBuilder generic(List<RuntimeResponseGeneric> generic) {
      this.generic = generic;
      return this;
    }
  }

  /**
   * The pagination data for the returned objects.
   */
  public class Pagination extends IBMWatsonGenericModel {
    private String refreshUrl;
    private String nextUrl;
    private Long total;
    private Long matched;
    private String refreshCursor;
    private String nextCursor;

    /**
     * Gets the refreshUrl.
     *
     * The URL that will return the same page of results.
     *
     * @return the refreshUrl
     */
    @AuraEnabled
    public String getRefreshUrl() {
      return refreshUrl;
    }

    /**
     * Gets the nextUrl.
     *
     * The URL that will return the next page of results.
     *
     * @return the nextUrl
     */
    @AuraEnabled
    public String getNextUrl() {
      return nextUrl;
    }

    /**
     * Gets the total.
     *
     * Reserved for future use.
     *
     * @return the total
     */
    @AuraEnabled
    public Long getTotal() {
      return total;
    }

    /**
     * Gets the matched.
     *
     * Reserved for future use.
     *
     * @return the matched
     */
    @AuraEnabled
    public Long getMatched() {
      return matched;
    }

    /**
     * Gets the refreshCursor.
     *
     * A token identifying the current page of results.
     *
     * @return the refreshCursor
     */
    @AuraEnabled
    public String getRefreshCursor() {
      return refreshCursor;
    }

    /**
     * Gets the nextCursor.
     *
     * A token identifying the next page of results.
     *
     * @return the nextCursor
     */
    @AuraEnabled
    public String getNextCursor() {
      return nextCursor;
    }

    /**
     * Sets the refreshUrl.
     *
     * @param refreshUrl the new refreshUrl
     */
    public void setRefreshUrl(final String refreshUrl) {
      this.refreshUrl = refreshUrl;
    }

    /**
     * Sets the nextUrl.
     *
     * @param nextUrl the new nextUrl
     */
    public void setNextUrl(final String nextUrl) {
      this.nextUrl = nextUrl;
    }

    /**
     * Sets the total.
     *
     * @param total the new total
     */
    public void setTotal(final long total) {
      this.total = total;
    }

    /**
     * Sets the matched.
     *
     * @param matched the new matched
     */
    public void setMatched(final long matched) {
      this.matched = matched;
    }

    /**
     * Sets the refreshCursor.
     *
     * @param refreshCursor the new refreshCursor
     */
    public void setRefreshCursor(final String refreshCursor) {
      this.refreshCursor = refreshCursor;
    }

    /**
     * Sets the nextCursor.
     *
     * @param nextCursor the new nextCursor
     */
    public void setNextCursor(final String nextCursor) {
      this.nextCursor = nextCursor;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'refresh_url' => 'refreshUrl',
        'next_url' => 'nextUrl',
        'refresh_cursor' => 'refreshCursor',
        'next_cursor' => 'nextCursor'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Pagination ret = (Pagination) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A term from the request that was identified as an entity.
   */
  public class RuntimeEntity extends IBMWatsonGenericModel {
    private String entity;
    private List<Long> location;
    private String value;
    private Double confidence;
    private IBMWatsonMapModel metadata;
    private List<CaptureGroup> groups;
    private RuntimeEntityInterpretation interpretation;
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
     * included only if the new system entities are enabled for the workspace.
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
     * Gets the role.
     *
     * An object describing the role played by a system entity that is specifies the beginning or end of a range
     * recognized in the user input. This property is included only if the new system entities are enabled for the
     * workspace.
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
    private RuntimeEntityRole role;

    private RuntimeEntityBuilder(RuntimeEntity runtimeEntity) {
      this.entity = runtimeEntity.entity;
      this.location = runtimeEntity.location;
      this.value = runtimeEntity.value;
      this.confidence = runtimeEntity.confidence;
      this.metadata = runtimeEntity.metadata;
      this.groups = runtimeEntity.groups;
      this.interpretation = runtimeEntity.interpretation;
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
   * recognized in the user input. This property is included only if the new system entities are enabled for the
   * workspace.
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
    private String dialogNode;
    private List<DialogSuggestion> suggestions;

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
     * Plus and Premium users.
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
     * Gets the dialogNode.
     *
     * The ID of the dialog node that the **topic** property is taken from. The **topic** property is populated using
     * the value of the dialog node's **user_label** property.
     *
     * @return the dialogNode
     */
    @AuraEnabled
    public String getDialogNode() {
      return dialogNode;
    }

    /**
     * Gets the suggestions.
     *
     * An array of objects describing the possible matching dialog nodes from which the user can choose.
     *
     * **Note:** The **suggestions** property is part of the disambiguation feature, which is only available for Plus
     * and Premium users.
     *
     * @return the suggestions
     */
    @AuraEnabled
    public List<DialogSuggestion> getSuggestions() {
      return suggestions;
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
      this.dialogNode = builder.dialogNode;
      this.suggestions = builder.suggestions;
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
        'message_to_human_agent' => 'messageToHumanAgent',
        'dialog_node' => 'dialogNode'
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

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'responseType' => 'response_type',
        'xTime' => 'time',
        'messageToHumanAgent' => 'message_to_human_agent',
        'dialogNode' => 'dialog_node'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for options
      if (options != null) {
        List<Object> optionsJsonList = new List<Object>();
        for (DialogNodeOutputOptionsElement listItem : options) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          optionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String optionsKey = 'options';
        if (propertyNameMapping.containsKey(optionsKey)) {
          optionsKey = propertyNameMapping.get(optionsKey);
        }
        jsonMap.put(optionsKey, optionsJsonList);
      }

      // performing custom serialization for suggestions
      if (suggestions != null) {
        List<Object> suggestionsJsonList = new List<Object>();
        for (DialogSuggestion listItem : suggestions) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          suggestionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String suggestionsKey = 'suggestions';
        if (propertyNameMapping.containsKey(suggestionsKey)) {
          suggestionsKey = propertyNameMapping.get(suggestionsKey);
        }
        jsonMap.put(suggestionsKey, suggestionsJsonList);
      }

      return jsonMap;
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
    private String dialogNode;
    private List<DialogSuggestion> suggestions;

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
      this.dialogNode = runtimeResponseGeneric.dialogNode;
      this.suggestions = runtimeResponseGeneric.suggestions;
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
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the RuntimeResponseGeneric builder
     */
    public RuntimeResponseGenericBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
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
  }

  /**
   * Synonym.
   */
  public class Synonym extends IBMWatsonResponseModel {
    private String synonym;
    private Datetime created;
    private Datetime updated;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Synonym() { }

    /**
     * Gets the synonym.
     *
     * The text of the synonym. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the synonym
     */
    @AuraEnabled
    public String getSynonym() {
      return synonym;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }
  
    private Synonym(SynonymBuilder builder) {
      IBMWatsonValidator.notNull(builder.synonym, 'synonym cannot be null');
      this.synonym = builder.synonym;
      this.created = builder.created;
      this.updated = builder.updated;
    }

    /**
     * New builder.
     *
     * @return a Synonym builder
     */
    public SynonymBuilder newBuilder() {
      return new SynonymBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Synonym ret = (Synonym) super.deserialize(jsonString, jsonMap, classType);
      SynonymBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * Synonym Builder.
   */
  public class SynonymBuilder {
    private String synonym;
    private Datetime created;
    private Datetime updated;

    private SynonymBuilder(Synonym synonym) {
      this.synonym = synonym.synonym;
      this.created = synonym.created;
      this.updated = synonym.updated;
    }

    /**
     * Instantiates a new builder.
     */
    public SynonymBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param synonym the synonym
     */
    public SynonymBuilder(String synonym) {
      this.synonym = synonym;
    }

    /**
     * Builds a Synonym.
     *
     * @return the synonym
     */
    public Synonym build() {
      return new Synonym(this);
    }

    /**
     * Set the synonym.
     *
     * @param synonym the synonym
     * @return the Synonym builder
     */
    public SynonymBuilder synonym(String synonym) {
      this.synonym = synonym;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the Synonym builder
     */
    public SynonymBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the Synonym builder
     */
    public SynonymBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }
  }

  /**
   * SynonymCollection.
   */
  public class SynonymCollection extends IBMWatsonResponseModel {
    private List<Synonym> synonyms;
    private Pagination pagination;

    /**
     * Gets the synonyms.
     *
     * An array of synonyms.
     *
     * @return the synonyms
     */
    @AuraEnabled
    public List<Synonym> getSynonyms() {
      return synonyms;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the synonyms.
     *
     * @param synonyms the new synonyms
     */
    public void setSynonyms(final List<Synonym> synonyms) {
      this.synonyms = synonyms;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SynonymCollection ret = (SynonymCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for synonyms
      List<Synonym> newSynonyms = new List<Synonym>();
      List<Synonym> deserializedSynonyms = ret.getSynonyms();
      if (deserializedSynonyms != null) {
        for (Integer i = 0; i < deserializedSynonyms.size(); i++) {
          Synonym currentItem = ret.getSynonyms().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('synonyms');
          Synonym newItem = (Synonym) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Synonym.class);
          newSynonyms.add(newItem);
        }
        ret.synonyms = newSynonyms;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * For internal use only.
   */
  public class SystemResponse extends IBMWatsonDynamicModel {
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SystemResponse() { }

    /**
     * Gets the dynamic properties attached to SystemResponse.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private SystemResponse(SystemResponseBuilder builder) {
    }

    /**
     * New builder.
     *
     * @return a SystemResponse builder
     */
    public SystemResponseBuilder newBuilder() {
      return new SystemResponseBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SystemResponse ret = (SystemResponse) super.deserialize(jsonString, jsonMap, classType);
      SystemResponseBuilder retBuilder = ret.newBuilder();

      SystemResponse builderResult = retBuilder.build();
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
   * SystemResponse Builder.
   */
  public class SystemResponseBuilder {

    private SystemResponseBuilder(SystemResponse systemResponse) {
    }

    /**
     * Instantiates a new builder.
     */
    public SystemResponseBuilder() { }

    /**
     * Builds a SystemResponse.
     *
     * @return the systemResponse
     */
    public SystemResponse build() {
      return new SystemResponse(this);
    }
  }

  /**
   * The updateCounterexample options.
   */
  public class UpdateCounterexampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;
    private String newText;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the text.
     *
     * The text of a user input counterexample (for example, `What are you wearing?`).
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the newText.
     *
     * The text of a user input marked as irrelevant input. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the newText
     */
    public String newText() {
      return newText;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateCounterexampleOptions(UpdateCounterexampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.text, 'text cannot be empty');
      workspaceId = builder.workspaceId;
      text = builder.text;
      newText = builder.newText;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateCounterexampleOptions builder
     */
    public UpdateCounterexampleOptionsBuilder newBuilder() {
      return new UpdateCounterexampleOptionsBuilder(this);
    }
  }

  /**
   * UpdateCounterexampleOptions Builder.
   */
  public class UpdateCounterexampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String text;
    private String newText;
    private Boolean includeAudit;

    private UpdateCounterexampleOptionsBuilder(UpdateCounterexampleOptions updateCounterexampleOptions) {
      workspaceId = updateCounterexampleOptions.workspaceId;
      text = updateCounterexampleOptions.text;
      newText = updateCounterexampleOptions.newText;
      includeAudit = updateCounterexampleOptions.includeAudit;
      this.requestHeaders.putAll(updateCounterexampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateCounterexampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param text the text
     */
    public UpdateCounterexampleOptionsBuilder(String workspaceId, String text) {
      this.workspaceId = workspaceId;
      this.text = text;
    }

    /**
     * Builds a UpdateCounterexampleOptions.
     *
     * @return the updateCounterexampleOptions
     */
    public UpdateCounterexampleOptions build() {
      return new UpdateCounterexampleOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateCounterexampleOptions builder
     */
    public UpdateCounterexampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the UpdateCounterexampleOptions builder
     */
    public UpdateCounterexampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the newText.
     *
     * @param newText the newText
     * @return the UpdateCounterexampleOptions builder
     */
    public UpdateCounterexampleOptionsBuilder newText(String newText) {
      this.newText = newText;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateCounterexampleOptions builder
     */
    public UpdateCounterexampleOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateCounterexampleOptions builder
     */
    public UpdateCounterexampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateDialogNode options.
   */
  public class UpdateDialogNodeOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;
    private String newDialogNode;
    private String newDescription;
    private String newConditions;
    private String newParent;
    private String newPreviousSibling;
    private DialogNodeOutput newOutput;
    private IBMWatsonMapModel newContext;
    private IBMWatsonMapModel newMetadata;
    private DialogNodeNextStep newNextStep;
    private String newTitle;
    private String newType;
    private String newEventName;
    private String newVariable;
    private List<DialogNodeAction> newActions;
    private String newDigressIn;
    private String newDigressOut;
    private String newDigressOutSlots;
    private String newUserLabel;
    private Boolean newDisambiguationOptOut;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the dialogNode.
     *
     * The dialog node ID (for example, `get_order`).
     *
     * @return the dialogNode
     */
    public String dialogNode() {
      return dialogNode;
    }

    /**
     * Gets the newDialogNode.
     *
     * The dialog node ID. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot characters.
     *
     * @return the newDialogNode
     */
    public String newDialogNode() {
      return newDialogNode;
    }

    /**
     * Gets the newDescription.
     *
     * The description of the dialog node. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the newDescription
     */
    public String newDescription() {
      return newDescription;
    }

    /**
     * Gets the newConditions.
     *
     * The condition that will trigger the dialog node. This string cannot contain carriage return, newline, or tab
     * characters.
     *
     * @return the newConditions
     */
    public String newConditions() {
      return newConditions;
    }

    /**
     * Gets the newParent.
     *
     * The ID of the parent dialog node. This property is omitted if the dialog node has no parent.
     *
     * @return the newParent
     */
    public String newParent() {
      return newParent;
    }

    /**
     * Gets the newPreviousSibling.
     *
     * The ID of the previous sibling dialog node. This property is omitted if the dialog node has no previous sibling.
     *
     * @return the newPreviousSibling
     */
    public String newPreviousSibling() {
      return newPreviousSibling;
    }

    /**
     * Gets the newOutput.
     *
     * The output of the dialog node. For more information about how to specify dialog node output, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-dialog-overview#dialog-overview-responses).
     *
     * @return the newOutput
     */
    public DialogNodeOutput newOutput() {
      return newOutput;
    }

    /**
     * Gets the newContext.
     *
     * The context for the dialog node.
     *
     * @return the newContext
     */
    public IBMWatsonMapModel newContext() {
      return newContext;
    }

    /**
     * Gets the newMetadata.
     *
     * The metadata for the dialog node.
     *
     * @return the newMetadata
     */
    public IBMWatsonMapModel newMetadata() {
      return newMetadata;
    }

    /**
     * Gets the newNextStep.
     *
     * The next step to execute following this dialog node.
     *
     * @return the newNextStep
     */
    public DialogNodeNextStep newNextStep() {
      return newNextStep;
    }

    /**
     * Gets the newTitle.
     *
     * The alias used to identify the dialog node. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot characters.
     *
     * @return the newTitle
     */
    public String newTitle() {
      return newTitle;
    }

    /**
     * Gets the newType.
     *
     * How the dialog node is processed.
     *
     * @return the newType
     */
    public String newType() {
      return newType;
    }

    /**
     * Gets the newEventName.
     *
     * How an `event_handler` node is processed.
     *
     * @return the newEventName
     */
    public String newEventName() {
      return newEventName;
    }

    /**
     * Gets the newVariable.
     *
     * The location in the dialog context where output is stored.
     *
     * @return the newVariable
     */
    public String newVariable() {
      return newVariable;
    }

    /**
     * Gets the newActions.
     *
     * An array of objects describing any actions to be invoked by the dialog node.
     *
     * @return the newActions
     */
    public List<DialogNodeAction> newActions() {
      return newActions;
    }

    /**
     * Gets the newDigressIn.
     *
     * Whether this top-level dialog node can be digressed into.
     *
     * @return the newDigressIn
     */
    public String newDigressIn() {
      return newDigressIn;
    }

    /**
     * Gets the newDigressOut.
     *
     * Whether this dialog node can be returned to after a digression.
     *
     * @return the newDigressOut
     */
    public String newDigressOut() {
      return newDigressOut;
    }

    /**
     * Gets the newDigressOutSlots.
     *
     * Whether the user can digress to top-level nodes while filling out slots.
     *
     * @return the newDigressOutSlots
     */
    public String newDigressOutSlots() {
      return newDigressOutSlots;
    }

    /**
     * Gets the newUserLabel.
     *
     * A label that can be displayed externally to describe the purpose of the node to users.
     *
     * @return the newUserLabel
     */
    public String newUserLabel() {
      return newUserLabel;
    }

    /**
     * Gets the newDisambiguationOptOut.
     *
     * Whether the dialog node should be excluded from disambiguation suggestions.
     *
     * @return the newDisambiguationOptOut
     */
    public Boolean newDisambiguationOptOut() {
      return newDisambiguationOptOut;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateDialogNodeOptions(UpdateDialogNodeOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.dialogNode, 'dialogNode cannot be empty');
      workspaceId = builder.workspaceId;
      dialogNode = builder.dialogNode;
      newDialogNode = builder.newDialogNode;
      newDescription = builder.newDescription;
      newConditions = builder.newConditions;
      newParent = builder.newParent;
      newPreviousSibling = builder.newPreviousSibling;
      newOutput = builder.newOutput;
      newContext = builder.newContext;
      newMetadata = builder.newMetadata;
      newNextStep = builder.newNextStep;
      newTitle = builder.newTitle;
      newType = builder.newType;
      newEventName = builder.newEventName;
      newVariable = builder.newVariable;
      newActions = builder.newActions;
      newDigressIn = builder.newDigressIn;
      newDigressOut = builder.newDigressOut;
      newDigressOutSlots = builder.newDigressOutSlots;
      newUserLabel = builder.newUserLabel;
      newDisambiguationOptOut = builder.newDisambiguationOptOut;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newBuilder() {
      return new UpdateDialogNodeOptionsBuilder(this);
    }
  }

  /**
   * UpdateDialogNodeOptions Builder.
   */
  public class UpdateDialogNodeOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String dialogNode;
    private String newDialogNode;
    private String newDescription;
    private String newConditions;
    private String newParent;
    private String newPreviousSibling;
    private DialogNodeOutput newOutput;
    private IBMWatsonMapModel newContext;
    private IBMWatsonMapModel newMetadata;
    private DialogNodeNextStep newNextStep;
    private String newTitle;
    private String newType;
    private String newEventName;
    private String newVariable;
    private List<DialogNodeAction> newActions;
    private String newDigressIn;
    private String newDigressOut;
    private String newDigressOutSlots;
    private String newUserLabel;
    private Boolean newDisambiguationOptOut;
    private Boolean includeAudit;

    private UpdateDialogNodeOptionsBuilder(UpdateDialogNodeOptions updateDialogNodeOptions) {
      workspaceId = updateDialogNodeOptions.workspaceId;
      dialogNode = updateDialogNodeOptions.dialogNode;
      newDialogNode = updateDialogNodeOptions.newDialogNode;
      newDescription = updateDialogNodeOptions.newDescription;
      newConditions = updateDialogNodeOptions.newConditions;
      newParent = updateDialogNodeOptions.newParent;
      newPreviousSibling = updateDialogNodeOptions.newPreviousSibling;
      newOutput = updateDialogNodeOptions.newOutput;
      newContext = updateDialogNodeOptions.newContext;
      newMetadata = updateDialogNodeOptions.newMetadata;
      newNextStep = updateDialogNodeOptions.newNextStep;
      newTitle = updateDialogNodeOptions.newTitle;
      newType = updateDialogNodeOptions.newType;
      newEventName = updateDialogNodeOptions.newEventName;
      newVariable = updateDialogNodeOptions.newVariable;
      newActions = updateDialogNodeOptions.newActions;
      newDigressIn = updateDialogNodeOptions.newDigressIn;
      newDigressOut = updateDialogNodeOptions.newDigressOut;
      newDigressOutSlots = updateDialogNodeOptions.newDigressOutSlots;
      newUserLabel = updateDialogNodeOptions.newUserLabel;
      newDisambiguationOptOut = updateDialogNodeOptions.newDisambiguationOptOut;
      includeAudit = updateDialogNodeOptions.includeAudit;
      this.requestHeaders.putAll(updateDialogNodeOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateDialogNodeOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param dialogNode the dialogNode
     */
    public UpdateDialogNodeOptionsBuilder(String workspaceId, String dialogNode) {
      this.workspaceId = workspaceId;
      this.dialogNode = dialogNode;
    }

    /**
     * Builds a UpdateDialogNodeOptions.
     *
     * @return the updateDialogNodeOptions
     */
    public UpdateDialogNodeOptions build() {
      return new UpdateDialogNodeOptions(this);
    }

    /**
     * Adds an newActions to newActions.
     *
     * @param newActions the new newActions
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder addNewActions(DialogNodeAction newActions) {
      IBMWatsonValidator.notNull(newActions, 'newActions cannot be null');
      if (this.newActions == null) {
        this.newActions = new List<DialogNodeAction>();
      }
      this.newActions.add(newActions);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the dialogNode.
     *
     * @param dialogNode the dialogNode
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder dialogNode(String dialogNode) {
      this.dialogNode = dialogNode;
      return this;
    }

    /**
     * Set the newDialogNode.
     *
     * @param newDialogNode the newDialogNode
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newDialogNode(String newDialogNode) {
      this.newDialogNode = newDialogNode;
      return this;
    }

    /**
     * Set the newDescription.
     *
     * @param newDescription the newDescription
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newDescription(String newDescription) {
      this.newDescription = newDescription;
      return this;
    }

    /**
     * Set the newConditions.
     *
     * @param newConditions the newConditions
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newConditions(String newConditions) {
      this.newConditions = newConditions;
      return this;
    }

    /**
     * Set the newParent.
     *
     * @param newParent the newParent
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newParent(String newParent) {
      this.newParent = newParent;
      return this;
    }

    /**
     * Set the newPreviousSibling.
     *
     * @param newPreviousSibling the newPreviousSibling
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newPreviousSibling(String newPreviousSibling) {
      this.newPreviousSibling = newPreviousSibling;
      return this;
    }

    /**
     * Set the newOutput.
     *
     * @param newOutput the newOutput
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newOutput(DialogNodeOutput newOutput) {
      this.newOutput = newOutput;
      return this;
    }

    /**
     * Set the newContext.
     *
     * @param newContext the newContext
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newContext(IBMWatsonMapModel newContext) {
      this.newContext = newContext;
      return this;
    }

    /**
     * Set the newMetadata.
     *
     * @param newMetadata the newMetadata
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newMetadata(IBMWatsonMapModel newMetadata) {
      this.newMetadata = newMetadata;
      return this;
    }

    /**
     * Set the newNextStep.
     *
     * @param newNextStep the newNextStep
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newNextStep(DialogNodeNextStep newNextStep) {
      this.newNextStep = newNextStep;
      return this;
    }

    /**
     * Set the newTitle.
     *
     * @param newTitle the newTitle
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newTitle(String newTitle) {
      this.newTitle = newTitle;
      return this;
    }

    /**
     * Set the newType.
     *
     * @param newType the newType
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newType(String newType) {
      this.newType = newType;
      return this;
    }

    /**
     * Set the newEventName.
     *
     * @param newEventName the newEventName
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newEventName(String newEventName) {
      this.newEventName = newEventName;
      return this;
    }

    /**
     * Set the newVariable.
     *
     * @param newVariable the newVariable
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newVariable(String newVariable) {
      this.newVariable = newVariable;
      return this;
    }

    /**
     * Set the newActions.
     * Existing newActions will be replaced.
     *
     * @param newActions the newActions
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newActions(List<DialogNodeAction> newActions) {
      this.newActions = newActions;
      return this;
    }

    /**
     * Set the newDigressIn.
     *
     * @param newDigressIn the newDigressIn
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newDigressIn(String newDigressIn) {
      this.newDigressIn = newDigressIn;
      return this;
    }

    /**
     * Set the newDigressOut.
     *
     * @param newDigressOut the newDigressOut
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newDigressOut(String newDigressOut) {
      this.newDigressOut = newDigressOut;
      return this;
    }

    /**
     * Set the newDigressOutSlots.
     *
     * @param newDigressOutSlots the newDigressOutSlots
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newDigressOutSlots(String newDigressOutSlots) {
      this.newDigressOutSlots = newDigressOutSlots;
      return this;
    }

    /**
     * Set the newUserLabel.
     *
     * @param newUserLabel the newUserLabel
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newUserLabel(String newUserLabel) {
      this.newUserLabel = newUserLabel;
      return this;
    }

    /**
     * Set the newDisambiguationOptOut.
     *
     * @param newDisambiguationOptOut the newDisambiguationOptOut
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder newDisambiguationOptOut(Boolean newDisambiguationOptOut) {
      this.newDisambiguationOptOut = newDisambiguationOptOut;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateDialogNodeOptions builder
     */
    public UpdateDialogNodeOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateEntity options.
   */
  public class UpdateEntityOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String newEntity;
    private String newDescription;
    private IBMWatsonMapModel newMetadata;
    private Boolean newFuzzyMatch;
    private List<CreateValue> newValues;
    private Boolean append;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the newEntity.
     *
     * The name of the entity. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, and hyphen characters.
     * - It cannot begin with the reserved prefix `sys-`.
     *
     * @return the newEntity
     */
    public String newEntity() {
      return newEntity;
    }

    /**
     * Gets the newDescription.
     *
     * The description of the entity. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the newDescription
     */
    public String newDescription() {
      return newDescription;
    }

    /**
     * Gets the newMetadata.
     *
     * Any metadata related to the entity.
     *
     * @return the newMetadata
     */
    public IBMWatsonMapModel newMetadata() {
      return newMetadata;
    }

    /**
     * Gets the newFuzzyMatch.
     *
     * Whether to use fuzzy matching for the entity.
     *
     * @return the newFuzzyMatch
     */
    public Boolean newFuzzyMatch() {
      return newFuzzyMatch;
    }

    /**
     * Gets the newValues.
     *
     * An array of objects describing the entity values.
     *
     * @return the newValues
     */
    public List<CreateValue> newValues() {
      return newValues;
    }

    /**
     * Gets the append.
     *
     * Whether the new data is to be appended to the existing data in the entity. If **append**=`false`, elements
     * included in the new data completely replace the corresponding existing elements, including all subelements. For
     * example, if the new data for the entity includes **values** and **append**=`false`, all existing values for the
     * entity are discarded and replaced with the new values.
     *
     * If **append**=`true`, existing elements are preserved, and the new elements are added. If any elements in the new
     * data collide with existing elements, the update request fails.
     *
     * @return the append
     */
    public Boolean append() {
      return append;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateEntityOptions(UpdateEntityOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      newEntity = builder.newEntity;
      newDescription = builder.newDescription;
      newMetadata = builder.newMetadata;
      newFuzzyMatch = builder.newFuzzyMatch;
      newValues = builder.newValues;
      append = builder.append;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder newBuilder() {
      return new UpdateEntityOptionsBuilder(this);
    }
  }

  /**
   * UpdateEntityOptions Builder.
   */
  public class UpdateEntityOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String newEntity;
    private String newDescription;
    private IBMWatsonMapModel newMetadata;
    private Boolean newFuzzyMatch;
    private List<CreateValue> newValues;
    private Boolean append;
    private Boolean includeAudit;

    private UpdateEntityOptionsBuilder(UpdateEntityOptions updateEntityOptions) {
      workspaceId = updateEntityOptions.workspaceId;
      entity = updateEntityOptions.entity;
      newEntity = updateEntityOptions.newEntity;
      newDescription = updateEntityOptions.newDescription;
      newMetadata = updateEntityOptions.newMetadata;
      newFuzzyMatch = updateEntityOptions.newFuzzyMatch;
      newValues = updateEntityOptions.newValues;
      append = updateEntityOptions.append;
      includeAudit = updateEntityOptions.includeAudit;
      this.requestHeaders.putAll(updateEntityOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateEntityOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     */
    public UpdateEntityOptionsBuilder(String workspaceId, String entity) {
      this.workspaceId = workspaceId;
      this.entity = entity;
    }

    /**
     * Builds a UpdateEntityOptions.
     *
     * @return the updateEntityOptions
     */
    public UpdateEntityOptions build() {
      return new UpdateEntityOptions(this);
    }

    /**
     * Adds an newValues to newValues.
     *
     * @param newValues the new newValues
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder addNewValues(CreateValue newValues) {
      IBMWatsonValidator.notNull(newValues, 'newValues cannot be null');
      if (this.newValues == null) {
        this.newValues = new List<CreateValue>();
      }
      this.newValues.add(newValues);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the newEntity.
     *
     * @param newEntity the newEntity
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder newEntity(String newEntity) {
      this.newEntity = newEntity;
      return this;
    }

    /**
     * Set the newDescription.
     *
     * @param newDescription the newDescription
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder newDescription(String newDescription) {
      this.newDescription = newDescription;
      return this;
    }

    /**
     * Set the newMetadata.
     *
     * @param newMetadata the newMetadata
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder newMetadata(IBMWatsonMapModel newMetadata) {
      this.newMetadata = newMetadata;
      return this;
    }

    /**
     * Set the newFuzzyMatch.
     *
     * @param newFuzzyMatch the newFuzzyMatch
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder newFuzzyMatch(Boolean newFuzzyMatch) {
      this.newFuzzyMatch = newFuzzyMatch;
      return this;
    }

    /**
     * Set the newValues.
     * Existing newValues will be replaced.
     *
     * @param newValues the newValues
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder newValues(List<CreateValue> newValues) {
      this.newValues = newValues;
      return this;
    }

    /**
     * Set the append.
     *
     * @param append the append
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder append(Boolean append) {
      this.append = append;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateEntityOptions builder
     */
    public UpdateEntityOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateExample options.
   */
  public class UpdateExampleOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;
    private String newText;
    private List<Mention> newMentions;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the text.
     *
     * The text of the user input example.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the newText.
     *
     * The text of the user input example. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the newText
     */
    public String newText() {
      return newText;
    }

    /**
     * Gets the newMentions.
     *
     * An array of contextual entity mentions.
     *
     * @return the newMentions
     */
    public List<Mention> newMentions() {
      return newMentions;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateExampleOptions(UpdateExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      IBMWatsonValidator.notEmpty(builder.text, 'text cannot be empty');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      text = builder.text;
      newText = builder.newText;
      newMentions = builder.newMentions;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder newBuilder() {
      return new UpdateExampleOptionsBuilder(this);
    }
  }

  /**
   * UpdateExampleOptions Builder.
   */
  public class UpdateExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String text;
    private String newText;
    private List<Mention> newMentions;
    private Boolean includeAudit;

    private UpdateExampleOptionsBuilder(UpdateExampleOptions updateExampleOptions) {
      workspaceId = updateExampleOptions.workspaceId;
      intent = updateExampleOptions.intent;
      text = updateExampleOptions.text;
      newText = updateExampleOptions.newText;
      newMentions = updateExampleOptions.newMentions;
      includeAudit = updateExampleOptions.includeAudit;
      this.requestHeaders.putAll(updateExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     * @param text the text
     */
    public UpdateExampleOptionsBuilder(String workspaceId, String intent, String text) {
      this.workspaceId = workspaceId;
      this.intent = intent;
      this.text = text;
    }

    /**
     * Builds a UpdateExampleOptions.
     *
     * @return the updateExampleOptions
     */
    public UpdateExampleOptions build() {
      return new UpdateExampleOptions(this);
    }

    /**
     * Adds an newMentions to newMentions.
     *
     * @param newMentions the new newMentions
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder addNewMentions(Mention newMentions) {
      IBMWatsonValidator.notNull(newMentions, 'newMentions cannot be null');
      if (this.newMentions == null) {
        this.newMentions = new List<Mention>();
      }
      this.newMentions.add(newMentions);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the newText.
     *
     * @param newText the newText
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder newText(String newText) {
      this.newText = newText;
      return this;
    }

    /**
     * Set the newMentions.
     * Existing newMentions will be replaced.
     *
     * @param newMentions the newMentions
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder newMentions(List<Mention> newMentions) {
      this.newMentions = newMentions;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateExampleOptions builder
     */
    public UpdateExampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateIntent options.
   */
  public class UpdateIntentOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String newIntent;
    private String newDescription;
    private List<Example> newExamples;
    private Boolean append;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the intent.
     *
     * The intent name.
     *
     * @return the intent
     */
    public String intent() {
      return intent;
    }

    /**
     * Gets the newIntent.
     *
     * The name of the intent. This string must conform to the following restrictions:
     * - It can contain only Unicode alphanumeric, underscore, hyphen, and dot characters.
     * - It cannot begin with the reserved prefix `sys-`.
     *
     * @return the newIntent
     */
    public String newIntent() {
      return newIntent;
    }

    /**
     * Gets the newDescription.
     *
     * The description of the intent. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the newDescription
     */
    public String newDescription() {
      return newDescription;
    }

    /**
     * Gets the newExamples.
     *
     * An array of user input examples for the intent.
     *
     * @return the newExamples
     */
    public List<Example> newExamples() {
      return newExamples;
    }

    /**
     * Gets the append.
     *
     * Whether the new data is to be appended to the existing data in the object. If **append**=`false`, elements
     * included in the new data completely replace the corresponding existing elements, including all subelements. For
     * example, if the new data for the intent includes **examples** and **append**=`false`, all existing examples for
     * the intent are discarded and replaced with the new examples.
     *
     * If **append**=`true`, existing elements are preserved, and the new elements are added. If any elements in the new
     * data collide with existing elements, the update request fails.
     *
     * @return the append
     */
    public Boolean append() {
      return append;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateIntentOptions(UpdateIntentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.intent, 'intent cannot be empty');
      workspaceId = builder.workspaceId;
      intent = builder.intent;
      newIntent = builder.newIntent;
      newDescription = builder.newDescription;
      newExamples = builder.newExamples;
      append = builder.append;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder newBuilder() {
      return new UpdateIntentOptionsBuilder(this);
    }
  }

  /**
   * UpdateIntentOptions Builder.
   */
  public class UpdateIntentOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String intent;
    private String newIntent;
    private String newDescription;
    private List<Example> newExamples;
    private Boolean append;
    private Boolean includeAudit;

    private UpdateIntentOptionsBuilder(UpdateIntentOptions updateIntentOptions) {
      workspaceId = updateIntentOptions.workspaceId;
      intent = updateIntentOptions.intent;
      newIntent = updateIntentOptions.newIntent;
      newDescription = updateIntentOptions.newDescription;
      newExamples = updateIntentOptions.newExamples;
      append = updateIntentOptions.append;
      includeAudit = updateIntentOptions.includeAudit;
      this.requestHeaders.putAll(updateIntentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateIntentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param intent the intent
     */
    public UpdateIntentOptionsBuilder(String workspaceId, String intent) {
      this.workspaceId = workspaceId;
      this.intent = intent;
    }

    /**
     * Builds a UpdateIntentOptions.
     *
     * @return the updateIntentOptions
     */
    public UpdateIntentOptions build() {
      return new UpdateIntentOptions(this);
    }

    /**
     * Adds an newExamples to newExamples.
     *
     * @param newExamples the new newExamples
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder addNewExamples(Example newExamples) {
      IBMWatsonValidator.notNull(newExamples, 'newExamples cannot be null');
      if (this.newExamples == null) {
        this.newExamples = new List<Example>();
      }
      this.newExamples.add(newExamples);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the intent.
     *
     * @param intent the intent
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder intent(String intent) {
      this.intent = intent;
      return this;
    }

    /**
     * Set the newIntent.
     *
     * @param newIntent the newIntent
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder newIntent(String newIntent) {
      this.newIntent = newIntent;
      return this;
    }

    /**
     * Set the newDescription.
     *
     * @param newDescription the newDescription
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder newDescription(String newDescription) {
      this.newDescription = newDescription;
      return this;
    }

    /**
     * Set the newExamples.
     * Existing newExamples will be replaced.
     *
     * @param newExamples the newExamples
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder newExamples(List<Example> newExamples) {
      this.newExamples = newExamples;
      return this;
    }

    /**
     * Set the append.
     *
     * @param append the append
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder append(Boolean append) {
      this.append = append;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateIntentOptions builder
     */
    public UpdateIntentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateSynonym options.
   */
  public class UpdateSynonymOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;
    private String newSynonym;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the synonym.
     *
     * The text of the synonym.
     *
     * @return the synonym
     */
    public String synonym() {
      return synonym;
    }

    /**
     * Gets the newSynonym.
     *
     * The text of the synonym. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the newSynonym
     */
    public String newSynonym() {
      return newSynonym;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateSynonymOptions(UpdateSynonymOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      IBMWatsonValidator.notEmpty(builder.synonym, 'synonym cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      synonym = builder.synonym;
      newSynonym = builder.newSynonym;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder newBuilder() {
      return new UpdateSynonymOptionsBuilder(this);
    }
  }

  /**
   * UpdateSynonymOptions Builder.
   */
  public class UpdateSynonymOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String synonym;
    private String newSynonym;
    private Boolean includeAudit;

    private UpdateSynonymOptionsBuilder(UpdateSynonymOptions updateSynonymOptions) {
      workspaceId = updateSynonymOptions.workspaceId;
      entity = updateSynonymOptions.entity;
      value = updateSynonymOptions.value;
      synonym = updateSynonymOptions.synonym;
      newSynonym = updateSynonymOptions.newSynonym;
      includeAudit = updateSynonymOptions.includeAudit;
      this.requestHeaders.putAll(updateSynonymOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateSynonymOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     * @param synonym the synonym
     */
    public UpdateSynonymOptionsBuilder(String workspaceId, String entity, String value, String synonym) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
      this.synonym = synonym;
    }

    /**
     * Builds a UpdateSynonymOptions.
     *
     * @return the updateSynonymOptions
     */
    public UpdateSynonymOptions build() {
      return new UpdateSynonymOptions(this);
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the synonym.
     *
     * @param synonym the synonym
     * @return the UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder synonym(String synonym) {
      this.synonym = synonym;
      return this;
    }

    /**
     * Set the newSynonym.
     *
     * @param newSynonym the newSynonym
     * @return the UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder newSynonym(String newSynonym) {
      this.newSynonym = newSynonym;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateSynonymOptions builder
     */
    public UpdateSynonymOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateValue options.
   */
  public class UpdateValueOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String newValue;
    private IBMWatsonMapModel newMetadata;
    private String newType;
    private List<String> newSynonyms;
    private List<String> newPatterns;
    private Boolean append;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the entity.
     *
     * The name of the entity.
     *
     * @return the entity
     */
    public String entity() {
      return entity;
    }

    /**
     * Gets the value.
     *
     * The text of the entity value.
     *
     * @return the value
     */
    public String value() {
      return value;
    }

    /**
     * Gets the newValue.
     *
     * The text of the entity value. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the newValue
     */
    public String newValue() {
      return newValue;
    }

    /**
     * Gets the newMetadata.
     *
     * Any metadata related to the entity value.
     *
     * @return the newMetadata
     */
    public IBMWatsonMapModel newMetadata() {
      return newMetadata;
    }

    /**
     * Gets the newType.
     *
     * Specifies the type of entity value.
     *
     * @return the newType
     */
    public String newType() {
      return newType;
    }

    /**
     * Gets the newSynonyms.
     *
     * An array of synonyms for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A synonym must conform to the following resrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the newSynonyms
     */
    public List<String> newSynonyms() {
      return newSynonyms;
    }

    /**
     * Gets the newPatterns.
     *
     * An array of patterns for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A pattern is a regular expression; for more information about how to specify a
     * pattern, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-entities#entities-create-dictionary-based).
     *
     * @return the newPatterns
     */
    public List<String> newPatterns() {
      return newPatterns;
    }

    /**
     * Gets the append.
     *
     * Whether the new data is to be appended to the existing data in the entity value. If **append**=`false`, elements
     * included in the new data completely replace the corresponding existing elements, including all subelements. For
     * example, if the new data for the entity value includes **synonyms** and **append**=`false`, all existing synonyms
     * for the entity value are discarded and replaced with the new synonyms.
     *
     * If **append**=`true`, existing elements are preserved, and the new elements are added. If any elements in the new
     * data collide with existing elements, the update request fails.
     *
     * @return the append
     */
    public Boolean append() {
      return append;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateValueOptions(UpdateValueOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.entity, 'entity cannot be empty');
      IBMWatsonValidator.notEmpty(builder.value, 'value cannot be empty');
      workspaceId = builder.workspaceId;
      entity = builder.entity;
      value = builder.value;
      newValue = builder.newValue;
      newMetadata = builder.newMetadata;
      newType = builder.newType;
      newSynonyms = builder.newSynonyms;
      newPatterns = builder.newPatterns;
      append = builder.append;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder newBuilder() {
      return new UpdateValueOptionsBuilder(this);
    }
  }

  /**
   * UpdateValueOptions Builder.
   */
  public class UpdateValueOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String entity;
    private String value;
    private String newValue;
    private IBMWatsonMapModel newMetadata;
    private String newType;
    private List<String> newSynonyms;
    private List<String> newPatterns;
    private Boolean append;
    private Boolean includeAudit;

    private UpdateValueOptionsBuilder(UpdateValueOptions updateValueOptions) {
      workspaceId = updateValueOptions.workspaceId;
      entity = updateValueOptions.entity;
      value = updateValueOptions.value;
      newValue = updateValueOptions.newValue;
      newMetadata = updateValueOptions.newMetadata;
      newType = updateValueOptions.newType;
      newSynonyms = updateValueOptions.newSynonyms;
      newPatterns = updateValueOptions.newPatterns;
      append = updateValueOptions.append;
      includeAudit = updateValueOptions.includeAudit;
      this.requestHeaders.putAll(updateValueOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateValueOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     * @param entity the entity
     * @param value the value
     */
    public UpdateValueOptionsBuilder(String workspaceId, String entity, String value) {
      this.workspaceId = workspaceId;
      this.entity = entity;
      this.value = value;
    }

    /**
     * Builds a UpdateValueOptions.
     *
     * @return the updateValueOptions
     */
    public UpdateValueOptions build() {
      return new UpdateValueOptions(this);
    }

    /**
     * Adds an newSynonyms to newSynonyms.
     *
     * @param newSynonyms the new newSynonyms
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder addNewSynonyms(String newSynonyms) {
      IBMWatsonValidator.notNull(newSynonyms, 'newSynonyms cannot be null');
      if (this.newSynonyms == null) {
        this.newSynonyms = new List<String>();
      }
      this.newSynonyms.add(newSynonyms);
      return this;
    }

    /**
     * Adds an newPatterns to newPatterns.
     *
     * @param newPatterns the new newPatterns
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder addNewPatterns(String newPatterns) {
      IBMWatsonValidator.notNull(newPatterns, 'newPatterns cannot be null');
      if (this.newPatterns == null) {
        this.newPatterns = new List<String>();
      }
      this.newPatterns.add(newPatterns);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the entity.
     *
     * @param entity the entity
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder entity(String entity) {
      this.entity = entity;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the newValue.
     *
     * @param newValue the newValue
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder newValue(String newValue) {
      this.newValue = newValue;
      return this;
    }

    /**
     * Set the newMetadata.
     *
     * @param newMetadata the newMetadata
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder newMetadata(IBMWatsonMapModel newMetadata) {
      this.newMetadata = newMetadata;
      return this;
    }

    /**
     * Set the newType.
     *
     * @param newType the newType
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder newType(String newType) {
      this.newType = newType;
      return this;
    }

    /**
     * Set the newSynonyms.
     * Existing newSynonyms will be replaced.
     *
     * @param newSynonyms the newSynonyms
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder newSynonyms(List<String> newSynonyms) {
      this.newSynonyms = newSynonyms;
      return this;
    }

    /**
     * Set the newPatterns.
     * Existing newPatterns will be replaced.
     *
     * @param newPatterns the newPatterns
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder newPatterns(List<String> newPatterns) {
      this.newPatterns = newPatterns;
      return this;
    }

    /**
     * Set the append.
     *
     * @param append the append
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder append(Boolean append) {
      this.append = append;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateValueOptions builder
     */
    public UpdateValueOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateWorkspace options.
   */
  public class UpdateWorkspaceOptions extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String name;
    private String description;
    private String language;
    private IBMWatsonMapModel metadata;
    private Boolean learningOptOut;
    private WorkspaceSystemSettings systemSettings;
    private List<CreateIntent> intents;
    private List<CreateEntity> entities;
    private List<DialogNode> dialogNodes;
    private List<Counterexample> counterexamples;
    private List<Webhook> webhooks;
    private Boolean append;
    private Boolean includeAudit;

    /**
     * Gets the workspaceId.
     *
     * Unique identifier of the workspace.
     *
     * @return the workspaceId
     */
    public String workspaceId() {
      return workspaceId;
    }

    /**
     * Gets the name.
     *
     * The name of the workspace. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the workspace. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the language.
     *
     * The language of the workspace.
     *
     * @return the language
     */
    public String language() {
      return language;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the workspace.
     *
     * @return the metadata
     */
    public IBMWatsonMapModel metadata() {
      return metadata;
    }

    /**
     * Gets the learningOptOut.
     *
     * Whether training data from the workspace (including artifacts such as intents and entities) can be used by IBM
     * for general service improvements. `true` indicates that workspace training data is not to be used.
     *
     * @return the learningOptOut
     */
    public Boolean learningOptOut() {
      return learningOptOut;
    }

    /**
     * Gets the systemSettings.
     *
     * Global settings for the workspace.
     *
     * @return the systemSettings
     */
    public WorkspaceSystemSettings systemSettings() {
      return systemSettings;
    }

    /**
     * Gets the intents.
     *
     * An array of objects defining the intents for the workspace.
     *
     * @return the intents
     */
    public List<CreateIntent> intents() {
      return intents;
    }

    /**
     * Gets the entities.
     *
     * An array of objects describing the entities for the workspace.
     *
     * @return the entities
     */
    public List<CreateEntity> entities() {
      return entities;
    }

    /**
     * Gets the dialogNodes.
     *
     * An array of objects describing the dialog nodes in the workspace.
     *
     * @return the dialogNodes
     */
    public List<DialogNode> dialogNodes() {
      return dialogNodes;
    }

    /**
     * Gets the counterexamples.
     *
     * An array of objects defining input examples that have been marked as irrelevant input.
     *
     * @return the counterexamples
     */
    public List<Counterexample> counterexamples() {
      return counterexamples;
    }

    /**
     * Gets the webhooks.
     *
     * @return the webhooks
     */
    public List<Webhook> webhooks() {
      return webhooks;
    }

    /**
     * Gets the append.
     *
     * Whether the new data is to be appended to the existing data in the object. If **append**=`false`, elements
     * included in the new data completely replace the corresponding existing elements, including all subelements. For
     * example, if the new data for a workspace includes **entities** and **append**=`false`, all existing entities in
     * the workspace are discarded and replaced with the new entities.
     *
     * If **append**=`true`, existing elements are preserved, and the new elements are added. If any elements in the new
     * data collide with existing elements, the update request fails.
     *
     * @return the append
     */
    public Boolean append() {
      return append;
    }

    /**
     * Gets the includeAudit.
     *
     * Whether to include the audit properties (`created` and `updated` timestamps) in the response.
     *
     * @return the includeAudit
     */
    public Boolean includeAudit() {
      return includeAudit;
    }

    private UpdateWorkspaceOptions(UpdateWorkspaceOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.workspaceId, 'workspaceId cannot be empty');
      workspaceId = builder.workspaceId;
      name = builder.name;
      description = builder.description;
      language = builder.language;
      metadata = builder.metadata;
      learningOptOut = builder.learningOptOut;
      systemSettings = builder.systemSettings;
      intents = builder.intents;
      entities = builder.entities;
      dialogNodes = builder.dialogNodes;
      counterexamples = builder.counterexamples;
      webhooks = builder.webhooks;
      append = builder.append;
      includeAudit = builder.includeAudit;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder newBuilder() {
      return new UpdateWorkspaceOptionsBuilder(this);
    }
  }

  /**
   * UpdateWorkspaceOptions Builder.
   */
  public class UpdateWorkspaceOptionsBuilder extends IBMWatsonOptionsModel {
    private String workspaceId;
    private String name;
    private String description;
    private String language;
    private IBMWatsonMapModel metadata;
    private Boolean learningOptOut;
    private WorkspaceSystemSettings systemSettings;
    private List<CreateIntent> intents;
    private List<CreateEntity> entities;
    private List<DialogNode> dialogNodes;
    private List<Counterexample> counterexamples;
    private List<Webhook> webhooks;
    private Boolean append;
    private Boolean includeAudit;

    private UpdateWorkspaceOptionsBuilder(UpdateWorkspaceOptions updateWorkspaceOptions) {
      workspaceId = updateWorkspaceOptions.workspaceId;
      name = updateWorkspaceOptions.name;
      description = updateWorkspaceOptions.description;
      language = updateWorkspaceOptions.language;
      metadata = updateWorkspaceOptions.metadata;
      learningOptOut = updateWorkspaceOptions.learningOptOut;
      systemSettings = updateWorkspaceOptions.systemSettings;
      intents = updateWorkspaceOptions.intents;
      entities = updateWorkspaceOptions.entities;
      dialogNodes = updateWorkspaceOptions.dialogNodes;
      counterexamples = updateWorkspaceOptions.counterexamples;
      webhooks = updateWorkspaceOptions.webhooks;
      append = updateWorkspaceOptions.append;
      includeAudit = updateWorkspaceOptions.includeAudit;
      this.requestHeaders.putAll(updateWorkspaceOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateWorkspaceOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param workspaceId the workspaceId
     */
    public UpdateWorkspaceOptionsBuilder(String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Builds a UpdateWorkspaceOptions.
     *
     * @return the updateWorkspaceOptions
     */
    public UpdateWorkspaceOptions build() {
      return new UpdateWorkspaceOptions(this);
    }

    /**
     * Adds an intents to intents.
     *
     * @param intents the new intents
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder addIntents(CreateIntent intents) {
      IBMWatsonValidator.notNull(intents, 'intents cannot be null');
      if (this.intents == null) {
        this.intents = new List<CreateIntent>();
      }
      this.intents.add(intents);
      return this;
    }

    /**
     * Adds an entities to entities.
     *
     * @param entities the new entities
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder addEntities(CreateEntity entities) {
      IBMWatsonValidator.notNull(entities, 'entities cannot be null');
      if (this.entities == null) {
        this.entities = new List<CreateEntity>();
      }
      this.entities.add(entities);
      return this;
    }

    /**
     * Adds an dialogNodes to dialogNodes.
     *
     * @param dialogNodes the new dialogNodes
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder addDialogNodes(DialogNode dialogNodes) {
      IBMWatsonValidator.notNull(dialogNodes, 'dialogNodes cannot be null');
      if (this.dialogNodes == null) {
        this.dialogNodes = new List<DialogNode>();
      }
      this.dialogNodes.add(dialogNodes);
      return this;
    }

    /**
     * Adds an counterexamples to counterexamples.
     *
     * @param counterexamples the new counterexamples
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder addCounterexamples(Counterexample counterexamples) {
      IBMWatsonValidator.notNull(counterexamples, 'counterexamples cannot be null');
      if (this.counterexamples == null) {
        this.counterexamples = new List<Counterexample>();
      }
      this.counterexamples.add(counterexamples);
      return this;
    }

    /**
     * Adds an webhooks to webhooks.
     *
     * @param webhooks the new webhooks
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder addWebhooks(Webhook webhooks) {
      IBMWatsonValidator.notNull(webhooks, 'webhooks cannot be null');
      if (this.webhooks == null) {
        this.webhooks = new List<Webhook>();
      }
      this.webhooks.add(webhooks);
      return this;
    }

    /**
     * Set the workspaceId.
     *
     * @param workspaceId the workspaceId
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder workspaceId(String workspaceId) {
      this.workspaceId = workspaceId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the learningOptOut.
     *
     * @param learningOptOut the learningOptOut
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder learningOptOut(Boolean learningOptOut) {
      this.learningOptOut = learningOptOut;
      return this;
    }

    /**
     * Set the systemSettings.
     *
     * @param systemSettings the systemSettings
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder systemSettings(WorkspaceSystemSettings systemSettings) {
      this.systemSettings = systemSettings;
      return this;
    }

    /**
     * Set the intents.
     * Existing intents will be replaced.
     *
     * @param intents the intents
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder intents(List<CreateIntent> intents) {
      this.intents = intents;
      return this;
    }

    /**
     * Set the entities.
     * Existing entities will be replaced.
     *
     * @param entities the entities
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder entities(List<CreateEntity> entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the dialogNodes.
     * Existing dialogNodes will be replaced.
     *
     * @param dialogNodes the dialogNodes
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder dialogNodes(List<DialogNode> dialogNodes) {
      this.dialogNodes = dialogNodes;
      return this;
    }

    /**
     * Set the counterexamples.
     * Existing counterexamples will be replaced.
     *
     * @param counterexamples the counterexamples
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder counterexamples(List<Counterexample> counterexamples) {
      this.counterexamples = counterexamples;
      return this;
    }

    /**
     * Set the webhooks.
     * Existing webhooks will be replaced.
     *
     * @param webhooks the webhooks
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder webhooks(List<Webhook> webhooks) {
      this.webhooks = webhooks;
      return this;
    }

    /**
     * Set the append.
     *
     * @param append the append
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder append(Boolean append) {
      this.append = append;
      return this;
    }

    /**
     * Set the includeAudit.
     *
     * @param includeAudit the includeAudit
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder includeAudit(Boolean includeAudit) {
      this.includeAudit = includeAudit;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateWorkspaceOptions builder
     */
    public UpdateWorkspaceOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Value.
   */
  public class Value extends IBMWatsonResponseModel {
    private String value;
    private IBMWatsonMapModel metadata;
    private String xType;
    private List<String> synonyms;
    private List<String> patterns;
    private Datetime created;
    private Datetime updated;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Value() { }

    /**
     * Gets the value.
     *
     * The text of the entity value. This string must conform to the following restrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the value
     */
    @AuraEnabled
    public String getValue() {
      return value;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the entity value.
     *
     * @return the metadata
     */
    @AuraEnabled
    public IBMWatsonMapModel getMetadata() {
      return metadata;
    }

    /**
     * Gets the xType.
     *
     * Specifies the type of entity value.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the synonyms.
     *
     * An array of synonyms for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A synonym must conform to the following resrictions:
     * - It cannot contain carriage return, newline, or tab characters.
     * - It cannot consist of only whitespace characters.
     *
     * @return the synonyms
     */
    @AuraEnabled
    public List<String> getSynonyms() {
      return synonyms;
    }

    /**
     * Gets the patterns.
     *
     * An array of patterns for the entity value. A value can specify either synonyms or patterns (depending on the
     * value type), but not both. A pattern is a regular expression; for more information about how to specify a
     * pattern, see the
     * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-entities#entities-create-dictionary-based).
     *
     * @return the patterns
     */
    @AuraEnabled
    public List<String> getPatterns() {
      return patterns;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }
  
    private Value(ValueBuilder builder) {
      IBMWatsonValidator.notNull(builder.value, 'value cannot be null');
      IBMWatsonValidator.notNull(builder.xType, 'xType cannot be null');
      this.value = builder.value;
      this.metadata = builder.metadata;
      this.xType = builder.xType;
      this.synonyms = builder.synonyms;
      this.patterns = builder.patterns;
      this.created = builder.created;
      this.updated = builder.updated;
    }

    /**
     * New builder.
     *
     * @return a Value builder
     */
    public ValueBuilder newBuilder() {
      return new ValueBuilder(this);
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

      Value ret = (Value) super.deserialize(jsonString, jsonMap, classType);
      ValueBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      IBMWatsonMapModel newMetadata = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(metadataMap, true), metadataMap, IBMWatsonMapModel.class);
      retBuilder.metadata(newMetadata);

      return retBuilder.build();
    }
  }

  /**
   * Value Builder.
   */
  public class ValueBuilder {
    private String value;
    private IBMWatsonMapModel metadata;
    private String xType;
    private List<String> synonyms;
    private List<String> patterns;
    private Datetime created;
    private Datetime updated;

    private ValueBuilder(Value value) {
      this.value = value.value;
      this.metadata = value.metadata;
      this.xType = value.xType;
      this.synonyms = value.synonyms;
      this.patterns = value.patterns;
      this.created = value.created;
      this.updated = value.updated;
    }

    /**
     * Instantiates a new builder.
     */
    public ValueBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param value the value
     * @param xType the xType
     */
    public ValueBuilder(String value, String xType) {
      this.value = value;
      this.xType = xType;
    }

    /**
     * Builds a Value.
     *
     * @return the value
     */
    public Value build() {
      return new Value(this);
    }

    /**
     * Adds an synonyms to synonyms.
     *
     * @param synonyms the new synonyms
     * @return the Value builder
     */
    public ValueBuilder addSynonyms(String synonyms) {
      IBMWatsonValidator.notNull(synonyms, 'synonyms cannot be null');
      if (this.synonyms == null) {
        this.synonyms = new List<String>();
      }
      this.synonyms.add(synonyms);
      return this;
    }

    /**
     * Adds an patterns to patterns.
     *
     * @param patterns the new patterns
     * @return the Value builder
     */
    public ValueBuilder addPatterns(String patterns) {
      IBMWatsonValidator.notNull(patterns, 'patterns cannot be null');
      if (this.patterns == null) {
        this.patterns = new List<String>();
      }
      this.patterns.add(patterns);
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the Value builder
     */
    public ValueBuilder value(String value) {
      this.value = value;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the Value builder
     */
    public ValueBuilder metadata(IBMWatsonMapModel metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the Value builder
     */
    public ValueBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the synonyms.
     * Existing synonyms will be replaced.
     *
     * @param synonyms the synonyms
     * @return the Value builder
     */
    public ValueBuilder synonyms(List<String> synonyms) {
      this.synonyms = synonyms;
      return this;
    }

    /**
     * Set the patterns.
     * Existing patterns will be replaced.
     *
     * @param patterns the patterns
     * @return the Value builder
     */
    public ValueBuilder patterns(List<String> patterns) {
      this.patterns = patterns;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the Value builder
     */
    public ValueBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the Value builder
     */
    public ValueBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }
  }

  /**
   * ValueCollection.
   */
  public class ValueCollection extends IBMWatsonResponseModel {
    private List<Value> values;
    private Pagination pagination;

    /**
     * Gets the values.
     *
     * An array of entity values.
     *
     * @return the values
     */
    @AuraEnabled
    public List<Value> getValues() {
      return values;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the values.
     *
     * @param values the new values
     */
    public void setValues(final List<Value> values) {
      this.values = values;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ValueCollection ret = (ValueCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for values
      List<Value> newValues = new List<Value>();
      List<Value> deserializedValues = ret.getValues();
      if (deserializedValues != null) {
        for (Integer i = 0; i < deserializedValues.size(); i++) {
          Value currentItem = ret.getValues().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('values');
          Value newItem = (Value) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Value.class);
          newValues.add(newItem);
        }
        ret.values = newValues;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * A webhook that can be used by dialog nodes to make programmatic calls to an external function.
   *
   * **Note:** Currently, only a single webhook named `main_webhook` is supported.
   */
  public class Webhook extends IBMWatsonGenericModel {
    private String url;
    private String name;
    private List<WebhookHeader> headers;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Webhook() { }

    /**
     * Gets the url.
     *
     * The URL for the external service or application to which you want to send HTTP POST requests.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the name.
     *
     * The name of the webhook. Currently, `main_webhook` is the only supported value.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the headers.
     *
     * An optional array of HTTP headers to pass with the HTTP request.
     *
     * @return the headers
     */
    @AuraEnabled
    public List<WebhookHeader> getHeaders() {
      return headers;
    }
  
    private Webhook(WebhookBuilder builder) {
      IBMWatsonValidator.notNull(builder.url, 'url cannot be null');
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      this.url = builder.url;
      this.name = builder.name;
      this.headers = builder.headers;
    }

    /**
     * New builder.
     *
     * @return a Webhook builder
     */
    public WebhookBuilder newBuilder() {
      return new WebhookBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Webhook ret = (Webhook) super.deserialize(jsonString, jsonMap, classType);
      WebhookBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for headers
      List<WebhookHeader> newHeaders = new List<WebhookHeader>();
      List<WebhookHeader> deserializedHeaders = ret.getHeaders();
      if (deserializedHeaders != null) {
        for (Integer i = 0; i < deserializedHeaders.size(); i++) {
          WebhookHeader currentItem = ret.getHeaders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('headers');
          WebhookHeader newItem = (WebhookHeader) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), WebhookHeader.class);
          newHeaders.add(newItem);
        }
        retBuilder.headers(newHeaders);
      }

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for headers
      if (headers != null) {
        List<Object> headersJsonList = new List<Object>();
        for (WebhookHeader listItem : headers) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          headersJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('headers', headersJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * Webhook Builder.
   */
  public class WebhookBuilder {
    private String url;
    private String name;
    private List<WebhookHeader> headers;

    private WebhookBuilder(Webhook webhook) {
      this.url = webhook.url;
      this.name = webhook.name;
      this.headers = webhook.headers;
    }

    /**
     * Instantiates a new builder.
     */
    public WebhookBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param url the url
     * @param name the name
     */
    public WebhookBuilder(String url, String name) {
      this.url = url;
      this.name = name;
    }

    /**
     * Builds a Webhook.
     *
     * @return the webhook
     */
    public Webhook build() {
      return new Webhook(this);
    }

    /**
     * Adds an headers to headers.
     *
     * @param headers the new headers
     * @return the Webhook builder
     */
    public WebhookBuilder addHeaders(WebhookHeader headers) {
      IBMWatsonValidator.notNull(headers, 'headers cannot be null');
      if (this.headers == null) {
        this.headers = new List<WebhookHeader>();
      }
      this.headers.add(headers);
      return this;
    }

    /**
     * Set the url.
     *
     * @param url the url
     * @return the Webhook builder
     */
    public WebhookBuilder url(String url) {
      this.url = url;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the Webhook builder
     */
    public WebhookBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the headers.
     * Existing headers will be replaced.
     *
     * @param headers the headers
     * @return the Webhook builder
     */
    public WebhookBuilder headers(List<WebhookHeader> headers) {
      this.headers = headers;
      return this;
    }
  }

  /**
   * A key/value pair defining an HTTP header and a value.
   */
  public class WebhookHeader extends IBMWatsonGenericModel {
    private String name;
    private String value;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WebhookHeader() { }

    /**
     * Gets the name.
     *
     * The name of an HTTP header (for example, `Authorization`).
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the value.
     *
     * The value of an HTTP header.
     *
     * @return the value
     */
    @AuraEnabled
    public String getValue() {
      return value;
    }
  
    private WebhookHeader(WebhookHeaderBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      IBMWatsonValidator.notNull(builder.value, 'value cannot be null');
      this.name = builder.name;
      this.value = builder.value;
    }

    /**
     * New builder.
     *
     * @return a WebhookHeader builder
     */
    public WebhookHeaderBuilder newBuilder() {
      return new WebhookHeaderBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      WebhookHeader ret = (WebhookHeader) super.deserialize(jsonString, jsonMap, classType);
      WebhookHeaderBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * WebhookHeader Builder.
   */
  public class WebhookHeaderBuilder {
    private String name;
    private String value;

    private WebhookHeaderBuilder(WebhookHeader webhookHeader) {
      this.name = webhookHeader.name;
      this.value = webhookHeader.value;
    }

    /**
     * Instantiates a new builder.
     */
    public WebhookHeaderBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param name the name
     * @param value the value
     */
    public WebhookHeaderBuilder(String name, String value) {
      this.name = name;
      this.value = value;
    }

    /**
     * Builds a WebhookHeader.
     *
     * @return the webhookHeader
     */
    public WebhookHeader build() {
      return new WebhookHeader(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the WebhookHeader builder
     */
    public WebhookHeaderBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the value.
     *
     * @param value the value
     * @return the WebhookHeader builder
     */
    public WebhookHeaderBuilder value(String value) {
      this.value = value;
      return this;
    }
  }

  /**
   * Workspace.
   */
  public class Workspace extends IBMWatsonResponseModel {
    private String name;
    private String description;
    private String language;
    private IBMWatsonMapModel metadata;
    private Boolean learningOptOut;
    private WorkspaceSystemSettings systemSettings;
    private String workspaceId;
    private String status;
    private Datetime created;
    private Datetime updated;
    private List<Intent> intents;
    private List<Entity> entities;
    private List<DialogNode> dialogNodes;
    private List<Counterexample> counterexamples;
    private List<Webhook> webhooks;

    /**
     * Gets the name.
     *
     * The name of the workspace. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the workspace. This string cannot contain carriage return, newline, or tab characters.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the language.
     *
     * The language of the workspace.
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the metadata.
     *
     * Any metadata related to the workspace.
     *
     * @return the metadata
     */
    @AuraEnabled
    public IBMWatsonMapModel getMetadata() {
      return metadata;
    }

    /**
     * Gets the learningOptOut.
     *
     * Whether training data from the workspace (including artifacts such as intents and entities) can be used by IBM
     * for general service improvements. `true` indicates that workspace training data is not to be used.
     *
     * @return the learningOptOut
     */
    @AuraEnabled
    public Boolean getLearningOptOut() {
      return learningOptOut;
    }

    /**
     * Gets the systemSettings.
     *
     * Global settings for the workspace.
     *
     * @return the systemSettings
     */
    @AuraEnabled
    public WorkspaceSystemSettings getSystemSettings() {
      return systemSettings;
    }

    /**
     * Gets the workspaceId.
     *
     * The workspace ID of the workspace.
     *
     * @return the workspaceId
     */
    @AuraEnabled
    public String getWorkspaceId() {
      return workspaceId;
    }

    /**
     * Gets the status.
     *
     * The current status of the workspace.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the created.
     *
     * The timestamp for creation of the object.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * The timestamp for the most recent update to the object.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the intents.
     *
     * An array of intents.
     *
     * @return the intents
     */
    @AuraEnabled
    public List<Intent> getIntents() {
      return intents;
    }

    /**
     * Gets the entities.
     *
     * An array of objects describing the entities for the workspace.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<Entity> getEntities() {
      return entities;
    }

    /**
     * Gets the dialogNodes.
     *
     * An array of objects describing the dialog nodes in the workspace.
     *
     * @return the dialogNodes
     */
    @AuraEnabled
    public List<DialogNode> getDialogNodes() {
      return dialogNodes;
    }

    /**
     * Gets the counterexamples.
     *
     * An array of counterexamples.
     *
     * @return the counterexamples
     */
    @AuraEnabled
    public List<Counterexample> getCounterexamples() {
      return counterexamples;
    }

    /**
     * Gets the webhooks.
     *
     * @return the webhooks
     */
    @AuraEnabled
    public List<Webhook> getWebhooks() {
      return webhooks;
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
     * Sets the description.
     *
     * @param description the new description
     */
    public void setDescription(final String description) {
      this.description = description;
    }

    /**
     * Sets the language.
     *
     * @param language the new language
     */
    public void setLanguage(final String language) {
      this.language = language;
    }

    /**
     * Sets the metadata.
     *
     * @param metadata the new metadata
     */
    public void setMetadata(final IBMWatsonMapModel metadata) {
      this.metadata = metadata;
    }

    /**
     * Sets the learningOptOut.
     *
     * @param learningOptOut the new learningOptOut
     */
    public void setLearningOptOut(final Boolean learningOptOut) {
      this.learningOptOut = learningOptOut;
    }

    /**
     * Sets the systemSettings.
     *
     * @param systemSettings the new systemSettings
     */
    public void setSystemSettings(final WorkspaceSystemSettings systemSettings) {
      this.systemSettings = systemSettings;
    }

    /**
     * Sets the intents.
     *
     * @param intents the new intents
     */
    public void setIntents(final List<Intent> intents) {
      this.intents = intents;
    }

    /**
     * Sets the entities.
     *
     * @param entities the new entities
     */
    public void setEntities(final List<Entity> entities) {
      this.entities = entities;
    }

    /**
     * Sets the dialogNodes.
     *
     * @param dialogNodes the new dialogNodes
     */
    public void setDialogNodes(final List<DialogNode> dialogNodes) {
      this.dialogNodes = dialogNodes;
    }

    /**
     * Sets the counterexamples.
     *
     * @param counterexamples the new counterexamples
     */
    public void setCounterexamples(final List<Counterexample> counterexamples) {
      this.counterexamples = counterexamples;
    }

    /**
     * Sets the webhooks.
     *
     * @param webhooks the new webhooks
     */
    public void setWebhooks(final List<Webhook> webhooks) {
      this.webhooks = webhooks;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'learning_opt_out' => 'learningOptOut',
        'system_settings' => 'systemSettings',
        'workspace_id' => 'workspaceId',
        'dialog_nodes' => 'dialogNodes'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Workspace ret = (Workspace) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      IBMWatsonMapModel newMetadata = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(metadataMap, true), metadataMap, IBMWatsonMapModel.class);
      ret.setMetadata(newMetadata);

      // calling custom deserializer for systemSettings
      Map<String, Object> systemSettingsMap = (Map<String, Object>) jsonMap.get('systemSettings');
      WorkspaceSystemSettings newSystemSettings = (WorkspaceSystemSettings) new WorkspaceSystemSettings().deserialize(JSON.serialize(systemSettingsMap, true), systemSettingsMap, WorkspaceSystemSettings.class);
      ret.setSystemSettings(newSystemSettings);

      // calling custom deserializer for intents
      List<Intent> newIntents = new List<Intent>();
      List<Intent> deserializedIntents = ret.getIntents();
      if (deserializedIntents != null) {
        for (Integer i = 0; i < deserializedIntents.size(); i++) {
          Intent currentItem = ret.getIntents().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('intents');
          Intent newItem = (Intent) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Intent.class);
          newIntents.add(newItem);
        }
        ret.intents = newIntents;
      }

      // calling custom deserializer for entities
      List<Entity> newEntities = new List<Entity>();
      List<Entity> deserializedEntities = ret.getEntities();
      if (deserializedEntities != null) {
        for (Integer i = 0; i < deserializedEntities.size(); i++) {
          Entity currentItem = ret.getEntities().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('entities');
          Entity newItem = (Entity) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Entity.class);
          newEntities.add(newItem);
        }
        ret.entities = newEntities;
      }

      // calling custom deserializer for dialogNodes
      List<DialogNode> newDialogNodes = new List<DialogNode>();
      List<DialogNode> deserializedDialogNodes = ret.getDialogNodes();
      if (deserializedDialogNodes != null) {
        for (Integer i = 0; i < deserializedDialogNodes.size(); i++) {
          DialogNode currentItem = ret.getDialogNodes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('dialogNodes');
          DialogNode newItem = (DialogNode) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DialogNode.class);
          newDialogNodes.add(newItem);
        }
        ret.dialogNodes = newDialogNodes;
      }

      // calling custom deserializer for counterexamples
      List<Counterexample> newCounterexamples = new List<Counterexample>();
      List<Counterexample> deserializedCounterexamples = ret.getCounterexamples();
      if (deserializedCounterexamples != null) {
        for (Integer i = 0; i < deserializedCounterexamples.size(); i++) {
          Counterexample currentItem = ret.getCounterexamples().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('counterexamples');
          Counterexample newItem = (Counterexample) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Counterexample.class);
          newCounterexamples.add(newItem);
        }
        ret.counterexamples = newCounterexamples;
      }

      // calling custom deserializer for webhooks
      List<Webhook> newWebhooks = new List<Webhook>();
      List<Webhook> deserializedWebhooks = ret.getWebhooks();
      if (deserializedWebhooks != null) {
        for (Integer i = 0; i < deserializedWebhooks.size(); i++) {
          Webhook currentItem = ret.getWebhooks().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('webhooks');
          Webhook newItem = (Webhook) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Webhook.class);
          newWebhooks.add(newItem);
        }
        ret.webhooks = newWebhooks;
      }

      return ret;
    }
  }

  /**
   * WorkspaceCollection.
   */
  public class WorkspaceCollection extends IBMWatsonResponseModel {
    private List<Workspace> workspaces;
    private Pagination pagination;

    /**
     * Gets the workspaces.
     *
     * An array of objects describing the workspaces associated with the service instance.
     *
     * @return the workspaces
     */
    @AuraEnabled
    public List<Workspace> getWorkspaces() {
      return workspaces;
    }

    /**
     * Gets the pagination.
     *
     * The pagination data for the returned objects.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the workspaces.
     *
     * @param workspaces the new workspaces
     */
    public void setWorkspaces(final List<Workspace> workspaces) {
      this.workspaces = workspaces;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      WorkspaceCollection ret = (WorkspaceCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for workspaces
      List<Workspace> newWorkspaces = new List<Workspace>();
      List<Workspace> deserializedWorkspaces = ret.getWorkspaces();
      if (deserializedWorkspaces != null) {
        for (Integer i = 0; i < deserializedWorkspaces.size(); i++) {
          Workspace currentItem = ret.getWorkspaces().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('workspaces');
          Workspace newItem = (Workspace) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Workspace.class);
          newWorkspaces.add(newItem);
        }
        ret.workspaces = newWorkspaces;
      }

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * Global settings for the workspace.
   */
  public class WorkspaceSystemSettings extends IBMWatsonGenericModel {
    private WorkspaceSystemSettingsTooling tooling;
    private WorkspaceSystemSettingsDisambiguation disambiguation;
    private IBMWatsonMapModel humanAgentAssist;
    private WorkspaceSystemSettingsSystemEntities systemEntities;
    private WorkspaceSystemSettingsOffTopic offTopic;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WorkspaceSystemSettings() { }

    /**
     * Gets the tooling.
     *
     * Workspace settings related to the Watson Assistant user interface.
     *
     * @return the tooling
     */
    @AuraEnabled
    public WorkspaceSystemSettingsTooling getTooling() {
      return tooling;
    }

    /**
     * Gets the disambiguation.
     *
     * Workspace settings related to the disambiguation feature.
     *
     * **Note:** This feature is available only to Plus and Premium users.
     *
     * @return the disambiguation
     */
    @AuraEnabled
    public WorkspaceSystemSettingsDisambiguation getDisambiguation() {
      return disambiguation;
    }

    /**
     * Gets the humanAgentAssist.
     *
     * For internal use only.
     *
     * @return the humanAgentAssist
     */
    @AuraEnabled
    public IBMWatsonMapModel getHumanAgentAssist() {
      return humanAgentAssist;
    }

    /**
     * Gets the systemEntities.
     *
     * Workspace settings related to the behavior of system entities.
     *
     * @return the systemEntities
     */
    @AuraEnabled
    public WorkspaceSystemSettingsSystemEntities getSystemEntities() {
      return systemEntities;
    }

    /**
     * Gets the offTopic.
     *
     * Workspace settings related to detection of irrelevant input.
     *
     * @return the offTopic
     */
    @AuraEnabled
    public WorkspaceSystemSettingsOffTopic getOffTopic() {
      return offTopic;
    }
  
    private WorkspaceSystemSettings(WorkspaceSystemSettingsBuilder builder) {
      this.tooling = builder.tooling;
      this.disambiguation = builder.disambiguation;
      this.humanAgentAssist = builder.humanAgentAssist;
      this.systemEntities = builder.systemEntities;
      this.offTopic = builder.offTopic;
    }

    /**
     * New builder.
     *
     * @return a WorkspaceSystemSettings builder
     */
    public WorkspaceSystemSettingsBuilder newBuilder() {
      return new WorkspaceSystemSettingsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'human_agent_assist' => 'humanAgentAssist',
        'system_entities' => 'systemEntities',
        'off_topic' => 'offTopic'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      WorkspaceSystemSettings ret = (WorkspaceSystemSettings) super.deserialize(jsonString, jsonMap, classType);
      WorkspaceSystemSettingsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for tooling
      Map<String, Object> toolingMap = (Map<String, Object>) jsonMap.get('tooling');
      WorkspaceSystemSettingsTooling newTooling = (WorkspaceSystemSettingsTooling) new WorkspaceSystemSettingsTooling().deserialize(JSON.serialize(toolingMap, true), toolingMap, WorkspaceSystemSettingsTooling.class);
      retBuilder.tooling(newTooling);

      // calling custom deserializer for disambiguation
      Map<String, Object> disambiguationMap = (Map<String, Object>) jsonMap.get('disambiguation');
      WorkspaceSystemSettingsDisambiguation newDisambiguation = (WorkspaceSystemSettingsDisambiguation) new WorkspaceSystemSettingsDisambiguation().deserialize(JSON.serialize(disambiguationMap, true), disambiguationMap, WorkspaceSystemSettingsDisambiguation.class);
      retBuilder.disambiguation(newDisambiguation);

      // calling custom deserializer for humanAgentAssist
      Map<String, Object> humanAgentAssistMap = (Map<String, Object>) jsonMap.get('humanAgentAssist');
      IBMWatsonMapModel newHumanAgentAssist = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(humanAgentAssistMap, true), humanAgentAssistMap, IBMWatsonMapModel.class);
      retBuilder.humanAgentAssist(newHumanAgentAssist);

      // calling custom deserializer for systemEntities
      Map<String, Object> systemEntitiesMap = (Map<String, Object>) jsonMap.get('systemEntities');
      WorkspaceSystemSettingsSystemEntities newSystemEntities = (WorkspaceSystemSettingsSystemEntities) new WorkspaceSystemSettingsSystemEntities().deserialize(JSON.serialize(systemEntitiesMap, true), systemEntitiesMap, WorkspaceSystemSettingsSystemEntities.class);
      retBuilder.systemEntities(newSystemEntities);

      // calling custom deserializer for offTopic
      Map<String, Object> offTopicMap = (Map<String, Object>) jsonMap.get('offTopic');
      WorkspaceSystemSettingsOffTopic newOffTopic = (WorkspaceSystemSettingsOffTopic) new WorkspaceSystemSettingsOffTopic().deserialize(JSON.serialize(offTopicMap, true), offTopicMap, WorkspaceSystemSettingsOffTopic.class);
      retBuilder.offTopic(newOffTopic);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'humanAgentAssist' => 'human_agent_assist',
        'systemEntities' => 'system_entities',
        'offTopic' => 'off_topic'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for tooling
      if (tooling != null) {
        String toolingJsonString = JSON.serialize(tooling.replacePropertyNames(), true);
        String toolingKey = 'tooling';
        if (propertyNameMapping.containsKey(toolingKey)) {
          toolingKey = propertyNameMapping.get(toolingKey);
        }
        jsonMap.put(toolingKey, JSON.deserializeUntyped(toolingJsonString));
      }

      // performing custom serialization for disambiguation
      if (disambiguation != null) {
        String disambiguationJsonString = JSON.serialize(disambiguation.replacePropertyNames(), true);
        String disambiguationKey = 'disambiguation';
        if (propertyNameMapping.containsKey(disambiguationKey)) {
          disambiguationKey = propertyNameMapping.get(disambiguationKey);
        }
        jsonMap.put(disambiguationKey, JSON.deserializeUntyped(disambiguationJsonString));
      }

      // performing custom serialization for humanAgentAssist
      if (humanAgentAssist != null) {
        String humanAgentAssistJsonString = JSON.serialize(humanAgentAssist.replacePropertyNames(), true);
        String humanAgentAssistKey = 'humanAgentAssist';
        if (propertyNameMapping.containsKey(humanAgentAssistKey)) {
          humanAgentAssistKey = propertyNameMapping.get(humanAgentAssistKey);
        }
        jsonMap.put(humanAgentAssistKey, JSON.deserializeUntyped(humanAgentAssistJsonString));
      }

      // performing custom serialization for systemEntities
      if (systemEntities != null) {
        String systemEntitiesJsonString = JSON.serialize(systemEntities.replacePropertyNames(), true);
        String systemEntitiesKey = 'systemEntities';
        if (propertyNameMapping.containsKey(systemEntitiesKey)) {
          systemEntitiesKey = propertyNameMapping.get(systemEntitiesKey);
        }
        jsonMap.put(systemEntitiesKey, JSON.deserializeUntyped(systemEntitiesJsonString));
      }

      // performing custom serialization for offTopic
      if (offTopic != null) {
        String offTopicJsonString = JSON.serialize(offTopic.replacePropertyNames(), true);
        String offTopicKey = 'offTopic';
        if (propertyNameMapping.containsKey(offTopicKey)) {
          offTopicKey = propertyNameMapping.get(offTopicKey);
        }
        jsonMap.put(offTopicKey, JSON.deserializeUntyped(offTopicJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * WorkspaceSystemSettings Builder.
   */
  public class WorkspaceSystemSettingsBuilder {
    private WorkspaceSystemSettingsTooling tooling;
    private WorkspaceSystemSettingsDisambiguation disambiguation;
    private IBMWatsonMapModel humanAgentAssist;
    private WorkspaceSystemSettingsSystemEntities systemEntities;
    private WorkspaceSystemSettingsOffTopic offTopic;

    private WorkspaceSystemSettingsBuilder(WorkspaceSystemSettings workspaceSystemSettings) {
      this.tooling = workspaceSystemSettings.tooling;
      this.disambiguation = workspaceSystemSettings.disambiguation;
      this.humanAgentAssist = workspaceSystemSettings.humanAgentAssist;
      this.systemEntities = workspaceSystemSettings.systemEntities;
      this.offTopic = workspaceSystemSettings.offTopic;
    }

    /**
     * Instantiates a new builder.
     */
    public WorkspaceSystemSettingsBuilder() {
    }

    /**
     * Builds a WorkspaceSystemSettings.
     *
     * @return the workspaceSystemSettings
     */
    public WorkspaceSystemSettings build() {
      return new WorkspaceSystemSettings(this);
    }

    /**
     * Set the tooling.
     *
     * @param tooling the tooling
     * @return the WorkspaceSystemSettings builder
     */
    public WorkspaceSystemSettingsBuilder tooling(WorkspaceSystemSettingsTooling tooling) {
      this.tooling = tooling;
      return this;
    }

    /**
     * Set the disambiguation.
     *
     * @param disambiguation the disambiguation
     * @return the WorkspaceSystemSettings builder
     */
    public WorkspaceSystemSettingsBuilder disambiguation(WorkspaceSystemSettingsDisambiguation disambiguation) {
      this.disambiguation = disambiguation;
      return this;
    }

    /**
     * Set the humanAgentAssist.
     *
     * @param humanAgentAssist the humanAgentAssist
     * @return the WorkspaceSystemSettings builder
     */
    public WorkspaceSystemSettingsBuilder humanAgentAssist(IBMWatsonMapModel humanAgentAssist) {
      this.humanAgentAssist = humanAgentAssist;
      return this;
    }

    /**
     * Set the systemEntities.
     *
     * @param systemEntities the systemEntities
     * @return the WorkspaceSystemSettings builder
     */
    public WorkspaceSystemSettingsBuilder systemEntities(WorkspaceSystemSettingsSystemEntities systemEntities) {
      this.systemEntities = systemEntities;
      return this;
    }

    /**
     * Set the offTopic.
     *
     * @param offTopic the offTopic
     * @return the WorkspaceSystemSettings builder
     */
    public WorkspaceSystemSettingsBuilder offTopic(WorkspaceSystemSettingsOffTopic offTopic) {
      this.offTopic = offTopic;
      return this;
    }
  }

  /**
   * Workspace settings related to the disambiguation feature.
   *
   * **Note:** This feature is available only to Plus and Premium users.
   */
  public class WorkspaceSystemSettingsDisambiguation extends IBMWatsonGenericModel {
    private String prompt;
    private String noneOfTheAbovePrompt;
    private Boolean enabled;
    private String sensitivity;
    private Boolean randomize;
    private Long maxSuggestions;
    private String suggestionTextPolicy;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WorkspaceSystemSettingsDisambiguation() { }

    /**
     * Gets the prompt.
     *
     * The text of the introductory prompt that accompanies disambiguation options presented to the user.
     *
     * @return the prompt
     */
    @AuraEnabled
    public String getPrompt() {
      return prompt;
    }

    /**
     * Gets the noneOfTheAbovePrompt.
     *
     * The user-facing label for the option users can select if none of the suggested options is correct. If no value is
     * specified for this property, this option does not appear.
     *
     * @return the noneOfTheAbovePrompt
     */
    @AuraEnabled
    public String getNoneOfTheAbovePrompt() {
      return noneOfTheAbovePrompt;
    }

    /**
     * Gets the enabled.
     *
     * Whether the disambiguation feature is enabled for the workspace.
     *
     * @return the enabled
     */
    @AuraEnabled
    public Boolean getEnabled() {
      return enabled;
    }

    /**
     * Gets the sensitivity.
     *
     * The sensitivity of the disambiguation feature to intent detection conflicts. Set to **high** if you want the
     * disambiguation feature to be triggered more often. This can be useful for testing or demonstration purposes.
     *
     * @return the sensitivity
     */
    @AuraEnabled
    public String getSensitivity() {
      return sensitivity;
    }

    /**
     * Gets the randomize.
     *
     * Whether the order in which disambiguation suggestions are presented should be randomized (but still influenced by
     * relative confidence).
     *
     * @return the randomize
     */
    @AuraEnabled
    public Boolean getRandomize() {
      return randomize;
    }

    /**
     * Gets the maxSuggestions.
     *
     * The maximum number of disambigation suggestions that can be included in a `suggestion` response.
     *
     * @return the maxSuggestions
     */
    @AuraEnabled
    public Long getMaxSuggestions() {
      return maxSuggestions;
    }

    /**
     * Gets the suggestionTextPolicy.
     *
     * For internal use only.
     *
     * @return the suggestionTextPolicy
     */
    @AuraEnabled
    public String getSuggestionTextPolicy() {
      return suggestionTextPolicy;
    }
  
    private WorkspaceSystemSettingsDisambiguation(WorkspaceSystemSettingsDisambiguationBuilder builder) {
      this.prompt = builder.prompt;
      this.noneOfTheAbovePrompt = builder.noneOfTheAbovePrompt;
      this.enabled = builder.enabled;
      this.sensitivity = builder.sensitivity;
      this.randomize = builder.randomize;
      this.maxSuggestions = builder.maxSuggestions;
      this.suggestionTextPolicy = builder.suggestionTextPolicy;
    }

    /**
     * New builder.
     *
     * @return a WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder newBuilder() {
      return new WorkspaceSystemSettingsDisambiguationBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'none_of_the_above_prompt' => 'noneOfTheAbovePrompt',
        'max_suggestions' => 'maxSuggestions',
        'suggestion_text_policy' => 'suggestionTextPolicy'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      WorkspaceSystemSettingsDisambiguation ret = (WorkspaceSystemSettingsDisambiguation) super.deserialize(jsonString, jsonMap, classType);
      WorkspaceSystemSettingsDisambiguationBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'noneOfTheAbovePrompt' => 'none_of_the_above_prompt',
        'maxSuggestions' => 'max_suggestions',
        'suggestionTextPolicy' => 'suggestion_text_policy'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * WorkspaceSystemSettingsDisambiguation Builder.
   */
  public class WorkspaceSystemSettingsDisambiguationBuilder {
    private String prompt;
    private String noneOfTheAbovePrompt;
    private Boolean enabled;
    private String sensitivity;
    private Boolean randomize;
    private Long maxSuggestions;
    private String suggestionTextPolicy;

    private WorkspaceSystemSettingsDisambiguationBuilder(WorkspaceSystemSettingsDisambiguation workspaceSystemSettingsDisambiguation) {
      this.prompt = workspaceSystemSettingsDisambiguation.prompt;
      this.noneOfTheAbovePrompt = workspaceSystemSettingsDisambiguation.noneOfTheAbovePrompt;
      this.enabled = workspaceSystemSettingsDisambiguation.enabled;
      this.sensitivity = workspaceSystemSettingsDisambiguation.sensitivity;
      this.randomize = workspaceSystemSettingsDisambiguation.randomize;
      this.maxSuggestions = workspaceSystemSettingsDisambiguation.maxSuggestions;
      this.suggestionTextPolicy = workspaceSystemSettingsDisambiguation.suggestionTextPolicy;
    }

    /**
     * Instantiates a new builder.
     */
    public WorkspaceSystemSettingsDisambiguationBuilder() {
    }

    /**
     * Builds a WorkspaceSystemSettingsDisambiguation.
     *
     * @return the workspaceSystemSettingsDisambiguation
     */
    public WorkspaceSystemSettingsDisambiguation build() {
      return new WorkspaceSystemSettingsDisambiguation(this);
    }

    /**
     * Set the prompt.
     *
     * @param prompt the prompt
     * @return the WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder prompt(String prompt) {
      this.prompt = prompt;
      return this;
    }

    /**
     * Set the noneOfTheAbovePrompt.
     *
     * @param noneOfTheAbovePrompt the noneOfTheAbovePrompt
     * @return the WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder noneOfTheAbovePrompt(String noneOfTheAbovePrompt) {
      this.noneOfTheAbovePrompt = noneOfTheAbovePrompt;
      return this;
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }

    /**
     * Set the sensitivity.
     *
     * @param sensitivity the sensitivity
     * @return the WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder sensitivity(String sensitivity) {
      this.sensitivity = sensitivity;
      return this;
    }

    /**
     * Set the randomize.
     *
     * @param randomize the randomize
     * @return the WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder randomize(Boolean randomize) {
      this.randomize = randomize;
      return this;
    }

    /**
     * Set the maxSuggestions.
     *
     * @param maxSuggestions the maxSuggestions
     * @return the WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder maxSuggestions(Long maxSuggestions) {
      this.maxSuggestions = maxSuggestions;
      return this;
    }

    /**
     * Set the suggestionTextPolicy.
     *
     * @param suggestionTextPolicy the suggestionTextPolicy
     * @return the WorkspaceSystemSettingsDisambiguation builder
     */
    public WorkspaceSystemSettingsDisambiguationBuilder suggestionTextPolicy(String suggestionTextPolicy) {
      this.suggestionTextPolicy = suggestionTextPolicy;
      return this;
    }
  }

  /**
   * Workspace settings related to detection of irrelevant input.
   */
  public class WorkspaceSystemSettingsOffTopic extends IBMWatsonGenericModel {
    private Boolean enabled;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WorkspaceSystemSettingsOffTopic() { }

    /**
     * Gets the enabled.
     *
     * Whether enhanced irrelevance detection is enabled for the workspace.
     *
     * @return the enabled
     */
    @AuraEnabled
    public Boolean getEnabled() {
      return enabled;
    }
  
    private WorkspaceSystemSettingsOffTopic(WorkspaceSystemSettingsOffTopicBuilder builder) {
      this.enabled = builder.enabled;
    }

    /**
     * New builder.
     *
     * @return a WorkspaceSystemSettingsOffTopic builder
     */
    public WorkspaceSystemSettingsOffTopicBuilder newBuilder() {
      return new WorkspaceSystemSettingsOffTopicBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      WorkspaceSystemSettingsOffTopic ret = (WorkspaceSystemSettingsOffTopic) super.deserialize(jsonString, jsonMap, classType);
      WorkspaceSystemSettingsOffTopicBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * WorkspaceSystemSettingsOffTopic Builder.
   */
  public class WorkspaceSystemSettingsOffTopicBuilder {
    private Boolean enabled;

    private WorkspaceSystemSettingsOffTopicBuilder(WorkspaceSystemSettingsOffTopic workspaceSystemSettingsOffTopic) {
      this.enabled = workspaceSystemSettingsOffTopic.enabled;
    }

    /**
     * Instantiates a new builder.
     */
    public WorkspaceSystemSettingsOffTopicBuilder() {
    }

    /**
     * Builds a WorkspaceSystemSettingsOffTopic.
     *
     * @return the workspaceSystemSettingsOffTopic
     */
    public WorkspaceSystemSettingsOffTopic build() {
      return new WorkspaceSystemSettingsOffTopic(this);
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the WorkspaceSystemSettingsOffTopic builder
     */
    public WorkspaceSystemSettingsOffTopicBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }
  }

  /**
   * Workspace settings related to the behavior of system entities.
   */
  public class WorkspaceSystemSettingsSystemEntities extends IBMWatsonGenericModel {
    private Boolean enabled;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WorkspaceSystemSettingsSystemEntities() { }

    /**
     * Gets the enabled.
     *
     * Whether the new system entities are enabled for the workspace.
     *
     * @return the enabled
     */
    @AuraEnabled
    public Boolean getEnabled() {
      return enabled;
    }
  
    private WorkspaceSystemSettingsSystemEntities(WorkspaceSystemSettingsSystemEntitiesBuilder builder) {
      this.enabled = builder.enabled;
    }

    /**
     * New builder.
     *
     * @return a WorkspaceSystemSettingsSystemEntities builder
     */
    public WorkspaceSystemSettingsSystemEntitiesBuilder newBuilder() {
      return new WorkspaceSystemSettingsSystemEntitiesBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      WorkspaceSystemSettingsSystemEntities ret = (WorkspaceSystemSettingsSystemEntities) super.deserialize(jsonString, jsonMap, classType);
      WorkspaceSystemSettingsSystemEntitiesBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * WorkspaceSystemSettingsSystemEntities Builder.
   */
  public class WorkspaceSystemSettingsSystemEntitiesBuilder {
    private Boolean enabled;

    private WorkspaceSystemSettingsSystemEntitiesBuilder(WorkspaceSystemSettingsSystemEntities workspaceSystemSettingsSystemEntities) {
      this.enabled = workspaceSystemSettingsSystemEntities.enabled;
    }

    /**
     * Instantiates a new builder.
     */
    public WorkspaceSystemSettingsSystemEntitiesBuilder() {
    }

    /**
     * Builds a WorkspaceSystemSettingsSystemEntities.
     *
     * @return the workspaceSystemSettingsSystemEntities
     */
    public WorkspaceSystemSettingsSystemEntities build() {
      return new WorkspaceSystemSettingsSystemEntities(this);
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the WorkspaceSystemSettingsSystemEntities builder
     */
    public WorkspaceSystemSettingsSystemEntitiesBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }
  }

  /**
   * Workspace settings related to the Watson Assistant user interface.
   */
  public class WorkspaceSystemSettingsTooling extends IBMWatsonGenericModel {
    private Boolean storeGenericResponses;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WorkspaceSystemSettingsTooling() { }

    /**
     * Gets the storeGenericResponses.
     *
     * Whether the dialog JSON editor displays text responses within the `output.generic` object.
     *
     * @return the storeGenericResponses
     */
    @AuraEnabled
    public Boolean getStoreGenericResponses() {
      return storeGenericResponses;
    }
  
    private WorkspaceSystemSettingsTooling(WorkspaceSystemSettingsToolingBuilder builder) {
      this.storeGenericResponses = builder.storeGenericResponses;
    }

    /**
     * New builder.
     *
     * @return a WorkspaceSystemSettingsTooling builder
     */
    public WorkspaceSystemSettingsToolingBuilder newBuilder() {
      return new WorkspaceSystemSettingsToolingBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'store_generic_responses' => 'storeGenericResponses'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      WorkspaceSystemSettingsTooling ret = (WorkspaceSystemSettingsTooling) super.deserialize(jsonString, jsonMap, classType);
      WorkspaceSystemSettingsToolingBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'storeGenericResponses' => 'store_generic_responses'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * WorkspaceSystemSettingsTooling Builder.
   */
  public class WorkspaceSystemSettingsToolingBuilder {
    private Boolean storeGenericResponses;

    private WorkspaceSystemSettingsToolingBuilder(WorkspaceSystemSettingsTooling workspaceSystemSettingsTooling) {
      this.storeGenericResponses = workspaceSystemSettingsTooling.storeGenericResponses;
    }

    /**
     * Instantiates a new builder.
     */
    public WorkspaceSystemSettingsToolingBuilder() {
    }

    /**
     * Builds a WorkspaceSystemSettingsTooling.
     *
     * @return the workspaceSystemSettingsTooling
     */
    public WorkspaceSystemSettingsTooling build() {
      return new WorkspaceSystemSettingsTooling(this);
    }

    /**
     * Set the storeGenericResponses.
     *
     * @param storeGenericResponses the storeGenericResponses
     * @return the WorkspaceSystemSettingsTooling builder
     */
    public WorkspaceSystemSettingsToolingBuilder storeGenericResponses(Boolean storeGenericResponses) {
      this.storeGenericResponses = storeGenericResponses;
      return this;
    }
  }

}