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
 * Analyze various features of text content at scale. Provide text, raw HTML, or a public URL and IBM Watson Natural
 * Language Understanding will give you results for the features you request. The service cleans HTML content before
 * analysis by default, so the results can ignore most advertisements and other unwanted content.
 *
 * You can create [custom
 * models](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-customizing)
 * with Watson Knowledge Studio to detect custom entities and relations in Natural Language Understanding.
 *
 * @version V1
 * @see <a href="https://cloud.ibm.com/docs/natural-language-understanding/">Natural Language Understanding</a>
 */
public class IBMNaturalLanguageUnderstandingV1 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'natural_language_understanding';
  private static final String SERVICE_URL = 'https://gateway.watsonplatform.net/natural-language-understanding/api';

  private String versionDate;

  /**
   * Instantiates a new `IBMNaturalLanguageUnderstandingV1`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMNaturalLanguageUnderstandingV1(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMNaturalLanguageUnderstandingV1`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMNaturalLanguageUnderstandingV1(String versionDate, IBMWatsonAuthenticator authenticator) {
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
   * Analyze text.
   *
   * Analyzes text, HTML, or a public webpage for the following features:
   * - Categories
   * - Concepts
   * - Emotion
   * - Entities
   * - Keywords
   * - Metadata
   * - Relations
   * - Semantic roles
   * - Sentiment
   * - Syntax (Experimental).
   *
   * If a language for the input text is not specified with the `language` parameter, the service [automatically detects
   * the
   * language](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-detectable-languages).
   *
   * @param analyzeOptions the {@link IBMNaturalLanguageUnderstandingV1Models.AnalyzeOptions} containing the options for the call
   * @return the {@link IBMNaturalLanguageUnderstandingV1Models.AnalysisResults} with the response
   */
  public IBMNaturalLanguageUnderstandingV1Models.AnalysisResults analyze(IBMNaturalLanguageUnderstandingV1Models.AnalyzeOptions analyzeOptions) {
    IBMWatsonValidator.notNull(analyzeOptions, 'analyzeOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/analyze');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=natural-language-understanding;service_version=V1;operation_id=analyze');
    Map<String, String> requestHeaders = (analyzeOptions != null) ? analyzeOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('features', analyzeOptions.features().replacePropertyNames());
    if (analyzeOptions.text() != null) {
      contentJson.put('text', analyzeOptions.text());
    }
    if (analyzeOptions.html() != null) {
      contentJson.put('html', analyzeOptions.html());
    }
    if (analyzeOptions.url() != null) {
      contentJson.put('url', analyzeOptions.url());
    }
    if (analyzeOptions.clean() != null) {
      contentJson.put('clean', analyzeOptions.clean());
    }
    if (analyzeOptions.xpath() != null) {
      contentJson.put('xpath', analyzeOptions.xpath());
    }
    if (analyzeOptions.fallbackToRaw() != null) {
      contentJson.put('fallback_to_raw', analyzeOptions.fallbackToRaw());
    }
    if (analyzeOptions.returnAnalyzedText() != null) {
      contentJson.put('return_analyzed_text', analyzeOptions.returnAnalyzedText());
    }
    if (analyzeOptions.language() != null) {
      contentJson.put('language', analyzeOptions.language());
    }
    if (analyzeOptions.limitTextCharacters() != null) {
      contentJson.put('limit_text_characters', analyzeOptions.limitTextCharacters());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMNaturalLanguageUnderstandingV1Models.AnalysisResults) createServiceCall(builder.build(), IBMNaturalLanguageUnderstandingV1Models.AnalysisResults.class);
  }

  /**
   * List models.
   *
   * Lists Watson Knowledge Studio [custom entities and relations
   * models](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-customizing)
   * that are deployed to your Natural Language Understanding service.
   *
   * @param listModelsOptions the {@link IBMNaturalLanguageUnderstandingV1Models.ListModelsOptions} containing the options for the call
   * @return the {@link IBMNaturalLanguageUnderstandingV1Models.ListModelsResults} with the response
   */
  public IBMNaturalLanguageUnderstandingV1Models.ListModelsResults listModels(IBMNaturalLanguageUnderstandingV1Models.ListModelsOptions listModelsOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/models');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=natural-language-understanding;service_version=V1;operation_id=listModels');
    Map<String, String> requestHeaders = (listModelsOptions != null) ? listModelsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMNaturalLanguageUnderstandingV1Models.ListModelsResults) createServiceCall(builder.build(), IBMNaturalLanguageUnderstandingV1Models.ListModelsResults.class);
  }

  /**
   * Delete model.
   *
   * Deletes a custom model.
   *
   * @param deleteModelOptions the {@link IBMNaturalLanguageUnderstandingV1Models.DeleteModelOptions} containing the options for the call
   * @return the service call
   */
  public void deleteModel(IBMNaturalLanguageUnderstandingV1Models.DeleteModelOptions deleteModelOptions) {
    IBMWatsonValidator.notNull(deleteModelOptions, 'deleteModelOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/models/{0}', new String[]{ deleteModelOptions.modelId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=natural-language-understanding;service_version=V1;operation_id=deleteModel');
    Map<String, String> requestHeaders = (deleteModelOptions != null) ? deleteModelOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

}