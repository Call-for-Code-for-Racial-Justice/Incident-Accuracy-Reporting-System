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

public class IBMToneAnalyzerV3Models {
  /**
   * The results of the analysis for the full input content.
   */
  public class DocumentAnalysis extends IBMWatsonGenericModel {
    private List<ToneScore> tones;
    private List<ToneCategory> toneCategories;
    private String warning;

    /**
     * Gets the tones.
     *
     * **`2017-09-21`:** An array of `ToneScore` objects that provides the results of the analysis for each qualifying
     * tone of the document. The array includes results for any tone whose score is at least 0.5. The array is empty if
     * no tone has a score that meets this threshold. **`2016-05-19`:** Not returned.
     *
     * @return the tones
     */
    @AuraEnabled
    public List<ToneScore> getTones() {
      return tones;
    }

    /**
     * Gets the toneCategories.
     *
     * **`2017-09-21`:** Not returned. **`2016-05-19`:** An array of `ToneCategory` objects that provides the results of
     * the tone analysis for the full document of the input content. The service returns results only for the tones
     * specified with the `tones` parameter of the request.
     *
     * @return the toneCategories
     */
    @AuraEnabled
    public List<ToneCategory> getToneCategories() {
      return toneCategories;
    }

    /**
     * Gets the warning.
     *
     * **`2017-09-21`:** A warning message if the overall content exceeds 128 KB or contains more than 1000 sentences.
     * The service analyzes only the first 1000 sentences for document-level analysis and the first 100 sentences for
     * sentence-level analysis. **`2016-05-19`:** Not returned.
     *
     * @return the warning
     */
    @AuraEnabled
    public String getWarning() {
      return warning;
    }

    /**
     * Sets the tones.
     *
     * @param tones the new tones
     */
    public void setTones(final List<ToneScore> tones) {
      this.tones = tones;
    }

    /**
     * Sets the toneCategories.
     *
     * @param toneCategories the new toneCategories
     */
    public void setToneCategories(final List<ToneCategory> toneCategories) {
      this.toneCategories = toneCategories;
    }

    /**
     * Sets the warning.
     *
     * @param warning the new warning
     */
    public void setWarning(final String warning) {
      this.warning = warning;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'tone_categories' => 'toneCategories'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DocumentAnalysis ret = (DocumentAnalysis) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for tones
      List<ToneScore> newTones = new List<ToneScore>();
      List<ToneScore> deserializedTones = ret.getTones();
      if (deserializedTones != null) {
        for (Integer i = 0; i < deserializedTones.size(); i++) {
          ToneScore currentItem = ret.getTones().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tones');
          ToneScore newItem = (ToneScore) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ToneScore.class);
          newTones.add(newItem);
        }
        ret.tones = newTones;
      }

      // calling custom deserializer for toneCategories
      List<ToneCategory> newToneCategories = new List<ToneCategory>();
      List<ToneCategory> deserializedToneCategories = ret.getToneCategories();
      if (deserializedToneCategories != null) {
        for (Integer i = 0; i < deserializedToneCategories.size(); i++) {
          ToneCategory currentItem = ret.getToneCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('toneCategories');
          ToneCategory newItem = (ToneCategory) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ToneCategory.class);
          newToneCategories.add(newItem);
        }
        ret.toneCategories = newToneCategories;
      }

      return ret;
    }
  }

  /**
   * The results of the analysis for the individual sentences of the input content.
   */
  public class SentenceAnalysis extends IBMWatsonGenericModel {
    private Long sentenceId;
    private String text;
    private List<ToneScore> tones;
    private List<ToneCategory> toneCategories;
    private Long inputFrom;
    private Long inputTo;

    /**
     * Gets the sentenceId.
     *
     * The unique identifier of a sentence of the input content. The first sentence has ID 0, and the ID of each
     * subsequent sentence is incremented by one.
     *
     * @return the sentenceId
     */
    @AuraEnabled
    public Long getSentenceId() {
      return sentenceId;
    }

    /**
     * Gets the text.
     *
     * The text of the input sentence.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the tones.
     *
     * **`2017-09-21`:** An array of `ToneScore` objects that provides the results of the analysis for each qualifying
     * tone of the sentence. The array includes results for any tone whose score is at least 0.5. The array is empty if
     * no tone has a score that meets this threshold. **`2016-05-19`:** Not returned.
     *
     * @return the tones
     */
    @AuraEnabled
    public List<ToneScore> getTones() {
      return tones;
    }

    /**
     * Gets the toneCategories.
     *
     * **`2017-09-21`:** Not returned. **`2016-05-19`:** An array of `ToneCategory` objects that provides the results of
     * the tone analysis for the sentence. The service returns results only for the tones specified with the `tones`
     * parameter of the request.
     *
     * @return the toneCategories
     */
    @AuraEnabled
    public List<ToneCategory> getToneCategories() {
      return toneCategories;
    }

    /**
     * Gets the inputFrom.
     *
     * **`2017-09-21`:** Not returned. **`2016-05-19`:** The offset of the first character of the sentence in the
     * overall input content.
     *
     * @return the inputFrom
     */
    @AuraEnabled
    public Long getInputFrom() {
      return inputFrom;
    }

    /**
     * Gets the inputTo.
     *
     * **`2017-09-21`:** Not returned. **`2016-05-19`:** The offset of the last character of the sentence in the overall
     * input content.
     *
     * @return the inputTo
     */
    @AuraEnabled
    public Long getInputTo() {
      return inputTo;
    }

    /**
     * Sets the sentenceId.
     *
     * @param sentenceId the new sentenceId
     */
    public void setSentenceId(final long sentenceId) {
      this.sentenceId = sentenceId;
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
     * Sets the tones.
     *
     * @param tones the new tones
     */
    public void setTones(final List<ToneScore> tones) {
      this.tones = tones;
    }

    /**
     * Sets the toneCategories.
     *
     * @param toneCategories the new toneCategories
     */
    public void setToneCategories(final List<ToneCategory> toneCategories) {
      this.toneCategories = toneCategories;
    }

    /**
     * Sets the inputFrom.
     *
     * @param inputFrom the new inputFrom
     */
    public void setInputFrom(final long inputFrom) {
      this.inputFrom = inputFrom;
    }

    /**
     * Sets the inputTo.
     *
     * @param inputTo the new inputTo
     */
    public void setInputTo(final long inputTo) {
      this.inputTo = inputTo;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'sentence_id' => 'sentenceId',
        'tone_categories' => 'toneCategories',
        'input_from' => 'inputFrom',
        'input_to' => 'inputTo'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SentenceAnalysis ret = (SentenceAnalysis) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for tones
      List<ToneScore> newTones = new List<ToneScore>();
      List<ToneScore> deserializedTones = ret.getTones();
      if (deserializedTones != null) {
        for (Integer i = 0; i < deserializedTones.size(); i++) {
          ToneScore currentItem = ret.getTones().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tones');
          ToneScore newItem = (ToneScore) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ToneScore.class);
          newTones.add(newItem);
        }
        ret.tones = newTones;
      }

      // calling custom deserializer for toneCategories
      List<ToneCategory> newToneCategories = new List<ToneCategory>();
      List<ToneCategory> deserializedToneCategories = ret.getToneCategories();
      if (deserializedToneCategories != null) {
        for (Integer i = 0; i < deserializedToneCategories.size(); i++) {
          ToneCategory currentItem = ret.getToneCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('toneCategories');
          ToneCategory newItem = (ToneCategory) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ToneCategory.class);
          newToneCategories.add(newItem);
        }
        ret.toneCategories = newToneCategories;
      }

      return ret;
    }
  }

  /**
   * The tone analysis results for the input from the general-purpose endpoint.
   */
  public class ToneAnalysis extends IBMWatsonResponseModel {
    private DocumentAnalysis documentTone;
    private List<SentenceAnalysis> sentencesTone;

    /**
     * Gets the documentTone.
     *
     * The results of the analysis for the full input content.
     *
     * @return the documentTone
     */
    @AuraEnabled
    public DocumentAnalysis getDocumentTone() {
      return documentTone;
    }

    /**
     * Gets the sentencesTone.
     *
     * An array of `SentenceAnalysis` objects that provides the results of the analysis for the individual sentences of
     * the input content. The service returns results only for the first 100 sentences of the input. The field is
     * omitted if the `sentences` parameter of the request is set to `false`.
     *
     * @return the sentencesTone
     */
    @AuraEnabled
    public List<SentenceAnalysis> getSentencesTone() {
      return sentencesTone;
    }

    /**
     * Sets the documentTone.
     *
     * @param documentTone the new documentTone
     */
    public void setDocumentTone(final DocumentAnalysis documentTone) {
      this.documentTone = documentTone;
    }

    /**
     * Sets the sentencesTone.
     *
     * @param sentencesTone the new sentencesTone
     */
    public void setSentencesTone(final List<SentenceAnalysis> sentencesTone) {
      this.sentencesTone = sentencesTone;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_tone' => 'documentTone',
        'sentences_tone' => 'sentencesTone'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ToneAnalysis ret = (ToneAnalysis) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for documentTone
      Map<String, Object> documentToneMap = (Map<String, Object>) jsonMap.get('documentTone');
      DocumentAnalysis newDocumentTone = (DocumentAnalysis) new DocumentAnalysis().deserialize(JSON.serialize(documentToneMap, true), documentToneMap, DocumentAnalysis.class);
      ret.setDocumentTone(newDocumentTone);

      // calling custom deserializer for sentencesTone
      List<SentenceAnalysis> newSentencesTone = new List<SentenceAnalysis>();
      List<SentenceAnalysis> deserializedSentencesTone = ret.getSentencesTone();
      if (deserializedSentencesTone != null) {
        for (Integer i = 0; i < deserializedSentencesTone.size(); i++) {
          SentenceAnalysis currentItem = ret.getSentencesTone().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('sentencesTone');
          SentenceAnalysis newItem = (SentenceAnalysis) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SentenceAnalysis.class);
          newSentencesTone.add(newItem);
        }
        ret.sentencesTone = newSentencesTone;
      }

      return ret;
    }
  }

  /**
   * The category for a tone from the input content.
   */
  public class ToneCategory extends IBMWatsonGenericModel {
    private List<ToneScore> tones;
    private String categoryId;
    private String categoryName;

    /**
     * Gets the tones.
     *
     * An array of `ToneScore` objects that provides the results for the tones of the category.
     *
     * @return the tones
     */
    @AuraEnabled
    public List<ToneScore> getTones() {
      return tones;
    }

    /**
     * Gets the categoryId.
     *
     * The unique, non-localized identifier of the category for the results. The service can return results for the
     * following category IDs: `emotion_tone`, `language_tone`, and `social_tone`.
     *
     * @return the categoryId
     */
    @AuraEnabled
    public String getCategoryId() {
      return categoryId;
    }

    /**
     * Gets the categoryName.
     *
     * The user-visible, localized name of the category.
     *
     * @return the categoryName
     */
    @AuraEnabled
    public String getCategoryName() {
      return categoryName;
    }

    /**
     * Sets the tones.
     *
     * @param tones the new tones
     */
    public void setTones(final List<ToneScore> tones) {
      this.tones = tones;
    }

    /**
     * Sets the categoryId.
     *
     * @param categoryId the new categoryId
     */
    public void setCategoryId(final String categoryId) {
      this.categoryId = categoryId;
    }

    /**
     * Sets the categoryName.
     *
     * @param categoryName the new categoryName
     */
    public void setCategoryName(final String categoryName) {
      this.categoryName = categoryName;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'category_id' => 'categoryId',
        'category_name' => 'categoryName'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ToneCategory ret = (ToneCategory) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for tones
      List<ToneScore> newTones = new List<ToneScore>();
      List<ToneScore> deserializedTones = ret.getTones();
      if (deserializedTones != null) {
        for (Integer i = 0; i < deserializedTones.size(); i++) {
          ToneScore currentItem = ret.getTones().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tones');
          ToneScore newItem = (ToneScore) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ToneScore.class);
          newTones.add(newItem);
        }
        ret.tones = newTones;
      }

      return ret;
    }
  }

  /**
   * The toneChat options.
   */
  public class ToneChatOptions extends IBMWatsonOptionsModel {
    private List<Utterance> utterances;
    private String contentLanguage;
    private String acceptLanguage;

    /**
     * Gets the utterances.
     *
     * An array of `Utterance` objects that provides the input content that the service is to analyze.
     *
     * @return the utterances
     */
    public List<Utterance> utterances() {
      return utterances;
    }

    /**
     * Gets the contentLanguage.
     *
     * The language of the input text for the request: English or French. Regional variants are treated as their parent
     * language; for example, `en-US` is interpreted as `en`. The input content must match the specified language. Do
     * not submit content that contains both languages. You can use different languages for **Content-Language** and
     * **Accept-Language**.
     * * **`2017-09-21`:** Accepts `en` or `fr`.
     * * **`2016-05-19`:** Accepts only `en`.
     *
     * @return the contentLanguage
     */
    public String contentLanguage() {
      return contentLanguage;
    }

    /**
     * Gets the acceptLanguage.
     *
     * The desired language of the response. For two-character arguments, regional variants are treated as their parent
     * language; for example, `en-US` is interpreted as `en`. You can use different languages for **Content-Language**
     * and **Accept-Language**.
     *
     * @return the acceptLanguage
     */
    public String acceptLanguage() {
      return acceptLanguage;
    }

    private ToneChatOptions(ToneChatOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.utterances, 'utterances cannot be null');
      utterances = builder.utterances;
      contentLanguage = builder.contentLanguage;
      acceptLanguage = builder.acceptLanguage;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ToneChatOptions builder
     */
    public ToneChatOptionsBuilder newBuilder() {
      return new ToneChatOptionsBuilder(this);
    }
  }

  /**
   * ToneChatOptions Builder.
   */
  public class ToneChatOptionsBuilder extends IBMWatsonOptionsModel {
    private List<Utterance> utterances;
    private String contentLanguage;
    private String acceptLanguage;

    private ToneChatOptionsBuilder(ToneChatOptions toneChatOptions) {
      utterances = toneChatOptions.utterances;
      contentLanguage = toneChatOptions.contentLanguage;
      acceptLanguage = toneChatOptions.acceptLanguage;
      this.requestHeaders.putAll(toneChatOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ToneChatOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param utterances the utterances
     */
    public ToneChatOptionsBuilder(List<Utterance> utterances) {
      this.utterances = utterances;
    }

    /**
     * Builds a ToneChatOptions.
     *
     * @return the toneChatOptions
     */
    public ToneChatOptions build() {
      return new ToneChatOptions(this);
    }

    /**
     * Adds an utterances to utterances.
     *
     * @param utterances the new utterances
     * @return the ToneChatOptions builder
     */
    public ToneChatOptionsBuilder addUtterances(Utterance utterances) {
      IBMWatsonValidator.notNull(utterances, 'utterances cannot be null');
      if (this.utterances == null) {
        this.utterances = new List<Utterance>();
      }
      this.utterances.add(utterances);
      return this;
    }

    /**
     * Set the utterances.
     * Existing utterances will be replaced.
     *
     * @param utterances the utterances
     * @return the ToneChatOptions builder
     */
    public ToneChatOptionsBuilder utterances(List<Utterance> utterances) {
      this.utterances = utterances;
      return this;
    }

    /**
     * Set the contentLanguage.
     *
     * @param contentLanguage the contentLanguage
     * @return the ToneChatOptions builder
     */
    public ToneChatOptionsBuilder contentLanguage(String contentLanguage) {
      this.contentLanguage = contentLanguage;
      return this;
    }

    /**
     * Set the acceptLanguage.
     *
     * @param acceptLanguage the acceptLanguage
     * @return the ToneChatOptions builder
     */
    public ToneChatOptionsBuilder acceptLanguage(String acceptLanguage) {
      this.acceptLanguage = acceptLanguage;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ToneChatOptions builder
     */
    public ToneChatOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The score for an utterance from the input content.
   */
  public class ToneChatScore extends IBMWatsonGenericModel {
    private Double score;
    private String toneId;
    private String toneName;

    /**
     * Gets the score.
     *
     * The score for the tone in the range of 0.5 to 1. A score greater than 0.75 indicates a high likelihood that the
     * tone is perceived in the utterance.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Gets the toneId.
     *
     * The unique, non-localized identifier of the tone for the results. The service returns results only for tones
     * whose scores meet a minimum threshold of 0.5.
     *
     * @return the toneId
     */
    @AuraEnabled
    public String getToneId() {
      return toneId;
    }

    /**
     * Gets the toneName.
     *
     * The user-visible, localized name of the tone.
     *
     * @return the toneName
     */
    @AuraEnabled
    public String getToneName() {
      return toneName;
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
     * Sets the toneId.
     *
     * @param toneId the new toneId
     */
    public void setToneId(final String toneId) {
      this.toneId = toneId;
    }

    /**
     * Sets the toneName.
     *
     * @param toneName the new toneName
     */
    public void setToneName(final String toneName) {
      this.toneName = toneName;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'tone_id' => 'toneId',
        'tone_name' => 'toneName'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ToneChatScore ret = (ToneChatScore) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Input for the general-purpose endpoint.
   */
  public class ToneInput extends IBMWatsonGenericModel {
    private String text;

    /**
     * Gets the text.
     *
     * The input content that the service is to analyze.
     *
     * @return the text
     */
    public String text() {
      return text;
    }
  
    private ToneInput(ToneInputBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      this.text = builder.text;
    }

    /**
     * New builder.
     *
     * @return a ToneInput builder
     */
    public ToneInputBuilder newBuilder() {
      return new ToneInputBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * ToneInput Builder.
   */
  public class ToneInputBuilder {
    private String text;

    private ToneInputBuilder(ToneInput toneInput) {
      this.text = toneInput.text;
    }

    /**
     * Instantiates a new builder.
     */
    public ToneInputBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public ToneInputBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a ToneInput.
     *
     * @return the toneInput
     */
    public ToneInput build() {
      return new ToneInput(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the ToneInput builder
     */
    public ToneInputBuilder text(String text) {
      this.text = text;
      return this;
    }
  }

  /**
   * The tone options.
   */
  public class ToneOptions extends IBMWatsonOptionsModel {
    private ToneInput toneInput;
    private String body;
    private String contentType;
    private Boolean sentences;
    private List<String> tones;
    private String contentLanguage;
    private String acceptLanguage;

    /**
     * Gets the toneInput.
     *
     * JSON, plain text, or HTML input that contains the content to be analyzed. For JSON input, provide an object of
     * type `ToneInput`.
     *
     * @return the toneInput
     */
    public ToneInput toneInput() {
      return toneInput;
    }

    /**
     * Gets the body.
     *
     * JSON, plain text, or HTML input that contains the content to be analyzed. For JSON input, provide an object of
     * type `ToneInput`.
     *
     * @return the body
     */
    public String body() {
      return body;
    }

    /**
     * Gets the contentType.
     *
     * The type of the input. A character encoding can be specified by including a `charset` parameter. For example,
     * 'text/plain;charset=utf-8'.
     *
     * @return the contentType
     */
    public String contentType() {
      return contentType;
    }

    /**
     * Gets the sentences.
     *
     * Indicates whether the service is to return an analysis of each individual sentence in addition to its analysis of
     * the full document. If `true` (the default), the service returns results for each sentence.
     *
     * @return the sentences
     */
    public Boolean sentences() {
      return sentences;
    }

    /**
     * Gets the tones.
     *
     * **`2017-09-21`:** Deprecated. The service continues to accept the parameter for backward-compatibility, but the
     * parameter no longer affects the response.
     *
     * **`2016-05-19`:** A comma-separated list of tones for which the service is to return its analysis of the input;
     * the indicated tones apply both to the full document and to individual sentences of the document. You can specify
     * one or more of the valid values. Omit the parameter to request results for all three tones.
     *
     * @return the tones
     */
    public List<String> tones() {
      return tones;
    }

    /**
     * Gets the contentLanguage.
     *
     * The language of the input text for the request: English or French. Regional variants are treated as their parent
     * language; for example, `en-US` is interpreted as `en`. The input content must match the specified language. Do
     * not submit content that contains both languages. You can use different languages for **Content-Language** and
     * **Accept-Language**.
     * * **`2017-09-21`:** Accepts `en` or `fr`.
     * * **`2016-05-19`:** Accepts only `en`.
     *
     * @return the contentLanguage
     */
    public String contentLanguage() {
      return contentLanguage;
    }

    /**
     * Gets the acceptLanguage.
     *
     * The desired language of the response. For two-character arguments, regional variants are treated as their parent
     * language; for example, `en-US` is interpreted as `en`. You can use different languages for **Content-Language**
     * and **Accept-Language**.
     *
     * @return the acceptLanguage
     */
    public String acceptLanguage() {
      return acceptLanguage;
    }

    private ToneOptions(ToneOptionsBuilder builder) {
      toneInput = builder.toneInput;
      body = builder.body;
      contentType = builder.contentType;
      sentences = builder.sentences;
      tones = builder.tones;
      contentLanguage = builder.contentLanguage;
      acceptLanguage = builder.acceptLanguage;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ToneOptions builder
     */
    public ToneOptionsBuilder newBuilder() {
      return new ToneOptionsBuilder(this);
    }
  }

  /**
   * ToneOptions Builder.
   */
  public class ToneOptionsBuilder extends IBMWatsonOptionsModel {
    private ToneInput toneInput;
    private String body;
    private String contentType;
    private Boolean sentences;
    private List<String> tones;
    private String contentLanguage;
    private String acceptLanguage;

    private ToneOptionsBuilder(ToneOptions toneOptions) {
      toneInput = toneOptions.toneInput;
      body = toneOptions.body;
      contentType = toneOptions.contentType;
      sentences = toneOptions.sentences;
      tones = toneOptions.tones;
      contentLanguage = toneOptions.contentLanguage;
      acceptLanguage = toneOptions.acceptLanguage;
      this.requestHeaders.putAll(toneOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ToneOptionsBuilder() {
    }

    /**
     * Builds a ToneOptions.
     *
     * @return the toneOptions
     */
    public ToneOptions build() {
      return new ToneOptions(this);
    }

    /**
     * Adds an tones to tones.
     *
     * @param tones the new tones
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder addTones(String tones) {
      IBMWatsonValidator.notNull(tones, 'tones cannot be null');
      if (this.tones == null) {
        this.tones = new List<String>();
      }
      this.tones.add(tones);
      return this;
    }

    /**
     * Set the sentences.
     *
     * @param sentences the sentences
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder sentences(Boolean sentences) {
      this.sentences = sentences;
      return this;
    }

    /**
     * Set the tones.
     * Existing tones will be replaced.
     *
     * @param tones the tones
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder tones(List<String> tones) {
      this.tones = tones;
      return this;
    }

    /**
     * Set the contentLanguage.
     *
     * @param contentLanguage the contentLanguage
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder contentLanguage(String contentLanguage) {
      this.contentLanguage = contentLanguage;
      return this;
    }

    /**
     * Set the acceptLanguage.
     *
     * @param acceptLanguage the acceptLanguage
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder acceptLanguage(String acceptLanguage) {
      this.acceptLanguage = acceptLanguage;
      return this;
    }

    /**
     * Set the toneInput.
     *
     * @param toneInput the toneInput
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder toneInput(ToneInput toneInput) {
      this.toneInput = toneInput;
      this.contentType = IBMWatsonHttpMediaType.APPLICATION_JSON;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder text(String text) {
      this.body = text;
      this.contentType = IBMWatsonHttpMediaType.TEXT_PLAIN;
      return this;
    }

    /**
     * Set the html.
     *
     * @param html the html
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder html(String html) {
      this.body = html;
      this.contentType = IBMWatsonHttpMediaType.TEXT_HTML;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ToneOptions builder
     */
    public ToneOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The score for a tone from the input content.
   */
  public class ToneScore extends IBMWatsonGenericModel {
    private Double score;
    private String toneId;
    private String toneName;

    /**
     * Gets the score.
     *
     * The score for the tone.
     * * **`2017-09-21`:** The score that is returned lies in the range of 0.5 to 1. A score greater than 0.75 indicates
     * a high likelihood that the tone is perceived in the content.
     * * **`2016-05-19`:** The score that is returned lies in the range of 0 to 1. A score less than 0.5 indicates that
     * the tone is unlikely to be perceived in the content; a score greater than 0.75 indicates a high likelihood that
     * the tone is perceived.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Gets the toneId.
     *
     * The unique, non-localized identifier of the tone.
     * * **`2017-09-21`:** The service can return results for the following tone IDs: `anger`, `fear`, `joy`, and
     * `sadness` (emotional tones); `analytical`, `confident`, and `tentative` (language tones). The service returns
     * results only for tones whose scores meet a minimum threshold of 0.5.
     * * **`2016-05-19`:** The service can return results for the following tone IDs of the different categories: for
     * the `emotion` category: `anger`, `disgust`, `fear`, `joy`, and `sadness`; for the `language` category:
     * `analytical`, `confident`, and `tentative`; for the `social` category: `openness_big5`, `conscientiousness_big5`,
     * `extraversion_big5`, `agreeableness_big5`, and `emotional_range_big5`. The service returns scores for all tones
     * of a category, regardless of their values.
     *
     * @return the toneId
     */
    @AuraEnabled
    public String getToneId() {
      return toneId;
    }

    /**
     * Gets the toneName.
     *
     * The user-visible, localized name of the tone.
     *
     * @return the toneName
     */
    @AuraEnabled
    public String getToneName() {
      return toneName;
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
     * Sets the toneId.
     *
     * @param toneId the new toneId
     */
    public void setToneId(final String toneId) {
      this.toneId = toneId;
    }

    /**
     * Sets the toneName.
     *
     * @param toneName the new toneName
     */
    public void setToneName(final String toneName) {
      this.toneName = toneName;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'tone_id' => 'toneId',
        'tone_name' => 'toneName'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ToneScore ret = (ToneScore) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * An utterance for the input of the general-purpose endpoint.
   */
  public class Utterance extends IBMWatsonGenericModel {
    private String text;
    private String user;

    /**
     * Gets the text.
     *
     * An utterance contributed by a user in the conversation that is to be analyzed. The utterance can contain multiple
     * sentences.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the user.
     *
     * A string that identifies the user who contributed the utterance specified by the `text` parameter.
     *
     * @return the user
     */
    public String user() {
      return user;
    }
  
    private Utterance(UtteranceBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      this.text = builder.text;
      this.user = builder.user;
    }

    /**
     * New builder.
     *
     * @return a Utterance builder
     */
    public UtteranceBuilder newBuilder() {
      return new UtteranceBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * Utterance Builder.
   */
  public class UtteranceBuilder {
    private String text;
    private String user;

    private UtteranceBuilder(Utterance utterance) {
      this.text = utterance.text;
      this.user = utterance.user;
    }

    /**
     * Instantiates a new builder.
     */
    public UtteranceBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public UtteranceBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a Utterance.
     *
     * @return the utterance
     */
    public Utterance build() {
      return new Utterance(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the Utterance builder
     */
    public UtteranceBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the user.
     *
     * @param user the user
     * @return the Utterance builder
     */
    public UtteranceBuilder user(String user) {
      this.user = user;
      return this;
    }
  }

  /**
   * The results of the analysis for the utterances of the input content.
   */
  public class UtteranceAnalyses extends IBMWatsonResponseModel {
    private List<UtteranceAnalysis> utterancesTone;
    private String warning;

    /**
     * Gets the utterancesTone.
     *
     * An array of `UtteranceAnalysis` objects that provides the results for each utterance of the input.
     *
     * @return the utterancesTone
     */
    @AuraEnabled
    public List<UtteranceAnalysis> getUtterancesTone() {
      return utterancesTone;
    }

    /**
     * Gets the warning.
     *
     * **`2017-09-21`:** A warning message if the content contains more than 50 utterances. The service analyzes only
     * the first 50 utterances. **`2016-05-19`:** Not returned.
     *
     * @return the warning
     */
    @AuraEnabled
    public String getWarning() {
      return warning;
    }

    /**
     * Sets the utterancesTone.
     *
     * @param utterancesTone the new utterancesTone
     */
    public void setUtterancesTone(final List<UtteranceAnalysis> utterancesTone) {
      this.utterancesTone = utterancesTone;
    }

    /**
     * Sets the warning.
     *
     * @param warning the new warning
     */
    public void setWarning(final String warning) {
      this.warning = warning;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'utterances_tone' => 'utterancesTone'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      UtteranceAnalyses ret = (UtteranceAnalyses) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for utterancesTone
      List<UtteranceAnalysis> newUtterancesTone = new List<UtteranceAnalysis>();
      List<UtteranceAnalysis> deserializedUtterancesTone = ret.getUtterancesTone();
      if (deserializedUtterancesTone != null) {
        for (Integer i = 0; i < deserializedUtterancesTone.size(); i++) {
          UtteranceAnalysis currentItem = ret.getUtterancesTone().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('utterancesTone');
          UtteranceAnalysis newItem = (UtteranceAnalysis) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), UtteranceAnalysis.class);
          newUtterancesTone.add(newItem);
        }
        ret.utterancesTone = newUtterancesTone;
      }

      return ret;
    }
  }

  /**
   * The results of the analysis for an utterance of the input content.
   */
  public class UtteranceAnalysis extends IBMWatsonGenericModel {
    private Long utteranceId;
    private String utteranceText;
    private List<ToneChatScore> tones;
    private String error;

    /**
     * Gets the utteranceId.
     *
     * The unique identifier of the utterance. The first utterance has ID 0, and the ID of each subsequent utterance is
     * incremented by one.
     *
     * @return the utteranceId
     */
    @AuraEnabled
    public Long getUtteranceId() {
      return utteranceId;
    }

    /**
     * Gets the utteranceText.
     *
     * The text of the utterance.
     *
     * @return the utteranceText
     */
    @AuraEnabled
    public String getUtteranceText() {
      return utteranceText;
    }

    /**
     * Gets the tones.
     *
     * An array of `ToneChatScore` objects that provides results for the most prevalent tones of the utterance. The
     * array includes results for any tone whose score is at least 0.5. The array is empty if no tone has a score that
     * meets this threshold.
     *
     * @return the tones
     */
    @AuraEnabled
    public List<ToneChatScore> getTones() {
      return tones;
    }

    /**
     * Gets the error.
     *
     * **`2017-09-21`:** An error message if the utterance contains more than 500 characters. The service does not
     * analyze the utterance. **`2016-05-19`:** Not returned.
     *
     * @return the error
     */
    @AuraEnabled
    public String getError() {
      return error;
    }

    /**
     * Sets the utteranceId.
     *
     * @param utteranceId the new utteranceId
     */
    public void setUtteranceId(final long utteranceId) {
      this.utteranceId = utteranceId;
    }

    /**
     * Sets the utteranceText.
     *
     * @param utteranceText the new utteranceText
     */
    public void setUtteranceText(final String utteranceText) {
      this.utteranceText = utteranceText;
    }

    /**
     * Sets the tones.
     *
     * @param tones the new tones
     */
    public void setTones(final List<ToneChatScore> tones) {
      this.tones = tones;
    }

    /**
     * Sets the error.
     *
     * @param error the new error
     */
    public void setError(final String error) {
      this.error = error;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'utterance_id' => 'utteranceId',
        'utterance_text' => 'utteranceText'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      UtteranceAnalysis ret = (UtteranceAnalysis) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for tones
      List<ToneChatScore> newTones = new List<ToneChatScore>();
      List<ToneChatScore> deserializedTones = ret.getTones();
      if (deserializedTones != null) {
        for (Integer i = 0; i < deserializedTones.size(); i++) {
          ToneChatScore currentItem = ret.getTones().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tones');
          ToneChatScore newItem = (ToneChatScore) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ToneChatScore.class);
          newTones.add(newItem);
        }
        ret.tones = newTones;
      }

      return ret;
    }
  }

}