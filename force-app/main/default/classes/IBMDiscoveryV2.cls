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

/**
 * IBM Watson&trade; Discovery for IBM Cloud Pak for Data is a cognitive search and content analytics engine that you
 * can add to applications to identify patterns, trends and actionable insights to drive better decision-making.
 * Securely unify structured and unstructured data with pre-enriched content, and use a simplified query language to
 * eliminate the need for manual filtering of results.
 *
 * @version V2
 * @see <a href="https://cloud.ibm.com/docs/discovery-data/">Discovery</a>
 */
public class IBMDiscoveryV2 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'discovery';

  private String versionDate;

  /**
   * Instantiates a new `IBMDiscoveryV2`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMDiscoveryV2(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMDiscoveryV2`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMDiscoveryV2(String versionDate, IBMWatsonAuthenticator authenticator) {
    super(SERVICE_NAME, 'v2', authenticator);

    if (String.isBlank(versionDate)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('versionDate cannot be null.');
    }
    this.versionDate = versionDate;
  }

  /**
   * List collections.
   *
   * Lists existing collections for the specified project.
   *
   * @param listCollectionsOptions the {@link IBMDiscoveryV2Models.ListCollectionsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.ListCollectionsResponse} with the response
   */
  public IBMDiscoveryV2Models.ListCollectionsResponse listCollections(IBMDiscoveryV2Models.ListCollectionsOptions listCollectionsOptions) {
    IBMWatsonValidator.notNull(listCollectionsOptions, 'listCollectionsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v2/projects/{0}/collections', new String[]{ listCollectionsOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=listCollections');
    Map<String, String> requestHeaders = (listCollectionsOptions != null) ? listCollectionsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV2Models.ListCollectionsResponse) createServiceCall(builder.build(), IBMDiscoveryV2Models.ListCollectionsResponse.class);
  }

  /**
   * Query a project.
   *
   * By using this method, you can construct queries. For details, see the [Discovery
   * documentation](https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-query-concepts).
   *
   * @param queryOptions the {@link IBMDiscoveryV2Models.QueryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.QueryResponse} with the response
   */
  public IBMDiscoveryV2Models.QueryResponse query(IBMDiscoveryV2Models.QueryOptions queryOptions) {
    IBMWatsonValidator.notNull(queryOptions, 'queryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v2/projects/{0}/query', new String[]{ queryOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=query');
    Map<String, String> requestHeaders = (queryOptions != null) ? queryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (queryOptions.collectionIds() != null) {
      contentJson.put('collection_ids', queryOptions.collectionIds());
    }
    if (queryOptions.filter() != null) {
      contentJson.put('filter', queryOptions.filter());
    }
    if (queryOptions.query() != null) {
      contentJson.put('query', queryOptions.query());
    }
    if (queryOptions.naturalLanguageQuery() != null) {
      contentJson.put('natural_language_query', queryOptions.naturalLanguageQuery());
    }
    if (queryOptions.aggregation() != null) {
      contentJson.put('aggregation', queryOptions.aggregation());
    }
    if (queryOptions.count() != null) {
      contentJson.put('count', queryOptions.count());
    }
    if (queryOptions.xReturn() != null) {
      contentJson.put('return', queryOptions.xReturn());
    }
    if (queryOptions.offset() != null) {
      contentJson.put('offset', queryOptions.offset());
    }
    if (queryOptions.xSort() != null) {
      contentJson.put('sort', queryOptions.xSort());
    }
    if (queryOptions.highlight() != null) {
      contentJson.put('highlight', queryOptions.highlight());
    }
    if (queryOptions.spellingSuggestions() != null) {
      contentJson.put('spelling_suggestions', queryOptions.spellingSuggestions());
    }
    if (queryOptions.tableResults() != null) {
      contentJson.put('table_results', queryOptions.tableResults().replacePropertyNames());
    }
    if (queryOptions.suggestedRefinements() != null) {
      contentJson.put('suggested_refinements', queryOptions.suggestedRefinements().replacePropertyNames());
    }
    if (queryOptions.passages() != null) {
      contentJson.put('passages', queryOptions.passages().replacePropertyNames());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV2Models.QueryResponse) createServiceCall(builder.build(), IBMDiscoveryV2Models.QueryResponse.class);
  }

  /**
   * Get Autocomplete Suggestions.
   *
   * Returns completion query suggestions for the specified prefix.
   *
   * @param getAutocompletionOptions the {@link IBMDiscoveryV2Models.GetAutocompletionOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.Completions} with the response
   */
  public IBMDiscoveryV2Models.Completions getAutocompletion(IBMDiscoveryV2Models.GetAutocompletionOptions getAutocompletionOptions) {
    IBMWatsonValidator.notNull(getAutocompletionOptions, 'getAutocompletionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v2/projects/{0}/autocompletion', new String[]{ getAutocompletionOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=getAutocompletion');
    Map<String, String> requestHeaders = (getAutocompletionOptions != null) ? getAutocompletionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getAutocompletionOptions.prefix() != null) {
      builder.query('prefix', getAutocompletionOptions.prefix());
    }
    if (getAutocompletionOptions.collectionIds() != null) {
      builder.query('collection_ids', String.join(getAutocompletionOptions.collectionIds(), ','));
    }
    if (getAutocompletionOptions.field() != null) {
      builder.query('field', getAutocompletionOptions.field());
    }
    if (getAutocompletionOptions.count() != null) {
      builder.query('count', String.valueOf(getAutocompletionOptions.count()));
    }

    return (IBMDiscoveryV2Models.Completions) createServiceCall(builder.build(), IBMDiscoveryV2Models.Completions.class);
  }

  /**
   * Query system notices.
   *
   * Queries for notices (errors or warnings) that might have been generated by the system. Notices are generated when
   * ingesting documents and performing relevance training.
   *
   * @param queryNoticesOptions the {@link IBMDiscoveryV2Models.QueryNoticesOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.QueryNoticesResponse} with the response
   */
  public IBMDiscoveryV2Models.QueryNoticesResponse queryNotices(IBMDiscoveryV2Models.QueryNoticesOptions queryNoticesOptions) {
    IBMWatsonValidator.notNull(queryNoticesOptions, 'queryNoticesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v2/projects/{0}/notices', new String[]{ queryNoticesOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=queryNotices');
    Map<String, String> requestHeaders = (queryNoticesOptions != null) ? queryNoticesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (queryNoticesOptions.filter() != null) {
      builder.query('filter', queryNoticesOptions.filter());
    }
    if (queryNoticesOptions.query() != null) {
      builder.query('query', queryNoticesOptions.query());
    }
    if (queryNoticesOptions.naturalLanguageQuery() != null) {
      builder.query('natural_language_query', queryNoticesOptions.naturalLanguageQuery());
    }
    if (queryNoticesOptions.count() != null) {
      builder.query('count', String.valueOf(queryNoticesOptions.count()));
    }
    if (queryNoticesOptions.offset() != null) {
      builder.query('offset', String.valueOf(queryNoticesOptions.offset()));
    }

    return (IBMDiscoveryV2Models.QueryNoticesResponse) createServiceCall(builder.build(), IBMDiscoveryV2Models.QueryNoticesResponse.class);
  }

  /**
   * List fields.
   *
   * Gets a list of the unique fields (and their types) stored in the the specified collections.
   *
   * @param listFieldsOptions the {@link IBMDiscoveryV2Models.ListFieldsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.ListFieldsResponse} with the response
   */
  public IBMDiscoveryV2Models.ListFieldsResponse listFields(IBMDiscoveryV2Models.ListFieldsOptions listFieldsOptions) {
    IBMWatsonValidator.notNull(listFieldsOptions, 'listFieldsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v2/projects/{0}/fields', new String[]{ listFieldsOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=listFields');
    Map<String, String> requestHeaders = (listFieldsOptions != null) ? listFieldsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (listFieldsOptions.collectionIds() != null) {
      builder.query('collection_ids', String.join(listFieldsOptions.collectionIds(), ','));
    }

    return (IBMDiscoveryV2Models.ListFieldsResponse) createServiceCall(builder.build(), IBMDiscoveryV2Models.ListFieldsResponse.class);
  }

  /**
   * Configuration settings for components.
   *
   * Returns default configuration settings for components.
   *
   * @param getComponentSettingsOptions the {@link IBMDiscoveryV2Models.GetComponentSettingsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.ComponentSettingsResponse} with the response
   */
  public IBMDiscoveryV2Models.ComponentSettingsResponse getComponentSettings(IBMDiscoveryV2Models.GetComponentSettingsOptions getComponentSettingsOptions) {
    IBMWatsonValidator.notNull(getComponentSettingsOptions, 'getComponentSettingsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v2/projects/{0}/component_settings', new String[]{ getComponentSettingsOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=getComponentSettings');
    Map<String, String> requestHeaders = (getComponentSettingsOptions != null) ? getComponentSettingsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV2Models.ComponentSettingsResponse) createServiceCall(builder.build(), IBMDiscoveryV2Models.ComponentSettingsResponse.class);
  }

  /**
   * Add a document.
   *
   * Add a document to a collection with optional metadata.
   *
   *  Returns immediately after the system has accepted the document for processing.
   *
   *   * The user must provide document content, metadata, or both. If the request is missing both document content and
   * metadata, it is rejected.
   *
   *   * The user can set the **Content-Type** parameter on the **file** part to indicate the media type of the
   * document. If the **Content-Type** parameter is missing or is one of the generic media types (for example,
   * `application/octet-stream`), then the service attempts to automatically detect the document's media type.
   *
   *   * The following field names are reserved and will be filtered out if present after normalization: `id`, `score`,
   * `highlight`, and any field with the prefix of: `_`, `+`, or `-`
   *
   *   * Fields with empty name values after normalization are filtered out before indexing.
   *
   *   * Fields containing the following characters after normalization are filtered out before indexing: `#` and `,`
   *
   *   If the document is uploaded to a collection that has it's data shared with another collection, the
   * **X-Watson-Discovery-Force** header must be set to `true`.
   *
   *  **Note:** Documents can be added with a specific **document_id** by using the
   * **_/v2/projects/{project_id}/collections/{collection_id}/documents** method.
   *
   * **Note:** This operation only works on collections created to accept direct file uploads. It cannot be used to
   * modify a collection that connects to an external source such as Microsoft SharePoint.
   *
   * @param addDocumentOptions the {@link IBMDiscoveryV2Models.AddDocumentOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.DocumentAccepted} with the response
   */
  public IBMDiscoveryV2Models.DocumentAccepted addDocument(IBMDiscoveryV2Models.AddDocumentOptions addDocumentOptions) {
    IBMWatsonValidator.notNull(addDocumentOptions, 'addDocumentOptions cannot be null');
    IBMWatsonValidator.isTrue((addDocumentOptions.file() != null) || (addDocumentOptions.metadata() != null), 'At least one of file or metadata must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v2/projects/{0}/collections/{1}/documents', new String[]{ addDocumentOptions.projectId(), addDocumentOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    if (addDocumentOptions.xWatsonDiscoveryForce() != null) {
      builder.addHeader('X-Watson-Discovery-Force', addDocumentOptions.xWatsonDiscoveryForce());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=addDocument');
    Map<String, String> requestHeaders = (addDocumentOptions != null) ? addDocumentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    if (addDocumentOptions.file() != null) {
      IBMWatsonRequestBody fileBody = IBMWatsonRequestBody.create(addDocumentOptions.file(), addDocumentOptions.fileContentType());
      multipartBuilder.addFormDataPart('file', addDocumentOptions.filename(), fileBody);
    }
    if (addDocumentOptions.metadata() != null) {
      multipartBuilder.addFormDataPart('metadata', addDocumentOptions.metadata());
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMDiscoveryV2Models.DocumentAccepted) createServiceCall(builder.build(), IBMDiscoveryV2Models.DocumentAccepted.class);
  }

  /**
   * Update a document.
   *
   * Replace an existing document or add a document with a specified **document_id**. Starts ingesting a document with
   * optional metadata.
   *
   * If the document is uploaded to a collection that has it's data shared with another collection, the
   * **X-Watson-Discovery-Force** header must be set to `true`.
   *
   * **Note:** When uploading a new document with this method it automatically replaces any document stored with the
   * same **document_id** if it exists.
   *
   * **Note:** This operation only works on collections created to accept direct file uploads. It cannot be used to
   * modify a collection that connects to an external source such as Microsoft SharePoint.
   *
   * @param updateDocumentOptions the {@link IBMDiscoveryV2Models.UpdateDocumentOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.DocumentAccepted} with the response
   */
  public IBMDiscoveryV2Models.DocumentAccepted updateDocument(IBMDiscoveryV2Models.UpdateDocumentOptions updateDocumentOptions) {
    IBMWatsonValidator.notNull(updateDocumentOptions, 'updateDocumentOptions cannot be null');
    IBMWatsonValidator.isTrue((updateDocumentOptions.file() != null) || (updateDocumentOptions.metadata() != null), 'At least one of file or metadata must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v2/projects/{0}/collections/{1}/documents/{2}', new String[]{ updateDocumentOptions.projectId(), updateDocumentOptions.collectionId(), updateDocumentOptions.documentId() }));
    builder.addHeader('Accept', 'application/json');
    if (updateDocumentOptions.xWatsonDiscoveryForce() != null) {
      builder.addHeader('X-Watson-Discovery-Force', updateDocumentOptions.xWatsonDiscoveryForce());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=updateDocument');
    Map<String, String> requestHeaders = (updateDocumentOptions != null) ? updateDocumentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    if (updateDocumentOptions.file() != null) {
      IBMWatsonRequestBody fileBody = IBMWatsonRequestBody.create(updateDocumentOptions.file(), updateDocumentOptions.fileContentType());
      multipartBuilder.addFormDataPart('file', updateDocumentOptions.filename(), fileBody);
    }
    if (updateDocumentOptions.metadata() != null) {
      multipartBuilder.addFormDataPart('metadata', updateDocumentOptions.metadata());
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMDiscoveryV2Models.DocumentAccepted) createServiceCall(builder.build(), IBMDiscoveryV2Models.DocumentAccepted.class);
  }

  /**
   * Delete a document.
   *
   * If the given document ID is invalid, or if the document is not found, then the a success response is returned (HTTP
   * status code `200`) with the status set to 'deleted'.
   *
   * **Note:** This operation only works on collections created to accept direct file uploads. It cannot be used to
   * modify a collection that connects to an external source such as Microsoft SharePoint.
   *
   * @param deleteDocumentOptions the {@link IBMDiscoveryV2Models.DeleteDocumentOptions} containing the options for the call
   * @return the service call
   */
  public void deleteDocument(IBMDiscoveryV2Models.DeleteDocumentOptions deleteDocumentOptions) {
    IBMWatsonValidator.notNull(deleteDocumentOptions, 'deleteDocumentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v2/projects/{0}/collections/{1}/documents/{2}', new String[]{ deleteDocumentOptions.projectId(), deleteDocumentOptions.collectionId(), deleteDocumentOptions.documentId() }));
    builder.addHeader('Accept', 'application/json');
    if (deleteDocumentOptions.xWatsonDiscoveryForce() != null) {
      builder.addHeader('X-Watson-Discovery-Force', deleteDocumentOptions.xWatsonDiscoveryForce());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=deleteDocument');
    Map<String, String> requestHeaders = (deleteDocumentOptions != null) ? deleteDocumentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * List training queries.
   *
   * List the training queries for the specified project.
   *
   * @param listTrainingQueriesOptions the {@link IBMDiscoveryV2Models.ListTrainingQueriesOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.TrainingQuerySet} with the response
   */
  public IBMDiscoveryV2Models.TrainingQuerySet listTrainingQueries(IBMDiscoveryV2Models.ListTrainingQueriesOptions listTrainingQueriesOptions) {
    IBMWatsonValidator.notNull(listTrainingQueriesOptions, 'listTrainingQueriesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v2/projects/{0}/training_data/queries', new String[]{ listTrainingQueriesOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=listTrainingQueries');
    Map<String, String> requestHeaders = (listTrainingQueriesOptions != null) ? listTrainingQueriesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV2Models.TrainingQuerySet) createServiceCall(builder.build(), IBMDiscoveryV2Models.TrainingQuerySet.class);
  }

  /**
   * Delete training queries.
   *
   * Removes all training queries for the specified project.
   *
   * @param deleteTrainingQueriesOptions the {@link IBMDiscoveryV2Models.DeleteTrainingQueriesOptions} containing the options for the call
   * @return the service call
   */
  public void deleteTrainingQueries(IBMDiscoveryV2Models.DeleteTrainingQueriesOptions deleteTrainingQueriesOptions) {
    IBMWatsonValidator.notNull(deleteTrainingQueriesOptions, 'deleteTrainingQueriesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v2/projects/{0}/training_data/queries', new String[]{ deleteTrainingQueriesOptions.projectId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=deleteTrainingQueries');
    Map<String, String> requestHeaders = (deleteTrainingQueriesOptions != null) ? deleteTrainingQueriesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Create training query.
   *
   * Add a query to the training data for this project. The query can contain a filter and natural language query.
   *
   * @param createTrainingQueryOptions the {@link IBMDiscoveryV2Models.CreateTrainingQueryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.TrainingQuery} with the response
   */
  public IBMDiscoveryV2Models.TrainingQuery createTrainingQuery(IBMDiscoveryV2Models.CreateTrainingQueryOptions createTrainingQueryOptions) {
    IBMWatsonValidator.notNull(createTrainingQueryOptions, 'createTrainingQueryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v2/projects/{0}/training_data/queries', new String[]{ createTrainingQueryOptions.projectId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=createTrainingQuery');
    Map<String, String> requestHeaders = (createTrainingQueryOptions != null) ? createTrainingQueryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('natural_language_query', createTrainingQueryOptions.naturalLanguageQuery());
    List<Object> examplesList = new List<Object>();
    for (IBMDiscoveryV2Models.TrainingExample examplesItem : createTrainingQueryOptions.examples()) {
      examplesList.add(examplesItem.replacePropertyNames());
    }
    contentJson.put('examples', examplesList);
    if (createTrainingQueryOptions.filter() != null) {
      contentJson.put('filter', createTrainingQueryOptions.filter());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV2Models.TrainingQuery) createServiceCall(builder.build(), IBMDiscoveryV2Models.TrainingQuery.class);
  }

  /**
   * Get a training data query.
   *
   * Get details for a specific training data query, including the query string and all examples.
   *
   * @param getTrainingQueryOptions the {@link IBMDiscoveryV2Models.GetTrainingQueryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.TrainingQuery} with the response
   */
  public IBMDiscoveryV2Models.TrainingQuery getTrainingQuery(IBMDiscoveryV2Models.GetTrainingQueryOptions getTrainingQueryOptions) {
    IBMWatsonValidator.notNull(getTrainingQueryOptions, 'getTrainingQueryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v2/projects/{0}/training_data/queries/{1}', new String[]{ getTrainingQueryOptions.projectId(), getTrainingQueryOptions.queryId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=getTrainingQuery');
    Map<String, String> requestHeaders = (getTrainingQueryOptions != null) ? getTrainingQueryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV2Models.TrainingQuery) createServiceCall(builder.build(), IBMDiscoveryV2Models.TrainingQuery.class);
  }

  /**
   * Update a training query.
   *
   * Updates an existing training query and it's examples.
   *
   * @param updateTrainingQueryOptions the {@link IBMDiscoveryV2Models.UpdateTrainingQueryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV2Models.TrainingQuery} with the response
   */
  public IBMDiscoveryV2Models.TrainingQuery updateTrainingQuery(IBMDiscoveryV2Models.UpdateTrainingQueryOptions updateTrainingQueryOptions) {
    IBMWatsonValidator.notNull(updateTrainingQueryOptions, 'updateTrainingQueryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v2/projects/{0}/training_data/queries/{1}', new String[]{ updateTrainingQueryOptions.projectId(), updateTrainingQueryOptions.queryId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V2;operation_id=updateTrainingQuery');
    Map<String, String> requestHeaders = (updateTrainingQueryOptions != null) ? updateTrainingQueryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('natural_language_query', updateTrainingQueryOptions.naturalLanguageQuery());
    List<Object> examplesList = new List<Object>();
    for (IBMDiscoveryV2Models.TrainingExample examplesItem : updateTrainingQueryOptions.examples()) {
      examplesList.add(examplesItem.replacePropertyNames());
    }
    contentJson.put('examples', examplesList);
    if (updateTrainingQueryOptions.filter() != null) {
      contentJson.put('filter', updateTrainingQueryOptions.filter());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV2Models.TrainingQuery) createServiceCall(builder.build(), IBMDiscoveryV2Models.TrainingQuery.class);
  }

}