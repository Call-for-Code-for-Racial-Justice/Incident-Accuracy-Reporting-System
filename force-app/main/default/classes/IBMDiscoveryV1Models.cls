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

public class IBMDiscoveryV1Models {
  /**
   * The addDocument options.
   */
  public class AddDocumentOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private AddDocumentOptions(AddDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.isTrue(builder.file == null || builder.fileContentType != null, 'content type cannot be null if file is not null');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      file = builder.file;
      filename = builder.filename;
      fileContentType = builder.fileContentType;
      metadata = builder.metadata;
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
    private String environmentId;
    private String collectionId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;

    private AddDocumentOptionsBuilder(AddDocumentOptions addDocumentOptions) {
      environmentId = addDocumentOptions.environmentId;
      collectionId = addDocumentOptions.collectionId;
      file = addDocumentOptions.file;
      filename = addDocumentOptions.filename;
      fileContentType = addDocumentOptions.fileContentType;
      metadata = addDocumentOptions.metadata;
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
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public AddDocumentOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
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
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the AddDocumentOptions builder
     */
    public AddDocumentOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
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
   * The addTrainingData options.
   */
  public class AddTrainingDataOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String naturalLanguageQuery;
    private String filter;
    private List<TrainingExample> examples;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the naturalLanguageQuery.
     *
     * The natural text query for the new training query.
     *
     * @return the naturalLanguageQuery
     */
    public String naturalLanguageQuery() {
      return naturalLanguageQuery;
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

    private AddTrainingDataOptions(AddTrainingDataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      filter = builder.filter;
      examples = builder.examples;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder newBuilder() {
      return new AddTrainingDataOptionsBuilder(this);
    }
  }

  /**
   * AddTrainingDataOptions Builder.
   */
  public class AddTrainingDataOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String naturalLanguageQuery;
    private String filter;
    private List<TrainingExample> examples;

    private AddTrainingDataOptionsBuilder(AddTrainingDataOptions addTrainingDataOptions) {
      environmentId = addTrainingDataOptions.environmentId;
      collectionId = addTrainingDataOptions.collectionId;
      naturalLanguageQuery = addTrainingDataOptions.naturalLanguageQuery;
      filter = addTrainingDataOptions.filter;
      examples = addTrainingDataOptions.examples;
      this.requestHeaders.putAll(addTrainingDataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AddTrainingDataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public AddTrainingDataOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a AddTrainingDataOptions.
     *
     * @return the addTrainingDataOptions
     */
    public AddTrainingDataOptions build() {
      return new AddTrainingDataOptions(this);
    }

    /**
     * Adds an examples to examples.
     *
     * @param examples the new examples
     * @return the AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder addExamples(TrainingExample examples) {
      IBMWatsonValidator.notNull(examples, 'examples cannot be null');
      if (this.examples == null) {
        this.examples = new List<TrainingExample>();
      }
      this.examples.add(examples);
      return this;
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the examples.
     * Existing examples will be replaced.
     *
     * @param examples the examples
     * @return the AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder examples(List<TrainingExample> examples) {
      this.examples = examples;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AddTrainingDataOptions builder
     */
    public AddTrainingDataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Aggregation results for the specified query.
   */
  public class AggregationResult extends IBMWatsonGenericModel {
    private String key;
    private Long matchingResults;
    private List<QueryAggregation> aggregations;

    /**
     * Gets the key.
     *
     * Key that matched the aggregation type.
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
     * Number of matching results.
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
     * Aggregations returned in the case of chained aggregations.
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

      AggregationResult ret = (AggregationResult) super.deserialize(jsonString, jsonMap, classType);

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
   * A collection for storing documents.
   */
  public class Collection extends IBMWatsonResponseModel {
    private String collectionId;
    private String name;
    private String description;
    private Datetime created;
    private Datetime updated;
    private String status;
    private String configurationId;
    private String language;
    private DocumentCounts documentCounts;
    private CollectionDiskUsage diskUsage;
    private TrainingStatus trainingStatus;
    private CollectionCrawlStatus crawlStatus;
    private SduStatus smartDocumentUnderstanding;

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
     * Gets the description.
     *
     * The description of the collection.
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
     * The creation date of the collection in the format yyyy-MM-dd'T'HH:mmcon:ss.SSS'Z'.
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
     * The timestamp of when the collection was last updated in the format yyyy-MM-dd'T'HH:mm:ss.SSS'Z'.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the status.
     *
     * The status of the collection.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the configurationId.
     *
     * The unique identifier of the collection's configuration.
     *
     * @return the configurationId
     */
    @AuraEnabled
    public String getConfigurationId() {
      return configurationId;
    }

    /**
     * Gets the language.
     *
     * The language of the documents stored in the collection. Permitted values include `en` (English), `de` (German),
     * and `es` (Spanish).
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the documentCounts.
     *
     * Object containing collection document count information.
     *
     * @return the documentCounts
     */
    @AuraEnabled
    public DocumentCounts getDocumentCounts() {
      return documentCounts;
    }

    /**
     * Gets the diskUsage.
     *
     * Summary of the disk usage statistics for this collection.
     *
     * @return the diskUsage
     */
    @AuraEnabled
    public CollectionDiskUsage getDiskUsage() {
      return diskUsage;
    }

    /**
     * Gets the trainingStatus.
     *
     * Training status details.
     *
     * @return the trainingStatus
     */
    @AuraEnabled
    public TrainingStatus getTrainingStatus() {
      return trainingStatus;
    }

    /**
     * Gets the crawlStatus.
     *
     * Object containing information about the crawl status of this collection.
     *
     * @return the crawlStatus
     */
    @AuraEnabled
    public CollectionCrawlStatus getCrawlStatus() {
      return crawlStatus;
    }

    /**
     * Gets the smartDocumentUnderstanding.
     *
     * Object containing smart document understanding information for this collection.
     *
     * @return the smartDocumentUnderstanding
     */
    @AuraEnabled
    public SduStatus getSmartDocumentUnderstanding() {
      return smartDocumentUnderstanding;
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
     * Sets the configurationId.
     *
     * @param configurationId the new configurationId
     */
    public void setConfigurationId(final String configurationId) {
      this.configurationId = configurationId;
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
     * Sets the documentCounts.
     *
     * @param documentCounts the new documentCounts
     */
    public void setDocumentCounts(final DocumentCounts documentCounts) {
      this.documentCounts = documentCounts;
    }

    /**
     * Sets the diskUsage.
     *
     * @param diskUsage the new diskUsage
     */
    public void setDiskUsage(final CollectionDiskUsage diskUsage) {
      this.diskUsage = diskUsage;
    }

    /**
     * Sets the trainingStatus.
     *
     * @param trainingStatus the new trainingStatus
     */
    public void setTrainingStatus(final TrainingStatus trainingStatus) {
      this.trainingStatus = trainingStatus;
    }

    /**
     * Sets the crawlStatus.
     *
     * @param crawlStatus the new crawlStatus
     */
    public void setCrawlStatus(final CollectionCrawlStatus crawlStatus) {
      this.crawlStatus = crawlStatus;
    }

    /**
     * Sets the smartDocumentUnderstanding.
     *
     * @param smartDocumentUnderstanding the new smartDocumentUnderstanding
     */
    public void setSmartDocumentUnderstanding(final SduStatus smartDocumentUnderstanding) {
      this.smartDocumentUnderstanding = smartDocumentUnderstanding;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'collection_id' => 'collectionId',
        'configuration_id' => 'configurationId',
        'document_counts' => 'documentCounts',
        'disk_usage' => 'diskUsage',
        'training_status' => 'trainingStatus',
        'crawl_status' => 'crawlStatus',
        'smart_document_understanding' => 'smartDocumentUnderstanding'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String created = (String) jsonMap.remove('created');
      String updated = (String) jsonMap.remove('updated');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      Collection ret = (Collection) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(created)) {
        ret.created = (Datetime) JSON.deserialize('"' + created + '"', Datetime.class);
      }
      if (String.isNotBlank(updated)) {
        ret.updated = (Datetime) JSON.deserialize('"' + updated + '"', Datetime.class);
      }

      // calling custom deserializer for documentCounts
      Map<String, Object> documentCountsMap = (Map<String, Object>) jsonMap.get('documentCounts');
      DocumentCounts newDocumentCounts = (DocumentCounts) new DocumentCounts().deserialize(JSON.serialize(documentCountsMap, true), documentCountsMap, DocumentCounts.class);
      ret.setDocumentCounts(newDocumentCounts);

      // calling custom deserializer for diskUsage
      Map<String, Object> diskUsageMap = (Map<String, Object>) jsonMap.get('diskUsage');
      CollectionDiskUsage newDiskUsage = (CollectionDiskUsage) new CollectionDiskUsage().deserialize(JSON.serialize(diskUsageMap, true), diskUsageMap, CollectionDiskUsage.class);
      ret.setDiskUsage(newDiskUsage);

      // calling custom deserializer for trainingStatus
      Map<String, Object> trainingStatusMap = (Map<String, Object>) jsonMap.get('trainingStatus');
      TrainingStatus newTrainingStatus = (TrainingStatus) new TrainingStatus().deserialize(JSON.serialize(trainingStatusMap, true), trainingStatusMap, TrainingStatus.class);
      ret.setTrainingStatus(newTrainingStatus);

      // calling custom deserializer for crawlStatus
      Map<String, Object> crawlStatusMap = (Map<String, Object>) jsonMap.get('crawlStatus');
      CollectionCrawlStatus newCrawlStatus = (CollectionCrawlStatus) new CollectionCrawlStatus().deserialize(JSON.serialize(crawlStatusMap, true), crawlStatusMap, CollectionCrawlStatus.class);
      ret.setCrawlStatus(newCrawlStatus);

      // calling custom deserializer for smartDocumentUnderstanding
      Map<String, Object> smartDocumentUnderstandingMap = (Map<String, Object>) jsonMap.get('smartDocumentUnderstanding');
      SduStatus newSmartDocumentUnderstanding = (SduStatus) new SduStatus().deserialize(JSON.serialize(smartDocumentUnderstandingMap, true), smartDocumentUnderstandingMap, SduStatus.class);
      ret.setSmartDocumentUnderstanding(newSmartDocumentUnderstanding);

      return ret;
    }
  }

  /**
   * Object containing information about the crawl status of this collection.
   */
  public class CollectionCrawlStatus extends IBMWatsonGenericModel {
    private SourceStatus sourceCrawl;

    /**
     * Gets the sourceCrawl.
     *
     * Object containing source crawl status information.
     *
     * @return the sourceCrawl
     */
    @AuraEnabled
    public SourceStatus getSourceCrawl() {
      return sourceCrawl;
    }

    /**
     * Sets the sourceCrawl.
     *
     * @param sourceCrawl the new sourceCrawl
     */
    public void setSourceCrawl(final SourceStatus sourceCrawl) {
      this.sourceCrawl = sourceCrawl;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'source_crawl' => 'sourceCrawl'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CollectionCrawlStatus ret = (CollectionCrawlStatus) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for sourceCrawl
      Map<String, Object> sourceCrawlMap = (Map<String, Object>) jsonMap.get('sourceCrawl');
      SourceStatus newSourceCrawl = (SourceStatus) new SourceStatus().deserialize(JSON.serialize(sourceCrawlMap, true), sourceCrawlMap, SourceStatus.class);
      ret.setSourceCrawl(newSourceCrawl);

      return ret;
    }
  }

  /**
   * Summary of the disk usage statistics for this collection.
   */
  public class CollectionDiskUsage extends IBMWatsonGenericModel {
    private Long usedBytes;

    /**
     * Gets the usedBytes.
     *
     * Number of bytes used by the collection.
     *
     * @return the usedBytes
     */
    @AuraEnabled
    public Long getUsedBytes() {
      return usedBytes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'used_bytes' => 'usedBytes'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CollectionDiskUsage ret = (CollectionDiskUsage) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Summary of the collection usage in the environment.
   */
  public class CollectionUsage extends IBMWatsonGenericModel {
    private Long available;
    private Long maximumAllowed;

    /**
     * Gets the available.
     *
     * Number of active collections in the environment.
     *
     * @return the available
     */
    @AuraEnabled
    public Long getAvailable() {
      return available;
    }

    /**
     * Gets the maximumAllowed.
     *
     * Total number of collections allowed in the environment.
     *
     * @return the maximumAllowed
     */
    @AuraEnabled
    public Long getMaximumAllowed() {
      return maximumAllowed;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'maximum_allowed' => 'maximumAllowed'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CollectionUsage ret = (CollectionUsage) super.deserialize(jsonString, jsonMap, classType);

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
   * A custom configuration for the environment.
   */
  public class Configuration extends IBMWatsonResponseModel {
    private String configurationId;
    private String name;
    private Datetime created;
    private Datetime updated;
    private String description;
    private Conversions conversions;
    private List<Enrichment> enrichments;
    private List<NormalizationOperation> normalizations;
    private Source source;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Configuration() { }

    /**
     * Gets the configurationId.
     *
     * The unique identifier of the configuration.
     *
     * @return the configurationId
     */
    @AuraEnabled
    public String getConfigurationId() {
      return configurationId;
    }

    /**
     * Gets the name.
     *
     * The name of the configuration.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the created.
     *
     * The creation date of the configuration in the format yyyy-MM-dd'T'HH:mm:ss.SSS'Z'.
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
     * The timestamp of when the configuration was last updated in the format yyyy-MM-dd'T'HH:mm:ss.SSS'Z'.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the description.
     *
     * The description of the configuration, if available.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the conversions.
     *
     * Document conversion settings.
     *
     * @return the conversions
     */
    @AuraEnabled
    public Conversions getConversions() {
      return conversions;
    }

    /**
     * Gets the enrichments.
     *
     * An array of document enrichment settings for the configuration.
     *
     * @return the enrichments
     */
    @AuraEnabled
    public List<Enrichment> getEnrichments() {
      return enrichments;
    }

    /**
     * Gets the normalizations.
     *
     * Defines operations that can be used to transform the final output JSON into a normalized form. Operations are
     * executed in the order that they appear in the array.
     *
     * @return the normalizations
     */
    @AuraEnabled
    public List<NormalizationOperation> getNormalizations() {
      return normalizations;
    }

    /**
     * Gets the source.
     *
     * Object containing source parameters for the configuration.
     *
     * @return the source
     */
    @AuraEnabled
    public Source getSource() {
      return source;
    }
  
    private Configuration(ConfigurationBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      this.configurationId = builder.configurationId;
      this.name = builder.name;
      this.created = builder.created;
      this.updated = builder.updated;
      this.description = builder.description;
      this.conversions = builder.conversions;
      this.enrichments = builder.enrichments;
      this.normalizations = builder.normalizations;
      this.source = builder.source;
    }

    /**
     * New builder.
     *
     * @return a Configuration builder
     */
    public ConfigurationBuilder newBuilder() {
      return new ConfigurationBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'configuration_id' => 'configurationId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String created = (String) jsonMap.remove('created');
      String updated = (String) jsonMap.remove('updated');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      Configuration ret = (Configuration) super.deserialize(jsonStringWithoutDates, jsonMap, classType);
      ConfigurationBuilder retBuilder = ret.newBuilder();

      if (String.isNotBlank(created)) {
        retBuilder.created((Datetime) JSON.deserialize('"' + created + '"', Datetime.class));
      }
      if (String.isNotBlank(updated)) {
        retBuilder.updated((Datetime) JSON.deserialize('"' + updated + '"', Datetime.class));
      }

      // calling custom deserializer for conversions
      Map<String, Object> conversionsMap = (Map<String, Object>) jsonMap.get('conversions');
      Conversions newConversions = (Conversions) new Conversions().deserialize(JSON.serialize(conversionsMap, true), conversionsMap, Conversions.class);
      retBuilder.conversions(newConversions);

      // calling custom deserializer for enrichments
      List<Enrichment> newEnrichments = new List<Enrichment>();
      List<Enrichment> deserializedEnrichments = ret.getEnrichments();
      if (deserializedEnrichments != null) {
        for (Integer i = 0; i < deserializedEnrichments.size(); i++) {
          Enrichment currentItem = ret.getEnrichments().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('enrichments');
          Enrichment newItem = (Enrichment) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Enrichment.class);
          newEnrichments.add(newItem);
        }
        retBuilder.enrichments(newEnrichments);
      }

      // calling custom deserializer for normalizations
      List<NormalizationOperation> newNormalizations = new List<NormalizationOperation>();
      List<NormalizationOperation> deserializedNormalizations = ret.getNormalizations();
      if (deserializedNormalizations != null) {
        for (Integer i = 0; i < deserializedNormalizations.size(); i++) {
          NormalizationOperation currentItem = ret.getNormalizations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('normalizations');
          NormalizationOperation newItem = (NormalizationOperation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), NormalizationOperation.class);
          newNormalizations.add(newItem);
        }
        retBuilder.normalizations(newNormalizations);
      }

      // calling custom deserializer for source
      Map<String, Object> sourceMap = (Map<String, Object>) jsonMap.get('source');
      Source newSource = (Source) new Source().deserialize(JSON.serialize(sourceMap, true), sourceMap, Source.class);
      retBuilder.source(newSource);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'configurationId' => 'configuration_id'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for conversions
      if (conversions != null) {
        String conversionsJsonString = JSON.serialize(conversions.replacePropertyNames(), true);
        String conversionsKey = 'conversions';
        if (propertyNameMapping.containsKey(conversionsKey)) {
          conversionsKey = propertyNameMapping.get(conversionsKey);
        }
        jsonMap.put(conversionsKey, JSON.deserializeUntyped(conversionsJsonString));
      }

      // performing custom serialization for enrichments
      if (enrichments != null) {
        List<Object> enrichmentsJsonList = new List<Object>();
        for (Enrichment listItem : enrichments) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          enrichmentsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String enrichmentsKey = 'enrichments';
        if (propertyNameMapping.containsKey(enrichmentsKey)) {
          enrichmentsKey = propertyNameMapping.get(enrichmentsKey);
        }
        jsonMap.put(enrichmentsKey, enrichmentsJsonList);
      }

      // performing custom serialization for normalizations
      if (normalizations != null) {
        List<Object> normalizationsJsonList = new List<Object>();
        for (NormalizationOperation listItem : normalizations) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          normalizationsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String normalizationsKey = 'normalizations';
        if (propertyNameMapping.containsKey(normalizationsKey)) {
          normalizationsKey = propertyNameMapping.get(normalizationsKey);
        }
        jsonMap.put(normalizationsKey, normalizationsJsonList);
      }

      // performing custom serialization for source
      if (source != null) {
        String sourceJsonString = JSON.serialize(source.replacePropertyNames(), true);
        String sourceKey = 'source';
        if (propertyNameMapping.containsKey(sourceKey)) {
          sourceKey = propertyNameMapping.get(sourceKey);
        }
        jsonMap.put(sourceKey, JSON.deserializeUntyped(sourceJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * Configuration Builder.
   */
  public class ConfigurationBuilder {
    private String configurationId;
    private String name;
    private Datetime created;
    private Datetime updated;
    private String description;
    private Conversions conversions;
    private List<Enrichment> enrichments;
    private List<NormalizationOperation> normalizations;
    private Source source;

    private ConfigurationBuilder(Configuration configuration) {
      this.configurationId = configuration.configurationId;
      this.name = configuration.name;
      this.created = configuration.created;
      this.updated = configuration.updated;
      this.description = configuration.description;
      this.conversions = configuration.conversions;
      this.enrichments = configuration.enrichments;
      this.normalizations = configuration.normalizations;
      this.source = configuration.source;
    }

    /**
     * Instantiates a new builder.
     */
    public ConfigurationBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param name the name
     */
    public ConfigurationBuilder(String name) {
      this.name = name;
    }

    /**
     * Builds a Configuration.
     *
     * @return the configuration
     */
    public Configuration build() {
      return new Configuration(this);
    }

    /**
     * Adds an enrichments to enrichments.
     *
     * @param enrichments the new enrichments
     * @return the Configuration builder
     */
    public ConfigurationBuilder addEnrichments(Enrichment enrichments) {
      IBMWatsonValidator.notNull(enrichments, 'enrichments cannot be null');
      if (this.enrichments == null) {
        this.enrichments = new List<Enrichment>();
      }
      this.enrichments.add(enrichments);
      return this;
    }

    /**
     * Adds an normalizations to normalizations.
     *
     * @param normalizations the new normalizations
     * @return the Configuration builder
     */
    public ConfigurationBuilder addNormalizations(NormalizationOperation normalizations) {
      IBMWatsonValidator.notNull(normalizations, 'normalizations cannot be null');
      if (this.normalizations == null) {
        this.normalizations = new List<NormalizationOperation>();
      }
      this.normalizations.add(normalizations);
      return this;
    }

    /**
     * Set the configurationId.
     *
     * @param configurationId the configurationId
     * @return the Configuration builder
     */
    public ConfigurationBuilder configurationId(String configurationId) {
      this.configurationId = configurationId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the Configuration builder
     */
    public ConfigurationBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the Configuration builder
     */
    public ConfigurationBuilder created(Datetime created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the Configuration builder
     */
    public ConfigurationBuilder updated(Datetime updated) {
      this.updated = updated;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the Configuration builder
     */
    public ConfigurationBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the conversions.
     *
     * @param conversions the conversions
     * @return the Configuration builder
     */
    public ConfigurationBuilder conversions(Conversions conversions) {
      this.conversions = conversions;
      return this;
    }

    /**
     * Set the enrichments.
     * Existing enrichments will be replaced.
     *
     * @param enrichments the enrichments
     * @return the Configuration builder
     */
    public ConfigurationBuilder enrichments(List<Enrichment> enrichments) {
      this.enrichments = enrichments;
      return this;
    }

    /**
     * Set the normalizations.
     * Existing normalizations will be replaced.
     *
     * @param normalizations the normalizations
     * @return the Configuration builder
     */
    public ConfigurationBuilder normalizations(List<NormalizationOperation> normalizations) {
      this.normalizations = normalizations;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the Configuration builder
     */
    public ConfigurationBuilder source(Source source) {
      this.source = source;
      return this;
    }
  }

  /**
   * Document conversion settings.
   */
  public class Conversions extends IBMWatsonGenericModel {
    private PdfSettings pdf;
    private WordSettings word;
    private HtmlSettings html;
    private SegmentSettings segment;
    private List<NormalizationOperation> jsonNormalizations;
    private Boolean imageTextRecognition;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Conversions() { }

    /**
     * Gets the pdf.
     *
     * A list of PDF conversion settings.
     *
     * @return the pdf
     */
    @AuraEnabled
    public PdfSettings getPdf() {
      return pdf;
    }

    /**
     * Gets the word.
     *
     * A list of Word conversion settings.
     *
     * @return the word
     */
    @AuraEnabled
    public WordSettings getWord() {
      return word;
    }

    /**
     * Gets the html.
     *
     * A list of HTML conversion settings.
     *
     * @return the html
     */
    @AuraEnabled
    public HtmlSettings getHtml() {
      return html;
    }

    /**
     * Gets the segment.
     *
     * A list of Document Segmentation settings.
     *
     * @return the segment
     */
    @AuraEnabled
    public SegmentSettings getSegment() {
      return segment;
    }

    /**
     * Gets the jsonNormalizations.
     *
     * Defines operations that can be used to transform the final output JSON into a normalized form. Operations are
     * executed in the order that they appear in the array.
     *
     * @return the jsonNormalizations
     */
    @AuraEnabled
    public List<NormalizationOperation> getJsonNormalizations() {
      return jsonNormalizations;
    }

    /**
     * Gets the imageTextRecognition.
     *
     * When `true`, automatic text extraction from images (this includes images embedded in supported document formats,
     * for example PDF, and suppported image formats, for example TIFF) is performed on documents uploaded to the
     * collection. This field is supported on **Advanced** and higher plans only. **Lite** plans do not support image
     * text recognition.
     *
     * @return the imageTextRecognition
     */
    @AuraEnabled
    public Boolean getImageTextRecognition() {
      return imageTextRecognition;
    }
  
    private Conversions(ConversionsBuilder builder) {
      this.pdf = builder.pdf;
      this.word = builder.word;
      this.html = builder.html;
      this.segment = builder.segment;
      this.jsonNormalizations = builder.jsonNormalizations;
      this.imageTextRecognition = builder.imageTextRecognition;
    }

    /**
     * New builder.
     *
     * @return a Conversions builder
     */
    public ConversionsBuilder newBuilder() {
      return new ConversionsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'json_normalizations' => 'jsonNormalizations',
        'image_text_recognition' => 'imageTextRecognition'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Conversions ret = (Conversions) super.deserialize(jsonString, jsonMap, classType);
      ConversionsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for pdf
      Map<String, Object> pdfMap = (Map<String, Object>) jsonMap.get('pdf');
      PdfSettings newPdf = (PdfSettings) new PdfSettings().deserialize(JSON.serialize(pdfMap, true), pdfMap, PdfSettings.class);
      retBuilder.pdf(newPdf);

      // calling custom deserializer for word
      Map<String, Object> wordMap = (Map<String, Object>) jsonMap.get('word');
      WordSettings newWord = (WordSettings) new WordSettings().deserialize(JSON.serialize(wordMap, true), wordMap, WordSettings.class);
      retBuilder.word(newWord);

      // calling custom deserializer for html
      Map<String, Object> htmlMap = (Map<String, Object>) jsonMap.get('html');
      HtmlSettings newHtml = (HtmlSettings) new HtmlSettings().deserialize(JSON.serialize(htmlMap, true), htmlMap, HtmlSettings.class);
      retBuilder.html(newHtml);

      // calling custom deserializer for segment
      Map<String, Object> segmentMap = (Map<String, Object>) jsonMap.get('segment');
      SegmentSettings newSegment = (SegmentSettings) new SegmentSettings().deserialize(JSON.serialize(segmentMap, true), segmentMap, SegmentSettings.class);
      retBuilder.segment(newSegment);

      // calling custom deserializer for jsonNormalizations
      List<NormalizationOperation> newJsonNormalizations = new List<NormalizationOperation>();
      List<NormalizationOperation> deserializedJsonNormalizations = ret.getJsonNormalizations();
      if (deserializedJsonNormalizations != null) {
        for (Integer i = 0; i < deserializedJsonNormalizations.size(); i++) {
          NormalizationOperation currentItem = ret.getJsonNormalizations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('jsonNormalizations');
          NormalizationOperation newItem = (NormalizationOperation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), NormalizationOperation.class);
          newJsonNormalizations.add(newItem);
        }
        retBuilder.jsonNormalizations(newJsonNormalizations);
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
        'jsonNormalizations' => 'json_normalizations',
        'imageTextRecognition' => 'image_text_recognition'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for pdf
      if (pdf != null) {
        String pdfJsonString = JSON.serialize(pdf.replacePropertyNames(), true);
        String pdfKey = 'pdf';
        if (propertyNameMapping.containsKey(pdfKey)) {
          pdfKey = propertyNameMapping.get(pdfKey);
        }
        jsonMap.put(pdfKey, JSON.deserializeUntyped(pdfJsonString));
      }

      // performing custom serialization for word
      if (word != null) {
        String wordJsonString = JSON.serialize(word.replacePropertyNames(), true);
        String wordKey = 'word';
        if (propertyNameMapping.containsKey(wordKey)) {
          wordKey = propertyNameMapping.get(wordKey);
        }
        jsonMap.put(wordKey, JSON.deserializeUntyped(wordJsonString));
      }

      // performing custom serialization for html
      if (html != null) {
        String htmlJsonString = JSON.serialize(html.replacePropertyNames(), true);
        String htmlKey = 'html';
        if (propertyNameMapping.containsKey(htmlKey)) {
          htmlKey = propertyNameMapping.get(htmlKey);
        }
        jsonMap.put(htmlKey, JSON.deserializeUntyped(htmlJsonString));
      }

      // performing custom serialization for segment
      if (segment != null) {
        String segmentJsonString = JSON.serialize(segment.replacePropertyNames(), true);
        String segmentKey = 'segment';
        if (propertyNameMapping.containsKey(segmentKey)) {
          segmentKey = propertyNameMapping.get(segmentKey);
        }
        jsonMap.put(segmentKey, JSON.deserializeUntyped(segmentJsonString));
      }

      // performing custom serialization for jsonNormalizations
      if (jsonNormalizations != null) {
        List<Object> jsonNormalizationsJsonList = new List<Object>();
        for (NormalizationOperation listItem : jsonNormalizations) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          jsonNormalizationsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String jsonNormalizationsKey = 'jsonNormalizations';
        if (propertyNameMapping.containsKey(jsonNormalizationsKey)) {
          jsonNormalizationsKey = propertyNameMapping.get(jsonNormalizationsKey);
        }
        jsonMap.put(jsonNormalizationsKey, jsonNormalizationsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * Conversions Builder.
   */
  public class ConversionsBuilder {
    private PdfSettings pdf;
    private WordSettings word;
    private HtmlSettings html;
    private SegmentSettings segment;
    private List<NormalizationOperation> jsonNormalizations;
    private Boolean imageTextRecognition;

    private ConversionsBuilder(Conversions conversions) {
      this.pdf = conversions.pdf;
      this.word = conversions.word;
      this.html = conversions.html;
      this.segment = conversions.segment;
      this.jsonNormalizations = conversions.jsonNormalizations;
      this.imageTextRecognition = conversions.imageTextRecognition;
    }

    /**
     * Instantiates a new builder.
     */
    public ConversionsBuilder() {
    }

    /**
     * Builds a Conversions.
     *
     * @return the conversions
     */
    public Conversions build() {
      return new Conversions(this);
    }

    /**
     * Adds an jsonNormalizations to jsonNormalizations.
     *
     * @param jsonNormalizations the new jsonNormalizations
     * @return the Conversions builder
     */
    public ConversionsBuilder addJsonNormalizations(NormalizationOperation jsonNormalizations) {
      IBMWatsonValidator.notNull(jsonNormalizations, 'jsonNormalizations cannot be null');
      if (this.jsonNormalizations == null) {
        this.jsonNormalizations = new List<NormalizationOperation>();
      }
      this.jsonNormalizations.add(jsonNormalizations);
      return this;
    }

    /**
     * Set the pdf.
     *
     * @param pdf the pdf
     * @return the Conversions builder
     */
    public ConversionsBuilder pdf(PdfSettings pdf) {
      this.pdf = pdf;
      return this;
    }

    /**
     * Set the word.
     *
     * @param word the word
     * @return the Conversions builder
     */
    public ConversionsBuilder word(WordSettings word) {
      this.word = word;
      return this;
    }

    /**
     * Set the html.
     *
     * @param html the html
     * @return the Conversions builder
     */
    public ConversionsBuilder html(HtmlSettings html) {
      this.html = html;
      return this;
    }

    /**
     * Set the segment.
     *
     * @param segment the segment
     * @return the Conversions builder
     */
    public ConversionsBuilder segment(SegmentSettings segment) {
      this.segment = segment;
      return this;
    }

    /**
     * Set the jsonNormalizations.
     * Existing jsonNormalizations will be replaced.
     *
     * @param jsonNormalizations the jsonNormalizations
     * @return the Conversions builder
     */
    public ConversionsBuilder jsonNormalizations(List<NormalizationOperation> jsonNormalizations) {
      this.jsonNormalizations = jsonNormalizations;
      return this;
    }

    /**
     * Set the imageTextRecognition.
     *
     * @param imageTextRecognition the imageTextRecognition
     * @return the Conversions builder
     */
    public ConversionsBuilder imageTextRecognition(Boolean imageTextRecognition) {
      this.imageTextRecognition = imageTextRecognition;
      return this;
    }
  }

  /**
   * The createCollection options.
   */
  public class CreateCollectionOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;
    private String description;
    private String configurationId;
    private String language;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the name.
     *
     * The name of the collection to be created.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * A description of the collection.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the configurationId.
     *
     * The ID of the configuration in which the collection is to be created.
     *
     * @return the configurationId
     */
    public String configurationId() {
      return configurationId;
    }

    /**
     * Gets the language.
     *
     * The language of the documents stored in the collection, in the form of an ISO 639-1 language code.
     *
     * @return the language
     */
    public String language() {
      return language;
    }

    private CreateCollectionOptions(CreateCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      environmentId = builder.environmentId;
      name = builder.name;
      description = builder.description;
      configurationId = builder.configurationId;
      language = builder.language;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder newBuilder() {
      return new CreateCollectionOptionsBuilder(this);
    }
  }

  /**
   * CreateCollectionOptions Builder.
   */
  public class CreateCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;
    private String description;
    private String configurationId;
    private String language;

    private CreateCollectionOptionsBuilder(CreateCollectionOptions createCollectionOptions) {
      environmentId = createCollectionOptions.environmentId;
      name = createCollectionOptions.name;
      description = createCollectionOptions.description;
      configurationId = createCollectionOptions.configurationId;
      language = createCollectionOptions.language;
      this.requestHeaders.putAll(createCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param name the name
     */
    public CreateCollectionOptionsBuilder(String environmentId, String name) {
      this.environmentId = environmentId;
      this.name = name;
    }

    /**
     * Builds a CreateCollectionOptions.
     *
     * @return the createCollectionOptions
     */
    public CreateCollectionOptions build() {
      return new CreateCollectionOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the configurationId.
     *
     * @param configurationId the configurationId
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder configurationId(String configurationId) {
      this.configurationId = configurationId;
      return this;
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createConfiguration options.
   */
  public class CreateConfigurationOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;
    private String description;
    private Conversions conversions;
    private List<Enrichment> enrichments;
    private List<NormalizationOperation> normalizations;
    private Source source;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the name.
     *
     * The name of the configuration.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the configuration, if available.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the conversions.
     *
     * Document conversion settings.
     *
     * @return the conversions
     */
    public Conversions conversions() {
      return conversions;
    }

    /**
     * Gets the enrichments.
     *
     * An array of document enrichment settings for the configuration.
     *
     * @return the enrichments
     */
    public List<Enrichment> enrichments() {
      return enrichments;
    }

    /**
     * Gets the normalizations.
     *
     * Defines operations that can be used to transform the final output JSON into a normalized form. Operations are
     * executed in the order that they appear in the array.
     *
     * @return the normalizations
     */
    public List<NormalizationOperation> normalizations() {
      return normalizations;
    }

    /**
     * Gets the source.
     *
     * Object containing source parameters for the configuration.
     *
     * @return the source
     */
    public Source source() {
      return source;
    }

    private CreateConfigurationOptions(CreateConfigurationOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      environmentId = builder.environmentId;
      name = builder.name;
      description = builder.description;
      conversions = builder.conversions;
      enrichments = builder.enrichments;
      normalizations = builder.normalizations;
      source = builder.source;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder newBuilder() {
      return new CreateConfigurationOptionsBuilder(this);
    }
  }

  /**
   * CreateConfigurationOptions Builder.
   */
  public class CreateConfigurationOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;
    private String description;
    private Conversions conversions;
    private List<Enrichment> enrichments;
    private List<NormalizationOperation> normalizations;
    private Source source;

    private CreateConfigurationOptionsBuilder(CreateConfigurationOptions createConfigurationOptions) {
      environmentId = createConfigurationOptions.environmentId;
      name = createConfigurationOptions.name;
      description = createConfigurationOptions.description;
      conversions = createConfigurationOptions.conversions;
      enrichments = createConfigurationOptions.enrichments;
      normalizations = createConfigurationOptions.normalizations;
      source = createConfigurationOptions.source;
      this.requestHeaders.putAll(createConfigurationOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateConfigurationOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param name the name
     */
    public CreateConfigurationOptionsBuilder(String environmentId, String name) {
      this.environmentId = environmentId;
      this.name = name;
    }

    /**
     * Builds a CreateConfigurationOptions.
     *
     * @return the createConfigurationOptions
     */
    public CreateConfigurationOptions build() {
      return new CreateConfigurationOptions(this);
    }

    /**
     * Adds an enrichments to enrichments.
     *
     * @param enrichments the new enrichments
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder addEnrichments(Enrichment enrichments) {
      IBMWatsonValidator.notNull(enrichments, 'enrichments cannot be null');
      if (this.enrichments == null) {
        this.enrichments = new List<Enrichment>();
      }
      this.enrichments.add(enrichments);
      return this;
    }

    /**
     * Adds an normalizations to normalizations.
     *
     * @param normalizations the new normalizations
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder addNormalizations(NormalizationOperation normalizations) {
      IBMWatsonValidator.notNull(normalizations, 'normalizations cannot be null');
      if (this.normalizations == null) {
        this.normalizations = new List<NormalizationOperation>();
      }
      this.normalizations.add(normalizations);
      return this;
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the conversions.
     *
     * @param conversions the conversions
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder conversions(Conversions conversions) {
      this.conversions = conversions;
      return this;
    }

    /**
     * Set the enrichments.
     * Existing enrichments will be replaced.
     *
     * @param enrichments the enrichments
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder enrichments(List<Enrichment> enrichments) {
      this.enrichments = enrichments;
      return this;
    }

    /**
     * Set the normalizations.
     * Existing normalizations will be replaced.
     *
     * @param normalizations the normalizations
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder normalizations(List<NormalizationOperation> normalizations) {
      this.normalizations = normalizations;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder source(Source source) {
      this.source = source;
      return this;
    }

    /**
     * Set the configuration.
     *
     * @param configuration the configuration
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder configuration(Configuration configuration) {
      this.name = configuration.getName();
      this.description = configuration.getDescription();
      this.conversions = configuration.getConversions();
      this.enrichments = configuration.getEnrichments();
      this.normalizations = configuration.getNormalizations();
      this.source = configuration.getSource();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateConfigurationOptions builder
     */
    public CreateConfigurationOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createCredentials options.
   */
  public class CreateCredentialsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String sourceType;
    private CredentialDetails credentialDetails;
    private String status;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the sourceType.
     *
     * The source that this credentials object connects to.
     * -  `box` indicates the credentials are used to connect an instance of Enterprise Box.
     * -  `salesforce` indicates the credentials are used to connect to Salesforce.
     * -  `sharepoint` indicates the credentials are used to connect to Microsoft SharePoint Online.
     * -  `web_crawl` indicates the credentials are used to perform a web crawl.
     * =  `cloud_object_storage` indicates the credentials are used to connect to an IBM Cloud Object Store.
     *
     * @return the sourceType
     */
    public String sourceType() {
      return sourceType;
    }

    /**
     * Gets the credentialDetails.
     *
     * Object containing details of the stored credentials.
     *
     * Obtain credentials for your source from the administrator of the source.
     *
     * @return the credentialDetails
     */
    public CredentialDetails credentialDetails() {
      return credentialDetails;
    }

    /**
     * Gets the status.
     *
     * The current status of this set of credentials. `connected` indicates that the credentials are available to use
     * with the source configuration of a collection. `invalid` refers to the credentials (for example, the password
     * provided has expired) and must be corrected before they can be used with a collection.
     *
     * @return the status
     */
    public String status() {
      return status;
    }

    private CreateCredentialsOptions(CreateCredentialsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      sourceType = builder.sourceType;
      credentialDetails = builder.credentialDetails;
      status = builder.status;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateCredentialsOptions builder
     */
    public CreateCredentialsOptionsBuilder newBuilder() {
      return new CreateCredentialsOptionsBuilder(this);
    }
  }

  /**
   * CreateCredentialsOptions Builder.
   */
  public class CreateCredentialsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String sourceType;
    private CredentialDetails credentialDetails;
    private String status;

    private CreateCredentialsOptionsBuilder(CreateCredentialsOptions createCredentialsOptions) {
      environmentId = createCredentialsOptions.environmentId;
      sourceType = createCredentialsOptions.sourceType;
      credentialDetails = createCredentialsOptions.credentialDetails;
      status = createCredentialsOptions.status;
      this.requestHeaders.putAll(createCredentialsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateCredentialsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public CreateCredentialsOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a CreateCredentialsOptions.
     *
     * @return the createCredentialsOptions
     */
    public CreateCredentialsOptions build() {
      return new CreateCredentialsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateCredentialsOptions builder
     */
    public CreateCredentialsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the sourceType.
     *
     * @param sourceType the sourceType
     * @return the CreateCredentialsOptions builder
     */
    public CreateCredentialsOptionsBuilder sourceType(String sourceType) {
      this.sourceType = sourceType;
      return this;
    }

    /**
     * Set the credentialDetails.
     *
     * @param credentialDetails the credentialDetails
     * @return the CreateCredentialsOptions builder
     */
    public CreateCredentialsOptionsBuilder credentialDetails(CredentialDetails credentialDetails) {
      this.credentialDetails = credentialDetails;
      return this;
    }

    /**
     * Set the status.
     *
     * @param status the status
     * @return the CreateCredentialsOptions builder
     */
    public CreateCredentialsOptionsBuilder status(String status) {
      this.status = status;
      return this;
    }

    /**
     * Set the credentials.
     *
     * @param credentials the credentials
     * @return the CreateCredentialsOptions builder
     */
    public CreateCredentialsOptionsBuilder credentials(Credentials credentials) {
      this.sourceType = credentials.getSourceType();
      this.credentialDetails = credentials.getCredentialDetails();
      this.status = credentials.getStatus();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateCredentialsOptions builder
     */
    public CreateCredentialsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createEnvironment options.
   */
  public class CreateEnvironmentOptions extends IBMWatsonOptionsModel {
    private String name;
    private String description;
    private String size;

    /**
     * Gets the name.
     *
     * Name that identifies the environment.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * Description of the environment.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the size.
     *
     * Size of the environment. In the Lite plan the default and only accepted value is `LT`, in all other plans the
     * default is `S`.
     *
     * @return the size
     */
    public String size() {
      return size;
    }

    private CreateEnvironmentOptions(CreateEnvironmentOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      name = builder.name;
      description = builder.description;
      size = builder.size;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateEnvironmentOptions builder
     */
    public CreateEnvironmentOptionsBuilder newBuilder() {
      return new CreateEnvironmentOptionsBuilder(this);
    }
  }

  /**
   * CreateEnvironmentOptions Builder.
   */
  public class CreateEnvironmentOptionsBuilder extends IBMWatsonOptionsModel {
    private String name;
    private String description;
    private String size;

    private CreateEnvironmentOptionsBuilder(CreateEnvironmentOptions createEnvironmentOptions) {
      name = createEnvironmentOptions.name;
      description = createEnvironmentOptions.description;
      size = createEnvironmentOptions.size;
      this.requestHeaders.putAll(createEnvironmentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateEnvironmentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param name the name
     */
    public CreateEnvironmentOptionsBuilder(String name) {
      this.name = name;
    }

    /**
     * Builds a CreateEnvironmentOptions.
     *
     * @return the createEnvironmentOptions
     */
    public CreateEnvironmentOptions build() {
      return new CreateEnvironmentOptions(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateEnvironmentOptions builder
     */
    public CreateEnvironmentOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateEnvironmentOptions builder
     */
    public CreateEnvironmentOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the size.
     *
     * @param size the size
     * @return the CreateEnvironmentOptions builder
     */
    public CreateEnvironmentOptionsBuilder size(String size) {
      this.size = size;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateEnvironmentOptions builder
     */
    public CreateEnvironmentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createEvent options.
   */
  public class CreateEventOptions extends IBMWatsonOptionsModel {
    private String xType;
    private EventData data;

    /**
     * Gets the xType.
     *
     * The event type to be created.
     *
     * @return the xType
     */
    public String xType() {
      return xType;
    }

    /**
     * Gets the data.
     *
     * Query event data object.
     *
     * @return the data
     */
    public EventData data() {
      return data;
    }

    private CreateEventOptions(CreateEventOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.xType, 'xType cannot be null');
      IBMWatsonValidator.notNull(builder.data, 'data cannot be null');
      xType = builder.xType;
      data = builder.data;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateEventOptions builder
     */
    public CreateEventOptionsBuilder newBuilder() {
      return new CreateEventOptionsBuilder(this);
    }
  }

  /**
   * CreateEventOptions Builder.
   */
  public class CreateEventOptionsBuilder extends IBMWatsonOptionsModel {
    private String xType;
    private EventData data;

    private CreateEventOptionsBuilder(CreateEventOptions createEventOptions) {
      xType = createEventOptions.xType;
      data = createEventOptions.data;
      this.requestHeaders.putAll(createEventOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateEventOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param xType the xType
     * @param data the data
     */
    public CreateEventOptionsBuilder(String xType, EventData data) {
      this.xType = xType;
      this.data = data;
    }

    /**
     * Builds a CreateEventOptions.
     *
     * @return the createEventOptions
     */
    public CreateEventOptions build() {
      return new CreateEventOptions(this);
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the CreateEventOptions builder
     */
    public CreateEventOptionsBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the data.
     *
     * @param data the data
     * @return the CreateEventOptions builder
     */
    public CreateEventOptionsBuilder data(EventData data) {
      this.data = data;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateEventOptions builder
     */
    public CreateEventOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * An object defining the event being created.
   */
  public class CreateEventResponse extends IBMWatsonResponseModel {
    private String xType;
    private EventData data;

    /**
     * Gets the xType.
     *
     * The event type that was created.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the data.
     *
     * Query event data object.
     *
     * @return the data
     */
    @AuraEnabled
    public EventData getData() {
      return data;
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
     * Sets the data.
     *
     * @param data the new data
     */
    public void setData(final EventData data) {
      this.data = data;
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

      CreateEventResponse ret = (CreateEventResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for data
      Map<String, Object> dataMap = (Map<String, Object>) jsonMap.get('data');
      EventData newData = (EventData) new EventData().deserialize(JSON.serialize(dataMap, true), dataMap, EventData.class);
      ret.setData(newData);

      return ret;
    }
  }

  /**
   * The createExpansions options.
   */
  public class CreateExpansionsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private List<Expansion> expansions;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the expansions.
     *
     * An array of query expansion definitions.
     *
     *  Each object in the **expansions** array represents a term or set of terms that will be expanded into other
     * terms. Each expansion object can be configured as bidirectional or unidirectional. Bidirectional means that all
     * terms are expanded to all other terms in the object. Unidirectional means that a set list of terms can be
     * expanded into a second list of terms.
     *
     *  To create a bi-directional expansion specify an **expanded_terms** array. When found in a query, all items in
     * the **expanded_terms** array are then expanded to the other items in the same array.
     *
     *  To create a uni-directional expansion, specify both an array of **input_terms** and an array of
     * **expanded_terms**. When items in the **input_terms** array are present in a query, they are expanded using the
     * items listed in the **expanded_terms** array.
     *
     * @return the expansions
     */
    public List<Expansion> expansions() {
      return expansions;
    }

    private CreateExpansionsOptions(CreateExpansionsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notNull(builder.expansions, 'expansions cannot be null');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      expansions = builder.expansions;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateExpansionsOptions builder
     */
    public CreateExpansionsOptionsBuilder newBuilder() {
      return new CreateExpansionsOptionsBuilder(this);
    }
  }

  /**
   * CreateExpansionsOptions Builder.
   */
  public class CreateExpansionsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private List<Expansion> expansions;

    private CreateExpansionsOptionsBuilder(CreateExpansionsOptions createExpansionsOptions) {
      environmentId = createExpansionsOptions.environmentId;
      collectionId = createExpansionsOptions.collectionId;
      expansions = createExpansionsOptions.expansions;
      this.requestHeaders.putAll(createExpansionsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateExpansionsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param expansions the expansions
     */
    public CreateExpansionsOptionsBuilder(String environmentId, String collectionId, List<Expansion> expansions) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.expansions = expansions;
    }

    /**
     * Builds a CreateExpansionsOptions.
     *
     * @return the createExpansionsOptions
     */
    public CreateExpansionsOptions build() {
      return new CreateExpansionsOptions(this);
    }

    /**
     * Adds an expansions to expansions.
     *
     * @param expansions the new expansions
     * @return the CreateExpansionsOptions builder
     */
    public CreateExpansionsOptionsBuilder addExpansions(Expansion expansions) {
      IBMWatsonValidator.notNull(expansions, 'expansions cannot be null');
      if (this.expansions == null) {
        this.expansions = new List<Expansion>();
      }
      this.expansions.add(expansions);
      return this;
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateExpansionsOptions builder
     */
    public CreateExpansionsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the CreateExpansionsOptions builder
     */
    public CreateExpansionsOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the expansions.
     * Existing expansions will be replaced.
     *
     * @param expansions the expansions
     * @return the CreateExpansionsOptions builder
     */
    public CreateExpansionsOptionsBuilder expansions(List<Expansion> expansions) {
      this.expansions = expansions;
      return this;
    }

    /**
     * Set the expansions.
     *
     * @param expansions the expansions
     * @return the CreateExpansionsOptions builder
     */
    public CreateExpansionsOptionsBuilder expansions(Expansions expansions) {
      this.expansions = expansions.getExpansions();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateExpansionsOptions builder
     */
    public CreateExpansionsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createGateway options.
   */
  public class CreateGatewayOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the name.
     *
     * User-defined name.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    private CreateGatewayOptions(CreateGatewayOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      name = builder.name;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateGatewayOptions builder
     */
    public CreateGatewayOptionsBuilder newBuilder() {
      return new CreateGatewayOptionsBuilder(this);
    }
  }

  /**
   * CreateGatewayOptions Builder.
   */
  public class CreateGatewayOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;

    private CreateGatewayOptionsBuilder(CreateGatewayOptions createGatewayOptions) {
      environmentId = createGatewayOptions.environmentId;
      name = createGatewayOptions.name;
      this.requestHeaders.putAll(createGatewayOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateGatewayOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public CreateGatewayOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a CreateGatewayOptions.
     *
     * @return the createGatewayOptions
     */
    public CreateGatewayOptions build() {
      return new CreateGatewayOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateGatewayOptions builder
     */
    public CreateGatewayOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateGatewayOptions builder
     */
    public CreateGatewayOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateGatewayOptions builder
     */
    public CreateGatewayOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createStopwordList options.
   */
  public class CreateStopwordListOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private IBMWatsonFile stopwordFile;
    private String stopwordFilename;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the stopwordFile.
     *
     * The content of the stopword list to ingest.
     *
     * @return the stopwordFile
     */
    public IBMWatsonFile stopwordFile() {
      return stopwordFile;
    }

    /**
     * Gets the stopwordFilename.
     *
     * The filename for stopwordFile.
     *
     * @return the stopwordFilename
     */
    public String stopwordFilename() {
      return stopwordFilename;
    }

    private CreateStopwordListOptions(CreateStopwordListOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notNull(builder.stopwordFile, 'stopwordFile cannot be null');
      IBMWatsonValidator.notNull(builder.stopwordFilename, 'stopwordFilename cannot be null');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      stopwordFile = builder.stopwordFile;
      stopwordFilename = builder.stopwordFilename;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateStopwordListOptions builder
     */
    public CreateStopwordListOptionsBuilder newBuilder() {
      return new CreateStopwordListOptionsBuilder(this);
    }
  }

  /**
   * CreateStopwordListOptions Builder.
   */
  public class CreateStopwordListOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private IBMWatsonFile stopwordFile;
    private String stopwordFilename;

    private CreateStopwordListOptionsBuilder(CreateStopwordListOptions createStopwordListOptions) {
      environmentId = createStopwordListOptions.environmentId;
      collectionId = createStopwordListOptions.collectionId;
      stopwordFile = createStopwordListOptions.stopwordFile;
      stopwordFilename = createStopwordListOptions.stopwordFilename;
      this.requestHeaders.putAll(createStopwordListOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateStopwordListOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param stopwordFile the stopwordFile
     * @param stopwordFilename the stopwordFilename
     */
    public CreateStopwordListOptionsBuilder(String environmentId, String collectionId, IBMWatsonFile stopwordFile, String stopwordFilename) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.stopwordFile = stopwordFile;
      this.stopwordFilename = stopwordFilename;
    }

    /**
     * Builds a CreateStopwordListOptions.
     *
     * @return the createStopwordListOptions
     */
    public CreateStopwordListOptions build() {
      return new CreateStopwordListOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateStopwordListOptions builder
     */
    public CreateStopwordListOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the CreateStopwordListOptions builder
     */
    public CreateStopwordListOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the stopwordFile.
     *
     * @param stopwordFile the stopwordFile
     * @return the CreateStopwordListOptions builder
     */
    public CreateStopwordListOptionsBuilder stopwordFile(IBMWatsonFile stopwordFile) {
      this.stopwordFile = stopwordFile;
      return this;
    }

    /**
     * Set the stopwordFilename.
     *
     * @param stopwordFilename the stopwordFilename
     * @return the CreateStopwordListOptions builder
     */
    public CreateStopwordListOptionsBuilder stopwordFilename(String stopwordFilename) {
      this.stopwordFilename = stopwordFilename;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateStopwordListOptions builder
     */
    public CreateStopwordListOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createTokenizationDictionary options.
   */
  public class CreateTokenizationDictionaryOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private List<TokenDictRule> tokenizationRules;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the tokenizationRules.
     *
     * An array of tokenization rules. Each rule contains, the original `text` string, component `tokens`, any alternate
     * character set `readings`, and which `part_of_speech` the text is from.
     *
     * @return the tokenizationRules
     */
    public List<TokenDictRule> tokenizationRules() {
      return tokenizationRules;
    }

    private CreateTokenizationDictionaryOptions(CreateTokenizationDictionaryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      tokenizationRules = builder.tokenizationRules;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateTokenizationDictionaryOptions builder
     */
    public CreateTokenizationDictionaryOptionsBuilder newBuilder() {
      return new CreateTokenizationDictionaryOptionsBuilder(this);
    }
  }

  /**
   * CreateTokenizationDictionaryOptions Builder.
   */
  public class CreateTokenizationDictionaryOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private List<TokenDictRule> tokenizationRules;

    private CreateTokenizationDictionaryOptionsBuilder(CreateTokenizationDictionaryOptions createTokenizationDictionaryOptions) {
      environmentId = createTokenizationDictionaryOptions.environmentId;
      collectionId = createTokenizationDictionaryOptions.collectionId;
      tokenizationRules = createTokenizationDictionaryOptions.tokenizationRules;
      this.requestHeaders.putAll(createTokenizationDictionaryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateTokenizationDictionaryOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public CreateTokenizationDictionaryOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a CreateTokenizationDictionaryOptions.
     *
     * @return the createTokenizationDictionaryOptions
     */
    public CreateTokenizationDictionaryOptions build() {
      return new CreateTokenizationDictionaryOptions(this);
    }

    /**
     * Adds an tokenizationRules to tokenizationRules.
     *
     * @param tokenizationRules the new tokenizationRules
     * @return the CreateTokenizationDictionaryOptions builder
     */
    public CreateTokenizationDictionaryOptionsBuilder addTokenizationRules(TokenDictRule tokenizationRules) {
      IBMWatsonValidator.notNull(tokenizationRules, 'tokenizationRules cannot be null');
      if (this.tokenizationRules == null) {
        this.tokenizationRules = new List<TokenDictRule>();
      }
      this.tokenizationRules.add(tokenizationRules);
      return this;
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateTokenizationDictionaryOptions builder
     */
    public CreateTokenizationDictionaryOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the CreateTokenizationDictionaryOptions builder
     */
    public CreateTokenizationDictionaryOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the tokenizationRules.
     * Existing tokenizationRules will be replaced.
     *
     * @param tokenizationRules the tokenizationRules
     * @return the CreateTokenizationDictionaryOptions builder
     */
    public CreateTokenizationDictionaryOptionsBuilder tokenizationRules(List<TokenDictRule> tokenizationRules) {
      this.tokenizationRules = tokenizationRules;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateTokenizationDictionaryOptions builder
     */
    public CreateTokenizationDictionaryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createTrainingExample options.
   */
  public class CreateTrainingExampleOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String documentId;
    private String crossReference;
    private Long relevance;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the documentId.
     *
     * The document ID associated with this training example.
     *
     * @return the documentId
     */
    public String documentId() {
      return documentId;
    }

    /**
     * Gets the crossReference.
     *
     * The cross reference associated with this training example.
     *
     * @return the crossReference
     */
    public String crossReference() {
      return crossReference;
    }

    /**
     * Gets the relevance.
     *
     * The relevance of the training example.
     *
     * @return the relevance
     */
    public Long relevance() {
      return relevance;
    }

    private CreateTrainingExampleOptions(CreateTrainingExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      queryId = builder.queryId;
      documentId = builder.documentId;
      crossReference = builder.crossReference;
      relevance = builder.relevance;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder newBuilder() {
      return new CreateTrainingExampleOptionsBuilder(this);
    }
  }

  /**
   * CreateTrainingExampleOptions Builder.
   */
  public class CreateTrainingExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String documentId;
    private String crossReference;
    private Long relevance;

    private CreateTrainingExampleOptionsBuilder(CreateTrainingExampleOptions createTrainingExampleOptions) {
      environmentId = createTrainingExampleOptions.environmentId;
      collectionId = createTrainingExampleOptions.collectionId;
      queryId = createTrainingExampleOptions.queryId;
      documentId = createTrainingExampleOptions.documentId;
      crossReference = createTrainingExampleOptions.crossReference;
      relevance = createTrainingExampleOptions.relevance;
      this.requestHeaders.putAll(createTrainingExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateTrainingExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param queryId the queryId
     */
    public CreateTrainingExampleOptionsBuilder(String environmentId, String collectionId, String queryId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.queryId = queryId;
    }

    /**
     * Builds a CreateTrainingExampleOptions.
     *
     * @return the createTrainingExampleOptions
     */
    public CreateTrainingExampleOptions build() {
      return new CreateTrainingExampleOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Set the crossReference.
     *
     * @param crossReference the crossReference
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder crossReference(String crossReference) {
      this.crossReference = crossReference;
      return this;
    }

    /**
     * Set the relevance.
     *
     * @param relevance the relevance
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder relevance(Long relevance) {
      this.relevance = relevance;
      return this;
    }

    /**
     * Set the trainingExample.
     *
     * @param trainingExample the trainingExample
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder trainingExample(TrainingExample trainingExample) {
      this.documentId = trainingExample.getDocumentId();
      this.crossReference = trainingExample.getCrossReference();
      this.relevance = trainingExample.getRelevance();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateTrainingExampleOptions builder
     */
    public CreateTrainingExampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Object containing details of the stored credentials.
   *
   * Obtain credentials for your source from the administrator of the source.
   */
  public class CredentialDetails extends IBMWatsonGenericModel {
    private String credentialType;
    private String clientId;
    private String enterpriseId;
    private String url;
    private String username;
    private String organizationUrl;
    private String siteCollectionPath;
    private String clientSecret;
    private String publicKeyId;
    private String privateKey;
    private String passphrase;
    private String password;
    private String gatewayId;
    private String sourceVersion;
    private String webApplicationUrl;
    private String domain;
    private String endpoint;
    private String accessKeyId;
    private String secretAccessKey;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public CredentialDetails() { }

    /**
     * Gets the credentialType.
     *
     * The authentication method for this credentials definition. The  **credential_type** specified must be supported
     * by the **source_type**. The following combinations are possible:
     *
     * -  `"source_type": "box"` - valid `credential_type`s: `oauth2`
     * -  `"source_type": "salesforce"` - valid `credential_type`s: `username_password`
     * -  `"source_type": "sharepoint"` - valid `credential_type`s: `saml` with **source_version** of `online`, or
     * `ntlm_v1` with **source_version** of `2016`
     * -  `"source_type": "web_crawl"` - valid `credential_type`s: `noauth` or `basic`
     * -  "source_type": "cloud_object_storage"` - valid `credential_type`s: `aws4_hmac`.
     *
     * @return the credentialType
     */
    @AuraEnabled
    public String getCredentialType() {
      return credentialType;
    }

    /**
     * Gets the clientId.
     *
     * The **client_id** of the source that these credentials connect to. Only valid, and required, with a
     * **credential_type** of `oauth2`.
     *
     * @return the clientId
     */
    @AuraEnabled
    public String getClientId() {
      return clientId;
    }

    /**
     * Gets the enterpriseId.
     *
     * The **enterprise_id** of the Box site that these credentials connect to. Only valid, and required, with a
     * **source_type** of `box`.
     *
     * @return the enterpriseId
     */
    @AuraEnabled
    public String getEnterpriseId() {
      return enterpriseId;
    }

    /**
     * Gets the url.
     *
     * The **url** of the source that these credentials connect to. Only valid, and required, with a **credential_type**
     * of `username_password`, `noauth`, and `basic`.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the username.
     *
     * The **username** of the source that these credentials connect to. Only valid, and required, with a
     * **credential_type** of `saml`, `username_password`, `basic`, or `ntlm_v1`.
     *
     * @return the username
     */
    @AuraEnabled
    public String getUsername() {
      return username;
    }

    /**
     * Gets the organizationUrl.
     *
     * The **organization_url** of the source that these credentials connect to. Only valid, and required, with a
     * **credential_type** of `saml`.
     *
     * @return the organizationUrl
     */
    @AuraEnabled
    public String getOrganizationUrl() {
      return organizationUrl;
    }

    /**
     * Gets the siteCollectionPath.
     *
     * The **site_collection.path** of the source that these credentials connect to. Only valid, and required, with a
     * **source_type** of `sharepoint`.
     *
     * @return the siteCollectionPath
     */
    @AuraEnabled
    public String getSiteCollectionPath() {
      return siteCollectionPath;
    }

    /**
     * Gets the clientSecret.
     *
     * The **client_secret** of the source that these credentials connect to. Only valid, and required, with a
     * **credential_type** of `oauth2`. This value is never returned and is only used when creating or modifying
     * **credentials**.
     *
     * @return the clientSecret
     */
    @AuraEnabled
    public String getClientSecret() {
      return clientSecret;
    }

    /**
     * Gets the publicKeyId.
     *
     * The **public_key_id** of the source that these credentials connect to. Only valid, and required, with a
     * **credential_type** of `oauth2`. This value is never returned and is only used when creating or modifying
     * **credentials**.
     *
     * @return the publicKeyId
     */
    @AuraEnabled
    public String getPublicKeyId() {
      return publicKeyId;
    }

    /**
     * Gets the privateKey.
     *
     * The **private_key** of the source that these credentials connect to. Only valid, and required, with a
     * **credential_type** of `oauth2`. This value is never returned and is only used when creating or modifying
     * **credentials**.
     *
     * @return the privateKey
     */
    @AuraEnabled
    public String getPrivateKey() {
      return privateKey;
    }

    /**
     * Gets the passphrase.
     *
     * The **passphrase** of the source that these credentials connect to. Only valid, and required, with a
     * **credential_type** of `oauth2`. This value is never returned and is only used when creating or modifying
     * **credentials**.
     *
     * @return the passphrase
     */
    @AuraEnabled
    public String getPassphrase() {
      return passphrase;
    }

    /**
     * Gets the password.
     *
     * The **password** of the source that these credentials connect to. Only valid, and required, with
     * **credential_type**s of `saml`, `username_password`, `basic`, or `ntlm_v1`.
     *
     * **Note:** When used with a **source_type** of `salesforce`, the password consists of the Salesforce password and
     * a valid Salesforce security token concatenated. This value is never returned and is only used when creating or
     * modifying **credentials**.
     *
     * @return the password
     */
    @AuraEnabled
    public String getPassword() {
      return password;
    }

    /**
     * Gets the gatewayId.
     *
     * The ID of the **gateway** to be connected through (when connecting to intranet sites). Only valid with a
     * **credential_type** of `noauth`, `basic`, or `ntlm_v1`. Gateways are created using the
     * `/v1/environments/{environment_id}/gateways` methods.
     *
     * @return the gatewayId
     */
    @AuraEnabled
    public String getGatewayId() {
      return gatewayId;
    }

    /**
     * Gets the sourceVersion.
     *
     * The type of Sharepoint repository to connect to. Only valid, and required, with a **source_type** of
     * `sharepoint`.
     *
     * @return the sourceVersion
     */
    @AuraEnabled
    public String getSourceVersion() {
      return sourceVersion;
    }

    /**
     * Gets the webApplicationUrl.
     *
     * SharePoint OnPrem WebApplication URL. Only valid, and required, with a **source_version** of `2016`. If a port is
     * not supplied, the default to port `80` for http and port `443` for https connections are used.
     *
     * @return the webApplicationUrl
     */
    @AuraEnabled
    public String getWebApplicationUrl() {
      return webApplicationUrl;
    }

    /**
     * Gets the domain.
     *
     * The domain used to log in to your OnPrem SharePoint account. Only valid, and required, with a **source_version**
     * of `2016`.
     *
     * @return the domain
     */
    @AuraEnabled
    public String getDomain() {
      return domain;
    }

    /**
     * Gets the endpoint.
     *
     * The endpoint associated with the cloud object store that your are connecting to. Only valid, and required, with a
     * **credential_type** of `aws4_hmac`.
     *
     * @return the endpoint
     */
    @AuraEnabled
    public String getEndpoint() {
      return endpoint;
    }

    /**
     * Gets the accessKeyId.
     *
     * The access key ID associated with the cloud object store. Only valid, and required, with a **credential_type** of
     * `aws4_hmac`. This value is never returned and is only used when creating or modifying **credentials**. For more
     * infomation, see the [cloud object store
     * documentation](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-using-hmac-credentials#using-hmac-credentials).
     *
     * @return the accessKeyId
     */
    @AuraEnabled
    public String getAccessKeyId() {
      return accessKeyId;
    }

    /**
     * Gets the secretAccessKey.
     *
     * The secret access key associated with the cloud object store. Only valid, and required, with a
     * **credential_type** of `aws4_hmac`. This value is never returned and is only used when creating or modifying
     * **credentials**. For more infomation, see the [cloud object store
     * documentation](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-using-hmac-credentials#using-hmac-credentials).
     *
     * @return the secretAccessKey
     */
    @AuraEnabled
    public String getSecretAccessKey() {
      return secretAccessKey;
    }
  
    private CredentialDetails(CredentialDetailsBuilder builder) {
      this.credentialType = builder.credentialType;
      this.clientId = builder.clientId;
      this.enterpriseId = builder.enterpriseId;
      this.url = builder.url;
      this.username = builder.username;
      this.organizationUrl = builder.organizationUrl;
      this.siteCollectionPath = builder.siteCollectionPath;
      this.clientSecret = builder.clientSecret;
      this.publicKeyId = builder.publicKeyId;
      this.privateKey = builder.privateKey;
      this.passphrase = builder.passphrase;
      this.password = builder.password;
      this.gatewayId = builder.gatewayId;
      this.sourceVersion = builder.sourceVersion;
      this.webApplicationUrl = builder.webApplicationUrl;
      this.domain = builder.domain;
      this.endpoint = builder.endpoint;
      this.accessKeyId = builder.accessKeyId;
      this.secretAccessKey = builder.secretAccessKey;
    }

    /**
     * New builder.
     *
     * @return a CredentialDetails builder
     */
    public CredentialDetailsBuilder newBuilder() {
      return new CredentialDetailsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'credential_type' => 'credentialType',
        'client_id' => 'clientId',
        'enterprise_id' => 'enterpriseId',
        'organization_url' => 'organizationUrl',
        'site_collection.path' => 'siteCollectionPath',
        'client_secret' => 'clientSecret',
        'public_key_id' => 'publicKeyId',
        'private_key' => 'privateKey',
        'gateway_id' => 'gatewayId',
        'source_version' => 'sourceVersion',
        'web_application_url' => 'webApplicationUrl',
        'access_key_id' => 'accessKeyId',
        'secret_access_key' => 'secretAccessKey'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CredentialDetails ret = (CredentialDetails) super.deserialize(jsonString, jsonMap, classType);
      CredentialDetailsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'credentialType' => 'credential_type',
        'clientId' => 'client_id',
        'enterpriseId' => 'enterprise_id',
        'organizationUrl' => 'organization_url',
        'siteCollectionPath' => 'site_collection.path',
        'clientSecret' => 'client_secret',
        'publicKeyId' => 'public_key_id',
        'privateKey' => 'private_key',
        'gatewayId' => 'gateway_id',
        'sourceVersion' => 'source_version',
        'webApplicationUrl' => 'web_application_url',
        'accessKeyId' => 'access_key_id',
        'secretAccessKey' => 'secret_access_key'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * CredentialDetails Builder.
   */
  public class CredentialDetailsBuilder {
    private String credentialType;
    private String clientId;
    private String enterpriseId;
    private String url;
    private String username;
    private String organizationUrl;
    private String siteCollectionPath;
    private String clientSecret;
    private String publicKeyId;
    private String privateKey;
    private String passphrase;
    private String password;
    private String gatewayId;
    private String sourceVersion;
    private String webApplicationUrl;
    private String domain;
    private String endpoint;
    private String accessKeyId;
    private String secretAccessKey;

    private CredentialDetailsBuilder(CredentialDetails credentialDetails) {
      this.credentialType = credentialDetails.credentialType;
      this.clientId = credentialDetails.clientId;
      this.enterpriseId = credentialDetails.enterpriseId;
      this.url = credentialDetails.url;
      this.username = credentialDetails.username;
      this.organizationUrl = credentialDetails.organizationUrl;
      this.siteCollectionPath = credentialDetails.siteCollectionPath;
      this.clientSecret = credentialDetails.clientSecret;
      this.publicKeyId = credentialDetails.publicKeyId;
      this.privateKey = credentialDetails.privateKey;
      this.passphrase = credentialDetails.passphrase;
      this.password = credentialDetails.password;
      this.gatewayId = credentialDetails.gatewayId;
      this.sourceVersion = credentialDetails.sourceVersion;
      this.webApplicationUrl = credentialDetails.webApplicationUrl;
      this.domain = credentialDetails.domain;
      this.endpoint = credentialDetails.endpoint;
      this.accessKeyId = credentialDetails.accessKeyId;
      this.secretAccessKey = credentialDetails.secretAccessKey;
    }

    /**
     * Instantiates a new builder.
     */
    public CredentialDetailsBuilder() {
    }

    /**
     * Builds a CredentialDetails.
     *
     * @return the credentialDetails
     */
    public CredentialDetails build() {
      return new CredentialDetails(this);
    }

    /**
     * Set the credentialType.
     *
     * @param credentialType the credentialType
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder credentialType(String credentialType) {
      this.credentialType = credentialType;
      return this;
    }

    /**
     * Set the clientId.
     *
     * @param clientId the clientId
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder clientId(String clientId) {
      this.clientId = clientId;
      return this;
    }

    /**
     * Set the enterpriseId.
     *
     * @param enterpriseId the enterpriseId
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder enterpriseId(String enterpriseId) {
      this.enterpriseId = enterpriseId;
      return this;
    }

    /**
     * Set the url.
     *
     * @param url the url
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder url(String url) {
      this.url = url;
      return this;
    }

    /**
     * Set the username.
     *
     * @param username the username
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder username(String username) {
      this.username = username;
      return this;
    }

    /**
     * Set the organizationUrl.
     *
     * @param organizationUrl the organizationUrl
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder organizationUrl(String organizationUrl) {
      this.organizationUrl = organizationUrl;
      return this;
    }

    /**
     * Set the siteCollectionPath.
     *
     * @param siteCollectionPath the siteCollectionPath
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder siteCollectionPath(String siteCollectionPath) {
      this.siteCollectionPath = siteCollectionPath;
      return this;
    }

    /**
     * Set the clientSecret.
     *
     * @param clientSecret the clientSecret
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder clientSecret(String clientSecret) {
      this.clientSecret = clientSecret;
      return this;
    }

    /**
     * Set the publicKeyId.
     *
     * @param publicKeyId the publicKeyId
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder publicKeyId(String publicKeyId) {
      this.publicKeyId = publicKeyId;
      return this;
    }

    /**
     * Set the privateKey.
     *
     * @param privateKey the privateKey
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder privateKey(String privateKey) {
      this.privateKey = privateKey;
      return this;
    }

    /**
     * Set the passphrase.
     *
     * @param passphrase the passphrase
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder passphrase(String passphrase) {
      this.passphrase = passphrase;
      return this;
    }

    /**
     * Set the password.
     *
     * @param password the password
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder password(String password) {
      this.password = password;
      return this;
    }

    /**
     * Set the gatewayId.
     *
     * @param gatewayId the gatewayId
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder gatewayId(String gatewayId) {
      this.gatewayId = gatewayId;
      return this;
    }

    /**
     * Set the sourceVersion.
     *
     * @param sourceVersion the sourceVersion
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder sourceVersion(String sourceVersion) {
      this.sourceVersion = sourceVersion;
      return this;
    }

    /**
     * Set the webApplicationUrl.
     *
     * @param webApplicationUrl the webApplicationUrl
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder webApplicationUrl(String webApplicationUrl) {
      this.webApplicationUrl = webApplicationUrl;
      return this;
    }

    /**
     * Set the domain.
     *
     * @param domain the domain
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder domain(String domain) {
      this.domain = domain;
      return this;
    }

    /**
     * Set the endpoint.
     *
     * @param endpoint the endpoint
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder endpoint(String endpoint) {
      this.endpoint = endpoint;
      return this;
    }

    /**
     * Set the accessKeyId.
     *
     * @param accessKeyId the accessKeyId
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder accessKeyId(String accessKeyId) {
      this.accessKeyId = accessKeyId;
      return this;
    }

    /**
     * Set the secretAccessKey.
     *
     * @param secretAccessKey the secretAccessKey
     * @return the CredentialDetails builder
     */
    public CredentialDetailsBuilder secretAccessKey(String secretAccessKey) {
      this.secretAccessKey = secretAccessKey;
      return this;
    }
  }

  /**
   * Object containing credential information.
   */
  public class Credentials extends IBMWatsonResponseModel {
    private String credentialId;
    private String sourceType;
    private CredentialDetails credentialDetails;
    private String status;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Credentials() { }

    /**
     * Gets the credentialId.
     *
     * Unique identifier for this set of credentials.
     *
     * @return the credentialId
     */
    @AuraEnabled
    public String getCredentialId() {
      return credentialId;
    }

    /**
     * Gets the sourceType.
     *
     * The source that this credentials object connects to.
     * -  `box` indicates the credentials are used to connect an instance of Enterprise Box.
     * -  `salesforce` indicates the credentials are used to connect to Salesforce.
     * -  `sharepoint` indicates the credentials are used to connect to Microsoft SharePoint Online.
     * -  `web_crawl` indicates the credentials are used to perform a web crawl.
     * =  `cloud_object_storage` indicates the credentials are used to connect to an IBM Cloud Object Store.
     *
     * @return the sourceType
     */
    @AuraEnabled
    public String getSourceType() {
      return sourceType;
    }

    /**
     * Gets the credentialDetails.
     *
     * Object containing details of the stored credentials.
     *
     * Obtain credentials for your source from the administrator of the source.
     *
     * @return the credentialDetails
     */
    @AuraEnabled
    public CredentialDetails getCredentialDetails() {
      return credentialDetails;
    }

    /**
     * Gets the status.
     *
     * The current status of this set of credentials. `connected` indicates that the credentials are available to use
     * with the source configuration of a collection. `invalid` refers to the credentials (for example, the password
     * provided has expired) and must be corrected before they can be used with a collection.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }
  
    private Credentials(CredentialsBuilder builder) {
      this.credentialId = builder.credentialId;
      this.sourceType = builder.sourceType;
      this.credentialDetails = builder.credentialDetails;
      this.status = builder.status;
    }

    /**
     * New builder.
     *
     * @return a Credentials builder
     */
    public CredentialsBuilder newBuilder() {
      return new CredentialsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'credential_id' => 'credentialId',
        'source_type' => 'sourceType',
        'credential_details' => 'credentialDetails'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Credentials ret = (Credentials) super.deserialize(jsonString, jsonMap, classType);
      CredentialsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for credentialDetails
      Map<String, Object> credentialDetailsMap = (Map<String, Object>) jsonMap.get('credentialDetails');
      CredentialDetails newCredentialDetails = (CredentialDetails) new CredentialDetails().deserialize(JSON.serialize(credentialDetailsMap, true), credentialDetailsMap, CredentialDetails.class);
      retBuilder.credentialDetails(newCredentialDetails);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'credentialId' => 'credential_id',
        'sourceType' => 'source_type',
        'credentialDetails' => 'credential_details'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for credentialDetails
      if (credentialDetails != null) {
        String credentialDetailsJsonString = JSON.serialize(credentialDetails.replacePropertyNames(), true);
        String credentialDetailsKey = 'credentialDetails';
        if (propertyNameMapping.containsKey(credentialDetailsKey)) {
          credentialDetailsKey = propertyNameMapping.get(credentialDetailsKey);
        }
        jsonMap.put(credentialDetailsKey, JSON.deserializeUntyped(credentialDetailsJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * Credentials Builder.
   */
  public class CredentialsBuilder {
    private String credentialId;
    private String sourceType;
    private CredentialDetails credentialDetails;
    private String status;

    private CredentialsBuilder(Credentials credentials) {
      this.credentialId = credentials.credentialId;
      this.sourceType = credentials.sourceType;
      this.credentialDetails = credentials.credentialDetails;
      this.status = credentials.status;
    }

    /**
     * Instantiates a new builder.
     */
    public CredentialsBuilder() {
    }

    /**
     * Builds a Credentials.
     *
     * @return the credentials
     */
    public Credentials build() {
      return new Credentials(this);
    }

    /**
     * Set the credentialId.
     *
     * @param credentialId the credentialId
     * @return the Credentials builder
     */
    public CredentialsBuilder credentialId(String credentialId) {
      this.credentialId = credentialId;
      return this;
    }

    /**
     * Set the sourceType.
     *
     * @param sourceType the sourceType
     * @return the Credentials builder
     */
    public CredentialsBuilder sourceType(String sourceType) {
      this.sourceType = sourceType;
      return this;
    }

    /**
     * Set the credentialDetails.
     *
     * @param credentialDetails the credentialDetails
     * @return the Credentials builder
     */
    public CredentialsBuilder credentialDetails(CredentialDetails credentialDetails) {
      this.credentialDetails = credentialDetails;
      return this;
    }

    /**
     * Set the status.
     *
     * @param status the status
     * @return the Credentials builder
     */
    public CredentialsBuilder status(String status) {
      this.status = status;
      return this;
    }
  }

  /**
   * Object containing array of credential definitions.
   */
  public class CredentialsList extends IBMWatsonResponseModel {
    private List<Credentials> credentials;

    /**
     * Gets the credentials.
     *
     * An array of credential definitions that were created for this instance.
     *
     * @return the credentials
     */
    @AuraEnabled
    public List<Credentials> getCredentials() {
      return credentials;
    }

    /**
     * Sets the credentials.
     *
     * @param credentials the new credentials
     */
    public void setCredentials(final List<Credentials> credentials) {
      this.credentials = credentials;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      CredentialsList ret = (CredentialsList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for credentials
      List<Credentials> newCredentials = new List<Credentials>();
      List<Credentials> deserializedCredentials = ret.getCredentials();
      if (deserializedCredentials != null) {
        for (Integer i = 0; i < deserializedCredentials.size(); i++) {
          Credentials currentItem = ret.getCredentials().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('credentials');
          Credentials newItem = (Credentials) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Credentials.class);
          newCredentials.add(newItem);
        }
        ret.credentials = newCredentials;
      }

      return ret;
    }
  }

  /**
   * The deleteAllTrainingData options.
   */
  public class DeleteAllTrainingDataOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private DeleteAllTrainingDataOptions(DeleteAllTrainingDataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteAllTrainingDataOptions builder
     */
    public DeleteAllTrainingDataOptionsBuilder newBuilder() {
      return new DeleteAllTrainingDataOptionsBuilder(this);
    }
  }

  /**
   * DeleteAllTrainingDataOptions Builder.
   */
  public class DeleteAllTrainingDataOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private DeleteAllTrainingDataOptionsBuilder(DeleteAllTrainingDataOptions deleteAllTrainingDataOptions) {
      environmentId = deleteAllTrainingDataOptions.environmentId;
      collectionId = deleteAllTrainingDataOptions.collectionId;
      this.requestHeaders.putAll(deleteAllTrainingDataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteAllTrainingDataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public DeleteAllTrainingDataOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a DeleteAllTrainingDataOptions.
     *
     * @return the deleteAllTrainingDataOptions
     */
    public DeleteAllTrainingDataOptions build() {
      return new DeleteAllTrainingDataOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteAllTrainingDataOptions builder
     */
    public DeleteAllTrainingDataOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteAllTrainingDataOptions builder
     */
    public DeleteAllTrainingDataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteAllTrainingDataOptions builder
     */
    public DeleteAllTrainingDataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteCollection options.
   */
  public class DeleteCollectionOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private DeleteCollectionOptions(DeleteCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteCollectionOptions builder
     */
    public DeleteCollectionOptionsBuilder newBuilder() {
      return new DeleteCollectionOptionsBuilder(this);
    }
  }

  /**
   * DeleteCollectionOptions Builder.
   */
  public class DeleteCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private DeleteCollectionOptionsBuilder(DeleteCollectionOptions deleteCollectionOptions) {
      environmentId = deleteCollectionOptions.environmentId;
      collectionId = deleteCollectionOptions.collectionId;
      this.requestHeaders.putAll(deleteCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public DeleteCollectionOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a DeleteCollectionOptions.
     *
     * @return the deleteCollectionOptions
     */
    public DeleteCollectionOptions build() {
      return new DeleteCollectionOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteCollectionOptions builder
     */
    public DeleteCollectionOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteCollectionOptions builder
     */
    public DeleteCollectionOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteCollectionOptions builder
     */
    public DeleteCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteConfiguration options.
   */
  public class DeleteConfigurationOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String configurationId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the configurationId.
     *
     * The ID of the configuration.
     *
     * @return the configurationId
     */
    public String configurationId() {
      return configurationId;
    }

    private DeleteConfigurationOptions(DeleteConfigurationOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.configurationId, 'configurationId cannot be empty');
      environmentId = builder.environmentId;
      configurationId = builder.configurationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteConfigurationOptions builder
     */
    public DeleteConfigurationOptionsBuilder newBuilder() {
      return new DeleteConfigurationOptionsBuilder(this);
    }
  }

  /**
   * DeleteConfigurationOptions Builder.
   */
  public class DeleteConfigurationOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String configurationId;

    private DeleteConfigurationOptionsBuilder(DeleteConfigurationOptions deleteConfigurationOptions) {
      environmentId = deleteConfigurationOptions.environmentId;
      configurationId = deleteConfigurationOptions.configurationId;
      this.requestHeaders.putAll(deleteConfigurationOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteConfigurationOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param configurationId the configurationId
     */
    public DeleteConfigurationOptionsBuilder(String environmentId, String configurationId) {
      this.environmentId = environmentId;
      this.configurationId = configurationId;
    }

    /**
     * Builds a DeleteConfigurationOptions.
     *
     * @return the deleteConfigurationOptions
     */
    public DeleteConfigurationOptions build() {
      return new DeleteConfigurationOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteConfigurationOptions builder
     */
    public DeleteConfigurationOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the configurationId.
     *
     * @param configurationId the configurationId
     * @return the DeleteConfigurationOptions builder
     */
    public DeleteConfigurationOptionsBuilder configurationId(String configurationId) {
      this.configurationId = configurationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteConfigurationOptions builder
     */
    public DeleteConfigurationOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteCredentials options.
   */
  public class DeleteCredentialsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String credentialId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the credentialId.
     *
     * The unique identifier for a set of source credentials.
     *
     * @return the credentialId
     */
    public String credentialId() {
      return credentialId;
    }

    private DeleteCredentialsOptions(DeleteCredentialsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.credentialId, 'credentialId cannot be empty');
      environmentId = builder.environmentId;
      credentialId = builder.credentialId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteCredentialsOptions builder
     */
    public DeleteCredentialsOptionsBuilder newBuilder() {
      return new DeleteCredentialsOptionsBuilder(this);
    }
  }

  /**
   * DeleteCredentialsOptions Builder.
   */
  public class DeleteCredentialsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String credentialId;

    private DeleteCredentialsOptionsBuilder(DeleteCredentialsOptions deleteCredentialsOptions) {
      environmentId = deleteCredentialsOptions.environmentId;
      credentialId = deleteCredentialsOptions.credentialId;
      this.requestHeaders.putAll(deleteCredentialsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteCredentialsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param credentialId the credentialId
     */
    public DeleteCredentialsOptionsBuilder(String environmentId, String credentialId) {
      this.environmentId = environmentId;
      this.credentialId = credentialId;
    }

    /**
     * Builds a DeleteCredentialsOptions.
     *
     * @return the deleteCredentialsOptions
     */
    public DeleteCredentialsOptions build() {
      return new DeleteCredentialsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteCredentialsOptions builder
     */
    public DeleteCredentialsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the credentialId.
     *
     * @param credentialId the credentialId
     * @return the DeleteCredentialsOptions builder
     */
    public DeleteCredentialsOptionsBuilder credentialId(String credentialId) {
      this.credentialId = credentialId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteCredentialsOptions builder
     */
    public DeleteCredentialsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteDocument options.
   */
  public class DeleteDocumentOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String documentId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private DeleteDocumentOptions(DeleteDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      documentId = builder.documentId;
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
    private String environmentId;
    private String collectionId;
    private String documentId;

    private DeleteDocumentOptionsBuilder(DeleteDocumentOptions deleteDocumentOptions) {
      environmentId = deleteDocumentOptions.environmentId;
      collectionId = deleteDocumentOptions.collectionId;
      documentId = deleteDocumentOptions.documentId;
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
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param documentId the documentId
     */
    public DeleteDocumentOptionsBuilder(String environmentId, String collectionId, String documentId) {
      this.environmentId = environmentId;
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
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteDocumentOptions builder
     */
    public DeleteDocumentOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
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
   * The deleteEnvironment options.
   */
  public class DeleteEnvironmentOptions extends IBMWatsonOptionsModel {
    private String environmentId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    private DeleteEnvironmentOptions(DeleteEnvironmentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteEnvironmentOptions builder
     */
    public DeleteEnvironmentOptionsBuilder newBuilder() {
      return new DeleteEnvironmentOptionsBuilder(this);
    }
  }

  /**
   * DeleteEnvironmentOptions Builder.
   */
  public class DeleteEnvironmentOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;

    private DeleteEnvironmentOptionsBuilder(DeleteEnvironmentOptions deleteEnvironmentOptions) {
      environmentId = deleteEnvironmentOptions.environmentId;
      this.requestHeaders.putAll(deleteEnvironmentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteEnvironmentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public DeleteEnvironmentOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a DeleteEnvironmentOptions.
     *
     * @return the deleteEnvironmentOptions
     */
    public DeleteEnvironmentOptions build() {
      return new DeleteEnvironmentOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteEnvironmentOptions builder
     */
    public DeleteEnvironmentOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteEnvironmentOptions builder
     */
    public DeleteEnvironmentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteExpansions options.
   */
  public class DeleteExpansionsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private DeleteExpansionsOptions(DeleteExpansionsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteExpansionsOptions builder
     */
    public DeleteExpansionsOptionsBuilder newBuilder() {
      return new DeleteExpansionsOptionsBuilder(this);
    }
  }

  /**
   * DeleteExpansionsOptions Builder.
   */
  public class DeleteExpansionsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private DeleteExpansionsOptionsBuilder(DeleteExpansionsOptions deleteExpansionsOptions) {
      environmentId = deleteExpansionsOptions.environmentId;
      collectionId = deleteExpansionsOptions.collectionId;
      this.requestHeaders.putAll(deleteExpansionsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteExpansionsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public DeleteExpansionsOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a DeleteExpansionsOptions.
     *
     * @return the deleteExpansionsOptions
     */
    public DeleteExpansionsOptions build() {
      return new DeleteExpansionsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteExpansionsOptions builder
     */
    public DeleteExpansionsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteExpansionsOptions builder
     */
    public DeleteExpansionsOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteExpansionsOptions builder
     */
    public DeleteExpansionsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteGateway options.
   */
  public class DeleteGatewayOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String gatewayId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the gatewayId.
     *
     * The requested gateway ID.
     *
     * @return the gatewayId
     */
    public String gatewayId() {
      return gatewayId;
    }

    private DeleteGatewayOptions(DeleteGatewayOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.gatewayId, 'gatewayId cannot be empty');
      environmentId = builder.environmentId;
      gatewayId = builder.gatewayId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteGatewayOptions builder
     */
    public DeleteGatewayOptionsBuilder newBuilder() {
      return new DeleteGatewayOptionsBuilder(this);
    }
  }

  /**
   * DeleteGatewayOptions Builder.
   */
  public class DeleteGatewayOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String gatewayId;

    private DeleteGatewayOptionsBuilder(DeleteGatewayOptions deleteGatewayOptions) {
      environmentId = deleteGatewayOptions.environmentId;
      gatewayId = deleteGatewayOptions.gatewayId;
      this.requestHeaders.putAll(deleteGatewayOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteGatewayOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param gatewayId the gatewayId
     */
    public DeleteGatewayOptionsBuilder(String environmentId, String gatewayId) {
      this.environmentId = environmentId;
      this.gatewayId = gatewayId;
    }

    /**
     * Builds a DeleteGatewayOptions.
     *
     * @return the deleteGatewayOptions
     */
    public DeleteGatewayOptions build() {
      return new DeleteGatewayOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteGatewayOptions builder
     */
    public DeleteGatewayOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the gatewayId.
     *
     * @param gatewayId the gatewayId
     * @return the DeleteGatewayOptions builder
     */
    public DeleteGatewayOptionsBuilder gatewayId(String gatewayId) {
      this.gatewayId = gatewayId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteGatewayOptions builder
     */
    public DeleteGatewayOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteStopwordList options.
   */
  public class DeleteStopwordListOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private DeleteStopwordListOptions(DeleteStopwordListOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteStopwordListOptions builder
     */
    public DeleteStopwordListOptionsBuilder newBuilder() {
      return new DeleteStopwordListOptionsBuilder(this);
    }
  }

  /**
   * DeleteStopwordListOptions Builder.
   */
  public class DeleteStopwordListOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private DeleteStopwordListOptionsBuilder(DeleteStopwordListOptions deleteStopwordListOptions) {
      environmentId = deleteStopwordListOptions.environmentId;
      collectionId = deleteStopwordListOptions.collectionId;
      this.requestHeaders.putAll(deleteStopwordListOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteStopwordListOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public DeleteStopwordListOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a DeleteStopwordListOptions.
     *
     * @return the deleteStopwordListOptions
     */
    public DeleteStopwordListOptions build() {
      return new DeleteStopwordListOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteStopwordListOptions builder
     */
    public DeleteStopwordListOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteStopwordListOptions builder
     */
    public DeleteStopwordListOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteStopwordListOptions builder
     */
    public DeleteStopwordListOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteTokenizationDictionary options.
   */
  public class DeleteTokenizationDictionaryOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private DeleteTokenizationDictionaryOptions(DeleteTokenizationDictionaryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteTokenizationDictionaryOptions builder
     */
    public DeleteTokenizationDictionaryOptionsBuilder newBuilder() {
      return new DeleteTokenizationDictionaryOptionsBuilder(this);
    }
  }

  /**
   * DeleteTokenizationDictionaryOptions Builder.
   */
  public class DeleteTokenizationDictionaryOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private DeleteTokenizationDictionaryOptionsBuilder(DeleteTokenizationDictionaryOptions deleteTokenizationDictionaryOptions) {
      environmentId = deleteTokenizationDictionaryOptions.environmentId;
      collectionId = deleteTokenizationDictionaryOptions.collectionId;
      this.requestHeaders.putAll(deleteTokenizationDictionaryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteTokenizationDictionaryOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public DeleteTokenizationDictionaryOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a DeleteTokenizationDictionaryOptions.
     *
     * @return the deleteTokenizationDictionaryOptions
     */
    public DeleteTokenizationDictionaryOptions build() {
      return new DeleteTokenizationDictionaryOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteTokenizationDictionaryOptions builder
     */
    public DeleteTokenizationDictionaryOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteTokenizationDictionaryOptions builder
     */
    public DeleteTokenizationDictionaryOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteTokenizationDictionaryOptions builder
     */
    public DeleteTokenizationDictionaryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteTrainingData options.
   */
  public class DeleteTrainingDataOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the queryId.
     *
     * The ID of the query used for training.
     *
     * @return the queryId
     */
    public String queryId() {
      return queryId;
    }

    private DeleteTrainingDataOptions(DeleteTrainingDataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      queryId = builder.queryId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteTrainingDataOptions builder
     */
    public DeleteTrainingDataOptionsBuilder newBuilder() {
      return new DeleteTrainingDataOptionsBuilder(this);
    }
  }

  /**
   * DeleteTrainingDataOptions Builder.
   */
  public class DeleteTrainingDataOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;

    private DeleteTrainingDataOptionsBuilder(DeleteTrainingDataOptions deleteTrainingDataOptions) {
      environmentId = deleteTrainingDataOptions.environmentId;
      collectionId = deleteTrainingDataOptions.collectionId;
      queryId = deleteTrainingDataOptions.queryId;
      this.requestHeaders.putAll(deleteTrainingDataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteTrainingDataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param queryId the queryId
     */
    public DeleteTrainingDataOptionsBuilder(String environmentId, String collectionId, String queryId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.queryId = queryId;
    }

    /**
     * Builds a DeleteTrainingDataOptions.
     *
     * @return the deleteTrainingDataOptions
     */
    public DeleteTrainingDataOptions build() {
      return new DeleteTrainingDataOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteTrainingDataOptions builder
     */
    public DeleteTrainingDataOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteTrainingDataOptions builder
     */
    public DeleteTrainingDataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the DeleteTrainingDataOptions builder
     */
    public DeleteTrainingDataOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteTrainingDataOptions builder
     */
    public DeleteTrainingDataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteTrainingExample options.
   */
  public class DeleteTrainingExampleOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String exampleId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the exampleId.
     *
     * The ID of the document as it is indexed.
     *
     * @return the exampleId
     */
    public String exampleId() {
      return exampleId;
    }

    private DeleteTrainingExampleOptions(DeleteTrainingExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.exampleId, 'exampleId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      queryId = builder.queryId;
      exampleId = builder.exampleId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteTrainingExampleOptions builder
     */
    public DeleteTrainingExampleOptionsBuilder newBuilder() {
      return new DeleteTrainingExampleOptionsBuilder(this);
    }
  }

  /**
   * DeleteTrainingExampleOptions Builder.
   */
  public class DeleteTrainingExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String exampleId;

    private DeleteTrainingExampleOptionsBuilder(DeleteTrainingExampleOptions deleteTrainingExampleOptions) {
      environmentId = deleteTrainingExampleOptions.environmentId;
      collectionId = deleteTrainingExampleOptions.collectionId;
      queryId = deleteTrainingExampleOptions.queryId;
      exampleId = deleteTrainingExampleOptions.exampleId;
      this.requestHeaders.putAll(deleteTrainingExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteTrainingExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param queryId the queryId
     * @param exampleId the exampleId
     */
    public DeleteTrainingExampleOptionsBuilder(String environmentId, String collectionId, String queryId, String exampleId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.queryId = queryId;
      this.exampleId = exampleId;
    }

    /**
     * Builds a DeleteTrainingExampleOptions.
     *
     * @return the deleteTrainingExampleOptions
     */
    public DeleteTrainingExampleOptions build() {
      return new DeleteTrainingExampleOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the DeleteTrainingExampleOptions builder
     */
    public DeleteTrainingExampleOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteTrainingExampleOptions builder
     */
    public DeleteTrainingExampleOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the DeleteTrainingExampleOptions builder
     */
    public DeleteTrainingExampleOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Set the exampleId.
     *
     * @param exampleId the exampleId
     * @return the DeleteTrainingExampleOptions builder
     */
    public DeleteTrainingExampleOptionsBuilder exampleId(String exampleId) {
      this.exampleId = exampleId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteTrainingExampleOptions builder
     */
    public DeleteTrainingExampleOptionsBuilder addHeader(String name, String value) {
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
   * Summary of the disk usage statistics for the environment.
   */
  public class DiskUsage extends IBMWatsonGenericModel {
    private Long usedBytes;
    private Long maximumAllowedBytes;

    /**
     * Gets the usedBytes.
     *
     * Number of bytes within the environment's disk capacity that are currently used to store data.
     *
     * @return the usedBytes
     */
    @AuraEnabled
    public Long getUsedBytes() {
      return usedBytes;
    }

    /**
     * Gets the maximumAllowedBytes.
     *
     * Total number of bytes available in the environment's disk capacity.
     *
     * @return the maximumAllowedBytes
     */
    @AuraEnabled
    public Long getMaximumAllowedBytes() {
      return maximumAllowedBytes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'used_bytes' => 'usedBytes',
        'maximum_allowed_bytes' => 'maximumAllowedBytes'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DiskUsage ret = (DiskUsage) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Information returned after an uploaded document is accepted.
   */
  public class DocumentAccepted extends IBMWatsonResponseModel {
    private String documentId;
    private String status;
    private List<Notice> notices;

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
     * Gets the notices.
     *
     * Array of notices produced by the document-ingestion process.
     *
     * @return the notices
     */
    @AuraEnabled
    public List<Notice> getNotices() {
      return notices;
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
        'document_id' => 'documentId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DocumentAccepted ret = (DocumentAccepted) super.deserialize(jsonString, jsonMap, classType);

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
   * Object containing collection document count information.
   */
  public class DocumentCounts extends IBMWatsonGenericModel {
    private Long available;
    private Long processing;
    private Long failed;
    private Long pending;

    /**
     * Gets the available.
     *
     * The total number of available documents in the collection.
     *
     * @return the available
     */
    @AuraEnabled
    public Long getAvailable() {
      return available;
    }

    /**
     * Gets the processing.
     *
     * The number of documents in the collection that are currently being processed.
     *
     * @return the processing
     */
    @AuraEnabled
    public Long getProcessing() {
      return processing;
    }

    /**
     * Gets the failed.
     *
     * The number of documents in the collection that failed to be ingested.
     *
     * @return the failed
     */
    @AuraEnabled
    public Long getFailed() {
      return failed;
    }

    /**
     * Gets the pending.
     *
     * The number of documents that have been uploaded to the collection, but have not yet started processing.
     *
     * @return the pending
     */
    @AuraEnabled
    public Long getPending() {
      return pending;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DocumentCounts ret = (DocumentCounts) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Status information about a submitted document.
   */
  public class DocumentStatus extends IBMWatsonResponseModel {
    private String documentId;
    private String configurationId;
    private String status;
    private String statusDescription;
    private String filename;
    private String fileType;
    private String sha1;
    private List<Notice> notices;

    /**
     * Gets the documentId.
     *
     * The unique identifier of the document.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the configurationId.
     *
     * The unique identifier for the configuration.
     *
     * @return the configurationId
     */
    @AuraEnabled
    public String getConfigurationId() {
      return configurationId;
    }

    /**
     * Gets the status.
     *
     * Status of the document in the ingestion process.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the statusDescription.
     *
     * Description of the document status.
     *
     * @return the statusDescription
     */
    @AuraEnabled
    public String getStatusDescription() {
      return statusDescription;
    }

    /**
     * Gets the filename.
     *
     * Name of the original source file (if available).
     *
     * @return the filename
     */
    @AuraEnabled
    public String getFilename() {
      return filename;
    }

    /**
     * Gets the fileType.
     *
     * The type of the original source file.
     *
     * @return the fileType
     */
    @AuraEnabled
    public String getFileType() {
      return fileType;
    }

    /**
     * Gets the sha1.
     *
     * The SHA-1 hash of the original source file (formatted as a hexadecimal string).
     *
     * @return the sha1
     */
    @AuraEnabled
    public String getSha1() {
      return sha1;
    }

    /**
     * Gets the notices.
     *
     * Array of notices produced by the document-ingestion process.
     *
     * @return the notices
     */
    @AuraEnabled
    public List<Notice> getNotices() {
      return notices;
    }

    /**
     * Sets the filename.
     *
     * @param filename the new filename
     */
    public void setFilename(final String filename) {
      this.filename = filename;
    }

    /**
     * Sets the fileType.
     *
     * @param fileType the new fileType
     */
    public void setFileType(final String fileType) {
      this.fileType = fileType;
    }

    /**
     * Sets the sha1.
     *
     * @param sha1 the new sha1
     */
    public void setSha1(final String sha1) {
      this.sha1 = sha1;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_id' => 'documentId',
        'configuration_id' => 'configurationId',
        'status_description' => 'statusDescription',
        'file_type' => 'fileType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DocumentStatus ret = (DocumentStatus) super.deserialize(jsonString, jsonMap, classType);

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
   * Enrichment step to perform on the document. Each enrichment is performed on the specified field in the order that
   * they are listed in the configuration.
   */
  public class Enrichment extends IBMWatsonGenericModel {
    private String description;
    private String destinationField;
    private String sourceField;
    private Boolean overwrite;
    private String enrichment;
    private Boolean ignoreDownstreamErrors;
    private EnrichmentOptions options;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Enrichment() { }

    /**
     * Gets the description.
     *
     * Describes what the enrichment step does.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the destinationField.
     *
     * Field where enrichments will be stored. This field must already exist or be at most 1 level deeper than an
     * existing field. For example, if `text` is a top-level field with no sub-fields, `text.foo` is a valid destination
     * but `text.foo.bar` is not.
     *
     * @return the destinationField
     */
    @AuraEnabled
    public String getDestinationField() {
      return destinationField;
    }

    /**
     * Gets the sourceField.
     *
     * Field to be enriched.
     *
     * Arrays can be specified as the **source_field** if the **enrichment** service for this enrichment is set to
     * `natural_language_undstanding`.
     *
     * @return the sourceField
     */
    @AuraEnabled
    public String getSourceField() {
      return sourceField;
    }

    /**
     * Gets the overwrite.
     *
     * Indicates that the enrichments will overwrite the destination_field field if it already exists.
     *
     * @return the overwrite
     */
    @AuraEnabled
    public Boolean getOverwrite() {
      return overwrite;
    }

    /**
     * Gets the enrichment.
     *
     * Name of the enrichment service to call. Current options are `natural_language_understanding` and `elements`.
     *
     *  When using `natual_language_understanding`, the **options** object must contain Natural Language Understanding
     * options.
     *
     *  When using `elements` the **options** object must contain Element Classification options. Additionally, when
     * using the `elements` enrichment the configuration specified and files ingested must meet all the criteria
     * specified in [the
     * documentation](https://cloud.ibm.com/docs/discovery?topic=discovery-element-classification#element-classification).
     *
     * @return the enrichment
     */
    @AuraEnabled
    public String getEnrichment() {
      return enrichment;
    }

    /**
     * Gets the ignoreDownstreamErrors.
     *
     * If true, then most errors generated during the enrichment process will be treated as warnings and will not cause
     * the document to fail processing.
     *
     * @return the ignoreDownstreamErrors
     */
    @AuraEnabled
    public Boolean getIgnoreDownstreamErrors() {
      return ignoreDownstreamErrors;
    }

    /**
     * Gets the options.
     *
     * Options which are specific to a particular enrichment.
     *
     * @return the options
     */
    @AuraEnabled
    public EnrichmentOptions getOptions() {
      return options;
    }
  
    private Enrichment(EnrichmentBuilder builder) {
      IBMWatsonValidator.notNull(builder.destinationField, 'destinationField cannot be null');
      IBMWatsonValidator.notNull(builder.sourceField, 'sourceField cannot be null');
      IBMWatsonValidator.notNull(builder.enrichment, 'enrichment cannot be null');
      this.description = builder.description;
      this.destinationField = builder.destinationField;
      this.sourceField = builder.sourceField;
      this.overwrite = builder.overwrite;
      this.enrichment = builder.enrichment;
      this.ignoreDownstreamErrors = builder.ignoreDownstreamErrors;
      this.options = builder.options;
    }

    /**
     * New builder.
     *
     * @return a Enrichment builder
     */
    public EnrichmentBuilder newBuilder() {
      return new EnrichmentBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'destination_field' => 'destinationField',
        'source_field' => 'sourceField',
        'ignore_downstream_errors' => 'ignoreDownstreamErrors'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Enrichment ret = (Enrichment) super.deserialize(jsonString, jsonMap, classType);
      EnrichmentBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for options
      Map<String, Object> optionsMap = (Map<String, Object>) jsonMap.get('options');
      EnrichmentOptions newOptions = (EnrichmentOptions) new EnrichmentOptions().deserialize(JSON.serialize(optionsMap, true), optionsMap, EnrichmentOptions.class);
      retBuilder.options(newOptions);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'destinationField' => 'destination_field',
        'sourceField' => 'source_field',
        'ignoreDownstreamErrors' => 'ignore_downstream_errors'
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

      return jsonMap;
    }
  }

  /**
   * Enrichment Builder.
   */
  public class EnrichmentBuilder {
    private String description;
    private String destinationField;
    private String sourceField;
    private Boolean overwrite;
    private String enrichment;
    private Boolean ignoreDownstreamErrors;
    private EnrichmentOptions options;

    private EnrichmentBuilder(Enrichment enrichment) {
      this.description = enrichment.description;
      this.destinationField = enrichment.destinationField;
      this.sourceField = enrichment.sourceField;
      this.overwrite = enrichment.overwrite;
      this.enrichment = enrichment.enrichment;
      this.ignoreDownstreamErrors = enrichment.ignoreDownstreamErrors;
      this.options = enrichment.options;
    }

    /**
     * Instantiates a new builder.
     */
    public EnrichmentBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param destinationField the destinationField
     * @param sourceField the sourceField
     * @param enrichment the enrichment
     */
    public EnrichmentBuilder(String destinationField, String sourceField, String enrichment) {
      this.destinationField = destinationField;
      this.sourceField = sourceField;
      this.enrichment = enrichment;
    }

    /**
     * Builds a Enrichment.
     *
     * @return the enrichment
     */
    public Enrichment build() {
      return new Enrichment(this);
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the Enrichment builder
     */
    public EnrichmentBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the destinationField.
     *
     * @param destinationField the destinationField
     * @return the Enrichment builder
     */
    public EnrichmentBuilder destinationField(String destinationField) {
      this.destinationField = destinationField;
      return this;
    }

    /**
     * Set the sourceField.
     *
     * @param sourceField the sourceField
     * @return the Enrichment builder
     */
    public EnrichmentBuilder sourceField(String sourceField) {
      this.sourceField = sourceField;
      return this;
    }

    /**
     * Set the overwrite.
     *
     * @param overwrite the overwrite
     * @return the Enrichment builder
     */
    public EnrichmentBuilder overwrite(Boolean overwrite) {
      this.overwrite = overwrite;
      return this;
    }

    /**
     * Set the enrichment.
     *
     * @param enrichment the enrichment
     * @return the Enrichment builder
     */
    public EnrichmentBuilder enrichment(String enrichment) {
      this.enrichment = enrichment;
      return this;
    }

    /**
     * Set the ignoreDownstreamErrors.
     *
     * @param ignoreDownstreamErrors the ignoreDownstreamErrors
     * @return the Enrichment builder
     */
    public EnrichmentBuilder ignoreDownstreamErrors(Boolean ignoreDownstreamErrors) {
      this.ignoreDownstreamErrors = ignoreDownstreamErrors;
      return this;
    }

    /**
     * Set the options.
     *
     * @param options the options
     * @return the Enrichment builder
     */
    public EnrichmentBuilder options(EnrichmentOptions options) {
      this.options = options;
      return this;
    }
  }

  /**
   * Options which are specific to a particular enrichment.
   */
  public class EnrichmentOptions extends IBMWatsonGenericModel {
    private NluEnrichmentFeatures features;
    private String language;
    private String model;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public EnrichmentOptions() { }

    /**
     * Gets the features.
     *
     * Object containing Natural Language Understanding features to be used.
     *
     * @return the features
     */
    @AuraEnabled
    public NluEnrichmentFeatures getFeatures() {
      return features;
    }

    /**
     * Gets the language.
     *
     * ISO 639-1 code indicating the language to use for the analysis. This code overrides the automatic language
     * detection performed by the service. Valid codes are `ar` (Arabic), `en` (English), `fr` (French), `de` (German),
     * `it` (Italian), `pt` (Portuguese), `ru` (Russian), `es` (Spanish), and `sv` (Swedish). **Note:** Not all features
     * support all languages, automatic detection is recommended.
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the model.
     *
     * *For use with `elements` enrichments only.* The element extraction model to use. Models available are:
     * `contract`.
     *
     * @return the model
     */
    @AuraEnabled
    public String getModel() {
      return model;
    }
  
    private EnrichmentOptions(EnrichmentOptionsBuilder builder) {
      this.features = builder.features;
      this.language = builder.language;
      this.model = builder.model;
    }

    /**
     * New builder.
     *
     * @return a EnrichmentOptions builder
     */
    public EnrichmentOptionsBuilder newBuilder() {
      return new EnrichmentOptionsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      EnrichmentOptions ret = (EnrichmentOptions) super.deserialize(jsonString, jsonMap, classType);
      EnrichmentOptionsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for features
      Map<String, Object> featuresMap = (Map<String, Object>) jsonMap.get('features');
      NluEnrichmentFeatures newFeatures = (NluEnrichmentFeatures) new NluEnrichmentFeatures().deserialize(JSON.serialize(featuresMap, true), featuresMap, NluEnrichmentFeatures.class);
      retBuilder.features(newFeatures);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for features
      if (features != null) {
        String featuresJsonString = JSON.serialize(features.replacePropertyNames(), true);
        jsonMap.put('features', JSON.deserializeUntyped(featuresJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * EnrichmentOptions Builder.
   */
  public class EnrichmentOptionsBuilder {
    private NluEnrichmentFeatures features;
    private String language;
    private String model;

    private EnrichmentOptionsBuilder(EnrichmentOptions enrichmentOptions) {
      this.features = enrichmentOptions.features;
      this.language = enrichmentOptions.language;
      this.model = enrichmentOptions.model;
    }

    /**
     * Instantiates a new builder.
     */
    public EnrichmentOptionsBuilder() {
    }

    /**
     * Builds a EnrichmentOptions.
     *
     * @return the enrichmentOptions
     */
    public EnrichmentOptions build() {
      return new EnrichmentOptions(this);
    }

    /**
     * Set the features.
     *
     * @param features the features
     * @return the EnrichmentOptions builder
     */
    public EnrichmentOptionsBuilder features(NluEnrichmentFeatures features) {
      this.features = features;
      return this;
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the EnrichmentOptions builder
     */
    public EnrichmentOptionsBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the EnrichmentOptions builder
     */
    public EnrichmentOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }
  }

  /**
   * Details about an environment.
   */
  public class Environment extends IBMWatsonResponseModel {
    private String environmentId;
    private String name;
    private String description;
    private Datetime created;
    private Datetime updated;
    private String status;
    private Boolean readOnly;
    private String size;
    private String requestedSize;
    private IndexCapacity indexCapacity;
    private SearchStatus searchStatus;

    /**
     * Gets the environmentId.
     *
     * Unique identifier for the environment.
     *
     * @return the environmentId
     */
    @AuraEnabled
    public String getEnvironmentId() {
      return environmentId;
    }

    /**
     * Gets the name.
     *
     * Name that identifies the environment.
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
     * Description of the environment.
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
     * Creation date of the environment, in the format `yyyy-MM-dd'T'HH:mm:ss.SSS'Z'`.
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
     * Date of most recent environment update, in the format `yyyy-MM-dd'T'HH:mm:ss.SSS'Z'`.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the status.
     *
     * Current status of the environment. `resizing` is displayed when a request to increase the environment size has
     * been made, but is still in the process of being completed.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the readOnly.
     *
     * If `true`, the environment contains read-only collections that are maintained by IBM.
     *
     * @return the readOnly
     */
    @AuraEnabled
    public Boolean getReadOnly() {
      return readOnly;
    }

    /**
     * Gets the size.
     *
     * Current size of the environment.
     *
     * @return the size
     */
    @AuraEnabled
    public String getSize() {
      return size;
    }

    /**
     * Gets the requestedSize.
     *
     * The new size requested for this environment. Only returned when the environment *status* is `resizing`.
     *
     * *Note:* Querying and indexing can still be performed during an environment upsize.
     *
     * @return the requestedSize
     */
    @AuraEnabled
    public String getRequestedSize() {
      return requestedSize;
    }

    /**
     * Gets the indexCapacity.
     *
     * Details about the resource usage and capacity of the environment.
     *
     * @return the indexCapacity
     */
    @AuraEnabled
    public IndexCapacity getIndexCapacity() {
      return indexCapacity;
    }

    /**
     * Gets the searchStatus.
     *
     * Information about the Continuous Relevancy Training for this environment.
     *
     * @return the searchStatus
     */
    @AuraEnabled
    public SearchStatus getSearchStatus() {
      return searchStatus;
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
     * Sets the size.
     *
     * @param size the new size
     */
    public void setSize(final String size) {
      this.size = size;
    }

    /**
     * Sets the requestedSize.
     *
     * @param requestedSize the new requestedSize
     */
    public void setRequestedSize(final String requestedSize) {
      this.requestedSize = requestedSize;
    }

    /**
     * Sets the indexCapacity.
     *
     * @param indexCapacity the new indexCapacity
     */
    public void setIndexCapacity(final IndexCapacity indexCapacity) {
      this.indexCapacity = indexCapacity;
    }

    /**
     * Sets the searchStatus.
     *
     * @param searchStatus the new searchStatus
     */
    public void setSearchStatus(final SearchStatus searchStatus) {
      this.searchStatus = searchStatus;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'environment_id' => 'environmentId',
        'read_only' => 'readOnly',
        'requested_size' => 'requestedSize',
        'index_capacity' => 'indexCapacity',
        'search_status' => 'searchStatus'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String created = (String) jsonMap.remove('created');
      String updated = (String) jsonMap.remove('updated');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      Environment ret = (Environment) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(created)) {
        ret.created = (Datetime) JSON.deserialize('"' + created + '"', Datetime.class);
      }
      if (String.isNotBlank(updated)) {
        ret.updated = (Datetime) JSON.deserialize('"' + updated + '"', Datetime.class);
      }

      // calling custom deserializer for indexCapacity
      Map<String, Object> indexCapacityMap = (Map<String, Object>) jsonMap.get('indexCapacity');
      IndexCapacity newIndexCapacity = (IndexCapacity) new IndexCapacity().deserialize(JSON.serialize(indexCapacityMap, true), indexCapacityMap, IndexCapacity.class);
      ret.setIndexCapacity(newIndexCapacity);

      // calling custom deserializer for searchStatus
      Map<String, Object> searchStatusMap = (Map<String, Object>) jsonMap.get('searchStatus');
      SearchStatus newSearchStatus = (SearchStatus) new SearchStatus().deserialize(JSON.serialize(searchStatusMap, true), searchStatusMap, SearchStatus.class);
      ret.setSearchStatus(newSearchStatus);

      return ret;
    }
  }

  /**
   * Summary of the document usage statistics for the environment.
   */
  public class EnvironmentDocuments extends IBMWatsonGenericModel {
    private Long indexed;
    private Long maximumAllowed;

    /**
     * Gets the indexed.
     *
     * Number of documents indexed for the environment.
     *
     * @return the indexed
     */
    @AuraEnabled
    public Long getIndexed() {
      return indexed;
    }

    /**
     * Gets the maximumAllowed.
     *
     * Total number of documents allowed in the environment's capacity.
     *
     * @return the maximumAllowed
     */
    @AuraEnabled
    public Long getMaximumAllowed() {
      return maximumAllowed;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'maximum_allowed' => 'maximumAllowed'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      EnvironmentDocuments ret = (EnvironmentDocuments) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Query event data object.
   */
  public class EventData extends IBMWatsonGenericModel {
    private String environmentId;
    private String sessionToken;
    private Datetime clientTimestamp;
    private Long displayRank;
    private String collectionId;
    private String documentId;
    private String queryId;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public EventData() { }

    /**
     * Gets the environmentId.
     *
     * The **environment_id** associated with the query that the event is associated with.
     *
     * @return the environmentId
     */
    @AuraEnabled
    public String getEnvironmentId() {
      return environmentId;
    }

    /**
     * Gets the sessionToken.
     *
     * The session token that was returned as part of the query results that this event is associated with.
     *
     * @return the sessionToken
     */
    @AuraEnabled
    public String getSessionToken() {
      return sessionToken;
    }

    /**
     * Gets the clientTimestamp.
     *
     * The optional timestamp for the event that was created. If not provided, the time that the event was created in
     * the log was used.
     *
     * @return the clientTimestamp
     */
    @AuraEnabled
    public Datetime getClientTimestamp() {
      return clientTimestamp;
    }

    /**
     * Gets the displayRank.
     *
     * The rank of the result item which the event is associated with.
     *
     * @return the displayRank
     */
    @AuraEnabled
    public Long getDisplayRank() {
      return displayRank;
    }

    /**
     * Gets the collectionId.
     *
     * The **collection_id** of the document that this event is associated with.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the documentId.
     *
     * The **document_id** of the document that this event is associated with.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the queryId.
     *
     * The query identifier stored in the log. The query and any events associated with that query are stored with the
     * same **query_id**.
     *
     * @return the queryId
     */
    @AuraEnabled
    public String getQueryId() {
      return queryId;
    }
  
    private EventData(EventDataBuilder builder) {
      IBMWatsonValidator.notNull(builder.environmentId, 'environmentId cannot be null');
      IBMWatsonValidator.notNull(builder.sessionToken, 'sessionToken cannot be null');
      IBMWatsonValidator.notNull(builder.collectionId, 'collectionId cannot be null');
      IBMWatsonValidator.notNull(builder.documentId, 'documentId cannot be null');
      this.environmentId = builder.environmentId;
      this.sessionToken = builder.sessionToken;
      this.clientTimestamp = builder.clientTimestamp;
      this.displayRank = builder.displayRank;
      this.collectionId = builder.collectionId;
      this.documentId = builder.documentId;
      this.queryId = builder.queryId;
    }

    /**
     * New builder.
     *
     * @return a EventData builder
     */
    public EventDataBuilder newBuilder() {
      return new EventDataBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'environment_id' => 'environmentId',
        'session_token' => 'sessionToken',
        'client_timestamp' => 'clientTimestamp',
        'display_rank' => 'displayRank',
        'collection_id' => 'collectionId',
        'document_id' => 'documentId',
        'query_id' => 'queryId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

       String clientTimestamp = (String) jsonMap.remove('clientTimestamp');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      EventData ret = (EventData) super.deserialize(jsonStringWithoutDates, jsonMap, classType);
      EventDataBuilder retBuilder = ret.newBuilder();

      if (String.isNotBlank(clientTimestamp)) {
        retBuilder.clientTimestamp((Datetime) JSON.deserialize('"' + clientTimestamp + '"', Datetime.class));
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
        'environmentId' => 'environment_id',
        'sessionToken' => 'session_token',
        'clientTimestamp' => 'client_timestamp',
        'displayRank' => 'display_rank',
        'collectionId' => 'collection_id',
        'documentId' => 'document_id',
        'queryId' => 'query_id'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * EventData Builder.
   */
  public class EventDataBuilder {
    private String environmentId;
    private String sessionToken;
    private Datetime clientTimestamp;
    private Long displayRank;
    private String collectionId;
    private String documentId;
    private String queryId;

    private EventDataBuilder(EventData eventData) {
      this.environmentId = eventData.environmentId;
      this.sessionToken = eventData.sessionToken;
      this.clientTimestamp = eventData.clientTimestamp;
      this.displayRank = eventData.displayRank;
      this.collectionId = eventData.collectionId;
      this.documentId = eventData.documentId;
      this.queryId = eventData.queryId;
    }

    /**
     * Instantiates a new builder.
     */
    public EventDataBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param sessionToken the sessionToken
     * @param collectionId the collectionId
     * @param documentId the documentId
     */
    public EventDataBuilder(String environmentId, String sessionToken, String collectionId, String documentId) {
      this.environmentId = environmentId;
      this.sessionToken = sessionToken;
      this.collectionId = collectionId;
      this.documentId = documentId;
    }

    /**
     * Builds a EventData.
     *
     * @return the eventData
     */
    public EventData build() {
      return new EventData(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the EventData builder
     */
    public EventDataBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the sessionToken.
     *
     * @param sessionToken the sessionToken
     * @return the EventData builder
     */
    public EventDataBuilder sessionToken(String sessionToken) {
      this.sessionToken = sessionToken;
      return this;
    }

    /**
     * Set the clientTimestamp.
     *
     * @param clientTimestamp the clientTimestamp
     * @return the EventData builder
     */
    public EventDataBuilder clientTimestamp(Datetime clientTimestamp) {
      this.clientTimestamp = clientTimestamp;
      return this;
    }

    /**
     * Set the displayRank.
     *
     * @param displayRank the displayRank
     * @return the EventData builder
     */
    public EventDataBuilder displayRank(Long displayRank) {
      this.displayRank = displayRank;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the EventData builder
     */
    public EventDataBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the EventData builder
     */
    public EventDataBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the EventData builder
     */
    public EventDataBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }
  }

  /**
   * An expansion definition. Each object respresents one set of expandable strings. For example, you could have
   * expansions for the word `hot` in one object, and expansions for the word `cold` in another.
   */
  public class Expansion extends IBMWatsonGenericModel {
    private List<String> inputTerms;
    private List<String> expandedTerms;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Expansion() { }

    /**
     * Gets the inputTerms.
     *
     * A list of terms that will be expanded for this expansion. If specified, only the items in this list are expanded.
     *
     * @return the inputTerms
     */
    @AuraEnabled
    public List<String> getInputTerms() {
      return inputTerms;
    }

    /**
     * Gets the expandedTerms.
     *
     * A list of terms that this expansion will be expanded to. If specified without **input_terms**, it also functions
     * as the input term list.
     *
     * @return the expandedTerms
     */
    @AuraEnabled
    public List<String> getExpandedTerms() {
      return expandedTerms;
    }
  
    private Expansion(ExpansionBuilder builder) {
      IBMWatsonValidator.notNull(builder.expandedTerms, 'expandedTerms cannot be null');
      this.inputTerms = builder.inputTerms;
      this.expandedTerms = builder.expandedTerms;
    }

    /**
     * New builder.
     *
     * @return a Expansion builder
     */
    public ExpansionBuilder newBuilder() {
      return new ExpansionBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'input_terms' => 'inputTerms',
        'expanded_terms' => 'expandedTerms'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Expansion ret = (Expansion) super.deserialize(jsonString, jsonMap, classType);
      ExpansionBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'inputTerms' => 'input_terms',
        'expandedTerms' => 'expanded_terms'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * Expansion Builder.
   */
  public class ExpansionBuilder {
    private List<String> inputTerms;
    private List<String> expandedTerms;

    private ExpansionBuilder(Expansion expansion) {
      this.inputTerms = expansion.inputTerms;
      this.expandedTerms = expansion.expandedTerms;
    }

    /**
     * Instantiates a new builder.
     */
    public ExpansionBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param expandedTerms the expandedTerms
     */
    public ExpansionBuilder(List<String> expandedTerms) {
      this.expandedTerms = expandedTerms;
    }

    /**
     * Builds a Expansion.
     *
     * @return the expansion
     */
    public Expansion build() {
      return new Expansion(this);
    }

    /**
     * Adds an inputTerms to inputTerms.
     *
     * @param inputTerms the new inputTerms
     * @return the Expansion builder
     */
    public ExpansionBuilder addInputTerms(String inputTerms) {
      IBMWatsonValidator.notNull(inputTerms, 'inputTerms cannot be null');
      if (this.inputTerms == null) {
        this.inputTerms = new List<String>();
      }
      this.inputTerms.add(inputTerms);
      return this;
    }

    /**
     * Adds an expandedTerms to expandedTerms.
     *
     * @param expandedTerms the new expandedTerms
     * @return the Expansion builder
     */
    public ExpansionBuilder addExpandedTerms(String expandedTerms) {
      IBMWatsonValidator.notNull(expandedTerms, 'expandedTerms cannot be null');
      if (this.expandedTerms == null) {
        this.expandedTerms = new List<String>();
      }
      this.expandedTerms.add(expandedTerms);
      return this;
    }

    /**
     * Set the inputTerms.
     * Existing inputTerms will be replaced.
     *
     * @param inputTerms the inputTerms
     * @return the Expansion builder
     */
    public ExpansionBuilder inputTerms(List<String> inputTerms) {
      this.inputTerms = inputTerms;
      return this;
    }

    /**
     * Set the expandedTerms.
     * Existing expandedTerms will be replaced.
     *
     * @param expandedTerms the expandedTerms
     * @return the Expansion builder
     */
    public ExpansionBuilder expandedTerms(List<String> expandedTerms) {
      this.expandedTerms = expandedTerms;
      return this;
    }
  }

  /**
   * The query expansion definitions for the specified collection.
   */
  public class Expansions extends IBMWatsonResponseModel {
    private List<Expansion> expansions;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Expansions() { }

    /**
     * Gets the expansions.
     *
     * An array of query expansion definitions.
     *
     *  Each object in the **expansions** array represents a term or set of terms that will be expanded into other
     * terms. Each expansion object can be configured as bidirectional or unidirectional. Bidirectional means that all
     * terms are expanded to all other terms in the object. Unidirectional means that a set list of terms can be
     * expanded into a second list of terms.
     *
     *  To create a bi-directional expansion specify an **expanded_terms** array. When found in a query, all items in
     * the **expanded_terms** array are then expanded to the other items in the same array.
     *
     *  To create a uni-directional expansion, specify both an array of **input_terms** and an array of
     * **expanded_terms**. When items in the **input_terms** array are present in a query, they are expanded using the
     * items listed in the **expanded_terms** array.
     *
     * @return the expansions
     */
    @AuraEnabled
    public List<Expansion> getExpansions() {
      return expansions;
    }
  
    private Expansions(ExpansionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.expansions, 'expansions cannot be null');
      this.expansions = builder.expansions;
    }

    /**
     * New builder.
     *
     * @return a Expansions builder
     */
    public ExpansionsBuilder newBuilder() {
      return new ExpansionsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Expansions ret = (Expansions) super.deserialize(jsonString, jsonMap, classType);
      ExpansionsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for expansions
      List<Expansion> newExpansions = new List<Expansion>();
      List<Expansion> deserializedExpansions = ret.getExpansions();
      if (deserializedExpansions != null) {
        for (Integer i = 0; i < deserializedExpansions.size(); i++) {
          Expansion currentItem = ret.getExpansions().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('expansions');
          Expansion newItem = (Expansion) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Expansion.class);
          newExpansions.add(newItem);
        }
        retBuilder.expansions(newExpansions);
      }

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for expansions
      if (expansions != null) {
        List<Object> expansionsJsonList = new List<Object>();
        for (Expansion listItem : expansions) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          expansionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('expansions', expansionsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * Expansions Builder.
   */
  public class ExpansionsBuilder {
    private List<Expansion> expansions;

    private ExpansionsBuilder(Expansions expansions) {
      this.expansions = expansions.expansions;
    }

    /**
     * Instantiates a new builder.
     */
    public ExpansionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param expansions the expansions
     */
    public ExpansionsBuilder(List<Expansion> expansions) {
      this.expansions = expansions;
    }

    /**
     * Builds a Expansions.
     *
     * @return the expansions
     */
    public Expansions build() {
      return new Expansions(this);
    }

    /**
     * Adds an expansions to expansions.
     *
     * @param expansions the new expansions
     * @return the Expansions builder
     */
    public ExpansionsBuilder addExpansions(Expansion expansions) {
      IBMWatsonValidator.notNull(expansions, 'expansions cannot be null');
      if (this.expansions == null) {
        this.expansions = new List<Expansion>();
      }
      this.expansions.add(expansions);
      return this;
    }

    /**
     * Set the expansions.
     * Existing expansions will be replaced.
     *
     * @param expansions the expansions
     * @return the Expansions builder
     */
    public ExpansionsBuilder expansions(List<Expansion> expansions) {
      this.expansions = expansions;
      return this;
    }
  }

  /**
   * The federatedQueryNotices options.
   */
  public class FederatedQueryNoticesOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private List<String> collectionIds;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private String aggregation;
    private Long count;
    private List<String> xReturn;
    private Long offset;
    private List<String> xSort;
    private Boolean highlight;
    private String deduplicateField;
    private Boolean similar;
    private List<String> similarDocumentIds;
    private List<String> similarFields;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Number of results to return. The maximum for the **count** and **offset** values together in any one query is
     * **10000**.
     *
     * @return the count
     */
    public Long count() {
      return count;
    }

    /**
     * Gets the xReturn.
     *
     * A comma-separated list of the portion of the document hierarchy to return.
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
     * returned is 10 and the offset is 8, it returns the last two results. The maximum for the **count** and **offset**
     * values together in any one query is **10000**.
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
     * prefix is specified.
     *
     * @return the xSort
     */
    public List<String> xSort() {
      return xSort;
    }

    /**
     * Gets the highlight.
     *
     * When true, a highlight field is returned for each result which contains the fields which match the query with
     * `<em></em>` tags around the matching query terms.
     *
     * @return the highlight
     */
    public Boolean highlight() {
      return highlight;
    }

    /**
     * Gets the deduplicateField.
     *
     * When specified, duplicate results based on the field specified are removed from the returned results. Duplicate
     * comparison is limited to the current query only, **offset** is not considered. This parameter is currently Beta
     * functionality.
     *
     * @return the deduplicateField
     */
    public String deduplicateField() {
      return deduplicateField;
    }

    /**
     * Gets the similar.
     *
     * When `true`, results are returned based on their similarity to the document IDs specified in the
     * **similar.document_ids** parameter.
     *
     * @return the similar
     */
    public Boolean similar() {
      return similar;
    }

    /**
     * Gets the similarDocumentIds.
     *
     * A comma-separated list of document IDs to find similar documents.
     *
     * **Tip:** Include the **natural_language_query** parameter to expand the scope of the document similarity search
     * with the natural language query. Other query parameters, such as **filter** and **query**, are subsequently
     * applied and reduce the scope.
     *
     * @return the similarDocumentIds
     */
    public List<String> similarDocumentIds() {
      return similarDocumentIds;
    }

    /**
     * Gets the similarFields.
     *
     * A comma-separated list of field names that are used as a basis for comparison to identify similar documents. If
     * not specified, the entire document is used for comparison.
     *
     * @return the similarFields
     */
    public List<String> similarFields() {
      return similarFields;
    }

    private FederatedQueryNoticesOptions(FederatedQueryNoticesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notNull(builder.collectionIds, 'collectionIds cannot be null');
      environmentId = builder.environmentId;
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
      deduplicateField = builder.deduplicateField;
      similar = builder.similar;
      similarDocumentIds = builder.similarDocumentIds;
      similarFields = builder.similarFields;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder newBuilder() {
      return new FederatedQueryNoticesOptionsBuilder(this);
    }
  }

  /**
   * FederatedQueryNoticesOptions Builder.
   */
  public class FederatedQueryNoticesOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private List<String> collectionIds;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private String aggregation;
    private Long count;
    private List<String> xReturn;
    private Long offset;
    private List<String> xSort;
    private Boolean highlight;
    private String deduplicateField;
    private Boolean similar;
    private List<String> similarDocumentIds;
    private List<String> similarFields;

    private FederatedQueryNoticesOptionsBuilder(FederatedQueryNoticesOptions federatedQueryNoticesOptions) {
      environmentId = federatedQueryNoticesOptions.environmentId;
      collectionIds = federatedQueryNoticesOptions.collectionIds;
      filter = federatedQueryNoticesOptions.filter;
      query = federatedQueryNoticesOptions.query;
      naturalLanguageQuery = federatedQueryNoticesOptions.naturalLanguageQuery;
      aggregation = federatedQueryNoticesOptions.aggregation;
      count = federatedQueryNoticesOptions.count;
      xReturn = federatedQueryNoticesOptions.xReturn;
      offset = federatedQueryNoticesOptions.offset;
      xSort = federatedQueryNoticesOptions.xSort;
      highlight = federatedQueryNoticesOptions.highlight;
      deduplicateField = federatedQueryNoticesOptions.deduplicateField;
      similar = federatedQueryNoticesOptions.similar;
      similarDocumentIds = federatedQueryNoticesOptions.similarDocumentIds;
      similarFields = federatedQueryNoticesOptions.similarFields;
      this.requestHeaders.putAll(federatedQueryNoticesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public FederatedQueryNoticesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionIds the collectionIds
     */
    public FederatedQueryNoticesOptionsBuilder(String environmentId, List<String> collectionIds) {
      this.environmentId = environmentId;
      this.collectionIds = collectionIds;
    }

    /**
     * Builds a FederatedQueryNoticesOptions.
     *
     * @return the federatedQueryNoticesOptions
     */
    public FederatedQueryNoticesOptions build() {
      return new FederatedQueryNoticesOptions(this);
    }

    /**
     * Adds an collectionIds to collectionIds.
     *
     * @param collectionIds the new collectionIds
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder addCollectionIds(String collectionIds) {
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
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder addXReturn(String xReturn) {
      IBMWatsonValidator.notNull(xReturn, 'xReturn cannot be null');
      if (this.xReturn == null) {
        this.xReturn = new List<String>();
      }
      this.xReturn.add(xReturn);
      return this;
    }

    /**
     * Adds an xSort to xSort.
     *
     * @param xSort the new xSort
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder addXSort(String xSort) {
      IBMWatsonValidator.notNull(xSort, 'xSort cannot be null');
      if (this.xSort == null) {
        this.xSort = new List<String>();
      }
      this.xSort.add(xSort);
      return this;
    }

    /**
     * Adds an similarDocumentIds to similarDocumentIds.
     *
     * @param similarDocumentIds the new similarDocumentIds
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder addSimilarDocumentIds(String similarDocumentIds) {
      IBMWatsonValidator.notNull(similarDocumentIds, 'similarDocumentIds cannot be null');
      if (this.similarDocumentIds == null) {
        this.similarDocumentIds = new List<String>();
      }
      this.similarDocumentIds.add(similarDocumentIds);
      return this;
    }

    /**
     * Adds an similarFields to similarFields.
     *
     * @param similarFields the new similarFields
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder addSimilarFields(String similarFields) {
      IBMWatsonValidator.notNull(similarFields, 'similarFields cannot be null');
      if (this.similarFields == null) {
        this.similarFields = new List<String>();
      }
      this.similarFields.add(similarFields);
      return this;
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionIds.
     * Existing collectionIds will be replaced.
     *
     * @param collectionIds the collectionIds
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder collectionIds(List<String> collectionIds) {
      this.collectionIds = collectionIds;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the query.
     *
     * @param query the query
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder query(String query) {
      this.query = query;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the aggregation.
     *
     * @param aggregation the aggregation
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder aggregation(String aggregation) {
      this.aggregation = aggregation;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Set the xReturn.
     * Existing xReturn will be replaced.
     *
     * @param xReturn the xReturn
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder xReturn(List<String> xReturn) {
      this.xReturn = xReturn;
      return this;
    }

    /**
     * Set the offset.
     *
     * @param offset the offset
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder offset(Long offset) {
      this.offset = offset;
      return this;
    }

    /**
     * Set the xSort.
     * Existing xSort will be replaced.
     *
     * @param xSort the xSort
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder xSort(List<String> xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the highlight.
     *
     * @param highlight the highlight
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder highlight(Boolean highlight) {
      this.highlight = highlight;
      return this;
    }

    /**
     * Set the deduplicateField.
     *
     * @param deduplicateField the deduplicateField
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder deduplicateField(String deduplicateField) {
      this.deduplicateField = deduplicateField;
      return this;
    }

    /**
     * Set the similar.
     *
     * @param similar the similar
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder similar(Boolean similar) {
      this.similar = similar;
      return this;
    }

    /**
     * Set the similarDocumentIds.
     * Existing similarDocumentIds will be replaced.
     *
     * @param similarDocumentIds the similarDocumentIds
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder similarDocumentIds(List<String> similarDocumentIds) {
      this.similarDocumentIds = similarDocumentIds;
      return this;
    }

    /**
     * Set the similarFields.
     * Existing similarFields will be replaced.
     *
     * @param similarFields the similarFields
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder similarFields(List<String> similarFields) {
      this.similarFields = similarFields;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the FederatedQueryNoticesOptions builder
     */
    public FederatedQueryNoticesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The federatedQuery options.
   */
  public class FederatedQueryOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionIds;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Boolean passages;
    private String aggregation;
    private Long count;
    private String xReturn;
    private Long offset;
    private String xSort;
    private Boolean highlight;
    private String passagesFields;
    private Long passagesCount;
    private Long passagesCharacters;
    private Boolean deduplicate;
    private String deduplicateField;
    private Boolean similar;
    private String similarDocumentIds;
    private String similarFields;
    private String bias;
    private Boolean xWatsonLoggingOptOut;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the collectionIds.
     *
     * A comma-separated list of collection IDs to be queried against.
     *
     * @return the collectionIds
     */
    public String collectionIds() {
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
     * Gets the passages.
     *
     * A passages query that returns the most relevant passages from the results.
     *
     * @return the passages
     */
    public Boolean passages() {
      return passages;
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
     * A comma-separated list of the portion of the document hierarchy to return.
     *
     * @return the xReturn
     */
    public String xReturn() {
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
     * When true, a highlight field is returned for each result which contains the fields which match the query with
     * `<em></em>` tags around the matching query terms.
     *
     * @return the highlight
     */
    public Boolean highlight() {
      return highlight;
    }

    /**
     * Gets the passagesFields.
     *
     * A comma-separated list of fields that passages are drawn from. If this parameter not specified, then all
     * top-level fields are included.
     *
     * @return the passagesFields
     */
    public String passagesFields() {
      return passagesFields;
    }

    /**
     * Gets the passagesCount.
     *
     * The maximum number of passages to return. The search returns fewer passages if the requested total is not found.
     * The default is `10`. The maximum is `100`.
     *
     * @return the passagesCount
     */
    public Long passagesCount() {
      return passagesCount;
    }

    /**
     * Gets the passagesCharacters.
     *
     * The approximate number of characters that any one passage will have.
     *
     * @return the passagesCharacters
     */
    public Long passagesCharacters() {
      return passagesCharacters;
    }

    /**
     * Gets the deduplicate.
     *
     * When `true`, and used with a Watson Discovery News collection, duplicate results (based on the contents of the
     * **title** field) are removed. Duplicate comparison is limited to the current query only; **offset** is not
     * considered. This parameter is currently Beta functionality.
     *
     * @return the deduplicate
     */
    public Boolean deduplicate() {
      return deduplicate;
    }

    /**
     * Gets the deduplicateField.
     *
     * When specified, duplicate results based on the field specified are removed from the returned results. Duplicate
     * comparison is limited to the current query only, **offset** is not considered. This parameter is currently Beta
     * functionality.
     *
     * @return the deduplicateField
     */
    public String deduplicateField() {
      return deduplicateField;
    }

    /**
     * Gets the similar.
     *
     * When `true`, results are returned based on their similarity to the document IDs specified in the
     * **similar.document_ids** parameter.
     *
     * @return the similar
     */
    public Boolean similar() {
      return similar;
    }

    /**
     * Gets the similarDocumentIds.
     *
     * A comma-separated list of document IDs to find similar documents.
     *
     * **Tip:** Include the **natural_language_query** parameter to expand the scope of the document similarity search
     * with the natural language query. Other query parameters, such as **filter** and **query**, are subsequently
     * applied and reduce the scope.
     *
     * @return the similarDocumentIds
     */
    public String similarDocumentIds() {
      return similarDocumentIds;
    }

    /**
     * Gets the similarFields.
     *
     * A comma-separated list of field names that are used as a basis for comparison to identify similar documents. If
     * not specified, the entire document is used for comparison.
     *
     * @return the similarFields
     */
    public String similarFields() {
      return similarFields;
    }

    /**
     * Gets the bias.
     *
     * Field which the returned results will be biased against. The specified field must be either a **date** or
     * **number** format. When a **date** type field is specified returned results are biased towards field values
     * closer to the current date. When a **number** type field is specified, returned results are biased towards higher
     * field values. This parameter cannot be used in the same query as the **sort** parameter.
     *
     * @return the bias
     */
    public String bias() {
      return bias;
    }

    /**
     * Gets the xWatsonLoggingOptOut.
     *
     * If `true`, queries are not stored in the Discovery **Logs** endpoint.
     *
     * @return the xWatsonLoggingOptOut
     */
    public Boolean xWatsonLoggingOptOut() {
      return xWatsonLoggingOptOut;
    }

    private FederatedQueryOptions(FederatedQueryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notNull(builder.collectionIds, 'collectionIds cannot be null');
      environmentId = builder.environmentId;
      collectionIds = builder.collectionIds;
      filter = builder.filter;
      query = builder.query;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      passages = builder.passages;
      aggregation = builder.aggregation;
      count = builder.count;
      xReturn = builder.xReturn;
      offset = builder.offset;
      xSort = builder.xSort;
      highlight = builder.highlight;
      passagesFields = builder.passagesFields;
      passagesCount = builder.passagesCount;
      passagesCharacters = builder.passagesCharacters;
      deduplicate = builder.deduplicate;
      deduplicateField = builder.deduplicateField;
      similar = builder.similar;
      similarDocumentIds = builder.similarDocumentIds;
      similarFields = builder.similarFields;
      bias = builder.bias;
      xWatsonLoggingOptOut = builder.xWatsonLoggingOptOut;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder newBuilder() {
      return new FederatedQueryOptionsBuilder(this);
    }
  }

  /**
   * FederatedQueryOptions Builder.
   */
  public class FederatedQueryOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionIds;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Boolean passages;
    private String aggregation;
    private Long count;
    private String xReturn;
    private Long offset;
    private String xSort;
    private Boolean highlight;
    private String passagesFields;
    private Long passagesCount;
    private Long passagesCharacters;
    private Boolean deduplicate;
    private String deduplicateField;
    private Boolean similar;
    private String similarDocumentIds;
    private String similarFields;
    private String bias;
    private Boolean xWatsonLoggingOptOut;

    private FederatedQueryOptionsBuilder(FederatedQueryOptions federatedQueryOptions) {
      environmentId = federatedQueryOptions.environmentId;
      collectionIds = federatedQueryOptions.collectionIds;
      filter = federatedQueryOptions.filter;
      query = federatedQueryOptions.query;
      naturalLanguageQuery = federatedQueryOptions.naturalLanguageQuery;
      passages = federatedQueryOptions.passages;
      aggregation = federatedQueryOptions.aggregation;
      count = federatedQueryOptions.count;
      xReturn = federatedQueryOptions.xReturn;
      offset = federatedQueryOptions.offset;
      xSort = federatedQueryOptions.xSort;
      highlight = federatedQueryOptions.highlight;
      passagesFields = federatedQueryOptions.passagesFields;
      passagesCount = federatedQueryOptions.passagesCount;
      passagesCharacters = federatedQueryOptions.passagesCharacters;
      deduplicate = federatedQueryOptions.deduplicate;
      deduplicateField = federatedQueryOptions.deduplicateField;
      similar = federatedQueryOptions.similar;
      similarDocumentIds = federatedQueryOptions.similarDocumentIds;
      similarFields = federatedQueryOptions.similarFields;
      bias = federatedQueryOptions.bias;
      xWatsonLoggingOptOut = federatedQueryOptions.xWatsonLoggingOptOut;
      this.requestHeaders.putAll(federatedQueryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public FederatedQueryOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionIds the collectionIds
     */
    public FederatedQueryOptionsBuilder(String environmentId, String collectionIds) {
      this.environmentId = environmentId;
      this.collectionIds = collectionIds;
    }

    /**
     * Builds a FederatedQueryOptions.
     *
     * @return the federatedQueryOptions
     */
    public FederatedQueryOptions build() {
      return new FederatedQueryOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionIds.
     *
     * @param collectionIds the collectionIds
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder collectionIds(String collectionIds) {
      this.collectionIds = collectionIds;
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the query.
     *
     * @param query the query
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder query(String query) {
      this.query = query;
      return this;
    }

    /**
     * Set the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the naturalLanguageQuery
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder naturalLanguageQuery(String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
      return this;
    }

    /**
     * Set the passages.
     *
     * @param passages the passages
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder passages(Boolean passages) {
      this.passages = passages;
      return this;
    }

    /**
     * Set the aggregation.
     *
     * @param aggregation the aggregation
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder aggregation(String aggregation) {
      this.aggregation = aggregation;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Set the xReturn.
     *
     * @param xReturn the xReturn
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder xReturn(String xReturn) {
      this.xReturn = xReturn;
      return this;
    }

    /**
     * Set the offset.
     *
     * @param offset the offset
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder offset(Long offset) {
      this.offset = offset;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the highlight.
     *
     * @param highlight the highlight
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder highlight(Boolean highlight) {
      this.highlight = highlight;
      return this;
    }

    /**
     * Set the passagesFields.
     *
     * @param passagesFields the passagesFields
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder passagesFields(String passagesFields) {
      this.passagesFields = passagesFields;
      return this;
    }

    /**
     * Set the passagesCount.
     *
     * @param passagesCount the passagesCount
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder passagesCount(Long passagesCount) {
      this.passagesCount = passagesCount;
      return this;
    }

    /**
     * Set the passagesCharacters.
     *
     * @param passagesCharacters the passagesCharacters
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder passagesCharacters(Long passagesCharacters) {
      this.passagesCharacters = passagesCharacters;
      return this;
    }

    /**
     * Set the deduplicate.
     *
     * @param deduplicate the deduplicate
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder deduplicate(Boolean deduplicate) {
      this.deduplicate = deduplicate;
      return this;
    }

    /**
     * Set the deduplicateField.
     *
     * @param deduplicateField the deduplicateField
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder deduplicateField(String deduplicateField) {
      this.deduplicateField = deduplicateField;
      return this;
    }

    /**
     * Set the similar.
     *
     * @param similar the similar
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder similar(Boolean similar) {
      this.similar = similar;
      return this;
    }

    /**
     * Set the similarDocumentIds.
     *
     * @param similarDocumentIds the similarDocumentIds
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder similarDocumentIds(String similarDocumentIds) {
      this.similarDocumentIds = similarDocumentIds;
      return this;
    }

    /**
     * Set the similarFields.
     *
     * @param similarFields the similarFields
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder similarFields(String similarFields) {
      this.similarFields = similarFields;
      return this;
    }

    /**
     * Set the bias.
     *
     * @param bias the bias
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder bias(String bias) {
      this.bias = bias;
      return this;
    }

    /**
     * Set the xWatsonLoggingOptOut.
     *
     * @param xWatsonLoggingOptOut the xWatsonLoggingOptOut
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder xWatsonLoggingOptOut(Boolean xWatsonLoggingOptOut) {
      this.xWatsonLoggingOptOut = xWatsonLoggingOptOut;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the FederatedQueryOptions builder
     */
    public FederatedQueryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Object containing field details.
   */
  public class Field extends IBMWatsonGenericModel {
    private String field;
    private String xType;

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

      Field ret = (Field) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Font matching configuration.
   */
  public class FontSetting extends IBMWatsonGenericModel {
    private Long level;
    private Long minSize;
    private Long maxSize;
    private Boolean bold;
    private Boolean italic;
    private String name;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public FontSetting() { }

    /**
     * Gets the level.
     *
     * The HTML heading level that any content with the matching font is converted to.
     *
     * @return the level
     */
    @AuraEnabled
    public Long getLevel() {
      return level;
    }

    /**
     * Gets the minSize.
     *
     * The minimum size of the font to match.
     *
     * @return the minSize
     */
    @AuraEnabled
    public Long getMinSize() {
      return minSize;
    }

    /**
     * Gets the maxSize.
     *
     * The maximum size of the font to match.
     *
     * @return the maxSize
     */
    @AuraEnabled
    public Long getMaxSize() {
      return maxSize;
    }

    /**
     * Gets the bold.
     *
     * When `true`, the font is matched if it is bold.
     *
     * @return the bold
     */
    @AuraEnabled
    public Boolean getBold() {
      return bold;
    }

    /**
     * Gets the italic.
     *
     * When `true`, the font is matched if it is italic.
     *
     * @return the italic
     */
    @AuraEnabled
    public Boolean getItalic() {
      return italic;
    }

    /**
     * Gets the name.
     *
     * The name of the font.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }
  
    private FontSetting(FontSettingBuilder builder) {
      this.level = builder.level;
      this.minSize = builder.minSize;
      this.maxSize = builder.maxSize;
      this.bold = builder.bold;
      this.italic = builder.italic;
      this.name = builder.name;
    }

    /**
     * New builder.
     *
     * @return a FontSetting builder
     */
    public FontSettingBuilder newBuilder() {
      return new FontSettingBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'min_size' => 'minSize',
        'max_size' => 'maxSize'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      FontSetting ret = (FontSetting) super.deserialize(jsonString, jsonMap, classType);
      FontSettingBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'minSize' => 'min_size',
        'maxSize' => 'max_size'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * FontSetting Builder.
   */
  public class FontSettingBuilder {
    private Long level;
    private Long minSize;
    private Long maxSize;
    private Boolean bold;
    private Boolean italic;
    private String name;

    private FontSettingBuilder(FontSetting fontSetting) {
      this.level = fontSetting.level;
      this.minSize = fontSetting.minSize;
      this.maxSize = fontSetting.maxSize;
      this.bold = fontSetting.bold;
      this.italic = fontSetting.italic;
      this.name = fontSetting.name;
    }

    /**
     * Instantiates a new builder.
     */
    public FontSettingBuilder() {
    }

    /**
     * Builds a FontSetting.
     *
     * @return the fontSetting
     */
    public FontSetting build() {
      return new FontSetting(this);
    }

    /**
     * Set the level.
     *
     * @param level the level
     * @return the FontSetting builder
     */
    public FontSettingBuilder level(Long level) {
      this.level = level;
      return this;
    }

    /**
     * Set the minSize.
     *
     * @param minSize the minSize
     * @return the FontSetting builder
     */
    public FontSettingBuilder minSize(Long minSize) {
      this.minSize = minSize;
      return this;
    }

    /**
     * Set the maxSize.
     *
     * @param maxSize the maxSize
     * @return the FontSetting builder
     */
    public FontSettingBuilder maxSize(Long maxSize) {
      this.maxSize = maxSize;
      return this;
    }

    /**
     * Set the bold.
     *
     * @param bold the bold
     * @return the FontSetting builder
     */
    public FontSettingBuilder bold(Boolean bold) {
      this.bold = bold;
      return this;
    }

    /**
     * Set the italic.
     *
     * @param italic the italic
     * @return the FontSetting builder
     */
    public FontSettingBuilder italic(Boolean italic) {
      this.italic = italic;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the FontSetting builder
     */
    public FontSettingBuilder name(String name) {
      this.name = name;
      return this;
    }
  }

  /**
   * Object describing a specific gateway.
   */
  public class Gateway extends IBMWatsonResponseModel {
    private String gatewayId;
    private String name;
    private String status;
    private String token;
    private String tokenId;

    /**
     * Gets the gatewayId.
     *
     * The gateway ID of the gateway.
     *
     * @return the gatewayId
     */
    @AuraEnabled
    public String getGatewayId() {
      return gatewayId;
    }

    /**
     * Gets the name.
     *
     * The user defined name of the gateway.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the status.
     *
     * The current status of the gateway. `connected` means the gateway is connected to the remotly installed gateway.
     * `idle` means this gateway is not currently in use.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the token.
     *
     * The generated **token** for this gateway. The value of this field is used when configuring the remotly installed
     * gateway.
     *
     * @return the token
     */
    @AuraEnabled
    public String getToken() {
      return token;
    }

    /**
     * Gets the tokenId.
     *
     * The generated **token_id** for this gateway. The value of this field is used when configuring the remotly
     * installed gateway.
     *
     * @return the tokenId
     */
    @AuraEnabled
    public String getTokenId() {
      return tokenId;
    }

    /**
     * Sets the gatewayId.
     *
     * @param gatewayId the new gatewayId
     */
    public void setGatewayId(final String gatewayId) {
      this.gatewayId = gatewayId;
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
     * Sets the status.
     *
     * @param status the new status
     */
    public void setStatus(final String status) {
      this.status = status;
    }

    /**
     * Sets the token.
     *
     * @param token the new token
     */
    public void setToken(final String token) {
      this.token = token;
    }

    /**
     * Sets the tokenId.
     *
     * @param tokenId the new tokenId
     */
    public void setTokenId(final String tokenId) {
      this.tokenId = tokenId;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'gateway_id' => 'gatewayId',
        'token_id' => 'tokenId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Gateway ret = (Gateway) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Object containing gateways array.
   */
  public class GatewayList extends IBMWatsonResponseModel {
    private List<Gateway> gateways;

    /**
     * Gets the gateways.
     *
     * Array of configured gateway connections.
     *
     * @return the gateways
     */
    @AuraEnabled
    public List<Gateway> getGateways() {
      return gateways;
    }

    /**
     * Sets the gateways.
     *
     * @param gateways the new gateways
     */
    public void setGateways(final List<Gateway> gateways) {
      this.gateways = gateways;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      GatewayList ret = (GatewayList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for gateways
      List<Gateway> newGateways = new List<Gateway>();
      List<Gateway> deserializedGateways = ret.getGateways();
      if (deserializedGateways != null) {
        for (Integer i = 0; i < deserializedGateways.size(); i++) {
          Gateway currentItem = ret.getGateways().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('gateways');
          Gateway newItem = (Gateway) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Gateway.class);
          newGateways.add(newItem);
        }
        ret.gateways = newGateways;
      }

      return ret;
    }
  }

  /**
   * The getAutocompletion options.
   */
  public class GetAutocompletionOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String prefix;
    private String field;
    private Long count;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notNull(builder.prefix, 'prefix cannot be null');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      prefix = builder.prefix;
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
    private String environmentId;
    private String collectionId;
    private String prefix;
    private String field;
    private Long count;

    private GetAutocompletionOptionsBuilder(GetAutocompletionOptions getAutocompletionOptions) {
      environmentId = getAutocompletionOptions.environmentId;
      collectionId = getAutocompletionOptions.collectionId;
      prefix = getAutocompletionOptions.prefix;
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
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param prefix the prefix
     */
    public GetAutocompletionOptionsBuilder(String environmentId, String collectionId, String prefix) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
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
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetAutocompletionOptions builder
     */
    public GetAutocompletionOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
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
   * The getCollection options.
   */
  public class GetCollectionOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private GetCollectionOptions(GetCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetCollectionOptions builder
     */
    public GetCollectionOptionsBuilder newBuilder() {
      return new GetCollectionOptionsBuilder(this);
    }
  }

  /**
   * GetCollectionOptions Builder.
   */
  public class GetCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private GetCollectionOptionsBuilder(GetCollectionOptions getCollectionOptions) {
      environmentId = getCollectionOptions.environmentId;
      collectionId = getCollectionOptions.collectionId;
      this.requestHeaders.putAll(getCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public GetCollectionOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a GetCollectionOptions.
     *
     * @return the getCollectionOptions
     */
    public GetCollectionOptions build() {
      return new GetCollectionOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetCollectionOptions builder
     */
    public GetCollectionOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetCollectionOptions builder
     */
    public GetCollectionOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetCollectionOptions builder
     */
    public GetCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getConfiguration options.
   */
  public class GetConfigurationOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String configurationId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the configurationId.
     *
     * The ID of the configuration.
     *
     * @return the configurationId
     */
    public String configurationId() {
      return configurationId;
    }

    private GetConfigurationOptions(GetConfigurationOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.configurationId, 'configurationId cannot be empty');
      environmentId = builder.environmentId;
      configurationId = builder.configurationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetConfigurationOptions builder
     */
    public GetConfigurationOptionsBuilder newBuilder() {
      return new GetConfigurationOptionsBuilder(this);
    }
  }

  /**
   * GetConfigurationOptions Builder.
   */
  public class GetConfigurationOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String configurationId;

    private GetConfigurationOptionsBuilder(GetConfigurationOptions getConfigurationOptions) {
      environmentId = getConfigurationOptions.environmentId;
      configurationId = getConfigurationOptions.configurationId;
      this.requestHeaders.putAll(getConfigurationOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetConfigurationOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param configurationId the configurationId
     */
    public GetConfigurationOptionsBuilder(String environmentId, String configurationId) {
      this.environmentId = environmentId;
      this.configurationId = configurationId;
    }

    /**
     * Builds a GetConfigurationOptions.
     *
     * @return the getConfigurationOptions
     */
    public GetConfigurationOptions build() {
      return new GetConfigurationOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetConfigurationOptions builder
     */
    public GetConfigurationOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the configurationId.
     *
     * @param configurationId the configurationId
     * @return the GetConfigurationOptions builder
     */
    public GetConfigurationOptionsBuilder configurationId(String configurationId) {
      this.configurationId = configurationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetConfigurationOptions builder
     */
    public GetConfigurationOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getCredentials options.
   */
  public class GetCredentialsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String credentialId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the credentialId.
     *
     * The unique identifier for a set of source credentials.
     *
     * @return the credentialId
     */
    public String credentialId() {
      return credentialId;
    }

    private GetCredentialsOptions(GetCredentialsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.credentialId, 'credentialId cannot be empty');
      environmentId = builder.environmentId;
      credentialId = builder.credentialId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetCredentialsOptions builder
     */
    public GetCredentialsOptionsBuilder newBuilder() {
      return new GetCredentialsOptionsBuilder(this);
    }
  }

  /**
   * GetCredentialsOptions Builder.
   */
  public class GetCredentialsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String credentialId;

    private GetCredentialsOptionsBuilder(GetCredentialsOptions getCredentialsOptions) {
      environmentId = getCredentialsOptions.environmentId;
      credentialId = getCredentialsOptions.credentialId;
      this.requestHeaders.putAll(getCredentialsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetCredentialsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param credentialId the credentialId
     */
    public GetCredentialsOptionsBuilder(String environmentId, String credentialId) {
      this.environmentId = environmentId;
      this.credentialId = credentialId;
    }

    /**
     * Builds a GetCredentialsOptions.
     *
     * @return the getCredentialsOptions
     */
    public GetCredentialsOptions build() {
      return new GetCredentialsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetCredentialsOptions builder
     */
    public GetCredentialsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the credentialId.
     *
     * @param credentialId the credentialId
     * @return the GetCredentialsOptions builder
     */
    public GetCredentialsOptionsBuilder credentialId(String credentialId) {
      this.credentialId = credentialId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetCredentialsOptions builder
     */
    public GetCredentialsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getDocumentStatus options.
   */
  public class GetDocumentStatusOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String documentId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private GetDocumentStatusOptions(GetDocumentStatusOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      documentId = builder.documentId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetDocumentStatusOptions builder
     */
    public GetDocumentStatusOptionsBuilder newBuilder() {
      return new GetDocumentStatusOptionsBuilder(this);
    }
  }

  /**
   * GetDocumentStatusOptions Builder.
   */
  public class GetDocumentStatusOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String documentId;

    private GetDocumentStatusOptionsBuilder(GetDocumentStatusOptions getDocumentStatusOptions) {
      environmentId = getDocumentStatusOptions.environmentId;
      collectionId = getDocumentStatusOptions.collectionId;
      documentId = getDocumentStatusOptions.documentId;
      this.requestHeaders.putAll(getDocumentStatusOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetDocumentStatusOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param documentId the documentId
     */
    public GetDocumentStatusOptionsBuilder(String environmentId, String collectionId, String documentId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.documentId = documentId;
    }

    /**
     * Builds a GetDocumentStatusOptions.
     *
     * @return the getDocumentStatusOptions
     */
    public GetDocumentStatusOptions build() {
      return new GetDocumentStatusOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetDocumentStatusOptions builder
     */
    public GetDocumentStatusOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetDocumentStatusOptions builder
     */
    public GetDocumentStatusOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the GetDocumentStatusOptions builder
     */
    public GetDocumentStatusOptionsBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetDocumentStatusOptions builder
     */
    public GetDocumentStatusOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getEnvironment options.
   */
  public class GetEnvironmentOptions extends IBMWatsonOptionsModel {
    private String environmentId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    private GetEnvironmentOptions(GetEnvironmentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetEnvironmentOptions builder
     */
    public GetEnvironmentOptionsBuilder newBuilder() {
      return new GetEnvironmentOptionsBuilder(this);
    }
  }

  /**
   * GetEnvironmentOptions Builder.
   */
  public class GetEnvironmentOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;

    private GetEnvironmentOptionsBuilder(GetEnvironmentOptions getEnvironmentOptions) {
      environmentId = getEnvironmentOptions.environmentId;
      this.requestHeaders.putAll(getEnvironmentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetEnvironmentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public GetEnvironmentOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a GetEnvironmentOptions.
     *
     * @return the getEnvironmentOptions
     */
    public GetEnvironmentOptions build() {
      return new GetEnvironmentOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetEnvironmentOptions builder
     */
    public GetEnvironmentOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetEnvironmentOptions builder
     */
    public GetEnvironmentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getGateway options.
   */
  public class GetGatewayOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String gatewayId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the gatewayId.
     *
     * The requested gateway ID.
     *
     * @return the gatewayId
     */
    public String gatewayId() {
      return gatewayId;
    }

    private GetGatewayOptions(GetGatewayOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.gatewayId, 'gatewayId cannot be empty');
      environmentId = builder.environmentId;
      gatewayId = builder.gatewayId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetGatewayOptions builder
     */
    public GetGatewayOptionsBuilder newBuilder() {
      return new GetGatewayOptionsBuilder(this);
    }
  }

  /**
   * GetGatewayOptions Builder.
   */
  public class GetGatewayOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String gatewayId;

    private GetGatewayOptionsBuilder(GetGatewayOptions getGatewayOptions) {
      environmentId = getGatewayOptions.environmentId;
      gatewayId = getGatewayOptions.gatewayId;
      this.requestHeaders.putAll(getGatewayOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetGatewayOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param gatewayId the gatewayId
     */
    public GetGatewayOptionsBuilder(String environmentId, String gatewayId) {
      this.environmentId = environmentId;
      this.gatewayId = gatewayId;
    }

    /**
     * Builds a GetGatewayOptions.
     *
     * @return the getGatewayOptions
     */
    public GetGatewayOptions build() {
      return new GetGatewayOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetGatewayOptions builder
     */
    public GetGatewayOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the gatewayId.
     *
     * @param gatewayId the gatewayId
     * @return the GetGatewayOptions builder
     */
    public GetGatewayOptionsBuilder gatewayId(String gatewayId) {
      this.gatewayId = gatewayId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetGatewayOptions builder
     */
    public GetGatewayOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getMetricsEventRate options.
   */
  public class GetMetricsEventRateOptions extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    /**
     * Gets the startTime.
     *
     * Metric is computed from data recorded after this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the startTime
     */
    public Datetime startTime() {
      return startTime;
    }

    /**
     * Gets the endTime.
     *
     * Metric is computed from data recorded before this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the endTime
     */
    public Datetime endTime() {
      return endTime;
    }

    /**
     * Gets the resultType.
     *
     * The type of result to consider when calculating the metric.
     *
     * @return the resultType
     */
    public String resultType() {
      return resultType;
    }

    private GetMetricsEventRateOptions(GetMetricsEventRateOptionsBuilder builder) {
      startTime = builder.startTime;
      endTime = builder.endTime;
      resultType = builder.resultType;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetMetricsEventRateOptions builder
     */
    public GetMetricsEventRateOptionsBuilder newBuilder() {
      return new GetMetricsEventRateOptionsBuilder(this);
    }
  }

  /**
   * GetMetricsEventRateOptions Builder.
   */
  public class GetMetricsEventRateOptionsBuilder extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    private GetMetricsEventRateOptionsBuilder(GetMetricsEventRateOptions getMetricsEventRateOptions) {
      startTime = getMetricsEventRateOptions.startTime;
      endTime = getMetricsEventRateOptions.endTime;
      resultType = getMetricsEventRateOptions.resultType;
      this.requestHeaders.putAll(getMetricsEventRateOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetMetricsEventRateOptionsBuilder() {
    }

    /**
     * Builds a GetMetricsEventRateOptions.
     *
     * @return the getMetricsEventRateOptions
     */
    public GetMetricsEventRateOptions build() {
      return new GetMetricsEventRateOptions(this);
    }

    /**
     * Set the startTime.
     *
     * @param startTime the startTime
     * @return the GetMetricsEventRateOptions builder
     */
    public GetMetricsEventRateOptionsBuilder startTime(Datetime startTime) {
      this.startTime = startTime;
      return this;
    }

    /**
     * Set the endTime.
     *
     * @param endTime the endTime
     * @return the GetMetricsEventRateOptions builder
     */
    public GetMetricsEventRateOptionsBuilder endTime(Datetime endTime) {
      this.endTime = endTime;
      return this;
    }

    /**
     * Set the resultType.
     *
     * @param resultType the resultType
     * @return the GetMetricsEventRateOptions builder
     */
    public GetMetricsEventRateOptionsBuilder resultType(String resultType) {
      this.resultType = resultType;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetMetricsEventRateOptions builder
     */
    public GetMetricsEventRateOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getMetricsQueryEvent options.
   */
  public class GetMetricsQueryEventOptions extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    /**
     * Gets the startTime.
     *
     * Metric is computed from data recorded after this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the startTime
     */
    public Datetime startTime() {
      return startTime;
    }

    /**
     * Gets the endTime.
     *
     * Metric is computed from data recorded before this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the endTime
     */
    public Datetime endTime() {
      return endTime;
    }

    /**
     * Gets the resultType.
     *
     * The type of result to consider when calculating the metric.
     *
     * @return the resultType
     */
    public String resultType() {
      return resultType;
    }

    private GetMetricsQueryEventOptions(GetMetricsQueryEventOptionsBuilder builder) {
      startTime = builder.startTime;
      endTime = builder.endTime;
      resultType = builder.resultType;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetMetricsQueryEventOptions builder
     */
    public GetMetricsQueryEventOptionsBuilder newBuilder() {
      return new GetMetricsQueryEventOptionsBuilder(this);
    }
  }

  /**
   * GetMetricsQueryEventOptions Builder.
   */
  public class GetMetricsQueryEventOptionsBuilder extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    private GetMetricsQueryEventOptionsBuilder(GetMetricsQueryEventOptions getMetricsQueryEventOptions) {
      startTime = getMetricsQueryEventOptions.startTime;
      endTime = getMetricsQueryEventOptions.endTime;
      resultType = getMetricsQueryEventOptions.resultType;
      this.requestHeaders.putAll(getMetricsQueryEventOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetMetricsQueryEventOptionsBuilder() {
    }

    /**
     * Builds a GetMetricsQueryEventOptions.
     *
     * @return the getMetricsQueryEventOptions
     */
    public GetMetricsQueryEventOptions build() {
      return new GetMetricsQueryEventOptions(this);
    }

    /**
     * Set the startTime.
     *
     * @param startTime the startTime
     * @return the GetMetricsQueryEventOptions builder
     */
    public GetMetricsQueryEventOptionsBuilder startTime(Datetime startTime) {
      this.startTime = startTime;
      return this;
    }

    /**
     * Set the endTime.
     *
     * @param endTime the endTime
     * @return the GetMetricsQueryEventOptions builder
     */
    public GetMetricsQueryEventOptionsBuilder endTime(Datetime endTime) {
      this.endTime = endTime;
      return this;
    }

    /**
     * Set the resultType.
     *
     * @param resultType the resultType
     * @return the GetMetricsQueryEventOptions builder
     */
    public GetMetricsQueryEventOptionsBuilder resultType(String resultType) {
      this.resultType = resultType;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetMetricsQueryEventOptions builder
     */
    public GetMetricsQueryEventOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getMetricsQueryNoResults options.
   */
  public class GetMetricsQueryNoResultsOptions extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    /**
     * Gets the startTime.
     *
     * Metric is computed from data recorded after this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the startTime
     */
    public Datetime startTime() {
      return startTime;
    }

    /**
     * Gets the endTime.
     *
     * Metric is computed from data recorded before this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the endTime
     */
    public Datetime endTime() {
      return endTime;
    }

    /**
     * Gets the resultType.
     *
     * The type of result to consider when calculating the metric.
     *
     * @return the resultType
     */
    public String resultType() {
      return resultType;
    }

    private GetMetricsQueryNoResultsOptions(GetMetricsQueryNoResultsOptionsBuilder builder) {
      startTime = builder.startTime;
      endTime = builder.endTime;
      resultType = builder.resultType;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetMetricsQueryNoResultsOptions builder
     */
    public GetMetricsQueryNoResultsOptionsBuilder newBuilder() {
      return new GetMetricsQueryNoResultsOptionsBuilder(this);
    }
  }

  /**
   * GetMetricsQueryNoResultsOptions Builder.
   */
  public class GetMetricsQueryNoResultsOptionsBuilder extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    private GetMetricsQueryNoResultsOptionsBuilder(GetMetricsQueryNoResultsOptions getMetricsQueryNoResultsOptions) {
      startTime = getMetricsQueryNoResultsOptions.startTime;
      endTime = getMetricsQueryNoResultsOptions.endTime;
      resultType = getMetricsQueryNoResultsOptions.resultType;
      this.requestHeaders.putAll(getMetricsQueryNoResultsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetMetricsQueryNoResultsOptionsBuilder() {
    }

    /**
     * Builds a GetMetricsQueryNoResultsOptions.
     *
     * @return the getMetricsQueryNoResultsOptions
     */
    public GetMetricsQueryNoResultsOptions build() {
      return new GetMetricsQueryNoResultsOptions(this);
    }

    /**
     * Set the startTime.
     *
     * @param startTime the startTime
     * @return the GetMetricsQueryNoResultsOptions builder
     */
    public GetMetricsQueryNoResultsOptionsBuilder startTime(Datetime startTime) {
      this.startTime = startTime;
      return this;
    }

    /**
     * Set the endTime.
     *
     * @param endTime the endTime
     * @return the GetMetricsQueryNoResultsOptions builder
     */
    public GetMetricsQueryNoResultsOptionsBuilder endTime(Datetime endTime) {
      this.endTime = endTime;
      return this;
    }

    /**
     * Set the resultType.
     *
     * @param resultType the resultType
     * @return the GetMetricsQueryNoResultsOptions builder
     */
    public GetMetricsQueryNoResultsOptionsBuilder resultType(String resultType) {
      this.resultType = resultType;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetMetricsQueryNoResultsOptions builder
     */
    public GetMetricsQueryNoResultsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getMetricsQuery options.
   */
  public class GetMetricsQueryOptions extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    /**
     * Gets the startTime.
     *
     * Metric is computed from data recorded after this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the startTime
     */
    public Datetime startTime() {
      return startTime;
    }

    /**
     * Gets the endTime.
     *
     * Metric is computed from data recorded before this timestamp; must be in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the endTime
     */
    public Datetime endTime() {
      return endTime;
    }

    /**
     * Gets the resultType.
     *
     * The type of result to consider when calculating the metric.
     *
     * @return the resultType
     */
    public String resultType() {
      return resultType;
    }

    private GetMetricsQueryOptions(GetMetricsQueryOptionsBuilder builder) {
      startTime = builder.startTime;
      endTime = builder.endTime;
      resultType = builder.resultType;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetMetricsQueryOptions builder
     */
    public GetMetricsQueryOptionsBuilder newBuilder() {
      return new GetMetricsQueryOptionsBuilder(this);
    }
  }

  /**
   * GetMetricsQueryOptions Builder.
   */
  public class GetMetricsQueryOptionsBuilder extends IBMWatsonOptionsModel {
    private Datetime startTime;
    private Datetime endTime;
    private String resultType;

    private GetMetricsQueryOptionsBuilder(GetMetricsQueryOptions getMetricsQueryOptions) {
      startTime = getMetricsQueryOptions.startTime;
      endTime = getMetricsQueryOptions.endTime;
      resultType = getMetricsQueryOptions.resultType;
      this.requestHeaders.putAll(getMetricsQueryOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetMetricsQueryOptionsBuilder() {
    }

    /**
     * Builds a GetMetricsQueryOptions.
     *
     * @return the getMetricsQueryOptions
     */
    public GetMetricsQueryOptions build() {
      return new GetMetricsQueryOptions(this);
    }

    /**
     * Set the startTime.
     *
     * @param startTime the startTime
     * @return the GetMetricsQueryOptions builder
     */
    public GetMetricsQueryOptionsBuilder startTime(Datetime startTime) {
      this.startTime = startTime;
      return this;
    }

    /**
     * Set the endTime.
     *
     * @param endTime the endTime
     * @return the GetMetricsQueryOptions builder
     */
    public GetMetricsQueryOptionsBuilder endTime(Datetime endTime) {
      this.endTime = endTime;
      return this;
    }

    /**
     * Set the resultType.
     *
     * @param resultType the resultType
     * @return the GetMetricsQueryOptions builder
     */
    public GetMetricsQueryOptionsBuilder resultType(String resultType) {
      this.resultType = resultType;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetMetricsQueryOptions builder
     */
    public GetMetricsQueryOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getMetricsQueryTokenEvent options.
   */
  public class GetMetricsQueryTokenEventOptions extends IBMWatsonOptionsModel {
    private Long count;

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

    private GetMetricsQueryTokenEventOptions(GetMetricsQueryTokenEventOptionsBuilder builder) {
      count = builder.count;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetMetricsQueryTokenEventOptions builder
     */
    public GetMetricsQueryTokenEventOptionsBuilder newBuilder() {
      return new GetMetricsQueryTokenEventOptionsBuilder(this);
    }
  }

  /**
   * GetMetricsQueryTokenEventOptions Builder.
   */
  public class GetMetricsQueryTokenEventOptionsBuilder extends IBMWatsonOptionsModel {
    private Long count;

    private GetMetricsQueryTokenEventOptionsBuilder(GetMetricsQueryTokenEventOptions getMetricsQueryTokenEventOptions) {
      count = getMetricsQueryTokenEventOptions.count;
      this.requestHeaders.putAll(getMetricsQueryTokenEventOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetMetricsQueryTokenEventOptionsBuilder() {
    }

    /**
     * Builds a GetMetricsQueryTokenEventOptions.
     *
     * @return the getMetricsQueryTokenEventOptions
     */
    public GetMetricsQueryTokenEventOptions build() {
      return new GetMetricsQueryTokenEventOptions(this);
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the GetMetricsQueryTokenEventOptions builder
     */
    public GetMetricsQueryTokenEventOptionsBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetMetricsQueryTokenEventOptions builder
     */
    public GetMetricsQueryTokenEventOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getStopwordListStatus options.
   */
  public class GetStopwordListStatusOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private GetStopwordListStatusOptions(GetStopwordListStatusOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetStopwordListStatusOptions builder
     */
    public GetStopwordListStatusOptionsBuilder newBuilder() {
      return new GetStopwordListStatusOptionsBuilder(this);
    }
  }

  /**
   * GetStopwordListStatusOptions Builder.
   */
  public class GetStopwordListStatusOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private GetStopwordListStatusOptionsBuilder(GetStopwordListStatusOptions getStopwordListStatusOptions) {
      environmentId = getStopwordListStatusOptions.environmentId;
      collectionId = getStopwordListStatusOptions.collectionId;
      this.requestHeaders.putAll(getStopwordListStatusOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetStopwordListStatusOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public GetStopwordListStatusOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a GetStopwordListStatusOptions.
     *
     * @return the getStopwordListStatusOptions
     */
    public GetStopwordListStatusOptions build() {
      return new GetStopwordListStatusOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetStopwordListStatusOptions builder
     */
    public GetStopwordListStatusOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetStopwordListStatusOptions builder
     */
    public GetStopwordListStatusOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetStopwordListStatusOptions builder
     */
    public GetStopwordListStatusOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getTokenizationDictionaryStatus options.
   */
  public class GetTokenizationDictionaryStatusOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private GetTokenizationDictionaryStatusOptions(GetTokenizationDictionaryStatusOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetTokenizationDictionaryStatusOptions builder
     */
    public GetTokenizationDictionaryStatusOptionsBuilder newBuilder() {
      return new GetTokenizationDictionaryStatusOptionsBuilder(this);
    }
  }

  /**
   * GetTokenizationDictionaryStatusOptions Builder.
   */
  public class GetTokenizationDictionaryStatusOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private GetTokenizationDictionaryStatusOptionsBuilder(GetTokenizationDictionaryStatusOptions getTokenizationDictionaryStatusOptions) {
      environmentId = getTokenizationDictionaryStatusOptions.environmentId;
      collectionId = getTokenizationDictionaryStatusOptions.collectionId;
      this.requestHeaders.putAll(getTokenizationDictionaryStatusOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetTokenizationDictionaryStatusOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public GetTokenizationDictionaryStatusOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a GetTokenizationDictionaryStatusOptions.
     *
     * @return the getTokenizationDictionaryStatusOptions
     */
    public GetTokenizationDictionaryStatusOptions build() {
      return new GetTokenizationDictionaryStatusOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetTokenizationDictionaryStatusOptions builder
     */
    public GetTokenizationDictionaryStatusOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetTokenizationDictionaryStatusOptions builder
     */
    public GetTokenizationDictionaryStatusOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetTokenizationDictionaryStatusOptions builder
     */
    public GetTokenizationDictionaryStatusOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getTrainingData options.
   */
  public class GetTrainingDataOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the queryId.
     *
     * The ID of the query used for training.
     *
     * @return the queryId
     */
    public String queryId() {
      return queryId;
    }

    private GetTrainingDataOptions(GetTrainingDataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      queryId = builder.queryId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetTrainingDataOptions builder
     */
    public GetTrainingDataOptionsBuilder newBuilder() {
      return new GetTrainingDataOptionsBuilder(this);
    }
  }

  /**
   * GetTrainingDataOptions Builder.
   */
  public class GetTrainingDataOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;

    private GetTrainingDataOptionsBuilder(GetTrainingDataOptions getTrainingDataOptions) {
      environmentId = getTrainingDataOptions.environmentId;
      collectionId = getTrainingDataOptions.collectionId;
      queryId = getTrainingDataOptions.queryId;
      this.requestHeaders.putAll(getTrainingDataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetTrainingDataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param queryId the queryId
     */
    public GetTrainingDataOptionsBuilder(String environmentId, String collectionId, String queryId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.queryId = queryId;
    }

    /**
     * Builds a GetTrainingDataOptions.
     *
     * @return the getTrainingDataOptions
     */
    public GetTrainingDataOptions build() {
      return new GetTrainingDataOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetTrainingDataOptions builder
     */
    public GetTrainingDataOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetTrainingDataOptions builder
     */
    public GetTrainingDataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the GetTrainingDataOptions builder
     */
    public GetTrainingDataOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetTrainingDataOptions builder
     */
    public GetTrainingDataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getTrainingExample options.
   */
  public class GetTrainingExampleOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String exampleId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the exampleId.
     *
     * The ID of the document as it is indexed.
     *
     * @return the exampleId
     */
    public String exampleId() {
      return exampleId;
    }

    private GetTrainingExampleOptions(GetTrainingExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.exampleId, 'exampleId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      queryId = builder.queryId;
      exampleId = builder.exampleId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetTrainingExampleOptions builder
     */
    public GetTrainingExampleOptionsBuilder newBuilder() {
      return new GetTrainingExampleOptionsBuilder(this);
    }
  }

  /**
   * GetTrainingExampleOptions Builder.
   */
  public class GetTrainingExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String exampleId;

    private GetTrainingExampleOptionsBuilder(GetTrainingExampleOptions getTrainingExampleOptions) {
      environmentId = getTrainingExampleOptions.environmentId;
      collectionId = getTrainingExampleOptions.collectionId;
      queryId = getTrainingExampleOptions.queryId;
      exampleId = getTrainingExampleOptions.exampleId;
      this.requestHeaders.putAll(getTrainingExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetTrainingExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param queryId the queryId
     * @param exampleId the exampleId
     */
    public GetTrainingExampleOptionsBuilder(String environmentId, String collectionId, String queryId, String exampleId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.queryId = queryId;
      this.exampleId = exampleId;
    }

    /**
     * Builds a GetTrainingExampleOptions.
     *
     * @return the getTrainingExampleOptions
     */
    public GetTrainingExampleOptions build() {
      return new GetTrainingExampleOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the GetTrainingExampleOptions builder
     */
    public GetTrainingExampleOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetTrainingExampleOptions builder
     */
    public GetTrainingExampleOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the GetTrainingExampleOptions builder
     */
    public GetTrainingExampleOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Set the exampleId.
     *
     * @param exampleId the exampleId
     * @return the GetTrainingExampleOptions builder
     */
    public GetTrainingExampleOptionsBuilder exampleId(String exampleId) {
      this.exampleId = exampleId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetTrainingExampleOptions builder
     */
    public GetTrainingExampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * A list of HTML conversion settings.
   */
  public class HtmlSettings extends IBMWatsonGenericModel {
    private List<String> excludeTagsCompletely;
    private List<String> excludeTagsKeepContent;
    private XPathPatterns keepContent;
    private XPathPatterns excludeContent;
    private List<String> keepTagAttributes;
    private List<String> excludeTagAttributes;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public HtmlSettings() { }

    /**
     * Gets the excludeTagsCompletely.
     *
     * Array of HTML tags that are excluded completely.
     *
     * @return the excludeTagsCompletely
     */
    @AuraEnabled
    public List<String> getExcludeTagsCompletely() {
      return excludeTagsCompletely;
    }

    /**
     * Gets the excludeTagsKeepContent.
     *
     * Array of HTML tags which are excluded but still retain content.
     *
     * @return the excludeTagsKeepContent
     */
    @AuraEnabled
    public List<String> getExcludeTagsKeepContent() {
      return excludeTagsKeepContent;
    }

    /**
     * Gets the keepContent.
     *
     * Object containing an array of XPaths.
     *
     * @return the keepContent
     */
    @AuraEnabled
    public XPathPatterns getKeepContent() {
      return keepContent;
    }

    /**
     * Gets the excludeContent.
     *
     * Object containing an array of XPaths.
     *
     * @return the excludeContent
     */
    @AuraEnabled
    public XPathPatterns getExcludeContent() {
      return excludeContent;
    }

    /**
     * Gets the keepTagAttributes.
     *
     * An array of HTML tag attributes to keep in the converted document.
     *
     * @return the keepTagAttributes
     */
    @AuraEnabled
    public List<String> getKeepTagAttributes() {
      return keepTagAttributes;
    }

    /**
     * Gets the excludeTagAttributes.
     *
     * Array of HTML tag attributes to exclude.
     *
     * @return the excludeTagAttributes
     */
    @AuraEnabled
    public List<String> getExcludeTagAttributes() {
      return excludeTagAttributes;
    }
  
    private HtmlSettings(HtmlSettingsBuilder builder) {
      this.excludeTagsCompletely = builder.excludeTagsCompletely;
      this.excludeTagsKeepContent = builder.excludeTagsKeepContent;
      this.keepContent = builder.keepContent;
      this.excludeContent = builder.excludeContent;
      this.keepTagAttributes = builder.keepTagAttributes;
      this.excludeTagAttributes = builder.excludeTagAttributes;
    }

    /**
     * New builder.
     *
     * @return a HtmlSettings builder
     */
    public HtmlSettingsBuilder newBuilder() {
      return new HtmlSettingsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'exclude_tags_completely' => 'excludeTagsCompletely',
        'exclude_tags_keep_content' => 'excludeTagsKeepContent',
        'keep_content' => 'keepContent',
        'exclude_content' => 'excludeContent',
        'keep_tag_attributes' => 'keepTagAttributes',
        'exclude_tag_attributes' => 'excludeTagAttributes'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      HtmlSettings ret = (HtmlSettings) super.deserialize(jsonString, jsonMap, classType);
      HtmlSettingsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for keepContent
      Map<String, Object> keepContentMap = (Map<String, Object>) jsonMap.get('keepContent');
      XPathPatterns newKeepContent = (XPathPatterns) new XPathPatterns().deserialize(JSON.serialize(keepContentMap, true), keepContentMap, XPathPatterns.class);
      retBuilder.keepContent(newKeepContent);

      // calling custom deserializer for excludeContent
      Map<String, Object> excludeContentMap = (Map<String, Object>) jsonMap.get('excludeContent');
      XPathPatterns newExcludeContent = (XPathPatterns) new XPathPatterns().deserialize(JSON.serialize(excludeContentMap, true), excludeContentMap, XPathPatterns.class);
      retBuilder.excludeContent(newExcludeContent);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'excludeTagsCompletely' => 'exclude_tags_completely',
        'excludeTagsKeepContent' => 'exclude_tags_keep_content',
        'keepContent' => 'keep_content',
        'excludeContent' => 'exclude_content',
        'keepTagAttributes' => 'keep_tag_attributes',
        'excludeTagAttributes' => 'exclude_tag_attributes'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for keepContent
      if (keepContent != null) {
        String keepContentJsonString = JSON.serialize(keepContent.replacePropertyNames(), true);
        String keepContentKey = 'keepContent';
        if (propertyNameMapping.containsKey(keepContentKey)) {
          keepContentKey = propertyNameMapping.get(keepContentKey);
        }
        jsonMap.put(keepContentKey, JSON.deserializeUntyped(keepContentJsonString));
      }

      // performing custom serialization for excludeContent
      if (excludeContent != null) {
        String excludeContentJsonString = JSON.serialize(excludeContent.replacePropertyNames(), true);
        String excludeContentKey = 'excludeContent';
        if (propertyNameMapping.containsKey(excludeContentKey)) {
          excludeContentKey = propertyNameMapping.get(excludeContentKey);
        }
        jsonMap.put(excludeContentKey, JSON.deserializeUntyped(excludeContentJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * HtmlSettings Builder.
   */
  public class HtmlSettingsBuilder {
    private List<String> excludeTagsCompletely;
    private List<String> excludeTagsKeepContent;
    private XPathPatterns keepContent;
    private XPathPatterns excludeContent;
    private List<String> keepTagAttributes;
    private List<String> excludeTagAttributes;

    private HtmlSettingsBuilder(HtmlSettings htmlSettings) {
      this.excludeTagsCompletely = htmlSettings.excludeTagsCompletely;
      this.excludeTagsKeepContent = htmlSettings.excludeTagsKeepContent;
      this.keepContent = htmlSettings.keepContent;
      this.excludeContent = htmlSettings.excludeContent;
      this.keepTagAttributes = htmlSettings.keepTagAttributes;
      this.excludeTagAttributes = htmlSettings.excludeTagAttributes;
    }

    /**
     * Instantiates a new builder.
     */
    public HtmlSettingsBuilder() {
    }

    /**
     * Builds a HtmlSettings.
     *
     * @return the htmlSettings
     */
    public HtmlSettings build() {
      return new HtmlSettings(this);
    }

    /**
     * Adds an excludeTagsCompletely to excludeTagsCompletely.
     *
     * @param excludeTagsCompletely the new excludeTagsCompletely
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder addExcludeTagsCompletely(String excludeTagsCompletely) {
      IBMWatsonValidator.notNull(excludeTagsCompletely, 'excludeTagsCompletely cannot be null');
      if (this.excludeTagsCompletely == null) {
        this.excludeTagsCompletely = new List<String>();
      }
      this.excludeTagsCompletely.add(excludeTagsCompletely);
      return this;
    }

    /**
     * Adds an excludeTagsKeepContent to excludeTagsKeepContent.
     *
     * @param excludeTagsKeepContent the new excludeTagsKeepContent
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder addExcludeTagsKeepContent(String excludeTagsKeepContent) {
      IBMWatsonValidator.notNull(excludeTagsKeepContent, 'excludeTagsKeepContent cannot be null');
      if (this.excludeTagsKeepContent == null) {
        this.excludeTagsKeepContent = new List<String>();
      }
      this.excludeTagsKeepContent.add(excludeTagsKeepContent);
      return this;
    }

    /**
     * Adds an keepTagAttributes to keepTagAttributes.
     *
     * @param keepTagAttributes the new keepTagAttributes
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder addKeepTagAttributes(String keepTagAttributes) {
      IBMWatsonValidator.notNull(keepTagAttributes, 'keepTagAttributes cannot be null');
      if (this.keepTagAttributes == null) {
        this.keepTagAttributes = new List<String>();
      }
      this.keepTagAttributes.add(keepTagAttributes);
      return this;
    }

    /**
     * Adds an excludeTagAttributes to excludeTagAttributes.
     *
     * @param excludeTagAttributes the new excludeTagAttributes
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder addExcludeTagAttributes(String excludeTagAttributes) {
      IBMWatsonValidator.notNull(excludeTagAttributes, 'excludeTagAttributes cannot be null');
      if (this.excludeTagAttributes == null) {
        this.excludeTagAttributes = new List<String>();
      }
      this.excludeTagAttributes.add(excludeTagAttributes);
      return this;
    }

    /**
     * Set the excludeTagsCompletely.
     * Existing excludeTagsCompletely will be replaced.
     *
     * @param excludeTagsCompletely the excludeTagsCompletely
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder excludeTagsCompletely(List<String> excludeTagsCompletely) {
      this.excludeTagsCompletely = excludeTagsCompletely;
      return this;
    }

    /**
     * Set the excludeTagsKeepContent.
     * Existing excludeTagsKeepContent will be replaced.
     *
     * @param excludeTagsKeepContent the excludeTagsKeepContent
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder excludeTagsKeepContent(List<String> excludeTagsKeepContent) {
      this.excludeTagsKeepContent = excludeTagsKeepContent;
      return this;
    }

    /**
     * Set the keepContent.
     *
     * @param keepContent the keepContent
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder keepContent(XPathPatterns keepContent) {
      this.keepContent = keepContent;
      return this;
    }

    /**
     * Set the excludeContent.
     *
     * @param excludeContent the excludeContent
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder excludeContent(XPathPatterns excludeContent) {
      this.excludeContent = excludeContent;
      return this;
    }

    /**
     * Set the keepTagAttributes.
     * Existing keepTagAttributes will be replaced.
     *
     * @param keepTagAttributes the keepTagAttributes
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder keepTagAttributes(List<String> keepTagAttributes) {
      this.keepTagAttributes = keepTagAttributes;
      return this;
    }

    /**
     * Set the excludeTagAttributes.
     * Existing excludeTagAttributes will be replaced.
     *
     * @param excludeTagAttributes the excludeTagAttributes
     * @return the HtmlSettings builder
     */
    public HtmlSettingsBuilder excludeTagAttributes(List<String> excludeTagAttributes) {
      this.excludeTagAttributes = excludeTagAttributes;
      return this;
    }
  }

  /**
   * Details about the resource usage and capacity of the environment.
   */
  public class IndexCapacity extends IBMWatsonGenericModel {
    private EnvironmentDocuments documents;
    private DiskUsage diskUsage;
    private CollectionUsage collections;

    /**
     * Gets the documents.
     *
     * Summary of the document usage statistics for the environment.
     *
     * @return the documents
     */
    @AuraEnabled
    public EnvironmentDocuments getDocuments() {
      return documents;
    }

    /**
     * Gets the diskUsage.
     *
     * Summary of the disk usage statistics for the environment.
     *
     * @return the diskUsage
     */
    @AuraEnabled
    public DiskUsage getDiskUsage() {
      return diskUsage;
    }

    /**
     * Gets the collections.
     *
     * Summary of the collection usage in the environment.
     *
     * @return the collections
     */
    @AuraEnabled
    public CollectionUsage getCollections() {
      return collections;
    }

    /**
     * Sets the documents.
     *
     * @param documents the new documents
     */
    public void setDocuments(final EnvironmentDocuments documents) {
      this.documents = documents;
    }

    /**
     * Sets the diskUsage.
     *
     * @param diskUsage the new diskUsage
     */
    public void setDiskUsage(final DiskUsage diskUsage) {
      this.diskUsage = diskUsage;
    }

    /**
     * Sets the collections.
     *
     * @param collections the new collections
     */
    public void setCollections(final CollectionUsage collections) {
      this.collections = collections;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'disk_usage' => 'diskUsage'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      IndexCapacity ret = (IndexCapacity) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for documents
      Map<String, Object> documentsMap = (Map<String, Object>) jsonMap.get('documents');
      EnvironmentDocuments newDocuments = (EnvironmentDocuments) new EnvironmentDocuments().deserialize(JSON.serialize(documentsMap, true), documentsMap, EnvironmentDocuments.class);
      ret.setDocuments(newDocuments);

      // calling custom deserializer for diskUsage
      Map<String, Object> diskUsageMap = (Map<String, Object>) jsonMap.get('diskUsage');
      DiskUsage newDiskUsage = (DiskUsage) new DiskUsage().deserialize(JSON.serialize(diskUsageMap, true), diskUsageMap, DiskUsage.class);
      ret.setDiskUsage(newDiskUsage);

      // calling custom deserializer for collections
      Map<String, Object> collectionsMap = (Map<String, Object>) jsonMap.get('collections');
      CollectionUsage newCollections = (CollectionUsage) new CollectionUsage().deserialize(JSON.serialize(collectionsMap, true), collectionsMap, CollectionUsage.class);
      ret.setCollections(newCollections);

      return ret;
    }
  }

  /**
   * The listCollectionFields options.
   */
  public class ListCollectionFieldsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private ListCollectionFieldsOptions(ListCollectionFieldsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListCollectionFieldsOptions builder
     */
    public ListCollectionFieldsOptionsBuilder newBuilder() {
      return new ListCollectionFieldsOptionsBuilder(this);
    }
  }

  /**
   * ListCollectionFieldsOptions Builder.
   */
  public class ListCollectionFieldsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private ListCollectionFieldsOptionsBuilder(ListCollectionFieldsOptions listCollectionFieldsOptions) {
      environmentId = listCollectionFieldsOptions.environmentId;
      collectionId = listCollectionFieldsOptions.collectionId;
      this.requestHeaders.putAll(listCollectionFieldsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListCollectionFieldsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public ListCollectionFieldsOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a ListCollectionFieldsOptions.
     *
     * @return the listCollectionFieldsOptions
     */
    public ListCollectionFieldsOptions build() {
      return new ListCollectionFieldsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListCollectionFieldsOptions builder
     */
    public ListCollectionFieldsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the ListCollectionFieldsOptions builder
     */
    public ListCollectionFieldsOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListCollectionFieldsOptions builder
     */
    public ListCollectionFieldsOptionsBuilder addHeader(String name, String value) {
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
   *   * Fields which contain nested JSON objects are assigned a type of "nested".
   *
   *   * Fields which belong to a nested object are prefixed with `.properties` (for example,
   * `warnings.properties.severity` means that the `warnings` object has a property called `severity`).
   *
   *   * Fields returned from the News collection are prefixed with `v{N}-fullnews-t3-{YEAR}.mappings` (for example,
   * `v5-fullnews-t3-2016.mappings.text.properties.author`).
   */
  public class ListCollectionFieldsResponse extends IBMWatsonResponseModel {
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

      ListCollectionFieldsResponse ret = (ListCollectionFieldsResponse) super.deserialize(jsonString, jsonMap, classType);

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
   * The listCollections options.
   */
  public class ListCollectionsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the name.
     *
     * Find collections with the given name.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    private ListCollectionsOptions(ListCollectionsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      name = builder.name;
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
    private String environmentId;
    private String name;

    private ListCollectionsOptionsBuilder(ListCollectionsOptions listCollectionsOptions) {
      environmentId = listCollectionsOptions.environmentId;
      name = listCollectionsOptions.name;
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
     * @param environmentId the environmentId
     */
    public ListCollectionsOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
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
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListCollectionsOptions builder
     */
    public ListCollectionsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the ListCollectionsOptions builder
     */
    public ListCollectionsOptionsBuilder name(String name) {
      this.name = name;
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
     * An array containing information about each collection in the environment.
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
   * The listConfigurations options.
   */
  public class ListConfigurationsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the name.
     *
     * Find configurations with the given name.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    private ListConfigurationsOptions(ListConfigurationsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      name = builder.name;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListConfigurationsOptions builder
     */
    public ListConfigurationsOptionsBuilder newBuilder() {
      return new ListConfigurationsOptionsBuilder(this);
    }
  }

  /**
   * ListConfigurationsOptions Builder.
   */
  public class ListConfigurationsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;

    private ListConfigurationsOptionsBuilder(ListConfigurationsOptions listConfigurationsOptions) {
      environmentId = listConfigurationsOptions.environmentId;
      name = listConfigurationsOptions.name;
      this.requestHeaders.putAll(listConfigurationsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListConfigurationsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public ListConfigurationsOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a ListConfigurationsOptions.
     *
     * @return the listConfigurationsOptions
     */
    public ListConfigurationsOptions build() {
      return new ListConfigurationsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListConfigurationsOptions builder
     */
    public ListConfigurationsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the ListConfigurationsOptions builder
     */
    public ListConfigurationsOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListConfigurationsOptions builder
     */
    public ListConfigurationsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Object containing an array of available configurations.
   */
  public class ListConfigurationsResponse extends IBMWatsonResponseModel {
    private List<Configuration> configurations;

    /**
     * Gets the configurations.
     *
     * An array of configurations that are available for the service instance.
     *
     * @return the configurations
     */
    @AuraEnabled
    public List<Configuration> getConfigurations() {
      return configurations;
    }

    /**
     * Sets the configurations.
     *
     * @param configurations the new configurations
     */
    public void setConfigurations(final List<Configuration> configurations) {
      this.configurations = configurations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ListConfigurationsResponse ret = (ListConfigurationsResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for configurations
      List<Configuration> newConfigurations = new List<Configuration>();
      List<Configuration> deserializedConfigurations = ret.getConfigurations();
      if (deserializedConfigurations != null) {
        for (Integer i = 0; i < deserializedConfigurations.size(); i++) {
          Configuration currentItem = ret.getConfigurations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('configurations');
          Configuration newItem = (Configuration) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Configuration.class);
          newConfigurations.add(newItem);
        }
        ret.configurations = newConfigurations;
      }

      return ret;
    }
  }

  /**
   * The listCredentials options.
   */
  public class ListCredentialsOptions extends IBMWatsonOptionsModel {
    private String environmentId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    private ListCredentialsOptions(ListCredentialsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListCredentialsOptions builder
     */
    public ListCredentialsOptionsBuilder newBuilder() {
      return new ListCredentialsOptionsBuilder(this);
    }
  }

  /**
   * ListCredentialsOptions Builder.
   */
  public class ListCredentialsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;

    private ListCredentialsOptionsBuilder(ListCredentialsOptions listCredentialsOptions) {
      environmentId = listCredentialsOptions.environmentId;
      this.requestHeaders.putAll(listCredentialsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListCredentialsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public ListCredentialsOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a ListCredentialsOptions.
     *
     * @return the listCredentialsOptions
     */
    public ListCredentialsOptions build() {
      return new ListCredentialsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListCredentialsOptions builder
     */
    public ListCredentialsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListCredentialsOptions builder
     */
    public ListCredentialsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listEnvironments options.
   */
  public class ListEnvironmentsOptions extends IBMWatsonOptionsModel {
    private String name;

    /**
     * Gets the name.
     *
     * Show only the environment with the given name.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    private ListEnvironmentsOptions(ListEnvironmentsOptionsBuilder builder) {
      name = builder.name;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListEnvironmentsOptions builder
     */
    public ListEnvironmentsOptionsBuilder newBuilder() {
      return new ListEnvironmentsOptionsBuilder(this);
    }
  }

  /**
   * ListEnvironmentsOptions Builder.
   */
  public class ListEnvironmentsOptionsBuilder extends IBMWatsonOptionsModel {
    private String name;

    private ListEnvironmentsOptionsBuilder(ListEnvironmentsOptions listEnvironmentsOptions) {
      name = listEnvironmentsOptions.name;
      this.requestHeaders.putAll(listEnvironmentsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListEnvironmentsOptionsBuilder() {
    }

    /**
     * Builds a ListEnvironmentsOptions.
     *
     * @return the listEnvironmentsOptions
     */
    public ListEnvironmentsOptions build() {
      return new ListEnvironmentsOptions(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the ListEnvironmentsOptions builder
     */
    public ListEnvironmentsOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListEnvironmentsOptions builder
     */
    public ListEnvironmentsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Response object containing an array of configured environments.
   */
  public class ListEnvironmentsResponse extends IBMWatsonResponseModel {
    private List<Environment> environments;

    /**
     * Gets the environments.
     *
     * An array of [environments] that are available for the service instance.
     *
     * @return the environments
     */
    @AuraEnabled
    public List<Environment> getEnvironments() {
      return environments;
    }

    /**
     * Sets the environments.
     *
     * @param environments the new environments
     */
    public void setEnvironments(final List<Environment> environments) {
      this.environments = environments;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ListEnvironmentsResponse ret = (ListEnvironmentsResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for environments
      List<Environment> newEnvironments = new List<Environment>();
      List<Environment> deserializedEnvironments = ret.getEnvironments();
      if (deserializedEnvironments != null) {
        for (Integer i = 0; i < deserializedEnvironments.size(); i++) {
          Environment currentItem = ret.getEnvironments().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('environments');
          Environment newItem = (Environment) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Environment.class);
          newEnvironments.add(newItem);
        }
        ret.environments = newEnvironments;
      }

      return ret;
    }
  }

  /**
   * The listExpansions options.
   */
  public class ListExpansionsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private ListExpansionsOptions(ListExpansionsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListExpansionsOptions builder
     */
    public ListExpansionsOptionsBuilder newBuilder() {
      return new ListExpansionsOptionsBuilder(this);
    }
  }

  /**
   * ListExpansionsOptions Builder.
   */
  public class ListExpansionsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private ListExpansionsOptionsBuilder(ListExpansionsOptions listExpansionsOptions) {
      environmentId = listExpansionsOptions.environmentId;
      collectionId = listExpansionsOptions.collectionId;
      this.requestHeaders.putAll(listExpansionsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListExpansionsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public ListExpansionsOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a ListExpansionsOptions.
     *
     * @return the listExpansionsOptions
     */
    public ListExpansionsOptions build() {
      return new ListExpansionsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListExpansionsOptions builder
     */
    public ListExpansionsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the ListExpansionsOptions builder
     */
    public ListExpansionsOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListExpansionsOptions builder
     */
    public ListExpansionsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listFields options.
   */
  public class ListFieldsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private List<String> collectionIds;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private ListFieldsOptions(ListFieldsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notNull(builder.collectionIds, 'collectionIds cannot be null');
      environmentId = builder.environmentId;
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
    private String environmentId;
    private List<String> collectionIds;

    private ListFieldsOptionsBuilder(ListFieldsOptions listFieldsOptions) {
      environmentId = listFieldsOptions.environmentId;
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
     * @param environmentId the environmentId
     * @param collectionIds the collectionIds
     */
    public ListFieldsOptionsBuilder(String environmentId, List<String> collectionIds) {
      this.environmentId = environmentId;
      this.collectionIds = collectionIds;
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
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListFieldsOptions builder
     */
    public ListFieldsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
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
   * The listGateways options.
   */
  public class ListGatewaysOptions extends IBMWatsonOptionsModel {
    private String environmentId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    private ListGatewaysOptions(ListGatewaysOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListGatewaysOptions builder
     */
    public ListGatewaysOptionsBuilder newBuilder() {
      return new ListGatewaysOptionsBuilder(this);
    }
  }

  /**
   * ListGatewaysOptions Builder.
   */
  public class ListGatewaysOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;

    private ListGatewaysOptionsBuilder(ListGatewaysOptions listGatewaysOptions) {
      environmentId = listGatewaysOptions.environmentId;
      this.requestHeaders.putAll(listGatewaysOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListGatewaysOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public ListGatewaysOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a ListGatewaysOptions.
     *
     * @return the listGatewaysOptions
     */
    public ListGatewaysOptions build() {
      return new ListGatewaysOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListGatewaysOptions builder
     */
    public ListGatewaysOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListGatewaysOptions builder
     */
    public ListGatewaysOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listTrainingData options.
   */
  public class ListTrainingDataOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private ListTrainingDataOptions(ListTrainingDataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListTrainingDataOptions builder
     */
    public ListTrainingDataOptionsBuilder newBuilder() {
      return new ListTrainingDataOptionsBuilder(this);
    }
  }

  /**
   * ListTrainingDataOptions Builder.
   */
  public class ListTrainingDataOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;

    private ListTrainingDataOptionsBuilder(ListTrainingDataOptions listTrainingDataOptions) {
      environmentId = listTrainingDataOptions.environmentId;
      collectionId = listTrainingDataOptions.collectionId;
      this.requestHeaders.putAll(listTrainingDataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListTrainingDataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public ListTrainingDataOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
    }

    /**
     * Builds a ListTrainingDataOptions.
     *
     * @return the listTrainingDataOptions
     */
    public ListTrainingDataOptions build() {
      return new ListTrainingDataOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListTrainingDataOptions builder
     */
    public ListTrainingDataOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the ListTrainingDataOptions builder
     */
    public ListTrainingDataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListTrainingDataOptions builder
     */
    public ListTrainingDataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listTrainingExamples options.
   */
  public class ListTrainingExamplesOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the queryId.
     *
     * The ID of the query used for training.
     *
     * @return the queryId
     */
    public String queryId() {
      return queryId;
    }

    private ListTrainingExamplesOptions(ListTrainingExamplesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      queryId = builder.queryId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListTrainingExamplesOptions builder
     */
    public ListTrainingExamplesOptionsBuilder newBuilder() {
      return new ListTrainingExamplesOptionsBuilder(this);
    }
  }

  /**
   * ListTrainingExamplesOptions Builder.
   */
  public class ListTrainingExamplesOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;

    private ListTrainingExamplesOptionsBuilder(ListTrainingExamplesOptions listTrainingExamplesOptions) {
      environmentId = listTrainingExamplesOptions.environmentId;
      collectionId = listTrainingExamplesOptions.collectionId;
      queryId = listTrainingExamplesOptions.queryId;
      this.requestHeaders.putAll(listTrainingExamplesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListTrainingExamplesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param queryId the queryId
     */
    public ListTrainingExamplesOptionsBuilder(String environmentId, String collectionId, String queryId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.queryId = queryId;
    }

    /**
     * Builds a ListTrainingExamplesOptions.
     *
     * @return the listTrainingExamplesOptions
     */
    public ListTrainingExamplesOptions build() {
      return new ListTrainingExamplesOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the ListTrainingExamplesOptions builder
     */
    public ListTrainingExamplesOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the ListTrainingExamplesOptions builder
     */
    public ListTrainingExamplesOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the ListTrainingExamplesOptions builder
     */
    public ListTrainingExamplesOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListTrainingExamplesOptions builder
     */
    public ListTrainingExamplesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Object containing results that match the requested **logs** query.
   */
  public class LogQueryResponse extends IBMWatsonResponseModel {
    private Long matchingResults;
    private List<LogQueryResponseResult> results;

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
     * Gets the results.
     *
     * Array of log query response results.
     *
     * @return the results
     */
    @AuraEnabled
    public List<LogQueryResponseResult> getResults() {
      return results;
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
    public void setResults(final List<LogQueryResponseResult> results) {
      this.results = results;
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

      LogQueryResponse ret = (LogQueryResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for results
      List<LogQueryResponseResult> newResults = new List<LogQueryResponseResult>();
      List<LogQueryResponseResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          LogQueryResponseResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          LogQueryResponseResult newItem = (LogQueryResponseResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), LogQueryResponseResult.class);
          newResults.add(newItem);
        }
        ret.results = newResults;
      }

      return ret;
    }
  }

  /**
   * Individual result object for a **logs** query. Each object represents either a query to a Discovery collection or
   * an event that is associated with a query.
   */
  public class LogQueryResponseResult extends IBMWatsonGenericModel {
    private String environmentId;
    private String customerId;
    private String documentType;
    private String naturalLanguageQuery;
    private LogQueryResponseResultDocuments documentResults;
    private Datetime createdTimestamp;
    private Datetime clientTimestamp;
    private String queryId;
    private String sessionToken;
    private String collectionId;
    private Long displayRank;
    private String documentId;
    private String eventType;
    private String resultType;

    /**
     * Gets the environmentId.
     *
     * The environment ID that is associated with this log entry.
     *
     * @return the environmentId
     */
    @AuraEnabled
    public String getEnvironmentId() {
      return environmentId;
    }

    /**
     * Gets the customerId.
     *
     * The **customer_id** label that was specified in the header of the query or event API call that corresponds to
     * this log entry.
     *
     * @return the customerId
     */
    @AuraEnabled
    public String getCustomerId() {
      return customerId;
    }

    /**
     * Gets the documentType.
     *
     * The type of log entry returned.
     *
     *  **query** indicates that the log represents the results of a call to the single collection **query** method.
     *
     *  **event** indicates that the log represents  a call to the **events** API.
     *
     * @return the documentType
     */
    @AuraEnabled
    public String getDocumentType() {
      return documentType;
    }

    /**
     * Gets the naturalLanguageQuery.
     *
     * The value of the **natural_language_query** query parameter that was used to create these results. Only returned
     * with logs of type **query**.
     *
     * **Note:** Other query parameters (such as **filter** or **deduplicate**) might  have been used with this query,
     * but are not recorded.
     *
     * @return the naturalLanguageQuery
     */
    @AuraEnabled
    public String getNaturalLanguageQuery() {
      return naturalLanguageQuery;
    }

    /**
     * Gets the documentResults.
     *
     * Object containing result information that was returned by the query used to create this log entry. Only returned
     * with logs of type `query`.
     *
     * @return the documentResults
     */
    @AuraEnabled
    public LogQueryResponseResultDocuments getDocumentResults() {
      return documentResults;
    }

    /**
     * Gets the createdTimestamp.
     *
     * Date that the log result was created. Returned in `YYYY-MM-DDThh:mm:ssZ` format.
     *
     * @return the createdTimestamp
     */
    @AuraEnabled
    public Datetime getCreatedTimestamp() {
      return createdTimestamp;
    }

    /**
     * Gets the clientTimestamp.
     *
     * Date specified by the user when recording an event. Returned in `YYYY-MM-DDThh:mm:ssZ` format. Only returned with
     * logs of type **event**.
     *
     * @return the clientTimestamp
     */
    @AuraEnabled
    public Datetime getClientTimestamp() {
      return clientTimestamp;
    }

    /**
     * Gets the queryId.
     *
     * Identifier that corresponds to the **natural_language_query** string used in the original or associated query.
     * All **event** and **query** log entries that have the same original **natural_language_query** string also have
     * them same **query_id**. This field can be used to recall all **event** and **query** log results that have the
     * same original query (**event** logs do not contain the original **natural_language_query** field).
     *
     * @return the queryId
     */
    @AuraEnabled
    public String getQueryId() {
      return queryId;
    }

    /**
     * Gets the sessionToken.
     *
     * Unique identifier (within a 24-hour period) that identifies a single `query` log and any `event` logs that were
     * created for it.
     *
     * **Note:** If the exact same query is run at the exact same time on different days, the **session_token** for
     * those queries might be identical. However, the **created_timestamp** differs.
     *
     * **Note:** Session tokens are case sensitive. To avoid matching on session tokens that are identical except for
     * case, use the exact match operator (`::`) when you query for a specific session token.
     *
     * @return the sessionToken
     */
    @AuraEnabled
    public String getSessionToken() {
      return sessionToken;
    }

    /**
     * Gets the collectionId.
     *
     * The collection ID of the document associated with this event. Only returned with logs of type `event`.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the displayRank.
     *
     * The original display rank of the document associated with this event. Only returned with logs of type `event`.
     *
     * @return the displayRank
     */
    @AuraEnabled
    public Long getDisplayRank() {
      return displayRank;
    }

    /**
     * Gets the documentId.
     *
     * The document ID of the document associated with this event. Only returned with logs of type `event`.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the eventType.
     *
     * The type of event that this object respresents. Possible values are
     *
     *  -  `query` the log of a query to a collection
     *
     *  -  `click` the result of a call to the **events** endpoint.
     *
     * @return the eventType
     */
    @AuraEnabled
    public String getEventType() {
      return eventType;
    }

    /**
     * Gets the resultType.
     *
     * The type of result that this **event** is associated with. Only returned with logs of type `event`.
     *
     * @return the resultType
     */
    @AuraEnabled
    public String getResultType() {
      return resultType;
    }

    /**
     * Sets the environmentId.
     *
     * @param environmentId the new environmentId
     */
    public void setEnvironmentId(final String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Sets the customerId.
     *
     * @param customerId the new customerId
     */
    public void setCustomerId(final String customerId) {
      this.customerId = customerId;
    }

    /**
     * Sets the documentType.
     *
     * @param documentType the new documentType
     */
    public void setDocumentType(final String documentType) {
      this.documentType = documentType;
    }

    /**
     * Sets the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the new naturalLanguageQuery
     */
    public void setNaturalLanguageQuery(final String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
    }

    /**
     * Sets the documentResults.
     *
     * @param documentResults the new documentResults
     */
    public void setDocumentResults(final LogQueryResponseResultDocuments documentResults) {
      this.documentResults = documentResults;
    }

    /**
     * Sets the createdTimestamp.
     *
     * @param createdTimestamp the new createdTimestamp
     */
    public void setCreatedTimestamp(final Datetime createdTimestamp) {
      this.createdTimestamp = createdTimestamp;
    }

    /**
     * Sets the clientTimestamp.
     *
     * @param clientTimestamp the new clientTimestamp
     */
    public void setClientTimestamp(final Datetime clientTimestamp) {
      this.clientTimestamp = clientTimestamp;
    }

    /**
     * Sets the queryId.
     *
     * @param queryId the new queryId
     */
    public void setQueryId(final String queryId) {
      this.queryId = queryId;
    }

    /**
     * Sets the sessionToken.
     *
     * @param sessionToken the new sessionToken
     */
    public void setSessionToken(final String sessionToken) {
      this.sessionToken = sessionToken;
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
     * Sets the displayRank.
     *
     * @param displayRank the new displayRank
     */
    public void setDisplayRank(final long displayRank) {
      this.displayRank = displayRank;
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
     * Sets the eventType.
     *
     * @param eventType the new eventType
     */
    public void setEventType(final String eventType) {
      this.eventType = eventType;
    }

    /**
     * Sets the resultType.
     *
     * @param resultType the new resultType
     */
    public void setResultType(final String resultType) {
      this.resultType = resultType;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'environment_id' => 'environmentId',
        'customer_id' => 'customerId',
        'document_type' => 'documentType',
        'natural_language_query' => 'naturalLanguageQuery',
        'document_results' => 'documentResults',
        'created_timestamp' => 'createdTimestamp',
        'client_timestamp' => 'clientTimestamp',
        'query_id' => 'queryId',
        'session_token' => 'sessionToken',
        'collection_id' => 'collectionId',
        'display_rank' => 'displayRank',
        'document_id' => 'documentId',
        'event_type' => 'eventType',
        'result_type' => 'resultType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String createdTimestamp = (String) jsonMap.remove('createdTimestamp');
      String clientTimestamp = (String) jsonMap.remove('clientTimestamp');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      LogQueryResponseResult ret = (LogQueryResponseResult) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(createdTimestamp)) {
        ret.setCreatedTimestamp((Datetime) JSON.deserialize('"' + createdTimestamp + '"', Datetime.class));
      }
      if (String.isNotBlank(clientTimestamp)) {
        ret.setClientTimestamp((Datetime) JSON.deserialize('"' + clientTimestamp + '"', Datetime.class));
      }

      // calling custom deserializer for documentResults
      Map<String, Object> documentResultsMap = (Map<String, Object>) jsonMap.get('documentResults');
      LogQueryResponseResultDocuments newDocumentResults = (LogQueryResponseResultDocuments) new LogQueryResponseResultDocuments().deserialize(JSON.serialize(documentResultsMap, true), documentResultsMap, LogQueryResponseResultDocuments.class);
      ret.setDocumentResults(newDocumentResults);

      return ret;
    }
  }

  /**
   * Object containing result information that was returned by the query used to create this log entry. Only returned
   * with logs of type `query`.
   */
  public class LogQueryResponseResultDocuments extends IBMWatsonGenericModel {
    private List<LogQueryResponseResultDocumentsResult> results;
    private Long count;

    /**
     * Gets the results.
     *
     * Array of log query response results.
     *
     * @return the results
     */
    @AuraEnabled
    public List<LogQueryResponseResultDocumentsResult> getResults() {
      return results;
    }

    /**
     * Gets the count.
     *
     * The number of results returned in the query associate with this log.
     *
     * @return the count
     */
    @AuraEnabled
    public Long getCount() {
      return count;
    }

    /**
     * Sets the results.
     *
     * @param results the new results
     */
    public void setResults(final List<LogQueryResponseResultDocumentsResult> results) {
      this.results = results;
    }

    /**
     * Sets the count.
     *
     * @param count the new count
     */
    public void setCount(final long count) {
      this.count = count;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      LogQueryResponseResultDocuments ret = (LogQueryResponseResultDocuments) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for results
      List<LogQueryResponseResultDocumentsResult> newResults = new List<LogQueryResponseResultDocumentsResult>();
      List<LogQueryResponseResultDocumentsResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          LogQueryResponseResultDocumentsResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          LogQueryResponseResultDocumentsResult newItem = (LogQueryResponseResultDocumentsResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), LogQueryResponseResultDocumentsResult.class);
          newResults.add(newItem);
        }
        ret.results = newResults;
      }

      return ret;
    }
  }

  /**
   * Each object in the **results** array corresponds to an individual document returned by the original query.
   */
  public class LogQueryResponseResultDocumentsResult extends IBMWatsonGenericModel {
    private Long position;
    private String documentId;
    private Double score;
    private Double confidence;
    private String collectionId;

    /**
     * Gets the position.
     *
     * The result rank of this document. A position of `1` indicates that it was the first returned result.
     *
     * @return the position
     */
    @AuraEnabled
    public Long getPosition() {
      return position;
    }

    /**
     * Gets the documentId.
     *
     * The **document_id** of the document that this result represents.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the score.
     *
     * The raw score of this result. A higher score indicates a greater match to the query parameters.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Gets the confidence.
     *
     * The confidence score of the result's analysis. A higher score indicating greater confidence.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }

    /**
     * Gets the collectionId.
     *
     * The **collection_id** of the document represented by this result.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Sets the position.
     *
     * @param position the new position
     */
    public void setPosition(final long position) {
      this.position = position;
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
     * Sets the score.
     *
     * @param score the new score
     */
    public void setScore(final Double score) {
      this.score = score;
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
     * Sets the collectionId.
     *
     * @param collectionId the new collectionId
     */
    public void setCollectionId(final String collectionId) {
      this.collectionId = collectionId;
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

      LogQueryResponseResultDocumentsResult ret = (LogQueryResponseResultDocumentsResult) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * An aggregation analyzing log information for queries and events.
   */
  public class MetricAggregation extends IBMWatsonGenericModel {
    private String interval;
    private String eventType;
    private List<MetricAggregationResult> results;

    /**
     * Gets the interval.
     *
     * The measurement interval for this metric. Metric intervals are always 1 day (`1d`).
     *
     * @return the interval
     */
    @AuraEnabled
    public String getInterval() {
      return interval;
    }

    /**
     * Gets the eventType.
     *
     * The event type associated with this metric result. This field, when present, will always be `click`.
     *
     * @return the eventType
     */
    @AuraEnabled
    public String getEventType() {
      return eventType;
    }

    /**
     * Gets the results.
     *
     * Array of metric aggregation query results.
     *
     * @return the results
     */
    @AuraEnabled
    public List<MetricAggregationResult> getResults() {
      return results;
    }

    /**
     * Sets the interval.
     *
     * @param interval the new interval
     */
    public void setInterval(final String interval) {
      this.interval = interval;
    }

    /**
     * Sets the eventType.
     *
     * @param eventType the new eventType
     */
    public void setEventType(final String eventType) {
      this.eventType = eventType;
    }

    /**
     * Sets the results.
     *
     * @param results the new results
     */
    public void setResults(final List<MetricAggregationResult> results) {
      this.results = results;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'event_type' => 'eventType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MetricAggregation ret = (MetricAggregation) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for results
      List<MetricAggregationResult> newResults = new List<MetricAggregationResult>();
      List<MetricAggregationResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          MetricAggregationResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          MetricAggregationResult newItem = (MetricAggregationResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), MetricAggregationResult.class);
          newResults.add(newItem);
        }
        ret.results = newResults;
      }

      return ret;
    }
  }

  /**
   * Aggregation result data for the requested metric.
   */
  public class MetricAggregationResult extends IBMWatsonGenericModel {
    private Datetime keyAsString;
    private Long key;
    private Long matchingResults;
    private Double eventRate;

    /**
     * Gets the keyAsString.
     *
     * Date in string form representing the start of this interval.
     *
     * @return the keyAsString
     */
    @AuraEnabled
    public Datetime getKeyAsString() {
      return keyAsString;
    }

    /**
     * Gets the key.
     *
     * Unix epoch time equivalent of the **key_as_string**, that represents the start of this interval.
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
     * Number of matching results.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the eventRate.
     *
     * The number of queries with associated events divided by the total number of queries for the interval. Only
     * returned with **event_rate** metrics.
     *
     * @return the eventRate
     */
    @AuraEnabled
    public Double getEventRate() {
      return eventRate;
    }

    /**
     * Sets the keyAsString.
     *
     * @param keyAsString the new keyAsString
     */
    public void setKeyAsString(final Datetime keyAsString) {
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
     * Sets the eventRate.
     *
     * @param eventRate the new eventRate
     */
    public void setEventRate(final Double eventRate) {
      this.eventRate = eventRate;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'key_as_string' => 'keyAsString',
        'matching_results' => 'matchingResults',
        'event_rate' => 'eventRate'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String keyAsString = (String) jsonMap.remove('keyAsString');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      MetricAggregationResult ret = (MetricAggregationResult) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(keyAsString)) {
        ret.setKeyAsString((Datetime) JSON.deserialize('"' + keyAsString + '"', Datetime.class));
      }

      return ret;
    }
  }

  /**
   * The response generated from a call to a **metrics** method.
   */
  public class MetricResponse extends IBMWatsonResponseModel {
    private List<MetricAggregation> aggregations;

    /**
     * Gets the aggregations.
     *
     * Array of metric aggregations.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<MetricAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<MetricAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      MetricResponse ret = (MetricResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for aggregations
      List<MetricAggregation> newAggregations = new List<MetricAggregation>();
      List<MetricAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          MetricAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          MetricAggregation newItem = (MetricAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), MetricAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      return ret;
    }
  }

  /**
   * An aggregation analyzing log information for queries and events.
   */
  public class MetricTokenAggregation extends IBMWatsonGenericModel {
    private String eventType;
    private List<MetricTokenAggregationResult> results;

    /**
     * Gets the eventType.
     *
     * The event type associated with this metric result. This field, when present, will always be `click`.
     *
     * @return the eventType
     */
    @AuraEnabled
    public String getEventType() {
      return eventType;
    }

    /**
     * Gets the results.
     *
     * Array of results for the metric token aggregation.
     *
     * @return the results
     */
    @AuraEnabled
    public List<MetricTokenAggregationResult> getResults() {
      return results;
    }

    /**
     * Sets the eventType.
     *
     * @param eventType the new eventType
     */
    public void setEventType(final String eventType) {
      this.eventType = eventType;
    }

    /**
     * Sets the results.
     *
     * @param results the new results
     */
    public void setResults(final List<MetricTokenAggregationResult> results) {
      this.results = results;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'event_type' => 'eventType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MetricTokenAggregation ret = (MetricTokenAggregation) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for results
      List<MetricTokenAggregationResult> newResults = new List<MetricTokenAggregationResult>();
      List<MetricTokenAggregationResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          MetricTokenAggregationResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          MetricTokenAggregationResult newItem = (MetricTokenAggregationResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), MetricTokenAggregationResult.class);
          newResults.add(newItem);
        }
        ret.results = newResults;
      }

      return ret;
    }
  }

  /**
   * Aggregation result data for the requested metric.
   */
  public class MetricTokenAggregationResult extends IBMWatsonGenericModel {
    private String key;
    private Long matchingResults;
    private Double eventRate;

    /**
     * Gets the key.
     *
     * The content of the **natural_language_query** parameter used in the query that this result represents.
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
     * Number of matching results.
     *
     * @return the matchingResults
     */
    @AuraEnabled
    public Long getMatchingResults() {
      return matchingResults;
    }

    /**
     * Gets the eventRate.
     *
     * The number of queries with associated events divided by the total number of queries currently stored (queries and
     * events are stored in the log for 30 days).
     *
     * @return the eventRate
     */
    @AuraEnabled
    public Double getEventRate() {
      return eventRate;
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
     * Sets the eventRate.
     *
     * @param eventRate the new eventRate
     */
    public void setEventRate(final Double eventRate) {
      this.eventRate = eventRate;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults',
        'event_rate' => 'eventRate'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      MetricTokenAggregationResult ret = (MetricTokenAggregationResult) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The response generated from a call to a **metrics** method that evaluates tokens.
   */
  public class MetricTokenResponse extends IBMWatsonResponseModel {
    private List<MetricTokenAggregation> aggregations;

    /**
     * Gets the aggregations.
     *
     * Array of metric token aggregations.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<MetricTokenAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Sets the aggregations.
     *
     * @param aggregations the new aggregations
     */
    public void setAggregations(final List<MetricTokenAggregation> aggregations) {
      this.aggregations = aggregations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      MetricTokenResponse ret = (MetricTokenResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for aggregations
      List<MetricTokenAggregation> newAggregations = new List<MetricTokenAggregation>();
      List<MetricTokenAggregation> deserializedAggregations = ret.getAggregations();
      if (deserializedAggregations != null) {
        for (Integer i = 0; i < deserializedAggregations.size(); i++) {
          MetricTokenAggregation currentItem = ret.getAggregations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('aggregations');
          MetricTokenAggregation newItem = (MetricTokenAggregation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), MetricTokenAggregation.class);
          newAggregations.add(newItem);
        }
        ret.aggregations = newAggregations;
      }

      return ret;
    }
  }

  /**
   * An object that indicates the Categories enrichment will be applied to the specified field.
   */
  public class NluEnrichmentCategories extends IBMWatsonDynamicModel {
    private Map<String, Object> additionalProperties;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentCategories() { }

    /**
     * Gets the dynamic properties attached to NluEnrichmentCategories.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
    }

    private NluEnrichmentCategories(NluEnrichmentCategoriesBuilder builder) {
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentCategories builder
     */
    public NluEnrichmentCategoriesBuilder newBuilder() {
      return new NluEnrichmentCategoriesBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      NluEnrichmentCategories ret = (NluEnrichmentCategories) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentCategoriesBuilder retBuilder = ret.newBuilder();

      NluEnrichmentCategories builderResult = retBuilder.build();
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
   * NluEnrichmentCategories Builder.
   */
  public class NluEnrichmentCategoriesBuilder {

    private NluEnrichmentCategoriesBuilder(NluEnrichmentCategories nluEnrichmentCategories) {
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentCategoriesBuilder() { }

    /**
     * Builds a NluEnrichmentCategories.
     *
     * @return the nluEnrichmentCategories
     */
    public NluEnrichmentCategories build() {
      return new NluEnrichmentCategories(this);
    }
  }

  /**
   * An object specifiying the concepts enrichment and related parameters.
   */
  public class NluEnrichmentConcepts extends IBMWatsonGenericModel {
    private Long xLimit;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentConcepts() { }

    /**
     * Gets the xLimit.
     *
     * The maximum number of concepts enrichments to extact from each instance of the specified field.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }
  
    private NluEnrichmentConcepts(NluEnrichmentConceptsBuilder builder) {
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentConcepts builder
     */
    public NluEnrichmentConceptsBuilder newBuilder() {
      return new NluEnrichmentConceptsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limit' => 'xLimit'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      NluEnrichmentConcepts ret = (NluEnrichmentConcepts) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentConceptsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xLimit' => 'limit'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentConcepts Builder.
   */
  public class NluEnrichmentConceptsBuilder {
    private Long xLimit;

    private NluEnrichmentConceptsBuilder(NluEnrichmentConcepts nluEnrichmentConcepts) {
      this.xLimit = nluEnrichmentConcepts.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentConceptsBuilder() {
    }

    /**
     * Builds a NluEnrichmentConcepts.
     *
     * @return the nluEnrichmentConcepts
     */
    public NluEnrichmentConcepts build() {
      return new NluEnrichmentConcepts(this);
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the NluEnrichmentConcepts builder
     */
    public NluEnrichmentConceptsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * An object specifying the emotion detection enrichment and related parameters.
   */
  public class NluEnrichmentEmotion extends IBMWatsonGenericModel {
    private Boolean document;
    private List<String> targets;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentEmotion() { }

    /**
     * Gets the document.
     *
     * When `true`, emotion detection is performed on the entire field.
     *
     * @return the document
     */
    @AuraEnabled
    public Boolean getDocument() {
      return document;
    }

    /**
     * Gets the targets.
     *
     * A comma-separated list of target strings that will have any associated emotions detected.
     *
     * @return the targets
     */
    @AuraEnabled
    public List<String> getTargets() {
      return targets;
    }
  
    private NluEnrichmentEmotion(NluEnrichmentEmotionBuilder builder) {
      this.document = builder.document;
      this.targets = builder.targets;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentEmotion builder
     */
    public NluEnrichmentEmotionBuilder newBuilder() {
      return new NluEnrichmentEmotionBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      NluEnrichmentEmotion ret = (NluEnrichmentEmotion) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentEmotionBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentEmotion Builder.
   */
  public class NluEnrichmentEmotionBuilder {
    private Boolean document;
    private List<String> targets;

    private NluEnrichmentEmotionBuilder(NluEnrichmentEmotion nluEnrichmentEmotion) {
      this.document = nluEnrichmentEmotion.document;
      this.targets = nluEnrichmentEmotion.targets;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentEmotionBuilder() {
    }

    /**
     * Builds a NluEnrichmentEmotion.
     *
     * @return the nluEnrichmentEmotion
     */
    public NluEnrichmentEmotion build() {
      return new NluEnrichmentEmotion(this);
    }

    /**
     * Adds an targets to targets.
     *
     * @param targets the new targets
     * @return the NluEnrichmentEmotion builder
     */
    public NluEnrichmentEmotionBuilder addTargets(String targets) {
      IBMWatsonValidator.notNull(targets, 'targets cannot be null');
      if (this.targets == null) {
        this.targets = new List<String>();
      }
      this.targets.add(targets);
      return this;
    }

    /**
     * Set the document.
     *
     * @param document the document
     * @return the NluEnrichmentEmotion builder
     */
    public NluEnrichmentEmotionBuilder document(Boolean document) {
      this.document = document;
      return this;
    }

    /**
     * Set the targets.
     * Existing targets will be replaced.
     *
     * @param targets the targets
     * @return the NluEnrichmentEmotion builder
     */
    public NluEnrichmentEmotionBuilder targets(List<String> targets) {
      this.targets = targets;
      return this;
    }
  }

  /**
   * An object speficying the Entities enrichment and related parameters.
   */
  public class NluEnrichmentEntities extends IBMWatsonGenericModel {
    private Boolean sentiment;
    private Boolean emotion;
    private Long xLimit;
    private Boolean mentions;
    private Boolean mentionTypes;
    private Boolean sentenceLocations;
    private String model;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentEntities() { }

    /**
     * Gets the sentiment.
     *
     * When `true`, sentiment analysis of entities will be performed on the specified field.
     *
     * @return the sentiment
     */
    @AuraEnabled
    public Boolean getSentiment() {
      return sentiment;
    }

    /**
     * Gets the emotion.
     *
     * When `true`, emotion detection of entities will be performed on the specified field.
     *
     * @return the emotion
     */
    @AuraEnabled
    public Boolean getEmotion() {
      return emotion;
    }

    /**
     * Gets the xLimit.
     *
     * The maximum number of entities to extract for each instance of the specified field.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }

    /**
     * Gets the mentions.
     *
     * When `true`, the number of mentions of each identified entity is recorded. The default is `false`.
     *
     * @return the mentions
     */
    @AuraEnabled
    public Boolean getMentions() {
      return mentions;
    }

    /**
     * Gets the mentionTypes.
     *
     * When `true`, the types of mentions for each idetifieid entity is recorded. The default is `false`.
     *
     * @return the mentionTypes
     */
    @AuraEnabled
    public Boolean getMentionTypes() {
      return mentionTypes;
    }

    /**
     * Gets the sentenceLocations.
     *
     * When `true`, a list of sentence locations for each instance of each identified entity is recorded. The default is
     * `false`.
     *
     * @return the sentenceLocations
     */
    @AuraEnabled
    public Boolean getSentenceLocations() {
      return sentenceLocations;
    }

    /**
     * Gets the model.
     *
     * The enrichement model to use with entity extraction. May be a custom model provided by Watson Knowledge Studio,
     * or the default public model `alchemy`.
     *
     * @return the model
     */
    @AuraEnabled
    public String getModel() {
      return model;
    }
  
    private NluEnrichmentEntities(NluEnrichmentEntitiesBuilder builder) {
      this.sentiment = builder.sentiment;
      this.emotion = builder.emotion;
      this.xLimit = builder.xLimit;
      this.mentions = builder.mentions;
      this.mentionTypes = builder.mentionTypes;
      this.sentenceLocations = builder.sentenceLocations;
      this.model = builder.model;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder newBuilder() {
      return new NluEnrichmentEntitiesBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limit' => 'xLimit',
        'mention_types' => 'mentionTypes',
        'sentence_locations' => 'sentenceLocations'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      NluEnrichmentEntities ret = (NluEnrichmentEntities) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentEntitiesBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xLimit' => 'limit',
        'mentionTypes' => 'mention_types',
        'sentenceLocations' => 'sentence_locations'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentEntities Builder.
   */
  public class NluEnrichmentEntitiesBuilder {
    private Boolean sentiment;
    private Boolean emotion;
    private Long xLimit;
    private Boolean mentions;
    private Boolean mentionTypes;
    private Boolean sentenceLocations;
    private String model;

    private NluEnrichmentEntitiesBuilder(NluEnrichmentEntities nluEnrichmentEntities) {
      this.sentiment = nluEnrichmentEntities.sentiment;
      this.emotion = nluEnrichmentEntities.emotion;
      this.xLimit = nluEnrichmentEntities.xLimit;
      this.mentions = nluEnrichmentEntities.mentions;
      this.mentionTypes = nluEnrichmentEntities.mentionTypes;
      this.sentenceLocations = nluEnrichmentEntities.sentenceLocations;
      this.model = nluEnrichmentEntities.model;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentEntitiesBuilder() {
    }

    /**
     * Builds a NluEnrichmentEntities.
     *
     * @return the nluEnrichmentEntities
     */
    public NluEnrichmentEntities build() {
      return new NluEnrichmentEntities(this);
    }

    /**
     * Set the sentiment.
     *
     * @param sentiment the sentiment
     * @return the NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder sentiment(Boolean sentiment) {
      this.sentiment = sentiment;
      return this;
    }

    /**
     * Set the emotion.
     *
     * @param emotion the emotion
     * @return the NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder emotion(Boolean emotion) {
      this.emotion = emotion;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }

    /**
     * Set the mentions.
     *
     * @param mentions the mentions
     * @return the NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder mentions(Boolean mentions) {
      this.mentions = mentions;
      return this;
    }

    /**
     * Set the mentionTypes.
     *
     * @param mentionTypes the mentionTypes
     * @return the NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder mentionTypes(Boolean mentionTypes) {
      this.mentionTypes = mentionTypes;
      return this;
    }

    /**
     * Set the sentenceLocations.
     *
     * @param sentenceLocations the sentenceLocations
     * @return the NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder sentenceLocations(Boolean sentenceLocations) {
      this.sentenceLocations = sentenceLocations;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the NluEnrichmentEntities builder
     */
    public NluEnrichmentEntitiesBuilder model(String model) {
      this.model = model;
      return this;
    }
  }

  /**
   * Object containing Natural Language Understanding features to be used.
   */
  public class NluEnrichmentFeatures extends IBMWatsonGenericModel {
    private NluEnrichmentKeywords keywords;
    private NluEnrichmentEntities entities;
    private NluEnrichmentSentiment sentiment;
    private NluEnrichmentEmotion emotion;
    private NluEnrichmentCategories categories;
    private NluEnrichmentSemanticRoles semanticRoles;
    private NluEnrichmentRelations relations;
    private NluEnrichmentConcepts concepts;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentFeatures() { }

    /**
     * Gets the keywords.
     *
     * An object specifying the Keyword enrichment and related parameters.
     *
     * @return the keywords
     */
    @AuraEnabled
    public NluEnrichmentKeywords getKeywords() {
      return keywords;
    }

    /**
     * Gets the entities.
     *
     * An object speficying the Entities enrichment and related parameters.
     *
     * @return the entities
     */
    @AuraEnabled
    public NluEnrichmentEntities getEntities() {
      return entities;
    }

    /**
     * Gets the sentiment.
     *
     * An object specifying the sentiment extraction enrichment and related parameters.
     *
     * @return the sentiment
     */
    @AuraEnabled
    public NluEnrichmentSentiment getSentiment() {
      return sentiment;
    }

    /**
     * Gets the emotion.
     *
     * An object specifying the emotion detection enrichment and related parameters.
     *
     * @return the emotion
     */
    @AuraEnabled
    public NluEnrichmentEmotion getEmotion() {
      return emotion;
    }

    /**
     * Gets the categories.
     *
     * An object that indicates the Categories enrichment will be applied to the specified field.
     *
     * @return the categories
     */
    @AuraEnabled
    public NluEnrichmentCategories getCategories() {
      return categories;
    }

    /**
     * Gets the semanticRoles.
     *
     * An object specifiying the semantic roles enrichment and related parameters.
     *
     * @return the semanticRoles
     */
    @AuraEnabled
    public NluEnrichmentSemanticRoles getSemanticRoles() {
      return semanticRoles;
    }

    /**
     * Gets the relations.
     *
     * An object specifying the relations enrichment and related parameters.
     *
     * @return the relations
     */
    @AuraEnabled
    public NluEnrichmentRelations getRelations() {
      return relations;
    }

    /**
     * Gets the concepts.
     *
     * An object specifiying the concepts enrichment and related parameters.
     *
     * @return the concepts
     */
    @AuraEnabled
    public NluEnrichmentConcepts getConcepts() {
      return concepts;
    }
  
    private NluEnrichmentFeatures(NluEnrichmentFeaturesBuilder builder) {
      this.keywords = builder.keywords;
      this.entities = builder.entities;
      this.sentiment = builder.sentiment;
      this.emotion = builder.emotion;
      this.categories = builder.categories;
      this.semanticRoles = builder.semanticRoles;
      this.relations = builder.relations;
      this.concepts = builder.concepts;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder newBuilder() {
      return new NluEnrichmentFeaturesBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'semantic_roles' => 'semanticRoles'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      NluEnrichmentFeatures ret = (NluEnrichmentFeatures) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentFeaturesBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for keywords
      Map<String, Object> keywordsMap = (Map<String, Object>) jsonMap.get('keywords');
      NluEnrichmentKeywords newKeywords = (NluEnrichmentKeywords) new NluEnrichmentKeywords().deserialize(JSON.serialize(keywordsMap, true), keywordsMap, NluEnrichmentKeywords.class);
      retBuilder.keywords(newKeywords);

      // calling custom deserializer for entities
      Map<String, Object> entitiesMap = (Map<String, Object>) jsonMap.get('entities');
      NluEnrichmentEntities newEntities = (NluEnrichmentEntities) new NluEnrichmentEntities().deserialize(JSON.serialize(entitiesMap, true), entitiesMap, NluEnrichmentEntities.class);
      retBuilder.entities(newEntities);

      // calling custom deserializer for sentiment
      Map<String, Object> sentimentMap = (Map<String, Object>) jsonMap.get('sentiment');
      NluEnrichmentSentiment newSentiment = (NluEnrichmentSentiment) new NluEnrichmentSentiment().deserialize(JSON.serialize(sentimentMap, true), sentimentMap, NluEnrichmentSentiment.class);
      retBuilder.sentiment(newSentiment);

      // calling custom deserializer for emotion
      Map<String, Object> emotionMap = (Map<String, Object>) jsonMap.get('emotion');
      NluEnrichmentEmotion newEmotion = (NluEnrichmentEmotion) new NluEnrichmentEmotion().deserialize(JSON.serialize(emotionMap, true), emotionMap, NluEnrichmentEmotion.class);
      retBuilder.emotion(newEmotion);

      // calling custom deserializer for categories
      Map<String, Object> categoriesMap = (Map<String, Object>) jsonMap.get('categories');
      NluEnrichmentCategories newCategories = (NluEnrichmentCategories) new NluEnrichmentCategories().deserialize(JSON.serialize(categoriesMap, true), categoriesMap, NluEnrichmentCategories.class);
      retBuilder.categories(newCategories);

      // calling custom deserializer for semanticRoles
      Map<String, Object> semanticRolesMap = (Map<String, Object>) jsonMap.get('semanticRoles');
      NluEnrichmentSemanticRoles newSemanticRoles = (NluEnrichmentSemanticRoles) new NluEnrichmentSemanticRoles().deserialize(JSON.serialize(semanticRolesMap, true), semanticRolesMap, NluEnrichmentSemanticRoles.class);
      retBuilder.semanticRoles(newSemanticRoles);

      // calling custom deserializer for relations
      Map<String, Object> relationsMap = (Map<String, Object>) jsonMap.get('relations');
      NluEnrichmentRelations newRelations = (NluEnrichmentRelations) new NluEnrichmentRelations().deserialize(JSON.serialize(relationsMap, true), relationsMap, NluEnrichmentRelations.class);
      retBuilder.relations(newRelations);

      // calling custom deserializer for concepts
      Map<String, Object> conceptsMap = (Map<String, Object>) jsonMap.get('concepts');
      NluEnrichmentConcepts newConcepts = (NluEnrichmentConcepts) new NluEnrichmentConcepts().deserialize(JSON.serialize(conceptsMap, true), conceptsMap, NluEnrichmentConcepts.class);
      retBuilder.concepts(newConcepts);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'semanticRoles' => 'semantic_roles'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for keywords
      if (keywords != null) {
        String keywordsJsonString = JSON.serialize(keywords.replacePropertyNames(), true);
        String keywordsKey = 'keywords';
        if (propertyNameMapping.containsKey(keywordsKey)) {
          keywordsKey = propertyNameMapping.get(keywordsKey);
        }
        jsonMap.put(keywordsKey, JSON.deserializeUntyped(keywordsJsonString));
      }

      // performing custom serialization for entities
      if (entities != null) {
        String entitiesJsonString = JSON.serialize(entities.replacePropertyNames(), true);
        String entitiesKey = 'entities';
        if (propertyNameMapping.containsKey(entitiesKey)) {
          entitiesKey = propertyNameMapping.get(entitiesKey);
        }
        jsonMap.put(entitiesKey, JSON.deserializeUntyped(entitiesJsonString));
      }

      // performing custom serialization for sentiment
      if (sentiment != null) {
        String sentimentJsonString = JSON.serialize(sentiment.replacePropertyNames(), true);
        String sentimentKey = 'sentiment';
        if (propertyNameMapping.containsKey(sentimentKey)) {
          sentimentKey = propertyNameMapping.get(sentimentKey);
        }
        jsonMap.put(sentimentKey, JSON.deserializeUntyped(sentimentJsonString));
      }

      // performing custom serialization for emotion
      if (emotion != null) {
        String emotionJsonString = JSON.serialize(emotion.replacePropertyNames(), true);
        String emotionKey = 'emotion';
        if (propertyNameMapping.containsKey(emotionKey)) {
          emotionKey = propertyNameMapping.get(emotionKey);
        }
        jsonMap.put(emotionKey, JSON.deserializeUntyped(emotionJsonString));
      }

      // performing custom serialization for categories
      if (categories != null) {
        String categoriesJsonString = JSON.serialize(categories.replacePropertyNames(), true);
        String categoriesKey = 'categories';
        if (propertyNameMapping.containsKey(categoriesKey)) {
          categoriesKey = propertyNameMapping.get(categoriesKey);
        }
        jsonMap.put(categoriesKey, JSON.deserializeUntyped(categoriesJsonString));
      }

      // performing custom serialization for semanticRoles
      if (semanticRoles != null) {
        String semanticRolesJsonString = JSON.serialize(semanticRoles.replacePropertyNames(), true);
        String semanticRolesKey = 'semanticRoles';
        if (propertyNameMapping.containsKey(semanticRolesKey)) {
          semanticRolesKey = propertyNameMapping.get(semanticRolesKey);
        }
        jsonMap.put(semanticRolesKey, JSON.deserializeUntyped(semanticRolesJsonString));
      }

      // performing custom serialization for relations
      if (relations != null) {
        String relationsJsonString = JSON.serialize(relations.replacePropertyNames(), true);
        String relationsKey = 'relations';
        if (propertyNameMapping.containsKey(relationsKey)) {
          relationsKey = propertyNameMapping.get(relationsKey);
        }
        jsonMap.put(relationsKey, JSON.deserializeUntyped(relationsJsonString));
      }

      // performing custom serialization for concepts
      if (concepts != null) {
        String conceptsJsonString = JSON.serialize(concepts.replacePropertyNames(), true);
        String conceptsKey = 'concepts';
        if (propertyNameMapping.containsKey(conceptsKey)) {
          conceptsKey = propertyNameMapping.get(conceptsKey);
        }
        jsonMap.put(conceptsKey, JSON.deserializeUntyped(conceptsJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentFeatures Builder.
   */
  public class NluEnrichmentFeaturesBuilder {
    private NluEnrichmentKeywords keywords;
    private NluEnrichmentEntities entities;
    private NluEnrichmentSentiment sentiment;
    private NluEnrichmentEmotion emotion;
    private NluEnrichmentCategories categories;
    private NluEnrichmentSemanticRoles semanticRoles;
    private NluEnrichmentRelations relations;
    private NluEnrichmentConcepts concepts;

    private NluEnrichmentFeaturesBuilder(NluEnrichmentFeatures nluEnrichmentFeatures) {
      this.keywords = nluEnrichmentFeatures.keywords;
      this.entities = nluEnrichmentFeatures.entities;
      this.sentiment = nluEnrichmentFeatures.sentiment;
      this.emotion = nluEnrichmentFeatures.emotion;
      this.categories = nluEnrichmentFeatures.categories;
      this.semanticRoles = nluEnrichmentFeatures.semanticRoles;
      this.relations = nluEnrichmentFeatures.relations;
      this.concepts = nluEnrichmentFeatures.concepts;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentFeaturesBuilder() {
    }

    /**
     * Builds a NluEnrichmentFeatures.
     *
     * @return the nluEnrichmentFeatures
     */
    public NluEnrichmentFeatures build() {
      return new NluEnrichmentFeatures(this);
    }

    /**
     * Set the keywords.
     *
     * @param keywords the keywords
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder keywords(NluEnrichmentKeywords keywords) {
      this.keywords = keywords;
      return this;
    }

    /**
     * Set the entities.
     *
     * @param entities the entities
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder entities(NluEnrichmentEntities entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the sentiment.
     *
     * @param sentiment the sentiment
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder sentiment(NluEnrichmentSentiment sentiment) {
      this.sentiment = sentiment;
      return this;
    }

    /**
     * Set the emotion.
     *
     * @param emotion the emotion
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder emotion(NluEnrichmentEmotion emotion) {
      this.emotion = emotion;
      return this;
    }

    /**
     * Set the categories.
     *
     * @param categories the categories
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder categories(NluEnrichmentCategories categories) {
      this.categories = categories;
      return this;
    }

    /**
     * Set the semanticRoles.
     *
     * @param semanticRoles the semanticRoles
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder semanticRoles(NluEnrichmentSemanticRoles semanticRoles) {
      this.semanticRoles = semanticRoles;
      return this;
    }

    /**
     * Set the relations.
     *
     * @param relations the relations
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder relations(NluEnrichmentRelations relations) {
      this.relations = relations;
      return this;
    }

    /**
     * Set the concepts.
     *
     * @param concepts the concepts
     * @return the NluEnrichmentFeatures builder
     */
    public NluEnrichmentFeaturesBuilder concepts(NluEnrichmentConcepts concepts) {
      this.concepts = concepts;
      return this;
    }
  }

  /**
   * An object specifying the Keyword enrichment and related parameters.
   */
  public class NluEnrichmentKeywords extends IBMWatsonGenericModel {
    private Boolean sentiment;
    private Boolean emotion;
    private Long xLimit;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentKeywords() { }

    /**
     * Gets the sentiment.
     *
     * When `true`, sentiment analysis of keywords will be performed on the specified field.
     *
     * @return the sentiment
     */
    @AuraEnabled
    public Boolean getSentiment() {
      return sentiment;
    }

    /**
     * Gets the emotion.
     *
     * When `true`, emotion detection of keywords will be performed on the specified field.
     *
     * @return the emotion
     */
    @AuraEnabled
    public Boolean getEmotion() {
      return emotion;
    }

    /**
     * Gets the xLimit.
     *
     * The maximum number of keywords to extract for each instance of the specified field.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }
  
    private NluEnrichmentKeywords(NluEnrichmentKeywordsBuilder builder) {
      this.sentiment = builder.sentiment;
      this.emotion = builder.emotion;
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentKeywords builder
     */
    public NluEnrichmentKeywordsBuilder newBuilder() {
      return new NluEnrichmentKeywordsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limit' => 'xLimit'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      NluEnrichmentKeywords ret = (NluEnrichmentKeywords) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentKeywordsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xLimit' => 'limit'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentKeywords Builder.
   */
  public class NluEnrichmentKeywordsBuilder {
    private Boolean sentiment;
    private Boolean emotion;
    private Long xLimit;

    private NluEnrichmentKeywordsBuilder(NluEnrichmentKeywords nluEnrichmentKeywords) {
      this.sentiment = nluEnrichmentKeywords.sentiment;
      this.emotion = nluEnrichmentKeywords.emotion;
      this.xLimit = nluEnrichmentKeywords.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentKeywordsBuilder() {
    }

    /**
     * Builds a NluEnrichmentKeywords.
     *
     * @return the nluEnrichmentKeywords
     */
    public NluEnrichmentKeywords build() {
      return new NluEnrichmentKeywords(this);
    }

    /**
     * Set the sentiment.
     *
     * @param sentiment the sentiment
     * @return the NluEnrichmentKeywords builder
     */
    public NluEnrichmentKeywordsBuilder sentiment(Boolean sentiment) {
      this.sentiment = sentiment;
      return this;
    }

    /**
     * Set the emotion.
     *
     * @param emotion the emotion
     * @return the NluEnrichmentKeywords builder
     */
    public NluEnrichmentKeywordsBuilder emotion(Boolean emotion) {
      this.emotion = emotion;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the NluEnrichmentKeywords builder
     */
    public NluEnrichmentKeywordsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * An object specifying the relations enrichment and related parameters.
   */
  public class NluEnrichmentRelations extends IBMWatsonGenericModel {
    private String model;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentRelations() { }

    /**
     * Gets the model.
     *
     * *For use with `natural_language_understanding` enrichments only.* The enrichement model to use with relationship
     * extraction. May be a custom model provided by Watson Knowledge Studio, the default public model is`en-news`.
     *
     * @return the model
     */
    @AuraEnabled
    public String getModel() {
      return model;
    }
  
    private NluEnrichmentRelations(NluEnrichmentRelationsBuilder builder) {
      this.model = builder.model;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentRelations builder
     */
    public NluEnrichmentRelationsBuilder newBuilder() {
      return new NluEnrichmentRelationsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      NluEnrichmentRelations ret = (NluEnrichmentRelations) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentRelationsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentRelations Builder.
   */
  public class NluEnrichmentRelationsBuilder {
    private String model;

    private NluEnrichmentRelationsBuilder(NluEnrichmentRelations nluEnrichmentRelations) {
      this.model = nluEnrichmentRelations.model;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentRelationsBuilder() {
    }

    /**
     * Builds a NluEnrichmentRelations.
     *
     * @return the nluEnrichmentRelations
     */
    public NluEnrichmentRelations build() {
      return new NluEnrichmentRelations(this);
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the NluEnrichmentRelations builder
     */
    public NluEnrichmentRelationsBuilder model(String model) {
      this.model = model;
      return this;
    }
  }

  /**
   * An object specifiying the semantic roles enrichment and related parameters.
   */
  public class NluEnrichmentSemanticRoles extends IBMWatsonGenericModel {
    private Boolean entities;
    private Boolean keywords;
    private Long xLimit;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentSemanticRoles() { }

    /**
     * Gets the entities.
     *
     * When `true`, entities are extracted from the identified sentence parts.
     *
     * @return the entities
     */
    @AuraEnabled
    public Boolean getEntities() {
      return entities;
    }

    /**
     * Gets the keywords.
     *
     * When `true`, keywords are extracted from the identified sentence parts.
     *
     * @return the keywords
     */
    @AuraEnabled
    public Boolean getKeywords() {
      return keywords;
    }

    /**
     * Gets the xLimit.
     *
     * The maximum number of semantic roles enrichments to extact from each instance of the specified field.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }
  
    private NluEnrichmentSemanticRoles(NluEnrichmentSemanticRolesBuilder builder) {
      this.entities = builder.entities;
      this.keywords = builder.keywords;
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentSemanticRoles builder
     */
    public NluEnrichmentSemanticRolesBuilder newBuilder() {
      return new NluEnrichmentSemanticRolesBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limit' => 'xLimit'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      NluEnrichmentSemanticRoles ret = (NluEnrichmentSemanticRoles) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentSemanticRolesBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xLimit' => 'limit'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentSemanticRoles Builder.
   */
  public class NluEnrichmentSemanticRolesBuilder {
    private Boolean entities;
    private Boolean keywords;
    private Long xLimit;

    private NluEnrichmentSemanticRolesBuilder(NluEnrichmentSemanticRoles nluEnrichmentSemanticRoles) {
      this.entities = nluEnrichmentSemanticRoles.entities;
      this.keywords = nluEnrichmentSemanticRoles.keywords;
      this.xLimit = nluEnrichmentSemanticRoles.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentSemanticRolesBuilder() {
    }

    /**
     * Builds a NluEnrichmentSemanticRoles.
     *
     * @return the nluEnrichmentSemanticRoles
     */
    public NluEnrichmentSemanticRoles build() {
      return new NluEnrichmentSemanticRoles(this);
    }

    /**
     * Set the entities.
     *
     * @param entities the entities
     * @return the NluEnrichmentSemanticRoles builder
     */
    public NluEnrichmentSemanticRolesBuilder entities(Boolean entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the keywords.
     *
     * @param keywords the keywords
     * @return the NluEnrichmentSemanticRoles builder
     */
    public NluEnrichmentSemanticRolesBuilder keywords(Boolean keywords) {
      this.keywords = keywords;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the NluEnrichmentSemanticRoles builder
     */
    public NluEnrichmentSemanticRolesBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * An object specifying the sentiment extraction enrichment and related parameters.
   */
  public class NluEnrichmentSentiment extends IBMWatsonGenericModel {
    private Boolean document;
    private List<String> targets;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NluEnrichmentSentiment() { }

    /**
     * Gets the document.
     *
     * When `true`, sentiment analysis is performed on the entire field.
     *
     * @return the document
     */
    @AuraEnabled
    public Boolean getDocument() {
      return document;
    }

    /**
     * Gets the targets.
     *
     * A comma-separated list of target strings that will have any associated sentiment analyzed.
     *
     * @return the targets
     */
    @AuraEnabled
    public List<String> getTargets() {
      return targets;
    }
  
    private NluEnrichmentSentiment(NluEnrichmentSentimentBuilder builder) {
      this.document = builder.document;
      this.targets = builder.targets;
    }

    /**
     * New builder.
     *
     * @return a NluEnrichmentSentiment builder
     */
    public NluEnrichmentSentimentBuilder newBuilder() {
      return new NluEnrichmentSentimentBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      NluEnrichmentSentiment ret = (NluEnrichmentSentiment) super.deserialize(jsonString, jsonMap, classType);
      NluEnrichmentSentimentBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * NluEnrichmentSentiment Builder.
   */
  public class NluEnrichmentSentimentBuilder {
    private Boolean document;
    private List<String> targets;

    private NluEnrichmentSentimentBuilder(NluEnrichmentSentiment nluEnrichmentSentiment) {
      this.document = nluEnrichmentSentiment.document;
      this.targets = nluEnrichmentSentiment.targets;
    }

    /**
     * Instantiates a new builder.
     */
    public NluEnrichmentSentimentBuilder() {
    }

    /**
     * Builds a NluEnrichmentSentiment.
     *
     * @return the nluEnrichmentSentiment
     */
    public NluEnrichmentSentiment build() {
      return new NluEnrichmentSentiment(this);
    }

    /**
     * Adds an targets to targets.
     *
     * @param targets the new targets
     * @return the NluEnrichmentSentiment builder
     */
    public NluEnrichmentSentimentBuilder addTargets(String targets) {
      IBMWatsonValidator.notNull(targets, 'targets cannot be null');
      if (this.targets == null) {
        this.targets = new List<String>();
      }
      this.targets.add(targets);
      return this;
    }

    /**
     * Set the document.
     *
     * @param document the document
     * @return the NluEnrichmentSentiment builder
     */
    public NluEnrichmentSentimentBuilder document(Boolean document) {
      this.document = document;
      return this;
    }

    /**
     * Set the targets.
     * Existing targets will be replaced.
     *
     * @param targets the targets
     * @return the NluEnrichmentSentiment builder
     */
    public NluEnrichmentSentimentBuilder targets(List<String> targets) {
      this.targets = targets;
      return this;
    }
  }

  /**
   * Object containing normalization operations.
   */
  public class NormalizationOperation extends IBMWatsonGenericModel {
    private String operation;
    private String sourceField;
    private String destinationField;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public NormalizationOperation() { }

    /**
     * Gets the operation.
     *
     * Identifies what type of operation to perform.
     *
     * **copy** - Copies the value of the **source_field** to the **destination_field** field. If the
     * **destination_field** already exists, then the value of the **source_field** overwrites the original value of the
     * **destination_field**.
     *
     * **move** - Renames (moves) the **source_field** to the **destination_field**. If the **destination_field**
     * already exists, then the value of the **source_field** overwrites the original value of the
     * **destination_field**. Rename is identical to copy, except that the **source_field** is removed after the value
     * has been copied to the **destination_field** (it is the same as a _copy_ followed by a _remove_).
     *
     * **merge** - Merges the value of the **source_field** with the value of the **destination_field**. The
     * **destination_field** is converted into an array if it is not already an array, and the value of the
     * **source_field** is appended to the array. This operation removes the **source_field** after the merge. If the
     * **source_field** does not exist in the current document, then the **destination_field** is still converted into
     * an array (if it is not an array already). This conversion ensures the type for **destination_field** is
     * consistent across all documents.
     *
     * **remove** - Deletes the **source_field** field. The **destination_field** is ignored for this operation.
     *
     * **remove_nulls** - Removes all nested null (blank) field values from the ingested document. **source_field** and
     * **destination_field** are ignored by this operation because _remove_nulls_ operates on the entire ingested
     * document. Typically, **remove_nulls** is invoked as the last normalization operation (if it is invoked at all, it
     * can be time-expensive).
     *
     * @return the operation
     */
    @AuraEnabled
    public String getOperation() {
      return operation;
    }

    /**
     * Gets the sourceField.
     *
     * The source field for the operation.
     *
     * @return the sourceField
     */
    @AuraEnabled
    public String getSourceField() {
      return sourceField;
    }

    /**
     * Gets the destinationField.
     *
     * The destination field for the operation.
     *
     * @return the destinationField
     */
    @AuraEnabled
    public String getDestinationField() {
      return destinationField;
    }
  
    private NormalizationOperation(NormalizationOperationBuilder builder) {
      this.operation = builder.operation;
      this.sourceField = builder.sourceField;
      this.destinationField = builder.destinationField;
    }

    /**
     * New builder.
     *
     * @return a NormalizationOperation builder
     */
    public NormalizationOperationBuilder newBuilder() {
      return new NormalizationOperationBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'source_field' => 'sourceField',
        'destination_field' => 'destinationField'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      NormalizationOperation ret = (NormalizationOperation) super.deserialize(jsonString, jsonMap, classType);
      NormalizationOperationBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'sourceField' => 'source_field',
        'destinationField' => 'destination_field'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * NormalizationOperation Builder.
   */
  public class NormalizationOperationBuilder {
    private String operation;
    private String sourceField;
    private String destinationField;

    private NormalizationOperationBuilder(NormalizationOperation normalizationOperation) {
      this.operation = normalizationOperation.operation;
      this.sourceField = normalizationOperation.sourceField;
      this.destinationField = normalizationOperation.destinationField;
    }

    /**
     * Instantiates a new builder.
     */
    public NormalizationOperationBuilder() {
    }

    /**
     * Builds a NormalizationOperation.
     *
     * @return the normalizationOperation
     */
    public NormalizationOperation build() {
      return new NormalizationOperation(this);
    }

    /**
     * Set the operation.
     *
     * @param operation the operation
     * @return the NormalizationOperation builder
     */
    public NormalizationOperationBuilder operation(String operation) {
      this.operation = operation;
      return this;
    }

    /**
     * Set the sourceField.
     *
     * @param sourceField the sourceField
     * @return the NormalizationOperation builder
     */
    public NormalizationOperationBuilder sourceField(String sourceField) {
      this.sourceField = sourceField;
      return this;
    }

    /**
     * Set the destinationField.
     *
     * @param destinationField the destinationField
     * @return the NormalizationOperation builder
     */
    public NormalizationOperationBuilder destinationField(String destinationField) {
      this.destinationField = destinationField;
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
     * Ingestion or training step in which the notice occurred. Typical step values include: `classify_elements`,
     * `smartDocumentUnderstanding`, `ingestion`, `indexing`, `convert`. **Note:** This is not a complete list, other
     * values might be returned.
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
        'query_id' => 'queryId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String created = (String) jsonMap.remove('created');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      Notice ret = (Notice) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(created)) {
        ret.created = (Datetime) JSON.deserialize('"' + created + '"', Datetime.class);
      }

      return ret;
    }
  }

  /**
   * Object containing heading detection conversion settings for PDF documents.
   */
  public class PdfHeadingDetection extends IBMWatsonGenericModel {
    private List<FontSetting> fonts;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public PdfHeadingDetection() { }

    /**
     * Gets the fonts.
     *
     * Array of font matching configurations.
     *
     * @return the fonts
     */
    @AuraEnabled
    public List<FontSetting> getFonts() {
      return fonts;
    }
  
    private PdfHeadingDetection(PdfHeadingDetectionBuilder builder) {
      this.fonts = builder.fonts;
    }

    /**
     * New builder.
     *
     * @return a PdfHeadingDetection builder
     */
    public PdfHeadingDetectionBuilder newBuilder() {
      return new PdfHeadingDetectionBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      PdfHeadingDetection ret = (PdfHeadingDetection) super.deserialize(jsonString, jsonMap, classType);
      PdfHeadingDetectionBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for fonts
      List<FontSetting> newFonts = new List<FontSetting>();
      List<FontSetting> deserializedFonts = ret.getFonts();
      if (deserializedFonts != null) {
        for (Integer i = 0; i < deserializedFonts.size(); i++) {
          FontSetting currentItem = ret.getFonts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('fonts');
          FontSetting newItem = (FontSetting) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), FontSetting.class);
          newFonts.add(newItem);
        }
        retBuilder.fonts(newFonts);
      }

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for fonts
      if (fonts != null) {
        List<Object> fontsJsonList = new List<Object>();
        for (FontSetting listItem : fonts) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          fontsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('fonts', fontsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * PdfHeadingDetection Builder.
   */
  public class PdfHeadingDetectionBuilder {
    private List<FontSetting> fonts;

    private PdfHeadingDetectionBuilder(PdfHeadingDetection pdfHeadingDetection) {
      this.fonts = pdfHeadingDetection.fonts;
    }

    /**
     * Instantiates a new builder.
     */
    public PdfHeadingDetectionBuilder() {
    }

    /**
     * Builds a PdfHeadingDetection.
     *
     * @return the pdfHeadingDetection
     */
    public PdfHeadingDetection build() {
      return new PdfHeadingDetection(this);
    }

    /**
     * Adds an fonts to fonts.
     *
     * @param fonts the new fonts
     * @return the PdfHeadingDetection builder
     */
    public PdfHeadingDetectionBuilder addFonts(FontSetting fonts) {
      IBMWatsonValidator.notNull(fonts, 'fonts cannot be null');
      if (this.fonts == null) {
        this.fonts = new List<FontSetting>();
      }
      this.fonts.add(fonts);
      return this;
    }

    /**
     * Set the fonts.
     * Existing fonts will be replaced.
     *
     * @param fonts the fonts
     * @return the PdfHeadingDetection builder
     */
    public PdfHeadingDetectionBuilder fonts(List<FontSetting> fonts) {
      this.fonts = fonts;
      return this;
    }
  }

  /**
   * A list of PDF conversion settings.
   */
  public class PdfSettings extends IBMWatsonGenericModel {
    private PdfHeadingDetection heading;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public PdfSettings() { }

    /**
     * Gets the heading.
     *
     * Object containing heading detection conversion settings for PDF documents.
     *
     * @return the heading
     */
    @AuraEnabled
    public PdfHeadingDetection getHeading() {
      return heading;
    }
  
    private PdfSettings(PdfSettingsBuilder builder) {
      this.heading = builder.heading;
    }

    /**
     * New builder.
     *
     * @return a PdfSettings builder
     */
    public PdfSettingsBuilder newBuilder() {
      return new PdfSettingsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      PdfSettings ret = (PdfSettings) super.deserialize(jsonString, jsonMap, classType);
      PdfSettingsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for heading
      Map<String, Object> headingMap = (Map<String, Object>) jsonMap.get('heading');
      PdfHeadingDetection newHeading = (PdfHeadingDetection) new PdfHeadingDetection().deserialize(JSON.serialize(headingMap, true), headingMap, PdfHeadingDetection.class);
      retBuilder.heading(newHeading);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for heading
      if (heading != null) {
        String headingJsonString = JSON.serialize(heading.replacePropertyNames(), true);
        jsonMap.put('heading', JSON.deserializeUntyped(headingJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * PdfSettings Builder.
   */
  public class PdfSettingsBuilder {
    private PdfHeadingDetection heading;

    private PdfSettingsBuilder(PdfSettings pdfSettings) {
      this.heading = pdfSettings.heading;
    }

    /**
     * Instantiates a new builder.
     */
    public PdfSettingsBuilder() {
    }

    /**
     * Builds a PdfSettings.
     *
     * @return the pdfSettings
     */
    public PdfSettings build() {
      return new PdfSettings(this);
    }

    /**
     * Set the heading.
     *
     * @param heading the heading
     * @return the PdfSettings builder
     */
    public PdfSettingsBuilder heading(PdfHeadingDetection heading) {
      this.heading = heading;
      return this;
    }
  }

  /**
   * An aggregation produced by  Discovery to analyze the input provided.
   */
  public class QueryAggregation extends IBMWatsonGenericModel {
    private String xType;
    private List<AggregationResult> results;
    private Long matchingResults;
    private List<QueryAggregation> aggregations;
    private String field;
    private Long histogramInterval;
    private Double value;
    private Long count;
    private String match;
    private String path;
    private String timesliceInterval;
    private Boolean anomaly;
    private Long size;
    private TopHitsResults hits;

    /**
     * Gets the xType.
     *
     * The type of aggregation command used. For example: term, filter, max, min, etc.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the results.
     *
     * Array of aggregation results.
     *
     * @return the results
     */
    @AuraEnabled
    public List<AggregationResult> getResults() {
      return results;
    }

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
     * Gets the aggregations.
     *
     * Aggregations returned by Discovery.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Gets the field.
     *
     * The field where the aggregation is located in the document.
     *
     * @return the field
     */
    @AuraEnabled
    public String getField() {
      return field;
    }

    /**
     * Gets the histogramInterval.
     *
     * Interval of the aggregation. (For 'histogram' type).
     *
     * @return the histogramInterval
     */
    @AuraEnabled
    public Long getHistogramInterval() {
      return histogramInterval;
    }

    /**
     * Gets the value.
     *
     * Value of the aggregation.
     *
     * @return the value
     */
    @AuraEnabled
    public Double getValue() {
      return value;
    }

    /**
     * Gets the count.
     *
     * The number of terms identified.
     *
     * @return the count
     */
    @AuraEnabled
    public Long getCount() {
      return count;
    }

    /**
     * Gets the match.
     *
     * The match the aggregated results queried for.
     *
     * @return the match
     */
    @AuraEnabled
    public String getMatch() {
      return match;
    }

    /**
     * Gets the path.
     *
     * The area of the results the aggregation was restricted to.
     *
     * @return the path
     */
    @AuraEnabled
    public String getPath() {
      return path;
    }

    /**
     * Gets the timesliceInterval.
     *
     * Interval of the aggregation. Valid date interval values are second/seconds minute/minutes, hour/hours, day/days,
     * week/weeks, month/months, and year/years.
     *
     * @return the timesliceInterval
     */
    @AuraEnabled
    public String getTimesliceInterval() {
      return timesliceInterval;
    }

    /**
     * Gets the anomaly.
     *
     * Used to indicate that anomaly detection should be performed. Anomaly detection is used to locate unusual
     * datapoints within a time series.
     *
     * @return the anomaly
     */
    @AuraEnabled
    public Boolean getAnomaly() {
      return anomaly;
    }

    /**
     * Gets the size.
     *
     * Number of top hits returned by the aggregation.
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
     * Top hit information for this query.
     *
     * @return the hits
     */
    @AuraEnabled
    public TopHitsResults getHits() {
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
     * Sets the results.
     *
     * @param results the new results
     */
    public void setResults(final List<AggregationResult> results) {
      this.results = results;
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
     * Sets the field.
     *
     * @param field the new field
     */
    public void setField(final String field) {
      this.field = field;
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
     * Sets the value.
     *
     * @param value the new value
     */
    public void setValue(final Double value) {
      this.value = value;
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
     * Sets the match.
     *
     * @param match the new match
     */
    public void setMatch(final String match) {
      this.match = match;
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
     * Sets the timesliceInterval.
     *
     * @param timesliceInterval the new timesliceInterval
     */
    public void setTimesliceInterval(final String timesliceInterval) {
      this.timesliceInterval = timesliceInterval;
    }

    /**
     * Sets the anomaly.
     *
     * @param anomaly the new anomaly
     */
    public void setAnomaly(final Boolean anomaly) {
      this.anomaly = anomaly;
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
    public void setHits(final TopHitsResults hits) {
      this.hits = hits;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType',
        'matching_results' => 'matchingResults',
        'histogram_interval' => 'histogramInterval',
        'timeslice_interval' => 'timesliceInterval'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryAggregation ret = (QueryAggregation) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for results
      List<AggregationResult> newResults = new List<AggregationResult>();
      List<AggregationResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          AggregationResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          AggregationResult newItem = (AggregationResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), AggregationResult.class);
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

      // calling custom deserializer for hits
      Map<String, Object> hitsMap = (Map<String, Object>) jsonMap.get('hits');
      TopHitsResults newHits = (TopHitsResults) new TopHitsResults().deserialize(JSON.serialize(hitsMap, true), hitsMap, TopHitsResults.class);
      ret.setHits(newHits);

      return ret;
    }
  }

  /**
   * The queryLog options.
   */
  public class QueryLogOptions extends IBMWatsonOptionsModel {
    private String filter;
    private String query;
    private Long count;
    private Long offset;
    private List<String> xSort;

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

    /**
     * Gets the xSort.
     *
     * A comma-separated list of fields in the document to sort on. You can optionally specify a sort direction by
     * prefixing the field with `-` for descending or `+` for ascending. Ascending is the default sort direction if no
     * prefix is specified.
     *
     * @return the xSort
     */
    public List<String> xSort() {
      return xSort;
    }

    private QueryLogOptions(QueryLogOptionsBuilder builder) {
      filter = builder.filter;
      query = builder.query;
      count = builder.count;
      offset = builder.offset;
      xSort = builder.xSort;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a QueryLogOptions builder
     */
    public QueryLogOptionsBuilder newBuilder() {
      return new QueryLogOptionsBuilder(this);
    }
  }

  /**
   * QueryLogOptions Builder.
   */
  public class QueryLogOptionsBuilder extends IBMWatsonOptionsModel {
    private String filter;
    private String query;
    private Long count;
    private Long offset;
    private List<String> xSort;

    private QueryLogOptionsBuilder(QueryLogOptions queryLogOptions) {
      filter = queryLogOptions.filter;
      query = queryLogOptions.query;
      count = queryLogOptions.count;
      offset = queryLogOptions.offset;
      xSort = queryLogOptions.xSort;
      this.requestHeaders.putAll(queryLogOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public QueryLogOptionsBuilder() {
    }

    /**
     * Builds a QueryLogOptions.
     *
     * @return the queryLogOptions
     */
    public QueryLogOptions build() {
      return new QueryLogOptions(this);
    }

    /**
     * Adds an xSort to xSort.
     *
     * @param xSort the new xSort
     * @return the QueryLogOptions builder
     */
    public QueryLogOptionsBuilder addXSort(String xSort) {
      IBMWatsonValidator.notNull(xSort, 'xSort cannot be null');
      if (this.xSort == null) {
        this.xSort = new List<String>();
      }
      this.xSort.add(xSort);
      return this;
    }

    /**
     * Set the filter.
     *
     * @param filter the filter
     * @return the QueryLogOptions builder
     */
    public QueryLogOptionsBuilder filter(String filter) {
      this.filter = filter;
      return this;
    }

    /**
     * Set the query.
     *
     * @param query the query
     * @return the QueryLogOptions builder
     */
    public QueryLogOptionsBuilder query(String query) {
      this.query = query;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the QueryLogOptions builder
     */
    public QueryLogOptionsBuilder count(Long count) {
      this.count = count;
      return this;
    }

    /**
     * Set the offset.
     *
     * @param offset the offset
     * @return the QueryLogOptions builder
     */
    public QueryLogOptionsBuilder offset(Long offset) {
      this.offset = offset;
      return this;
    }

    /**
     * Set the xSort.
     * Existing xSort will be replaced.
     *
     * @param xSort the xSort
     * @return the QueryLogOptions builder
     */
    public QueryLogOptionsBuilder xSort(List<String> xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the QueryLogOptions builder
     */
    public QueryLogOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The queryNotices options.
   */
  public class QueryNoticesOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Boolean passages;
    private String aggregation;
    private Long count;
    private List<String> xReturn;
    private Long offset;
    private List<String> xSort;
    private Boolean highlight;
    private List<String> passagesFields;
    private Long passagesCount;
    private Long passagesCharacters;
    private String deduplicateField;
    private Boolean similar;
    private List<String> similarDocumentIds;
    private List<String> similarFields;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the passages.
     *
     * A passages query that returns the most relevant passages from the results.
     *
     * @return the passages
     */
    public Boolean passages() {
      return passages;
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
     * Number of results to return. The maximum for the **count** and **offset** values together in any one query is
     * **10000**.
     *
     * @return the count
     */
    public Long count() {
      return count;
    }

    /**
     * Gets the xReturn.
     *
     * A comma-separated list of the portion of the document hierarchy to return.
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
     * returned is 10 and the offset is 8, it returns the last two results. The maximum for the **count** and **offset**
     * values together in any one query is **10000**.
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
     * prefix is specified.
     *
     * @return the xSort
     */
    public List<String> xSort() {
      return xSort;
    }

    /**
     * Gets the highlight.
     *
     * When true, a highlight field is returned for each result which contains the fields which match the query with
     * `<em></em>` tags around the matching query terms.
     *
     * @return the highlight
     */
    public Boolean highlight() {
      return highlight;
    }

    /**
     * Gets the passagesFields.
     *
     * A comma-separated list of fields that passages are drawn from. If this parameter not specified, then all
     * top-level fields are included.
     *
     * @return the passagesFields
     */
    public List<String> passagesFields() {
      return passagesFields;
    }

    /**
     * Gets the passagesCount.
     *
     * The maximum number of passages to return. The search returns fewer passages if the requested total is not found.
     *
     * @return the passagesCount
     */
    public Long passagesCount() {
      return passagesCount;
    }

    /**
     * Gets the passagesCharacters.
     *
     * The approximate number of characters that any one passage will have.
     *
     * @return the passagesCharacters
     */
    public Long passagesCharacters() {
      return passagesCharacters;
    }

    /**
     * Gets the deduplicateField.
     *
     * When specified, duplicate results based on the field specified are removed from the returned results. Duplicate
     * comparison is limited to the current query only, **offset** is not considered. This parameter is currently Beta
     * functionality.
     *
     * @return the deduplicateField
     */
    public String deduplicateField() {
      return deduplicateField;
    }

    /**
     * Gets the similar.
     *
     * When `true`, results are returned based on their similarity to the document IDs specified in the
     * **similar.document_ids** parameter.
     *
     * @return the similar
     */
    public Boolean similar() {
      return similar;
    }

    /**
     * Gets the similarDocumentIds.
     *
     * A comma-separated list of document IDs to find similar documents.
     *
     * **Tip:** Include the **natural_language_query** parameter to expand the scope of the document similarity search
     * with the natural language query. Other query parameters, such as **filter** and **query**, are subsequently
     * applied and reduce the scope.
     *
     * @return the similarDocumentIds
     */
    public List<String> similarDocumentIds() {
      return similarDocumentIds;
    }

    /**
     * Gets the similarFields.
     *
     * A comma-separated list of field names that are used as a basis for comparison to identify similar documents. If
     * not specified, the entire document is used for comparison.
     *
     * @return the similarFields
     */
    public List<String> similarFields() {
      return similarFields;
    }

    private QueryNoticesOptions(QueryNoticesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      filter = builder.filter;
      query = builder.query;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      passages = builder.passages;
      aggregation = builder.aggregation;
      count = builder.count;
      xReturn = builder.xReturn;
      offset = builder.offset;
      xSort = builder.xSort;
      highlight = builder.highlight;
      passagesFields = builder.passagesFields;
      passagesCount = builder.passagesCount;
      passagesCharacters = builder.passagesCharacters;
      deduplicateField = builder.deduplicateField;
      similar = builder.similar;
      similarDocumentIds = builder.similarDocumentIds;
      similarFields = builder.similarFields;
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
    private String environmentId;
    private String collectionId;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Boolean passages;
    private String aggregation;
    private Long count;
    private List<String> xReturn;
    private Long offset;
    private List<String> xSort;
    private Boolean highlight;
    private List<String> passagesFields;
    private Long passagesCount;
    private Long passagesCharacters;
    private String deduplicateField;
    private Boolean similar;
    private List<String> similarDocumentIds;
    private List<String> similarFields;

    private QueryNoticesOptionsBuilder(QueryNoticesOptions queryNoticesOptions) {
      environmentId = queryNoticesOptions.environmentId;
      collectionId = queryNoticesOptions.collectionId;
      filter = queryNoticesOptions.filter;
      query = queryNoticesOptions.query;
      naturalLanguageQuery = queryNoticesOptions.naturalLanguageQuery;
      passages = queryNoticesOptions.passages;
      aggregation = queryNoticesOptions.aggregation;
      count = queryNoticesOptions.count;
      xReturn = queryNoticesOptions.xReturn;
      offset = queryNoticesOptions.offset;
      xSort = queryNoticesOptions.xSort;
      highlight = queryNoticesOptions.highlight;
      passagesFields = queryNoticesOptions.passagesFields;
      passagesCount = queryNoticesOptions.passagesCount;
      passagesCharacters = queryNoticesOptions.passagesCharacters;
      deduplicateField = queryNoticesOptions.deduplicateField;
      similar = queryNoticesOptions.similar;
      similarDocumentIds = queryNoticesOptions.similarDocumentIds;
      similarFields = queryNoticesOptions.similarFields;
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
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public QueryNoticesOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
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
     * Adds an xReturn to xReturn.
     *
     * @param xReturn the new xReturn
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder addXReturn(String xReturn) {
      IBMWatsonValidator.notNull(xReturn, 'xReturn cannot be null');
      if (this.xReturn == null) {
        this.xReturn = new List<String>();
      }
      this.xReturn.add(xReturn);
      return this;
    }

    /**
     * Adds an xSort to xSort.
     *
     * @param xSort the new xSort
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder addXSort(String xSort) {
      IBMWatsonValidator.notNull(xSort, 'xSort cannot be null');
      if (this.xSort == null) {
        this.xSort = new List<String>();
      }
      this.xSort.add(xSort);
      return this;
    }

    /**
     * Adds an passagesFields to passagesFields.
     *
     * @param passagesFields the new passagesFields
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder addPassagesFields(String passagesFields) {
      IBMWatsonValidator.notNull(passagesFields, 'passagesFields cannot be null');
      if (this.passagesFields == null) {
        this.passagesFields = new List<String>();
      }
      this.passagesFields.add(passagesFields);
      return this;
    }

    /**
     * Adds an similarDocumentIds to similarDocumentIds.
     *
     * @param similarDocumentIds the new similarDocumentIds
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder addSimilarDocumentIds(String similarDocumentIds) {
      IBMWatsonValidator.notNull(similarDocumentIds, 'similarDocumentIds cannot be null');
      if (this.similarDocumentIds == null) {
        this.similarDocumentIds = new List<String>();
      }
      this.similarDocumentIds.add(similarDocumentIds);
      return this;
    }

    /**
     * Adds an similarFields to similarFields.
     *
     * @param similarFields the new similarFields
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder addSimilarFields(String similarFields) {
      IBMWatsonValidator.notNull(similarFields, 'similarFields cannot be null');
      if (this.similarFields == null) {
        this.similarFields = new List<String>();
      }
      this.similarFields.add(similarFields);
      return this;
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
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
     * Set the passages.
     *
     * @param passages the passages
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder passages(Boolean passages) {
      this.passages = passages;
      return this;
    }

    /**
     * Set the aggregation.
     *
     * @param aggregation the aggregation
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder aggregation(String aggregation) {
      this.aggregation = aggregation;
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
     * Set the xReturn.
     * Existing xReturn will be replaced.
     *
     * @param xReturn the xReturn
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder xReturn(List<String> xReturn) {
      this.xReturn = xReturn;
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
     * Set the xSort.
     * Existing xSort will be replaced.
     *
     * @param xSort the xSort
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder xSort(List<String> xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the highlight.
     *
     * @param highlight the highlight
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder highlight(Boolean highlight) {
      this.highlight = highlight;
      return this;
    }

    /**
     * Set the passagesFields.
     * Existing passagesFields will be replaced.
     *
     * @param passagesFields the passagesFields
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder passagesFields(List<String> passagesFields) {
      this.passagesFields = passagesFields;
      return this;
    }

    /**
     * Set the passagesCount.
     *
     * @param passagesCount the passagesCount
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder passagesCount(Long passagesCount) {
      this.passagesCount = passagesCount;
      return this;
    }

    /**
     * Set the passagesCharacters.
     *
     * @param passagesCharacters the passagesCharacters
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder passagesCharacters(Long passagesCharacters) {
      this.passagesCharacters = passagesCharacters;
      return this;
    }

    /**
     * Set the deduplicateField.
     *
     * @param deduplicateField the deduplicateField
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder deduplicateField(String deduplicateField) {
      this.deduplicateField = deduplicateField;
      return this;
    }

    /**
     * Set the similar.
     *
     * @param similar the similar
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder similar(Boolean similar) {
      this.similar = similar;
      return this;
    }

    /**
     * Set the similarDocumentIds.
     * Existing similarDocumentIds will be replaced.
     *
     * @param similarDocumentIds the similarDocumentIds
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder similarDocumentIds(List<String> similarDocumentIds) {
      this.similarDocumentIds = similarDocumentIds;
      return this;
    }

    /**
     * Set the similarFields.
     * Existing similarFields will be replaced.
     *
     * @param similarFields the similarFields
     * @return the QueryNoticesOptions builder
     */
    public QueryNoticesOptionsBuilder similarFields(List<String> similarFields) {
      this.similarFields = similarFields;
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
    private List<QueryNoticesResult> results;
    private List<QueryAggregation> aggregations;
    private List<QueryPassages> passages;
    private Long duplicatesRemoved;

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
     * Gets the results.
     *
     * Array of document results that match the query.
     *
     * @return the results
     */
    @AuraEnabled
    public List<QueryNoticesResult> getResults() {
      return results;
    }

    /**
     * Gets the aggregations.
     *
     * Array of aggregation results that match the query.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Gets the passages.
     *
     * Array of passage results that match the query.
     *
     * @return the passages
     */
    @AuraEnabled
    public List<QueryPassages> getPassages() {
      return passages;
    }

    /**
     * Gets the duplicatesRemoved.
     *
     * The number of duplicates removed from this notices query.
     *
     * @return the duplicatesRemoved
     */
    @AuraEnabled
    public Long getDuplicatesRemoved() {
      return duplicatesRemoved;
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
    public void setResults(final List<QueryNoticesResult> results) {
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
     * Sets the passages.
     *
     * @param passages the new passages
     */
    public void setPassages(final List<QueryPassages> passages) {
      this.passages = passages;
    }

    /**
     * Sets the duplicatesRemoved.
     *
     * @param duplicatesRemoved the new duplicatesRemoved
     */
    public void setDuplicatesRemoved(final long duplicatesRemoved) {
      this.duplicatesRemoved = duplicatesRemoved;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults',
        'duplicates_removed' => 'duplicatesRemoved'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryNoticesResponse ret = (QueryNoticesResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for results
      List<QueryNoticesResult> newResults = new List<QueryNoticesResult>();
      List<QueryNoticesResult> deserializedResults = ret.getResults();
      if (deserializedResults != null) {
        for (Integer i = 0; i < deserializedResults.size(); i++) {
          QueryNoticesResult currentItem = ret.getResults().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('results');
          QueryNoticesResult newItem = (QueryNoticesResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryNoticesResult.class);
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

      // calling custom deserializer for passages
      List<QueryPassages> newPassages = new List<QueryPassages>();
      List<QueryPassages> deserializedPassages = ret.getPassages();
      if (deserializedPassages != null) {
        for (Integer i = 0; i < deserializedPassages.size(); i++) {
          QueryPassages currentItem = ret.getPassages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('passages');
          QueryPassages newItem = (QueryPassages) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryPassages.class);
          newPassages.add(newItem);
        }
        ret.passages = newPassages;
      }

      return ret;
    }
  }

  /**
   * Query result object.
   */
  public class QueryNoticesResult extends IBMWatsonDynamicModel {
    private String id;
    private IBMWatsonMapModel metadata;
    private String collectionId;
    private QueryResultMetadata resultMetadata;
    private Long code;
    private String filename;
    private String fileType;
    private String sha1;
    private List<Notice> notices;
    private Map<String, Object> additionalProperties;

    /**
     * Gets the id.
     *
     * @return the id
     */
    @AuraEnabled
    public String getId() {
      return id;
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
     * Gets the collectionId.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
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
     * Gets the code.
     *
     * @return the code
     */
    @AuraEnabled
    public Long getCode() {
      return code;
    }

    /**
     * Gets the filename.
     *
     * @return the filename
     */
    @AuraEnabled
    public String getFilename() {
      return filename;
    }

    /**
     * Gets the fileType.
     *
     * @return the fileType
     */
    @AuraEnabled
    public String getFileType() {
      return fileType;
    }

    /**
     * Gets the sha1.
     *
     * @return the sha1
     */
    @AuraEnabled
    public String getSha1() {
      return sha1;
    }

    /**
     * Gets the notices.
     *
     * @return the notices
     */
    @AuraEnabled
    public List<Notice> getNotices() {
      return notices;
    }

    /**
     * Gets the dynamic properties attached to QueryNoticesResult.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
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
     * Sets the metadata.
     *
     * @param metadata the new metadata
     */
    public void setMetadata(final IBMWatsonMapModel metadata) {
      this.metadata = metadata;
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
     * Sets the resultMetadata.
     *
     * @param resultMetadata the new resultMetadata
     */
    public void setResultMetadata(final QueryResultMetadata resultMetadata) {
      this.resultMetadata = resultMetadata;
    }

    /**
     * Sets the code.
     *
     * @param code the new code
     */
    public void setCode(final Long code) {
      this.code = code;
    }

    /**
     * Sets the filename.
     *
     * @param filename the new filename
     */
    public void setFilename(final String filename) {
      this.filename = filename;
    }

    /**
     * Sets the fileType.
     *
     * @param fileType the new fileType
     */
    public void setFileType(final String fileType) {
      this.fileType = fileType;
    }

    /**
     * Sets the sha1.
     *
     * @param sha1 the new sha1
     */
    public void setSha1(final String sha1) {
      this.sha1 = sha1;
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
        'collection_id' => 'collectionId',
        'result_metadata' => 'resultMetadata',
        'file_type' => 'fileType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryNoticesResult ret = (QueryNoticesResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      IBMWatsonMapModel newMetadata = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(metadataMap, true), metadataMap, IBMWatsonMapModel.class);
      ret.setMetadata(newMetadata);

      // calling custom deserializer for resultMetadata
      Map<String, Object> resultMetadataMap = (Map<String, Object>) jsonMap.get('resultMetadata');
      QueryResultMetadata newResultMetadata = (QueryResultMetadata) new QueryResultMetadata().deserialize(JSON.serialize(resultMetadataMap, true), resultMetadataMap, QueryResultMetadata.class);
      ret.setResultMetadata(newResultMetadata);

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
        ret.setNotices(newNotices);
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
   * The query options.
   */
  public class QueryOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Boolean passages;
    private String aggregation;
    private Long count;
    private String xReturn;
    private Long offset;
    private String xSort;
    private Boolean highlight;
    private String passagesFields;
    private Long passagesCount;
    private Long passagesCharacters;
    private Boolean deduplicate;
    private String deduplicateField;
    private Boolean similar;
    private String similarDocumentIds;
    private String similarFields;
    private String bias;
    private Boolean spellingSuggestions;
    private Boolean xWatsonLoggingOptOut;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the passages.
     *
     * A passages query that returns the most relevant passages from the results.
     *
     * @return the passages
     */
    public Boolean passages() {
      return passages;
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
     * A comma-separated list of the portion of the document hierarchy to return.
     *
     * @return the xReturn
     */
    public String xReturn() {
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
     * When true, a highlight field is returned for each result which contains the fields which match the query with
     * `<em></em>` tags around the matching query terms.
     *
     * @return the highlight
     */
    public Boolean highlight() {
      return highlight;
    }

    /**
     * Gets the passagesFields.
     *
     * A comma-separated list of fields that passages are drawn from. If this parameter not specified, then all
     * top-level fields are included.
     *
     * @return the passagesFields
     */
    public String passagesFields() {
      return passagesFields;
    }

    /**
     * Gets the passagesCount.
     *
     * The maximum number of passages to return. The search returns fewer passages if the requested total is not found.
     * The default is `10`. The maximum is `100`.
     *
     * @return the passagesCount
     */
    public Long passagesCount() {
      return passagesCount;
    }

    /**
     * Gets the passagesCharacters.
     *
     * The approximate number of characters that any one passage will have.
     *
     * @return the passagesCharacters
     */
    public Long passagesCharacters() {
      return passagesCharacters;
    }

    /**
     * Gets the deduplicate.
     *
     * When `true`, and used with a Watson Discovery News collection, duplicate results (based on the contents of the
     * **title** field) are removed. Duplicate comparison is limited to the current query only; **offset** is not
     * considered. This parameter is currently Beta functionality.
     *
     * @return the deduplicate
     */
    public Boolean deduplicate() {
      return deduplicate;
    }

    /**
     * Gets the deduplicateField.
     *
     * When specified, duplicate results based on the field specified are removed from the returned results. Duplicate
     * comparison is limited to the current query only, **offset** is not considered. This parameter is currently Beta
     * functionality.
     *
     * @return the deduplicateField
     */
    public String deduplicateField() {
      return deduplicateField;
    }

    /**
     * Gets the similar.
     *
     * When `true`, results are returned based on their similarity to the document IDs specified in the
     * **similar.document_ids** parameter.
     *
     * @return the similar
     */
    public Boolean similar() {
      return similar;
    }

    /**
     * Gets the similarDocumentIds.
     *
     * A comma-separated list of document IDs to find similar documents.
     *
     * **Tip:** Include the **natural_language_query** parameter to expand the scope of the document similarity search
     * with the natural language query. Other query parameters, such as **filter** and **query**, are subsequently
     * applied and reduce the scope.
     *
     * @return the similarDocumentIds
     */
    public String similarDocumentIds() {
      return similarDocumentIds;
    }

    /**
     * Gets the similarFields.
     *
     * A comma-separated list of field names that are used as a basis for comparison to identify similar documents. If
     * not specified, the entire document is used for comparison.
     *
     * @return the similarFields
     */
    public String similarFields() {
      return similarFields;
    }

    /**
     * Gets the bias.
     *
     * Field which the returned results will be biased against. The specified field must be either a **date** or
     * **number** format. When a **date** type field is specified returned results are biased towards field values
     * closer to the current date. When a **number** type field is specified, returned results are biased towards higher
     * field values. This parameter cannot be used in the same query as the **sort** parameter.
     *
     * @return the bias
     */
    public String bias() {
      return bias;
    }

    /**
     * Gets the spellingSuggestions.
     *
     * When `true` and the **natural_language_query** parameter is used, the **natural_languge_query** parameter is
     * spell checked. The most likely correction is retunred in the **suggested_query** field of the response (if one
     * exists).
     *
     * **Important:** this parameter is only valid when using the Cloud Pak version of Discovery.
     *
     * @return the spellingSuggestions
     */
    public Boolean spellingSuggestions() {
      return spellingSuggestions;
    }

    /**
     * Gets the xWatsonLoggingOptOut.
     *
     * If `true`, queries are not stored in the Discovery **Logs** endpoint.
     *
     * @return the xWatsonLoggingOptOut
     */
    public Boolean xWatsonLoggingOptOut() {
      return xWatsonLoggingOptOut;
    }

    private QueryOptions(QueryOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      filter = builder.filter;
      query = builder.query;
      naturalLanguageQuery = builder.naturalLanguageQuery;
      passages = builder.passages;
      aggregation = builder.aggregation;
      count = builder.count;
      xReturn = builder.xReturn;
      offset = builder.offset;
      xSort = builder.xSort;
      highlight = builder.highlight;
      passagesFields = builder.passagesFields;
      passagesCount = builder.passagesCount;
      passagesCharacters = builder.passagesCharacters;
      deduplicate = builder.deduplicate;
      deduplicateField = builder.deduplicateField;
      similar = builder.similar;
      similarDocumentIds = builder.similarDocumentIds;
      similarFields = builder.similarFields;
      bias = builder.bias;
      spellingSuggestions = builder.spellingSuggestions;
      xWatsonLoggingOptOut = builder.xWatsonLoggingOptOut;
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
    private String environmentId;
    private String collectionId;
    private String filter;
    private String query;
    private String naturalLanguageQuery;
    private Boolean passages;
    private String aggregation;
    private Long count;
    private String xReturn;
    private Long offset;
    private String xSort;
    private Boolean highlight;
    private String passagesFields;
    private Long passagesCount;
    private Long passagesCharacters;
    private Boolean deduplicate;
    private String deduplicateField;
    private Boolean similar;
    private String similarDocumentIds;
    private String similarFields;
    private String bias;
    private Boolean spellingSuggestions;
    private Boolean xWatsonLoggingOptOut;

    private QueryOptionsBuilder(QueryOptions queryOptions) {
      environmentId = queryOptions.environmentId;
      collectionId = queryOptions.collectionId;
      filter = queryOptions.filter;
      query = queryOptions.query;
      naturalLanguageQuery = queryOptions.naturalLanguageQuery;
      passages = queryOptions.passages;
      aggregation = queryOptions.aggregation;
      count = queryOptions.count;
      xReturn = queryOptions.xReturn;
      offset = queryOptions.offset;
      xSort = queryOptions.xSort;
      highlight = queryOptions.highlight;
      passagesFields = queryOptions.passagesFields;
      passagesCount = queryOptions.passagesCount;
      passagesCharacters = queryOptions.passagesCharacters;
      deduplicate = queryOptions.deduplicate;
      deduplicateField = queryOptions.deduplicateField;
      similar = queryOptions.similar;
      similarDocumentIds = queryOptions.similarDocumentIds;
      similarFields = queryOptions.similarFields;
      bias = queryOptions.bias;
      spellingSuggestions = queryOptions.spellingSuggestions;
      xWatsonLoggingOptOut = queryOptions.xWatsonLoggingOptOut;
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
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     */
    public QueryOptionsBuilder(String environmentId, String collectionId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
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
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
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
     * Set the passages.
     *
     * @param passages the passages
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder passages(Boolean passages) {
      this.passages = passages;
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
     *
     * @param xReturn the xReturn
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder xReturn(String xReturn) {
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
     * Set the passagesFields.
     *
     * @param passagesFields the passagesFields
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder passagesFields(String passagesFields) {
      this.passagesFields = passagesFields;
      return this;
    }

    /**
     * Set the passagesCount.
     *
     * @param passagesCount the passagesCount
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder passagesCount(Long passagesCount) {
      this.passagesCount = passagesCount;
      return this;
    }

    /**
     * Set the passagesCharacters.
     *
     * @param passagesCharacters the passagesCharacters
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder passagesCharacters(Long passagesCharacters) {
      this.passagesCharacters = passagesCharacters;
      return this;
    }

    /**
     * Set the deduplicate.
     *
     * @param deduplicate the deduplicate
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder deduplicate(Boolean deduplicate) {
      this.deduplicate = deduplicate;
      return this;
    }

    /**
     * Set the deduplicateField.
     *
     * @param deduplicateField the deduplicateField
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder deduplicateField(String deduplicateField) {
      this.deduplicateField = deduplicateField;
      return this;
    }

    /**
     * Set the similar.
     *
     * @param similar the similar
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder similar(Boolean similar) {
      this.similar = similar;
      return this;
    }

    /**
     * Set the similarDocumentIds.
     *
     * @param similarDocumentIds the similarDocumentIds
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder similarDocumentIds(String similarDocumentIds) {
      this.similarDocumentIds = similarDocumentIds;
      return this;
    }

    /**
     * Set the similarFields.
     *
     * @param similarFields the similarFields
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder similarFields(String similarFields) {
      this.similarFields = similarFields;
      return this;
    }

    /**
     * Set the bias.
     *
     * @param bias the bias
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder bias(String bias) {
      this.bias = bias;
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
     * Set the xWatsonLoggingOptOut.
     *
     * @param xWatsonLoggingOptOut the xWatsonLoggingOptOut
     * @return the QueryOptions builder
     */
    public QueryOptionsBuilder xWatsonLoggingOptOut(Boolean xWatsonLoggingOptOut) {
      this.xWatsonLoggingOptOut = xWatsonLoggingOptOut;
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
   * A passage query result.
   */
  public class QueryPassages extends IBMWatsonGenericModel {
    private String documentId;
    private Double passageScore;
    private String passageText;
    private Long startOffset;
    private Long endOffset;
    private String field;

    /**
     * Gets the documentId.
     *
     * The unique identifier of the document from which the passage has been extracted.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the passageScore.
     *
     * The confidence score of the passages's analysis. A higher score indicates greater confidence.
     *
     * @return the passageScore
     */
    @AuraEnabled
    public Double getPassageScore() {
      return passageScore;
    }

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
     * Sets the documentId.
     *
     * @param documentId the new documentId
     */
    public void setDocumentId(final String documentId) {
      this.documentId = documentId;
    }

    /**
     * Sets the passageScore.
     *
     * @param passageScore the new passageScore
     */
    public void setPassageScore(final Double passageScore) {
      this.passageScore = passageScore;
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
        'document_id' => 'documentId',
        'passage_score' => 'passageScore',
        'passage_text' => 'passageText',
        'start_offset' => 'startOffset',
        'end_offset' => 'endOffset'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      QueryPassages ret = (QueryPassages) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A response containing the documents and aggregations for the query.
   */
  public class QueryResponse extends IBMWatsonResponseModel {
    private Long matchingResults;
    private List<QueryResult> results;
    private List<QueryAggregation> aggregations;
    private List<QueryPassages> passages;
    private Long duplicatesRemoved;
    private String sessionToken;
    private RetrievalDetails retrievalDetails;
    private String suggestedQuery;

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
     * Array of aggregation results for the query.
     *
     * @return the aggregations
     */
    @AuraEnabled
    public List<QueryAggregation> getAggregations() {
      return aggregations;
    }

    /**
     * Gets the passages.
     *
     * Array of passage results for the query.
     *
     * @return the passages
     */
    @AuraEnabled
    public List<QueryPassages> getPassages() {
      return passages;
    }

    /**
     * Gets the duplicatesRemoved.
     *
     * The number of duplicate results removed.
     *
     * @return the duplicatesRemoved
     */
    @AuraEnabled
    public Long getDuplicatesRemoved() {
      return duplicatesRemoved;
    }

    /**
     * Gets the sessionToken.
     *
     * The session token for this query. The session token can be used to add events associated with this query to the
     * query and event log.
     *
     * **Important:** Session tokens are case sensitive.
     *
     * @return the sessionToken
     */
    @AuraEnabled
    public String getSessionToken() {
      return sessionToken;
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
     * The suggestions for a misspelled natural language query.
     *
     * @return the suggestedQuery
     */
    @AuraEnabled
    public String getSuggestedQuery() {
      return suggestedQuery;
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
     * Sets the passages.
     *
     * @param passages the new passages
     */
    public void setPassages(final List<QueryPassages> passages) {
      this.passages = passages;
    }

    /**
     * Sets the duplicatesRemoved.
     *
     * @param duplicatesRemoved the new duplicatesRemoved
     */
    public void setDuplicatesRemoved(final long duplicatesRemoved) {
      this.duplicatesRemoved = duplicatesRemoved;
    }

    /**
     * Sets the sessionToken.
     *
     * @param sessionToken the new sessionToken
     */
    public void setSessionToken(final String sessionToken) {
      this.sessionToken = sessionToken;
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

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'matching_results' => 'matchingResults',
        'duplicates_removed' => 'duplicatesRemoved',
        'session_token' => 'sessionToken',
        'retrieval_details' => 'retrievalDetails',
        'suggested_query' => 'suggestedQuery'
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

      // calling custom deserializer for passages
      List<QueryPassages> newPassages = new List<QueryPassages>();
      List<QueryPassages> deserializedPassages = ret.getPassages();
      if (deserializedPassages != null) {
        for (Integer i = 0; i < deserializedPassages.size(); i++) {
          QueryPassages currentItem = ret.getPassages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('passages');
          QueryPassages newItem = (QueryPassages) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryPassages.class);
          newPassages.add(newItem);
        }
        ret.passages = newPassages;
      }

      // calling custom deserializer for retrievalDetails
      Map<String, Object> retrievalDetailsMap = (Map<String, Object>) jsonMap.get('retrievalDetails');
      RetrievalDetails newRetrievalDetails = (RetrievalDetails) new RetrievalDetails().deserialize(JSON.serialize(retrievalDetailsMap, true), retrievalDetailsMap, RetrievalDetails.class);
      ret.setRetrievalDetails(newRetrievalDetails);

      return ret;
    }
  }

  /**
   * Query result object.
   */
  public class QueryResult extends IBMWatsonDynamicModel {
    private String id;
    private IBMWatsonMapModel metadata;
    private String collectionId;
    private QueryResultMetadata resultMetadata;
    private Map<String, Object> additionalProperties;

    /**
     * Gets the id.
     *
     * @return the id
     */
    @AuraEnabled
    public String getId() {
      return id;
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
     * Gets the collectionId.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
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
     * Gets the dynamic properties attached to QueryResult.
     *
     * @return the dynamic properties
     */
    @AuraEnabled
    public Map<String, Object> getAdditionalProperties() {
      return this.getDynamicProperties();
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
     * Sets the metadata.
     *
     * @param metadata the new metadata
     */
    public void setMetadata(final IBMWatsonMapModel metadata) {
      this.metadata = metadata;
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
     * Sets the resultMetadata.
     *
     * @param resultMetadata the new resultMetadata
     */
    public void setResultMetadata(final QueryResultMetadata resultMetadata) {
      this.resultMetadata = resultMetadata;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'collection_id' => 'collectionId',
        'result_metadata' => 'resultMetadata'
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
    private Double score;
    private Double confidence;

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
     * Gets the confidence.
     *
     * The confidence score for the given result. Calculated based on how relevant the result is estimated to be.
     * confidence can range from `0.0` to `1.0`. The higher the number, the more relevant the document. The `confidence`
     * value for a result was calculated using the model specified in the `document_retrieval_strategy` field of the
     * result set.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }

    /**
     * Sets the score.
     *
     * @param score the new score
     */
    public void setScore(final Double score) {
      this.score = score;
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

      QueryResultMetadata ret = (QueryResultMetadata) super.deserialize(jsonString, jsonMap, classType);

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
     * Indentifies the document retrieval strategy used for this query. `relevancy_training` indicates that the results
     * were returned using a relevancy trained model. `continuous_relevancy_training` indicates that the results were
     * returned using the continuous relevancy training model created by result feedback analysis. `untrained` means the
     * results were returned using the standard untrained model.
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
   * Object containing smart document understanding information for this collection.
   */
  public class SduStatus extends IBMWatsonGenericModel {
    private Boolean enabled;
    private Long totalAnnotatedPages;
    private Long totalPages;
    private Long totalDocuments;
    private SduStatusCustomFields customFields;

    /**
     * Gets the enabled.
     *
     * When `true`, smart document understanding conversion is enabled for this collection. All collections created with
     * a version date after `2019-04-30` have smart document understanding enabled. If `false`, documents added to the
     * collection are converted using the **conversion** settings specified in the configuration associated with the
     * collection.
     *
     * @return the enabled
     */
    @AuraEnabled
    public Boolean getEnabled() {
      return enabled;
    }

    /**
     * Gets the totalAnnotatedPages.
     *
     * The total number of pages annotated using smart document understanding in this collection.
     *
     * @return the totalAnnotatedPages
     */
    @AuraEnabled
    public Long getTotalAnnotatedPages() {
      return totalAnnotatedPages;
    }

    /**
     * Gets the totalPages.
     *
     * The current number of pages that can be used for training smart document understanding. The `total_pages` number
     * is calculated as the total number of pages identified from the documents listed in the **total_documents** field.
     *
     * @return the totalPages
     */
    @AuraEnabled
    public Long getTotalPages() {
      return totalPages;
    }

    /**
     * Gets the totalDocuments.
     *
     * The total number of documents in this collection that can be used to train smart document understanding. For
     * **lite** plan collections, the maximum is the first 20 uploaded documents (not including HTML or JSON documents).
     * For other plans, the maximum is the first 40 uploaded documents (not including HTML or JSON documents). When the
     * maximum is reached, additional documents uploaded to the collection are not considered for training smart
     * document understanding.
     *
     * @return the totalDocuments
     */
    @AuraEnabled
    public Long getTotalDocuments() {
      return totalDocuments;
    }

    /**
     * Gets the customFields.
     *
     * Information about custom smart document understanding fields that exist in this collection.
     *
     * @return the customFields
     */
    @AuraEnabled
    public SduStatusCustomFields getCustomFields() {
      return customFields;
    }

    /**
     * Sets the enabled.
     *
     * @param enabled the new enabled
     */
    public void setEnabled(final Boolean enabled) {
      this.enabled = enabled;
    }

    /**
     * Sets the totalAnnotatedPages.
     *
     * @param totalAnnotatedPages the new totalAnnotatedPages
     */
    public void setTotalAnnotatedPages(final long totalAnnotatedPages) {
      this.totalAnnotatedPages = totalAnnotatedPages;
    }

    /**
     * Sets the totalPages.
     *
     * @param totalPages the new totalPages
     */
    public void setTotalPages(final long totalPages) {
      this.totalPages = totalPages;
    }

    /**
     * Sets the totalDocuments.
     *
     * @param totalDocuments the new totalDocuments
     */
    public void setTotalDocuments(final long totalDocuments) {
      this.totalDocuments = totalDocuments;
    }

    /**
     * Sets the customFields.
     *
     * @param customFields the new customFields
     */
    public void setCustomFields(final SduStatusCustomFields customFields) {
      this.customFields = customFields;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'total_annotated_pages' => 'totalAnnotatedPages',
        'total_pages' => 'totalPages',
        'total_documents' => 'totalDocuments',
        'custom_fields' => 'customFields'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SduStatus ret = (SduStatus) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for customFields
      Map<String, Object> customFieldsMap = (Map<String, Object>) jsonMap.get('customFields');
      SduStatusCustomFields newCustomFields = (SduStatusCustomFields) new SduStatusCustomFields().deserialize(JSON.serialize(customFieldsMap, true), customFieldsMap, SduStatusCustomFields.class);
      ret.setCustomFields(newCustomFields);

      return ret;
    }
  }

  /**
   * Information about custom smart document understanding fields that exist in this collection.
   */
  public class SduStatusCustomFields extends IBMWatsonGenericModel {
    private Long defined;
    private Long maximumAllowed;

    /**
     * Gets the defined.
     *
     * The number of custom fields defined for this collection.
     *
     * @return the defined
     */
    @AuraEnabled
    public Long getDefined() {
      return defined;
    }

    /**
     * Gets the maximumAllowed.
     *
     * The maximum number of custom fields that are allowed in this collection.
     *
     * @return the maximumAllowed
     */
    @AuraEnabled
    public Long getMaximumAllowed() {
      return maximumAllowed;
    }

    /**
     * Sets the defined.
     *
     * @param defined the new defined
     */
    public void setDefined(final long defined) {
      this.defined = defined;
    }

    /**
     * Sets the maximumAllowed.
     *
     * @param maximumAllowed the new maximumAllowed
     */
    public void setMaximumAllowed(final long maximumAllowed) {
      this.maximumAllowed = maximumAllowed;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'maximum_allowed' => 'maximumAllowed'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SduStatusCustomFields ret = (SduStatusCustomFields) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Information about the Continuous Relevancy Training for this environment.
   */
  public class SearchStatus extends IBMWatsonGenericModel {
    private String scope;
    private String status;
    private String statusDescription;
    private Datetime lastTrained;

    /**
     * Gets the scope.
     *
     * Current scope of the training. Always returned as `environment`.
     *
     * @return the scope
     */
    @AuraEnabled
    public String getScope() {
      return scope;
    }

    /**
     * Gets the status.
     *
     * The current status of Continuous Relevancy Training for this environment.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the statusDescription.
     *
     * Long description of the current Continuous Relevancy Training status.
     *
     * @return the statusDescription
     */
    @AuraEnabled
    public String getStatusDescription() {
      return statusDescription;
    }

    /**
     * Gets the lastTrained.
     *
     * The date stamp of the most recent completed training for this environment.
     *
     * @return the lastTrained
     */
    @AuraEnabled
    public Datetime getLastTrained() {
      return lastTrained;
    }

    /**
     * Sets the scope.
     *
     * @param scope the new scope
     */
    public void setScope(final String scope) {
      this.scope = scope;
    }

    /**
     * Sets the status.
     *
     * @param status the new status
     */
    public void setStatus(final String status) {
      this.status = status;
    }

    /**
     * Sets the statusDescription.
     *
     * @param statusDescription the new statusDescription
     */
    public void setStatusDescription(final String statusDescription) {
      this.statusDescription = statusDescription;
    }

    /**
     * Sets the lastTrained.
     *
     * @param lastTrained the new lastTrained
     */
    public void setLastTrained(final Datetime lastTrained) {
      this.lastTrained = lastTrained;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'status_description' => 'statusDescription',
        'last_trained' => 'lastTrained'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String lastTrained = (String) jsonMap.remove('lastTrained');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      SearchStatus ret = (SearchStatus) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(lastTrained)) {
        ret.setLastTrained((Datetime) JSON.deserialize('"' + lastTrained + '"', Datetime.class));
      }

      return ret;
    }
  }

  /**
   * A list of Document Segmentation settings.
   */
  public class SegmentSettings extends IBMWatsonGenericModel {
    private Boolean enabled;
    private List<String> selectorTags;
    private List<String> annotatedFields;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SegmentSettings() { }

    /**
     * Gets the enabled.
     *
     * Enables/disables the Document Segmentation feature.
     *
     * @return the enabled
     */
    @AuraEnabled
    public Boolean getEnabled() {
      return enabled;
    }

    /**
     * Gets the selectorTags.
     *
     * Defines the heading level that splits into document segments. Valid values are h1, h2, h3, h4, h5, h6. The
     * content of the header field that the segmentation splits at is used as the **title** field for that segmented
     * result. Only valid if used with a collection that has **enabled** set to `false` in the
     * **smart_document_understanding** object.
     *
     * @return the selectorTags
     */
    @AuraEnabled
    public List<String> getSelectorTags() {
      return selectorTags;
    }

    /**
     * Gets the annotatedFields.
     *
     * Defines the annotated smart document understanding fields that the document is split on. The content of the
     * annotated field that the segmentation splits at is used as the **title** field for that segmented result. For
     * example, if the field `sub-title` is specified, when a document is uploaded each time the smart documement
     * understanding conversion encounters a field of type `sub-title` the document is split at that point and the
     * content of the field used as the title of the remaining content. Thnis split is performed for all instances of
     * the listed fields in the uploaded document. Only valid if used with a collection that has **enabled** set to
     * `true` in the **smart_document_understanding** object.
     *
     * @return the annotatedFields
     */
    @AuraEnabled
    public List<String> getAnnotatedFields() {
      return annotatedFields;
    }
  
    private SegmentSettings(SegmentSettingsBuilder builder) {
      this.enabled = builder.enabled;
      this.selectorTags = builder.selectorTags;
      this.annotatedFields = builder.annotatedFields;
    }

    /**
     * New builder.
     *
     * @return a SegmentSettings builder
     */
    public SegmentSettingsBuilder newBuilder() {
      return new SegmentSettingsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'selector_tags' => 'selectorTags',
        'annotated_fields' => 'annotatedFields'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SegmentSettings ret = (SegmentSettings) super.deserialize(jsonString, jsonMap, classType);
      SegmentSettingsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'selectorTags' => 'selector_tags',
        'annotatedFields' => 'annotated_fields'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * SegmentSettings Builder.
   */
  public class SegmentSettingsBuilder {
    private Boolean enabled;
    private List<String> selectorTags;
    private List<String> annotatedFields;

    private SegmentSettingsBuilder(SegmentSettings segmentSettings) {
      this.enabled = segmentSettings.enabled;
      this.selectorTags = segmentSettings.selectorTags;
      this.annotatedFields = segmentSettings.annotatedFields;
    }

    /**
     * Instantiates a new builder.
     */
    public SegmentSettingsBuilder() {
    }

    /**
     * Builds a SegmentSettings.
     *
     * @return the segmentSettings
     */
    public SegmentSettings build() {
      return new SegmentSettings(this);
    }

    /**
     * Adds an selectorTags to selectorTags.
     *
     * @param selectorTags the new selectorTags
     * @return the SegmentSettings builder
     */
    public SegmentSettingsBuilder addSelectorTags(String selectorTags) {
      IBMWatsonValidator.notNull(selectorTags, 'selectorTags cannot be null');
      if (this.selectorTags == null) {
        this.selectorTags = new List<String>();
      }
      this.selectorTags.add(selectorTags);
      return this;
    }

    /**
     * Adds an annotatedFields to annotatedFields.
     *
     * @param annotatedFields the new annotatedFields
     * @return the SegmentSettings builder
     */
    public SegmentSettingsBuilder addAnnotatedFields(String annotatedFields) {
      IBMWatsonValidator.notNull(annotatedFields, 'annotatedFields cannot be null');
      if (this.annotatedFields == null) {
        this.annotatedFields = new List<String>();
      }
      this.annotatedFields.add(annotatedFields);
      return this;
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the SegmentSettings builder
     */
    public SegmentSettingsBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }

    /**
     * Set the selectorTags.
     * Existing selectorTags will be replaced.
     *
     * @param selectorTags the selectorTags
     * @return the SegmentSettings builder
     */
    public SegmentSettingsBuilder selectorTags(List<String> selectorTags) {
      this.selectorTags = selectorTags;
      return this;
    }

    /**
     * Set the annotatedFields.
     * Existing annotatedFields will be replaced.
     *
     * @param annotatedFields the annotatedFields
     * @return the SegmentSettings builder
     */
    public SegmentSettingsBuilder annotatedFields(List<String> annotatedFields) {
      this.annotatedFields = annotatedFields;
      return this;
    }
  }

  /**
   * Object containing source parameters for the configuration.
   */
  public class Source extends IBMWatsonGenericModel {
    private String xType;
    private String credentialId;
    private SourceSchedule schedule;
    private SourceOptions options;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Source() { }

    /**
     * Gets the xType.
     *
     * The type of source to connect to.
     * -  `box` indicates the configuration is to connect an instance of Enterprise Box.
     * -  `salesforce` indicates the configuration is to connect to Salesforce.
     * -  `sharepoint` indicates the configuration is to connect to Microsoft SharePoint Online.
     * -  `web_crawl` indicates the configuration is to perform a web page crawl.
     * -  `cloud_object_storage` indicates the configuration is to connect to a cloud object store.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the credentialId.
     *
     * The **credential_id** of the credentials to use to connect to the source. Credentials are defined using the
     * **credentials** method. The **source_type** of the credentials used must match the **type** field specified in
     * this object.
     *
     * @return the credentialId
     */
    @AuraEnabled
    public String getCredentialId() {
      return credentialId;
    }

    /**
     * Gets the schedule.
     *
     * Object containing the schedule information for the source.
     *
     * @return the schedule
     */
    @AuraEnabled
    public SourceSchedule getSchedule() {
      return schedule;
    }

    /**
     * Gets the options.
     *
     * The **options** object defines which items to crawl from the source system.
     *
     * @return the options
     */
    @AuraEnabled
    public SourceOptions getOptions() {
      return options;
    }
  
    private Source(SourceBuilder builder) {
      this.xType = builder.xType;
      this.credentialId = builder.credentialId;
      this.schedule = builder.schedule;
      this.options = builder.options;
    }

    /**
     * New builder.
     *
     * @return a Source builder
     */
    public SourceBuilder newBuilder() {
      return new SourceBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType',
        'credential_id' => 'credentialId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Source ret = (Source) super.deserialize(jsonString, jsonMap, classType);
      SourceBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for schedule
      Map<String, Object> scheduleMap = (Map<String, Object>) jsonMap.get('schedule');
      SourceSchedule newSchedule = (SourceSchedule) new SourceSchedule().deserialize(JSON.serialize(scheduleMap, true), scheduleMap, SourceSchedule.class);
      retBuilder.schedule(newSchedule);

      // calling custom deserializer for options
      Map<String, Object> optionsMap = (Map<String, Object>) jsonMap.get('options');
      SourceOptions newOptions = (SourceOptions) new SourceOptions().deserialize(JSON.serialize(optionsMap, true), optionsMap, SourceOptions.class);
      retBuilder.options(newOptions);

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
        'credentialId' => 'credential_id'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for schedule
      if (schedule != null) {
        String scheduleJsonString = JSON.serialize(schedule.replacePropertyNames(), true);
        String scheduleKey = 'schedule';
        if (propertyNameMapping.containsKey(scheduleKey)) {
          scheduleKey = propertyNameMapping.get(scheduleKey);
        }
        jsonMap.put(scheduleKey, JSON.deserializeUntyped(scheduleJsonString));
      }

      // performing custom serialization for options
      if (options != null) {
        String optionsJsonString = JSON.serialize(options.replacePropertyNames(), true);
        String optionsKey = 'options';
        if (propertyNameMapping.containsKey(optionsKey)) {
          optionsKey = propertyNameMapping.get(optionsKey);
        }
        jsonMap.put(optionsKey, JSON.deserializeUntyped(optionsJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * Source Builder.
   */
  public class SourceBuilder {
    private String xType;
    private String credentialId;
    private SourceSchedule schedule;
    private SourceOptions options;

    private SourceBuilder(Source source) {
      this.xType = source.xType;
      this.credentialId = source.credentialId;
      this.schedule = source.schedule;
      this.options = source.options;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceBuilder() {
    }

    /**
     * Builds a Source.
     *
     * @return the source
     */
    public Source build() {
      return new Source(this);
    }

    /**
     * Set the xType.
     *
     * @param xType the xType
     * @return the Source builder
     */
    public SourceBuilder xType(String xType) {
      this.xType = xType;
      return this;
    }

    /**
     * Set the credentialId.
     *
     * @param credentialId the credentialId
     * @return the Source builder
     */
    public SourceBuilder credentialId(String credentialId) {
      this.credentialId = credentialId;
      return this;
    }

    /**
     * Set the schedule.
     *
     * @param schedule the schedule
     * @return the Source builder
     */
    public SourceBuilder schedule(SourceSchedule schedule) {
      this.schedule = schedule;
      return this;
    }

    /**
     * Set the options.
     *
     * @param options the options
     * @return the Source builder
     */
    public SourceBuilder options(SourceOptions options) {
      this.options = options;
      return this;
    }
  }

  /**
   * The **options** object defines which items to crawl from the source system.
   */
  public class SourceOptions extends IBMWatsonGenericModel {
    private List<SourceOptionsFolder> folders;
    private List<SourceOptionsObject> objects;
    private List<SourceOptionsSiteColl> siteCollections;
    private List<SourceOptionsWebCrawl> urls;
    private List<SourceOptionsBuckets> buckets;
    private Boolean crawlAllBuckets;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SourceOptions() { }

    /**
     * Gets the folders.
     *
     * Array of folders to crawl from the Box source. Only valid, and required, when the **type** field of the
     * **source** object is set to `box`.
     *
     * @return the folders
     */
    @AuraEnabled
    public List<SourceOptionsFolder> getFolders() {
      return folders;
    }

    /**
     * Gets the objects.
     *
     * Array of Salesforce document object types to crawl from the Salesforce source. Only valid, and required, when the
     * **type** field of the **source** object is set to `salesforce`.
     *
     * @return the objects
     */
    @AuraEnabled
    public List<SourceOptionsObject> getObjects() {
      return objects;
    }

    /**
     * Gets the siteCollections.
     *
     * Array of Microsoft SharePointoint Online site collections to crawl from the SharePoint source. Only valid and
     * required when the **type** field of the **source** object is set to `sharepoint`.
     *
     * @return the siteCollections
     */
    @AuraEnabled
    public List<SourceOptionsSiteColl> getSiteCollections() {
      return siteCollections;
    }

    /**
     * Gets the urls.
     *
     * Array of Web page URLs to begin crawling the web from. Only valid and required when the **type** field of the
     * **source** object is set to `web_crawl`.
     *
     * @return the urls
     */
    @AuraEnabled
    public List<SourceOptionsWebCrawl> getUrls() {
      return urls;
    }

    /**
     * Gets the buckets.
     *
     * Array of cloud object store buckets to begin crawling. Only valid and required when the **type** field of the
     * **source** object is set to `cloud_object_store`, and the **crawl_all_buckets** field is `false` or not
     * specified.
     *
     * @return the buckets
     */
    @AuraEnabled
    public List<SourceOptionsBuckets> getBuckets() {
      return buckets;
    }

    /**
     * Gets the crawlAllBuckets.
     *
     * When `true`, all buckets in the specified cloud object store are crawled. If set to `true`, the **buckets** array
     * must not be specified.
     *
     * @return the crawlAllBuckets
     */
    @AuraEnabled
    public Boolean getCrawlAllBuckets() {
      return crawlAllBuckets;
    }
  
    private SourceOptions(SourceOptionsBuilder builder) {
      this.folders = builder.folders;
      this.objects = builder.objects;
      this.siteCollections = builder.siteCollections;
      this.urls = builder.urls;
      this.buckets = builder.buckets;
      this.crawlAllBuckets = builder.crawlAllBuckets;
    }

    /**
     * New builder.
     *
     * @return a SourceOptions builder
     */
    public SourceOptionsBuilder newBuilder() {
      return new SourceOptionsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'site_collections' => 'siteCollections',
        'crawl_all_buckets' => 'crawlAllBuckets'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SourceOptions ret = (SourceOptions) super.deserialize(jsonString, jsonMap, classType);
      SourceOptionsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for folders
      List<SourceOptionsFolder> newFolders = new List<SourceOptionsFolder>();
      List<SourceOptionsFolder> deserializedFolders = ret.getFolders();
      if (deserializedFolders != null) {
        for (Integer i = 0; i < deserializedFolders.size(); i++) {
          SourceOptionsFolder currentItem = ret.getFolders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('folders');
          SourceOptionsFolder newItem = (SourceOptionsFolder) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SourceOptionsFolder.class);
          newFolders.add(newItem);
        }
        retBuilder.folders(newFolders);
      }

      // calling custom deserializer for objects
      List<SourceOptionsObject> newObjects = new List<SourceOptionsObject>();
      List<SourceOptionsObject> deserializedObjects = ret.getObjects();
      if (deserializedObjects != null) {
        for (Integer i = 0; i < deserializedObjects.size(); i++) {
          SourceOptionsObject currentItem = ret.getObjects().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('objects');
          SourceOptionsObject newItem = (SourceOptionsObject) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SourceOptionsObject.class);
          newObjects.add(newItem);
        }
        retBuilder.objects(newObjects);
      }

      // calling custom deserializer for siteCollections
      List<SourceOptionsSiteColl> newSiteCollections = new List<SourceOptionsSiteColl>();
      List<SourceOptionsSiteColl> deserializedSiteCollections = ret.getSiteCollections();
      if (deserializedSiteCollections != null) {
        for (Integer i = 0; i < deserializedSiteCollections.size(); i++) {
          SourceOptionsSiteColl currentItem = ret.getSiteCollections().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('siteCollections');
          SourceOptionsSiteColl newItem = (SourceOptionsSiteColl) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SourceOptionsSiteColl.class);
          newSiteCollections.add(newItem);
        }
        retBuilder.siteCollections(newSiteCollections);
      }

      // calling custom deserializer for urls
      List<SourceOptionsWebCrawl> newUrls = new List<SourceOptionsWebCrawl>();
      List<SourceOptionsWebCrawl> deserializedUrls = ret.getUrls();
      if (deserializedUrls != null) {
        for (Integer i = 0; i < deserializedUrls.size(); i++) {
          SourceOptionsWebCrawl currentItem = ret.getUrls().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('urls');
          SourceOptionsWebCrawl newItem = (SourceOptionsWebCrawl) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SourceOptionsWebCrawl.class);
          newUrls.add(newItem);
        }
        retBuilder.urls(newUrls);
      }

      // calling custom deserializer for buckets
      List<SourceOptionsBuckets> newBuckets = new List<SourceOptionsBuckets>();
      List<SourceOptionsBuckets> deserializedBuckets = ret.getBuckets();
      if (deserializedBuckets != null) {
        for (Integer i = 0; i < deserializedBuckets.size(); i++) {
          SourceOptionsBuckets currentItem = ret.getBuckets().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('buckets');
          SourceOptionsBuckets newItem = (SourceOptionsBuckets) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SourceOptionsBuckets.class);
          newBuckets.add(newItem);
        }
        retBuilder.buckets(newBuckets);
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
        'siteCollections' => 'site_collections',
        'crawlAllBuckets' => 'crawl_all_buckets'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for folders
      if (folders != null) {
        List<Object> foldersJsonList = new List<Object>();
        for (SourceOptionsFolder listItem : folders) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          foldersJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String foldersKey = 'folders';
        if (propertyNameMapping.containsKey(foldersKey)) {
          foldersKey = propertyNameMapping.get(foldersKey);
        }
        jsonMap.put(foldersKey, foldersJsonList);
      }

      // performing custom serialization for objects
      if (objects != null) {
        List<Object> objectsJsonList = new List<Object>();
        for (SourceOptionsObject listItem : objects) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          objectsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String objectsKey = 'objects';
        if (propertyNameMapping.containsKey(objectsKey)) {
          objectsKey = propertyNameMapping.get(objectsKey);
        }
        jsonMap.put(objectsKey, objectsJsonList);
      }

      // performing custom serialization for siteCollections
      if (siteCollections != null) {
        List<Object> siteCollectionsJsonList = new List<Object>();
        for (SourceOptionsSiteColl listItem : siteCollections) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          siteCollectionsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String siteCollectionsKey = 'siteCollections';
        if (propertyNameMapping.containsKey(siteCollectionsKey)) {
          siteCollectionsKey = propertyNameMapping.get(siteCollectionsKey);
        }
        jsonMap.put(siteCollectionsKey, siteCollectionsJsonList);
      }

      // performing custom serialization for urls
      if (urls != null) {
        List<Object> urlsJsonList = new List<Object>();
        for (SourceOptionsWebCrawl listItem : urls) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          urlsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String urlsKey = 'urls';
        if (propertyNameMapping.containsKey(urlsKey)) {
          urlsKey = propertyNameMapping.get(urlsKey);
        }
        jsonMap.put(urlsKey, urlsJsonList);
      }

      // performing custom serialization for buckets
      if (buckets != null) {
        List<Object> bucketsJsonList = new List<Object>();
        for (SourceOptionsBuckets listItem : buckets) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          bucketsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        String bucketsKey = 'buckets';
        if (propertyNameMapping.containsKey(bucketsKey)) {
          bucketsKey = propertyNameMapping.get(bucketsKey);
        }
        jsonMap.put(bucketsKey, bucketsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * SourceOptions Builder.
   */
  public class SourceOptionsBuilder {
    private List<SourceOptionsFolder> folders;
    private List<SourceOptionsObject> objects;
    private List<SourceOptionsSiteColl> siteCollections;
    private List<SourceOptionsWebCrawl> urls;
    private List<SourceOptionsBuckets> buckets;
    private Boolean crawlAllBuckets;

    private SourceOptionsBuilder(SourceOptions sourceOptions) {
      this.folders = sourceOptions.folders;
      this.objects = sourceOptions.objects;
      this.siteCollections = sourceOptions.siteCollections;
      this.urls = sourceOptions.urls;
      this.buckets = sourceOptions.buckets;
      this.crawlAllBuckets = sourceOptions.crawlAllBuckets;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceOptionsBuilder() {
    }

    /**
     * Builds a SourceOptions.
     *
     * @return the sourceOptions
     */
    public SourceOptions build() {
      return new SourceOptions(this);
    }

    /**
     * Adds an folders to folders.
     *
     * @param folders the new folders
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder addFolders(SourceOptionsFolder folders) {
      IBMWatsonValidator.notNull(folders, 'folders cannot be null');
      if (this.folders == null) {
        this.folders = new List<SourceOptionsFolder>();
      }
      this.folders.add(folders);
      return this;
    }

    /**
     * Adds an objects to objects.
     *
     * @param objects the new objects
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder addObjects(SourceOptionsObject objects) {
      IBMWatsonValidator.notNull(objects, 'objects cannot be null');
      if (this.objects == null) {
        this.objects = new List<SourceOptionsObject>();
      }
      this.objects.add(objects);
      return this;
    }

    /**
     * Adds an siteCollections to siteCollections.
     *
     * @param siteCollections the new siteCollections
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder addSiteCollections(SourceOptionsSiteColl siteCollections) {
      IBMWatsonValidator.notNull(siteCollections, 'siteCollections cannot be null');
      if (this.siteCollections == null) {
        this.siteCollections = new List<SourceOptionsSiteColl>();
      }
      this.siteCollections.add(siteCollections);
      return this;
    }

    /**
     * Adds an urls to urls.
     *
     * @param urls the new urls
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder addUrls(SourceOptionsWebCrawl urls) {
      IBMWatsonValidator.notNull(urls, 'urls cannot be null');
      if (this.urls == null) {
        this.urls = new List<SourceOptionsWebCrawl>();
      }
      this.urls.add(urls);
      return this;
    }

    /**
     * Adds an buckets to buckets.
     *
     * @param buckets the new buckets
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder addBuckets(SourceOptionsBuckets buckets) {
      IBMWatsonValidator.notNull(buckets, 'buckets cannot be null');
      if (this.buckets == null) {
        this.buckets = new List<SourceOptionsBuckets>();
      }
      this.buckets.add(buckets);
      return this;
    }

    /**
     * Set the folders.
     * Existing folders will be replaced.
     *
     * @param folders the folders
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder folders(List<SourceOptionsFolder> folders) {
      this.folders = folders;
      return this;
    }

    /**
     * Set the objects.
     * Existing objects will be replaced.
     *
     * @param objects the objects
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder objects(List<SourceOptionsObject> objects) {
      this.objects = objects;
      return this;
    }

    /**
     * Set the siteCollections.
     * Existing siteCollections will be replaced.
     *
     * @param siteCollections the siteCollections
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder siteCollections(List<SourceOptionsSiteColl> siteCollections) {
      this.siteCollections = siteCollections;
      return this;
    }

    /**
     * Set the urls.
     * Existing urls will be replaced.
     *
     * @param urls the urls
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder urls(List<SourceOptionsWebCrawl> urls) {
      this.urls = urls;
      return this;
    }

    /**
     * Set the buckets.
     * Existing buckets will be replaced.
     *
     * @param buckets the buckets
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder buckets(List<SourceOptionsBuckets> buckets) {
      this.buckets = buckets;
      return this;
    }

    /**
     * Set the crawlAllBuckets.
     *
     * @param crawlAllBuckets the crawlAllBuckets
     * @return the SourceOptions builder
     */
    public SourceOptionsBuilder crawlAllBuckets(Boolean crawlAllBuckets) {
      this.crawlAllBuckets = crawlAllBuckets;
      return this;
    }
  }

  /**
   * Object defining a cloud object store bucket to crawl.
   */
  public class SourceOptionsBuckets extends IBMWatsonGenericModel {
    private String name;
    private Long xLimit;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SourceOptionsBuckets() { }

    /**
     * Gets the name.
     *
     * The name of the cloud object store bucket to crawl.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the xLimit.
     *
     * The number of documents to crawl from this cloud object store bucket. If not specified, all documents in the
     * bucket are crawled.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }
  
    private SourceOptionsBuckets(SourceOptionsBucketsBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      this.name = builder.name;
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a SourceOptionsBuckets builder
     */
    public SourceOptionsBucketsBuilder newBuilder() {
      return new SourceOptionsBucketsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limit' => 'xLimit'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SourceOptionsBuckets ret = (SourceOptionsBuckets) super.deserialize(jsonString, jsonMap, classType);
      SourceOptionsBucketsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xLimit' => 'limit'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * SourceOptionsBuckets Builder.
   */
  public class SourceOptionsBucketsBuilder {
    private String name;
    private Long xLimit;

    private SourceOptionsBucketsBuilder(SourceOptionsBuckets sourceOptionsBuckets) {
      this.name = sourceOptionsBuckets.name;
      this.xLimit = sourceOptionsBuckets.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceOptionsBucketsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param name the name
     */
    public SourceOptionsBucketsBuilder(String name) {
      this.name = name;
    }

    /**
     * Builds a SourceOptionsBuckets.
     *
     * @return the sourceOptionsBuckets
     */
    public SourceOptionsBuckets build() {
      return new SourceOptionsBuckets(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the SourceOptionsBuckets builder
     */
    public SourceOptionsBucketsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the SourceOptionsBuckets builder
     */
    public SourceOptionsBucketsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * Object that defines a box folder to crawl with this configuration.
   */
  public class SourceOptionsFolder extends IBMWatsonGenericModel {
    private String ownerUserId;
    private String folderId;
    private Long xLimit;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SourceOptionsFolder() { }

    /**
     * Gets the ownerUserId.
     *
     * The Box user ID of the user who owns the folder to crawl.
     *
     * @return the ownerUserId
     */
    @AuraEnabled
    public String getOwnerUserId() {
      return ownerUserId;
    }

    /**
     * Gets the folderId.
     *
     * The Box folder ID of the folder to crawl.
     *
     * @return the folderId
     */
    @AuraEnabled
    public String getFolderId() {
      return folderId;
    }

    /**
     * Gets the xLimit.
     *
     * The maximum number of documents to crawl for this folder. By default, all documents in the folder are crawled.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }
  
    private SourceOptionsFolder(SourceOptionsFolderBuilder builder) {
      IBMWatsonValidator.notNull(builder.ownerUserId, 'ownerUserId cannot be null');
      IBMWatsonValidator.notNull(builder.folderId, 'folderId cannot be null');
      this.ownerUserId = builder.ownerUserId;
      this.folderId = builder.folderId;
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a SourceOptionsFolder builder
     */
    public SourceOptionsFolderBuilder newBuilder() {
      return new SourceOptionsFolderBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'owner_user_id' => 'ownerUserId',
        'folder_id' => 'folderId',
        'limit' => 'xLimit'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SourceOptionsFolder ret = (SourceOptionsFolder) super.deserialize(jsonString, jsonMap, classType);
      SourceOptionsFolderBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'ownerUserId' => 'owner_user_id',
        'folderId' => 'folder_id',
        'xLimit' => 'limit'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * SourceOptionsFolder Builder.
   */
  public class SourceOptionsFolderBuilder {
    private String ownerUserId;
    private String folderId;
    private Long xLimit;

    private SourceOptionsFolderBuilder(SourceOptionsFolder sourceOptionsFolder) {
      this.ownerUserId = sourceOptionsFolder.ownerUserId;
      this.folderId = sourceOptionsFolder.folderId;
      this.xLimit = sourceOptionsFolder.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceOptionsFolderBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param ownerUserId the ownerUserId
     * @param folderId the folderId
     */
    public SourceOptionsFolderBuilder(String ownerUserId, String folderId) {
      this.ownerUserId = ownerUserId;
      this.folderId = folderId;
    }

    /**
     * Builds a SourceOptionsFolder.
     *
     * @return the sourceOptionsFolder
     */
    public SourceOptionsFolder build() {
      return new SourceOptionsFolder(this);
    }

    /**
     * Set the ownerUserId.
     *
     * @param ownerUserId the ownerUserId
     * @return the SourceOptionsFolder builder
     */
    public SourceOptionsFolderBuilder ownerUserId(String ownerUserId) {
      this.ownerUserId = ownerUserId;
      return this;
    }

    /**
     * Set the folderId.
     *
     * @param folderId the folderId
     * @return the SourceOptionsFolder builder
     */
    public SourceOptionsFolderBuilder folderId(String folderId) {
      this.folderId = folderId;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the SourceOptionsFolder builder
     */
    public SourceOptionsFolderBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * Object that defines a Salesforce document object type crawl with this configuration.
   */
  public class SourceOptionsObject extends IBMWatsonGenericModel {
    private String name;
    private Long xLimit;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SourceOptionsObject() { }

    /**
     * Gets the name.
     *
     * The name of the Salesforce document object to crawl. For example, `case`.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the xLimit.
     *
     * The maximum number of documents to crawl for this document object. By default, all documents in the document
     * object are crawled.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }
  
    private SourceOptionsObject(SourceOptionsObjectBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      this.name = builder.name;
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a SourceOptionsObject builder
     */
    public SourceOptionsObjectBuilder newBuilder() {
      return new SourceOptionsObjectBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limit' => 'xLimit'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SourceOptionsObject ret = (SourceOptionsObject) super.deserialize(jsonString, jsonMap, classType);
      SourceOptionsObjectBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xLimit' => 'limit'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * SourceOptionsObject Builder.
   */
  public class SourceOptionsObjectBuilder {
    private String name;
    private Long xLimit;

    private SourceOptionsObjectBuilder(SourceOptionsObject sourceOptionsObject) {
      this.name = sourceOptionsObject.name;
      this.xLimit = sourceOptionsObject.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceOptionsObjectBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param name the name
     */
    public SourceOptionsObjectBuilder(String name) {
      this.name = name;
    }

    /**
     * Builds a SourceOptionsObject.
     *
     * @return the sourceOptionsObject
     */
    public SourceOptionsObject build() {
      return new SourceOptionsObject(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the SourceOptionsObject builder
     */
    public SourceOptionsObjectBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the SourceOptionsObject builder
     */
    public SourceOptionsObjectBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * Object that defines a Microsoft SharePoint site collection to crawl with this configuration.
   */
  public class SourceOptionsSiteColl extends IBMWatsonGenericModel {
    private String siteCollectionPath;
    private Long xLimit;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SourceOptionsSiteColl() { }

    /**
     * Gets the siteCollectionPath.
     *
     * The Microsoft SharePoint Online site collection path to crawl. The path must be be relative to the
     * **organization_url** that was specified in the credentials associated with this source configuration.
     *
     * @return the siteCollectionPath
     */
    @AuraEnabled
    public String getSiteCollectionPath() {
      return siteCollectionPath;
    }

    /**
     * Gets the xLimit.
     *
     * The maximum number of documents to crawl for this site collection. By default, all documents in the site
     * collection are crawled.
     *
     * @return the xLimit
     */
    @AuraEnabled
    public Long getXLimit() {
      return xLimit;
    }
  
    private SourceOptionsSiteColl(SourceOptionsSiteCollBuilder builder) {
      IBMWatsonValidator.notNull(builder.siteCollectionPath, 'siteCollectionPath cannot be null');
      this.siteCollectionPath = builder.siteCollectionPath;
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a SourceOptionsSiteColl builder
     */
    public SourceOptionsSiteCollBuilder newBuilder() {
      return new SourceOptionsSiteCollBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'site_collection_path' => 'siteCollectionPath',
        'limit' => 'xLimit'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SourceOptionsSiteColl ret = (SourceOptionsSiteColl) super.deserialize(jsonString, jsonMap, classType);
      SourceOptionsSiteCollBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'siteCollectionPath' => 'site_collection_path',
        'xLimit' => 'limit'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * SourceOptionsSiteColl Builder.
   */
  public class SourceOptionsSiteCollBuilder {
    private String siteCollectionPath;
    private Long xLimit;

    private SourceOptionsSiteCollBuilder(SourceOptionsSiteColl sourceOptionsSiteColl) {
      this.siteCollectionPath = sourceOptionsSiteColl.siteCollectionPath;
      this.xLimit = sourceOptionsSiteColl.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceOptionsSiteCollBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param siteCollectionPath the siteCollectionPath
     */
    public SourceOptionsSiteCollBuilder(String siteCollectionPath) {
      this.siteCollectionPath = siteCollectionPath;
    }

    /**
     * Builds a SourceOptionsSiteColl.
     *
     * @return the sourceOptionsSiteColl
     */
    public SourceOptionsSiteColl build() {
      return new SourceOptionsSiteColl(this);
    }

    /**
     * Set the siteCollectionPath.
     *
     * @param siteCollectionPath the siteCollectionPath
     * @return the SourceOptionsSiteColl builder
     */
    public SourceOptionsSiteCollBuilder siteCollectionPath(String siteCollectionPath) {
      this.siteCollectionPath = siteCollectionPath;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the SourceOptionsSiteColl builder
     */
    public SourceOptionsSiteCollBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * Object defining which URL to crawl and how to crawl it.
   */
  public class SourceOptionsWebCrawl extends IBMWatsonGenericModel {
    private String url;
    private Boolean limitToStartingHosts;
    private String crawlSpeed;
    private Boolean allowUntrustedCertificate;
    private Long maximumHops;
    private Long requestTimeout;
    private Boolean overrideRobotsTxt;
    private List<String> blacklist;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SourceOptionsWebCrawl() { }

    /**
     * Gets the url.
     *
     * The starting URL to crawl.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the limitToStartingHosts.
     *
     * When `true`, crawls of the specified URL are limited to the host part of the **url** field.
     *
     * @return the limitToStartingHosts
     */
    @AuraEnabled
    public Boolean getLimitToStartingHosts() {
      return limitToStartingHosts;
    }

    /**
     * Gets the crawlSpeed.
     *
     * The number of concurrent URLs to fetch. `gentle` means one URL is fetched at a time with a delay between each
     * call. `normal` means as many as two URLs are fectched concurrently with a short delay between fetch calls.
     * `aggressive` means that up to ten URLs are fetched concurrently with a short delay between fetch calls.
     *
     * @return the crawlSpeed
     */
    @AuraEnabled
    public String getCrawlSpeed() {
      return crawlSpeed;
    }

    /**
     * Gets the allowUntrustedCertificate.
     *
     * When `true`, allows the crawl to interact with HTTPS sites with SSL certificates with untrusted signers.
     *
     * @return the allowUntrustedCertificate
     */
    @AuraEnabled
    public Boolean getAllowUntrustedCertificate() {
      return allowUntrustedCertificate;
    }

    /**
     * Gets the maximumHops.
     *
     * The maximum number of hops to make from the initial URL. When a page is crawled each link on that page will also
     * be crawled if it is within the **maximum_hops** from the initial URL. The first page crawled is 0 hops, each link
     * crawled from the first page is 1 hop, each link crawled from those pages is 2 hops, and so on.
     *
     * @return the maximumHops
     */
    @AuraEnabled
    public Long getMaximumHops() {
      return maximumHops;
    }

    /**
     * Gets the requestTimeout.
     *
     * The maximum milliseconds to wait for a response from the web server.
     *
     * @return the requestTimeout
     */
    @AuraEnabled
    public Long getRequestTimeout() {
      return requestTimeout;
    }

    /**
     * Gets the overrideRobotsTxt.
     *
     * When `true`, the crawler will ignore any `robots.txt` encountered by the crawler. This should only ever be done
     * when crawling a web site the user owns. This must be be set to `true` when a **gateway_id** is specied in the
     * **credentials**.
     *
     * @return the overrideRobotsTxt
     */
    @AuraEnabled
    public Boolean getOverrideRobotsTxt() {
      return overrideRobotsTxt;
    }

    /**
     * Gets the blacklist.
     *
     * Array of URL's to be excluded while crawling. The crawler will not follow links which contains this string. For
     * example, listing `https://ibm.com/watson` also excludes `https://ibm.com/watson/discovery`.
     *
     * @return the blacklist
     */
    @AuraEnabled
    public List<String> getBlacklist() {
      return blacklist;
    }
  
    private SourceOptionsWebCrawl(SourceOptionsWebCrawlBuilder builder) {
      IBMWatsonValidator.notNull(builder.url, 'url cannot be null');
      this.url = builder.url;
      this.limitToStartingHosts = builder.limitToStartingHosts;
      this.crawlSpeed = builder.crawlSpeed;
      this.allowUntrustedCertificate = builder.allowUntrustedCertificate;
      this.maximumHops = builder.maximumHops;
      this.requestTimeout = builder.requestTimeout;
      this.overrideRobotsTxt = builder.overrideRobotsTxt;
      this.blacklist = builder.blacklist;
    }

    /**
     * New builder.
     *
     * @return a SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder newBuilder() {
      return new SourceOptionsWebCrawlBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limit_to_starting_hosts' => 'limitToStartingHosts',
        'crawl_speed' => 'crawlSpeed',
        'allow_untrusted_certificate' => 'allowUntrustedCertificate',
        'maximum_hops' => 'maximumHops',
        'request_timeout' => 'requestTimeout',
        'override_robots_txt' => 'overrideRobotsTxt'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SourceOptionsWebCrawl ret = (SourceOptionsWebCrawl) super.deserialize(jsonString, jsonMap, classType);
      SourceOptionsWebCrawlBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'limitToStartingHosts' => 'limit_to_starting_hosts',
        'crawlSpeed' => 'crawl_speed',
        'allowUntrustedCertificate' => 'allow_untrusted_certificate',
        'maximumHops' => 'maximum_hops',
        'requestTimeout' => 'request_timeout',
        'overrideRobotsTxt' => 'override_robots_txt'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * SourceOptionsWebCrawl Builder.
   */
  public class SourceOptionsWebCrawlBuilder {
    private String url;
    private Boolean limitToStartingHosts;
    private String crawlSpeed;
    private Boolean allowUntrustedCertificate;
    private Long maximumHops;
    private Long requestTimeout;
    private Boolean overrideRobotsTxt;
    private List<String> blacklist;

    private SourceOptionsWebCrawlBuilder(SourceOptionsWebCrawl sourceOptionsWebCrawl) {
      this.url = sourceOptionsWebCrawl.url;
      this.limitToStartingHosts = sourceOptionsWebCrawl.limitToStartingHosts;
      this.crawlSpeed = sourceOptionsWebCrawl.crawlSpeed;
      this.allowUntrustedCertificate = sourceOptionsWebCrawl.allowUntrustedCertificate;
      this.maximumHops = sourceOptionsWebCrawl.maximumHops;
      this.requestTimeout = sourceOptionsWebCrawl.requestTimeout;
      this.overrideRobotsTxt = sourceOptionsWebCrawl.overrideRobotsTxt;
      this.blacklist = sourceOptionsWebCrawl.blacklist;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceOptionsWebCrawlBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param url the url
     */
    public SourceOptionsWebCrawlBuilder(String url) {
      this.url = url;
    }

    /**
     * Builds a SourceOptionsWebCrawl.
     *
     * @return the sourceOptionsWebCrawl
     */
    public SourceOptionsWebCrawl build() {
      return new SourceOptionsWebCrawl(this);
    }

    /**
     * Adds an blacklist to blacklist.
     *
     * @param blacklist the new blacklist
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder addBlacklist(String blacklist) {
      IBMWatsonValidator.notNull(blacklist, 'blacklist cannot be null');
      if (this.blacklist == null) {
        this.blacklist = new List<String>();
      }
      this.blacklist.add(blacklist);
      return this;
    }

    /**
     * Set the url.
     *
     * @param url the url
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder url(String url) {
      this.url = url;
      return this;
    }

    /**
     * Set the limitToStartingHosts.
     *
     * @param limitToStartingHosts the limitToStartingHosts
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder limitToStartingHosts(Boolean limitToStartingHosts) {
      this.limitToStartingHosts = limitToStartingHosts;
      return this;
    }

    /**
     * Set the crawlSpeed.
     *
     * @param crawlSpeed the crawlSpeed
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder crawlSpeed(String crawlSpeed) {
      this.crawlSpeed = crawlSpeed;
      return this;
    }

    /**
     * Set the allowUntrustedCertificate.
     *
     * @param allowUntrustedCertificate the allowUntrustedCertificate
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder allowUntrustedCertificate(Boolean allowUntrustedCertificate) {
      this.allowUntrustedCertificate = allowUntrustedCertificate;
      return this;
    }

    /**
     * Set the maximumHops.
     *
     * @param maximumHops the maximumHops
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder maximumHops(Long maximumHops) {
      this.maximumHops = maximumHops;
      return this;
    }

    /**
     * Set the requestTimeout.
     *
     * @param requestTimeout the requestTimeout
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder requestTimeout(Long requestTimeout) {
      this.requestTimeout = requestTimeout;
      return this;
    }

    /**
     * Set the overrideRobotsTxt.
     *
     * @param overrideRobotsTxt the overrideRobotsTxt
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder overrideRobotsTxt(Boolean overrideRobotsTxt) {
      this.overrideRobotsTxt = overrideRobotsTxt;
      return this;
    }

    /**
     * Set the blacklist.
     * Existing blacklist will be replaced.
     *
     * @param blacklist the blacklist
     * @return the SourceOptionsWebCrawl builder
     */
    public SourceOptionsWebCrawlBuilder blacklist(List<String> blacklist) {
      this.blacklist = blacklist;
      return this;
    }
  }

  /**
   * Object containing the schedule information for the source.
   */
  public class SourceSchedule extends IBMWatsonGenericModel {
    private Boolean enabled;
    private String timeZone;
    private String frequency;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public SourceSchedule() { }

    /**
     * Gets the enabled.
     *
     * When `true`, the source is re-crawled based on the **frequency** field in this object. When `false` the source is
     * not re-crawled; When `false` and connecting to Salesforce the source is crawled annually.
     *
     * @return the enabled
     */
    @AuraEnabled
    public Boolean getEnabled() {
      return enabled;
    }

    /**
     * Gets the timeZone.
     *
     * The time zone to base source crawl times on. Possible values correspond to the IANA (Internet Assigned Numbers
     * Authority) time zones list.
     *
     * @return the timeZone
     */
    @AuraEnabled
    public String getTimeZone() {
      return timeZone;
    }

    /**
     * Gets the frequency.
     *
     * The crawl schedule in the specified **time_zone**.
     *
     * -  `five_minutes`: Runs every five minutes.
     * -  `hourly`: Runs every hour.
     * -  `daily`: Runs every day between 00:00 and 06:00.
     * -  `weekly`: Runs every week on Sunday between 00:00 and 06:00.
     * -  `monthly`: Runs the on the first Sunday of every month between 00:00 and 06:00.
     *
     * @return the frequency
     */
    @AuraEnabled
    public String getFrequency() {
      return frequency;
    }
  
    private SourceSchedule(SourceScheduleBuilder builder) {
      this.enabled = builder.enabled;
      this.timeZone = builder.timeZone;
      this.frequency = builder.frequency;
    }

    /**
     * New builder.
     *
     * @return a SourceSchedule builder
     */
    public SourceScheduleBuilder newBuilder() {
      return new SourceScheduleBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'time_zone' => 'timeZone'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SourceSchedule ret = (SourceSchedule) super.deserialize(jsonString, jsonMap, classType);
      SourceScheduleBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'timeZone' => 'time_zone'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * SourceSchedule Builder.
   */
  public class SourceScheduleBuilder {
    private Boolean enabled;
    private String timeZone;
    private String frequency;

    private SourceScheduleBuilder(SourceSchedule sourceSchedule) {
      this.enabled = sourceSchedule.enabled;
      this.timeZone = sourceSchedule.timeZone;
      this.frequency = sourceSchedule.frequency;
    }

    /**
     * Instantiates a new builder.
     */
    public SourceScheduleBuilder() {
    }

    /**
     * Builds a SourceSchedule.
     *
     * @return the sourceSchedule
     */
    public SourceSchedule build() {
      return new SourceSchedule(this);
    }

    /**
     * Set the enabled.
     *
     * @param enabled the enabled
     * @return the SourceSchedule builder
     */
    public SourceScheduleBuilder enabled(Boolean enabled) {
      this.enabled = enabled;
      return this;
    }

    /**
     * Set the timeZone.
     *
     * @param timeZone the timeZone
     * @return the SourceSchedule builder
     */
    public SourceScheduleBuilder timeZone(String timeZone) {
      this.timeZone = timeZone;
      return this;
    }

    /**
     * Set the frequency.
     *
     * @param frequency the frequency
     * @return the SourceSchedule builder
     */
    public SourceScheduleBuilder frequency(String frequency) {
      this.frequency = frequency;
      return this;
    }
  }

  /**
   * Object containing source crawl status information.
   */
  public class SourceStatus extends IBMWatsonGenericModel {
    private String status;
    private Datetime nextCrawl;

    /**
     * Gets the status.
     *
     * The current status of the source crawl for this collection. This field returns `not_configured` if the default
     * configuration for this source does not have a **source** object defined.
     *
     * -  `running` indicates that a crawl to fetch more documents is in progress.
     * -  `complete` indicates that the crawl has completed with no errors.
     * -  `queued` indicates that the crawl has been paused by the system and will automatically restart when possible.
     * -  `unknown` indicates that an unidentified error has occured in the service.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the nextCrawl.
     *
     * Date in `RFC 3339` format indicating the time of the next crawl attempt.
     *
     * @return the nextCrawl
     */
    @AuraEnabled
    public Datetime getNextCrawl() {
      return nextCrawl;
    }

    /**
     * Sets the status.
     *
     * @param status the new status
     */
    public void setStatus(final String status) {
      this.status = status;
    }

    /**
     * Sets the nextCrawl.
     *
     * @param nextCrawl the new nextCrawl
     */
    public void setNextCrawl(final Datetime nextCrawl) {
      this.nextCrawl = nextCrawl;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'next_crawl' => 'nextCrawl'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String nextCrawl = (String) jsonMap.remove('nextCrawl');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      SourceStatus ret = (SourceStatus) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(nextCrawl)) {
        ret.setNextCrawl((Datetime) JSON.deserialize('"' + nextCrawl + '"', Datetime.class));
      }

      return ret;
    }
  }

  /**
   * An object defining a single tokenizaion rule.
   */
  public class TokenDictRule extends IBMWatsonGenericModel {
    private String text;
    private List<String> tokens;
    private List<String> readings;
    private String partOfSpeech;

    /**
     * Gets the text.
     *
     * The string to tokenize.
     *
     * @return the text
     */
    public String getText() {
      return text;
    }

    /**
     * Gets the tokens.
     *
     * Array of tokens that the `text` field is split into when found.
     *
     * @return the tokens
     */
    public List<String> getTokens() {
      return tokens;
    }

    /**
     * Gets the readings.
     *
     * Array of tokens that represent the content of the `text` field in an alternate character set.
     *
     * @return the readings
     */
    public List<String> getReadings() {
      return readings;
    }

    /**
     * Gets the partOfSpeech.
     *
     * The part of speech that the `text` string belongs to. For example `noun`. Custom parts of speech can be
     * specified.
     *
     * @return the partOfSpeech
     */
    public String getPartOfSpeech() {
      return partOfSpeech;
    }
  
    private TokenDictRule(TokenDictRuleBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      IBMWatsonValidator.notNull(builder.tokens, 'tokens cannot be null');
      IBMWatsonValidator.notNull(builder.partOfSpeech, 'partOfSpeech cannot be null');
      this.text = builder.text;
      this.tokens = builder.tokens;
      this.readings = builder.readings;
      this.partOfSpeech = builder.partOfSpeech;
    }

    /**
     * New builder.
     *
     * @return a TokenDictRule builder
     */
    public TokenDictRuleBuilder newBuilder() {
      return new TokenDictRuleBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'partOfSpeech' => 'part_of_speech'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * TokenDictRule Builder.
   */
  public class TokenDictRuleBuilder {
    private String text;
    private List<String> tokens;
    private List<String> readings;
    private String partOfSpeech;

    private TokenDictRuleBuilder(TokenDictRule tokenDictRule) {
      this.text = tokenDictRule.text;
      this.tokens = tokenDictRule.tokens;
      this.readings = tokenDictRule.readings;
      this.partOfSpeech = tokenDictRule.partOfSpeech;
    }

    /**
     * Instantiates a new builder.
     */
    public TokenDictRuleBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     * @param tokens the tokens
     * @param partOfSpeech the partOfSpeech
     */
    public TokenDictRuleBuilder(String text, List<String> tokens, String partOfSpeech) {
      this.text = text;
      this.tokens = tokens;
      this.partOfSpeech = partOfSpeech;
    }

    /**
     * Builds a TokenDictRule.
     *
     * @return the tokenDictRule
     */
    public TokenDictRule build() {
      return new TokenDictRule(this);
    }

    /**
     * Adds an tokens to tokens.
     *
     * @param tokens the new tokens
     * @return the TokenDictRule builder
     */
    public TokenDictRuleBuilder addTokens(String tokens) {
      IBMWatsonValidator.notNull(tokens, 'tokens cannot be null');
      if (this.tokens == null) {
        this.tokens = new List<String>();
      }
      this.tokens.add(tokens);
      return this;
    }

    /**
     * Adds an readings to readings.
     *
     * @param readings the new readings
     * @return the TokenDictRule builder
     */
    public TokenDictRuleBuilder addReadings(String readings) {
      IBMWatsonValidator.notNull(readings, 'readings cannot be null');
      if (this.readings == null) {
        this.readings = new List<String>();
      }
      this.readings.add(readings);
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the TokenDictRule builder
     */
    public TokenDictRuleBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the tokens.
     * Existing tokens will be replaced.
     *
     * @param tokens the tokens
     * @return the TokenDictRule builder
     */
    public TokenDictRuleBuilder tokens(List<String> tokens) {
      this.tokens = tokens;
      return this;
    }

    /**
     * Set the readings.
     * Existing readings will be replaced.
     *
     * @param readings the readings
     * @return the TokenDictRule builder
     */
    public TokenDictRuleBuilder readings(List<String> readings) {
      this.readings = readings;
      return this;
    }

    /**
     * Set the partOfSpeech.
     *
     * @param partOfSpeech the partOfSpeech
     * @return the TokenDictRule builder
     */
    public TokenDictRuleBuilder partOfSpeech(String partOfSpeech) {
      this.partOfSpeech = partOfSpeech;
      return this;
    }
  }

  /**
   * Object describing the current status of the wordlist.
   */
  public class TokenDictStatusResponse extends IBMWatsonResponseModel {
    private String status;
    private String xType;

    /**
     * Gets the status.
     *
     * Current wordlist status for the specified collection.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the xType.
     *
     * The type for this wordlist. Can be `tokenization_dictionary` or `stopwords`.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Sets the status.
     *
     * @param status the new status
     */
    public void setStatus(final String status) {
      this.status = status;
    }

    /**
     * Sets the xType.
     *
     * @param xType the new xType
     */
    public void setXType(final String xType) {
      this.xType = xType;
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

      TokenDictStatusResponse ret = (TokenDictStatusResponse) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Top hit information for this query.
   */
  public class TopHitsResults extends IBMWatsonGenericModel {
    private Long matchingResults;
    private List<QueryResult> hits;

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
     * Top results returned by the aggregation.
     *
     * @return the hits
     */
    @AuraEnabled
    public List<QueryResult> getHits() {
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
    public void setHits(final List<QueryResult> hits) {
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

      TopHitsResults ret = (TopHitsResults) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for hits
      List<QueryResult> newHits = new List<QueryResult>();
      List<QueryResult> deserializedHits = ret.getHits();
      if (deserializedHits != null) {
        for (Integer i = 0; i < deserializedHits.size(); i++) {
          QueryResult currentItem = ret.getHits().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('hits');
          QueryResult newItem = (QueryResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), QueryResult.class);
          newHits.add(newItem);
        }
        ret.hits = newHits;
      }

      return ret;
    }
  }

  /**
   * Training information for a specific collection.
   */
  public class TrainingDataSet extends IBMWatsonResponseModel {
    private String environmentId;
    private String collectionId;
    private List<TrainingQuery> queries;

    /**
     * Gets the environmentId.
     *
     * The environment id associated with this training data set.
     *
     * @return the environmentId
     */
    @AuraEnabled
    public String getEnvironmentId() {
      return environmentId;
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
     * Sets the environmentId.
     *
     * @param environmentId the new environmentId
     */
    public void setEnvironmentId(final String environmentId) {
      this.environmentId = environmentId;
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

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'environment_id' => 'environmentId',
        'collection_id' => 'collectionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TrainingDataSet ret = (TrainingDataSet) super.deserialize(jsonString, jsonMap, classType);

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
   * Training example details.
   */
  public class TrainingExample extends IBMWatsonResponseModel {
    private String documentId;
    private String crossReference;
    private Long relevance;

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
     * Gets the crossReference.
     *
     * The cross reference associated with this training example.
     *
     * @return the crossReference
     */
    @AuraEnabled
    public String getCrossReference() {
      return crossReference;
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
  
    private TrainingExample(TrainingExampleBuilder builder) {
      this.documentId = builder.documentId;
      this.crossReference = builder.crossReference;
      this.relevance = builder.relevance;
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
        'cross_reference' => 'crossReference'
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
        'crossReference' => 'cross_reference'
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
    private String crossReference;
    private Long relevance;

    private TrainingExampleBuilder(TrainingExample trainingExample) {
      this.documentId = trainingExample.documentId;
      this.crossReference = trainingExample.crossReference;
      this.relevance = trainingExample.relevance;
    }

    /**
     * Instantiates a new builder.
     */
    public TrainingExampleBuilder() {
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
     * Set the crossReference.
     *
     * @param crossReference the crossReference
     * @return the TrainingExample builder
     */
    public TrainingExampleBuilder crossReference(String crossReference) {
      this.crossReference = crossReference;
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
  }

  /**
   * Object containing an array of training examples.
   */
  public class TrainingExampleList extends IBMWatsonResponseModel {
    private List<TrainingExample> examples;

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

    /**
     * Sets the examples.
     *
     * @param examples the new examples
     */
    public void setExamples(final List<TrainingExample> examples) {
      this.examples = examples;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TrainingExampleList ret = (TrainingExampleList) super.deserialize(jsonString, jsonMap, classType);

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
        ret.examples = newExamples;
      }

      return ret;
    }
  }

  /**
   * Training query details.
   */
  public class TrainingQuery extends IBMWatsonResponseModel {
    private String queryId;
    private String naturalLanguageQuery;
    private String filter;
    private List<TrainingExample> examples;

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

    /**
     * Sets the queryId.
     *
     * @param queryId the new queryId
     */
    public void setQueryId(final String queryId) {
      this.queryId = queryId;
    }

    /**
     * Sets the naturalLanguageQuery.
     *
     * @param naturalLanguageQuery the new naturalLanguageQuery
     */
    public void setNaturalLanguageQuery(final String naturalLanguageQuery) {
      this.naturalLanguageQuery = naturalLanguageQuery;
    }

    /**
     * Sets the filter.
     *
     * @param filter the new filter
     */
    public void setFilter(final String filter) {
      this.filter = filter;
    }

    /**
     * Sets the examples.
     *
     * @param examples the new examples
     */
    public void setExamples(final List<TrainingExample> examples) {
      this.examples = examples;
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
        ret.examples = newExamples;
      }

      return ret;
    }
  }

  /**
   * Training status details.
   */
  public class TrainingStatus extends IBMWatsonGenericModel {
    private Long totalExamples;
    private Boolean available;
    private Boolean processing;
    private Boolean minimumQueriesAdded;
    private Boolean minimumExamplesAdded;
    private Boolean sufficientLabelDiversity;
    private Long notices;
    private Datetime successfullyTrained;
    private Datetime dataUpdated;

    /**
     * Gets the totalExamples.
     *
     * The total number of training examples uploaded to this collection.
     *
     * @return the totalExamples
     */
    @AuraEnabled
    public Long getTotalExamples() {
      return totalExamples;
    }

    /**
     * Gets the available.
     *
     * When `true`, the collection has been successfully trained.
     *
     * @return the available
     */
    @AuraEnabled
    public Boolean getAvailable() {
      return available;
    }

    /**
     * Gets the processing.
     *
     * When `true`, the collection is currently processing training.
     *
     * @return the processing
     */
    @AuraEnabled
    public Boolean getProcessing() {
      return processing;
    }

    /**
     * Gets the minimumQueriesAdded.
     *
     * When `true`, the collection has a sufficent amount of queries added for training to occur.
     *
     * @return the minimumQueriesAdded
     */
    @AuraEnabled
    public Boolean getMinimumQueriesAdded() {
      return minimumQueriesAdded;
    }

    /**
     * Gets the minimumExamplesAdded.
     *
     * When `true`, the collection has a sufficent amount of examples added for training to occur.
     *
     * @return the minimumExamplesAdded
     */
    @AuraEnabled
    public Boolean getMinimumExamplesAdded() {
      return minimumExamplesAdded;
    }

    /**
     * Gets the sufficientLabelDiversity.
     *
     * When `true`, the collection has a sufficent amount of diversity in labeled results for training to occur.
     *
     * @return the sufficientLabelDiversity
     */
    @AuraEnabled
    public Boolean getSufficientLabelDiversity() {
      return sufficientLabelDiversity;
    }

    /**
     * Gets the notices.
     *
     * The number of notices associated with this data set.
     *
     * @return the notices
     */
    @AuraEnabled
    public Long getNotices() {
      return notices;
    }

    /**
     * Gets the successfullyTrained.
     *
     * The timestamp of when the collection was successfully trained.
     *
     * @return the successfullyTrained
     */
    @AuraEnabled
    public Datetime getSuccessfullyTrained() {
      return successfullyTrained;
    }

    /**
     * Gets the dataUpdated.
     *
     * The timestamp of when the data was uploaded.
     *
     * @return the dataUpdated
     */
    @AuraEnabled
    public Datetime getDataUpdated() {
      return dataUpdated;
    }

    /**
     * Sets the totalExamples.
     *
     * @param totalExamples the new totalExamples
     */
    public void setTotalExamples(final long totalExamples) {
      this.totalExamples = totalExamples;
    }

    /**
     * Sets the available.
     *
     * @param available the new available
     */
    public void setAvailable(final Boolean available) {
      this.available = available;
    }

    /**
     * Sets the processing.
     *
     * @param processing the new processing
     */
    public void setProcessing(final Boolean processing) {
      this.processing = processing;
    }

    /**
     * Sets the minimumQueriesAdded.
     *
     * @param minimumQueriesAdded the new minimumQueriesAdded
     */
    public void setMinimumQueriesAdded(final Boolean minimumQueriesAdded) {
      this.minimumQueriesAdded = minimumQueriesAdded;
    }

    /**
     * Sets the minimumExamplesAdded.
     *
     * @param minimumExamplesAdded the new minimumExamplesAdded
     */
    public void setMinimumExamplesAdded(final Boolean minimumExamplesAdded) {
      this.minimumExamplesAdded = minimumExamplesAdded;
    }

    /**
     * Sets the sufficientLabelDiversity.
     *
     * @param sufficientLabelDiversity the new sufficientLabelDiversity
     */
    public void setSufficientLabelDiversity(final Boolean sufficientLabelDiversity) {
      this.sufficientLabelDiversity = sufficientLabelDiversity;
    }

    /**
     * Sets the notices.
     *
     * @param notices the new notices
     */
    public void setNotices(final long notices) {
      this.notices = notices;
    }

    /**
     * Sets the successfullyTrained.
     *
     * @param successfullyTrained the new successfullyTrained
     */
    public void setSuccessfullyTrained(final Datetime successfullyTrained) {
      this.successfullyTrained = successfullyTrained;
    }

    /**
     * Sets the dataUpdated.
     *
     * @param dataUpdated the new dataUpdated
     */
    public void setDataUpdated(final Datetime dataUpdated) {
      this.dataUpdated = dataUpdated;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'total_examples' => 'totalExamples',
        'minimum_queries_added' => 'minimumQueriesAdded',
        'minimum_examples_added' => 'minimumExamplesAdded',
        'sufficient_label_diversity' => 'sufficientLabelDiversity',
        'successfully_trained' => 'successfullyTrained',
        'data_updated' => 'dataUpdated'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      String successfullyTrained = (String) jsonMap.remove('successfullyTrained');
      String dataUpdated = (String) jsonMap.remove('dataUpdated');
      String jsonStringWithoutDates = JSON.serialize(jsonMap);

      TrainingStatus ret = (TrainingStatus) super.deserialize(jsonStringWithoutDates, jsonMap, classType);

      if (String.isNotBlank(successfullyTrained)) {
        ret.setSuccessfullyTrained((Datetime) JSON.deserialize('"' + successfullyTrained + '"', Datetime.class));
      }
      if (String.isNotBlank(dataUpdated)) {
        ret.setDataUpdated((Datetime) JSON.deserialize('"' + dataUpdated + '"', Datetime.class));
      }

      return ret;
    }
  }

  /**
   * The updateCollection options.
   */
  public class UpdateCollectionOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String name;
    private String description;
    private String configurationId;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the name.
     *
     * The name of the collection.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * A description of the collection.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the configurationId.
     *
     * The ID of the configuration in which the collection is to be updated.
     *
     * @return the configurationId
     */
    public String configurationId() {
      return configurationId;
    }

    private UpdateCollectionOptions(UpdateCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      name = builder.name;
      description = builder.description;
      configurationId = builder.configurationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder newBuilder() {
      return new UpdateCollectionOptionsBuilder(this);
    }
  }

  /**
   * UpdateCollectionOptions Builder.
   */
  public class UpdateCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String name;
    private String description;
    private String configurationId;

    private UpdateCollectionOptionsBuilder(UpdateCollectionOptions updateCollectionOptions) {
      environmentId = updateCollectionOptions.environmentId;
      collectionId = updateCollectionOptions.collectionId;
      name = updateCollectionOptions.name;
      description = updateCollectionOptions.description;
      configurationId = updateCollectionOptions.configurationId;
      this.requestHeaders.putAll(updateCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param name the name
     */
    public UpdateCollectionOptionsBuilder(String environmentId, String collectionId, String name) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.name = name;
    }

    /**
     * Builds a UpdateCollectionOptions.
     *
     * @return the updateCollectionOptions
     */
    public UpdateCollectionOptions build() {
      return new UpdateCollectionOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the configurationId.
     *
     * @param configurationId the configurationId
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder configurationId(String configurationId) {
      this.configurationId = configurationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateConfiguration options.
   */
  public class UpdateConfigurationOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String configurationId;
    private String name;
    private String description;
    private Conversions conversions;
    private List<Enrichment> enrichments;
    private List<NormalizationOperation> normalizations;
    private Source source;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the configurationId.
     *
     * The ID of the configuration.
     *
     * @return the configurationId
     */
    public String configurationId() {
      return configurationId;
    }

    /**
     * Gets the name.
     *
     * The name of the configuration.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the configuration, if available.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the conversions.
     *
     * Document conversion settings.
     *
     * @return the conversions
     */
    public Conversions conversions() {
      return conversions;
    }

    /**
     * Gets the enrichments.
     *
     * An array of document enrichment settings for the configuration.
     *
     * @return the enrichments
     */
    public List<Enrichment> enrichments() {
      return enrichments;
    }

    /**
     * Gets the normalizations.
     *
     * Defines operations that can be used to transform the final output JSON into a normalized form. Operations are
     * executed in the order that they appear in the array.
     *
     * @return the normalizations
     */
    public List<NormalizationOperation> normalizations() {
      return normalizations;
    }

    /**
     * Gets the source.
     *
     * Object containing source parameters for the configuration.
     *
     * @return the source
     */
    public Source source() {
      return source;
    }

    private UpdateConfigurationOptions(UpdateConfigurationOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.configurationId, 'configurationId cannot be empty');
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      environmentId = builder.environmentId;
      configurationId = builder.configurationId;
      name = builder.name;
      description = builder.description;
      conversions = builder.conversions;
      enrichments = builder.enrichments;
      normalizations = builder.normalizations;
      source = builder.source;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder newBuilder() {
      return new UpdateConfigurationOptionsBuilder(this);
    }
  }

  /**
   * UpdateConfigurationOptions Builder.
   */
  public class UpdateConfigurationOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String configurationId;
    private String name;
    private String description;
    private Conversions conversions;
    private List<Enrichment> enrichments;
    private List<NormalizationOperation> normalizations;
    private Source source;

    private UpdateConfigurationOptionsBuilder(UpdateConfigurationOptions updateConfigurationOptions) {
      environmentId = updateConfigurationOptions.environmentId;
      configurationId = updateConfigurationOptions.configurationId;
      name = updateConfigurationOptions.name;
      description = updateConfigurationOptions.description;
      conversions = updateConfigurationOptions.conversions;
      enrichments = updateConfigurationOptions.enrichments;
      normalizations = updateConfigurationOptions.normalizations;
      source = updateConfigurationOptions.source;
      this.requestHeaders.putAll(updateConfigurationOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateConfigurationOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param configurationId the configurationId
     * @param name the name
     */
    public UpdateConfigurationOptionsBuilder(String environmentId, String configurationId, String name) {
      this.environmentId = environmentId;
      this.configurationId = configurationId;
      this.name = name;
    }

    /**
     * Builds a UpdateConfigurationOptions.
     *
     * @return the updateConfigurationOptions
     */
    public UpdateConfigurationOptions build() {
      return new UpdateConfigurationOptions(this);
    }

    /**
     * Adds an enrichments to enrichments.
     *
     * @param enrichments the new enrichments
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder addEnrichments(Enrichment enrichments) {
      IBMWatsonValidator.notNull(enrichments, 'enrichments cannot be null');
      if (this.enrichments == null) {
        this.enrichments = new List<Enrichment>();
      }
      this.enrichments.add(enrichments);
      return this;
    }

    /**
     * Adds an normalizations to normalizations.
     *
     * @param normalizations the new normalizations
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder addNormalizations(NormalizationOperation normalizations) {
      IBMWatsonValidator.notNull(normalizations, 'normalizations cannot be null');
      if (this.normalizations == null) {
        this.normalizations = new List<NormalizationOperation>();
      }
      this.normalizations.add(normalizations);
      return this;
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the configurationId.
     *
     * @param configurationId the configurationId
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder configurationId(String configurationId) {
      this.configurationId = configurationId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the conversions.
     *
     * @param conversions the conversions
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder conversions(Conversions conversions) {
      this.conversions = conversions;
      return this;
    }

    /**
     * Set the enrichments.
     * Existing enrichments will be replaced.
     *
     * @param enrichments the enrichments
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder enrichments(List<Enrichment> enrichments) {
      this.enrichments = enrichments;
      return this;
    }

    /**
     * Set the normalizations.
     * Existing normalizations will be replaced.
     *
     * @param normalizations the normalizations
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder normalizations(List<NormalizationOperation> normalizations) {
      this.normalizations = normalizations;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder source(Source source) {
      this.source = source;
      return this;
    }

    /**
     * Set the configuration.
     *
     * @param configuration the configuration
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder configuration(Configuration configuration) {
      this.name = configuration.getName();
      this.description = configuration.getDescription();
      this.conversions = configuration.getConversions();
      this.enrichments = configuration.getEnrichments();
      this.normalizations = configuration.getNormalizations();
      this.source = configuration.getSource();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateConfigurationOptions builder
     */
    public UpdateConfigurationOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateCredentials options.
   */
  public class UpdateCredentialsOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String credentialId;
    private String sourceType;
    private CredentialDetails credentialDetails;
    private String status;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the credentialId.
     *
     * The unique identifier for a set of source credentials.
     *
     * @return the credentialId
     */
    public String credentialId() {
      return credentialId;
    }

    /**
     * Gets the sourceType.
     *
     * The source that this credentials object connects to.
     * -  `box` indicates the credentials are used to connect an instance of Enterprise Box.
     * -  `salesforce` indicates the credentials are used to connect to Salesforce.
     * -  `sharepoint` indicates the credentials are used to connect to Microsoft SharePoint Online.
     * -  `web_crawl` indicates the credentials are used to perform a web crawl.
     * =  `cloud_object_storage` indicates the credentials are used to connect to an IBM Cloud Object Store.
     *
     * @return the sourceType
     */
    public String sourceType() {
      return sourceType;
    }

    /**
     * Gets the credentialDetails.
     *
     * Object containing details of the stored credentials.
     *
     * Obtain credentials for your source from the administrator of the source.
     *
     * @return the credentialDetails
     */
    public CredentialDetails credentialDetails() {
      return credentialDetails;
    }

    /**
     * Gets the status.
     *
     * The current status of this set of credentials. `connected` indicates that the credentials are available to use
     * with the source configuration of a collection. `invalid` refers to the credentials (for example, the password
     * provided has expired) and must be corrected before they can be used with a collection.
     *
     * @return the status
     */
    public String status() {
      return status;
    }

    private UpdateCredentialsOptions(UpdateCredentialsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.credentialId, 'credentialId cannot be empty');
      environmentId = builder.environmentId;
      credentialId = builder.credentialId;
      sourceType = builder.sourceType;
      credentialDetails = builder.credentialDetails;
      status = builder.status;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder newBuilder() {
      return new UpdateCredentialsOptionsBuilder(this);
    }
  }

  /**
   * UpdateCredentialsOptions Builder.
   */
  public class UpdateCredentialsOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String credentialId;
    private String sourceType;
    private CredentialDetails credentialDetails;
    private String status;

    private UpdateCredentialsOptionsBuilder(UpdateCredentialsOptions updateCredentialsOptions) {
      environmentId = updateCredentialsOptions.environmentId;
      credentialId = updateCredentialsOptions.credentialId;
      sourceType = updateCredentialsOptions.sourceType;
      credentialDetails = updateCredentialsOptions.credentialDetails;
      status = updateCredentialsOptions.status;
      this.requestHeaders.putAll(updateCredentialsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateCredentialsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param credentialId the credentialId
     */
    public UpdateCredentialsOptionsBuilder(String environmentId, String credentialId) {
      this.environmentId = environmentId;
      this.credentialId = credentialId;
    }

    /**
     * Builds a UpdateCredentialsOptions.
     *
     * @return the updateCredentialsOptions
     */
    public UpdateCredentialsOptions build() {
      return new UpdateCredentialsOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the credentialId.
     *
     * @param credentialId the credentialId
     * @return the UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder credentialId(String credentialId) {
      this.credentialId = credentialId;
      return this;
    }

    /**
     * Set the sourceType.
     *
     * @param sourceType the sourceType
     * @return the UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder sourceType(String sourceType) {
      this.sourceType = sourceType;
      return this;
    }

    /**
     * Set the credentialDetails.
     *
     * @param credentialDetails the credentialDetails
     * @return the UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder credentialDetails(CredentialDetails credentialDetails) {
      this.credentialDetails = credentialDetails;
      return this;
    }

    /**
     * Set the status.
     *
     * @param status the status
     * @return the UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder status(String status) {
      this.status = status;
      return this;
    }

    /**
     * Set the credentials.
     *
     * @param credentials the credentials
     * @return the UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder credentials(Credentials credentials) {
      this.sourceType = credentials.getSourceType();
      this.credentialDetails = credentials.getCredentialDetails();
      this.status = credentials.getStatus();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateCredentialsOptions builder
     */
    public UpdateCredentialsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateDocument options.
   */
  public class UpdateDocumentOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String documentId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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

    private UpdateDocumentOptions(UpdateDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
      IBMWatsonValidator.isTrue(builder.file == null || builder.fileContentType != null, 'content type cannot be null if file is not null');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      documentId = builder.documentId;
      file = builder.file;
      filename = builder.filename;
      fileContentType = builder.fileContentType;
      metadata = builder.metadata;
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
    private String environmentId;
    private String collectionId;
    private String documentId;
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String metadata;

    private UpdateDocumentOptionsBuilder(UpdateDocumentOptions updateDocumentOptions) {
      environmentId = updateDocumentOptions.environmentId;
      collectionId = updateDocumentOptions.collectionId;
      documentId = updateDocumentOptions.documentId;
      file = updateDocumentOptions.file;
      filename = updateDocumentOptions.filename;
      fileContentType = updateDocumentOptions.fileContentType;
      metadata = updateDocumentOptions.metadata;
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
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param documentId the documentId
     */
    public UpdateDocumentOptionsBuilder(String environmentId, String collectionId, String documentId) {
      this.environmentId = environmentId;
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
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the UpdateDocumentOptions builder
     */
    public UpdateDocumentOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
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
   * The updateEnvironment options.
   */
  public class UpdateEnvironmentOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;
    private String description;
    private String size;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
    }

    /**
     * Gets the name.
     *
     * Name that identifies the environment.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * Description of the environment.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the size.
     *
     * Size that the environment should be increased to. Environment size cannot be modified when using a Lite plan.
     * Environment size can only increased and not decreased.
     *
     * @return the size
     */
    public String size() {
      return size;
    }

    private UpdateEnvironmentOptions(UpdateEnvironmentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      environmentId = builder.environmentId;
      name = builder.name;
      description = builder.description;
      size = builder.size;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateEnvironmentOptions builder
     */
    public UpdateEnvironmentOptionsBuilder newBuilder() {
      return new UpdateEnvironmentOptionsBuilder(this);
    }
  }

  /**
   * UpdateEnvironmentOptions Builder.
   */
  public class UpdateEnvironmentOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String name;
    private String description;
    private String size;

    private UpdateEnvironmentOptionsBuilder(UpdateEnvironmentOptions updateEnvironmentOptions) {
      environmentId = updateEnvironmentOptions.environmentId;
      name = updateEnvironmentOptions.name;
      description = updateEnvironmentOptions.description;
      size = updateEnvironmentOptions.size;
      this.requestHeaders.putAll(updateEnvironmentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateEnvironmentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     */
    public UpdateEnvironmentOptionsBuilder(String environmentId) {
      this.environmentId = environmentId;
    }

    /**
     * Builds a UpdateEnvironmentOptions.
     *
     * @return the updateEnvironmentOptions
     */
    public UpdateEnvironmentOptions build() {
      return new UpdateEnvironmentOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the UpdateEnvironmentOptions builder
     */
    public UpdateEnvironmentOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the UpdateEnvironmentOptions builder
     */
    public UpdateEnvironmentOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the UpdateEnvironmentOptions builder
     */
    public UpdateEnvironmentOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the size.
     *
     * @param size the size
     * @return the UpdateEnvironmentOptions builder
     */
    public UpdateEnvironmentOptionsBuilder size(String size) {
      this.size = size;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateEnvironmentOptions builder
     */
    public UpdateEnvironmentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updateTrainingExample options.
   */
  public class UpdateTrainingExampleOptions extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String exampleId;
    private String crossReference;
    private Long relevance;

    /**
     * Gets the environmentId.
     *
     * The ID of the environment.
     *
     * @return the environmentId
     */
    public String environmentId() {
      return environmentId;
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
     * Gets the exampleId.
     *
     * The ID of the document as it is indexed.
     *
     * @return the exampleId
     */
    public String exampleId() {
      return exampleId;
    }

    /**
     * Gets the crossReference.
     *
     * The example to add.
     *
     * @return the crossReference
     */
    public String crossReference() {
      return crossReference;
    }

    /**
     * Gets the relevance.
     *
     * The relevance value for this example.
     *
     * @return the relevance
     */
    public Long relevance() {
      return relevance;
    }

    private UpdateTrainingExampleOptions(UpdateTrainingExampleOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.environmentId, 'environmentId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.queryId, 'queryId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.exampleId, 'exampleId cannot be empty');
      environmentId = builder.environmentId;
      collectionId = builder.collectionId;
      queryId = builder.queryId;
      exampleId = builder.exampleId;
      crossReference = builder.crossReference;
      relevance = builder.relevance;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder newBuilder() {
      return new UpdateTrainingExampleOptionsBuilder(this);
    }
  }

  /**
   * UpdateTrainingExampleOptions Builder.
   */
  public class UpdateTrainingExampleOptionsBuilder extends IBMWatsonOptionsModel {
    private String environmentId;
    private String collectionId;
    private String queryId;
    private String exampleId;
    private String crossReference;
    private Long relevance;

    private UpdateTrainingExampleOptionsBuilder(UpdateTrainingExampleOptions updateTrainingExampleOptions) {
      environmentId = updateTrainingExampleOptions.environmentId;
      collectionId = updateTrainingExampleOptions.collectionId;
      queryId = updateTrainingExampleOptions.queryId;
      exampleId = updateTrainingExampleOptions.exampleId;
      crossReference = updateTrainingExampleOptions.crossReference;
      relevance = updateTrainingExampleOptions.relevance;
      this.requestHeaders.putAll(updateTrainingExampleOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateTrainingExampleOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param environmentId the environmentId
     * @param collectionId the collectionId
     * @param queryId the queryId
     * @param exampleId the exampleId
     */
    public UpdateTrainingExampleOptionsBuilder(String environmentId, String collectionId, String queryId, String exampleId) {
      this.environmentId = environmentId;
      this.collectionId = collectionId;
      this.queryId = queryId;
      this.exampleId = exampleId;
    }

    /**
     * Builds a UpdateTrainingExampleOptions.
     *
     * @return the updateTrainingExampleOptions
     */
    public UpdateTrainingExampleOptions build() {
      return new UpdateTrainingExampleOptions(this);
    }

    /**
     * Set the environmentId.
     *
     * @param environmentId the environmentId
     * @return the UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder environmentId(String environmentId) {
      this.environmentId = environmentId;
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the queryId.
     *
     * @param queryId the queryId
     * @return the UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder queryId(String queryId) {
      this.queryId = queryId;
      return this;
    }

    /**
     * Set the exampleId.
     *
     * @param exampleId the exampleId
     * @return the UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder exampleId(String exampleId) {
      this.exampleId = exampleId;
      return this;
    }

    /**
     * Set the crossReference.
     *
     * @param crossReference the crossReference
     * @return the UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder crossReference(String crossReference) {
      this.crossReference = crossReference;
      return this;
    }

    /**
     * Set the relevance.
     *
     * @param relevance the relevance
     * @return the UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder relevance(Long relevance) {
      this.relevance = relevance;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateTrainingExampleOptions builder
     */
    public UpdateTrainingExampleOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Object containing heading detection conversion settings for Microsoft Word documents.
   */
  public class WordHeadingDetection extends IBMWatsonGenericModel {
    private List<FontSetting> fonts;
    private List<WordStyle> styles;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WordHeadingDetection() { }

    /**
     * Gets the fonts.
     *
     * Array of font matching configurations.
     *
     * @return the fonts
     */
    @AuraEnabled
    public List<FontSetting> getFonts() {
      return fonts;
    }

    /**
     * Gets the styles.
     *
     * Array of Microsoft Word styles to convert.
     *
     * @return the styles
     */
    @AuraEnabled
    public List<WordStyle> getStyles() {
      return styles;
    }
  
    private WordHeadingDetection(WordHeadingDetectionBuilder builder) {
      this.fonts = builder.fonts;
      this.styles = builder.styles;
    }

    /**
     * New builder.
     *
     * @return a WordHeadingDetection builder
     */
    public WordHeadingDetectionBuilder newBuilder() {
      return new WordHeadingDetectionBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      WordHeadingDetection ret = (WordHeadingDetection) super.deserialize(jsonString, jsonMap, classType);
      WordHeadingDetectionBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for fonts
      List<FontSetting> newFonts = new List<FontSetting>();
      List<FontSetting> deserializedFonts = ret.getFonts();
      if (deserializedFonts != null) {
        for (Integer i = 0; i < deserializedFonts.size(); i++) {
          FontSetting currentItem = ret.getFonts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('fonts');
          FontSetting newItem = (FontSetting) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), FontSetting.class);
          newFonts.add(newItem);
        }
        retBuilder.fonts(newFonts);
      }

      // calling custom deserializer for styles
      List<WordStyle> newStyles = new List<WordStyle>();
      List<WordStyle> deserializedStyles = ret.getStyles();
      if (deserializedStyles != null) {
        for (Integer i = 0; i < deserializedStyles.size(); i++) {
          WordStyle currentItem = ret.getStyles().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('styles');
          WordStyle newItem = (WordStyle) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), WordStyle.class);
          newStyles.add(newItem);
        }
        retBuilder.styles(newStyles);
      }

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for fonts
      if (fonts != null) {
        List<Object> fontsJsonList = new List<Object>();
        for (FontSetting listItem : fonts) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          fontsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('fonts', fontsJsonList);
      }

      // performing custom serialization for styles
      if (styles != null) {
        List<Object> stylesJsonList = new List<Object>();
        for (WordStyle listItem : styles) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          stylesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('styles', stylesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * WordHeadingDetection Builder.
   */
  public class WordHeadingDetectionBuilder {
    private List<FontSetting> fonts;
    private List<WordStyle> styles;

    private WordHeadingDetectionBuilder(WordHeadingDetection wordHeadingDetection) {
      this.fonts = wordHeadingDetection.fonts;
      this.styles = wordHeadingDetection.styles;
    }

    /**
     * Instantiates a new builder.
     */
    public WordHeadingDetectionBuilder() {
    }

    /**
     * Builds a WordHeadingDetection.
     *
     * @return the wordHeadingDetection
     */
    public WordHeadingDetection build() {
      return new WordHeadingDetection(this);
    }

    /**
     * Adds an fonts to fonts.
     *
     * @param fonts the new fonts
     * @return the WordHeadingDetection builder
     */
    public WordHeadingDetectionBuilder addFonts(FontSetting fonts) {
      IBMWatsonValidator.notNull(fonts, 'fonts cannot be null');
      if (this.fonts == null) {
        this.fonts = new List<FontSetting>();
      }
      this.fonts.add(fonts);
      return this;
    }

    /**
     * Adds an styles to styles.
     *
     * @param styles the new styles
     * @return the WordHeadingDetection builder
     */
    public WordHeadingDetectionBuilder addStyles(WordStyle styles) {
      IBMWatsonValidator.notNull(styles, 'styles cannot be null');
      if (this.styles == null) {
        this.styles = new List<WordStyle>();
      }
      this.styles.add(styles);
      return this;
    }

    /**
     * Set the fonts.
     * Existing fonts will be replaced.
     *
     * @param fonts the fonts
     * @return the WordHeadingDetection builder
     */
    public WordHeadingDetectionBuilder fonts(List<FontSetting> fonts) {
      this.fonts = fonts;
      return this;
    }

    /**
     * Set the styles.
     * Existing styles will be replaced.
     *
     * @param styles the styles
     * @return the WordHeadingDetection builder
     */
    public WordHeadingDetectionBuilder styles(List<WordStyle> styles) {
      this.styles = styles;
      return this;
    }
  }

  /**
   * A list of Word conversion settings.
   */
  public class WordSettings extends IBMWatsonGenericModel {
    private WordHeadingDetection heading;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WordSettings() { }

    /**
     * Gets the heading.
     *
     * Object containing heading detection conversion settings for Microsoft Word documents.
     *
     * @return the heading
     */
    @AuraEnabled
    public WordHeadingDetection getHeading() {
      return heading;
    }
  
    private WordSettings(WordSettingsBuilder builder) {
      this.heading = builder.heading;
    }

    /**
     * New builder.
     *
     * @return a WordSettings builder
     */
    public WordSettingsBuilder newBuilder() {
      return new WordSettingsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      WordSettings ret = (WordSettings) super.deserialize(jsonString, jsonMap, classType);
      WordSettingsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for heading
      Map<String, Object> headingMap = (Map<String, Object>) jsonMap.get('heading');
      WordHeadingDetection newHeading = (WordHeadingDetection) new WordHeadingDetection().deserialize(JSON.serialize(headingMap, true), headingMap, WordHeadingDetection.class);
      retBuilder.heading(newHeading);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for heading
      if (heading != null) {
        String headingJsonString = JSON.serialize(heading.replacePropertyNames(), true);
        jsonMap.put('heading', JSON.deserializeUntyped(headingJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * WordSettings Builder.
   */
  public class WordSettingsBuilder {
    private WordHeadingDetection heading;

    private WordSettingsBuilder(WordSettings wordSettings) {
      this.heading = wordSettings.heading;
    }

    /**
     * Instantiates a new builder.
     */
    public WordSettingsBuilder() {
    }

    /**
     * Builds a WordSettings.
     *
     * @return the wordSettings
     */
    public WordSettings build() {
      return new WordSettings(this);
    }

    /**
     * Set the heading.
     *
     * @param heading the heading
     * @return the WordSettings builder
     */
    public WordSettingsBuilder heading(WordHeadingDetection heading) {
      this.heading = heading;
      return this;
    }
  }

  /**
   * Microsoft Word styles to convert into a specified HTML head level.
   */
  public class WordStyle extends IBMWatsonGenericModel {
    private Long level;
    private List<String> names;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public WordStyle() { }

    /**
     * Gets the level.
     *
     * HTML head level that content matching this style is tagged with.
     *
     * @return the level
     */
    @AuraEnabled
    public Long getLevel() {
      return level;
    }

    /**
     * Gets the names.
     *
     * Array of word style names to convert.
     *
     * @return the names
     */
    @AuraEnabled
    public List<String> getNames() {
      return names;
    }
  
    private WordStyle(WordStyleBuilder builder) {
      this.level = builder.level;
      this.names = builder.names;
    }

    /**
     * New builder.
     *
     * @return a WordStyle builder
     */
    public WordStyleBuilder newBuilder() {
      return new WordStyleBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      WordStyle ret = (WordStyle) super.deserialize(jsonString, jsonMap, classType);
      WordStyleBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * WordStyle Builder.
   */
  public class WordStyleBuilder {
    private Long level;
    private List<String> names;

    private WordStyleBuilder(WordStyle wordStyle) {
      this.level = wordStyle.level;
      this.names = wordStyle.names;
    }

    /**
     * Instantiates a new builder.
     */
    public WordStyleBuilder() {
    }

    /**
     * Builds a WordStyle.
     *
     * @return the wordStyle
     */
    public WordStyle build() {
      return new WordStyle(this);
    }

    /**
     * Adds an names to names.
     *
     * @param names the new names
     * @return the WordStyle builder
     */
    public WordStyleBuilder addNames(String names) {
      IBMWatsonValidator.notNull(names, 'names cannot be null');
      if (this.names == null) {
        this.names = new List<String>();
      }
      this.names.add(names);
      return this;
    }

    /**
     * Set the level.
     *
     * @param level the level
     * @return the WordStyle builder
     */
    public WordStyleBuilder level(Long level) {
      this.level = level;
      return this;
    }

    /**
     * Set the names.
     * Existing names will be replaced.
     *
     * @param names the names
     * @return the WordStyle builder
     */
    public WordStyleBuilder names(List<String> names) {
      this.names = names;
      return this;
    }
  }

  /**
   * Object containing an array of XPaths.
   */
  public class XPathPatterns extends IBMWatsonGenericModel {
    private List<String> xpaths;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public XPathPatterns() { }

    /**
     * Gets the xpaths.
     *
     * An array to XPaths.
     *
     * @return the xpaths
     */
    @AuraEnabled
    public List<String> getXpaths() {
      return xpaths;
    }
  
    private XPathPatterns(XPathPatternsBuilder builder) {
      this.xpaths = builder.xpaths;
    }

    /**
     * New builder.
     *
     * @return a XPathPatterns builder
     */
    public XPathPatternsBuilder newBuilder() {
      return new XPathPatternsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      XPathPatterns ret = (XPathPatterns) super.deserialize(jsonString, jsonMap, classType);
      XPathPatternsBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * XPathPatterns Builder.
   */
  public class XPathPatternsBuilder {
    private List<String> xpaths;

    private XPathPatternsBuilder(XPathPatterns xPathPatterns) {
      this.xpaths = xPathPatterns.xpaths;
    }

    /**
     * Instantiates a new builder.
     */
    public XPathPatternsBuilder() {
    }

    /**
     * Builds a XPathPatterns.
     *
     * @return the xPathPatterns
     */
    public XPathPatterns build() {
      return new XPathPatterns(this);
    }

    /**
     * Adds an xpaths to xpaths.
     *
     * @param xpaths the new xpaths
     * @return the XPathPatterns builder
     */
    public XPathPatternsBuilder addXpaths(String xpaths) {
      IBMWatsonValidator.notNull(xpaths, 'xpaths cannot be null');
      if (this.xpaths == null) {
        this.xpaths = new List<String>();
      }
      this.xpaths.add(xpaths);
      return this;
    }

    /**
     * Set the xpaths.
     * Existing xpaths will be replaced.
     *
     * @param xpaths the xpaths
     * @return the XPathPatterns builder
     */
    public XPathPatternsBuilder xpaths(List<String> xpaths) {
      this.xpaths = xpaths;
      return this;
    }
  }

}