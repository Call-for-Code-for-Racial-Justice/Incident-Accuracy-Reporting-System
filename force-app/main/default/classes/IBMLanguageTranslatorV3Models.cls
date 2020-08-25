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

public class IBMLanguageTranslatorV3Models {
  /**
   * The createModel options.
   */
  public class CreateModelOptions extends IBMWatsonOptionsModel {
    private String baseModelId;
    private IBMWatsonFile forcedGlossary;
    private IBMWatsonFile parallelCorpus;
    private String name;

    /**
     * Gets the baseModelId.
     *
     * The model ID of the model to use as the base for customization. To see available models, use the `List models`
     * method. Usually all IBM provided models are customizable. In addition, all your models that have been created via
     * parallel corpus customization, can be further customized with a forced glossary.
     *
     * @return the baseModelId
     */
    public String baseModelId() {
      return baseModelId;
    }

    /**
     * Gets the forcedGlossary.
     *
     * A TMX file with your customizations. The customizations in the file completely overwrite the domain translaton
     * data, including high frequency or high confidence phrase translations. You can upload only one glossary with a
     * file size less than 10 MB per call. A forced glossary should contain single words or short phrases.
     *
     * @return the forcedGlossary
     */
    public IBMWatsonFile forcedGlossary() {
      return forcedGlossary;
    }

    /**
     * Gets the parallelCorpus.
     *
     * A TMX file with parallel sentences for source and target language. You can upload multiple parallel_corpus files
     * in one request. All uploaded parallel_corpus files combined, your parallel corpus must contain at least 5,000
     * parallel sentences to train successfully.
     *
     * @return the parallelCorpus
     */
    public IBMWatsonFile parallelCorpus() {
      return parallelCorpus;
    }

    /**
     * Gets the name.
     *
     * An optional model name that you can use to identify the model. Valid characters are letters, numbers, dashes,
     * underscores, spaces and apostrophes. The maximum length is 32 characters.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    private CreateModelOptions(CreateModelOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.baseModelId, 'baseModelId cannot be null');
      baseModelId = builder.baseModelId;
      forcedGlossary = builder.forcedGlossary;
      parallelCorpus = builder.parallelCorpus;
      name = builder.name;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateModelOptions builder
     */
    public CreateModelOptionsBuilder newBuilder() {
      return new CreateModelOptionsBuilder(this);
    }
  }

  /**
   * CreateModelOptions Builder.
   */
  public class CreateModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String baseModelId;
    private IBMWatsonFile forcedGlossary;
    private IBMWatsonFile parallelCorpus;
    private String name;

    private CreateModelOptionsBuilder(CreateModelOptions createModelOptions) {
      baseModelId = createModelOptions.baseModelId;
      forcedGlossary = createModelOptions.forcedGlossary;
      parallelCorpus = createModelOptions.parallelCorpus;
      name = createModelOptions.name;
      this.requestHeaders.putAll(createModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param baseModelId the baseModelId
     */
    public CreateModelOptionsBuilder(String baseModelId) {
      this.baseModelId = baseModelId;
    }

    /**
     * Builds a CreateModelOptions.
     *
     * @return the createModelOptions
     */
    public CreateModelOptions build() {
      return new CreateModelOptions(this);
    }

    /**
     * Set the baseModelId.
     *
     * @param baseModelId the baseModelId
     * @return the CreateModelOptions builder
     */
    public CreateModelOptionsBuilder baseModelId(String baseModelId) {
      this.baseModelId = baseModelId;
      return this;
    }

    /**
     * Set the forcedGlossary.
     *
     * @param forcedGlossary the forcedGlossary
     * @return the CreateModelOptions builder
     */
    public CreateModelOptionsBuilder forcedGlossary(IBMWatsonFile forcedGlossary) {
      this.forcedGlossary = forcedGlossary;
      return this;
    }

    /**
     * Set the parallelCorpus.
     *
     * @param parallelCorpus the parallelCorpus
     * @return the CreateModelOptions builder
     */
    public CreateModelOptionsBuilder parallelCorpus(IBMWatsonFile parallelCorpus) {
      this.parallelCorpus = parallelCorpus;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateModelOptions builder
     */
    public CreateModelOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateModelOptions builder
     */
    public CreateModelOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteDocument options.
   */
  public class DeleteDocumentOptions extends IBMWatsonOptionsModel {
    private String documentId;

    /**
     * Gets the documentId.
     *
     * Document ID of the document to delete.
     *
     * @return the documentId
     */
    public String documentId() {
      return documentId;
    }

    private DeleteDocumentOptions(DeleteDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
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
    private String documentId;

    private DeleteDocumentOptionsBuilder(DeleteDocumentOptions deleteDocumentOptions) {
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
     * @param documentId the documentId
     */
    public DeleteDocumentOptionsBuilder(String documentId) {
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
   * The deleteModel options.
   */
  public class DeleteModelOptions extends IBMWatsonOptionsModel {
    private String modelId;

    /**
     * Gets the modelId.
     *
     * Model ID of the model to delete.
     *
     * @return the modelId
     */
    public String modelId() {
      return modelId;
    }

    private DeleteModelOptions(DeleteModelOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.modelId, 'modelId cannot be empty');
      modelId = builder.modelId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteModelOptions builder
     */
    public DeleteModelOptionsBuilder newBuilder() {
      return new DeleteModelOptionsBuilder(this);
    }
  }

  /**
   * DeleteModelOptions Builder.
   */
  public class DeleteModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String modelId;

    private DeleteModelOptionsBuilder(DeleteModelOptions deleteModelOptions) {
      modelId = deleteModelOptions.modelId;
      this.requestHeaders.putAll(deleteModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param modelId the modelId
     */
    public DeleteModelOptionsBuilder(String modelId) {
      this.modelId = modelId;
    }

    /**
     * Builds a DeleteModelOptions.
     *
     * @return the deleteModelOptions
     */
    public DeleteModelOptions build() {
      return new DeleteModelOptions(this);
    }

    /**
     * Set the modelId.
     *
     * @param modelId the modelId
     * @return the DeleteModelOptions builder
     */
    public DeleteModelOptionsBuilder modelId(String modelId) {
      this.modelId = modelId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteModelOptions builder
     */
    public DeleteModelOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * DocumentList.
   */
  public class DocumentList extends IBMWatsonResponseModel {
    private List<DocumentStatus> documents;

    /**
     * Gets the documents.
     *
     * An array of all previously submitted documents.
     *
     * @return the documents
     */
    @AuraEnabled
    public List<DocumentStatus> getDocuments() {
      return documents;
    }

    /**
     * Sets the documents.
     *
     * @param documents the new documents
     */
    public void setDocuments(final List<DocumentStatus> documents) {
      this.documents = documents;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DocumentList ret = (DocumentList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for documents
      List<DocumentStatus> newDocuments = new List<DocumentStatus>();
      List<DocumentStatus> deserializedDocuments = ret.getDocuments();
      if (deserializedDocuments != null) {
        for (Integer i = 0; i < deserializedDocuments.size(); i++) {
          DocumentStatus currentItem = ret.getDocuments().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('documents');
          DocumentStatus newItem = (DocumentStatus) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), DocumentStatus.class);
          newDocuments.add(newItem);
        }
        ret.documents = newDocuments;
      }

      return ret;
    }
  }

  /**
   * Document information, including translation status.
   */
  public class DocumentStatus extends IBMWatsonResponseModel {
    private String documentId;
    private String filename;
    private String status;
    private String modelId;
    private String baseModelId;
    private String source;
    private String target;
    private Datetime created;
    private Datetime completed;
    private Long wordCount;
    private Long characterCount;

    /**
     * Gets the documentId.
     *
     * System generated ID identifying a document being translated using one specific translation model.
     *
     * @return the documentId
     */
    @AuraEnabled
    public String getDocumentId() {
      return documentId;
    }

    /**
     * Gets the filename.
     *
     * filename from the submission (if it was missing in the multipart-form, 'noname.<ext matching content type>' is
     * used.
     *
     * @return the filename
     */
    @AuraEnabled
    public String getFilename() {
      return filename;
    }

    /**
     * Gets the status.
     *
     * The status of the translation job associated with a submitted document.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the modelId.
     *
     * A globally unique string that identifies the underlying model that is used for translation.
     *
     * @return the modelId
     */
    @AuraEnabled
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the baseModelId.
     *
     * Model ID of the base model that was used to customize the model. If the model is not a custom model, this will be
     * absent or an empty string.
     *
     * @return the baseModelId
     */
    @AuraEnabled
    public String getBaseModelId() {
      return baseModelId;
    }

    /**
     * Gets the source.
     *
     * Translation source language code.
     *
     * @return the source
     */
    @AuraEnabled
    public String getSource() {
      return source;
    }

    /**
     * Gets the target.
     *
     * Translation target language code.
     *
     * @return the target
     */
    @AuraEnabled
    public String getTarget() {
      return target;
    }

    /**
     * Gets the created.
     *
     * The time when the document was submitted.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the completed.
     *
     * The time when the translation completed.
     *
     * @return the completed
     */
    @AuraEnabled
    public Datetime getCompleted() {
      return completed;
    }

    /**
     * Gets the wordCount.
     *
     * An estimate of the number of words in the source document. Returned only if `status` is `available`.
     *
     * @return the wordCount
     */
    @AuraEnabled
    public Long getWordCount() {
      return wordCount;
    }

    /**
     * Gets the characterCount.
     *
     * The number of characters in the source document, present only if status=available.
     *
     * @return the characterCount
     */
    @AuraEnabled
    public Long getCharacterCount() {
      return characterCount;
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
     * Sets the filename.
     *
     * @param filename the new filename
     */
    public void setFilename(final String filename) {
      this.filename = filename;
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
     * Sets the modelId.
     *
     * @param modelId the new modelId
     */
    public void setModelId(final String modelId) {
      this.modelId = modelId;
    }

    /**
     * Sets the baseModelId.
     *
     * @param baseModelId the new baseModelId
     */
    public void setBaseModelId(final String baseModelId) {
      this.baseModelId = baseModelId;
    }

    /**
     * Sets the source.
     *
     * @param source the new source
     */
    public void setSource(final String source) {
      this.source = source;
    }

    /**
     * Sets the target.
     *
     * @param target the new target
     */
    public void setTarget(final String target) {
      this.target = target;
    }

    /**
     * Sets the created.
     *
     * @param created the new created
     */
    public void setCreated(final Datetime created) {
      this.created = created;
    }

    /**
     * Sets the completed.
     *
     * @param completed the new completed
     */
    public void setCompleted(final Datetime completed) {
      this.completed = completed;
    }

    /**
     * Sets the wordCount.
     *
     * @param wordCount the new wordCount
     */
    public void setWordCount(final long wordCount) {
      this.wordCount = wordCount;
    }

    /**
     * Sets the characterCount.
     *
     * @param characterCount the new characterCount
     */
    public void setCharacterCount(final long characterCount) {
      this.characterCount = characterCount;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_id' => 'documentId',
        'model_id' => 'modelId',
        'base_model_id' => 'baseModelId',
        'word_count' => 'wordCount',
        'character_count' => 'characterCount'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DocumentStatus ret = (DocumentStatus) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The getDocumentStatus options.
   */
  public class GetDocumentStatusOptions extends IBMWatsonOptionsModel {
    private String documentId;

    /**
     * Gets the documentId.
     *
     * The document ID of the document.
     *
     * @return the documentId
     */
    public String documentId() {
      return documentId;
    }

    private GetDocumentStatusOptions(GetDocumentStatusOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
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
    private String documentId;

    private GetDocumentStatusOptionsBuilder(GetDocumentStatusOptions getDocumentStatusOptions) {
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
     * @param documentId the documentId
     */
    public GetDocumentStatusOptionsBuilder(String documentId) {
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
   * The getModel options.
   */
  public class GetModelOptions extends IBMWatsonOptionsModel {
    private String modelId;

    /**
     * Gets the modelId.
     *
     * Model ID of the model to get.
     *
     * @return the modelId
     */
    public String modelId() {
      return modelId;
    }

    private GetModelOptions(GetModelOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.modelId, 'modelId cannot be empty');
      modelId = builder.modelId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetModelOptions builder
     */
    public GetModelOptionsBuilder newBuilder() {
      return new GetModelOptionsBuilder(this);
    }
  }

  /**
   * GetModelOptions Builder.
   */
  public class GetModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String modelId;

    private GetModelOptionsBuilder(GetModelOptions getModelOptions) {
      modelId = getModelOptions.modelId;
      this.requestHeaders.putAll(getModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param modelId the modelId
     */
    public GetModelOptionsBuilder(String modelId) {
      this.modelId = modelId;
    }

    /**
     * Builds a GetModelOptions.
     *
     * @return the getModelOptions
     */
    public GetModelOptions build() {
      return new GetModelOptions(this);
    }

    /**
     * Set the modelId.
     *
     * @param modelId the modelId
     * @return the GetModelOptions builder
     */
    public GetModelOptionsBuilder modelId(String modelId) {
      this.modelId = modelId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetModelOptions builder
     */
    public GetModelOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getTranslatedDocument options.
   */
  public class GetTranslatedDocumentOptions extends IBMWatsonOptionsModel {
    private String documentId;
    private String accept;

    /**
     * Gets the documentId.
     *
     * The document ID of the document that was submitted for translation.
     *
     * @return the documentId
     */
    public String documentId() {
      return documentId;
    }

    /**
     * Gets the accept.
     *
     * The type of the response: application/powerpoint, application/mspowerpoint, application/x-rtf, application/json,
     * application/xml, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,
     * application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation,
     * application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document,
     * application/vnd.oasis.opendocument.spreadsheet, application/vnd.oasis.opendocument.presentation,
     * application/vnd.oasis.opendocument.text, application/pdf, application/rtf, text/html, text/json, text/plain,
     * text/richtext, text/rtf, or text/xml. A character encoding can be specified by including a `charset` parameter.
     * For example, 'text/html;charset=utf-8'.
     *
     * @return the accept
     */
    public String accept() {
      return accept;
    }

    private GetTranslatedDocumentOptions(GetTranslatedDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.documentId, 'documentId cannot be empty');
      documentId = builder.documentId;
      accept = builder.accept;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetTranslatedDocumentOptions builder
     */
    public GetTranslatedDocumentOptionsBuilder newBuilder() {
      return new GetTranslatedDocumentOptionsBuilder(this);
    }
  }

  /**
   * GetTranslatedDocumentOptions Builder.
   */
  public class GetTranslatedDocumentOptionsBuilder extends IBMWatsonOptionsModel {
    private String documentId;
    private String accept;

    private GetTranslatedDocumentOptionsBuilder(GetTranslatedDocumentOptions getTranslatedDocumentOptions) {
      documentId = getTranslatedDocumentOptions.documentId;
      accept = getTranslatedDocumentOptions.accept;
      this.requestHeaders.putAll(getTranslatedDocumentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetTranslatedDocumentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param documentId the documentId
     */
    public GetTranslatedDocumentOptionsBuilder(String documentId) {
      this.documentId = documentId;
    }

    /**
     * Builds a GetTranslatedDocumentOptions.
     *
     * @return the getTranslatedDocumentOptions
     */
    public GetTranslatedDocumentOptions build() {
      return new GetTranslatedDocumentOptions(this);
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the GetTranslatedDocumentOptions builder
     */
    public GetTranslatedDocumentOptionsBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Set the accept.
     *
     * @param accept the accept
     * @return the GetTranslatedDocumentOptions builder
     */
    public GetTranslatedDocumentOptionsBuilder accept(String accept) {
      this.accept = accept;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetTranslatedDocumentOptions builder
     */
    public GetTranslatedDocumentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * IdentifiableLanguage.
   */
  public class IdentifiableLanguage extends IBMWatsonGenericModel {
    private String language;
    private String name;

    /**
     * Gets the language.
     *
     * The language code for an identifiable language.
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the name.
     *
     * The name of the identifiable language.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
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

      IdentifiableLanguage ret = (IdentifiableLanguage) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * IdentifiableLanguages.
   */
  public class IdentifiableLanguages extends IBMWatsonResponseModel {
    private List<IdentifiableLanguage> languages;

    /**
     * Gets the languages.
     *
     * A list of all languages that the service can identify.
     *
     * @return the languages
     */
    @AuraEnabled
    public List<IdentifiableLanguage> getLanguages() {
      return languages;
    }

    /**
     * Sets the languages.
     *
     * @param languages the new languages
     */
    public void setLanguages(final List<IdentifiableLanguage> languages) {
      this.languages = languages;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      IdentifiableLanguages ret = (IdentifiableLanguages) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for languages
      List<IdentifiableLanguage> newLanguages = new List<IdentifiableLanguage>();
      List<IdentifiableLanguage> deserializedLanguages = ret.getLanguages();
      if (deserializedLanguages != null) {
        for (Integer i = 0; i < deserializedLanguages.size(); i++) {
          IdentifiableLanguage currentItem = ret.getLanguages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('languages');
          IdentifiableLanguage newItem = (IdentifiableLanguage) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), IdentifiableLanguage.class);
          newLanguages.add(newItem);
        }
        ret.languages = newLanguages;
      }

      return ret;
    }
  }

  /**
   * IdentifiedLanguage.
   */
  public class IdentifiedLanguage extends IBMWatsonGenericModel {
    private String language;
    private Double confidence;

    /**
     * Gets the language.
     *
     * The language code for an identified language.
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the confidence.
     *
     * The confidence score for the identified language.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
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

      IdentifiedLanguage ret = (IdentifiedLanguage) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * IdentifiedLanguages.
   */
  public class IdentifiedLanguages extends IBMWatsonResponseModel {
    private List<IdentifiedLanguage> languages;

    /**
     * Gets the languages.
     *
     * A ranking of identified languages with confidence scores.
     *
     * @return the languages
     */
    @AuraEnabled
    public List<IdentifiedLanguage> getLanguages() {
      return languages;
    }

    /**
     * Sets the languages.
     *
     * @param languages the new languages
     */
    public void setLanguages(final List<IdentifiedLanguage> languages) {
      this.languages = languages;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      IdentifiedLanguages ret = (IdentifiedLanguages) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for languages
      List<IdentifiedLanguage> newLanguages = new List<IdentifiedLanguage>();
      List<IdentifiedLanguage> deserializedLanguages = ret.getLanguages();
      if (deserializedLanguages != null) {
        for (Integer i = 0; i < deserializedLanguages.size(); i++) {
          IdentifiedLanguage currentItem = ret.getLanguages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('languages');
          IdentifiedLanguage newItem = (IdentifiedLanguage) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), IdentifiedLanguage.class);
          newLanguages.add(newItem);
        }
        ret.languages = newLanguages;
      }

      return ret;
    }
  }

  /**
   * The identify options.
   */
  public class IdentifyOptions extends IBMWatsonOptionsModel {
    private String text;

    /**
     * Gets the text.
     *
     * Input text in UTF-8 format.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    private IdentifyOptions(IdentifyOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      text = builder.text;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a IdentifyOptions builder
     */
    public IdentifyOptionsBuilder newBuilder() {
      return new IdentifyOptionsBuilder(this);
    }
  }

  /**
   * IdentifyOptions Builder.
   */
  public class IdentifyOptionsBuilder extends IBMWatsonOptionsModel {
    private String text;

    private IdentifyOptionsBuilder(IdentifyOptions identifyOptions) {
      text = identifyOptions.text;
      this.requestHeaders.putAll(identifyOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public IdentifyOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public IdentifyOptionsBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a IdentifyOptions.
     *
     * @return the identifyOptions
     */
    public IdentifyOptions build() {
      return new IdentifyOptions(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the IdentifyOptions builder
     */
    public IdentifyOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the IdentifyOptions builder
     */
    public IdentifyOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listDocuments options.
   */
  public class ListDocumentsOptions extends IBMWatsonOptionsModel {

    private ListDocumentsOptions(ListDocumentsOptionsBuilder builder) {
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListDocumentsOptions builder
     */
    public ListDocumentsOptionsBuilder newBuilder() {
      return new ListDocumentsOptionsBuilder(this);
    }
  }

  /**
   * ListDocumentsOptions Builder.
   */
  public class ListDocumentsOptionsBuilder extends IBMWatsonOptionsModel {

    private ListDocumentsOptionsBuilder(ListDocumentsOptions listDocumentsOptions) {
      this.requestHeaders.putAll(listDocumentsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListDocumentsOptionsBuilder() {
    }

    /**
     * Builds a ListDocumentsOptions.
     *
     * @return the listDocumentsOptions
     */
    public ListDocumentsOptions build() {
      return new ListDocumentsOptions(this);
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListDocumentsOptions builder
     */
    public ListDocumentsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listIdentifiableLanguages options.
   */
  public class ListIdentifiableLanguagesOptions extends IBMWatsonOptionsModel {

    private ListIdentifiableLanguagesOptions(ListIdentifiableLanguagesOptionsBuilder builder) {
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListIdentifiableLanguagesOptions builder
     */
    public ListIdentifiableLanguagesOptionsBuilder newBuilder() {
      return new ListIdentifiableLanguagesOptionsBuilder(this);
    }
  }

  /**
   * ListIdentifiableLanguagesOptions Builder.
   */
  public class ListIdentifiableLanguagesOptionsBuilder extends IBMWatsonOptionsModel {

    private ListIdentifiableLanguagesOptionsBuilder(ListIdentifiableLanguagesOptions listIdentifiableLanguagesOptions) {
      this.requestHeaders.putAll(listIdentifiableLanguagesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListIdentifiableLanguagesOptionsBuilder() {
    }

    /**
     * Builds a ListIdentifiableLanguagesOptions.
     *
     * @return the listIdentifiableLanguagesOptions
     */
    public ListIdentifiableLanguagesOptions build() {
      return new ListIdentifiableLanguagesOptions(this);
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListIdentifiableLanguagesOptions builder
     */
    public ListIdentifiableLanguagesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listModels options.
   */
  public class ListModelsOptions extends IBMWatsonOptionsModel {
    private String source;
    private String target;
    private Boolean xDefault;

    /**
     * Gets the source.
     *
     * Specify a language code to filter results by source language.
     *
     * @return the source
     */
    public String source() {
      return source;
    }

    /**
     * Gets the target.
     *
     * Specify a language code to filter results by target language.
     *
     * @return the target
     */
    public String target() {
      return target;
    }

    /**
     * Gets the xDefault.
     *
     * If the default parameter isn't specified, the service will return all models (default and non-default) for each
     * language pair. To return only default models, set this to `true`. To return only non-default models, set this to
     * `false`. There is exactly one default model per language pair, the IBM provided base model.
     *
     * @return the xDefault
     */
    public Boolean xDefault() {
      return xDefault;
    }

    private ListModelsOptions(ListModelsOptionsBuilder builder) {
      source = builder.source;
      target = builder.target;
      xDefault = builder.xDefault;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListModelsOptions builder
     */
    public ListModelsOptionsBuilder newBuilder() {
      return new ListModelsOptionsBuilder(this);
    }
  }

  /**
   * ListModelsOptions Builder.
   */
  public class ListModelsOptionsBuilder extends IBMWatsonOptionsModel {
    private String source;
    private String target;
    private Boolean xDefault;

    private ListModelsOptionsBuilder(ListModelsOptions listModelsOptions) {
      source = listModelsOptions.source;
      target = listModelsOptions.target;
      xDefault = listModelsOptions.xDefault;
      this.requestHeaders.putAll(listModelsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListModelsOptionsBuilder() {
    }

    /**
     * Builds a ListModelsOptions.
     *
     * @return the listModelsOptions
     */
    public ListModelsOptions build() {
      return new ListModelsOptions(this);
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the ListModelsOptions builder
     */
    public ListModelsOptionsBuilder source(String source) {
      this.source = source;
      return this;
    }

    /**
     * Set the target.
     *
     * @param target the target
     * @return the ListModelsOptions builder
     */
    public ListModelsOptionsBuilder target(String target) {
      this.target = target;
      return this;
    }

    /**
     * Set the xDefault.
     *
     * @param xDefault the xDefault
     * @return the ListModelsOptions builder
     */
    public ListModelsOptionsBuilder xDefault(Boolean xDefault) {
      this.xDefault = xDefault;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListModelsOptions builder
     */
    public ListModelsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The translateDocument options.
   */
  public class TranslateDocumentOptions extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String modelId;
    private String source;
    private String target;
    private String documentId;

    /**
     * Gets the file.
     *
     * The contents of the source file to translate.
     *
     * [Supported file
     * types](https://cloud.ibm.com/docs/language-translator?topic=language-translator-document-translator-tutorial#supported-file-formats)
     *
     * Maximum file size: **20 MB**.
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
     * Gets the modelId.
     *
     * The model to use for translation. `model_id` or both `source` and `target` are required.
     *
     * @return the modelId
     */
    public String modelId() {
      return modelId;
    }

    /**
     * Gets the source.
     *
     * Language code that specifies the language of the source document.
     *
     * @return the source
     */
    public String source() {
      return source;
    }

    /**
     * Gets the target.
     *
     * Language code that specifies the target language for translation.
     *
     * @return the target
     */
    public String target() {
      return target;
    }

    /**
     * Gets the documentId.
     *
     * To use a previously submitted document as the source for a new translation, enter the `document_id` of the
     * document.
     *
     * @return the documentId
     */
    public String documentId() {
      return documentId;
    }

    private TranslateDocumentOptions(TranslateDocumentOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.file, 'file cannot be null');
      IBMWatsonValidator.notNull(builder.filename, 'filename cannot be null');
      file = builder.file;
      filename = builder.filename;
      fileContentType = builder.fileContentType;
      modelId = builder.modelId;
      source = builder.source;
      target = builder.target;
      documentId = builder.documentId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder newBuilder() {
      return new TranslateDocumentOptionsBuilder(this);
    }
  }

  /**
   * TranslateDocumentOptions Builder.
   */
  public class TranslateDocumentOptionsBuilder extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String filename;
    private String fileContentType;
    private String modelId;
    private String source;
    private String target;
    private String documentId;

    private TranslateDocumentOptionsBuilder(TranslateDocumentOptions translateDocumentOptions) {
      file = translateDocumentOptions.file;
      filename = translateDocumentOptions.filename;
      fileContentType = translateDocumentOptions.fileContentType;
      modelId = translateDocumentOptions.modelId;
      source = translateDocumentOptions.source;
      target = translateDocumentOptions.target;
      documentId = translateDocumentOptions.documentId;
      this.requestHeaders.putAll(translateDocumentOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public TranslateDocumentOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param file the file
     * @param filename the filename
     */
    public TranslateDocumentOptionsBuilder(IBMWatsonFile file, String filename) {
      this.file = file;
      this.filename = filename;
    }

    /**
     * Builds a TranslateDocumentOptions.
     *
     * @return the translateDocumentOptions
     */
    public TranslateDocumentOptions build() {
      return new TranslateDocumentOptions(this);
    }

    /**
     * Set the file.
     *
     * @param file the file
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder file(IBMWatsonFile file) {
      this.file = file;
      return this;
    }

    /**
     * Set the filename.
     *
     * @param filename the filename
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder filename(String filename) {
      this.filename = filename;
      return this;
    }

    /**
     * Set the fileContentType.
     *
     * @param fileContentType the fileContentType
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder fileContentType(String fileContentType) {
      this.fileContentType = fileContentType;
      return this;
    }

    /**
     * Set the modelId.
     *
     * @param modelId the modelId
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder modelId(String modelId) {
      this.modelId = modelId;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder source(String source) {
      this.source = source;
      return this;
    }

    /**
     * Set the target.
     *
     * @param target the target
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder target(String target) {
      this.target = target;
      return this;
    }

    /**
     * Set the documentId.
     *
     * @param documentId the documentId
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder documentId(String documentId) {
      this.documentId = documentId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the TranslateDocumentOptions builder
     */
    public TranslateDocumentOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The translate options.
   */
  public class TranslateOptions extends IBMWatsonOptionsModel {
    private List<String> text;
    private String modelId;
    private String source;
    private String target;

    /**
     * Gets the text.
     *
     * Input text in UTF-8 encoding. Multiple entries will result in multiple translations in the response.
     *
     * @return the text
     */
    public List<String> text() {
      return text;
    }

    /**
     * Gets the modelId.
     *
     * A globally unique string that identifies the underlying model that is used for translation.
     *
     * @return the modelId
     */
    public String modelId() {
      return modelId;
    }

    /**
     * Gets the source.
     *
     * Translation source language code.
     *
     * @return the source
     */
    public String source() {
      return source;
    }

    /**
     * Gets the target.
     *
     * Translation target language code.
     *
     * @return the target
     */
    public String target() {
      return target;
    }

    private TranslateOptions(TranslateOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      text = builder.text;
      modelId = builder.modelId;
      source = builder.source;
      target = builder.target;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a TranslateOptions builder
     */
    public TranslateOptionsBuilder newBuilder() {
      return new TranslateOptionsBuilder(this);
    }
  }

  /**
   * TranslateOptions Builder.
   */
  public class TranslateOptionsBuilder extends IBMWatsonOptionsModel {
    private List<String> text;
    private String modelId;
    private String source;
    private String target;

    private TranslateOptionsBuilder(TranslateOptions translateOptions) {
      text = translateOptions.text;
      modelId = translateOptions.modelId;
      source = translateOptions.source;
      target = translateOptions.target;
      this.requestHeaders.putAll(translateOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public TranslateOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public TranslateOptionsBuilder(List<String> text) {
      this.text = text;
    }

    /**
     * Builds a TranslateOptions.
     *
     * @return the translateOptions
     */
    public TranslateOptions build() {
      return new TranslateOptions(this);
    }

    /**
     * Adds an text to text.
     *
     * @param text the new text
     * @return the TranslateOptions builder
     */
    public TranslateOptionsBuilder addText(String text) {
      IBMWatsonValidator.notNull(text, 'text cannot be null');
      if (this.text == null) {
        this.text = new List<String>();
      }
      this.text.add(text);
      return this;
    }

    /**
     * Set the text.
     * Existing text will be replaced.
     *
     * @param text the text
     * @return the TranslateOptions builder
     */
    public TranslateOptionsBuilder text(List<String> text) {
      this.text = text;
      return this;
    }

    /**
     * Set the modelId.
     *
     * @param modelId the modelId
     * @return the TranslateOptions builder
     */
    public TranslateOptionsBuilder modelId(String modelId) {
      this.modelId = modelId;
      return this;
    }

    /**
     * Set the source.
     *
     * @param source the source
     * @return the TranslateOptions builder
     */
    public TranslateOptionsBuilder source(String source) {
      this.source = source;
      return this;
    }

    /**
     * Set the target.
     *
     * @param target the target
     * @return the TranslateOptions builder
     */
    public TranslateOptionsBuilder target(String target) {
      this.target = target;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the TranslateOptions builder
     */
    public TranslateOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Translation.
   */
  public class Translation extends IBMWatsonGenericModel {
    private String translation;

    /**
     * Gets the translation.
     *
     * Translation output in UTF-8.
     *
     * @return the translation
     */
    @AuraEnabled
    public String getTranslation() {
      return translation;
    }

    /**
     * Sets the translation.
     *
     * @param translation the new translation
     */
    public void setTranslation(final String translation) {
      this.translation = translation;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Translation ret = (Translation) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Response payload for models.
   */
  public class TranslationModel extends IBMWatsonResponseModel {
    private String modelId;
    private String name;
    private String source;
    private String target;
    private String baseModelId;
    private String domain;
    private Boolean customizable;
    private Boolean defaultModel;
    private String owner;
    private String status;

    /**
     * Gets the modelId.
     *
     * A globally unique string that identifies the underlying model that is used for translation.
     *
     * @return the modelId
     */
    @AuraEnabled
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the name.
     *
     * Optional name that can be specified when the model is created.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the source.
     *
     * Translation source language code.
     *
     * @return the source
     */
    @AuraEnabled
    public String getSource() {
      return source;
    }

    /**
     * Gets the target.
     *
     * Translation target language code.
     *
     * @return the target
     */
    @AuraEnabled
    public String getTarget() {
      return target;
    }

    /**
     * Gets the baseModelId.
     *
     * Model ID of the base model that was used to customize the model. If the model is not a custom model, this will be
     * an empty string.
     *
     * @return the baseModelId
     */
    @AuraEnabled
    public String getBaseModelId() {
      return baseModelId;
    }

    /**
     * Gets the domain.
     *
     * The domain of the translation model.
     *
     * @return the domain
     */
    @AuraEnabled
    public String getDomain() {
      return domain;
    }

    /**
     * Gets the customizable.
     *
     * Whether this model can be used as a base for customization. Customized models are not further customizable, and
     * some base models are not customizable.
     *
     * @return the customizable
     */
    @AuraEnabled
    public Boolean getCustomizable() {
      return customizable;
    }

    /**
     * Gets the defaultModel.
     *
     * Whether or not the model is a default model. A default model is the model for a given language pair that will be
     * used when that language pair is specified in the source and target parameters.
     *
     * @return the defaultModel
     */
    @AuraEnabled
    public Boolean getDefaultModel() {
      return defaultModel;
    }

    /**
     * Gets the owner.
     *
     * Either an empty string, indicating the model is not a custom model, or the ID of the service instance that
     * created the model.
     *
     * @return the owner
     */
    @AuraEnabled
    public String getOwner() {
      return owner;
    }

    /**
     * Gets the status.
     *
     * Availability of a model.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Sets the modelId.
     *
     * @param modelId the new modelId
     */
    public void setModelId(final String modelId) {
      this.modelId = modelId;
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
     * Sets the source.
     *
     * @param source the new source
     */
    public void setSource(final String source) {
      this.source = source;
    }

    /**
     * Sets the target.
     *
     * @param target the new target
     */
    public void setTarget(final String target) {
      this.target = target;
    }

    /**
     * Sets the baseModelId.
     *
     * @param baseModelId the new baseModelId
     */
    public void setBaseModelId(final String baseModelId) {
      this.baseModelId = baseModelId;
    }

    /**
     * Sets the domain.
     *
     * @param domain the new domain
     */
    public void setDomain(final String domain) {
      this.domain = domain;
    }

    /**
     * Sets the customizable.
     *
     * @param customizable the new customizable
     */
    public void setCustomizable(final Boolean customizable) {
      this.customizable = customizable;
    }

    /**
     * Sets the defaultModel.
     *
     * @param defaultModel the new defaultModel
     */
    public void setDefaultModel(final Boolean defaultModel) {
      this.defaultModel = defaultModel;
    }

    /**
     * Sets the owner.
     *
     * @param owner the new owner
     */
    public void setOwner(final String owner) {
      this.owner = owner;
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
        'model_id' => 'modelId',
        'base_model_id' => 'baseModelId',
        'default_model' => 'defaultModel'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TranslationModel ret = (TranslationModel) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The response type for listing existing translation models.
   */
  public class TranslationModels extends IBMWatsonResponseModel {
    private List<TranslationModel> models;

    /**
     * Gets the models.
     *
     * An array of available models.
     *
     * @return the models
     */
    @AuraEnabled
    public List<TranslationModel> getModels() {
      return models;
    }

    /**
     * Sets the models.
     *
     * @param models the new models
     */
    public void setModels(final List<TranslationModel> models) {
      this.models = models;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TranslationModels ret = (TranslationModels) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for models
      List<TranslationModel> newModels = new List<TranslationModel>();
      List<TranslationModel> deserializedModels = ret.getModels();
      if (deserializedModels != null) {
        for (Integer i = 0; i < deserializedModels.size(); i++) {
          TranslationModel currentItem = ret.getModels().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('models');
          TranslationModel newItem = (TranslationModel) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TranslationModel.class);
          newModels.add(newItem);
        }
        ret.models = newModels;
      }

      return ret;
    }
  }

  /**
   * TranslationResult.
   */
  public class TranslationResult extends IBMWatsonResponseModel {
    private Long wordCount;
    private Long characterCount;
    private List<Translation> translations;

    /**
     * Gets the wordCount.
     *
     * An estimate of the number of words in the input text.
     *
     * @return the wordCount
     */
    @AuraEnabled
    public Long getWordCount() {
      return wordCount;
    }

    /**
     * Gets the characterCount.
     *
     * Number of characters in the input text.
     *
     * @return the characterCount
     */
    @AuraEnabled
    public Long getCharacterCount() {
      return characterCount;
    }

    /**
     * Gets the translations.
     *
     * List of translation output in UTF-8, corresponding to the input text entries.
     *
     * @return the translations
     */
    @AuraEnabled
    public List<Translation> getTranslations() {
      return translations;
    }

    /**
     * Sets the wordCount.
     *
     * @param wordCount the new wordCount
     */
    public void setWordCount(final long wordCount) {
      this.wordCount = wordCount;
    }

    /**
     * Sets the characterCount.
     *
     * @param characterCount the new characterCount
     */
    public void setCharacterCount(final long characterCount) {
      this.characterCount = characterCount;
    }

    /**
     * Sets the translations.
     *
     * @param translations the new translations
     */
    public void setTranslations(final List<Translation> translations) {
      this.translations = translations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'word_count' => 'wordCount',
        'character_count' => 'characterCount'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TranslationResult ret = (TranslationResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for translations
      List<Translation> newTranslations = new List<Translation>();
      List<Translation> deserializedTranslations = ret.getTranslations();
      if (deserializedTranslations != null) {
        for (Integer i = 0; i < deserializedTranslations.size(); i++) {
          Translation currentItem = ret.getTranslations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('translations');
          Translation newItem = (Translation) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Translation.class);
          newTranslations.add(newItem);
        }
        ret.translations = newTranslations;
      }

      return ret;
    }
  }

}