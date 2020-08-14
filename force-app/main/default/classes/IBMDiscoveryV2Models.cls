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

public class IBMDiscoveryV2Models {
  /**
   * The addDocument options.
   */
  public class AddDocumentOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String collectionId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;
    private Boolean xWatsonDiscoveryForce;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the collectionId.
     *
     * The ID of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the file.
     *
     * The content of the document to ingest. The maximum supported file size when adding a file to a collection is 50
     * megabytes, the maximum supported file size when testing a configuration is 1 megabyte. Files larger than the
     * supported size are rejected.
     *
     * @return the file
     */
    public IBMWatsonFile file() {
      return file;
    }

    /**
     * Gets the filename.
     *
     * The filename for file.
     *
     * @return the filename
     */
    public String filename() {
      return filename;
    }

    /**
     * Gets the fileContentType.
     *
     * The content type of file.
     *
     * @return the fileContentType
     */
    public String fileContentType() {
      return fileContentType;
    }

    /**
     * Gets the metadata.
     *
     * The maximum supported metadata file size is 1 MB. Metadata parts larger than 1 MB are rejected. Example:  ``` {
     *   "Creator": "Johnny Appleseed",
     *   "Subject": "Apples"
     * } ```.
     *
     * @return the metadata
     */
    public String metadata() {
      return metadata;
    }

    /**
     * Gets the xWatsonDiscoveryForce.
     *
     * When `true`, the uploaded document is added to the collection even if the data for that collection is shared with
     * other collections.
     *
     * @return the xWatsonDiscoveryForce
     */
    public Boolean xWatsonDiscoveryForce() {
      return xWatsonDiscoveryForce;
    }

    private AddDocumentOptions(AddDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.isTrue(builder.file == null || builder.fileContentType != null, 'content type cannot be null if file is not null');
      projectId = builder.projectId;
      collectionId = builder.collectionId;
      file = builder.file;
      filename = builder.filename;
      fileContentType = builder.fileContentType;
      metadata = builder.metadata;
      xWatsonDiscoveryForce = builder.xWatsonDiscoveryForce;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder newBuilder() {
      return new AddDocumentOptionsBuilder(this);
    }
  }

  /**
   * AddDocumentOptions Builder.
   */
  public class AddDocumentOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String collectionId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;
    private Boolean xWatsonDiscoveryForce;

    private AddDocumentOptionsBuilder(AddDocumentOptions addDocumentOptions) {
      projectId = addDocumentOptions.projectId;
      collectionId = addDocumentOptions.collectionId;
      file = addDocumentOptions.file;
      filename = addDocumentOptions.filename;
      fileContentType = addDocumentOptions.fileContentType;
      metadata = addDocumentOptions.metadata;
      xWatsonDiscoveryForce = addDocumentOptions.xWatsonDiscoveryForce;
      this.requestHeaders.putAll(addDocumentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AddDocumentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     * @param collectionId the collectionId
     */
    public AddDocumentOptionsBuilder(String projectId, String collectionId) {
      this.projectId = projectId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a AddDocumentOptions.
     *
     * @return the addDocumentOptions
     */
    public AddDocumentOptions build() {
      return new AddDocumentOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the file.
     *
     * @param file the file
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder file(IBMWatsonFile file) {
      this.file = file;
      return this;
    }

    /**
     * Set the filename.
     *
     * @param filename the filename
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder filename(String filename) {
      this.filename = filename;
      return this;
    }

    /**
     * Set the fileContentType.
     *
     * @param fileContentType the fileContentType
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder fileContentType(String fileContentType) {
      this.fileContentType = fileContentType;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder metadata(String metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the xWatsonDiscoveryForce.
     *
     * @param xWatsonDiscoveryForce the xWatsonDiscoveryForce
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder xWatsonDiscoveryForce(Boolean xWatsonDiscoveryForce) {
      this.xWatsonDiscoveryForce = xWatsonDiscoveryForce;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * A collection for storing documents.
   */
  public class Collection extends IBMWatsonGenericModel {
    private String collectionId;
    private String name;

    /**
     * Gets the collectionId.
     *
     * The unique identifier of the collection.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the name.
     *
     * The name of the collection.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Sets the name.
     *
     * @param name the new name
     */
    public void setName(final String name) {
      this.name = name;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'collection_id' => 'collectionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Collection ret = (Collection) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * An object containing an array of autocompletion suggestions.
   */
  public class Completions extends IBMWatsonResponseModel {
    private List<String> completions;

    /**
     * Gets the completions.
     *
     * Array of autcomplete suggestion based on the provided prefix.
     *
     * @return the completions
     */
    @AuraEnabled
    public List<String> getCompletions() {
      return completions;
    }

    /**
     * Sets the completions.
     *
     * @param completions the new completions
     */
    public void setCompletions(final List<String> completions) {
      this.completions = completions;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Completions ret = (Completions) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Display settings for aggregations.
   */
  public class ComponentSettingsAggregation extends IBMWatsonGenericModel {
    private String name;
    private String label;
    private Boolean multipleSelectionsAllowed;
    private String visualizationType;

    /**
     * Gets the name.
     *
     * Identifier used to map aggregation settings to aggregation configuration.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the label.
     *
     * User-friendly alias for the aggregation.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
    }

    /**
     * Gets the multipleSelectionsAllowed.
     *
     * Whether users is allowed to select more than one of the aggregation terms.
     *
     * @return the multipleSelectionsAllowed
     */
    @AuraEnabled
    public Boolean getMultipleSelectionsAllowed() {
      return multipleSelectionsAllowed;
    }

    /**
     * Gets the visualizationType.
     *
     * Type of visualization to use when rendering the aggregation.
     *
     * @return the visualizationType
     */
    @AuraEnabled
    public String getVisualizationType() {
      return visualizationType;
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
     * Sets the label.
     *
     * @param label the new label
     */
    public void setLabel(final String label) {
      this.label = label;
    }

    /**
     * Sets the multipleSelectionsAllowed.
     *
     * @param multipleSelectionsAllowed the new multipleSelectionsAllowed
     */
    public void setMultipleSelectionsAllowed(final Boolean multipleSelectionsAllowed) {
      this.multipleSelectionsAllowed = multipleSelectionsAllowed;
    }

    /**
     * Sets the visualizationType.
     *
     * @param visualizationType the new visualizationType
     */
    public void setVisualizationType(final String visualizationType) {
      this.visualizationType = visualizationType;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'multiple_selections_allowed' => 'multipleSelectionsAllowed',
        'visualization_type' => 'visualizationType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ComponentSettingsAggregation ret = (ComponentSettingsAggregation) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Fields shown in the results section of the UI.
   */
  public class ComponentSettingsFieldsShown extends IBMWatsonGenericModel {
    private ComponentSettingsFieldsShownBody body;
    private ComponentSettingsFieldsShownTitle title;

    /**
     * Gets the body.
     *
     * Body label.
     *
     * @return the body
     */
    @AuraEnabled
    public ComponentSettingsFieldsShownBody getBody() {
      return body;
    }

    /**
     * Gets the title.
     *
     * Title label.
     *
     * @return the title
     */
    @AuraEnabled
    public ComponentSettingsFieldsShownTitle getTitle() {
      return title;
    }

    /**
     * Sets the body.
     *
     * @param body the new body
     */
    public void setBody(final ComponentSettingsFieldsShownBody body) {
      this.body = body;
    }

    /**
     * Sets the title.
     *
     * @param title the new title
     */
    public void setTitle(final ComponentSettingsFieldsShownTitle title) {
      this.title = title;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ComponentSettingsFieldsShown ret = (ComponentSettingsFieldsShown) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for body
      Map<String, Object> bodyMap = (Map<String, Object>) jsonMap.get('body');
      ComponentSettingsFieldsShownBody newBody = (ComponentSettingsFieldsShownBody) new ComponentSettingsFieldsShownBody().deserialize(JSON.serialize(bodyMap, true), bodyMap, ComponentSettingsFieldsShownBody.class);
      ret.setBody(newBody);

      // calling custom deserializer for title
      Map<String, Object> titleMap = (Map<String, Object>) jsonMap.get('title');
      ComponentSettingsFieldsShownTitle newTitle = (ComponentSettingsFieldsShownTitle) new ComponentSettingsFieldsShownTitle().deserialize(JSON.serialize(titleMap, true), titleMap, ComponentSettingsFieldsShownTitle.class);
      ret.setTitle(newTitle);

      return ret;
    }
  }

  /**
   * Body label.
   */
  public class ComponentSettingsFieldsShownBody extends IBMWatsonGenericModel {
    private Boolean usePassage;
    private String field;

    /**
     * Gets the usePassage.
     *
     * Use the whole passage as the body.
     *
     * @return the usePassage
     */
    @AuraEnabled
    public Boolean getUsePassage() {
      return usePassage;
    }

    /**
     * Gets the field.
     *
     * Use a specific field as the title.
     *
     * @return the field
     */
    @AuraEnabled
    public String getField() {
      return field;
    }

    /**
     * Sets the usePassage.
     *
     * @param usePassage the new usePassage
     */
    public void setUsePassage(final Boolean usePassage) {
      this.usePassage = usePassage;
    }

    /**
     * Sets the field.
     *
     * @param field the new field
     */
    public void setField(final String field) {
      this.field = field;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'use_passage' => 'usePassage'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ComponentSettingsFieldsShownBody ret = (ComponentSettingsFieldsShownBody) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Title label.
   */
  public class ComponentSettingsFieldsShownTitle extends IBMWatsonGenericModel {
    private String field;

    /**
     * Gets the field.
     *
     * Use a specific field as the title.
     *
     * @return the field
     */
    @AuraEnabled
    public String getField() {
      return field;
    }

    /**
     * Sets the field.
     *
     * @param field the new field
     */
    public void setField(final String field) {
      this.field = field;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ComponentSettingsFieldsShownTitle ret = (ComponentSettingsFieldsShownTitle) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A response containing the default component settings.
   */
  public class ComponentSettingsResponse extends IBMWatsonResponseModel {
    private ComponentSettingsFieldsShown fieldsShown;
    private Boolean autocomplete;
    private Boolean structuredSearch;
    private Long resultsPerPage;
    private List<ComponentSettingsAggregation> aggregations;

    /**
     * Gets the fieldsShown.
     *
     * Fields shown in the results section of the UI.
     *
     * @return the fieldsShown
     */
    @AuraEnabled
    public ComponentSettingsFieldsShown getFieldsShown() {
      return fieldsShown;
    }

    /**
     * Gets the autocomplete.
     *
     * Whether or not autocomplete is enabled.
     *
     * @return the autocomplete
     */
    @AuraEnabled
    public Boolean getAutocomplete() {
      return autocomplete;
    }

    /**
     * Gets the structuredSearch.
     *
     * Whether or not structured search is enabled.
     *
     * @return the structuredSearch
     */
    @AuraEnabled
    public Boolean getStructuredSearch() {
      return structuredSearch;
    }

    /**
     * Gets the resultsPerPage.
     *
     * Number or results shown per page.
     *
     * @return the resultsPerPage
     */
    @AuraEnabled
    public Long getResultsPerPage() {
      return resultsPerPage;
    }

    /**
     * Gets the aggregations.
     *
     * a list of component setting aggregations.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<ComponentSettingsAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Sets the fieldsShown.
     *
     * @param fieldsShown the new fieldsShown
     */
    public void setFieldsShown(final ComponentSettingsFieldsShown fieldsShown) {
      this.fieldsShown = fieldsShown;
    }

    /**
     * Sets the autocomplete.
     *
     * @param autocomplete the new autocomplete
     */
    public void setAutocomplete(final Boolean autocomplete) {
      this.autocomplete = autocomplete;
    }

    /**
     * Sets the structuredSearch.
     *
     * @param structuredSearch the new structuredSearch
     */
    public void setStructuredSearch(final Boolean structuredSearch) {
      this.structuredSearch = structuredSearch;
    }

    /**
     * Sets the resultsPerPage.
     *
     * @param resultsPerPage the new resultsPerPage
     */
    public void setResultsPerPage(final long resultsPerPage) {
      this.resultsPerPage = resultsPerPage;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<ComponentSettingsAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'fields_shown' => 'fieldsShown',
        'structured_search' => 'structuredSearch',
        'results_per_page' => 'resultsPerPage'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ComponentSettingsResponse ret = (ComponentSettingsResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for fieldsShown
      Map<String, Object> fieldsShownMap = (Map<String, Object>) jsonMap.get('fieldsShown');
      ComponentSettingsFieldsShown newFieldsShown = (ComponentSettingsFieldsShown) new ComponentSettingsFieldsShown().deserialize(JSON.serialize(fieldsShownMap, true), fieldsShownMap, ComponentSettingsFieldsShown.class);
      ret.setFieldsShown(newFieldsShown);

      // calling custom deserializer for aggregations
      List<ComponentSettingsAggregation> newAggregations = new List<ComponentSettingsAggregation>();
      List<ComponentSettingsAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          ComponentSettingsAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          ComponentSettingsAggregation newItem = (ComponentSettingsAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ComponentSettingsAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      return ret;
    }
  }

  /**
   * The createTrainingQuery options.
   */
  public class CreateTrainingQueryOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String naturalLanguageQuery;
    private List<TrainingExample> examples;
    private String filter;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the naturalLanguageQuery.
     *
     * The natural text query for the training query.
     *
     * @return the naturalLanguageQuery
     */
    public String naturalLanguageQuery() {
      return naturalLanguageQuery;
    }

    /**
     * Gets the examples.
     *
     * Array of training examples.
     *
     * @return the examples
     */
    public List<TrainingExample> examples() {
      return examples;
    }

    /**
     * Gets the filter.
     *
     * The filter used on the collection before the **natural_language_query** is applied.
     *
     * @return the filter
     */
    public String filter() {
      return filter;
    }

    private CreateTrainingQueryOptions(CreateTrainingQueryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      IBMWatsonValidator.notNull(builder.naturalLanguageQuery, 'naturalLanguageQuery cannot be null');
      IBMWatsonValidator.notNull(builder.examples, 'examples cannot be null');
      projectId = builder.projectId;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      examples = builder.examples;
      filter = builder.filter;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder newBuilder() {
      return new CreateTrainingQueryOptionsBuilder(this);
    }
  }

  /**
   * CreateTrainingQueryOptions Builder.
   */
  public class CreateTrainingQueryOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String naturalLanguageQuery;
    private List<TrainingExample> examples;
    private String filter;

    private CreateTrainingQueryOptionsBuilder(CreateTrainingQueryOptions createTrainingQueryOptions) {
      projectId = createTrainingQueryOptions.projectId;
      naturalLanguageQuery = createTrainingQueryOptions.naturalLanguageQuery;
      examples = createTrainingQueryOptions.examples;
      filter = createTrainingQueryOptions.filter;
      this.requestHeaders.putAll(createTrainingQueryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateTrainingQueryOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @param examples the examples
     */
    public CreateTrainingQueryOptionsBuilder(String projectId, String naturalLanguageQuery, List<TrainingExample> examples) {
      this.projectId = projectId;
      this.naturalLanguageQuery = naturalLanguageQuery;
      this.examples = examples;
    }

    /**
     * Builds a CreateTrainingQueryOptions.
     *
     * @return the createTrainingQueryOptions
     */
    public CreateTrainingQueryOptions build() {
      return new CreateTrainingQueryOptions(this);
    }

    /**
     * Adds an examples to examples.
     *
     * @param examples the new examples
     * @return the CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder addExamples(TrainingExample examples) {
      IBMWatsonValidator.notNull(examples, 'examples cannot be null');
      if (this.examples == null) {
        this.examples = new List<TrainingExample>();
      }
      this.examples.add(examples);
      return this;
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the examples.
     * Existing examples will be replaced.
     *
     * @param examples the examples
     * @return the CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder examples(List<TrainingExample> examples) {
      this.examples = examples;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the trainingQuery.
     *
     * @param trainingQuery the trainingQuery
     * @return the CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder trainingQuery(TrainingQuery trainingQuery) {
      this.naturalLanguageQuery = trainingQuery.getNaturalLanguageQuery();
      this.examples = trainingQuery.getExamples();
      this.filter = trainingQuery.getFilter();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateTrainingQueryOptions builder
     */
    public CreateTrainingQueryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteDocument options.
   */
  public class DeleteDocumentOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String collectionId;
    private String documentId;
    private Boolean xWatsonDiscoveryForce;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the collectionId.
     *
     * The ID of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the documentId.
     *
     * The ID of the document.
     *
     * @return the documentId
     */
    public String documentId() {
      return documentId;
    }

    /**
     * Gets the xWatsonDiscoveryForce.
     *
     * When `true`, the uploaded document is added to the collection even if the data for that collection is shared with
     * other collections.
     *
     * @return the xWatsonDiscoveryForce
     */
    public Boolean xWatsonDiscoveryForce() {
      return xWatsonDiscoveryForce;
    }

    private DeleteDocumentOptions(DeleteDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
      projectId = builder.projectId;
      collectionId = builder.collectionId;
      documentId = builder.documentId;
      xWatsonDiscoveryForce = builder.xWatsonDiscoveryForce;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteDocumentOptions builder
     */
    public DeleteDocumentOptionsBuilder newBuilder() {
      return new DeleteDocumentOptionsBuilder(this);
    }
  }

  /**
   * DeleteDocumentOptions Builder.
   */
  public class DeleteDocumentOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String collectionId;
    private String documentId;
    private Boolean xWatsonDiscoveryForce;

    private DeleteDocumentOptionsBuilder(DeleteDocumentOptions deleteDocumentOptions) {
      projectId = deleteDocumentOptions.projectId;
      collectionId = deleteDocumentOptions.collectionId;
      documentId = deleteDocumentOptions.documentId;
      xWatsonDiscoveryForce = deleteDocumentOptions.xWatsonDiscoveryForce;
      this.requestHeaders.putAll(deleteDocumentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteDocumentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     * @param collectionId the collectionId
     * @param documentId the documentId
     */
    public DeleteDocumentOptionsBuilder(String projectId, String collectionId, String documentId) {
      this.projectId = projectId;
      this.collectionId = collectionId;
      this.documentId = documentId;
    }

    /**
     * Builds a DeleteDocumentOptions.
     *
     * @return the deleteDocumentOptions
     */
    public DeleteDocumentOptions build() {
      return new DeleteDocumentOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the DeleteDocumentOptions builder
     */
    public DeleteDocumentOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteDocumentOptions builder
     */
    public DeleteDocumentOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the DeleteDocumentOptions builder
     */
    public DeleteDocumentOptionsBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Set the xWatsonDiscoveryForce.
     *
     * @param xWatsonDiscoveryForce the xWatsonDiscoveryForce
     * @return the DeleteDocumentOptions builder
     */
    public DeleteDocumentOptionsBuilder xWatsonDiscoveryForce(Boolean xWatsonDiscoveryForce) {
      this.xWatsonDiscoveryForce = xWatsonDiscoveryForce;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteDocumentOptions builder
     */
    public DeleteDocumentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteTrainingQueries options.
   */
  public class DeleteTrainingQueriesOptions extends IBMWatsonOptionsModel {
    private String projectId;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    private DeleteTrainingQueriesOptions(DeleteTrainingQueriesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      projectId = builder.projectId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteTrainingQueriesOptions builder
     */
    public DeleteTrainingQueriesOptionsBuilder newBuilder() {
      return new DeleteTrainingQueriesOptionsBuilder(this);
    }
  }

  /**
   * DeleteTrainingQueriesOptions Builder.
   */
  public class DeleteTrainingQueriesOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;

    private DeleteTrainingQueriesOptionsBuilder(DeleteTrainingQueriesOptions deleteTrainingQueriesOptions) {
      projectId = deleteTrainingQueriesOptions.projectId;
      this.requestHeaders.putAll(deleteTrainingQueriesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteTrainingQueriesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     */
    public DeleteTrainingQueriesOptionsBuilder(String projectId) {
      this.projectId = projectId;
    }

    /**
     * Builds a DeleteTrainingQueriesOptions.
     *
     * @return the deleteTrainingQueriesOptions
     */
    public DeleteTrainingQueriesOptions build() {
      return new DeleteTrainingQueriesOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the DeleteTrainingQueriesOptions builder
     */
    public DeleteTrainingQueriesOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteTrainingQueriesOptions builder
     */
    public DeleteTrainingQueriesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Information returned after an uploaded document is accepted.
   */
  public class DocumentAccepted extends IBMWatsonResponseModel {
    private String documentId;
    private String status;

    /**
     * Gets the documentId.
     *
     * The unique identifier of the ingested document.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the status.
     *
     * Status of the document in the ingestion process. A status of `processing` is returned for documents that are
     * ingested with a *version* date before `2019-01-01`. The `pending` status is returned for all others.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Sets the documentId.
     *
     * @param documentId the new documentId
     */
    public void setDocumentId(final String documentId) {
      this.documentId = documentId;
    }

    /**
     * Sets the status.
     *
     * @param status the new status
     */
    public void setStatus(final String status) {
      this.status = status;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_id' => 'documentId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DocumentAccepted ret = (DocumentAccepted) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * List of document attributes.
   */
  public class DocumentAttribute extends IBMWatsonGenericModel {
    private String xType;
    private String text;
    private TableElementLocation location;

    /**
     * Gets the xType.
     *
     * The type of attribute.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the text.
     *
     * The text associated with the attribute.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public TableElementLocation getLocation() {
      return location;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final TableElementLocation location) {
      this.location = location;
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

      DocumentAttribute ret = (DocumentAttribute) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      TableElementLocation newLocation = (TableElementLocation) new TableElementLocation().deserialize(JSON.serialize(locationMap, true), locationMap, TableElementLocation.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Object containing field details.
   */
  public class Field extends IBMWatsonGenericModel {
    private String field;
    private String xType;
    private String collectionId;

    /**
     * Gets the field.
     *
     * The name of the field.
     *
     * @return the field
     */
    @AuraEnabled
    public String getField() {
      return field;
    }

    /**
     * Gets the xType.
     *
     * The type of the field.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the collectionId.
     *
     * The collection Id of the collection where the field was found.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType',
        'collection_id' => 'collectionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Field ret = (Field) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The getAutocompletion options.
   */
  public class GetAutocompletionOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String prefix;
    private List<String> collectionIds;
    private String field;
    private Long count;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the prefix.
     *
     * The prefix to use for autocompletion. For example, the prefix `Ho` could autocomplete to `Hot`, `Housing`, or
     * `How do I upgrade`. Possible completions are.
     *
     * @return the prefix
     */
    public String prefix() {
      return prefix;
    }

    /**
     * Gets the collectionIds.
     *
     * Comma separated list of the collection IDs. If this parameter is not specified, all collections in the project
     * are used.
     *
     * @return the collectionIds
     */
    public List<String> collectionIds() {
      return collectionIds;
    }

    /**
     * Gets the field.
     *
     * The field in the result documents that autocompletion suggestions are identified from.
     *
     * @return the field
     */
    public String field() {
      return field;
    }

    /**
     * Gets the count.
     *
     * The number of autocompletion suggestions to return.
     *
     * @return the count
     */
    public Long count() {
      return count;
    }

    private GetAutocompletionOptions(GetAutocompletionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      IBMWatsonValidator.notNull(builder.prefix, 'prefix cannot be null');
      projectId = builder.projectId;
      prefix = builder.prefix;
      collectionIds = builder.collectionIds;
      field = builder.field;
      count = builder.count;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder newBuilder() {
      return new GetAutocompletionOptionsBuilder(this);
    }
  }

  /**
   * GetAutocompletionOptions Builder.
   */
  public class GetAutocompletionOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String prefix;
    private List<String> collectionIds;
    private String field;
    private Long count;

    private GetAutocompletionOptionsBuilder(GetAutocompletionOptions getAutocompletionOptions) {
      projectId = getAutocompletionOptions.projectId;
      prefix = getAutocompletionOptions.prefix;
      collectionIds = getAutocompletionOptions.collectionIds;
      field = getAutocompletionOptions.field;
      count = getAutocompletionOptions.count;
      this.requestHeaders.putAll(getAutocompletionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetAutocompletionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     * @param prefix the prefix
     */
    public GetAutocompletionOptionsBuilder(String projectId, String prefix) {
      this.projectId = projectId;
      this.prefix = prefix;
    }

    /**
     * Builds a GetAutocompletionOptions.
     *
     * @return the getAutocompletionOptions
     */
    public GetAutocompletionOptions build() {
      return new GetAutocompletionOptions(this);
    }

    /**
     * Adds an collectionIds to collectionIds.
     *
     * @param collectionIds the new collectionIds
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder addCollectionIds(String collectionIds) {
      IBMWatsonValidator.notNull(collectionIds, 'collectionIds cannot be null');
      if (this.collectionIds == null) {
        this.collectionIds = new List<String>();
      }
      this.collectionIds.add(collectionIds);
      return this;
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the prefix.
     *
     * @param prefix the prefix
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder prefix(String prefix) {
      this.prefix = prefix;
      return this;
    }

    /**
     * Set the collectionIds.
     * Existing collectionIds will be replaced.
     *
     * @param collectionIds the collectionIds
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder collectionIds(List<String> collectionIds) {
      this.collectionIds = collectionIds;
      return this;
    }

    /**
     * Set the field.
     *
     * @param field the field
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder field(String field) {
      this.field = field;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getComponentSettings options.
   */
  public class GetComponentSettingsOptions extends IBMWatsonOptionsModel {
    private String projectId;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    private GetComponentSettingsOptions(GetComponentSettingsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      projectId = builder.projectId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetComponentSettingsOptions builder
     */
    public GetComponentSettingsOptionsBuilder newBuilder() {
      return new GetComponentSettingsOptionsBuilder(this);
    }
  }

  /**
   * GetComponentSettingsOptions Builder.
   */
  public class GetComponentSettingsOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;

    private GetComponentSettingsOptionsBuilder(GetComponentSettingsOptions getComponentSettingsOptions) {
      projectId = getComponentSettingsOptions.projectId;
      this.requestHeaders.putAll(getComponentSettingsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetComponentSettingsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     */
    public GetComponentSettingsOptionsBuilder(String projectId) {
      this.projectId = projectId;
    }

    /**
     * Builds a GetComponentSettingsOptions.
     *
     * @return the getComponentSettingsOptions
     */
    public GetComponentSettingsOptions build() {
      return new GetComponentSettingsOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the GetComponentSettingsOptions builder
     */
    public GetComponentSettingsOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetComponentSettingsOptions builder
     */
    public GetComponentSettingsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getTrainingQuery options.
   */
  public class GetTrainingQueryOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String queryId;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the queryId.
     *
     * The ID of the query used for training.
     *
     * @return the queryId
     */
    public String queryId() {
      return queryId;
    }

    private GetTrainingQueryOptions(GetTrainingQueryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      projectId = builder.projectId;
      queryId = builder.queryId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetTrainingQueryOptions builder
     */
    public GetTrainingQueryOptionsBuilder newBuilder() {
      return new GetTrainingQueryOptionsBuilder(this);
    }
  }

  /**
   * GetTrainingQueryOptions Builder.
   */
  public class GetTrainingQueryOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String queryId;

    private GetTrainingQueryOptionsBuilder(GetTrainingQueryOptions getTrainingQueryOptions) {
      projectId = getTrainingQueryOptions.projectId;
      queryId = getTrainingQueryOptions.queryId;
      this.requestHeaders.putAll(getTrainingQueryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetTrainingQueryOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     * @param queryId the queryId
     */
    public GetTrainingQueryOptionsBuilder(String projectId, String queryId) {
      this.projectId = projectId;
      this.queryId = queryId;
    }

    /**
     * Builds a GetTrainingQueryOptions.
     *
     * @return the getTrainingQueryOptions
     */
    public GetTrainingQueryOptions build() {
      return new GetTrainingQueryOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the GetTrainingQueryOptions builder
     */
    public GetTrainingQueryOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the GetTrainingQueryOptions builder
     */
    public GetTrainingQueryOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetTrainingQueryOptions builder
     */
    public GetTrainingQueryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listCollections options.
   */
  public class ListCollectionsOptions extends IBMWatsonOptionsModel {
    private String projectId;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    private ListCollectionsOptions(ListCollectionsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      projectId = builder.projectId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListCollectionsOptions builder
     */
    public ListCollectionsOptionsBuilder newBuilder() {
      return new ListCollectionsOptionsBuilder(this);
    }
  }

  /**
   * ListCollectionsOptions Builder.
   */
  public class ListCollectionsOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;

    private ListCollectionsOptionsBuilder(ListCollectionsOptions listCollectionsOptions) {
      projectId = listCollectionsOptions.projectId;
      this.requestHeaders.putAll(listCollectionsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListCollectionsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     */
    public ListCollectionsOptionsBuilder(String projectId) {
      this.projectId = projectId;
    }

    /**
     * Builds a ListCollectionsOptions.
     *
     * @return the listCollectionsOptions
     */
    public ListCollectionsOptions build() {
      return new ListCollectionsOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the ListCollectionsOptions builder
     */
    public ListCollectionsOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListCollectionsOptions builder
     */
    public ListCollectionsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Response object containing an array of collection details.
   */
  public class ListCollectionsResponse extends IBMWatsonResponseModel {
    private List<Collection> collections;

    /**
     * Gets the collections.
     *
     * An array containing information about each collection in the project.
     *
     * @return the collections
     */
    @AuraEnabled
    public List<Collection> getCollections() {
      return collections;
    }

    /**
     * Sets the collections.
     *
     * @param collections the new collections
     */
    public void setCollections(final List<Collection> collections) {
      this.collections = collections;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ListCollectionsResponse ret = (ListCollectionsResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for collections
      List<Collection> newCollections = new List<Collection>();
      List<Collection> deserializedCollections = ret.getCollections();
      if (deserializedCollections != null) {
        for (Integer i = 0; i < deserializedCollections.size(); i++) {
          Collection currentItem = ret.getCollections().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('collections');
          Collection newItem = (Collection) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Collection.class);
          newCollections.add(newItem);
        }
        ret.collections = newCollections;
      }

      return ret;
    }
  }

  /**
   * The listFields options.
   */
  public class ListFieldsOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private List<String> collectionIds;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the collectionIds.
     *
     * Comma separated list of the collection IDs. If this parameter is not specified, all collections in the project
     * are used.
     *
     * @return the collectionIds
     */
    public List<String> collectionIds() {
      return collectionIds;
    }

    private ListFieldsOptions(ListFieldsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      projectId = builder.projectId;
      collectionIds = builder.collectionIds;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListFieldsOptions builder
     */
    public ListFieldsOptionsBuilder newBuilder() {
      return new ListFieldsOptionsBuilder(this);
    }
  }

  /**
   * ListFieldsOptions Builder.
   */
  public class ListFieldsOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private List<String> collectionIds;

    private ListFieldsOptionsBuilder(ListFieldsOptions listFieldsOptions) {
      projectId = listFieldsOptions.projectId;
      collectionIds = listFieldsOptions.collectionIds;
      this.requestHeaders.putAll(listFieldsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListFieldsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     */
    public ListFieldsOptionsBuilder(String projectId) {
      this.projectId = projectId;
    }

    /**
     * Builds a ListFieldsOptions.
     *
     * @return the listFieldsOptions
     */
    public ListFieldsOptions build() {
      return new ListFieldsOptions(this);
    }

    /**
     * Adds an collectionIds to collectionIds.
     *
     * @param collectionIds the new collectionIds
     * @return the ListFieldsOptions builder
     */
    public ListFieldsOptionsBuilder addCollectionIds(String collectionIds) {
      IBMWatsonValidator.notNull(collectionIds, 'collectionIds cannot be null');
      if (this.collectionIds == null) {
        this.collectionIds = new List<String>();
      }
      this.collectionIds.add(collectionIds);
      return this;
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the ListFieldsOptions builder
     */
    public ListFieldsOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the collectionIds.
     * Existing collectionIds will be replaced.
     *
     * @param collectionIds the collectionIds
     * @return the ListFieldsOptions builder
     */
    public ListFieldsOptionsBuilder collectionIds(List<String> collectionIds) {
      this.collectionIds = collectionIds;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListFieldsOptions builder
     */
    public ListFieldsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The list of fetched fields.
   *
   * The fields are returned using a fully qualified name format, however, the format differs slightly from that used by
   * the query operations.
   *
   *   * Fields which contain nested objects are assigned a type of "nested".
   *
   *   * Fields which belong to a nested object are prefixed with `.properties` (for example,
   * `warnings.properties.severity` means that the `warnings` object has a property called `severity`).
   */
  public class ListFieldsResponse extends IBMWatsonResponseModel {
    private List<Field> fields;

    /**
     * Gets the fields.
     *
     * An array containing information about each field in the collections.
     *
     * @return the fields
     */
    @AuraEnabled
    public List<Field> getFields() {
      return fields;
    }

    /**
     * Sets the fields.
     *
     * @param fields the new fields
     */
    public void setFields(final List<Field> fields) {
      this.fields = fields;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ListFieldsResponse ret = (ListFieldsResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for fields
      List<Field> newFields = new List<Field>();
      List<Field> deserializedFields = ret.getFields();
      if (deserializedFields != null) {
        for (Integer i = 0; i < deserializedFields.size(); i++) {
          Field currentItem = ret.getFields().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('fields');
          Field newItem = (Field) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Field.class);
          newFields.add(newItem);
        }
        ret.fields = newFields;
      }

      return ret;
    }
  }

  /**
   * The listTrainingQueries options.
   */
  public class ListTrainingQueriesOptions extends IBMWatsonOptionsModel {
    private String projectId;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    private ListTrainingQueriesOptions(ListTrainingQueriesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      projectId = builder.projectId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListTrainingQueriesOptions builder
     */
    public ListTrainingQueriesOptionsBuilder newBuilder() {
      return new ListTrainingQueriesOptionsBuilder(this);
    }
  }

  /**
   * ListTrainingQueriesOptions Builder.
   */
  public class ListTrainingQueriesOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;

    private ListTrainingQueriesOptionsBuilder(ListTrainingQueriesOptions listTrainingQueriesOptions) {
      projectId = listTrainingQueriesOptions.projectId;
      this.requestHeaders.putAll(listTrainingQueriesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListTrainingQueriesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     */
    public ListTrainingQueriesOptionsBuilder(String projectId) {
      this.projectId = projectId;
    }

    /**
     * Builds a ListTrainingQueriesOptions.
     *
     * @return the listTrainingQueriesOptions
     */
    public ListTrainingQueriesOptions build() {
      return new ListTrainingQueriesOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the ListTrainingQueriesOptions builder
     */
    public ListTrainingQueriesOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListTrainingQueriesOptions builder
     */
    public ListTrainingQueriesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * A notice produced for the collection.
   */
  public class Notice extends IBMWatsonGenericModel {
    private String noticeId;
    private Datetime created;
    private String documentId;
    private String collectionId;
    private String queryId;
    private String severity;
    private String step;
    private String description;

    /**
     * Gets the noticeId.
     *
     * Identifies the notice. Many notices might have the same ID. This field exists so that user applications can
     * programmatically identify a notice and take automatic corrective action. Typical notice IDs include:
     * `index_failed`, `index_failed_too_many_requests`, `index_failed_incompatible_field`,
     * `index_failed_cluster_unavailable`, `ingestion_timeout`, `ingestion_error`, `bad_request`, `internal_error`,
     * `missing_model`, `unsupported_model`, `smart_document_understanding_failed_incompatible_field`,
     * `smart_document_understanding_failed_internal_error`, `smart_document_understanding_failed_internal_error`,
     * `smart_document_understanding_failed_warning`, `smart_document_understanding_page_error`,
     * `smart_document_understanding_page_warning`. **Note:** This is not a complete list, other values might be
     * returned.
     *
     * @return the noticeId
     */
    @AuraEnabled
    public String getNoticeId() {
      return noticeId;
    }

    /**
     * Gets the created.
     *
     * The creation date of the collection in the format yyyy-MM-dd'T'HH:mm:ss.SSS'Z'.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the documentId.
     *
     * Unique identifier of the document.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the collectionId.
     *
     * Unique identifier of the collection.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the queryId.
     *
     * Unique identifier of the query used for relevance training.
     *
     * @return the queryId
     */
    @AuraEnabled
    public String getQueryId() {
      return queryId;
    }

    /**
     * Gets the severity.
     *
     * Severity level of the notice.
     *
     * @return the severity
     */
    @AuraEnabled
    public String getSeverity() {
      return severity;
    }

    /**
     * Gets the step.
     *
     * Ingestion or training step in which the notice occurred.
     *
     * @return the step
     */
    @AuraEnabled
    public String getStep() {
      return step;
    }

    /**
     * Gets the description.
     *
     * The description of the notice.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'notice_id' => 'noticeId',
        'document_id' => 'documentId',
        'collection_id' => 'collectionId',
        'query_id' => 'queryId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Notice ret = (Notice) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * An abstract aggregation type produced by Discovery to analyze the input provided.
   */
  public class QueryAggregation extends IBMWatsonGenericModel {
    private String xType;
    private String field;
    private Long count;
    private List<QueryTermAggregationResult> termResults;
    private Long histogramInterval;
    private List<QueryHistogramAggregationResult> histogramResults;
    private String timesliceInterval;
    private List<QueryTimesliceAggregationResult> timesliceResults;
    private String path;
    private Long matchingResults;
    private List<QueryAggregation> aggregations;
    private String match;
    private Double value;
    private Long size;
    private QueryTopHitsAggregationResult hits;

    /**
     * Gets the xType.
     *
     * The type of aggregation command used. Options include: term, histogram, timeslice, nested, filter, min, max, sum,
     * average, unique_count, and top_hits.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the field.
     *
     * The field in the document used to generate top values from.
     *
     * @return the field
     */
    @AuraEnabled
    public String getField() {
      return field;
    }

    /**
     * Gets the count.
     *
     * The number of top values returned.
     *
     * @return the count
     */
    @AuraEnabled
    public Long getCount() {
      return count;
    }

    /**
     * Gets the termResults.
     *
     * Array of top values for the field.
     *
     * @return the termResults
     */
    @AuraEnabled
    public List<QueryTermAggregationResult> getTermResults() {
      return termResults;
    }

    /**
     * Gets the histogramInterval.
     *
     * The size of the sections the results are split into.
     *
     * @return the histogramInterval
     */
    @AuraEnabled
    public Long getHistogramInterval() {
      return histogramInterval;
    }

    /**
     * Gets the histogramResults.
     *
     * Array of numeric intervals.
     *
     * @return the histogramResults
     */
    @AuraEnabled
    public List<QueryHistogramAggregationResult> getHistogramResults() {
      return histogramResults;
    }

    /**
     * Gets the timesliceInterval.
     *
     * The date interval value. Valid values are seconds, minutes, hours, days, weeks, and years.
     *
     * @return the timesliceInterval
     */
    @AuraEnabled
    public String getTimesliceInterval() {
      return timesliceInterval;
    }

    /**
     * Gets the timesliceResults.
     *
     * Array of aggregation results.
     *
     * @return the timesliceResults
     */
    @AuraEnabled
    public List<QueryTimesliceAggregationResult> getTimesliceResults() {
      return timesliceResults;
    }

    /**
     * Gets the path.
     *
     * The path to the document field to scope sub aggregations to.
     *
     * @return the path
     */
    @AuraEnabled
    public String getPath() {
      return path;
    }

    /**
     * Gets the matchingResults.
     *
     * Number of nested documents found in the specified field.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the aggregations.
     *
     * An array of sub aggregations.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Gets the match.
     *
     * The filter written in Discovery Query Language syntax applied to the documents before sub aggregations are run.
     *
     * @return the match
     */
    @AuraEnabled
    public String getMatch() {
      return match;
    }

    /**
     * Gets the value.
     *
     * The value of the calculation.
     *
     * @return the value
     */
    @AuraEnabled
    public Double getValue() {
      return value;
    }

    /**
     * Gets the size.
     *
     * The number of documents to return.
     *
     * @return the size
     */
    @AuraEnabled
    public Long getSize() {
      return size;
    }

    /**
     * Gets the hits.
     *
     * A query response containing the matching documents for the preceding aggregations.
     *
     * @return the hits
     */
    @AuraEnabled
    public QueryTopHitsAggregationResult getHits() {
      return hits;
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
     * Sets the field.
     *
     * @param field the new field
     */
    public void setField(final String field) {
      this.field = field;
    }

    /**
     * Sets the count.
     *
     * @param count the new count
     */
    public void setCount(final long count) {
      this.count = count;
    }

    /**
     * Sets the termResults.
     *
     * @param termResults the new termResults
     */
    public void setTermResults(final List<QueryTermAggregationResult> termResults) {
      this.termResults = termResults;
    }

    /**
     * Sets the histogramInterval.
     *
     * @param histogramInterval the new histogramInterval
     */
    public void setHistogramInterval(final long histogramInterval) {
      this.histogramInterval = histogramInterval;
    }

    /**
     * Sets the histogramResults.
     *
     * @param histogramResults the new histogramResults
     */
    public void setHistogramResults(final List<QueryHistogramAggregationResult> histogramResults) {
      this.histogramResults = histogramResults;
    }

    /**
     * Sets the timesliceInterval.
     *
     * @param timesliceInterval the new timesliceInterval
     */
    public void setTimesliceInterval(final String timesliceInterval) {
      this.timesliceInterval = timesliceInterval;
    }

    /**
     * Sets the timesliceResults.
     *
     * @param timesliceResults the new timesliceResults
     */
    public void setTimesliceResults(final List<QueryTimesliceAggregationResult> timesliceResults) {
      this.timesliceResults = timesliceResults;
    }

    /**
     * Sets the path.
     *
     * @param path the new path
     */
    public void setPath(final String path) {
      this.path = path;
    }

    /**
     * Sets the matchingResults.
     *
     * @param matchingResults the new matchingResults
     */
    public void setMatchingResults(final long matchingResults) {
      this.matchingResults = matchingResults;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<QueryAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    /**
     * Sets the match.
     *
     * @param match the new match
     */
    public void setMatch(final String match) {
      this.match = match;
    }

    /**
     * Sets the value.
     *
     * @param value the new value
     */
    public void setValue(final Double value) {
      this.value = value;
    }

    /**
     * Sets the size.
     *
     * @param size the new size
     */
    public void setSize(final long size) {
      this.size = size;
    }

    /**
     * Sets the hits.
     *
     * @param hits the new hits
     */
    public void setHits(final QueryTopHitsAggregationResult hits) {
      this.hits = hits;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType',
        'term_results' => 'termResults',
        'histogram_interval' => 'histogramInterval',
        'histogram_results' => 'histogramResults',
        'timeslice_interval' => 'timesliceInterval',
        'timeslice_results' => 'timesliceResults',
        'matching_results' => 'matchingResults'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryAggregation ret = (QueryAggregation) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for termResults
      List<QueryTermAggregationResult> newTermResults = new List<QueryTermAggregationResult>();
      List<QueryTermAggregationResult> deserializedTermResults = ret.getTermResults();
      if (deserializedTermResults != null) {
        for (Integer i = 0; i < deserializedTermResults.size(); i++) {
          QueryTermAggregationResult currentItem = ret.getTermResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('termResults');
          QueryTermAggregationResult newItem = (QueryTermAggregationResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryTermAggregationResult.class);
          newTermResults.add(newItem);
        }
        ret.termResults = newTermResults;
      }

      // calling custom deserializer for histogramResults
      List<QueryHistogramAggregationResult> newHistogramResults = new List<QueryHistogramAggregationResult>();
      List<QueryHistogramAggregationResult> deserializedHistogramResults = ret.getHistogramResults();
      if (deserializedHistogramResults != null) {
        for (Integer i = 0; i < deserializedHistogramResults.size(); i++) {
          QueryHistogramAggregationResult currentItem = ret.getHistogramResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('histogramResults');
          QueryHistogramAggregationResult newItem = (QueryHistogramAggregationResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryHistogramAggregationResult.class);
          newHistogramResults.add(newItem);
        }
        ret.histogramResults = newHistogramResults;
      }

      // calling custom deserializer for timesliceResults
      List<QueryTimesliceAggregationResult> newTimesliceResults = new List<QueryTimesliceAggregationResult>();
      List<QueryTimesliceAggregationResult> deserializedTimesliceResults = ret.getTimesliceResults();
      if (deserializedTimesliceResults != null) {
        for (Integer i = 0; i < deserializedTimesliceResults.size(); i++) {
          QueryTimesliceAggregationResult currentItem = ret.getTimesliceResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('timesliceResults');
          QueryTimesliceAggregationResult newItem = (QueryTimesliceAggregationResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryTimesliceAggregationResult.class);
          newTimesliceResults.add(newItem);
        }
        ret.timesliceResults = newTimesliceResults;
      }

      // calling custom deserializer for aggregations
      List<QueryAggregation> newAggregations = new List<QueryAggregation>();
      List<QueryAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          QueryAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          QueryAggregation newItem = (QueryAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      // calling custom deserializer for hits
      Map<String, Object> hitsMap = (Map<String, Object>) jsonMap.get('hits');
      QueryTopHitsAggregationResult newHits = (QueryTopHitsAggregationResult) new QueryTopHitsAggregationResult().deserialize(JSON.serialize(hitsMap, true), hitsMap, QueryTopHitsAggregationResult.class);
      ret.setHits(newHits);

      return ret;
    }
  }

  /**
   * Histogram numeric interval result.
   */
  public class QueryHistogramAggregationResult extends IBMWatsonGenericModel {
    private Long key;
    private Long matchingResults;
    private List<QueryAggregation> aggregations;

    /**
     * Gets the key.
     *
     * The value of the upper bound for the numeric segment.
     *
     * @return the key
     */
    @AuraEnabled
    public Long getKey() {
      return key;
    }

    /**
     * Gets the matchingResults.
     *
     * Number of documents with the specified key as the upper bound.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the aggregations.
     *
     * An array of sub aggregations.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Sets the key.
     *
     * @param key the new key
     */
    public void setKey(final long key) {
      this.key = key;
    }

    /**
     * Sets the matchingResults.
     *
     * @param matchingResults the new matchingResults
     */
    public void setMatchingResults(final long matchingResults) {
      this.matchingResults = matchingResults;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<QueryAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryHistogramAggregationResult ret = (QueryHistogramAggregationResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for aggregations
      List<QueryAggregation> newAggregations = new List<QueryAggregation>();
      List<QueryAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          QueryAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          QueryAggregation newItem = (QueryAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      return ret;
    }
  }

  /**
   * Configuration for passage retrieval.
   */
  public class QueryLargePassages extends IBMWatsonGenericModel {
    private Boolean enabled;
    private Boolean perDocument;
    private Long maxPerDocument;
    private List<String> fields;
    private Long count;
    private Long characters;

    /**
     * Gets the enabled.
     *
     * A passages query that returns the most relevant passages from the results.
     *
     * @return the enabled
     */
    public Boolean getEnabled() {
      return enabled;
    }

    /**
     * Gets the perDocument.
     *
     * When `true`, passages will be returned within their respective result.
     *
     * @return the perDocument
     */
    public Boolean getPerDocument() {
      return perDocument;
    }

    /**
     * Gets the maxPerDocument.
     *
     * Maximum number of passages to return per result.
     *
     * @return the maxPerDocument
     */
    public Long getMaxPerDocument() {
      return maxPerDocument;
    }

    /**
     * Gets the fields.
     *
     * A list of fields that passages are drawn from. If this parameter not specified, then all top-level fields are
     * included.
     *
     * @return the fields
     */
    public List<String> getFields() {
      return fields;
    }

    /**
     * Gets the count.
     *
     * The maximum number of passages to return. The search returns fewer passages if the requested total is not found.
     * The default is `10`. The maximum is `100`.
     *
     * @return the count
     */
    public Long getCount() {
      return count;
    }

    /**
     * Gets the characters.
     *
     * The approximate number of characters that any one passage will have.
     *
     * @return the characters
     */
    public Long getCharacters() {
      return characters;
    }
  
    private QueryLargePassages(QueryLargePassagesBuilder builder) {
      this.enabled = builder.enabled;
      this.perDocument = builder.perDocument;
      this.maxPerDocument = builder.maxPerDocument;
      this.fields = builder.fields;
      this.count = builder.count;
      this.characters = builder.characters;
    }

    /**
     * New builder.
     *
     * @return a QueryLargePassages builder
     */
    public QueryLargePassagesBuilder newBuilder() {
      return new QueryLargePassagesBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'perDocument' => 'per_document',
        'maxPerDocument' => 'max_per_document'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * QueryLargePassages Builder.
   */
  public class QueryLargePassagesBuilder {
    private Boolean enabled;
    private Boolean perDocument;
    private Long maxPerDocument;
    private List<String> fields;
    private Long count;
    private Long characters;

    private QueryLargePassagesBuilder(QueryLargePassages queryLargePassages) {
      this.enabled = queryLargePassages.enabled;
      this.perDocument = queryLargePassages.perDocument;
      this.maxPerDocument = queryLargePassages.maxPerDocument;
      this.fields = queryLargePassages.fields;
      this.count = queryLargePassages.count;
      this.characters = queryLargePassages.characters;
    }

    /**
     * Instantiates a new builder.
     */
    public QueryLargePassagesBuilder() {
    }

    /**
     * Builds a QueryLargePassages.
     *
     * @return the queryLargePassages
     */
    public QueryLargePassages build() {
      return new QueryLargePassages(this);
    }

    /**
     * Adds an fields to fields.
     *
     * @param fields the new fields
     * @return the QueryLargePassages builder
     */
    public QueryLargePassagesBuilder addFields(String fields) {
      IBMWatsonValidator.notNull(fields, 'fields cannot be null');
      if (this.fields == null) {
        this.fields = new List<String>();
      }
      this.fields.add(fields);
      return this;
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the QueryLargePassages builder
     */
    public QueryLargePassagesBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }

    /**
     * Set the perDocument.
     *
     * @param perDocument the perDocument
     * @return the QueryLargePassages builder
     */
    public QueryLargePassagesBuilder perDocument(Boolean perDocument) {
      this.perDocument = perDocument;
      return this;
    }

    /**
     * Set the maxPerDocument.
     *
     * @param maxPerDocument the maxPerDocument
     * @return the QueryLargePassages builder
     */
    public QueryLargePassagesBuilder maxPerDocument(Long maxPerDocument) {
      this.maxPerDocument = maxPerDocument;
      return this;
    }

    /**
     * Set the fields.
     * Existing fields will be replaced.
     *
     * @param fields the fields
     * @return the QueryLargePassages builder
     */
    public QueryLargePassagesBuilder fields(List<String> fields) {
      this.fields = fields;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the QueryLargePassages builder
     */
    public QueryLargePassagesBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Set the characters.
     *
     * @param characters the characters
     * @return the QueryLargePassages builder
     */
    public QueryLargePassagesBuilder characters(Long characters) {
      this.characters = characters;
      return this;
    }
  }

  /**
   * Configuration for suggested refinements.
   */
  public class QueryLargeSuggestedRefinements extends IBMWatsonGenericModel {
    private Boolean enabled;
    private Long count;

    /**
     * Gets the enabled.
     *
     * Whether to perform suggested refinements.
     *
     * @return the enabled
     */
    public Boolean getEnabled() {
      return enabled;
    }

    /**
     * Gets the count.
     *
     * Maximum number of suggested refinements texts to be returned. The default is `10`. The maximum is `100`.
     *
     * @return the count
     */
    public Long getCount() {
      return count;
    }
  
    private QueryLargeSuggestedRefinements(QueryLargeSuggestedRefinementsBuilder builder) {
      this.enabled = builder.enabled;
      this.count = builder.count;
    }

    /**
     * New builder.
     *
     * @return a QueryLargeSuggestedRefinements builder
     */
    public QueryLargeSuggestedRefinementsBuilder newBuilder() {
      return new QueryLargeSuggestedRefinementsBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * QueryLargeSuggestedRefinements Builder.
   */
  public class QueryLargeSuggestedRefinementsBuilder {
    private Boolean enabled;
    private Long count;

    private QueryLargeSuggestedRefinementsBuilder(QueryLargeSuggestedRefinements queryLargeSuggestedRefinements) {
      this.enabled = queryLargeSuggestedRefinements.enabled;
      this.count = queryLargeSuggestedRefinements.count;
    }

    /**
     * Instantiates a new builder.
     */
    public QueryLargeSuggestedRefinementsBuilder() {
    }

    /**
     * Builds a QueryLargeSuggestedRefinements.
     *
     * @return the queryLargeSuggestedRefinements
     */
    public QueryLargeSuggestedRefinements build() {
      return new QueryLargeSuggestedRefinements(this);
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the QueryLargeSuggestedRefinements builder
     */
    public QueryLargeSuggestedRefinementsBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the QueryLargeSuggestedRefinements builder
     */
    public QueryLargeSuggestedRefinementsBuilder count(Long count) {
      this.count = count;
      return this;
    }
  }

  /**
   * Configuration for table retrieval.
   */
  public class QueryLargeTableResults extends IBMWatsonGenericModel {
    private Boolean enabled;
    private Long count;

    /**
     * Gets the enabled.
     *
     * Whether to enable table retrieval.
     *
     * @return the enabled
     */
    public Boolean getEnabled() {
      return enabled;
    }

    /**
     * Gets the count.
     *
     * Maximum number of tables to return.
     *
     * @return the count
     */
    public Long getCount() {
      return count;
    }
  
    private QueryLargeTableResults(QueryLargeTableResultsBuilder builder) {
      this.enabled = builder.enabled;
      this.count = builder.count;
    }

    /**
     * New builder.
     *
     * @return a QueryLargeTableResults builder
     */
    public QueryLargeTableResultsBuilder newBuilder() {
      return new QueryLargeTableResultsBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * QueryLargeTableResults Builder.
   */
  public class QueryLargeTableResultsBuilder {
    private Boolean enabled;
    private Long count;

    private QueryLargeTableResultsBuilder(QueryLargeTableResults queryLargeTableResults) {
      this.enabled = queryLargeTableResults.enabled;
      this.count = queryLargeTableResults.count;
    }

    /**
     * Instantiates a new builder.
     */
    public QueryLargeTableResultsBuilder() {
    }

    /**
     * Builds a QueryLargeTableResults.
     *
     * @return the queryLargeTableResults
     */
    public QueryLargeTableResults build() {
      return new QueryLargeTableResults(this);
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the QueryLargeTableResults builder
     */
    public QueryLargeTableResultsBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the QueryLargeTableResults builder
     */
    public QueryLargeTableResultsBuilder count(Long count) {
      this.count = count;
      return this;
    }
  }

  /**
   * The queryNotices options.
   */
  public class QueryNoticesOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Long count;
    private Long offset;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the filter.
     *
     * A cacheable query that excludes documents that don't mention the query content. Filter searches are better for
     * metadata-type searches and for assessing the concepts in the data set.
     *
     * @return the filter
     */
    public String filter() {
      return filter;
    }

    /**
     * Gets the query.
     *
     * A query search returns all documents in your data set with full enrichments and full text, but with the most
     * relevant documents listed first.
     *
     * @return the query
     */
    public String query() {
      return query;
    }

    /**
     * Gets the naturalLanguageQuery.
     *
     * A natural language query that returns relevant documents by utilizing training data and natural language
     * understanding.
     *
     * @return the naturalLanguageQuery
     */
    public String naturalLanguageQuery() {
      return naturalLanguageQuery;
    }

    /**
     * Gets the count.
     *
     * Number of results to return. The maximum for the **count** and **offset** values together in any one query is
     * **10000**.
     *
     * @return the count
     */
    public Long count() {
      return count;
    }

    /**
     * Gets the offset.
     *
     * The number of query results to skip at the beginning. For example, if the total number of results that are
     * returned is 10 and the offset is 8, it returns the last two results. The maximum for the **count** and **offset**
     * values together in any one query is **10000**.
     *
     * @return the offset
     */
    public Long offset() {
      return offset;
    }

    private QueryNoticesOptions(QueryNoticesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      projectId = builder.projectId;
      filter = builder.filter;
      query = builder.query;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      count = builder.count;
      offset = builder.offset;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder newBuilder() {
      return new QueryNoticesOptionsBuilder(this);
    }
  }

  /**
   * QueryNoticesOptions Builder.
   */
  public class QueryNoticesOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Long count;
    private Long offset;

    private QueryNoticesOptionsBuilder(QueryNoticesOptions queryNoticesOptions) {
      projectId = queryNoticesOptions.projectId;
      filter = queryNoticesOptions.filter;
      query = queryNoticesOptions.query;
      naturalLanguageQuery = queryNoticesOptions.naturalLanguageQuery;
      count = queryNoticesOptions.count;
      offset = queryNoticesOptions.offset;
      this.requestHeaders.putAll(queryNoticesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public QueryNoticesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     */
    public QueryNoticesOptionsBuilder(String projectId) {
      this.projectId = projectId;
    }

    /**
     * Builds a QueryNoticesOptions.
     *
     * @return the queryNoticesOptions
     */
    public QueryNoticesOptions build() {
      return new QueryNoticesOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the query.
     *
     * @param query the query
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder query(String query) {
      this.query = query;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Set the offset.
     *
     * @param offset the offset
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder offset(Long offset) {
      this.offset = offset;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Object containing notice query results.
   */
  public class QueryNoticesResponse extends IBMWatsonResponseModel {
    private Long matchingResults;
    private List<Notice> notices;

    /**
     * Gets the matchingResults.
     *
     * The number of matching results.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the notices.
     *
     * Array of document results that match the query.
     *
     * @return the notices
     */
    @AuraEnabled
    public List<Notice> getNotices() {
      return notices;
    }

    /**
     * Sets the matchingResults.
     *
     * @param matchingResults the new matchingResults
     */
    public void setMatchingResults(final long matchingResults) {
      this.matchingResults = matchingResults;
    }

    /**
     * Sets the notices.
     *
     * @param notices the new notices
     */
    public void setNotices(final List<Notice> notices) {
      this.notices = notices;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryNoticesResponse ret = (QueryNoticesResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for notices
      List<Notice> newNotices = new List<Notice>();
      List<Notice> deserializedNotices = ret.getNotices();
      if (deserializedNotices != null) {
        for (Integer i = 0; i < deserializedNotices.size(); i++) {
          Notice currentItem = ret.getNotices().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('notices');
          Notice newItem = (Notice) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Notice.class);
          newNotices.add(newItem);
        }
        ret.notices = newNotices;
      }

      return ret;
    }
  }

  /**
   * The query options.
   */
  public class QueryOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private List<String> collectionIds;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private String aggregation;
    private Long count;
    private List<String> xReturn;
    private Long offset;
    private String xSort;
    private Boolean highlight;
    private Boolean spellingSuggestions;
    private QueryLargeTableResults tableResults;
    private QueryLargeSuggestedRefinements suggestedRefinements;
    private QueryLargePassages passages;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the collectionIds.
     *
     * A comma-separated list of collection IDs to be queried against.
     *
     * @return the collectionIds
     */
    public List<String> collectionIds() {
      return collectionIds;
    }

    /**
     * Gets the filter.
     *
     * A cacheable query that excludes documents that don't mention the query content. Filter searches are better for
     * metadata-type searches and for assessing the concepts in the data set.
     *
     * @return the filter
     */
    public String filter() {
      return filter;
    }

    /**
     * Gets the query.
     *
     * A query search returns all documents in your data set with full enrichments and full text, but with the most
     * relevant documents listed first. Use a query search when you want to find the most relevant search results.
     *
     * @return the query
     */
    public String query() {
      return query;
    }

    /**
     * Gets the naturalLanguageQuery.
     *
     * A natural language query that returns relevant documents by utilizing training data and natural language
     * understanding.
     *
     * @return the naturalLanguageQuery
     */
    public String naturalLanguageQuery() {
      return naturalLanguageQuery;
    }

    /**
     * Gets the aggregation.
     *
     * An aggregation search that returns an exact answer by combining query search with filters. Useful for
     * applications to build lists, tables, and time series. For a full list of possible aggregations, see the Query
     * reference.
     *
     * @return the aggregation
     */
    public String aggregation() {
      return aggregation;
    }

    /**
     * Gets the count.
     *
     * Number of results to return.
     *
     * @return the count
     */
    public Long count() {
      return count;
    }

    /**
     * Gets the xReturn.
     *
     * A list of the fields in the document hierarchy to return. If this parameter not specified, then all top-level
     * fields are returned.
     *
     * @return the xReturn
     */
    public List<String> xReturn() {
      return xReturn;
    }

    /**
     * Gets the offset.
     *
     * The number of query results to skip at the beginning. For example, if the total number of results that are
     * returned is 10 and the offset is 8, it returns the last two results.
     *
     * @return the offset
     */
    public Long offset() {
      return offset;
    }

    /**
     * Gets the xSort.
     *
     * A comma-separated list of fields in the document to sort on. You can optionally specify a sort direction by
     * prefixing the field with `-` for descending or `+` for ascending. Ascending is the default sort direction if no
     * prefix is specified. This parameter cannot be used in the same query as the **bias** parameter.
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the highlight.
     *
     * When `true`, a highlight field is returned for each result which contains the fields which match the query with
     * `<em></em>` tags around the matching query terms.
     *
     * @return the highlight
     */
    public Boolean highlight() {
      return highlight;
    }

    /**
     * Gets the spellingSuggestions.
     *
     * When `true` and the **natural_language_query** parameter is used, the **natural_language_query** parameter is
     * spell checked. The most likely correction is returned in the **suggested_query** field of the response (if one
     * exists).
     *
     * @return the spellingSuggestions
     */
    public Boolean spellingSuggestions() {
      return spellingSuggestions;
    }

    /**
     * Gets the tableResults.
     *
     * Configuration for table retrieval.
     *
     * @return the tableResults
     */
    public QueryLargeTableResults tableResults() {
      return tableResults;
    }

    /**
     * Gets the suggestedRefinements.
     *
     * Configuration for suggested refinements.
     *
     * @return the suggestedRefinements
     */
    public QueryLargeSuggestedRefinements suggestedRefinements() {
      return suggestedRefinements;
    }

    /**
     * Gets the passages.
     *
     * Configuration for passage retrieval.
     *
     * @return the passages
     */
    public QueryLargePassages passages() {
      return passages;
    }

    private QueryOptions(QueryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      projectId = builder.projectId;
      collectionIds = builder.collectionIds;
      filter = builder.filter;
      query = builder.query;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      aggregation = builder.aggregation;
      count = builder.count;
      xReturn = builder.xReturn;
      offset = builder.offset;
      xSort = builder.xSort;
      highlight = builder.highlight;
      spellingSuggestions = builder.spellingSuggestions;
      tableResults = builder.tableResults;
      suggestedRefinements = builder.suggestedRefinements;
      passages = builder.passages;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a QueryOptions builder
     */
    public QueryOptionsBuilder newBuilder() {
      return new QueryOptionsBuilder(this);
    }
  }

  /**
   * QueryOptions Builder.
   */
  public class QueryOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private List<String> collectionIds;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private String aggregation;
    private Long count;
    private List<String> xReturn;
    private Long offset;
    private String xSort;
    private Boolean highlight;
    private Boolean spellingSuggestions;
    private QueryLargeTableResults tableResults;
    private QueryLargeSuggestedRefinements suggestedRefinements;
    private QueryLargePassages passages;

    private QueryOptionsBuilder(QueryOptions queryOptions) {
      projectId = queryOptions.projectId;
      collectionIds = queryOptions.collectionIds;
      filter = queryOptions.filter;
      query = queryOptions.query;
      naturalLanguageQuery = queryOptions.naturalLanguageQuery;
      aggregation = queryOptions.aggregation;
      count = queryOptions.count;
      xReturn = queryOptions.xReturn;
      offset = queryOptions.offset;
      xSort = queryOptions.xSort;
      highlight = queryOptions.highlight;
      spellingSuggestions = queryOptions.spellingSuggestions;
      tableResults = queryOptions.tableResults;
      suggestedRefinements = queryOptions.suggestedRefinements;
      passages = queryOptions.passages;
      this.requestHeaders.putAll(queryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public QueryOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     */
    public QueryOptionsBuilder(String projectId) {
      this.projectId = projectId;
    }

    /**
     * Builds a QueryOptions.
     *
     * @return the queryOptions
     */
    public QueryOptions build() {
      return new QueryOptions(this);
    }

    /**
     * Adds an collectionIds to collectionIds.
     *
     * @param collectionIds the new collectionIds
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder addCollectionIds(String collectionIds) {
      IBMWatsonValidator.notNull(collectionIds, 'collectionIds cannot be null');
      if (this.collectionIds == null) {
        this.collectionIds = new List<String>();
      }
      this.collectionIds.add(collectionIds);
      return this;
    }

    /**
     * Adds an xReturn to xReturn.
     *
     * @param xReturn the new xReturn
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder addXReturn(String xReturn) {
      IBMWatsonValidator.notNull(xReturn, 'xReturn cannot be null');
      if (this.xReturn == null) {
        this.xReturn = new List<String>();
      }
      this.xReturn.add(xReturn);
      return this;
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the collectionIds.
     * Existing collectionIds will be replaced.
     *
     * @param collectionIds the collectionIds
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder collectionIds(List<String> collectionIds) {
      this.collectionIds = collectionIds;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the query.
     *
     * @param query the query
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder query(String query) {
      this.query = query;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the aggregation.
     *
     * @param aggregation the aggregation
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder aggregation(String aggregation) {
      this.aggregation = aggregation;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Set the xReturn.
     * Existing xReturn will be replaced.
     *
     * @param xReturn the xReturn
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder xReturn(List<String> xReturn) {
      this.xReturn = xReturn;
      return this;
    }

    /**
     * Set the offset.
     *
     * @param offset the offset
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder offset(Long offset) {
      this.offset = offset;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the highlight.
     *
     * @param highlight the highlight
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder highlight(Boolean highlight) {
      this.highlight = highlight;
      return this;
    }

    /**
     * Set the spellingSuggestions.
     *
     * @param spellingSuggestions the spellingSuggestions
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder spellingSuggestions(Boolean spellingSuggestions) {
      this.spellingSuggestions = spellingSuggestions;
      return this;
    }

    /**
     * Set the tableResults.
     *
     * @param tableResults the tableResults
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder tableResults(QueryLargeTableResults tableResults) {
      this.tableResults = tableResults;
      return this;
    }

    /**
     * Set the suggestedRefinements.
     *
     * @param suggestedRefinements the suggestedRefinements
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder suggestedRefinements(QueryLargeSuggestedRefinements suggestedRefinements) {
      this.suggestedRefinements = suggestedRefinements;
      return this;
    }

    /**
     * Set the passages.
     *
     * @param passages the passages
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder passages(QueryLargePassages passages) {
      this.passages = passages;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * A response containing the documents and aggregations for the query.
   */
  public class QueryResponse extends IBMWatsonResponseModel {
    private Long matchingResults;
    private List<QueryResult> results;
    private List<QueryAggregation> aggregations;
    private RetrievalDetails retrievalDetails;
    private String suggestedQuery;
    private List<QuerySuggestedRefinement> suggestedRefinements;
    private List<QueryTableResult> tableResults;

    /**
     * Gets the matchingResults.
     *
     * The number of matching results for the query.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the results.
     *
     * Array of document results for the query.
     *
     * @return the results
     */
    @AuraEnabled
    public List<QueryResult> getResults() {
      return results;
    }

    /**
     * Gets the aggregations.
     *
     * Array of aggregations for the query.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Gets the retrievalDetails.
     *
     * An object contain retrieval type information.
     *
     * @return the retrievalDetails
     */
    @AuraEnabled
    public RetrievalDetails getRetrievalDetails() {
      return retrievalDetails;
    }

    /**
     * Gets the suggestedQuery.
     *
     * Suggested correction to the submitted **natural_language_query** value.
     *
     * @return the suggestedQuery
     */
    @AuraEnabled
    public String getSuggestedQuery() {
      return suggestedQuery;
    }

    /**
     * Gets the suggestedRefinements.
     *
     * Array of suggested refinements.
     *
     * @return the suggestedRefinements
     */
    @AuraEnabled
    public List<QuerySuggestedRefinement> getSuggestedRefinements() {
      return suggestedRefinements;
    }

    /**
     * Gets the tableResults.
     *
     * Array of table results.
     *
     * @return the tableResults
     */
    @AuraEnabled
    public List<QueryTableResult> getTableResults() {
      return tableResults;
    }

    /**
     * Sets the matchingResults.
     *
     * @param matchingResults the new matchingResults
     */
    public void setMatchingResults(final long matchingResults) {
      this.matchingResults = matchingResults;
    }

    /**
     * Sets the results.
     *
     * @param results the new results
     */
    public void setResults(final List<QueryResult> results) {
      this.results = results;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<QueryAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    /**
     * Sets the retrievalDetails.
     *
     * @param retrievalDetails the new retrievalDetails
     */
    public void setRetrievalDetails(final RetrievalDetails retrievalDetails) {
      this.retrievalDetails = retrievalDetails;
    }

    /**
     * Sets the suggestedQuery.
     *
     * @param suggestedQuery the new suggestedQuery
     */
    public void setSuggestedQuery(final String suggestedQuery) {
      this.suggestedQuery = suggestedQuery;
    }

    /**
     * Sets the suggestedRefinements.
     *
     * @param suggestedRefinements the new suggestedRefinements
     */
    public void setSuggestedRefinements(final List<QuerySuggestedRefinement> suggestedRefinements) {
      this.suggestedRefinements = suggestedRefinements;
    }

    /**
     * Sets the tableResults.
     *
     * @param tableResults the new tableResults
     */
    public void setTableResults(final List<QueryTableResult> tableResults) {
      this.tableResults = tableResults;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults',
        'retrieval_details' => 'retrievalDetails',
        'suggested_query' => 'suggestedQuery',
        'suggested_refinements' => 'suggestedRefinements',
        'table_results' => 'tableResults'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryResponse ret = (QueryResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for results
      List<QueryResult> newResults = new List<QueryResult>();
      List<QueryResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          QueryResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          QueryResult newItem = (QueryResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryResult.class);
          newResults.add(newItem);
        }
        ret.results = newResults;
      }

      // calling custom deserializer for aggregations
      List<QueryAggregation> newAggregations = new List<QueryAggregation>();
      List<QueryAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          QueryAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          QueryAggregation newItem = (QueryAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      // calling custom deserializer for retrievalDetails
      Map<String, Object> retrievalDetailsMap = (Map<String, Object>) jsonMap.get('retrievalDetails');
      RetrievalDetails newRetrievalDetails = (RetrievalDetails) new RetrievalDetails().deserialize(JSON.serialize(retrievalDetailsMap, true), retrievalDetailsMap, RetrievalDetails.class);
      ret.setRetrievalDetails(newRetrievalDetails);

      // calling custom deserializer for suggestedRefinements
      List<QuerySuggestedRefinement> newSuggestedRefinements = new List<QuerySuggestedRefinement>();
      List<QuerySuggestedRefinement> deserializedSuggestedRefinements = ret.getSuggestedRefinements();
      if (deserializedSuggestedRefinements != null) {
        for (Integer i = 0; i < deserializedSuggestedRefinements.size(); i++) {
          QuerySuggestedRefinement currentItem = ret.getSuggestedRefinements().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('suggestedRefinements');
          QuerySuggestedRefinement newItem = (QuerySuggestedRefinement) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QuerySuggestedRefinement.class);
          newSuggestedRefinements.add(newItem);
        }
        ret.suggestedRefinements = newSuggestedRefinements;
      }

      // calling custom deserializer for tableResults
      List<QueryTableResult> newTableResults = new List<QueryTableResult>();
      List<QueryTableResult> deserializedTableResults = ret.getTableResults();
      if (deserializedTableResults != null) {
        for (Integer i = 0; i < deserializedTableResults.size(); i++) {
          QueryTableResult currentItem = ret.getTableResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tableResults');
          QueryTableResult newItem = (QueryTableResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryTableResult.class);
          newTableResults.add(newItem);
        }
        ret.tableResults = newTableResults;
      }

      return ret;
    }
  }

  /**
   * Result document for the specified query.
   */
  public class QueryResult extends IBMWatsonDynamicModel {
    private String documentId;
    private IBMWatsonMapModel metadata;
    private QueryResultMetadata resultMetadata;
    private List<QueryResultPassage> documentPassages;
    private Map<String, Object> additionalProperties;

    /**
     * Gets the documentId.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the metadata.
     *
     * @return the metadata
     */
    @AuraEnabled
    public IBMWatsonMapModel getMetadata() {
      return metadata;
    }

    /**
     * Gets the resultMetadata.
     *
     * @return the resultMetadata
     */
    @AuraEnabled
    public QueryResultMetadata getResultMetadata() {
      return resultMetadata;
    }

    /**
     * Gets the documentPassages.
     *
     * @return the documentPassages
     */
    @AuraEnabled
    public List<QueryResultPassage> getDocumentPassages() {
      return documentPassages;
    }

    /**
     * Gets the dynamic properties attached to QueryResult.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    /**
     * Sets the documentId.
     *
     * @param documentId the new documentId
     */
    public void setDocumentId(final String documentId) {
      this.documentId = documentId;
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
     * Sets the resultMetadata.
     *
     * @param resultMetadata the new resultMetadata
     */
    public void setResultMetadata(final QueryResultMetadata resultMetadata) {
      this.resultMetadata = resultMetadata;
    }

    /**
     * Sets the documentPassages.
     *
     * @param documentPassages the new documentPassages
     */
    public void setDocumentPassages(final List<QueryResultPassage> documentPassages) {
      this.documentPassages = documentPassages;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_id' => 'documentId',
        'result_metadata' => 'resultMetadata',
        'document_passages' => 'documentPassages'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryResult ret = (QueryResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      IBMWatsonMapModel newMetadata = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(metadataMap, true), metadataMap, IBMWatsonMapModel.class);
      ret.setMetadata(newMetadata);

      // calling custom deserializer for resultMetadata
      Map<String, Object> resultMetadataMap = (Map<String, Object>) jsonMap.get('resultMetadata');
      QueryResultMetadata newResultMetadata = (QueryResultMetadata) new QueryResultMetadata().deserialize(JSON.serialize(resultMetadataMap, true), resultMetadataMap, QueryResultMetadata.class);
      ret.setResultMetadata(newResultMetadata);

      // calling custom deserializer for documentPassages
      List<QueryResultPassage> newDocumentPassages = new List<QueryResultPassage>();
      List<QueryResultPassage> deserializedDocumentPassages = ret.getDocumentPassages();
      if (deserializedDocumentPassages != null) {
        for (Integer i = 0; i < deserializedDocumentPassages.size(); i++) {
          QueryResultPassage currentItem = ret.getDocumentPassages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('documentPassages');
          QueryResultPassage newItem = (QueryResultPassage) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryResultPassage.class);
          newDocumentPassages.add(newItem);
        }
        ret.setDocumentPassages(newDocumentPassages);
      }

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
   * Metadata of a query result.
   */
  public class QueryResultMetadata extends IBMWatsonGenericModel {
    private String documentRetrievalSource;
    private String collectionId;
    private Double confidence;

    /**
     * Gets the documentRetrievalSource.
     *
     * The document retrieval source that produced this search result.
     *
     * @return the documentRetrievalSource
     */
    @AuraEnabled
    public String getDocumentRetrievalSource() {
      return documentRetrievalSource;
    }

    /**
     * Gets the collectionId.
     *
     * The collection id associated with this training data set.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the confidence.
     *
     * The confidence score for the given result. Calculated based on how relevant the result is estimated to be.
     * confidence can range from `0.0` to `1.0`. The higher the number, the more relevant the document. The `confidence`
     * value for a result was calculated using the model specified in the `document_retrieval_strategy` field of the
     * result set. This field is only returned if the **natural_language_query** parameter is specified in the query.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }

    /**
     * Sets the documentRetrievalSource.
     *
     * @param documentRetrievalSource the new documentRetrievalSource
     */
    public void setDocumentRetrievalSource(final String documentRetrievalSource) {
      this.documentRetrievalSource = documentRetrievalSource;
    }

    /**
     * Sets the collectionId.
     *
     * @param collectionId the new collectionId
     */
    public void setCollectionId(final String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Sets the confidence.
     *
     * @param confidence the new confidence
     */
    public void setConfidence(final Double confidence) {
      this.confidence = confidence;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_retrieval_source' => 'documentRetrievalSource',
        'collection_id' => 'collectionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryResultMetadata ret = (QueryResultMetadata) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A passage query result.
   */
  public class QueryResultPassage extends IBMWatsonGenericModel {
    private String passageText;
    private Long startOffset;
    private Long endOffset;
    private String field;

    /**
     * Gets the passageText.
     *
     * The content of the extracted passage.
     *
     * @return the passageText
     */
    @AuraEnabled
    public String getPassageText() {
      return passageText;
    }

    /**
     * Gets the startOffset.
     *
     * The position of the first character of the extracted passage in the originating field.
     *
     * @return the startOffset
     */
    @AuraEnabled
    public Long getStartOffset() {
      return startOffset;
    }

    /**
     * Gets the endOffset.
     *
     * The position of the last character of the extracted passage in the originating field.
     *
     * @return the endOffset
     */
    @AuraEnabled
    public Long getEndOffset() {
      return endOffset;
    }

    /**
     * Gets the field.
     *
     * The label of the field from which the passage has been extracted.
     *
     * @return the field
     */
    @AuraEnabled
    public String getField() {
      return field;
    }

    /**
     * Sets the passageText.
     *
     * @param passageText the new passageText
     */
    public void setPassageText(final String passageText) {
      this.passageText = passageText;
    }

    /**
     * Sets the startOffset.
     *
     * @param startOffset the new startOffset
     */
    public void setStartOffset(final long startOffset) {
      this.startOffset = startOffset;
    }

    /**
     * Sets the endOffset.
     *
     * @param endOffset the new endOffset
     */
    public void setEndOffset(final long endOffset) {
      this.endOffset = endOffset;
    }

    /**
     * Sets the field.
     *
     * @param field the new field
     */
    public void setField(final String field) {
      this.field = field;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'passage_text' => 'passageText',
        'start_offset' => 'startOffset',
        'end_offset' => 'endOffset'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryResultPassage ret = (QueryResultPassage) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A suggested additional query term or terms user to filter results.
   */
  public class QuerySuggestedRefinement extends IBMWatsonGenericModel {
    private String text;

    /**
     * Gets the text.
     *
     * The text used to filter.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      QuerySuggestedRefinement ret = (QuerySuggestedRefinement) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A tables whose content or context match a search query.
   */
  public class QueryTableResult extends IBMWatsonGenericModel {
    private String tableId;
    private String sourceDocumentId;
    private String collectionId;
    private String tableHtml;
    private Long tableHtmlOffset;
    private TableResultTable table;

    /**
     * Gets the tableId.
     *
     * The identifier for the retrieved table.
     *
     * @return the tableId
     */
    @AuraEnabled
    public String getTableId() {
      return tableId;
    }

    /**
     * Gets the sourceDocumentId.
     *
     * The identifier of the document the table was retrieved from.
     *
     * @return the sourceDocumentId
     */
    @AuraEnabled
    public String getSourceDocumentId() {
      return sourceDocumentId;
    }

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection the table was retrieved from.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the tableHtml.
     *
     * HTML snippet of the table info.
     *
     * @return the tableHtml
     */
    @AuraEnabled
    public String getTableHtml() {
      return tableHtml;
    }

    /**
     * Gets the tableHtmlOffset.
     *
     * The offset of the table html snippet in the original document html.
     *
     * @return the tableHtmlOffset
     */
    @AuraEnabled
    public Long getTableHtmlOffset() {
      return tableHtmlOffset;
    }

    /**
     * Gets the table.
     *
     * Full table object retrieved from Table Understanding Enrichment.
     *
     * @return the table
     */
    @AuraEnabled
    public TableResultTable getTable() {
      return table;
    }

    /**
     * Sets the tableId.
     *
     * @param tableId the new tableId
     */
    public void setTableId(final String tableId) {
      this.tableId = tableId;
    }

    /**
     * Sets the sourceDocumentId.
     *
     * @param sourceDocumentId the new sourceDocumentId
     */
    public void setSourceDocumentId(final String sourceDocumentId) {
      this.sourceDocumentId = sourceDocumentId;
    }

    /**
     * Sets the collectionId.
     *
     * @param collectionId the new collectionId
     */
    public void setCollectionId(final String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Sets the tableHtml.
     *
     * @param tableHtml the new tableHtml
     */
    public void setTableHtml(final String tableHtml) {
      this.tableHtml = tableHtml;
    }

    /**
     * Sets the tableHtmlOffset.
     *
     * @param tableHtmlOffset the new tableHtmlOffset
     */
    public void setTableHtmlOffset(final long tableHtmlOffset) {
      this.tableHtmlOffset = tableHtmlOffset;
    }

    /**
     * Sets the table.
     *
     * @param table the new table
     */
    public void setTable(final TableResultTable table) {
      this.table = table;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'table_id' => 'tableId',
        'source_document_id' => 'sourceDocumentId',
        'collection_id' => 'collectionId',
        'table_html' => 'tableHtml',
        'table_html_offset' => 'tableHtmlOffset'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryTableResult ret = (QueryTableResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for table
      Map<String, Object> tableMap = (Map<String, Object>) jsonMap.get('table');
      TableResultTable newTable = (TableResultTable) new TableResultTable().deserialize(JSON.serialize(tableMap, true), tableMap, TableResultTable.class);
      ret.setTable(newTable);

      return ret;
    }
  }

  /**
   * Top value result for the term aggregation.
   */
  public class QueryTermAggregationResult extends IBMWatsonGenericModel {
    private String key;
    private Long matchingResults;
    private List<QueryAggregation> aggregations;

    /**
     * Gets the key.
     *
     * Value of the field with a non-zero frequency in the document set.
     *
     * @return the key
     */
    @AuraEnabled
    public String getKey() {
      return key;
    }

    /**
     * Gets the matchingResults.
     *
     * Number of documents containing the 'key'.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the aggregations.
     *
     * An array of sub aggregations.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Sets the key.
     *
     * @param key the new key
     */
    public void setKey(final String key) {
      this.key = key;
    }

    /**
     * Sets the matchingResults.
     *
     * @param matchingResults the new matchingResults
     */
    public void setMatchingResults(final long matchingResults) {
      this.matchingResults = matchingResults;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<QueryAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryTermAggregationResult ret = (QueryTermAggregationResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for aggregations
      List<QueryAggregation> newAggregations = new List<QueryAggregation>();
      List<QueryAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          QueryAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          QueryAggregation newItem = (QueryAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      return ret;
    }
  }

  /**
   * A timeslice interval segment.
   */
  public class QueryTimesliceAggregationResult extends IBMWatsonGenericModel {
    private String keyAsString;
    private Long key;
    private Long matchingResults;
    private List<QueryAggregation> aggregations;

    /**
     * Gets the keyAsString.
     *
     * String date value of the upper bound for the timeslice interval in ISO-8601 format.
     *
     * @return the keyAsString
     */
    @AuraEnabled
    public String getKeyAsString() {
      return keyAsString;
    }

    /**
     * Gets the key.
     *
     * Numeric date value of the upper bound for the timeslice interval in UNIX milliseconds since epoch.
     *
     * @return the key
     */
    @AuraEnabled
    public Long getKey() {
      return key;
    }

    /**
     * Gets the matchingResults.
     *
     * Number of documents with the specified key as the upper bound.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the aggregations.
     *
     * An array of sub aggregations.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Sets the keyAsString.
     *
     * @param keyAsString the new keyAsString
     */
    public void setKeyAsString(final String keyAsString) {
      this.keyAsString = keyAsString;
    }

    /**
     * Sets the key.
     *
     * @param key the new key
     */
    public void setKey(final long key) {
      this.key = key;
    }

    /**
     * Sets the matchingResults.
     *
     * @param matchingResults the new matchingResults
     */
    public void setMatchingResults(final long matchingResults) {
      this.matchingResults = matchingResults;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<QueryAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'key_as_string' => 'keyAsString',
        'matching_results' => 'matchingResults'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryTimesliceAggregationResult ret = (QueryTimesliceAggregationResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for aggregations
      List<QueryAggregation> newAggregations = new List<QueryAggregation>();
      List<QueryAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          QueryAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          QueryAggregation newItem = (QueryAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      return ret;
    }
  }

  /**
   * A query response containing the matching documents for the preceding aggregations.
   */
  public class QueryTopHitsAggregationResult extends IBMWatsonGenericModel {
    private Long matchingResults;
    private List<IBMWatsonMapModel> hits;

    /**
     * Gets the matchingResults.
     *
     * Number of matching results.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the hits.
     *
     * An array of the document results.
     *
     * @return the hits
     */
    @AuraEnabled
    public List<IBMWatsonMapModel> getHits() {
      return hits;
    }

    /**
     * Sets the matchingResults.
     *
     * @param matchingResults the new matchingResults
     */
    public void setMatchingResults(final long matchingResults) {
      this.matchingResults = matchingResults;
    }

    /**
     * Sets the hits.
     *
     * @param hits the new hits
     */
    public void setHits(final List<IBMWatsonMapModel> hits) {
      this.hits = hits;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryTopHitsAggregationResult ret = (QueryTopHitsAggregationResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for hits
      List<IBMWatsonMapModel> newHits = new List<IBMWatsonMapModel>();
      List<IBMWatsonMapModel> deserializedHits = ret.getHits();
      if (deserializedHits != null) {
        for (Integer i = 0; i < deserializedHits.size(); i++) {
          IBMWatsonMapModel currentItem = ret.getHits().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('hits');
          IBMWatsonMapModel newItem = (IBMWatsonMapModel) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), IBMWatsonMapModel.class);
          newHits.add(newItem);
        }
        ret.hits = newHits;
      }

      return ret;
    }
  }

  /**
   * An object contain retrieval type information.
   */
  public class RetrievalDetails extends IBMWatsonGenericModel {
    private String documentRetrievalStrategy;

    /**
     * Gets the documentRetrievalStrategy.
     *
     * Identifies the document retrieval strategy used for this query. `relevancy_training` indicates that the results
     * were returned using a relevancy trained model.
     *
     *  **Note**: In the event of trained collections being queried, but the trained model is not used to return
     * results, the **document_retrieval_strategy** will be listed as `untrained`.
     *
     * @return the documentRetrievalStrategy
     */
    @AuraEnabled
    public String getDocumentRetrievalStrategy() {
      return documentRetrievalStrategy;
    }

    /**
     * Sets the documentRetrievalStrategy.
     *
     * @param documentRetrievalStrategy the new documentRetrievalStrategy
     */
    public void setDocumentRetrievalStrategy(final String documentRetrievalStrategy) {
      this.documentRetrievalStrategy = documentRetrievalStrategy;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_retrieval_strategy' => 'documentRetrievalStrategy'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      RetrievalDetails ret = (RetrievalDetails) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Cells that are not table header, column header, or row header cells.
   */
  public class TableBodyCells extends IBMWatsonGenericModel {
    private String cellId;
    private TableElementLocation location;
    private String text;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;
    private List<TableRowHeaderIds> rowHeaderIds;
    private List<TableRowHeaderTexts> rowHeaderTexts;
    private List<TableRowHeaderTextsNormalized> rowHeaderTextsNormalized;
    private List<TableColumnHeaderIds> columnHeaderIds;
    private List<TableColumnHeaderTexts> columnHeaderTexts;
    private List<TableColumnHeaderTextsNormalized> columnHeaderTextsNormalized;
    private List<DocumentAttribute> attributes;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public TableElementLocation getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of this cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Gets the rowHeaderIds.
     *
     * A list of table row header ids.
     *
     * @return the rowHeaderIds
     */
    @AuraEnabled
    public List<TableRowHeaderIds> getRowHeaderIds() {
      return rowHeaderIds;
    }

    /**
     * Gets the rowHeaderTexts.
     *
     * A list of table row header texts.
     *
     * @return the rowHeaderTexts
     */
    @AuraEnabled
    public List<TableRowHeaderTexts> getRowHeaderTexts() {
      return rowHeaderTexts;
    }

    /**
     * Gets the rowHeaderTextsNormalized.
     *
     * A list of table row header texts normalized.
     *
     * @return the rowHeaderTextsNormalized
     */
    @AuraEnabled
    public List<TableRowHeaderTextsNormalized> getRowHeaderTextsNormalized() {
      return rowHeaderTextsNormalized;
    }

    /**
     * Gets the columnHeaderIds.
     *
     * A list of table column header ids.
     *
     * @return the columnHeaderIds
     */
    @AuraEnabled
    public List<TableColumnHeaderIds> getColumnHeaderIds() {
      return columnHeaderIds;
    }

    /**
     * Gets the columnHeaderTexts.
     *
     * A list of table column header texts.
     *
     * @return the columnHeaderTexts
     */
    @AuraEnabled
    public List<TableColumnHeaderTexts> getColumnHeaderTexts() {
      return columnHeaderTexts;
    }

    /**
     * Gets the columnHeaderTextsNormalized.
     *
     * A list of table column header texts normalized.
     *
     * @return the columnHeaderTextsNormalized
     */
    @AuraEnabled
    public List<TableColumnHeaderTextsNormalized> getColumnHeaderTextsNormalized() {
      return columnHeaderTextsNormalized;
    }

    /**
     * Gets the attributes.
     *
     * A list of document attributes.
     *
     * @return the attributes
     */
    @AuraEnabled
    public List<DocumentAttribute> getAttributes() {
      return attributes;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final TableElementLocation location) {
      this.location = location;
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
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    /**
     * Sets the rowHeaderIds.
     *
     * @param rowHeaderIds the new rowHeaderIds
     */
    public void setRowHeaderIds(final List<TableRowHeaderIds> rowHeaderIds) {
      this.rowHeaderIds = rowHeaderIds;
    }

    /**
     * Sets the rowHeaderTexts.
     *
     * @param rowHeaderTexts the new rowHeaderTexts
     */
    public void setRowHeaderTexts(final List<TableRowHeaderTexts> rowHeaderTexts) {
      this.rowHeaderTexts = rowHeaderTexts;
    }

    /**
     * Sets the rowHeaderTextsNormalized.
     *
     * @param rowHeaderTextsNormalized the new rowHeaderTextsNormalized
     */
    public void setRowHeaderTextsNormalized(final List<TableRowHeaderTextsNormalized> rowHeaderTextsNormalized) {
      this.rowHeaderTextsNormalized = rowHeaderTextsNormalized;
    }

    /**
     * Sets the columnHeaderIds.
     *
     * @param columnHeaderIds the new columnHeaderIds
     */
    public void setColumnHeaderIds(final List<TableColumnHeaderIds> columnHeaderIds) {
      this.columnHeaderIds = columnHeaderIds;
    }

    /**
     * Sets the columnHeaderTexts.
     *
     * @param columnHeaderTexts the new columnHeaderTexts
     */
    public void setColumnHeaderTexts(final List<TableColumnHeaderTexts> columnHeaderTexts) {
      this.columnHeaderTexts = columnHeaderTexts;
    }

    /**
     * Sets the columnHeaderTextsNormalized.
     *
     * @param columnHeaderTextsNormalized the new columnHeaderTextsNormalized
     */
    public void setColumnHeaderTextsNormalized(final List<TableColumnHeaderTextsNormalized> columnHeaderTextsNormalized) {
      this.columnHeaderTextsNormalized = columnHeaderTextsNormalized;
    }

    /**
     * Sets the attributes.
     *
     * @param attributes the new attributes
     */
    public void setAttributes(final List<DocumentAttribute> attributes) {
      this.attributes = attributes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd',
        'row_header_ids' => 'rowHeaderIds',
        'row_header_texts' => 'rowHeaderTexts',
        'row_header_texts_normalized' => 'rowHeaderTextsNormalized',
        'column_header_ids' => 'columnHeaderIds',
        'column_header_texts' => 'columnHeaderTexts',
        'column_header_texts_normalized' => 'columnHeaderTextsNormalized'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableBodyCells ret = (TableBodyCells) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      TableElementLocation newLocation = (TableElementLocation) new TableElementLocation().deserialize(JSON.serialize(locationMap, true), locationMap, TableElementLocation.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for rowHeaderIds
      List<TableRowHeaderIds> newRowHeaderIds = new List<TableRowHeaderIds>();
      List<TableRowHeaderIds> deserializedRowHeaderIds = ret.getRowHeaderIds();
      if (deserializedRowHeaderIds != null) {
        for (Integer i = 0; i < deserializedRowHeaderIds.size(); i++) {
          TableRowHeaderIds currentItem = ret.getRowHeaderIds().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('rowHeaderIds');
          TableRowHeaderIds newItem = (TableRowHeaderIds) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableRowHeaderIds.class);
          newRowHeaderIds.add(newItem);
        }
        ret.rowHeaderIds = newRowHeaderIds;
      }

      // calling custom deserializer for rowHeaderTexts
      List<TableRowHeaderTexts> newRowHeaderTexts = new List<TableRowHeaderTexts>();
      List<TableRowHeaderTexts> deserializedRowHeaderTexts = ret.getRowHeaderTexts();
      if (deserializedRowHeaderTexts != null) {
        for (Integer i = 0; i < deserializedRowHeaderTexts.size(); i++) {
          TableRowHeaderTexts currentItem = ret.getRowHeaderTexts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('rowHeaderTexts');
          TableRowHeaderTexts newItem = (TableRowHeaderTexts) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableRowHeaderTexts.class);
          newRowHeaderTexts.add(newItem);
        }
        ret.rowHeaderTexts = newRowHeaderTexts;
      }

      // calling custom deserializer for rowHeaderTextsNormalized
      List<TableRowHeaderTextsNormalized> newRowHeaderTextsNormalized = new List<TableRowHeaderTextsNormalized>();
      List<TableRowHeaderTextsNormalized> deserializedRowHeaderTextsNormalized = ret.getRowHeaderTextsNormalized();
      if (deserializedRowHeaderTextsNormalized != null) {
        for (Integer i = 0; i < deserializedRowHeaderTextsNormalized.size(); i++) {
          TableRowHeaderTextsNormalized currentItem = ret.getRowHeaderTextsNormalized().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('rowHeaderTextsNormalized');
          TableRowHeaderTextsNormalized newItem = (TableRowHeaderTextsNormalized) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableRowHeaderTextsNormalized.class);
          newRowHeaderTextsNormalized.add(newItem);
        }
        ret.rowHeaderTextsNormalized = newRowHeaderTextsNormalized;
      }

      // calling custom deserializer for columnHeaderIds
      List<TableColumnHeaderIds> newColumnHeaderIds = new List<TableColumnHeaderIds>();
      List<TableColumnHeaderIds> deserializedColumnHeaderIds = ret.getColumnHeaderIds();
      if (deserializedColumnHeaderIds != null) {
        for (Integer i = 0; i < deserializedColumnHeaderIds.size(); i++) {
          TableColumnHeaderIds currentItem = ret.getColumnHeaderIds().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('columnHeaderIds');
          TableColumnHeaderIds newItem = (TableColumnHeaderIds) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableColumnHeaderIds.class);
          newColumnHeaderIds.add(newItem);
        }
        ret.columnHeaderIds = newColumnHeaderIds;
      }

      // calling custom deserializer for columnHeaderTexts
      List<TableColumnHeaderTexts> newColumnHeaderTexts = new List<TableColumnHeaderTexts>();
      List<TableColumnHeaderTexts> deserializedColumnHeaderTexts = ret.getColumnHeaderTexts();
      if (deserializedColumnHeaderTexts != null) {
        for (Integer i = 0; i < deserializedColumnHeaderTexts.size(); i++) {
          TableColumnHeaderTexts currentItem = ret.getColumnHeaderTexts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('columnHeaderTexts');
          TableColumnHeaderTexts newItem = (TableColumnHeaderTexts) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableColumnHeaderTexts.class);
          newColumnHeaderTexts.add(newItem);
        }
        ret.columnHeaderTexts = newColumnHeaderTexts;
      }

      // calling custom deserializer for columnHeaderTextsNormalized
      List<TableColumnHeaderTextsNormalized> newColumnHeaderTextsNormalized = new List<TableColumnHeaderTextsNormalized>();
      List<TableColumnHeaderTextsNormalized> deserializedColumnHeaderTextsNormalized = ret.getColumnHeaderTextsNormalized();
      if (deserializedColumnHeaderTextsNormalized != null) {
        for (Integer i = 0; i < deserializedColumnHeaderTextsNormalized.size(); i++) {
          TableColumnHeaderTextsNormalized currentItem = ret.getColumnHeaderTextsNormalized().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('columnHeaderTextsNormalized');
          TableColumnHeaderTextsNormalized newItem = (TableColumnHeaderTextsNormalized) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableColumnHeaderTextsNormalized.class);
          newColumnHeaderTextsNormalized.add(newItem);
        }
        ret.columnHeaderTextsNormalized = newColumnHeaderTextsNormalized;
      }

      // calling custom deserializer for attributes
      List<DocumentAttribute> newAttributes = new List<DocumentAttribute>();
      List<DocumentAttribute> deserializedAttributes = ret.getAttributes();
      if (deserializedAttributes != null) {
        for (Integer i = 0; i < deserializedAttributes.size(); i++) {
          DocumentAttribute currentItem = ret.getAttributes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('attributes');
          DocumentAttribute newItem = (DocumentAttribute) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DocumentAttribute.class);
          newAttributes.add(newItem);
        }
        ret.attributes = newAttributes;
      }

      return ret;
    }
  }

  /**
   * A key in a key-value pair.
   */
  public class TableCellKey extends IBMWatsonGenericModel {
    private String cellId;
    private TableElementLocation location;
    private String text;

    /**
     * Gets the cellId.
     *
     * The unique ID of the key in the table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public TableElementLocation getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text content of the table cell without HTML markup.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final TableElementLocation location) {
      this.location = location;
    }

    /**
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableCellKey ret = (TableCellKey) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      TableElementLocation newLocation = (TableElementLocation) new TableElementLocation().deserialize(JSON.serialize(locationMap, true), locationMap, TableElementLocation.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * A value in a key-value pair.
   */
  public class TableCellValues extends IBMWatsonGenericModel {
    private String cellId;
    private TableElementLocation location;
    private String text;

    /**
     * Gets the cellId.
     *
     * The unique ID of the value in the table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public TableElementLocation getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text content of the table cell without HTML markup.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final TableElementLocation location) {
      this.location = location;
    }

    /**
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableCellValues ret = (TableCellValues) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      TableElementLocation newLocation = (TableElementLocation) new TableElementLocation().deserialize(JSON.serialize(locationMap, true), locationMap, TableElementLocation.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * An array of values, each being the `id` value of a column header that is applicable to the current cell.
   */
  public class TableColumnHeaderIds extends IBMWatsonGenericModel {
    private String id;

    /**
     * Gets the id.
     *
     * The `id` value of a column header.
     *
     * @return the id
     */
    @AuraEnabled
    public String getId() {
      return id;
    }

    /**
     * Sets the id.
     *
     * @param id the new id
     */
    public void setId(final String id) {
      this.id = id;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TableColumnHeaderIds ret = (TableColumnHeaderIds) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * An array of values, each being the `text` value of a column header that is applicable to the current cell.
   */
  public class TableColumnHeaderTexts extends IBMWatsonGenericModel {
    private String text;

    /**
     * Gets the text.
     *
     * The `text` value of a column header.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TableColumnHeaderTexts ret = (TableColumnHeaderTexts) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * If you provide customization input, the normalized version of the column header texts according to the
   * customization; otherwise, the same value as `column_header_texts`.
   */
  public class TableColumnHeaderTextsNormalized extends IBMWatsonGenericModel {
    private String textNormalized;

    /**
     * Gets the textNormalized.
     *
     * The normalized version of a column header text.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'text_normalized' => 'textNormalized'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableColumnHeaderTextsNormalized ret = (TableColumnHeaderTextsNormalized) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Column-level cells, each applicable as a header to other cells in the same column as itself, of the current table.
   */
  public class TableColumnHeaders extends IBMWatsonGenericModel {
    private String cellId;
    private IBMWatsonMapModel location;
    private String text;
    private String textNormalized;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The location of the column header cell in the current table as defined by its `begin` and `end` offsets,
     * respectfully, in the input document.
     *
     * @return the location
     */
    @AuraEnabled
    public IBMWatsonMapModel getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of this cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * If you provide customization input, the normalized version of the cell text according to the customization;
     * otherwise, the same value as `text`.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final IBMWatsonMapModel location) {
      this.location = location;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'text_normalized' => 'textNormalized',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableColumnHeaders ret = (TableColumnHeaders) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      IBMWatsonMapModel newLocation = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(locationMap, true), locationMap, IBMWatsonMapModel.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
   * `end`.
   */
  public class TableElementLocation extends IBMWatsonGenericModel {
    private Long xBegin;
    private Long xEnd;

    /**
     * Gets the xBegin.
     *
     * The element's `begin` index.
     *
     * @return the xBegin
     */
    @AuraEnabled
    public Long getXBegin() {
      return xBegin;
    }

    /**
     * Gets the xEnd.
     *
     * The element's `end` index.
     *
     * @return the xEnd
     */
    @AuraEnabled
    public Long getXEnd() {
      return xEnd;
    }

    /**
     * Sets the xBegin.
     *
     * @param xBegin the new xBegin
     */
    public void setXBegin(final long xBegin) {
      this.xBegin = xBegin;
    }

    /**
     * Sets the xEnd.
     *
     * @param xEnd the new xEnd
     */
    public void setXEnd(final long xEnd) {
      this.xEnd = xEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'begin' => 'xBegin',
        'end' => 'xEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableElementLocation ret = (TableElementLocation) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The contents of the current table's header.
   */
  public class TableHeaders extends IBMWatsonGenericModel {
    private String cellId;
    private IBMWatsonMapModel location;
    private String text;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The location of the table header cell in the current table as defined by its `begin` and `end` offsets,
     * respectfully, in the input document.
     *
     * @return the location
     */
    @AuraEnabled
    public IBMWatsonMapModel getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of the cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final IBMWatsonMapModel location) {
      this.location = location;
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
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableHeaders ret = (TableHeaders) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      IBMWatsonMapModel newLocation = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(locationMap, true), locationMap, IBMWatsonMapModel.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Key-value pairs detected across cell boundaries.
   */
  public class TableKeyValuePairs extends IBMWatsonGenericModel {
    private TableCellKey key;
    private List<TableCellValues> value;

    /**
     * Gets the key.
     *
     * A key in a key-value pair.
     *
     * @return the key
     */
    @AuraEnabled
    public TableCellKey getKey() {
      return key;
    }

    /**
     * Gets the value.
     *
     * A list of values in a key-value pair.
     *
     * @return the value
     */
    @AuraEnabled
    public List<TableCellValues> getValue() {
      return value;
    }

    /**
     * Sets the key.
     *
     * @param key the new key
     */
    public void setKey(final TableCellKey key) {
      this.key = key;
    }

    /**
     * Sets the value.
     *
     * @param value the new value
     */
    public void setValue(final List<TableCellValues> value) {
      this.value = value;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TableKeyValuePairs ret = (TableKeyValuePairs) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for key
      Map<String, Object> keyMap = (Map<String, Object>) jsonMap.get('key');
      TableCellKey newKey = (TableCellKey) new TableCellKey().deserialize(JSON.serialize(keyMap, true), keyMap, TableCellKey.class);
      ret.setKey(newKey);

      // calling custom deserializer for value
      List<TableCellValues> newValue = new List<TableCellValues>();
      List<TableCellValues> deserializedValue = ret.getValue();
      if (deserializedValue != null) {
        for (Integer i = 0; i < deserializedValue.size(); i++) {
          TableCellValues currentItem = ret.getValue().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('value');
          TableCellValues newItem = (TableCellValues) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableCellValues.class);
          newValue.add(newItem);
        }
        ret.value = newValue;
      }

      return ret;
    }
  }

  /**
   * Full table object retrieved from Table Understanding Enrichment.
   */
  public class TableResultTable extends IBMWatsonGenericModel {
    private TableElementLocation location;
    private String text;
    private TableTextLocation sectionTitle;
    private TableTextLocation title;
    private List<TableHeaders> tableHeaders;
    private List<TableRowHeaders> rowHeaders;
    private List<TableColumnHeaders> columnHeaders;
    private List<TableKeyValuePairs> keyValuePairs;
    private List<TableBodyCells> bodyCells;
    private List<TableTextLocation> contexts;

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public TableElementLocation getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of the current table from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the sectionTitle.
     *
     * Text and associated location within a table.
     *
     * @return the sectionTitle
     */
    @AuraEnabled
    public TableTextLocation getSectionTitle() {
      return sectionTitle;
    }

    /**
     * Gets the title.
     *
     * Text and associated location within a table.
     *
     * @return the title
     */
    @AuraEnabled
    public TableTextLocation getTitle() {
      return title;
    }

    /**
     * Gets the tableHeaders.
     *
     * An array of table-level cells that apply as headers to all the other cells in the current table.
     *
     * @return the tableHeaders
     */
    @AuraEnabled
    public List<TableHeaders> getTableHeaders() {
      return tableHeaders;
    }

    /**
     * Gets the rowHeaders.
     *
     * An array of row-level cells, each applicable as a header to other cells in the same row as itself, of the current
     * table.
     *
     * @return the rowHeaders
     */
    @AuraEnabled
    public List<TableRowHeaders> getRowHeaders() {
      return rowHeaders;
    }

    /**
     * Gets the columnHeaders.
     *
     * An array of column-level cells, each applicable as a header to other cells in the same column as itself, of the
     * current table.
     *
     * @return the columnHeaders
     */
    @AuraEnabled
    public List<TableColumnHeaders> getColumnHeaders() {
      return columnHeaders;
    }

    /**
     * Gets the keyValuePairs.
     *
     * An array of key-value pairs identified in the current table.
     *
     * @return the keyValuePairs
     */
    @AuraEnabled
    public List<TableKeyValuePairs> getKeyValuePairs() {
      return keyValuePairs;
    }

    /**
     * Gets the bodyCells.
     *
     * An array of cells that are neither table header nor column header nor row header cells, of the current table with
     * corresponding row and column header associations.
     *
     * @return the bodyCells
     */
    @AuraEnabled
    public List<TableBodyCells> getBodyCells() {
      return bodyCells;
    }

    /**
     * Gets the contexts.
     *
     * An array of lists of textual entries across the document related to the current table being parsed.
     *
     * @return the contexts
     */
    @AuraEnabled
    public List<TableTextLocation> getContexts() {
      return contexts;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final TableElementLocation location) {
      this.location = location;
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
     * Sets the sectionTitle.
     *
     * @param sectionTitle the new sectionTitle
     */
    public void setSectionTitle(final TableTextLocation sectionTitle) {
      this.sectionTitle = sectionTitle;
    }

    /**
     * Sets the title.
     *
     * @param title the new title
     */
    public void setTitle(final TableTextLocation title) {
      this.title = title;
    }

    /**
     * Sets the tableHeaders.
     *
     * @param tableHeaders the new tableHeaders
     */
    public void setTableHeaders(final List<TableHeaders> tableHeaders) {
      this.tableHeaders = tableHeaders;
    }

    /**
     * Sets the rowHeaders.
     *
     * @param rowHeaders the new rowHeaders
     */
    public void setRowHeaders(final List<TableRowHeaders> rowHeaders) {
      this.rowHeaders = rowHeaders;
    }

    /**
     * Sets the columnHeaders.
     *
     * @param columnHeaders the new columnHeaders
     */
    public void setColumnHeaders(final List<TableColumnHeaders> columnHeaders) {
      this.columnHeaders = columnHeaders;
    }

    /**
     * Sets the keyValuePairs.
     *
     * @param keyValuePairs the new keyValuePairs
     */
    public void setKeyValuePairs(final List<TableKeyValuePairs> keyValuePairs) {
      this.keyValuePairs = keyValuePairs;
    }

    /**
     * Sets the bodyCells.
     *
     * @param bodyCells the new bodyCells
     */
    public void setBodyCells(final List<TableBodyCells> bodyCells) {
      this.bodyCells = bodyCells;
    }

    /**
     * Sets the contexts.
     *
     * @param contexts the new contexts
     */
    public void setContexts(final List<TableTextLocation> contexts) {
      this.contexts = contexts;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'section_title' => 'sectionTitle',
        'table_headers' => 'tableHeaders',
        'row_headers' => 'rowHeaders',
        'column_headers' => 'columnHeaders',
        'key_value_pairs' => 'keyValuePairs',
        'body_cells' => 'bodyCells'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableResultTable ret = (TableResultTable) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      TableElementLocation newLocation = (TableElementLocation) new TableElementLocation().deserialize(JSON.serialize(locationMap, true), locationMap, TableElementLocation.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for sectionTitle
      Map<String, Object> sectionTitleMap = (Map<String, Object>) jsonMap.get('sectionTitle');
      TableTextLocation newSectionTitle = (TableTextLocation) new TableTextLocation().deserialize(JSON.serialize(sectionTitleMap, true), sectionTitleMap, TableTextLocation.class);
      ret.setSectionTitle(newSectionTitle);

      // calling custom deserializer for title
      Map<String, Object> titleMap = (Map<String, Object>) jsonMap.get('title');
      TableTextLocation newTitle = (TableTextLocation) new TableTextLocation().deserialize(JSON.serialize(titleMap, true), titleMap, TableTextLocation.class);
      ret.setTitle(newTitle);

      // calling custom deserializer for tableHeaders
      List<TableHeaders> newTableHeaders = new List<TableHeaders>();
      List<TableHeaders> deserializedTableHeaders = ret.getTableHeaders();
      if (deserializedTableHeaders != null) {
        for (Integer i = 0; i < deserializedTableHeaders.size(); i++) {
          TableHeaders currentItem = ret.getTableHeaders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tableHeaders');
          TableHeaders newItem = (TableHeaders) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableHeaders.class);
          newTableHeaders.add(newItem);
        }
        ret.tableHeaders = newTableHeaders;
      }

      // calling custom deserializer for rowHeaders
      List<TableRowHeaders> newRowHeaders = new List<TableRowHeaders>();
      List<TableRowHeaders> deserializedRowHeaders = ret.getRowHeaders();
      if (deserializedRowHeaders != null) {
        for (Integer i = 0; i < deserializedRowHeaders.size(); i++) {
          TableRowHeaders currentItem = ret.getRowHeaders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('rowHeaders');
          TableRowHeaders newItem = (TableRowHeaders) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableRowHeaders.class);
          newRowHeaders.add(newItem);
        }
        ret.rowHeaders = newRowHeaders;
      }

      // calling custom deserializer for columnHeaders
      List<TableColumnHeaders> newColumnHeaders = new List<TableColumnHeaders>();
      List<TableColumnHeaders> deserializedColumnHeaders = ret.getColumnHeaders();
      if (deserializedColumnHeaders != null) {
        for (Integer i = 0; i < deserializedColumnHeaders.size(); i++) {
          TableColumnHeaders currentItem = ret.getColumnHeaders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('columnHeaders');
          TableColumnHeaders newItem = (TableColumnHeaders) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableColumnHeaders.class);
          newColumnHeaders.add(newItem);
        }
        ret.columnHeaders = newColumnHeaders;
      }

      // calling custom deserializer for keyValuePairs
      List<TableKeyValuePairs> newKeyValuePairs = new List<TableKeyValuePairs>();
      List<TableKeyValuePairs> deserializedKeyValuePairs = ret.getKeyValuePairs();
      if (deserializedKeyValuePairs != null) {
        for (Integer i = 0; i < deserializedKeyValuePairs.size(); i++) {
          TableKeyValuePairs currentItem = ret.getKeyValuePairs().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('keyValuePairs');
          TableKeyValuePairs newItem = (TableKeyValuePairs) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableKeyValuePairs.class);
          newKeyValuePairs.add(newItem);
        }
        ret.keyValuePairs = newKeyValuePairs;
      }

      // calling custom deserializer for bodyCells
      List<TableBodyCells> newBodyCells = new List<TableBodyCells>();
      List<TableBodyCells> deserializedBodyCells = ret.getBodyCells();
      if (deserializedBodyCells != null) {
        for (Integer i = 0; i < deserializedBodyCells.size(); i++) {
          TableBodyCells currentItem = ret.getBodyCells().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('bodyCells');
          TableBodyCells newItem = (TableBodyCells) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableBodyCells.class);
          newBodyCells.add(newItem);
        }
        ret.bodyCells = newBodyCells;
      }

      // calling custom deserializer for contexts
      List<TableTextLocation> newContexts = new List<TableTextLocation>();
      List<TableTextLocation> deserializedContexts = ret.getContexts();
      if (deserializedContexts != null) {
        for (Integer i = 0; i < deserializedContexts.size(); i++) {
          TableTextLocation currentItem = ret.getContexts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('contexts');
          TableTextLocation newItem = (TableTextLocation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableTextLocation.class);
          newContexts.add(newItem);
        }
        ret.contexts = newContexts;
      }

      return ret;
    }
  }

  /**
   * An array of values, each being the `id` value of a row header that is applicable to this body cell.
   */
  public class TableRowHeaderIds extends IBMWatsonGenericModel {
    private String id;

    /**
     * Gets the id.
     *
     * The `id` values of a row header.
     *
     * @return the id
     */
    @AuraEnabled
    public String getId() {
      return id;
    }

    /**
     * Sets the id.
     *
     * @param id the new id
     */
    public void setId(final String id) {
      this.id = id;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TableRowHeaderIds ret = (TableRowHeaderIds) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * An array of values, each being the `text` value of a row header that is applicable to this body cell.
   */
  public class TableRowHeaderTexts extends IBMWatsonGenericModel {
    private String text;

    /**
     * Gets the text.
     *
     * The `text` value of a row header.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TableRowHeaderTexts ret = (TableRowHeaderTexts) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * If you provide customization input, the normalized version of the row header texts according to the customization;
   * otherwise, the same value as `row_header_texts`.
   */
  public class TableRowHeaderTextsNormalized extends IBMWatsonGenericModel {
    private String textNormalized;

    /**
     * Gets the textNormalized.
     *
     * The normalized version of a row header text.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'text_normalized' => 'textNormalized'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableRowHeaderTextsNormalized ret = (TableRowHeaderTextsNormalized) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Row-level cells, each applicable as a header to other cells in the same row as itself, of the current table.
   */
  public class TableRowHeaders extends IBMWatsonGenericModel {
    private String cellId;
    private TableElementLocation location;
    private String text;
    private String textNormalized;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public TableElementLocation getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of this cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * If you provide customization input, the normalized version of the cell text according to the customization;
     * otherwise, the same value as `text`.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final TableElementLocation location) {
      this.location = location;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'text_normalized' => 'textNormalized',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableRowHeaders ret = (TableRowHeaders) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      TableElementLocation newLocation = (TableElementLocation) new TableElementLocation().deserialize(JSON.serialize(locationMap, true), locationMap, TableElementLocation.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Text and associated location within a table.
   */
  public class TableTextLocation extends IBMWatsonGenericModel {
    private String text;
    private TableElementLocation location;

    /**
     * Gets the text.
     *
     * The text retrieved.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public TableElementLocation getLocation() {
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
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final TableElementLocation location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TableTextLocation ret = (TableTextLocation) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      TableElementLocation newLocation = (TableElementLocation) new TableElementLocation().deserialize(JSON.serialize(locationMap, true), locationMap, TableElementLocation.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Object containing example response details for a training query.
   */
  public class TrainingExample extends IBMWatsonGenericModel {
    private String documentId;
    private String collectionId;
    private Long relevance;
    private Datetime created;
    private Datetime updated;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public TrainingExample() { }

    /**
     * Gets the documentId.
     *
     * The document ID associated with this training example.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the collectionId.
     *
     * The collection ID associated with this training example.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the relevance.
     *
     * The relevance of the training example.
     *
     * @return the relevance
     */
    @AuraEnabled
    public Long getRelevance() {
      return relevance;
    }

    /**
     * Gets the created.
     *
     * The date and time the example was created.
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
     * The date and time the example was updated.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }
  
    private TrainingExample(TrainingExampleBuilder builder) {
      IBMWatsonValidator.notNull(builder.documentId, 'documentId cannot be null');
      IBMWatsonValidator.notNull(builder.collectionId, 'collectionId cannot be null');
      IBMWatsonValidator.notNull(builder.relevance, 'relevance cannot be null');
      this.documentId = builder.documentId;
      this.collectionId = builder.collectionId;
      this.relevance = builder.relevance;
      this.created = builder.created;
      this.updated = builder.updated;
    }

    /**
     * New builder.
     *
     * @return a TrainingExample builder
     */
    public TrainingExampleBuilder newBuilder() {
      return new TrainingExampleBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_id' => 'documentId',
        'collection_id' => 'collectionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TrainingExample ret = (TrainingExample) super.deserialize(jsonString, jsonMap, classType);
      TrainingExampleBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'documentId' => 'document_id',
        'collectionId' => 'collection_id'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * TrainingExample Builder.
   */
  public class TrainingExampleBuilder {
    private String documentId;
    private String collectionId;
    private Long relevance;
    private Datetime created;
    private Datetime updated;

    private TrainingExampleBuilder(TrainingExample trainingExample) {
      this.documentId = trainingExample.documentId;
      this.collectionId = trainingExample.collectionId;
      this.relevance = trainingExample.relevance;
      this.created = trainingExample.created;
      this.updated = trainingExample.updated;
    }

    /**
     * Instantiates a new builder.
     */
    public TrainingExampleBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param documentId the documentId
     * @param collectionId the collectionId
     * @param relevance the relevance
     */
    public TrainingExampleBuilder(String documentId, String collectionId, Long relevance) {
      this.documentId = documentId;
      this.collectionId = collectionId;
      this.relevance = relevance;
    }

    /**
     * Builds a TrainingExample.
     *
     * @return the trainingExample
     */
    public TrainingExample build() {
      return new TrainingExample(this);
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the TrainingExample builder
     */
    public TrainingExampleBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the TrainingExample builder
     */
    public TrainingExampleBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the relevance.
     *
     * @param relevance the relevance
     * @return the TrainingExample builder
     */
    public TrainingExampleBuilder relevance(Long relevance) {
      this.relevance = relevance;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the TrainingExample builder
     */
    public TrainingExampleBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the TrainingExample builder
     */
    public TrainingExampleBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }
  }

  /**
   * Object containing training query details.
   */
  public class TrainingQuery extends IBMWatsonResponseModel {
    private String queryId;
    private String naturalLanguageQuery;
    private String filter;
    private Datetime created;
    private Datetime updated;
    private List<TrainingExample> examples;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public TrainingQuery() { }

    /**
     * Gets the queryId.
     *
     * The query ID associated with the training query.
     *
     * @return the queryId
     */
    @AuraEnabled
    public String getQueryId() {
      return queryId;
    }

    /**
     * Gets the naturalLanguageQuery.
     *
     * The natural text query for the training query.
     *
     * @return the naturalLanguageQuery
     */
    @AuraEnabled
    public String getNaturalLanguageQuery() {
      return naturalLanguageQuery;
    }

    /**
     * Gets the filter.
     *
     * The filter used on the collection before the **natural_language_query** is applied.
     *
     * @return the filter
     */
    @AuraEnabled
    public String getFilter() {
      return filter;
    }

    /**
     * Gets the created.
     *
     * The date and time the query was created.
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
     * The date and time the query was updated.
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
     * Array of training examples.
     *
     * @return the examples
     */
    @AuraEnabled
    public List<TrainingExample> getExamples() {
      return examples;
    }
  
    private TrainingQuery(TrainingQueryBuilder builder) {
      IBMWatsonValidator.notNull(builder.naturalLanguageQuery, 'naturalLanguageQuery cannot be null');
      IBMWatsonValidator.notNull(builder.examples, 'examples cannot be null');
      this.queryId = builder.queryId;
      this.naturalLanguageQuery = builder.naturalLanguageQuery;
      this.filter = builder.filter;
      this.created = builder.created;
      this.updated = builder.updated;
      this.examples = builder.examples;
    }

    /**
     * New builder.
     *
     * @return a TrainingQuery builder
     */
    public TrainingQueryBuilder newBuilder() {
      return new TrainingQueryBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'query_id' => 'queryId',
        'natural_language_query' => 'naturalLanguageQuery'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TrainingQuery ret = (TrainingQuery) super.deserialize(jsonString, jsonMap, classType);
      TrainingQueryBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for examples
      List<TrainingExample> newExamples = new List<TrainingExample>();
      List<TrainingExample> deserializedExamples = ret.getExamples();
      if (deserializedExamples != null) {
        for (Integer i = 0; i < deserializedExamples.size(); i++) {
          TrainingExample currentItem = ret.getExamples().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('examples');
          TrainingExample newItem = (TrainingExample) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TrainingExample.class);
          newExamples.add(newItem);
        }
        retBuilder.examples(newExamples);
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
        'queryId' => 'query_id',
        'naturalLanguageQuery' => 'natural_language_query'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for examples
      if (examples != null) {
        List<Object> examplesJsonList = new List<Object>();
        for (TrainingExample listItem : examples) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          examplesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String examplesKey = 'examples';
        if (propertyNameMapping.containsKey(examplesKey)) {
          examplesKey = propertyNameMapping.get(examplesKey);
        }
        jsonMap.put(examplesKey, examplesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * TrainingQuery Builder.
   */
  public class TrainingQueryBuilder {
    private String queryId;
    private String naturalLanguageQuery;
    private String filter;
    private Datetime created;
    private Datetime updated;
    private List<TrainingExample> examples;

    private TrainingQueryBuilder(TrainingQuery trainingQuery) {
      this.queryId = trainingQuery.queryId;
      this.naturalLanguageQuery = trainingQuery.naturalLanguageQuery;
      this.filter = trainingQuery.filter;
      this.created = trainingQuery.created;
      this.updated = trainingQuery.updated;
      this.examples = trainingQuery.examples;
    }

    /**
     * Instantiates a new builder.
     */
    public TrainingQueryBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @param examples the examples
     */
    public TrainingQueryBuilder(String naturalLanguageQuery, List<TrainingExample> examples) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      this.examples = examples;
    }

    /**
     * Builds a TrainingQuery.
     *
     * @return the trainingQuery
     */
    public TrainingQuery build() {
      return new TrainingQuery(this);
    }

    /**
     * Adds an examples to examples.
     *
     * @param examples the new examples
     * @return the TrainingQuery builder
     */
    public TrainingQueryBuilder addExamples(TrainingExample examples) {
      IBMWatsonValidator.notNull(examples, 'examples cannot be null');
      if (this.examples == null) {
        this.examples = new List<TrainingExample>();
      }
      this.examples.add(examples);
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the TrainingQuery builder
     */
    public TrainingQueryBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the TrainingQuery builder
     */
    public TrainingQueryBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the TrainingQuery builder
     */
    public TrainingQueryBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the TrainingQuery builder
     */
    public TrainingQueryBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the TrainingQuery builder
     */
    public TrainingQueryBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }

    /**
     * Set the examples.
     * Existing examples will be replaced.
     *
     * @param examples the examples
     * @return the TrainingQuery builder
     */
    public TrainingQueryBuilder examples(List<TrainingExample> examples) {
      this.examples = examples;
      return this;
    }
  }

  /**
   * Object specifying the training queries contained in the identified training set.
   */
  public class TrainingQuerySet extends IBMWatsonResponseModel {
    private List<TrainingQuery> queries;

    /**
     * Gets the queries.
     *
     * Array of training queries.
     *
     * @return the queries
     */
    @AuraEnabled
    public List<TrainingQuery> getQueries() {
      return queries;
    }

    /**
     * Sets the queries.
     *
     * @param queries the new queries
     */
    public void setQueries(final List<TrainingQuery> queries) {
      this.queries = queries;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TrainingQuerySet ret = (TrainingQuerySet) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for queries
      List<TrainingQuery> newQueries = new List<TrainingQuery>();
      List<TrainingQuery> deserializedQueries = ret.getQueries();
      if (deserializedQueries != null) {
        for (Integer i = 0; i < deserializedQueries.size(); i++) {
          TrainingQuery currentItem = ret.getQueries().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('queries');
          TrainingQuery newItem = (TrainingQuery) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TrainingQuery.class);
          newQueries.add(newItem);
        }
        ret.queries = newQueries;
      }

      return ret;
    }
  }

  /**
   * The updateDocument options.
   */
  public class UpdateDocumentOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String collectionId;
    private String documentId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;
    private Boolean xWatsonDiscoveryForce;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the collectionId.
     *
     * The ID of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the documentId.
     *
     * The ID of the document.
     *
     * @return the documentId
     */
    public String documentId() {
      return documentId;
    }

    /**
     * Gets the file.
     *
     * The content of the document to ingest. The maximum supported file size when adding a file to a collection is 50
     * megabytes, the maximum supported file size when testing a configuration is 1 megabyte. Files larger than the
     * supported size are rejected.
     *
     * @return the file
     */
    public IBMWatsonFile file() {
      return file;
    }

    /**
     * Gets the filename.
     *
     * The filename for file.
     *
     * @return the filename
     */
    public String filename() {
      return filename;
    }

    /**
     * Gets the fileContentType.
     *
     * The content type of file.
     *
     * @return the fileContentType
     */
    public String fileContentType() {
      return fileContentType;
    }

    /**
     * Gets the metadata.
     *
     * The maximum supported metadata file size is 1 MB. Metadata parts larger than 1 MB are rejected. Example:  ``` {
     *   "Creator": "Johnny Appleseed",
     *   "Subject": "Apples"
     * } ```.
     *
     * @return the metadata
     */
    public String metadata() {
      return metadata;
    }

    /**
     * Gets the xWatsonDiscoveryForce.
     *
     * When `true`, the uploaded document is added to the collection even if the data for that collection is shared with
     * other collections.
     *
     * @return the xWatsonDiscoveryForce
     */
    public Boolean xWatsonDiscoveryForce() {
      return xWatsonDiscoveryForce;
    }

    private UpdateDocumentOptions(UpdateDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
      IBMWatsonValidator.isTrue(builder.file == null || builder.fileContentType != null, 'content type cannot be null if file is not null');
      projectId = builder.projectId;
      collectionId = builder.collectionId;
      documentId = builder.documentId;
      file = builder.file;
      filename = builder.filename;
      fileContentType = builder.fileContentType;
      metadata = builder.metadata;
      xWatsonDiscoveryForce = builder.xWatsonDiscoveryForce;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder newBuilder() {
      return new UpdateDocumentOptionsBuilder(this);
    }
  }

  /**
   * UpdateDocumentOptions Builder.
   */
  public class UpdateDocumentOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String collectionId;
    private String documentId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;
    private Boolean xWatsonDiscoveryForce;

    private UpdateDocumentOptionsBuilder(UpdateDocumentOptions updateDocumentOptions) {
      projectId = updateDocumentOptions.projectId;
      collectionId = updateDocumentOptions.collectionId;
      documentId = updateDocumentOptions.documentId;
      file = updateDocumentOptions.file;
      filename = updateDocumentOptions.filename;
      fileContentType = updateDocumentOptions.fileContentType;
      metadata = updateDocumentOptions.metadata;
      xWatsonDiscoveryForce = updateDocumentOptions.xWatsonDiscoveryForce;
      this.requestHeaders.putAll(updateDocumentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateDocumentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     * @param collectionId the collectionId
     * @param documentId the documentId
     */
    public UpdateDocumentOptionsBuilder(String projectId, String collectionId, String documentId) {
      this.projectId = projectId;
      this.collectionId = collectionId;
      this.documentId = documentId;
    }

    /**
     * Builds a UpdateDocumentOptions.
     *
     * @return the updateDocumentOptions
     */
    public UpdateDocumentOptions build() {
      return new UpdateDocumentOptions(this);
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Set the file.
     *
     * @param file the file
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder file(IBMWatsonFile file) {
      this.file = file;
      return this;
    }

    /**
     * Set the filename.
     *
     * @param filename the filename
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder filename(String filename) {
      this.filename = filename;
      return this;
    }

    /**
     * Set the fileContentType.
     *
     * @param fileContentType the fileContentType
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder fileContentType(String fileContentType) {
      this.fileContentType = fileContentType;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder metadata(String metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the xWatsonDiscoveryForce.
     *
     * @param xWatsonDiscoveryForce the xWatsonDiscoveryForce
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder xWatsonDiscoveryForce(Boolean xWatsonDiscoveryForce) {
      this.xWatsonDiscoveryForce = xWatsonDiscoveryForce;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateTrainingQuery options.
   */
  public class UpdateTrainingQueryOptions extends IBMWatsonOptionsModel {
    private String projectId;
    private String queryId;
    private String naturalLanguageQuery;
    private List<TrainingExample> examples;
    private String filter;

    /**
     * Gets the projectId.
     *
     * The ID of the project. This information can be found from the deploy page of the Discovery administrative
     * tooling.
     *
     * @return the projectId
     */
    public String projectId() {
      return projectId;
    }

    /**
     * Gets the queryId.
     *
     * The ID of the query used for training.
     *
     * @return the queryId
     */
    public String queryId() {
      return queryId;
    }

    /**
     * Gets the naturalLanguageQuery.
     *
     * The natural text query for the training query.
     *
     * @return the naturalLanguageQuery
     */
    public String naturalLanguageQuery() {
      return naturalLanguageQuery;
    }

    /**
     * Gets the examples.
     *
     * Array of training examples.
     *
     * @return the examples
     */
    public List<TrainingExample> examples() {
      return examples;
    }

    /**
     * Gets the filter.
     *
     * The filter used on the collection before the **natural_language_query** is applied.
     *
     * @return the filter
     */
    public String filter() {
      return filter;
    }

    private UpdateTrainingQueryOptions(UpdateTrainingQueryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.projectId, 'projectId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      IBMWatsonValidator.notNull(builder.naturalLanguageQuery, 'naturalLanguageQuery cannot be null');
      IBMWatsonValidator.notNull(builder.examples, 'examples cannot be null');
      projectId = builder.projectId;
      queryId = builder.queryId;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      examples = builder.examples;
      filter = builder.filter;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder newBuilder() {
      return new UpdateTrainingQueryOptionsBuilder(this);
    }
  }

  /**
   * UpdateTrainingQueryOptions Builder.
   */
  public class UpdateTrainingQueryOptionsBuilder extends IBMWatsonOptionsModel {
    private String projectId;
    private String queryId;
    private String naturalLanguageQuery;
    private List<TrainingExample> examples;
    private String filter;

    private UpdateTrainingQueryOptionsBuilder(UpdateTrainingQueryOptions updateTrainingQueryOptions) {
      projectId = updateTrainingQueryOptions.projectId;
      queryId = updateTrainingQueryOptions.queryId;
      naturalLanguageQuery = updateTrainingQueryOptions.naturalLanguageQuery;
      examples = updateTrainingQueryOptions.examples;
      filter = updateTrainingQueryOptions.filter;
      this.requestHeaders.putAll(updateTrainingQueryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateTrainingQueryOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param projectId the projectId
     * @param queryId the queryId
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @param examples the examples
     */
    public UpdateTrainingQueryOptionsBuilder(String projectId, String queryId, String naturalLanguageQuery, List<TrainingExample> examples) {
      this.projectId = projectId;
      this.queryId = queryId;
      this.naturalLanguageQuery = naturalLanguageQuery;
      this.examples = examples;
    }

    /**
     * Builds a UpdateTrainingQueryOptions.
     *
     * @return the updateTrainingQueryOptions
     */
    public UpdateTrainingQueryOptions build() {
      return new UpdateTrainingQueryOptions(this);
    }

    /**
     * Adds an examples to examples.
     *
     * @param examples the new examples
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder addExamples(TrainingExample examples) {
      IBMWatsonValidator.notNull(examples, 'examples cannot be null');
      if (this.examples == null) {
        this.examples = new List<TrainingExample>();
      }
      this.examples.add(examples);
      return this;
    }

    /**
     * Set the projectId.
     *
     * @param projectId the projectId
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder projectId(String projectId) {
      this.projectId = projectId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the examples.
     * Existing examples will be replaced.
     *
     * @param examples the examples
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder examples(List<TrainingExample> examples) {
      this.examples = examples;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the trainingQuery.
     *
     * @param trainingQuery the trainingQuery
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder trainingQuery(TrainingQuery trainingQuery) {
      this.naturalLanguageQuery = trainingQuery.getNaturalLanguageQuery();
      this.examples = trainingQuery.getExamples();
      this.filter = trainingQuery.getFilter();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateTrainingQueryOptions builder
     */
    public UpdateTrainingQueryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

}