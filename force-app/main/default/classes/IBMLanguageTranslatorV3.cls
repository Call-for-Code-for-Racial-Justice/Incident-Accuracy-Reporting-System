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

/**
 * IBM Watson&trade; Language Translator translates text from one language to another. The service offers multiple IBM
 * provided translation models that you can customize based on your unique terminology and language. Use Language
 * Translator to take news from across the globe and present it in your language, communicate with your customers in
 * their own language, and more.
 *
 * @version V3
 * @see <a href="https://cloud.ibm.com/docs/language-translator/">Language Translator</a>
 */
public class IBMLanguageTranslatorV3 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'language_translator';
  private static final String SERVICE_URL = 'https://gateway.watsonplatform.net/language-translator/api';

  private String versionDate;

  /**
   * Instantiates a new `IBMLanguageTranslatorV3`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMLanguageTranslatorV3(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMLanguageTranslatorV3`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMLanguageTranslatorV3(String versionDate, IBMWatsonAuthenticator authenticator) {
    super(SERVICE_NAME, 'v3', authenticator);

    if ((getServiceURL() == null) || String.isBlank(getServiceURL())) {
      setServiceURL(SERVICE_URL);
    }

    if (String.isBlank(versionDate)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('versionDate cannot be null.');
    }
    this.versionDate = versionDate;
  }

  /**
   * Translate.
   *
   * Translates the input text from the source language to the target language.
   *
   * @param translateOptions the {@link IBMLanguageTranslatorV3Models.TranslateOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.TranslationResult} with the response
   */
  public IBMLanguageTranslatorV3Models.TranslationResult translate(IBMLanguageTranslatorV3Models.TranslateOptions translateOptions) {
    IBMWatsonValidator.notNull(translateOptions, 'translateOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/translate');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=translate');
    Map<String, String> requestHeaders = (translateOptions != null) ? translateOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('text', translateOptions.text());
    if (translateOptions.modelId() != null) {
      contentJson.put('model_id', translateOptions.modelId());
    }
    if (translateOptions.source() != null) {
      contentJson.put('source', translateOptions.source());
    }
    if (translateOptions.target() != null) {
      contentJson.put('target', translateOptions.target());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMLanguageTranslatorV3Models.TranslationResult) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.TranslationResult.class);
  }

  /**
   * List identifiable languages.
   *
   * Lists the languages that the service can identify. Returns the language code (for example, `en` for English or `es`
   * for Spanish) and name of each language.
   *
   * @param listIdentifiableLanguagesOptions the {@link IBMLanguageTranslatorV3Models.ListIdentifiableLanguagesOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.IdentifiableLanguages} with the response
   */
  public IBMLanguageTranslatorV3Models.IdentifiableLanguages listIdentifiableLanguages(IBMLanguageTranslatorV3Models.ListIdentifiableLanguagesOptions listIdentifiableLanguagesOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v3/identifiable_languages');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=listIdentifiableLanguages');
    Map<String, String> requestHeaders = (listIdentifiableLanguagesOptions != null) ? listIdentifiableLanguagesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMLanguageTranslatorV3Models.IdentifiableLanguages) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.IdentifiableLanguages.class);
  }

  /**
   * Identify language.
   *
   * Identifies the language of the input text.
   *
   * @param identifyOptions the {@link IBMLanguageTranslatorV3Models.IdentifyOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.IdentifiedLanguages} with the response
   */
  public IBMLanguageTranslatorV3Models.IdentifiedLanguages identify(IBMLanguageTranslatorV3Models.IdentifyOptions identifyOptions) {
    IBMWatsonValidator.notNull(identifyOptions, 'identifyOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/identify');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=identify');
    Map<String, String> requestHeaders = (identifyOptions != null) ? identifyOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    builder.bodyContent(identifyOptions.text(), 'text/plain');

    return (IBMLanguageTranslatorV3Models.IdentifiedLanguages) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.IdentifiedLanguages.class);
  }

  /**
   * List models.
   *
   * Lists available translation models.
   *
   * @param listModelsOptions the {@link IBMLanguageTranslatorV3Models.ListModelsOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.TranslationModels} with the response
   */
  public IBMLanguageTranslatorV3Models.TranslationModels listModels(IBMLanguageTranslatorV3Models.ListModelsOptions listModelsOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v3/models');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=listModels');
    Map<String, String> requestHeaders = (listModelsOptions != null) ? listModelsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (listModelsOptions != null && listModelsOptions.source() != null) {
      builder.query('source', listModelsOptions.source());
    }
    if (listModelsOptions != null && listModelsOptions.target() != null) {
      builder.query('target', listModelsOptions.target());
    }
    if (listModelsOptions != null && listModelsOptions.xDefault() != null) {
      builder.query('default', String.valueOf(listModelsOptions.xDefault()));
    }

    return (IBMLanguageTranslatorV3Models.TranslationModels) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.TranslationModels.class);
  }

  /**
   * Create model.
   *
   * Uploads Translation Memory eXchange (TMX) files to customize a translation model.
   *
   * You can either customize a model with a forced glossary or with a corpus that contains parallel sentences. To
   * create a model that is customized with a parallel corpus <b>and</b> a forced glossary, proceed in two steps:
   * customize with a parallel corpus first and then customize the resulting model with a glossary. Depending on the
   * type of customization and the size of the uploaded corpora, training can range from minutes for a glossary to
   * several hours for a large parallel corpus. You can upload a single forced glossary file and this file must be less
   * than <b>10 MB</b>. You can upload multiple parallel corpora tmx files. The cumulative file size of all uploaded
   * files is limited to <b>250 MB</b>. To successfully train with a parallel corpus you must have at least <b>5,000
   * parallel sentences</b> in your corpus.
   *
   * You can have a <b>maximum of 10 custom models per language pair</b>.
   *
   * @param createModelOptions the {@link IBMLanguageTranslatorV3Models.CreateModelOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.TranslationModel} with the response
   */
  public IBMLanguageTranslatorV3Models.TranslationModel createModel(IBMLanguageTranslatorV3Models.CreateModelOptions createModelOptions) {
    IBMWatsonValidator.notNull(createModelOptions, 'createModelOptions cannot be null');
    IBMWatsonValidator.isTrue((createModelOptions.forcedGlossary() != null) || (createModelOptions.parallelCorpus() != null), 'At least one of forced_glossary or parallel_corpus must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/models');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=createModel');
    Map<String, String> requestHeaders = (createModelOptions != null) ? createModelOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (createModelOptions.baseModelId() != null) {
      builder.query('base_model_id', createModelOptions.baseModelId());
    }
    if (createModelOptions.name() != null) {
      builder.query('name', createModelOptions.name());
    }
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    if (createModelOptions.forcedGlossary() != null) {
      IBMWatsonRequestBody forcedGlossaryBody = IBMWatsonRequestBody.create(createModelOptions.forcedGlossary(), 'application/octet-stream');
      multipartBuilder.addFormDataPart('forced_glossary', 'filename', forcedGlossaryBody);
    }
    if (createModelOptions.parallelCorpus() != null) {
      IBMWatsonRequestBody parallelCorpusBody = IBMWatsonRequestBody.create(createModelOptions.parallelCorpus(), 'application/octet-stream');
      multipartBuilder.addFormDataPart('parallel_corpus', 'filename', parallelCorpusBody);
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMLanguageTranslatorV3Models.TranslationModel) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.TranslationModel.class);
  }

  /**
   * Delete model.
   *
   * Deletes a custom translation model.
   *
   * @param deleteModelOptions the {@link IBMLanguageTranslatorV3Models.DeleteModelOptions} containing the options for the call
   * @return the service call
   */
  public void deleteModel(IBMLanguageTranslatorV3Models.DeleteModelOptions deleteModelOptions) {
    IBMWatsonValidator.notNull(deleteModelOptions, 'deleteModelOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v3/models/{0}', new String[]{ deleteModelOptions.modelId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=deleteModel');
    Map<String, String> requestHeaders = (deleteModelOptions != null) ? deleteModelOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Get model details.
   *
   * Gets information about a translation model, including training status for custom models. Use this API call to poll
   * the status of your customization request. A successfully completed training will have a status of `available`.
   *
   * @param getModelOptions the {@link IBMLanguageTranslatorV3Models.GetModelOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.TranslationModel} with the response
   */
  public IBMLanguageTranslatorV3Models.TranslationModel getModel(IBMLanguageTranslatorV3Models.GetModelOptions getModelOptions) {
    IBMWatsonValidator.notNull(getModelOptions, 'getModelOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v3/models/{0}', new String[]{ getModelOptions.modelId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=getModel');
    Map<String, String> requestHeaders = (getModelOptions != null) ? getModelOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMLanguageTranslatorV3Models.TranslationModel) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.TranslationModel.class);
  }

  /**
   * List documents.
   *
   * Lists documents that have been submitted for translation.
   *
   * @param listDocumentsOptions the {@link IBMLanguageTranslatorV3Models.ListDocumentsOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.DocumentList} with the response
   */
  public IBMLanguageTranslatorV3Models.DocumentList listDocuments(IBMLanguageTranslatorV3Models.ListDocumentsOptions listDocumentsOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v3/documents');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=listDocuments');
    Map<String, String> requestHeaders = (listDocumentsOptions != null) ? listDocumentsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMLanguageTranslatorV3Models.DocumentList) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.DocumentList.class);
  }

  /**
   * Translate document.
   *
   * Submit a document for translation. You can submit the document contents in the `file` parameter, or you can
   * reference a previously submitted document by document ID.
   *
   * @param translateDocumentOptions the {@link IBMLanguageTranslatorV3Models.TranslateDocumentOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.DocumentStatus} with the response
   */
  public IBMLanguageTranslatorV3Models.DocumentStatus translateDocument(IBMLanguageTranslatorV3Models.TranslateDocumentOptions translateDocumentOptions) {
    IBMWatsonValidator.notNull(translateDocumentOptions, 'translateDocumentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/documents');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=translateDocument');
    Map<String, String> requestHeaders = (translateDocumentOptions != null) ? translateDocumentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    IBMWatsonRequestBody fileBody = IBMWatsonRequestBody.create(translateDocumentOptions.file(), translateDocumentOptions.fileContentType());
    multipartBuilder.addFormDataPart('file', translateDocumentOptions.filename(), fileBody);
    if (translateDocumentOptions.modelId() != null) {
      multipartBuilder.addFormDataPart('model_id', translateDocumentOptions.modelId());
    }
    if (translateDocumentOptions.source() != null) {
      multipartBuilder.addFormDataPart('source', translateDocumentOptions.source());
    }
    if (translateDocumentOptions.target() != null) {
      multipartBuilder.addFormDataPart('target', translateDocumentOptions.target());
    }
    if (translateDocumentOptions.documentId() != null) {
      multipartBuilder.addFormDataPart('document_id', translateDocumentOptions.documentId());
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMLanguageTranslatorV3Models.DocumentStatus) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.DocumentStatus.class);
  }

  /**
   * Get document status.
   *
   * Gets the translation status of a document.
   *
   * @param getDocumentStatusOptions the {@link IBMLanguageTranslatorV3Models.GetDocumentStatusOptions} containing the options for the call
   * @return the {@link IBMLanguageTranslatorV3Models.DocumentStatus} with the response
   */
  public IBMLanguageTranslatorV3Models.DocumentStatus getDocumentStatus(IBMLanguageTranslatorV3Models.GetDocumentStatusOptions getDocumentStatusOptions) {
    IBMWatsonValidator.notNull(getDocumentStatusOptions, 'getDocumentStatusOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v3/documents/{0}', new String[]{ getDocumentStatusOptions.documentId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=getDocumentStatus');
    Map<String, String> requestHeaders = (getDocumentStatusOptions != null) ? getDocumentStatusOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMLanguageTranslatorV3Models.DocumentStatus) createServiceCall(builder.build(), IBMLanguageTranslatorV3Models.DocumentStatus.class);
  }

  /**
   * Delete document.
   *
   * Deletes a document.
   *
   * @param deleteDocumentOptions the {@link IBMLanguageTranslatorV3Models.DeleteDocumentOptions} containing the options for the call
   * @return the service call
   */
  public void deleteDocument(IBMLanguageTranslatorV3Models.DeleteDocumentOptions deleteDocumentOptions) {
    IBMWatsonValidator.notNull(deleteDocumentOptions, 'deleteDocumentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v3/documents/{0}', new String[]{ deleteDocumentOptions.documentId() }));
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=deleteDocument');
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
   * Get translated document.
   *
   * Gets the translated document associated with the given document ID.
   *
   * @param getTranslatedDocumentOptions the {@link IBMLanguageTranslatorV3Models.GetTranslatedDocumentOptions} containing the options for the call
   * @return the {@link IBMWatsonFile} with the response
   */
  public IBMWatsonFile getTranslatedDocument(IBMLanguageTranslatorV3Models.GetTranslatedDocumentOptions getTranslatedDocumentOptions) {
    IBMWatsonValidator.notNull(getTranslatedDocumentOptions, 'getTranslatedDocumentOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v3/documents/{0}/translated_document', new String[]{ getTranslatedDocumentOptions.documentId() }));
    if (getTranslatedDocumentOptions.accept() != null) {
      builder.addHeader('Accept', getTranslatedDocumentOptions.accept());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=language_translator;service_version=V3;operation_id=getTranslatedDocument');
    Map<String, String> requestHeaders = (getTranslatedDocumentOptions != null) ? getTranslatedDocumentOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMWatsonFile) createServiceCall(builder.build(), IBMWatsonFile.class);
  }

}