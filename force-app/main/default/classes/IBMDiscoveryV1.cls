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
 * IBM Watson&trade; Discovery is a cognitive search and content analytics engine that you can add to applications to
 * identify patterns, trends and actionable insights to drive better decision-making. Securely unify structured and
 * unstructured data with pre-enriched content, and use a simplified query language to eliminate the need for manual
 * filtering of results.
 *
 * @version V1
 * @see <a href="https://console.bluemix.net/docs/discovery/">Discovery</a>
 */
public class IBMDiscoveryV1 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'discovery';
  private static final String SERVICE_URL = 'https://gateway.watsonplatform.net/discovery/api';

  private String versionDate;

  /**
   * Instantiates a new `IBMDiscoveryV1`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMDiscoveryV1(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMDiscoveryV1`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMDiscoveryV1(String versionDate, IBMWatsonAuthenticator authenticator) {
    super(SERVICE_NAME, 'v1', authenticator);

    if ((getServiceURL() == null) || String.isBlank(getServiceURL())) {
      setServiceURL(SERVICE_URL);
    }

    if (String.isBlank(versionDate)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('versionDate cannot be null.');
    }
    this.versionDate = versionDate;
  }

  /**
   * Create an environment.
   *
   * Creates a new environment for private data. An environment must be created before collections can be created.
   *
   * **Note**: You can create only one environment for private data per service instance. An attempt to create another
   * environment results in an error.
   *
   * @param createEnvironmentOptions the {@link IBMDiscoveryV1Models.CreateEnvironmentOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Environment} with the response
   */
  public IBMDiscoveryV1Models.Environment createEnvironment(IBMDiscoveryV1Models.CreateEnvironmentOptions createEnvironmentOptions) {
    IBMWatsonValidator.notNull(createEnvironmentOptions, 'createEnvironmentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/environments');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createEnvironment');
    Map<String, String> requestHeaders = (createEnvironmentOptions != null) ? createEnvironmentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('name', createEnvironmentOptions.name());
    if (createEnvironmentOptions.description() != null) {
      contentJson.put('description', createEnvironmentOptions.description());
    }
    if (createEnvironmentOptions.size() != null) {
      contentJson.put('size', createEnvironmentOptions.size());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Environment) createServiceCall(builder.build(), IBMDiscoveryV1Models.Environment.class);
  }

  /**
   * List environments.
   *
   * List existing environments for the service instance.
   *
   * @param listEnvironmentsOptions the {@link IBMDiscoveryV1Models.ListEnvironmentsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.ListEnvironmentsResponse} with the response
   */
  public IBMDiscoveryV1Models.ListEnvironmentsResponse listEnvironments(IBMDiscoveryV1Models.ListEnvironmentsOptions listEnvironmentsOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/environments');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listEnvironments');
    Map<String, String> requestHeaders = (listEnvironmentsOptions != null) ? listEnvironmentsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (listEnvironmentsOptions != null && listEnvironmentsOptions.name() != null) {
      builder.query('name', listEnvironmentsOptions.name());
    }

    return (IBMDiscoveryV1Models.ListEnvironmentsResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.ListEnvironmentsResponse.class);
  }

  /**
   * Get environment info.
   *
   * @param getEnvironmentOptions the {@link IBMDiscoveryV1Models.GetEnvironmentOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Environment} with the response
   */
  public IBMDiscoveryV1Models.Environment getEnvironment(IBMDiscoveryV1Models.GetEnvironmentOptions getEnvironmentOptions) {
    IBMWatsonValidator.notNull(getEnvironmentOptions, 'getEnvironmentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}', new String[]{ getEnvironmentOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getEnvironment');
    Map<String, String> requestHeaders = (getEnvironmentOptions != null) ? getEnvironmentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.Environment) createServiceCall(builder.build(), IBMDiscoveryV1Models.Environment.class);
  }

  /**
   * Update an environment.
   *
   * Updates an environment. The environment's **name** and  **description** parameters can be changed. You must specify
   * a **name** for the environment.
   *
   * @param updateEnvironmentOptions the {@link IBMDiscoveryV1Models.UpdateEnvironmentOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Environment} with the response
   */
  public IBMDiscoveryV1Models.Environment updateEnvironment(IBMDiscoveryV1Models.UpdateEnvironmentOptions updateEnvironmentOptions) {
    IBMWatsonValidator.notNull(updateEnvironmentOptions, 'updateEnvironmentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPut(getServiceURL() + String.format('/v1/environments/{0}', new String[]{ updateEnvironmentOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=updateEnvironment');
    Map<String, String> requestHeaders = (updateEnvironmentOptions != null) ? updateEnvironmentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (updateEnvironmentOptions.name() != null) {
      contentJson.put('name', updateEnvironmentOptions.name());
    }
    if (updateEnvironmentOptions.description() != null) {
      contentJson.put('description', updateEnvironmentOptions.description());
    }
    if (updateEnvironmentOptions.size() != null) {
      contentJson.put('size', updateEnvironmentOptions.size());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Environment) createServiceCall(builder.build(), IBMDiscoveryV1Models.Environment.class);
  }

  /**
   * Delete environment.
   *
   * @param deleteEnvironmentOptions the {@link IBMDiscoveryV1Models.DeleteEnvironmentOptions} containing the options for the call
   * @return the service call
   */
  public void deleteEnvironment(IBMDiscoveryV1Models.DeleteEnvironmentOptions deleteEnvironmentOptions) {
    IBMWatsonValidator.notNull(deleteEnvironmentOptions, 'deleteEnvironmentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}', new String[]{ deleteEnvironmentOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteEnvironment');
    Map<String, String> requestHeaders = (deleteEnvironmentOptions != null) ? deleteEnvironmentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * List fields across collections.
   *
   * Gets a list of the unique fields (and their types) stored in the indexes of the specified collections.
   *
   * @param listFieldsOptions the {@link IBMDiscoveryV1Models.ListFieldsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.ListCollectionFieldsResponse} with the response
   */
  public IBMDiscoveryV1Models.ListCollectionFieldsResponse listFields(IBMDiscoveryV1Models.ListFieldsOptions listFieldsOptions) {
    IBMWatsonValidator.notNull(listFieldsOptions, 'listFieldsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/fields', new String[]{ listFieldsOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listFields');
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

    return (IBMDiscoveryV1Models.ListCollectionFieldsResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.ListCollectionFieldsResponse.class);
  }

  /**
   * Add configuration.
   *
   * Creates a new configuration.
   *
   * If the input configuration contains the **configuration_id**, **created**, or **updated** properties, then they are
   * ignored and overridden by the system, and an error is not returned so that the overridden fields do not need to be
   * removed when copying a configuration.
   *
   * The configuration can contain unrecognized JSON fields. Any such fields are ignored and do not generate an error.
   * This makes it easier to use newer configuration files with older versions of the API and the service. It also makes
   * it possible for the tooling to add additional metadata and information to the configuration.
   *
   * @param createConfigurationOptions the {@link IBMDiscoveryV1Models.CreateConfigurationOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Configuration} with the response
   */
  public IBMDiscoveryV1Models.Configuration createConfiguration(IBMDiscoveryV1Models.CreateConfigurationOptions createConfigurationOptions) {
    IBMWatsonValidator.notNull(createConfigurationOptions, 'createConfigurationOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/configurations', new String[]{ createConfigurationOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createConfiguration');
    Map<String, String> requestHeaders = (createConfigurationOptions != null) ? createConfigurationOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('name', createConfigurationOptions.name());
    if (createConfigurationOptions.description() != null) {
      contentJson.put('description', createConfigurationOptions.description());
    }
    if (createConfigurationOptions.conversions() != null) {
      contentJson.put('conversions', createConfigurationOptions.conversions().replacePropertyNames());
    }
    if (createConfigurationOptions.enrichments() != null) {
      List<Object> enrichmentsList = new List<Object>();
      for (IBMDiscoveryV1Models.Enrichment enrichmentsItem : createConfigurationOptions.enrichments()) {
        enrichmentsList.add(enrichmentsItem.replacePropertyNames());
      }
      contentJson.put('enrichments', enrichmentsList);
    }
    if (createConfigurationOptions.normalizations() != null) {
      List<Object> normalizationsList = new List<Object>();
      for (IBMDiscoveryV1Models.NormalizationOperation normalizationsItem : createConfigurationOptions.normalizations()) {
        normalizationsList.add(normalizationsItem.replacePropertyNames());
      }
      contentJson.put('normalizations', normalizationsList);
    }
    if (createConfigurationOptions.source() != null) {
      contentJson.put('source', createConfigurationOptions.source().replacePropertyNames());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Configuration) createServiceCall(builder.build(), IBMDiscoveryV1Models.Configuration.class);
  }

  /**
   * List configurations.
   *
   * Lists existing configurations for the service instance.
   *
   * @param listConfigurationsOptions the {@link IBMDiscoveryV1Models.ListConfigurationsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.ListConfigurationsResponse} with the response
   */
  public IBMDiscoveryV1Models.ListConfigurationsResponse listConfigurations(IBMDiscoveryV1Models.ListConfigurationsOptions listConfigurationsOptions) {
    IBMWatsonValidator.notNull(listConfigurationsOptions, 'listConfigurationsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/configurations', new String[]{ listConfigurationsOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listConfigurations');
    Map<String, String> requestHeaders = (listConfigurationsOptions != null) ? listConfigurationsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (listConfigurationsOptions.name() != null) {
      builder.query('name', listConfigurationsOptions.name());
    }

    return (IBMDiscoveryV1Models.ListConfigurationsResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.ListConfigurationsResponse.class);
  }

  /**
   * Get configuration details.
   *
   * @param getConfigurationOptions the {@link IBMDiscoveryV1Models.GetConfigurationOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Configuration} with the response
   */
  public IBMDiscoveryV1Models.Configuration getConfiguration(IBMDiscoveryV1Models.GetConfigurationOptions getConfigurationOptions) {
    IBMWatsonValidator.notNull(getConfigurationOptions, 'getConfigurationOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/configurations/{1}', new String[]{ getConfigurationOptions.environmentId(), getConfigurationOptions.configurationId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getConfiguration');
    Map<String, String> requestHeaders = (getConfigurationOptions != null) ? getConfigurationOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.Configuration) createServiceCall(builder.build(), IBMDiscoveryV1Models.Configuration.class);
  }

  /**
   * Update a configuration.
   *
   * Replaces an existing configuration.
   *   * Completely replaces the original configuration.
   *   * The **configuration_id**, **updated**, and **created** fields are accepted in the request, but they are
   * ignored, and an error is not generated. It is also acceptable for users to submit an updated configuration with
   * none of the three properties.
   *   * Documents are processed with a snapshot of the configuration as it was at the time the document was submitted
   * to be ingested. This means that already submitted documents will not see any updates made to the configuration.
   *
   * @param updateConfigurationOptions the {@link IBMDiscoveryV1Models.UpdateConfigurationOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Configuration} with the response
   */
  public IBMDiscoveryV1Models.Configuration updateConfiguration(IBMDiscoveryV1Models.UpdateConfigurationOptions updateConfigurationOptions) {
    IBMWatsonValidator.notNull(updateConfigurationOptions, 'updateConfigurationOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPut(getServiceURL() + String.format('/v1/environments/{0}/configurations/{1}', new String[]{ updateConfigurationOptions.environmentId(), updateConfigurationOptions.configurationId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=updateConfiguration');
    Map<String, String> requestHeaders = (updateConfigurationOptions != null) ? updateConfigurationOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('name', updateConfigurationOptions.name());
    if (updateConfigurationOptions.description() != null) {
      contentJson.put('description', updateConfigurationOptions.description());
    }
    if (updateConfigurationOptions.conversions() != null) {
      contentJson.put('conversions', updateConfigurationOptions.conversions().replacePropertyNames());
    }
    if (updateConfigurationOptions.enrichments() != null) {
      List<Object> enrichmentsList = new List<Object>();
      for (IBMDiscoveryV1Models.Enrichment enrichmentsItem : updateConfigurationOptions.enrichments()) {
        enrichmentsList.add(enrichmentsItem.replacePropertyNames());
      }
      contentJson.put('enrichments', enrichmentsList);
    }
    if (updateConfigurationOptions.normalizations() != null) {
      List<Object> normalizationsList = new List<Object>();
      for (IBMDiscoveryV1Models.NormalizationOperation normalizationsItem : updateConfigurationOptions.normalizations()) {
        normalizationsList.add(normalizationsItem.replacePropertyNames());
      }
      contentJson.put('normalizations', normalizationsList);
    }
    if (updateConfigurationOptions.source() != null) {
      contentJson.put('source', updateConfigurationOptions.source().replacePropertyNames());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Configuration) createServiceCall(builder.build(), IBMDiscoveryV1Models.Configuration.class);
  }

  /**
   * Delete a configuration.
   *
   * The deletion is performed unconditionally. A configuration deletion request succeeds even if the configuration is
   * referenced by a collection or document ingestion. However, documents that have already been submitted for
   * processing continue to use the deleted configuration. Documents are always processed with a snapshot of the
   * configuration as it existed at the time the document was submitted.
   *
   * @param deleteConfigurationOptions the {@link IBMDiscoveryV1Models.DeleteConfigurationOptions} containing the options for the call
   * @return the service call
   */
  public void deleteConfiguration(IBMDiscoveryV1Models.DeleteConfigurationOptions deleteConfigurationOptions) {
    IBMWatsonValidator.notNull(deleteConfigurationOptions, 'deleteConfigurationOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/configurations/{1}', new String[]{ deleteConfigurationOptions.environmentId(), deleteConfigurationOptions.configurationId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteConfiguration');
    Map<String, String> requestHeaders = (deleteConfigurationOptions != null) ? deleteConfigurationOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Create a collection.
   *
   * @param createCollectionOptions the {@link IBMDiscoveryV1Models.CreateCollectionOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Collection} with the response
   */
  public IBMDiscoveryV1Models.Collection createCollection(IBMDiscoveryV1Models.CreateCollectionOptions createCollectionOptions) {
    IBMWatsonValidator.notNull(createCollectionOptions, 'createCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections', new String[]{ createCollectionOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createCollection');
    Map<String, String> requestHeaders = (createCollectionOptions != null) ? createCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('name', createCollectionOptions.name());
    if (createCollectionOptions.description() != null) {
      contentJson.put('description', createCollectionOptions.description());
    }
    if (createCollectionOptions.configurationId() != null) {
      contentJson.put('configuration_id', createCollectionOptions.configurationId());
    }
    if (createCollectionOptions.language() != null) {
      contentJson.put('language', createCollectionOptions.language());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Collection) createServiceCall(builder.build(), IBMDiscoveryV1Models.Collection.class);
  }

  /**
   * List collections.
   *
   * Lists existing collections for the service instance.
   *
   * @param listCollectionsOptions the {@link IBMDiscoveryV1Models.ListCollectionsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.ListCollectionsResponse} with the response
   */
  public IBMDiscoveryV1Models.ListCollectionsResponse listCollections(IBMDiscoveryV1Models.ListCollectionsOptions listCollectionsOptions) {
    IBMWatsonValidator.notNull(listCollectionsOptions, 'listCollectionsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections', new String[]{ listCollectionsOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listCollections');
    Map<String, String> requestHeaders = (listCollectionsOptions != null) ? listCollectionsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (listCollectionsOptions.name() != null) {
      builder.query('name', listCollectionsOptions.name());
    }

    return (IBMDiscoveryV1Models.ListCollectionsResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.ListCollectionsResponse.class);
  }

  /**
   * Get collection details.
   *
   * @param getCollectionOptions the {@link IBMDiscoveryV1Models.GetCollectionOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Collection} with the response
   */
  public IBMDiscoveryV1Models.Collection getCollection(IBMDiscoveryV1Models.GetCollectionOptions getCollectionOptions) {
    IBMWatsonValidator.notNull(getCollectionOptions, 'getCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}', new String[]{ getCollectionOptions.environmentId(), getCollectionOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getCollection');
    Map<String, String> requestHeaders = (getCollectionOptions != null) ? getCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.Collection) createServiceCall(builder.build(), IBMDiscoveryV1Models.Collection.class);
  }

  /**
   * Update a collection.
   *
   * @param updateCollectionOptions the {@link IBMDiscoveryV1Models.UpdateCollectionOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Collection} with the response
   */
  public IBMDiscoveryV1Models.Collection updateCollection(IBMDiscoveryV1Models.UpdateCollectionOptions updateCollectionOptions) {
    IBMWatsonValidator.notNull(updateCollectionOptions, 'updateCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPut(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}', new String[]{ updateCollectionOptions.environmentId(), updateCollectionOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=updateCollection');
    Map<String, String> requestHeaders = (updateCollectionOptions != null) ? updateCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('name', updateCollectionOptions.name());
    if (updateCollectionOptions.description() != null) {
      contentJson.put('description', updateCollectionOptions.description());
    }
    if (updateCollectionOptions.configurationId() != null) {
      contentJson.put('configuration_id', updateCollectionOptions.configurationId());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Collection) createServiceCall(builder.build(), IBMDiscoveryV1Models.Collection.class);
  }

  /**
   * Delete a collection.
   *
   * @param deleteCollectionOptions the {@link IBMDiscoveryV1Models.DeleteCollectionOptions} containing the options for the call
   * @return the service call
   */
  public void deleteCollection(IBMDiscoveryV1Models.DeleteCollectionOptions deleteCollectionOptions) {
    IBMWatsonValidator.notNull(deleteCollectionOptions, 'deleteCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}', new String[]{ deleteCollectionOptions.environmentId(), deleteCollectionOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteCollection');
    Map<String, String> requestHeaders = (deleteCollectionOptions != null) ? deleteCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * List collection fields.
   *
   * Gets a list of the unique fields (and their types) stored in the index.
   *
   * @param listCollectionFieldsOptions the {@link IBMDiscoveryV1Models.ListCollectionFieldsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.ListCollectionFieldsResponse} with the response
   */
  public IBMDiscoveryV1Models.ListCollectionFieldsResponse listCollectionFields(IBMDiscoveryV1Models.ListCollectionFieldsOptions listCollectionFieldsOptions) {
    IBMWatsonValidator.notNull(listCollectionFieldsOptions, 'listCollectionFieldsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/fields', new String[]{ listCollectionFieldsOptions.environmentId(), listCollectionFieldsOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listCollectionFields');
    Map<String, String> requestHeaders = (listCollectionFieldsOptions != null) ? listCollectionFieldsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.ListCollectionFieldsResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.ListCollectionFieldsResponse.class);
  }

  /**
   * Get the expansion list.
   *
   * Returns the current expansion list for the specified collection. If an expansion list is not specified, an object
   * with empty expansion arrays is returned.
   *
   * @param listExpansionsOptions the {@link IBMDiscoveryV1Models.ListExpansionsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Expansions} with the response
   */
  public IBMDiscoveryV1Models.Expansions listExpansions(IBMDiscoveryV1Models.ListExpansionsOptions listExpansionsOptions) {
    IBMWatsonValidator.notNull(listExpansionsOptions, 'listExpansionsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/expansions', new String[]{ listExpansionsOptions.environmentId(), listExpansionsOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listExpansions');
    Map<String, String> requestHeaders = (listExpansionsOptions != null) ? listExpansionsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.Expansions) createServiceCall(builder.build(), IBMDiscoveryV1Models.Expansions.class);
  }

  /**
   * Create or update expansion list.
   *
   * Create or replace the Expansion list for this collection. The maximum number of expanded terms per collection is
   * `500`. The current expansion list is replaced with the uploaded content.
   *
   * @param createExpansionsOptions the {@link IBMDiscoveryV1Models.CreateExpansionsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Expansions} with the response
   */
  public IBMDiscoveryV1Models.Expansions createExpansions(IBMDiscoveryV1Models.CreateExpansionsOptions createExpansionsOptions) {
    IBMWatsonValidator.notNull(createExpansionsOptions, 'createExpansionsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/expansions', new String[]{ createExpansionsOptions.environmentId(), createExpansionsOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createExpansions');
    Map<String, String> requestHeaders = (createExpansionsOptions != null) ? createExpansionsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    List<Object> expansionsList = new List<Object>();
    for (IBMDiscoveryV1Models.Expansion expansionsItem : createExpansionsOptions.expansions()) {
      expansionsList.add(expansionsItem.replacePropertyNames());
    }
    contentJson.put('expansions', expansionsList);
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Expansions) createServiceCall(builder.build(), IBMDiscoveryV1Models.Expansions.class);
  }

  /**
   * Delete the expansion list.
   *
   * Remove the expansion information for this collection. The expansion list must be deleted to disable query expansion
   * for a collection.
   *
   * @param deleteExpansionsOptions the {@link IBMDiscoveryV1Models.DeleteExpansionsOptions} containing the options for the call
   * @return the service call
   */
  public void deleteExpansions(IBMDiscoveryV1Models.DeleteExpansionsOptions deleteExpansionsOptions) {
    IBMWatsonValidator.notNull(deleteExpansionsOptions, 'deleteExpansionsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/expansions', new String[]{ deleteExpansionsOptions.environmentId(), deleteExpansionsOptions.collectionId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteExpansions');
    Map<String, String> requestHeaders = (deleteExpansionsOptions != null) ? deleteExpansionsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Get tokenization dictionary status.
   *
   * Returns the current status of the tokenization dictionary for the specified collection.
   *
   * @param getTokenizationDictionaryStatusOptions the {@link IBMDiscoveryV1Models.GetTokenizationDictionaryStatusOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TokenDictStatusResponse} with the response
   */
  public IBMDiscoveryV1Models.TokenDictStatusResponse getTokenizationDictionaryStatus(IBMDiscoveryV1Models.GetTokenizationDictionaryStatusOptions getTokenizationDictionaryStatusOptions) {
    IBMWatsonValidator.notNull(getTokenizationDictionaryStatusOptions, 'getTokenizationDictionaryStatusOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/word_lists/tokenization_dictionary', new String[]{ getTokenizationDictionaryStatusOptions.environmentId(), getTokenizationDictionaryStatusOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getTokenizationDictionaryStatus');
    Map<String, String> requestHeaders = (getTokenizationDictionaryStatusOptions != null) ? getTokenizationDictionaryStatusOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.TokenDictStatusResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.TokenDictStatusResponse.class);
  }

  /**
   * Create tokenization dictionary.
   *
   * Upload a custom tokenization dictionary to use with the specified collection.
   *
   * @param createTokenizationDictionaryOptions the {@link IBMDiscoveryV1Models.CreateTokenizationDictionaryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TokenDictStatusResponse} with the response
   */
  public IBMDiscoveryV1Models.TokenDictStatusResponse createTokenizationDictionary(IBMDiscoveryV1Models.CreateTokenizationDictionaryOptions createTokenizationDictionaryOptions) {
    IBMWatsonValidator.notNull(createTokenizationDictionaryOptions, 'createTokenizationDictionaryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/word_lists/tokenization_dictionary', new String[]{ createTokenizationDictionaryOptions.environmentId(), createTokenizationDictionaryOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createTokenizationDictionary');
    Map<String, String> requestHeaders = (createTokenizationDictionaryOptions != null) ? createTokenizationDictionaryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (createTokenizationDictionaryOptions.tokenizationRules() != null) {
      List<Object> tokenizationRulesList = new List<Object>();
      for (IBMDiscoveryV1Models.TokenDictRule tokenizationRulesItem : createTokenizationDictionaryOptions.tokenizationRules()) {
        tokenizationRulesList.add(tokenizationRulesItem.replacePropertyNames());
      }
      contentJson.put('tokenization_rules', tokenizationRulesList);
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.TokenDictStatusResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.TokenDictStatusResponse.class);
  }

  /**
   * Delete tokenization dictionary.
   *
   * Delete the tokenization dictionary from the collection.
   *
   * @param deleteTokenizationDictionaryOptions the {@link IBMDiscoveryV1Models.DeleteTokenizationDictionaryOptions} containing the options for the call
   * @return the service call
   */
  public void deleteTokenizationDictionary(IBMDiscoveryV1Models.DeleteTokenizationDictionaryOptions deleteTokenizationDictionaryOptions) {
    IBMWatsonValidator.notNull(deleteTokenizationDictionaryOptions, 'deleteTokenizationDictionaryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/word_lists/tokenization_dictionary', new String[]{ deleteTokenizationDictionaryOptions.environmentId(), deleteTokenizationDictionaryOptions.collectionId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteTokenizationDictionary');
    Map<String, String> requestHeaders = (deleteTokenizationDictionaryOptions != null) ? deleteTokenizationDictionaryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Get stopword list status.
   *
   * Returns the current status of the stopword list for the specified collection.
   *
   * @param getStopwordListStatusOptions the {@link IBMDiscoveryV1Models.GetStopwordListStatusOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TokenDictStatusResponse} with the response
   */
  public IBMDiscoveryV1Models.TokenDictStatusResponse getStopwordListStatus(IBMDiscoveryV1Models.GetStopwordListStatusOptions getStopwordListStatusOptions) {
    IBMWatsonValidator.notNull(getStopwordListStatusOptions, 'getStopwordListStatusOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/word_lists/stopwords', new String[]{ getStopwordListStatusOptions.environmentId(), getStopwordListStatusOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getStopwordListStatus');
    Map<String, String> requestHeaders = (getStopwordListStatusOptions != null) ? getStopwordListStatusOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.TokenDictStatusResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.TokenDictStatusResponse.class);
  }

  /**
   * Create stopword list.
   *
   * Upload a custom stopword list to use with the specified collection.
   *
   * @param createStopwordListOptions the {@link IBMDiscoveryV1Models.CreateStopwordListOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TokenDictStatusResponse} with the response
   */
  public IBMDiscoveryV1Models.TokenDictStatusResponse createStopwordList(IBMDiscoveryV1Models.CreateStopwordListOptions createStopwordListOptions) {
    IBMWatsonValidator.notNull(createStopwordListOptions, 'createStopwordListOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/word_lists/stopwords', new String[]{ createStopwordListOptions.environmentId(), createStopwordListOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createStopwordList');
    Map<String, String> requestHeaders = (createStopwordListOptions != null) ? createStopwordListOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    IBMWatsonRequestBody stopwordFileBody = IBMWatsonRequestBody.create(createStopwordListOptions.stopwordFile(), 'application/octet-stream');
    multipartBuilder.addFormDataPart('stopword_file', createStopwordListOptions.stopwordFilename(), stopwordFileBody);
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMDiscoveryV1Models.TokenDictStatusResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.TokenDictStatusResponse.class);
  }

  /**
   * Delete a custom stopword list.
   *
   * Delete a custom stopword list from the collection. After a custom stopword list is deleted, the default list is
   * used for the collection.
   *
   * @param deleteStopwordListOptions the {@link IBMDiscoveryV1Models.DeleteStopwordListOptions} containing the options for the call
   * @return the service call
   */
  public void deleteStopwordList(IBMDiscoveryV1Models.DeleteStopwordListOptions deleteStopwordListOptions) {
    IBMWatsonValidator.notNull(deleteStopwordListOptions, 'deleteStopwordListOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/word_lists/stopwords', new String[]{ deleteStopwordListOptions.environmentId(), deleteStopwordListOptions.collectionId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteStopwordList');
    Map<String, String> requestHeaders = (deleteStopwordListOptions != null) ? deleteStopwordListOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Add a document.
   *
   * Add a document to a collection with optional metadata.
   *
   *   * The **version** query parameter is still required.
   *
   *   * Returns immediately after the system has accepted the document for processing.
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
   *  **Note:** Documents can be added with a specific **document_id** by using the
   * **_/v1/environments/{environment_id}/collections/{collection_id}/documents** method.
   *
   * @param addDocumentOptions the {@link IBMDiscoveryV1Models.AddDocumentOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.DocumentAccepted} with the response
   */
  public IBMDiscoveryV1Models.DocumentAccepted addDocument(IBMDiscoveryV1Models.AddDocumentOptions addDocumentOptions) {
    IBMWatsonValidator.notNull(addDocumentOptions, 'addDocumentOptions cannot be null');
    IBMWatsonValidator.isTrue((addDocumentOptions.file() != null) || (addDocumentOptions.metadata() != null), 'At least one of file or metadata must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/documents', new String[]{ addDocumentOptions.environmentId(), addDocumentOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=addDocument');
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

    return (IBMDiscoveryV1Models.DocumentAccepted) createServiceCall(builder.build(), IBMDiscoveryV1Models.DocumentAccepted.class);
  }

  /**
   * Get document details.
   *
   * Fetch status details about a submitted document. **Note:** this operation does not return the document itself.
   * Instead, it returns only the document's processing status and any notices (warnings or errors) that were generated
   * when the document was ingested. Use the query API to retrieve the actual document content.
   *
   * @param getDocumentStatusOptions the {@link IBMDiscoveryV1Models.GetDocumentStatusOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.DocumentStatus} with the response
   */
  public IBMDiscoveryV1Models.DocumentStatus getDocumentStatus(IBMDiscoveryV1Models.GetDocumentStatusOptions getDocumentStatusOptions) {
    IBMWatsonValidator.notNull(getDocumentStatusOptions, 'getDocumentStatusOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/documents/{2}', new String[]{ getDocumentStatusOptions.environmentId(), getDocumentStatusOptions.collectionId(), getDocumentStatusOptions.documentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getDocumentStatus');
    Map<String, String> requestHeaders = (getDocumentStatusOptions != null) ? getDocumentStatusOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.DocumentStatus) createServiceCall(builder.build(), IBMDiscoveryV1Models.DocumentStatus.class);
  }

  /**
   * Update a document.
   *
   * Replace an existing document or add a document with a specified **document_id**. Starts ingesting a document with
   * optional metadata.
   *
   * **Note:** When uploading a new document with this method it automatically replaces any document stored with the
   * same **document_id** if it exists.
   *
   * @param updateDocumentOptions the {@link IBMDiscoveryV1Models.UpdateDocumentOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.DocumentAccepted} with the response
   */
  public IBMDiscoveryV1Models.DocumentAccepted updateDocument(IBMDiscoveryV1Models.UpdateDocumentOptions updateDocumentOptions) {
    IBMWatsonValidator.notNull(updateDocumentOptions, 'updateDocumentOptions cannot be null');
    IBMWatsonValidator.isTrue((updateDocumentOptions.file() != null) || (updateDocumentOptions.metadata() != null), 'At least one of file or metadata must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/documents/{2}', new String[]{ updateDocumentOptions.environmentId(), updateDocumentOptions.collectionId(), updateDocumentOptions.documentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=updateDocument');
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

    return (IBMDiscoveryV1Models.DocumentAccepted) createServiceCall(builder.build(), IBMDiscoveryV1Models.DocumentAccepted.class);
  }

  /**
   * Delete a document.
   *
   * If the given document ID is invalid, or if the document is not found, then the a success response is returned (HTTP
   * status code `200`) with the status set to 'deleted'.
   *
   * @param deleteDocumentOptions the {@link IBMDiscoveryV1Models.DeleteDocumentOptions} containing the options for the call
   * @return the service call
   */
  public void deleteDocument(IBMDiscoveryV1Models.DeleteDocumentOptions deleteDocumentOptions) {
    IBMWatsonValidator.notNull(deleteDocumentOptions, 'deleteDocumentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/documents/{2}', new String[]{ deleteDocumentOptions.environmentId(), deleteDocumentOptions.collectionId(), deleteDocumentOptions.documentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteDocument');
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
   * Query a collection.
   *
   * By using this method, you can construct long queries. For details, see the [Discovery
   * documentation](https://cloud.ibm.com/docs/discovery?topic=discovery-query-concepts#query-concepts).
   *
   * @param queryOptions the {@link IBMDiscoveryV1Models.QueryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.QueryResponse} with the response
   */
  public IBMDiscoveryV1Models.QueryResponse query(IBMDiscoveryV1Models.QueryOptions queryOptions) {
    IBMWatsonValidator.notNull(queryOptions, 'queryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/query', new String[]{ queryOptions.environmentId(), queryOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    if (queryOptions.xWatsonLoggingOptOut() != null) {
      builder.addHeader('X-Watson-Logging-Opt-Out', queryOptions.xWatsonLoggingOptOut());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=query');
    Map<String, String> requestHeaders = (queryOptions != null) ? queryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (queryOptions.filter() != null) {
      contentJson.put('filter', queryOptions.filter());
    }
    if (queryOptions.query() != null) {
      contentJson.put('query', queryOptions.query());
    }
    if (queryOptions.naturalLanguageQuery() != null) {
      contentJson.put('natural_language_query', queryOptions.naturalLanguageQuery());
    }
    if (queryOptions.passages() != null) {
      contentJson.put('passages', queryOptions.passages());
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
    if (queryOptions.passagesFields() != null) {
      contentJson.put('passages.fields', queryOptions.passagesFields());
    }
    if (queryOptions.passagesCount() != null) {
      contentJson.put('passages.count', queryOptions.passagesCount());
    }
    if (queryOptions.passagesCharacters() != null) {
      contentJson.put('passages.characters', queryOptions.passagesCharacters());
    }
    if (queryOptions.deduplicate() != null) {
      contentJson.put('deduplicate', queryOptions.deduplicate());
    }
    if (queryOptions.deduplicateField() != null) {
      contentJson.put('deduplicate.field', queryOptions.deduplicateField());
    }
    if (queryOptions.similar() != null) {
      contentJson.put('similar', queryOptions.similar());
    }
    if (queryOptions.similarDocumentIds() != null) {
      contentJson.put('similar.document_ids', queryOptions.similarDocumentIds());
    }
    if (queryOptions.similarFields() != null) {
      contentJson.put('similar.fields', queryOptions.similarFields());
    }
    if (queryOptions.bias() != null) {
      contentJson.put('bias', queryOptions.bias());
    }
    if (queryOptions.spellingSuggestions() != null) {
      contentJson.put('spelling_suggestions', queryOptions.spellingSuggestions());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.QueryResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.QueryResponse.class);
  }

  /**
   * Query system notices.
   *
   * Queries for notices (errors or warnings) that might have been generated by the system. Notices are generated when
   * ingesting documents and performing relevance training. See the [Discovery
   * documentation](https://cloud.ibm.com/docs/discovery?topic=discovery-query-concepts#query-concepts) for
   * more details on the query language.
   *
   * @param queryNoticesOptions the {@link IBMDiscoveryV1Models.QueryNoticesOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.QueryNoticesResponse} with the response
   */
  public IBMDiscoveryV1Models.QueryNoticesResponse queryNotices(IBMDiscoveryV1Models.QueryNoticesOptions queryNoticesOptions) {
    IBMWatsonValidator.notNull(queryNoticesOptions, 'queryNoticesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/notices', new String[]{ queryNoticesOptions.environmentId(), queryNoticesOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=queryNotices');
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
    if (queryNoticesOptions.passages() != null) {
      builder.query('passages', String.valueOf(queryNoticesOptions.passages()));
    }
    if (queryNoticesOptions.aggregation() != null) {
      builder.query('aggregation', queryNoticesOptions.aggregation());
    }
    if (queryNoticesOptions.count() != null) {
      builder.query('count', String.valueOf(queryNoticesOptions.count()));
    }
    if (queryNoticesOptions.xReturn() != null) {
      builder.query('return', String.join(queryNoticesOptions.xReturn(), ','));
    }
    if (queryNoticesOptions.offset() != null) {
      builder.query('offset', String.valueOf(queryNoticesOptions.offset()));
    }
    if (queryNoticesOptions.xSort() != null) {
      builder.query('sort', String.join(queryNoticesOptions.xSort(), ','));
    }
    if (queryNoticesOptions.highlight() != null) {
      builder.query('highlight', String.valueOf(queryNoticesOptions.highlight()));
    }
    if (queryNoticesOptions.passagesFields() != null) {
      builder.query('passages.fields', String.join(queryNoticesOptions.passagesFields(), ','));
    }
    if (queryNoticesOptions.passagesCount() != null) {
      builder.query('passages.count', String.valueOf(queryNoticesOptions.passagesCount()));
    }
    if (queryNoticesOptions.passagesCharacters() != null) {
      builder.query('passages.characters', String.valueOf(queryNoticesOptions.passagesCharacters()));
    }
    if (queryNoticesOptions.deduplicateField() != null) {
      builder.query('deduplicate.field', queryNoticesOptions.deduplicateField());
    }
    if (queryNoticesOptions.similar() != null) {
      builder.query('similar', String.valueOf(queryNoticesOptions.similar()));
    }
    if (queryNoticesOptions.similarDocumentIds() != null) {
      builder.query('similar.document_ids', String.join(queryNoticesOptions.similarDocumentIds(), ','));
    }
    if (queryNoticesOptions.similarFields() != null) {
      builder.query('similar.fields', String.join(queryNoticesOptions.similarFields(), ','));
    }

    return (IBMDiscoveryV1Models.QueryNoticesResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.QueryNoticesResponse.class);
  }

  /**
   * Query multiple collections.
   *
   * By using this method, you can construct long queries that search multiple collection. For details, see the
   * [Discovery
   * documentation](https://cloud.ibm.com/docs/discovery?topic=discovery-query-concepts#query-concepts).
   *
   * @param federatedQueryOptions the {@link IBMDiscoveryV1Models.FederatedQueryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.QueryResponse} with the response
   */
  public IBMDiscoveryV1Models.QueryResponse federatedQuery(IBMDiscoveryV1Models.FederatedQueryOptions federatedQueryOptions) {
    IBMWatsonValidator.notNull(federatedQueryOptions, 'federatedQueryOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/query', new String[]{ federatedQueryOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    if (federatedQueryOptions.xWatsonLoggingOptOut() != null) {
      builder.addHeader('X-Watson-Logging-Opt-Out', federatedQueryOptions.xWatsonLoggingOptOut());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=federatedQuery');
    Map<String, String> requestHeaders = (federatedQueryOptions != null) ? federatedQueryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('collection_ids', federatedQueryOptions.collectionIds());
    if (federatedQueryOptions.filter() != null) {
      contentJson.put('filter', federatedQueryOptions.filter());
    }
    if (federatedQueryOptions.query() != null) {
      contentJson.put('query', federatedQueryOptions.query());
    }
    if (federatedQueryOptions.naturalLanguageQuery() != null) {
      contentJson.put('natural_language_query', federatedQueryOptions.naturalLanguageQuery());
    }
    if (federatedQueryOptions.passages() != null) {
      contentJson.put('passages', federatedQueryOptions.passages());
    }
    if (federatedQueryOptions.aggregation() != null) {
      contentJson.put('aggregation', federatedQueryOptions.aggregation());
    }
    if (federatedQueryOptions.count() != null) {
      contentJson.put('count', federatedQueryOptions.count());
    }
    if (federatedQueryOptions.xReturn() != null) {
      contentJson.put('return', federatedQueryOptions.xReturn());
    }
    if (federatedQueryOptions.offset() != null) {
      contentJson.put('offset', federatedQueryOptions.offset());
    }
    if (federatedQueryOptions.xSort() != null) {
      contentJson.put('sort', federatedQueryOptions.xSort());
    }
    if (federatedQueryOptions.highlight() != null) {
      contentJson.put('highlight', federatedQueryOptions.highlight());
    }
    if (federatedQueryOptions.passagesFields() != null) {
      contentJson.put('passages.fields', federatedQueryOptions.passagesFields());
    }
    if (federatedQueryOptions.passagesCount() != null) {
      contentJson.put('passages.count', federatedQueryOptions.passagesCount());
    }
    if (federatedQueryOptions.passagesCharacters() != null) {
      contentJson.put('passages.characters', federatedQueryOptions.passagesCharacters());
    }
    if (federatedQueryOptions.deduplicate() != null) {
      contentJson.put('deduplicate', federatedQueryOptions.deduplicate());
    }
    if (federatedQueryOptions.deduplicateField() != null) {
      contentJson.put('deduplicate.field', federatedQueryOptions.deduplicateField());
    }
    if (federatedQueryOptions.similar() != null) {
      contentJson.put('similar', federatedQueryOptions.similar());
    }
    if (federatedQueryOptions.similarDocumentIds() != null) {
      contentJson.put('similar.document_ids', federatedQueryOptions.similarDocumentIds());
    }
    if (federatedQueryOptions.similarFields() != null) {
      contentJson.put('similar.fields', federatedQueryOptions.similarFields());
    }
    if (federatedQueryOptions.bias() != null) {
      contentJson.put('bias', federatedQueryOptions.bias());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.QueryResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.QueryResponse.class);
  }

  /**
   * Query multiple collection system notices.
   *
   * Queries for notices (errors or warnings) that might have been generated by the system. Notices are generated when
   * ingesting documents and performing relevance training. See the [Discovery
   * documentation](https://cloud.ibm.com/docs/discovery?topic=discovery-query-concepts#query-concepts) for
   * more details on the query language.
   *
   * @param federatedQueryNoticesOptions the {@link IBMDiscoveryV1Models.FederatedQueryNoticesOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.QueryNoticesResponse} with the response
   */
  public IBMDiscoveryV1Models.QueryNoticesResponse federatedQueryNotices(IBMDiscoveryV1Models.FederatedQueryNoticesOptions federatedQueryNoticesOptions) {
    IBMWatsonValidator.notNull(federatedQueryNoticesOptions, 'federatedQueryNoticesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/notices', new String[]{ federatedQueryNoticesOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=federatedQueryNotices');
    Map<String, String> requestHeaders = (federatedQueryNoticesOptions != null) ? federatedQueryNoticesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (federatedQueryNoticesOptions.collectionIds() != null) {
      builder.query('collection_ids', String.join(federatedQueryNoticesOptions.collectionIds(), ','));
    }
    if (federatedQueryNoticesOptions.filter() != null) {
      builder.query('filter', federatedQueryNoticesOptions.filter());
    }
    if (federatedQueryNoticesOptions.query() != null) {
      builder.query('query', federatedQueryNoticesOptions.query());
    }
    if (federatedQueryNoticesOptions.naturalLanguageQuery() != null) {
      builder.query('natural_language_query', federatedQueryNoticesOptions.naturalLanguageQuery());
    }
    if (federatedQueryNoticesOptions.aggregation() != null) {
      builder.query('aggregation', federatedQueryNoticesOptions.aggregation());
    }
    if (federatedQueryNoticesOptions.count() != null) {
      builder.query('count', String.valueOf(federatedQueryNoticesOptions.count()));
    }
    if (federatedQueryNoticesOptions.xReturn() != null) {
      builder.query('return', String.join(federatedQueryNoticesOptions.xReturn(), ','));
    }
    if (federatedQueryNoticesOptions.offset() != null) {
      builder.query('offset', String.valueOf(federatedQueryNoticesOptions.offset()));
    }
    if (federatedQueryNoticesOptions.xSort() != null) {
      builder.query('sort', String.join(federatedQueryNoticesOptions.xSort(), ','));
    }
    if (federatedQueryNoticesOptions.highlight() != null) {
      builder.query('highlight', String.valueOf(federatedQueryNoticesOptions.highlight()));
    }
    if (federatedQueryNoticesOptions.deduplicateField() != null) {
      builder.query('deduplicate.field', federatedQueryNoticesOptions.deduplicateField());
    }
    if (federatedQueryNoticesOptions.similar() != null) {
      builder.query('similar', String.valueOf(federatedQueryNoticesOptions.similar()));
    }
    if (federatedQueryNoticesOptions.similarDocumentIds() != null) {
      builder.query('similar.document_ids', String.join(federatedQueryNoticesOptions.similarDocumentIds(), ','));
    }
    if (federatedQueryNoticesOptions.similarFields() != null) {
      builder.query('similar.fields', String.join(federatedQueryNoticesOptions.similarFields(), ','));
    }

    return (IBMDiscoveryV1Models.QueryNoticesResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.QueryNoticesResponse.class);
  }

  /**
   * Get Autocomplete Suggestions.
   *
   * Returns completion query suggestions for the specified prefix.  /n/n **Important:** this method is only valid when
   * using the Cloud Pak version of Discovery.
   *
   * @param getAutocompletionOptions the {@link IBMDiscoveryV1Models.GetAutocompletionOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Completions} with the response
   */
  public IBMDiscoveryV1Models.Completions getAutocompletion(IBMDiscoveryV1Models.GetAutocompletionOptions getAutocompletionOptions) {
    IBMWatsonValidator.notNull(getAutocompletionOptions, 'getAutocompletionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/autocompletion', new String[]{ getAutocompletionOptions.environmentId(), getAutocompletionOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getAutocompletion');
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
    if (getAutocompletionOptions.field() != null) {
      builder.query('field', getAutocompletionOptions.field());
    }
    if (getAutocompletionOptions.count() != null) {
      builder.query('count', String.valueOf(getAutocompletionOptions.count()));
    }

    return (IBMDiscoveryV1Models.Completions) createServiceCall(builder.build(), IBMDiscoveryV1Models.Completions.class);
  }

  /**
   * List training data.
   *
   * Lists the training data for the specified collection.
   *
   * @param listTrainingDataOptions the {@link IBMDiscoveryV1Models.ListTrainingDataOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TrainingDataSet} with the response
   */
  public IBMDiscoveryV1Models.TrainingDataSet listTrainingData(IBMDiscoveryV1Models.ListTrainingDataOptions listTrainingDataOptions) {
    IBMWatsonValidator.notNull(listTrainingDataOptions, 'listTrainingDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data', new String[]{ listTrainingDataOptions.environmentId(), listTrainingDataOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listTrainingData');
    Map<String, String> requestHeaders = (listTrainingDataOptions != null) ? listTrainingDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.TrainingDataSet) createServiceCall(builder.build(), IBMDiscoveryV1Models.TrainingDataSet.class);
  }

  /**
   * Add query to training data.
   *
   * Adds a query to the training data for this collection. The query can contain a filter and natural language query.
   *
   * @param addTrainingDataOptions the {@link IBMDiscoveryV1Models.AddTrainingDataOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TrainingQuery} with the response
   */
  public IBMDiscoveryV1Models.TrainingQuery addTrainingData(IBMDiscoveryV1Models.AddTrainingDataOptions addTrainingDataOptions) {
    IBMWatsonValidator.notNull(addTrainingDataOptions, 'addTrainingDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data', new String[]{ addTrainingDataOptions.environmentId(), addTrainingDataOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=addTrainingData');
    Map<String, String> requestHeaders = (addTrainingDataOptions != null) ? addTrainingDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (addTrainingDataOptions.naturalLanguageQuery() != null) {
      contentJson.put('natural_language_query', addTrainingDataOptions.naturalLanguageQuery());
    }
    if (addTrainingDataOptions.filter() != null) {
      contentJson.put('filter', addTrainingDataOptions.filter());
    }
    if (addTrainingDataOptions.examples() != null) {
      List<Object> examplesList = new List<Object>();
      for (IBMDiscoveryV1Models.TrainingExample examplesItem : addTrainingDataOptions.examples()) {
        examplesList.add(examplesItem.replacePropertyNames());
      }
      contentJson.put('examples', examplesList);
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.TrainingQuery) createServiceCall(builder.build(), IBMDiscoveryV1Models.TrainingQuery.class);
  }

  /**
   * Delete all training data.
   *
   * Deletes all training data from a collection.
   *
   * @param deleteAllTrainingDataOptions the {@link IBMDiscoveryV1Models.DeleteAllTrainingDataOptions} containing the options for the call
   * @return the service call
   */
  public void deleteAllTrainingData(IBMDiscoveryV1Models.DeleteAllTrainingDataOptions deleteAllTrainingDataOptions) {
    IBMWatsonValidator.notNull(deleteAllTrainingDataOptions, 'deleteAllTrainingDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data', new String[]{ deleteAllTrainingDataOptions.environmentId(), deleteAllTrainingDataOptions.collectionId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteAllTrainingData');
    Map<String, String> requestHeaders = (deleteAllTrainingDataOptions != null) ? deleteAllTrainingDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Get details about a query.
   *
   * Gets details for a specific training data query, including the query string and all examples.
   *
   * @param getTrainingDataOptions the {@link IBMDiscoveryV1Models.GetTrainingDataOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TrainingQuery} with the response
   */
  public IBMDiscoveryV1Models.TrainingQuery getTrainingData(IBMDiscoveryV1Models.GetTrainingDataOptions getTrainingDataOptions) {
    IBMWatsonValidator.notNull(getTrainingDataOptions, 'getTrainingDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data/{2}', new String[]{ getTrainingDataOptions.environmentId(), getTrainingDataOptions.collectionId(), getTrainingDataOptions.queryId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getTrainingData');
    Map<String, String> requestHeaders = (getTrainingDataOptions != null) ? getTrainingDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.TrainingQuery) createServiceCall(builder.build(), IBMDiscoveryV1Models.TrainingQuery.class);
  }

  /**
   * Delete a training data query.
   *
   * Removes the training data query and all associated examples from the training data set.
   *
   * @param deleteTrainingDataOptions the {@link IBMDiscoveryV1Models.DeleteTrainingDataOptions} containing the options for the call
   * @return the service call
   */
  public void deleteTrainingData(IBMDiscoveryV1Models.DeleteTrainingDataOptions deleteTrainingDataOptions) {
    IBMWatsonValidator.notNull(deleteTrainingDataOptions, 'deleteTrainingDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data/{2}', new String[]{ deleteTrainingDataOptions.environmentId(), deleteTrainingDataOptions.collectionId(), deleteTrainingDataOptions.queryId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteTrainingData');
    Map<String, String> requestHeaders = (deleteTrainingDataOptions != null) ? deleteTrainingDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * List examples for a training data query.
   *
   * List all examples for this training data query.
   *
   * @param listTrainingExamplesOptions the {@link IBMDiscoveryV1Models.ListTrainingExamplesOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TrainingExampleList} with the response
   */
  public IBMDiscoveryV1Models.TrainingExampleList listTrainingExamples(IBMDiscoveryV1Models.ListTrainingExamplesOptions listTrainingExamplesOptions) {
    IBMWatsonValidator.notNull(listTrainingExamplesOptions, 'listTrainingExamplesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data/{2}/examples', new String[]{ listTrainingExamplesOptions.environmentId(), listTrainingExamplesOptions.collectionId(), listTrainingExamplesOptions.queryId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listTrainingExamples');
    Map<String, String> requestHeaders = (listTrainingExamplesOptions != null) ? listTrainingExamplesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.TrainingExampleList) createServiceCall(builder.build(), IBMDiscoveryV1Models.TrainingExampleList.class);
  }

  /**
   * Add example to training data query.
   *
   * Adds a example to this training data query.
   *
   * @param createTrainingExampleOptions the {@link IBMDiscoveryV1Models.CreateTrainingExampleOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TrainingExample} with the response
   */
  public IBMDiscoveryV1Models.TrainingExample createTrainingExample(IBMDiscoveryV1Models.CreateTrainingExampleOptions createTrainingExampleOptions) {
    IBMWatsonValidator.notNull(createTrainingExampleOptions, 'createTrainingExampleOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data/{2}/examples', new String[]{ createTrainingExampleOptions.environmentId(), createTrainingExampleOptions.collectionId(), createTrainingExampleOptions.queryId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createTrainingExample');
    Map<String, String> requestHeaders = (createTrainingExampleOptions != null) ? createTrainingExampleOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (createTrainingExampleOptions.documentId() != null) {
      contentJson.put('document_id', createTrainingExampleOptions.documentId());
    }
    if (createTrainingExampleOptions.crossReference() != null) {
      contentJson.put('cross_reference', createTrainingExampleOptions.crossReference());
    }
    if (createTrainingExampleOptions.relevance() != null) {
      contentJson.put('relevance', createTrainingExampleOptions.relevance());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.TrainingExample) createServiceCall(builder.build(), IBMDiscoveryV1Models.TrainingExample.class);
  }

  /**
   * Delete example for training data query.
   *
   * Deletes the example document with the given ID from the training data query.
   *
   * @param deleteTrainingExampleOptions the {@link IBMDiscoveryV1Models.DeleteTrainingExampleOptions} containing the options for the call
   * @return the service call
   */
  public void deleteTrainingExample(IBMDiscoveryV1Models.DeleteTrainingExampleOptions deleteTrainingExampleOptions) {
    IBMWatsonValidator.notNull(deleteTrainingExampleOptions, 'deleteTrainingExampleOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data/{2}/examples/{3}', new String[]{ deleteTrainingExampleOptions.environmentId(), deleteTrainingExampleOptions.collectionId(), deleteTrainingExampleOptions.queryId(), deleteTrainingExampleOptions.exampleId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteTrainingExample');
    Map<String, String> requestHeaders = (deleteTrainingExampleOptions != null) ? deleteTrainingExampleOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Change label or cross reference for example.
   *
   * Changes the label or cross reference query for this training data example.
   *
   * @param updateTrainingExampleOptions the {@link IBMDiscoveryV1Models.UpdateTrainingExampleOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TrainingExample} with the response
   */
  public IBMDiscoveryV1Models.TrainingExample updateTrainingExample(IBMDiscoveryV1Models.UpdateTrainingExampleOptions updateTrainingExampleOptions) {
    IBMWatsonValidator.notNull(updateTrainingExampleOptions, 'updateTrainingExampleOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPut(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data/{2}/examples/{3}', new String[]{ updateTrainingExampleOptions.environmentId(), updateTrainingExampleOptions.collectionId(), updateTrainingExampleOptions.queryId(), updateTrainingExampleOptions.exampleId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=updateTrainingExample');
    Map<String, String> requestHeaders = (updateTrainingExampleOptions != null) ? updateTrainingExampleOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (updateTrainingExampleOptions.crossReference() != null) {
      contentJson.put('cross_reference', updateTrainingExampleOptions.crossReference());
    }
    if (updateTrainingExampleOptions.relevance() != null) {
      contentJson.put('relevance', updateTrainingExampleOptions.relevance());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.TrainingExample) createServiceCall(builder.build(), IBMDiscoveryV1Models.TrainingExample.class);
  }

  /**
   * Get details for training data example.
   *
   * Gets the details for this training example.
   *
   * @param getTrainingExampleOptions the {@link IBMDiscoveryV1Models.GetTrainingExampleOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.TrainingExample} with the response
   */
  public IBMDiscoveryV1Models.TrainingExample getTrainingExample(IBMDiscoveryV1Models.GetTrainingExampleOptions getTrainingExampleOptions) {
    IBMWatsonValidator.notNull(getTrainingExampleOptions, 'getTrainingExampleOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/collections/{1}/training_data/{2}/examples/{3}', new String[]{ getTrainingExampleOptions.environmentId(), getTrainingExampleOptions.collectionId(), getTrainingExampleOptions.queryId(), getTrainingExampleOptions.exampleId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getTrainingExample');
    Map<String, String> requestHeaders = (getTrainingExampleOptions != null) ? getTrainingExampleOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.TrainingExample) createServiceCall(builder.build(), IBMDiscoveryV1Models.TrainingExample.class);
  }

  /**
   * Delete labeled data.
   *
   * Deletes all data associated with a specified customer ID. The method has no effect if no data is associated with
   * the customer ID.
   *
   * You associate a customer ID with data by passing the **X-Watson-Metadata** header with a request that passes data.
   * For more information about personal data and customer IDs, see [Information
   * security](https://cloud.ibm.com/docs/discovery?topic=discovery-information-security#information-security).
   *
   * @param deleteUserDataOptions the {@link IBMDiscoveryV1Models.DeleteUserDataOptions} containing the options for the call
   * @return the service call
   */
  public void deleteUserData(IBMDiscoveryV1Models.DeleteUserDataOptions deleteUserDataOptions) {
    IBMWatsonValidator.notNull(deleteUserDataOptions, 'deleteUserDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + '/v1/user_data');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteUserData');
    Map<String, String> requestHeaders = (deleteUserDataOptions != null) ? deleteUserDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (deleteUserDataOptions.customerId() != null) {
      builder.query('customer_id', deleteUserDataOptions.customerId());
    }

    createServiceCall(builder.build(), null);
  }

  /**
   * Create event.
   *
   * The **Events** API can be used to create log entries that are associated with specific queries. For example, you
   * can record which documents in the results set were "clicked" by a user and when that click occurred.
   *
   * @param createEventOptions the {@link IBMDiscoveryV1Models.CreateEventOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.CreateEventResponse} with the response
   */
  public IBMDiscoveryV1Models.CreateEventResponse createEvent(IBMDiscoveryV1Models.CreateEventOptions createEventOptions) {
    IBMWatsonValidator.notNull(createEventOptions, 'createEventOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/events');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createEvent');
    Map<String, String> requestHeaders = (createEventOptions != null) ? createEventOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('type', createEventOptions.xType());
    contentJson.put('data', createEventOptions.data().replacePropertyNames());
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.CreateEventResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.CreateEventResponse.class);
  }

  /**
   * Search the query and event log.
   *
   * Searches the query and event log to find query sessions that match the specified criteria. Searching the **logs**
   * endpoint uses the standard Discovery query syntax for the parameters that are supported.
   *
   * @param queryLogOptions the {@link IBMDiscoveryV1Models.QueryLogOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.LogQueryResponse} with the response
   */
  public IBMDiscoveryV1Models.LogQueryResponse queryLog(IBMDiscoveryV1Models.QueryLogOptions queryLogOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/logs');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=queryLog');
    Map<String, String> requestHeaders = (queryLogOptions != null) ? queryLogOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (queryLogOptions != null && queryLogOptions.filter() != null) {
      builder.query('filter', queryLogOptions.filter());
    }
    if (queryLogOptions != null && queryLogOptions.query() != null) {
      builder.query('query', queryLogOptions.query());
    }
    if (queryLogOptions != null && queryLogOptions.count() != null) {
      builder.query('count', String.valueOf(queryLogOptions.count()));
    }
    if (queryLogOptions != null && queryLogOptions.offset() != null) {
      builder.query('offset', String.valueOf(queryLogOptions.offset()));
    }
    if (queryLogOptions != null && queryLogOptions.xSort() != null) {
      builder.query('sort', String.join(queryLogOptions.xSort(), ','));
    }

    return (IBMDiscoveryV1Models.LogQueryResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.LogQueryResponse.class);
  }

  /**
   * Number of queries over time.
   *
   * Total number of queries using the **natural_language_query** parameter over a specific time window.
   *
   * @param getMetricsQueryOptions the {@link IBMDiscoveryV1Models.GetMetricsQueryOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.MetricResponse} with the response
   */
  public IBMDiscoveryV1Models.MetricResponse getMetricsQuery(IBMDiscoveryV1Models.GetMetricsQueryOptions getMetricsQueryOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/metrics/number_of_queries');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getMetricsQuery');
    Map<String, String> requestHeaders = (getMetricsQueryOptions != null) ? getMetricsQueryOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getMetricsQueryOptions != null && getMetricsQueryOptions.startTime() != null) {
      builder.query('start_time', String.valueOf(getMetricsQueryOptions.startTime()));
    }
    if (getMetricsQueryOptions != null && getMetricsQueryOptions.endTime() != null) {
      builder.query('end_time', String.valueOf(getMetricsQueryOptions.endTime()));
    }
    if (getMetricsQueryOptions != null && getMetricsQueryOptions.resultType() != null) {
      builder.query('result_type', getMetricsQueryOptions.resultType());
    }

    return (IBMDiscoveryV1Models.MetricResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.MetricResponse.class);
  }

  /**
   * Number of queries with an event over time.
   *
   * Total number of queries using the **natural_language_query** parameter that have a corresponding "click" event over
   * a specified time window. This metric requires having integrated event tracking in your application using the
   * **Events** API.
   *
   * @param getMetricsQueryEventOptions the {@link IBMDiscoveryV1Models.GetMetricsQueryEventOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.MetricResponse} with the response
   */
  public IBMDiscoveryV1Models.MetricResponse getMetricsQueryEvent(IBMDiscoveryV1Models.GetMetricsQueryEventOptions getMetricsQueryEventOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/metrics/number_of_queries_with_event');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getMetricsQueryEvent');
    Map<String, String> requestHeaders = (getMetricsQueryEventOptions != null) ? getMetricsQueryEventOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getMetricsQueryEventOptions != null && getMetricsQueryEventOptions.startTime() != null) {
      builder.query('start_time', String.valueOf(getMetricsQueryEventOptions.startTime()));
    }
    if (getMetricsQueryEventOptions != null && getMetricsQueryEventOptions.endTime() != null) {
      builder.query('end_time', String.valueOf(getMetricsQueryEventOptions.endTime()));
    }
    if (getMetricsQueryEventOptions != null && getMetricsQueryEventOptions.resultType() != null) {
      builder.query('result_type', getMetricsQueryEventOptions.resultType());
    }

    return (IBMDiscoveryV1Models.MetricResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.MetricResponse.class);
  }

  /**
   * Number of queries with no search results over time.
   *
   * Total number of queries using the **natural_language_query** parameter that have no results returned over a
   * specified time window.
   *
   * @param getMetricsQueryNoResultsOptions the {@link IBMDiscoveryV1Models.GetMetricsQueryNoResultsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.MetricResponse} with the response
   */
  public IBMDiscoveryV1Models.MetricResponse getMetricsQueryNoResults(IBMDiscoveryV1Models.GetMetricsQueryNoResultsOptions getMetricsQueryNoResultsOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/metrics/number_of_queries_with_no_search_results');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getMetricsQueryNoResults');
    Map<String, String> requestHeaders = (getMetricsQueryNoResultsOptions != null) ? getMetricsQueryNoResultsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getMetricsQueryNoResultsOptions != null && getMetricsQueryNoResultsOptions.startTime() != null) {
      builder.query('start_time', String.valueOf(getMetricsQueryNoResultsOptions.startTime()));
    }
    if (getMetricsQueryNoResultsOptions != null && getMetricsQueryNoResultsOptions.endTime() != null) {
      builder.query('end_time', String.valueOf(getMetricsQueryNoResultsOptions.endTime()));
    }
    if (getMetricsQueryNoResultsOptions != null && getMetricsQueryNoResultsOptions.resultType() != null) {
      builder.query('result_type', getMetricsQueryNoResultsOptions.resultType());
    }

    return (IBMDiscoveryV1Models.MetricResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.MetricResponse.class);
  }

  /**
   * Percentage of queries with an associated event.
   *
   * The percentage of queries using the **natural_language_query** parameter that have a corresponding "click" event
   * over a specified time window.  This metric requires having integrated event tracking in your application using the
   * **Events** API.
   *
   * @param getMetricsEventRateOptions the {@link IBMDiscoveryV1Models.GetMetricsEventRateOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.MetricResponse} with the response
   */
  public IBMDiscoveryV1Models.MetricResponse getMetricsEventRate(IBMDiscoveryV1Models.GetMetricsEventRateOptions getMetricsEventRateOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/metrics/event_rate');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getMetricsEventRate');
    Map<String, String> requestHeaders = (getMetricsEventRateOptions != null) ? getMetricsEventRateOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getMetricsEventRateOptions != null && getMetricsEventRateOptions.startTime() != null) {
      builder.query('start_time', String.valueOf(getMetricsEventRateOptions.startTime()));
    }
    if (getMetricsEventRateOptions != null && getMetricsEventRateOptions.endTime() != null) {
      builder.query('end_time', String.valueOf(getMetricsEventRateOptions.endTime()));
    }
    if (getMetricsEventRateOptions != null && getMetricsEventRateOptions.resultType() != null) {
      builder.query('result_type', getMetricsEventRateOptions.resultType());
    }

    return (IBMDiscoveryV1Models.MetricResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.MetricResponse.class);
  }

  /**
   * Most frequent query tokens with an event.
   *
   * The most frequent query tokens parsed from the **natural_language_query** parameter and their corresponding "click"
   * event rate within the recording period (queries and events are stored for 30 days). A query token is an individual
   * word or unigram within the query string.
   *
   * @param getMetricsQueryTokenEventOptions the {@link IBMDiscoveryV1Models.GetMetricsQueryTokenEventOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.MetricTokenResponse} with the response
   */
  public IBMDiscoveryV1Models.MetricTokenResponse getMetricsQueryTokenEvent(IBMDiscoveryV1Models.GetMetricsQueryTokenEventOptions getMetricsQueryTokenEventOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/metrics/top_query_tokens_with_event_rate');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getMetricsQueryTokenEvent');
    Map<String, String> requestHeaders = (getMetricsQueryTokenEventOptions != null) ? getMetricsQueryTokenEventOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getMetricsQueryTokenEventOptions != null && getMetricsQueryTokenEventOptions.count() != null) {
      builder.query('count', String.valueOf(getMetricsQueryTokenEventOptions.count()));
    }

    return (IBMDiscoveryV1Models.MetricTokenResponse) createServiceCall(builder.build(), IBMDiscoveryV1Models.MetricTokenResponse.class);
  }

  /**
   * List credentials.
   *
   * List all the source credentials that have been created for this service instance.
   *
   *  **Note:**  All credentials are sent over an encrypted connection and encrypted at rest.
   *
   * @param listCredentialsOptions the {@link IBMDiscoveryV1Models.ListCredentialsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.CredentialsList} with the response
   */
  public IBMDiscoveryV1Models.CredentialsList listCredentials(IBMDiscoveryV1Models.ListCredentialsOptions listCredentialsOptions) {
    IBMWatsonValidator.notNull(listCredentialsOptions, 'listCredentialsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/credentials', new String[]{ listCredentialsOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listCredentials');
    Map<String, String> requestHeaders = (listCredentialsOptions != null) ? listCredentialsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.CredentialsList) createServiceCall(builder.build(), IBMDiscoveryV1Models.CredentialsList.class);
  }

  /**
   * Create credentials.
   *
   * Creates a set of credentials to connect to a remote source. Created credentials are used in a configuration to
   * associate a collection with the remote source.
   *
   * **Note:** All credentials are sent over an encrypted connection and encrypted at rest.
   *
   * @param createCredentialsOptions the {@link IBMDiscoveryV1Models.CreateCredentialsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Credentials} with the response
   */
  public IBMDiscoveryV1Models.Credentials createCredentials(IBMDiscoveryV1Models.CreateCredentialsOptions createCredentialsOptions) {
    IBMWatsonValidator.notNull(createCredentialsOptions, 'createCredentialsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/credentials', new String[]{ createCredentialsOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createCredentials');
    Map<String, String> requestHeaders = (createCredentialsOptions != null) ? createCredentialsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (createCredentialsOptions.sourceType() != null) {
      contentJson.put('source_type', createCredentialsOptions.sourceType());
    }
    if (createCredentialsOptions.credentialDetails() != null) {
      contentJson.put('credential_details', createCredentialsOptions.credentialDetails().replacePropertyNames());
    }
    if (createCredentialsOptions.status() != null) {
      contentJson.put('status', createCredentialsOptions.status());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Credentials) createServiceCall(builder.build(), IBMDiscoveryV1Models.Credentials.class);
  }

  /**
   * View Credentials.
   *
   * Returns details about the specified credentials.
   *
   *  **Note:** Secure credential information such as a password or SSH key is never returned and must be obtained from
   * the source system.
   *
   * @param getCredentialsOptions the {@link IBMDiscoveryV1Models.GetCredentialsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Credentials} with the response
   */
  public IBMDiscoveryV1Models.Credentials getCredentials(IBMDiscoveryV1Models.GetCredentialsOptions getCredentialsOptions) {
    IBMWatsonValidator.notNull(getCredentialsOptions, 'getCredentialsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/credentials/{1}', new String[]{ getCredentialsOptions.environmentId(), getCredentialsOptions.credentialId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getCredentials');
    Map<String, String> requestHeaders = (getCredentialsOptions != null) ? getCredentialsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.Credentials) createServiceCall(builder.build(), IBMDiscoveryV1Models.Credentials.class);
  }

  /**
   * Update credentials.
   *
   * Updates an existing set of source credentials.
   *
   * **Note:** All credentials are sent over an encrypted connection and encrypted at rest.
   *
   * @param updateCredentialsOptions the {@link IBMDiscoveryV1Models.UpdateCredentialsOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Credentials} with the response
   */
  public IBMDiscoveryV1Models.Credentials updateCredentials(IBMDiscoveryV1Models.UpdateCredentialsOptions updateCredentialsOptions) {
    IBMWatsonValidator.notNull(updateCredentialsOptions, 'updateCredentialsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPut(getServiceURL() + String.format('/v1/environments/{0}/credentials/{1}', new String[]{ updateCredentialsOptions.environmentId(), updateCredentialsOptions.credentialId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=updateCredentials');
    Map<String, String> requestHeaders = (updateCredentialsOptions != null) ? updateCredentialsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (updateCredentialsOptions.sourceType() != null) {
      contentJson.put('source_type', updateCredentialsOptions.sourceType());
    }
    if (updateCredentialsOptions.credentialDetails() != null) {
      contentJson.put('credential_details', updateCredentialsOptions.credentialDetails().replacePropertyNames());
    }
    if (updateCredentialsOptions.status() != null) {
      contentJson.put('status', updateCredentialsOptions.status());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Credentials) createServiceCall(builder.build(), IBMDiscoveryV1Models.Credentials.class);
  }

  /**
   * Delete credentials.
   *
   * Deletes a set of stored credentials from your Discovery instance.
   *
   * @param deleteCredentialsOptions the {@link IBMDiscoveryV1Models.DeleteCredentialsOptions} containing the options for the call
   * @return the service call
   */
  public void deleteCredentials(IBMDiscoveryV1Models.DeleteCredentialsOptions deleteCredentialsOptions) {
    IBMWatsonValidator.notNull(deleteCredentialsOptions, 'deleteCredentialsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/credentials/{1}', new String[]{ deleteCredentialsOptions.environmentId(), deleteCredentialsOptions.credentialId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteCredentials');
    Map<String, String> requestHeaders = (deleteCredentialsOptions != null) ? deleteCredentialsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * List Gateways.
   *
   * List the currently configured gateways.
   *
   * @param listGatewaysOptions the {@link IBMDiscoveryV1Models.ListGatewaysOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.GatewayList} with the response
   */
  public IBMDiscoveryV1Models.GatewayList listGateways(IBMDiscoveryV1Models.ListGatewaysOptions listGatewaysOptions) {
    IBMWatsonValidator.notNull(listGatewaysOptions, 'listGatewaysOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/gateways', new String[]{ listGatewaysOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=listGateways');
    Map<String, String> requestHeaders = (listGatewaysOptions != null) ? listGatewaysOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.GatewayList) createServiceCall(builder.build(), IBMDiscoveryV1Models.GatewayList.class);
  }

  /**
   * Create Gateway.
   *
   * Create a gateway configuration to use with a remotely installed gateway.
   *
   * @param createGatewayOptions the {@link IBMDiscoveryV1Models.CreateGatewayOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Gateway} with the response
   */
  public IBMDiscoveryV1Models.Gateway createGateway(IBMDiscoveryV1Models.CreateGatewayOptions createGatewayOptions) {
    IBMWatsonValidator.notNull(createGatewayOptions, 'createGatewayOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v1/environments/{0}/gateways', new String[]{ createGatewayOptions.environmentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=createGateway');
    Map<String, String> requestHeaders = (createGatewayOptions != null) ? createGatewayOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (createGatewayOptions.name() != null) {
      contentJson.put('name', createGatewayOptions.name());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMDiscoveryV1Models.Gateway) createServiceCall(builder.build(), IBMDiscoveryV1Models.Gateway.class);
  }

  /**
   * List Gateway Details.
   *
   * List information about the specified gateway.
   *
   * @param getGatewayOptions the {@link IBMDiscoveryV1Models.GetGatewayOptions} containing the options for the call
   * @return the {@link IBMDiscoveryV1Models.Gateway} with the response
   */
  public IBMDiscoveryV1Models.Gateway getGateway(IBMDiscoveryV1Models.GetGatewayOptions getGatewayOptions) {
    IBMWatsonValidator.notNull(getGatewayOptions, 'getGatewayOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/environments/{0}/gateways/{1}', new String[]{ getGatewayOptions.environmentId(), getGatewayOptions.gatewayId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=getGateway');
    Map<String, String> requestHeaders = (getGatewayOptions != null) ? getGatewayOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMDiscoveryV1Models.Gateway) createServiceCall(builder.build(), IBMDiscoveryV1Models.Gateway.class);
  }

  /**
   * Delete Gateway.
   *
   * Delete the specified gateway configuration.
   *
   * @param deleteGatewayOptions the {@link IBMDiscoveryV1Models.DeleteGatewayOptions} containing the options for the call
   * @return the service call
   */
  public void deleteGateway(IBMDiscoveryV1Models.DeleteGatewayOptions deleteGatewayOptions) {
    IBMWatsonValidator.notNull(deleteGatewayOptions, 'deleteGatewayOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/environments/{0}/gateways/{1}', new String[]{ deleteGatewayOptions.environmentId(), deleteGatewayOptions.gatewayId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=discovery;service_version=V1;operation_id=deleteGateway');
    Map<String, String> requestHeaders = (deleteGatewayOptions != null) ? deleteGatewayOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

}