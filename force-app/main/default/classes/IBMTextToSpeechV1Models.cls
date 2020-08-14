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

public class IBMTextToSpeechV1Models {
  /**
   * The addWord options.
   */
  public class AddWordOptions extends IBMWatsonOptionsModel {
    private String customizationId;
    private String word;
    private String translation;
    private String partOfSpeech;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    /**
     * Gets the word.
     *
     * The word that is to be added or updated for the custom voice model.
     *
     * @return the word
     */
    public String word() {
      return word;
    }

    /**
     * Gets the translation.
     *
     * The phonetic or sounds-like translation for the word. A phonetic translation is based on the SSML format for
     * representing the phonetic string of a word either as an IPA translation or as an IBM SPR translation. A
     * sounds-like is one or more words that, when combined, sound like the word.
     *
     * @return the translation
     */
    public String translation() {
      return translation;
    }

    /**
     * Gets the partOfSpeech.
     *
     * **Japanese only.** The part of speech for the word. The service uses the value to produce the correct intonation
     * for the word. You can create only a single entry, with or without a single part of speech, for any word; you
     * cannot create multiple entries with different parts of speech for the same word. For more information, see
     * [Working with Japanese
     * entries](https://cloud.ibm.com/docs/text-to-speech?topic=text-to-speech-rules#jaNotes).
     *
     * @return the partOfSpeech
     */
    public String partOfSpeech() {
      return partOfSpeech;
    }

    private AddWordOptions(AddWordOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.word, 'word cannot be empty');
      IBMWatsonValidator.notNull(builder.translation, 'translation cannot be null');
      customizationId = builder.customizationId;
      word = builder.word;
      translation = builder.translation;
      partOfSpeech = builder.partOfSpeech;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AddWordOptions builder
     */
    public AddWordOptionsBuilder newBuilder() {
      return new AddWordOptionsBuilder(this);
    }
  }

  /**
   * AddWordOptions Builder.
   */
  public class AddWordOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;
    private String word;
    private String translation;
    private String partOfSpeech;

    private AddWordOptionsBuilder(AddWordOptions addWordOptions) {
      customizationId = addWordOptions.customizationId;
      word = addWordOptions.word;
      translation = addWordOptions.translation;
      partOfSpeech = addWordOptions.partOfSpeech;
      this.requestHeaders.putAll(addWordOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AddWordOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     * @param word the word
     * @param translation the translation
     */
    public AddWordOptionsBuilder(String customizationId, String word, String translation) {
      this.customizationId = customizationId;
      this.word = word;
      this.translation = translation;
    }

    /**
     * Builds a AddWordOptions.
     *
     * @return the addWordOptions
     */
    public AddWordOptions build() {
      return new AddWordOptions(this);
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the AddWordOptions builder
     */
    public AddWordOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Set the word.
     *
     * @param word the word
     * @return the AddWordOptions builder
     */
    public AddWordOptionsBuilder word(String word) {
      this.word = word;
      return this;
    }

    /**
     * Set the translation.
     *
     * @param translation the translation
     * @return the AddWordOptions builder
     */
    public AddWordOptionsBuilder translation(String translation) {
      this.translation = translation;
      return this;
    }

    /**
     * Set the partOfSpeech.
     *
     * @param partOfSpeech the partOfSpeech
     * @return the AddWordOptions builder
     */
    public AddWordOptionsBuilder partOfSpeech(String partOfSpeech) {
      this.partOfSpeech = partOfSpeech;
      return this;
    }

    /**
     * Set the translation.
     *
     * @param translation the translation
     * @return the AddWordOptions builder
     */
    public AddWordOptionsBuilder translation(Translation translation) {
      this.translation = translation.getTranslation();
      this.partOfSpeech = translation.getPartOfSpeech();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AddWordOptions builder
     */
    public AddWordOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The addWords options.
   */
  public class AddWordsOptions extends IBMWatsonOptionsModel {
    private String customizationId;
    private List<Word> words;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    /**
     * Gets the words.
     *
     * The **Add custom words** method accepts an array of `Word` objects. Each object provides a word that is to be
     * added or updated for the custom voice model and the word's translation.
     *
     * The **List custom words** method returns an array of `Word` objects. Each object shows a word and its translation
     * from the custom voice model. The words are listed in alphabetical order, with uppercase letters listed before
     * lowercase letters. The array is empty if the custom model contains no words.
     *
     * @return the words
     */
    public List<Word> words() {
      return words;
    }

    private AddWordsOptions(AddWordsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      IBMWatsonValidator.notNull(builder.words, 'words cannot be null');
      customizationId = builder.customizationId;
      words = builder.words;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AddWordsOptions builder
     */
    public AddWordsOptionsBuilder newBuilder() {
      return new AddWordsOptionsBuilder(this);
    }
  }

  /**
   * AddWordsOptions Builder.
   */
  public class AddWordsOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;
    private List<Word> words;

    private AddWordsOptionsBuilder(AddWordsOptions addWordsOptions) {
      customizationId = addWordsOptions.customizationId;
      words = addWordsOptions.words;
      this.requestHeaders.putAll(addWordsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AddWordsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     * @param words the words
     */
    public AddWordsOptionsBuilder(String customizationId, List<Word> words) {
      this.customizationId = customizationId;
      this.words = words;
    }

    /**
     * Builds a AddWordsOptions.
     *
     * @return the addWordsOptions
     */
    public AddWordsOptions build() {
      return new AddWordsOptions(this);
    }

    /**
     * Adds an words to words.
     *
     * @param words the new words
     * @return the AddWordsOptions builder
     */
    public AddWordsOptionsBuilder addWords(Word words) {
      IBMWatsonValidator.notNull(words, 'words cannot be null');
      if (this.words == null) {
        this.words = new List<Word>();
      }
      this.words.add(words);
      return this;
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the AddWordsOptions builder
     */
    public AddWordsOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Set the words.
     * Existing words will be replaced.
     *
     * @param words the words
     * @return the AddWordsOptions builder
     */
    public AddWordsOptionsBuilder words(List<Word> words) {
      this.words = words;
      return this;
    }

    /**
     * Set the words.
     *
     * @param words the words
     * @return the AddWordsOptions builder
     */
    public AddWordsOptionsBuilder words(Words words) {
      this.words = words.getWords();
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AddWordsOptions builder
     */
    public AddWordsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createVoiceModel options.
   */
  public class CreateVoiceModelOptions extends IBMWatsonOptionsModel {
    private String name;
    private String language;
    private String description;

    /**
     * Gets the name.
     *
     * The name of the new custom voice model.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the language.
     *
     * The language of the new custom voice model. Omit the parameter to use the the default language, `en-US`.
     *
     * @return the language
     */
    public String language() {
      return language;
    }

    /**
     * Gets the description.
     *
     * A description of the new custom voice model. Specifying a description is recommended.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    private CreateVoiceModelOptions(CreateVoiceModelOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      name = builder.name;
      language = builder.language;
      description = builder.description;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateVoiceModelOptions builder
     */
    public CreateVoiceModelOptionsBuilder newBuilder() {
      return new CreateVoiceModelOptionsBuilder(this);
    }
  }

  /**
   * CreateVoiceModelOptions Builder.
   */
  public class CreateVoiceModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String name;
    private String language;
    private String description;

    private CreateVoiceModelOptionsBuilder(CreateVoiceModelOptions createVoiceModelOptions) {
      name = createVoiceModelOptions.name;
      language = createVoiceModelOptions.language;
      description = createVoiceModelOptions.description;
      this.requestHeaders.putAll(createVoiceModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateVoiceModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param name the name
     */
    public CreateVoiceModelOptionsBuilder(String name) {
      this.name = name;
    }

    /**
     * Builds a CreateVoiceModelOptions.
     *
     * @return the createVoiceModelOptions
     */
    public CreateVoiceModelOptions build() {
      return new CreateVoiceModelOptions(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateVoiceModelOptions builder
     */
    public CreateVoiceModelOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the CreateVoiceModelOptions builder
     */
    public CreateVoiceModelOptionsBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateVoiceModelOptions builder
     */
    public CreateVoiceModelOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateVoiceModelOptions builder
     */
    public CreateVoiceModelOptionsBuilder addHeader(String name, String value) {
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
   * The deleteVoiceModel options.
   */
  public class DeleteVoiceModelOptions extends IBMWatsonOptionsModel {
    private String customizationId;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    private DeleteVoiceModelOptions(DeleteVoiceModelOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      customizationId = builder.customizationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteVoiceModelOptions builder
     */
    public DeleteVoiceModelOptionsBuilder newBuilder() {
      return new DeleteVoiceModelOptionsBuilder(this);
    }
  }

  /**
   * DeleteVoiceModelOptions Builder.
   */
  public class DeleteVoiceModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;

    private DeleteVoiceModelOptionsBuilder(DeleteVoiceModelOptions deleteVoiceModelOptions) {
      customizationId = deleteVoiceModelOptions.customizationId;
      this.requestHeaders.putAll(deleteVoiceModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteVoiceModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     */
    public DeleteVoiceModelOptionsBuilder(String customizationId) {
      this.customizationId = customizationId;
    }

    /**
     * Builds a DeleteVoiceModelOptions.
     *
     * @return the deleteVoiceModelOptions
     */
    public DeleteVoiceModelOptions build() {
      return new DeleteVoiceModelOptions(this);
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the DeleteVoiceModelOptions builder
     */
    public DeleteVoiceModelOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteVoiceModelOptions builder
     */
    public DeleteVoiceModelOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteWord options.
   */
  public class DeleteWordOptions extends IBMWatsonOptionsModel {
    private String customizationId;
    private String word;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    /**
     * Gets the word.
     *
     * The word that is to be deleted from the custom voice model.
     *
     * @return the word
     */
    public String word() {
      return word;
    }

    private DeleteWordOptions(DeleteWordOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.word, 'word cannot be empty');
      customizationId = builder.customizationId;
      word = builder.word;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteWordOptions builder
     */
    public DeleteWordOptionsBuilder newBuilder() {
      return new DeleteWordOptionsBuilder(this);
    }
  }

  /**
   * DeleteWordOptions Builder.
   */
  public class DeleteWordOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;
    private String word;

    private DeleteWordOptionsBuilder(DeleteWordOptions deleteWordOptions) {
      customizationId = deleteWordOptions.customizationId;
      word = deleteWordOptions.word;
      this.requestHeaders.putAll(deleteWordOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteWordOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     * @param word the word
     */
    public DeleteWordOptionsBuilder(String customizationId, String word) {
      this.customizationId = customizationId;
      this.word = word;
    }

    /**
     * Builds a DeleteWordOptions.
     *
     * @return the deleteWordOptions
     */
    public DeleteWordOptions build() {
      return new DeleteWordOptions(this);
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the DeleteWordOptions builder
     */
    public DeleteWordOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Set the word.
     *
     * @param word the word
     * @return the DeleteWordOptions builder
     */
    public DeleteWordOptionsBuilder word(String word) {
      this.word = word;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteWordOptions builder
     */
    public DeleteWordOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getPronunciation options.
   */
  public class GetPronunciationOptions extends IBMWatsonOptionsModel {
    private String text;
    private String voice;
    private String format;
    private String customizationId;

    /**
     * Gets the text.
     *
     * The word for which the pronunciation is requested.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the voice.
     *
     * A voice that specifies the language in which the pronunciation is to be returned. All voices for the same
     * language (for example, `en-US`) return the same translation.
     *
     * @return the voice
     */
    public String voice() {
      return voice;
    }

    /**
     * Gets the format.
     *
     * The phoneme format in which to return the pronunciation. Omit the parameter to obtain the pronunciation in the
     * default format.
     *
     * @return the format
     */
    public String format() {
      return format;
    }

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of a custom voice model for which the pronunciation is to be returned. The language
     * of a specified custom model must match the language of the specified voice. If the word is not defined in the
     * specified custom model, the service returns the default translation for the custom model's language. You must
     * make the request with credentials for the instance of the service that owns the custom model. Omit the parameter
     * to see the translation for the specified voice with no customization.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    private GetPronunciationOptions(GetPronunciationOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      text = builder.text;
      voice = builder.voice;
      format = builder.format;
      customizationId = builder.customizationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetPronunciationOptions builder
     */
    public GetPronunciationOptionsBuilder newBuilder() {
      return new GetPronunciationOptionsBuilder(this);
    }
  }

  /**
   * GetPronunciationOptions Builder.
   */
  public class GetPronunciationOptionsBuilder extends IBMWatsonOptionsModel {
    private String text;
    private String voice;
    private String format;
    private String customizationId;

    private GetPronunciationOptionsBuilder(GetPronunciationOptions getPronunciationOptions) {
      text = getPronunciationOptions.text;
      voice = getPronunciationOptions.voice;
      format = getPronunciationOptions.format;
      customizationId = getPronunciationOptions.customizationId;
      this.requestHeaders.putAll(getPronunciationOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetPronunciationOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public GetPronunciationOptionsBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a GetPronunciationOptions.
     *
     * @return the getPronunciationOptions
     */
    public GetPronunciationOptions build() {
      return new GetPronunciationOptions(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the GetPronunciationOptions builder
     */
    public GetPronunciationOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the voice.
     *
     * @param voice the voice
     * @return the GetPronunciationOptions builder
     */
    public GetPronunciationOptionsBuilder voice(String voice) {
      this.voice = voice;
      return this;
    }

    /**
     * Set the format.
     *
     * @param format the format
     * @return the GetPronunciationOptions builder
     */
    public GetPronunciationOptionsBuilder format(String format) {
      this.format = format;
      return this;
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the GetPronunciationOptions builder
     */
    public GetPronunciationOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetPronunciationOptions builder
     */
    public GetPronunciationOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getVoiceModel options.
   */
  public class GetVoiceModelOptions extends IBMWatsonOptionsModel {
    private String customizationId;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    private GetVoiceModelOptions(GetVoiceModelOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      customizationId = builder.customizationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetVoiceModelOptions builder
     */
    public GetVoiceModelOptionsBuilder newBuilder() {
      return new GetVoiceModelOptionsBuilder(this);
    }
  }

  /**
   * GetVoiceModelOptions Builder.
   */
  public class GetVoiceModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;

    private GetVoiceModelOptionsBuilder(GetVoiceModelOptions getVoiceModelOptions) {
      customizationId = getVoiceModelOptions.customizationId;
      this.requestHeaders.putAll(getVoiceModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetVoiceModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     */
    public GetVoiceModelOptionsBuilder(String customizationId) {
      this.customizationId = customizationId;
    }

    /**
     * Builds a GetVoiceModelOptions.
     *
     * @return the getVoiceModelOptions
     */
    public GetVoiceModelOptions build() {
      return new GetVoiceModelOptions(this);
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the GetVoiceModelOptions builder
     */
    public GetVoiceModelOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetVoiceModelOptions builder
     */
    public GetVoiceModelOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getVoice options.
   */
  public class GetVoiceOptions extends IBMWatsonOptionsModel {
    private String voice;
    private String customizationId;

    /**
     * Gets the voice.
     *
     * The voice for which information is to be returned.
     *
     * @return the voice
     */
    public String voice() {
      return voice;
    }

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of a custom voice model for which information is to be returned. You must make the
     * request with credentials for the instance of the service that owns the custom model. Omit the parameter to see
     * information about the specified voice with no customization.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    private GetVoiceOptions(GetVoiceOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.voice, 'voice cannot be empty');
      voice = builder.voice;
      customizationId = builder.customizationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetVoiceOptions builder
     */
    public GetVoiceOptionsBuilder newBuilder() {
      return new GetVoiceOptionsBuilder(this);
    }
  }

  /**
   * GetVoiceOptions Builder.
   */
  public class GetVoiceOptionsBuilder extends IBMWatsonOptionsModel {
    private String voice;
    private String customizationId;

    private GetVoiceOptionsBuilder(GetVoiceOptions getVoiceOptions) {
      voice = getVoiceOptions.voice;
      customizationId = getVoiceOptions.customizationId;
      this.requestHeaders.putAll(getVoiceOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetVoiceOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param voice the voice
     */
    public GetVoiceOptionsBuilder(String voice) {
      this.voice = voice;
    }

    /**
     * Builds a GetVoiceOptions.
     *
     * @return the getVoiceOptions
     */
    public GetVoiceOptions build() {
      return new GetVoiceOptions(this);
    }

    /**
     * Set the voice.
     *
     * @param voice the voice
     * @return the GetVoiceOptions builder
     */
    public GetVoiceOptionsBuilder voice(String voice) {
      this.voice = voice;
      return this;
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the GetVoiceOptions builder
     */
    public GetVoiceOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetVoiceOptions builder
     */
    public GetVoiceOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getWord options.
   */
  public class GetWordOptions extends IBMWatsonOptionsModel {
    private String customizationId;
    private String word;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    /**
     * Gets the word.
     *
     * The word that is to be queried from the custom voice model.
     *
     * @return the word
     */
    public String word() {
      return word;
    }

    private GetWordOptions(GetWordOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.word, 'word cannot be empty');
      customizationId = builder.customizationId;
      word = builder.word;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetWordOptions builder
     */
    public GetWordOptionsBuilder newBuilder() {
      return new GetWordOptionsBuilder(this);
    }
  }

  /**
   * GetWordOptions Builder.
   */
  public class GetWordOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;
    private String word;

    private GetWordOptionsBuilder(GetWordOptions getWordOptions) {
      customizationId = getWordOptions.customizationId;
      word = getWordOptions.word;
      this.requestHeaders.putAll(getWordOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetWordOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     * @param word the word
     */
    public GetWordOptionsBuilder(String customizationId, String word) {
      this.customizationId = customizationId;
      this.word = word;
    }

    /**
     * Builds a GetWordOptions.
     *
     * @return the getWordOptions
     */
    public GetWordOptions build() {
      return new GetWordOptions(this);
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the GetWordOptions builder
     */
    public GetWordOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Set the word.
     *
     * @param word the word
     * @return the GetWordOptions builder
     */
    public GetWordOptionsBuilder word(String word) {
      this.word = word;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetWordOptions builder
     */
    public GetWordOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listVoiceModels options.
   */
  public class ListVoiceModelsOptions extends IBMWatsonOptionsModel {
    private String language;

    /**
     * Gets the language.
     *
     * The language for which custom voice models that are owned by the requesting credentials are to be returned. Omit
     * the parameter to see all custom voice models that are owned by the requester.
     *
     * @return the language
     */
    public String language() {
      return language;
    }

    private ListVoiceModelsOptions(ListVoiceModelsOptionsBuilder builder) {
      language = builder.language;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListVoiceModelsOptions builder
     */
    public ListVoiceModelsOptionsBuilder newBuilder() {
      return new ListVoiceModelsOptionsBuilder(this);
    }
  }

  /**
   * ListVoiceModelsOptions Builder.
   */
  public class ListVoiceModelsOptionsBuilder extends IBMWatsonOptionsModel {
    private String language;

    private ListVoiceModelsOptionsBuilder(ListVoiceModelsOptions listVoiceModelsOptions) {
      language = listVoiceModelsOptions.language;
      this.requestHeaders.putAll(listVoiceModelsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListVoiceModelsOptionsBuilder() {
    }

    /**
     * Builds a ListVoiceModelsOptions.
     *
     * @return the listVoiceModelsOptions
     */
    public ListVoiceModelsOptions build() {
      return new ListVoiceModelsOptions(this);
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the ListVoiceModelsOptions builder
     */
    public ListVoiceModelsOptionsBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListVoiceModelsOptions builder
     */
    public ListVoiceModelsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listVoices options.
   */
  public class ListVoicesOptions extends IBMWatsonOptionsModel {

    private ListVoicesOptions(ListVoicesOptionsBuilder builder) {
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListVoicesOptions builder
     */
    public ListVoicesOptionsBuilder newBuilder() {
      return new ListVoicesOptionsBuilder(this);
    }
  }

  /**
   * ListVoicesOptions Builder.
   */
  public class ListVoicesOptionsBuilder extends IBMWatsonOptionsModel {

    private ListVoicesOptionsBuilder(ListVoicesOptions listVoicesOptions) {
      this.requestHeaders.putAll(listVoicesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListVoicesOptionsBuilder() {
    }

    /**
     * Builds a ListVoicesOptions.
     *
     * @return the listVoicesOptions
     */
    public ListVoicesOptions build() {
      return new ListVoicesOptions(this);
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListVoicesOptions builder
     */
    public ListVoicesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listWords options.
   */
  public class ListWordsOptions extends IBMWatsonOptionsModel {
    private String customizationId;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    private ListWordsOptions(ListWordsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      customizationId = builder.customizationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListWordsOptions builder
     */
    public ListWordsOptionsBuilder newBuilder() {
      return new ListWordsOptionsBuilder(this);
    }
  }

  /**
   * ListWordsOptions Builder.
   */
  public class ListWordsOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;

    private ListWordsOptionsBuilder(ListWordsOptions listWordsOptions) {
      customizationId = listWordsOptions.customizationId;
      this.requestHeaders.putAll(listWordsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListWordsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     */
    public ListWordsOptionsBuilder(String customizationId) {
      this.customizationId = customizationId;
    }

    /**
     * Builds a ListWordsOptions.
     *
     * @return the listWordsOptions
     */
    public ListWordsOptions build() {
      return new ListWordsOptions(this);
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the ListWordsOptions builder
     */
    public ListWordsOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListWordsOptions builder
     */
    public ListWordsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The pronunciation of the specified text.
   */
  public class Pronunciation extends IBMWatsonResponseModel {
    private String pronunciation;

    /**
     * Gets the pronunciation.
     *
     * The pronunciation of the specified text in the requested voice and format. If a custom voice model is specified,
     * the pronunciation also reflects that custom voice.
     *
     * @return the pronunciation
     */
    @AuraEnabled
    public String getPronunciation() {
      return pronunciation;
    }

    /**
     * Sets the pronunciation.
     *
     * @param pronunciation the new pronunciation
     */
    public void setPronunciation(final String pronunciation) {
      this.pronunciation = pronunciation;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Pronunciation ret = (Pronunciation) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Additional service features that are supported with the voice.
   */
  public class SupportedFeatures extends IBMWatsonGenericModel {
    private Boolean customPronunciation;
    private Boolean voiceTransformation;

    /**
     * Gets the customPronunciation.
     *
     * If `true`, the voice can be customized; if `false`, the voice cannot be customized. (Same as `customizable`.).
     *
     * @return the customPronunciation
     */
    @AuraEnabled
    public Boolean getCustomPronunciation() {
      return customPronunciation;
    }

    /**
     * Gets the voiceTransformation.
     *
     * If `true`, the voice can be transformed by using the SSML &lt;voice-transformation&gt; element; if `false`, the
     * voice cannot be transformed.
     *
     * @return the voiceTransformation
     */
    @AuraEnabled
    public Boolean getVoiceTransformation() {
      return voiceTransformation;
    }

    /**
     * Sets the customPronunciation.
     *
     * @param customPronunciation the new customPronunciation
     */
    public void setCustomPronunciation(final Boolean customPronunciation) {
      this.customPronunciation = customPronunciation;
    }

    /**
     * Sets the voiceTransformation.
     *
     * @param voiceTransformation the new voiceTransformation
     */
    public void setVoiceTransformation(final Boolean voiceTransformation) {
      this.voiceTransformation = voiceTransformation;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'custom_pronunciation' => 'customPronunciation',
        'voice_transformation' => 'voiceTransformation'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SupportedFeatures ret = (SupportedFeatures) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The synthesize options.
   */
  public class SynthesizeOptions extends IBMWatsonOptionsModel {
    private String text;
    private String accept;
    private String voice;
    private String customizationId;

    /**
     * Gets the text.
     *
     * The text to synthesize.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the accept.
     *
     * The requested format (MIME type) of the audio. You can use the `Accept` header or the `accept` parameter to
     * specify the audio format. For more information about specifying an audio format, see **Audio formats (accept
     * types)** in the method description.
     *
     * @return the accept
     */
    public String accept() {
      return accept;
    }

    /**
     * Gets the voice.
     *
     * The voice to use for synthesis.
     *
     * @return the voice
     */
    public String voice() {
      return voice;
    }

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of a custom voice model to use for the synthesis. If a custom voice model is
     * specified, it is guaranteed to work only if it matches the language of the indicated voice. You must make the
     * request with credentials for the instance of the service that owns the custom model. Omit the parameter to use
     * the specified voice with no customization.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    private SynthesizeOptions(SynthesizeOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      text = builder.text;
      accept = builder.accept;
      voice = builder.voice;
      customizationId = builder.customizationId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a SynthesizeOptions builder
     */
    public SynthesizeOptionsBuilder newBuilder() {
      return new SynthesizeOptionsBuilder(this);
    }
  }

  /**
   * SynthesizeOptions Builder.
   */
  public class SynthesizeOptionsBuilder extends IBMWatsonOptionsModel {
    private String text;
    private String accept;
    private String voice;
    private String customizationId;

    private SynthesizeOptionsBuilder(SynthesizeOptions synthesizeOptions) {
      text = synthesizeOptions.text;
      accept = synthesizeOptions.accept;
      voice = synthesizeOptions.voice;
      customizationId = synthesizeOptions.customizationId;
      this.requestHeaders.putAll(synthesizeOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public SynthesizeOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public SynthesizeOptionsBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a SynthesizeOptions.
     *
     * @return the synthesizeOptions
     */
    public SynthesizeOptions build() {
      return new SynthesizeOptions(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the SynthesizeOptions builder
     */
    public SynthesizeOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the accept.
     *
     * @param accept the accept
     * @return the SynthesizeOptions builder
     */
    public SynthesizeOptionsBuilder accept(String accept) {
      this.accept = accept;
      return this;
    }

    /**
     * Set the voice.
     *
     * @param voice the voice
     * @return the SynthesizeOptions builder
     */
    public SynthesizeOptionsBuilder voice(String voice) {
      this.voice = voice;
      return this;
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the SynthesizeOptions builder
     */
    public SynthesizeOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the SynthesizeOptions builder
     */
    public SynthesizeOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Information about the translation for the specified text.
   */
  public class Translation extends IBMWatsonResponseModel {
    private String translation;
    private String partOfSpeech;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Translation() { }

    /**
     * Gets the translation.
     *
     * The phonetic or sounds-like translation for the word. A phonetic translation is based on the SSML format for
     * representing the phonetic string of a word either as an IPA translation or as an IBM SPR translation. A
     * sounds-like is one or more words that, when combined, sound like the word.
     *
     * @return the translation
     */
    @AuraEnabled
    public String getTranslation() {
      return translation;
    }

    /**
     * Gets the partOfSpeech.
     *
     * **Japanese only.** The part of speech for the word. The service uses the value to produce the correct intonation
     * for the word. You can create only a single entry, with or without a single part of speech, for any word; you
     * cannot create multiple entries with different parts of speech for the same word. For more information, see
     * [Working with Japanese
     * entries](https://cloud.ibm.com/docs/text-to-speech?topic=text-to-speech-rules#jaNotes).
     *
     * @return the partOfSpeech
     */
    @AuraEnabled
    public String getPartOfSpeech() {
      return partOfSpeech;
    }
  
    private Translation(TranslationBuilder builder) {
      IBMWatsonValidator.notNull(builder.translation, 'translation cannot be null');
      this.translation = builder.translation;
      this.partOfSpeech = builder.partOfSpeech;
    }

    /**
     * New builder.
     *
     * @return a Translation builder
     */
    public TranslationBuilder newBuilder() {
      return new TranslationBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'part_of_speech' => 'partOfSpeech'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Translation ret = (Translation) super.deserialize(jsonString, jsonMap, classType);
      TranslationBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
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
   * Translation Builder.
   */
  public class TranslationBuilder {
    private String translation;
    private String partOfSpeech;

    private TranslationBuilder(Translation translation) {
      this.translation = translation.translation;
      this.partOfSpeech = translation.partOfSpeech;
    }

    /**
     * Instantiates a new builder.
     */
    public TranslationBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param translation the translation
     */
    public TranslationBuilder(String translation) {
      this.translation = translation;
    }

    /**
     * Builds a Translation.
     *
     * @return the translation
     */
    public Translation build() {
      return new Translation(this);
    }

    /**
     * Set the translation.
     *
     * @param translation the translation
     * @return the Translation builder
     */
    public TranslationBuilder translation(String translation) {
      this.translation = translation;
      return this;
    }

    /**
     * Set the partOfSpeech.
     *
     * @param partOfSpeech the partOfSpeech
     * @return the Translation builder
     */
    public TranslationBuilder partOfSpeech(String partOfSpeech) {
      this.partOfSpeech = partOfSpeech;
      return this;
    }
  }

  /**
   * The updateVoiceModel options.
   */
  public class UpdateVoiceModelOptions extends IBMWatsonOptionsModel {
    private String customizationId;
    private String name;
    private String description;
    private List<Word> words;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. You must make the request with credentials for the
     * instance of the service that owns the custom model.
     *
     * @return the customizationId
     */
    public String customizationId() {
      return customizationId;
    }

    /**
     * Gets the name.
     *
     * A new name for the custom voice model.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * A new description for the custom voice model.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    /**
     * Gets the words.
     *
     * An array of `Word` objects that provides the words and their translations that are to be added or updated for the
     * custom voice model. Pass an empty array to make no additions or updates.
     *
     * @return the words
     */
    public List<Word> words() {
      return words;
    }

    private UpdateVoiceModelOptions(UpdateVoiceModelOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.customizationId, 'customizationId cannot be empty');
      customizationId = builder.customizationId;
      name = builder.name;
      description = builder.description;
      words = builder.words;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateVoiceModelOptions builder
     */
    public UpdateVoiceModelOptionsBuilder newBuilder() {
      return new UpdateVoiceModelOptionsBuilder(this);
    }
  }

  /**
   * UpdateVoiceModelOptions Builder.
   */
  public class UpdateVoiceModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String customizationId;
    private String name;
    private String description;
    private List<Word> words;

    private UpdateVoiceModelOptionsBuilder(UpdateVoiceModelOptions updateVoiceModelOptions) {
      customizationId = updateVoiceModelOptions.customizationId;
      name = updateVoiceModelOptions.name;
      description = updateVoiceModelOptions.description;
      words = updateVoiceModelOptions.words;
      this.requestHeaders.putAll(updateVoiceModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateVoiceModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param customizationId the customizationId
     */
    public UpdateVoiceModelOptionsBuilder(String customizationId) {
      this.customizationId = customizationId;
    }

    /**
     * Builds a UpdateVoiceModelOptions.
     *
     * @return the updateVoiceModelOptions
     */
    public UpdateVoiceModelOptions build() {
      return new UpdateVoiceModelOptions(this);
    }

    /**
     * Adds an words to words.
     *
     * @param words the new words
     * @return the UpdateVoiceModelOptions builder
     */
    public UpdateVoiceModelOptionsBuilder addWords(Word words) {
      IBMWatsonValidator.notNull(words, 'words cannot be null');
      if (this.words == null) {
        this.words = new List<Word>();
      }
      this.words.add(words);
      return this;
    }

    /**
     * Set the customizationId.
     *
     * @param customizationId the customizationId
     * @return the UpdateVoiceModelOptions builder
     */
    public UpdateVoiceModelOptionsBuilder customizationId(String customizationId) {
      this.customizationId = customizationId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the UpdateVoiceModelOptions builder
     */
    public UpdateVoiceModelOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the UpdateVoiceModelOptions builder
     */
    public UpdateVoiceModelOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the words.
     * Existing words will be replaced.
     *
     * @param words the words
     * @return the UpdateVoiceModelOptions builder
     */
    public UpdateVoiceModelOptionsBuilder words(List<Word> words) {
      this.words = words;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateVoiceModelOptions builder
     */
    public UpdateVoiceModelOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Information about an available voice model.
   */
  public class Voice extends IBMWatsonResponseModel {
    private String url;
    private String gender;
    private String name;
    private String language;
    private String description;
    private Boolean customizable;
    private SupportedFeatures supportedFeatures;
    private VoiceModel customization;

    /**
     * Gets the url.
     *
     * The URI of the voice.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the gender.
     *
     * The gender of the voice: `male` or `female`.
     *
     * @return the gender
     */
    @AuraEnabled
    public String getGender() {
      return gender;
    }

    /**
     * Gets the name.
     *
     * The name of the voice. Use this as the voice identifier in all requests.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the language.
     *
     * The language and region of the voice (for example, `en-US`).
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the description.
     *
     * A textual description of the voice.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the customizable.
     *
     * If `true`, the voice can be customized; if `false`, the voice cannot be customized. (Same as
     * `custom_pronunciation`; maintained for backward compatibility.).
     *
     * @return the customizable
     */
    @AuraEnabled
    public Boolean getCustomizable() {
      return customizable;
    }

    /**
     * Gets the supportedFeatures.
     *
     * Additional service features that are supported with the voice.
     *
     * @return the supportedFeatures
     */
    @AuraEnabled
    public SupportedFeatures getSupportedFeatures() {
      return supportedFeatures;
    }

    /**
     * Gets the customization.
     *
     * Returns information about a specified custom voice model. This field is returned only by the **Get a voice**
     * method and only when you specify the customization ID of a custom voice model.
     *
     * @return the customization
     */
    @AuraEnabled
    public VoiceModel getCustomization() {
      return customization;
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
     * Sets the gender.
     *
     * @param gender the new gender
     */
    public void setGender(final String gender) {
      this.gender = gender;
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
     * Sets the language.
     *
     * @param language the new language
     */
    public void setLanguage(final String language) {
      this.language = language;
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
     * Sets the customizable.
     *
     * @param customizable the new customizable
     */
    public void setCustomizable(final Boolean customizable) {
      this.customizable = customizable;
    }

    /**
     * Sets the supportedFeatures.
     *
     * @param supportedFeatures the new supportedFeatures
     */
    public void setSupportedFeatures(final SupportedFeatures supportedFeatures) {
      this.supportedFeatures = supportedFeatures;
    }

    /**
     * Sets the customization.
     *
     * @param customization the new customization
     */
    public void setCustomization(final VoiceModel customization) {
      this.customization = customization;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'supported_features' => 'supportedFeatures'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Voice ret = (Voice) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for supportedFeatures
      Map<String, Object> supportedFeaturesMap = (Map<String, Object>) jsonMap.get('supportedFeatures');
      SupportedFeatures newSupportedFeatures = (SupportedFeatures) new SupportedFeatures().deserialize(JSON.serialize(supportedFeaturesMap, true), supportedFeaturesMap, SupportedFeatures.class);
      ret.setSupportedFeatures(newSupportedFeatures);

      // calling custom deserializer for customization
      Map<String, Object> customizationMap = (Map<String, Object>) jsonMap.get('customization');
      VoiceModel newCustomization = (VoiceModel) new VoiceModel().deserialize(JSON.serialize(customizationMap, true), customizationMap, VoiceModel.class);
      ret.setCustomization(newCustomization);

      return ret;
    }
  }

  /**
   * Information about an existing custom voice model.
   */
  public class VoiceModel extends IBMWatsonResponseModel {
    private String customizationId;
    private String name;
    private String language;
    private String owner;
    private String created;
    private String lastModified;
    private String description;
    private List<Word> words;

    /**
     * Gets the customizationId.
     *
     * The customization ID (GUID) of the custom voice model. The **Create a custom model** method returns only this
     * field. It does not not return the other fields of this object.
     *
     * @return the customizationId
     */
    @AuraEnabled
    public String getCustomizationId() {
      return customizationId;
    }

    /**
     * Gets the name.
     *
     * The name of the custom voice model.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the language.
     *
     * The language identifier of the custom voice model (for example, `en-US`).
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the owner.
     *
     * The GUID of the credentials for the instance of the service that owns the custom voice model.
     *
     * @return the owner
     */
    @AuraEnabled
    public String getOwner() {
      return owner;
    }

    /**
     * Gets the created.
     *
     * The date and time in Coordinated Universal Time (UTC) at which the custom voice model was created. The value is
     * provided in full ISO 8601 format (`YYYY-MM-DDThh:mm:ss.sTZD`).
     *
     * @return the created
     */
    @AuraEnabled
    public String getCreated() {
      return created;
    }

    /**
     * Gets the lastModified.
     *
     * The date and time in Coordinated Universal Time (UTC) at which the custom voice model was last modified. The
     * `created` and `updated` fields are equal when a voice model is first added but has yet to be updated. The value
     * is provided in full ISO 8601 format (`YYYY-MM-DDThh:mm:ss.sTZD`).
     *
     * @return the lastModified
     */
    @AuraEnabled
    public String getLastModified() {
      return lastModified;
    }

    /**
     * Gets the description.
     *
     * The description of the custom voice model.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the words.
     *
     * An array of `Word` objects that lists the words and their translations from the custom voice model. The words are
     * listed in alphabetical order, with uppercase letters listed before lowercase letters. The array is empty if the
     * custom model contains no words. This field is returned only by the **Get a voice** method and only when you
     * specify the customization ID of a custom voice model.
     *
     * @return the words
     */
    @AuraEnabled
    public List<Word> getWords() {
      return words;
    }

    /**
     * Sets the customizationId.
     *
     * @param customizationId the new customizationId
     */
    public void setCustomizationId(final String customizationId) {
      this.customizationId = customizationId;
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
     * Sets the language.
     *
     * @param language the new language
     */
    public void setLanguage(final String language) {
      this.language = language;
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
     * Sets the created.
     *
     * @param created the new created
     */
    public void setCreated(final String created) {
      this.created = created;
    }

    /**
     * Sets the lastModified.
     *
     * @param lastModified the new lastModified
     */
    public void setLastModified(final String lastModified) {
      this.lastModified = lastModified;
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
     * Sets the words.
     *
     * @param words the new words
     */
    public void setWords(final List<Word> words) {
      this.words = words;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'customization_id' => 'customizationId',
        'last_modified' => 'lastModified'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      VoiceModel ret = (VoiceModel) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for words
      List<Word> newWords = new List<Word>();
      List<Word> deserializedWords = ret.getWords();
      if (deserializedWords != null) {
        for (Integer i = 0; i < deserializedWords.size(); i++) {
          Word currentItem = ret.getWords().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('words');
          Word newItem = (Word) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Word.class);
          newWords.add(newItem);
        }
        ret.words = newWords;
      }

      return ret;
    }
  }

  /**
   * Information about existing custom voice models.
   */
  public class VoiceModels extends IBMWatsonResponseModel {
    private List<VoiceModel> customizations;

    /**
     * Gets the customizations.
     *
     * An array of `VoiceModel` objects that provides information about each available custom voice model. The array is
     * empty if the requesting credentials own no custom voice models (if no language is specified) or own no custom
     * voice models for the specified language.
     *
     * @return the customizations
     */
    @AuraEnabled
    public List<VoiceModel> getCustomizations() {
      return customizations;
    }

    /**
     * Sets the customizations.
     *
     * @param customizations the new customizations
     */
    public void setCustomizations(final List<VoiceModel> customizations) {
      this.customizations = customizations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      VoiceModels ret = (VoiceModels) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for customizations
      List<VoiceModel> newCustomizations = new List<VoiceModel>();
      List<VoiceModel> deserializedCustomizations = ret.getCustomizations();
      if (deserializedCustomizations != null) {
        for (Integer i = 0; i < deserializedCustomizations.size(); i++) {
          VoiceModel currentItem = ret.getCustomizations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('customizations');
          VoiceModel newItem = (VoiceModel) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), VoiceModel.class);
          newCustomizations.add(newItem);
        }
        ret.customizations = newCustomizations;
      }

      return ret;
    }
  }

  /**
   * Information about all available voice models.
   */
  public class Voices extends IBMWatsonResponseModel {
    private List<Voice> voices;

    /**
     * Gets the voices.
     *
     * A list of available voices.
     *
     * @return the voices
     */
    @AuraEnabled
    public List<Voice> getVoices() {
      return voices;
    }

    /**
     * Sets the voices.
     *
     * @param voices the new voices
     */
    public void setVoices(final List<Voice> voices) {
      this.voices = voices;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Voices ret = (Voices) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for voices
      List<Voice> newVoices = new List<Voice>();
      List<Voice> deserializedVoices = ret.getVoices();
      if (deserializedVoices != null) {
        for (Integer i = 0; i < deserializedVoices.size(); i++) {
          Voice currentItem = ret.getVoices().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('voices');
          Voice newItem = (Voice) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Voice.class);
          newVoices.add(newItem);
        }
        ret.voices = newVoices;
      }

      return ret;
    }
  }

  /**
   * Information about a word for the custom voice model.
   */
  public class Word extends IBMWatsonGenericModel {
    private String word;
    private String translation;
    private String partOfSpeech;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Word() { }

    /**
     * Gets the word.
     *
     * The word for the custom voice model.
     *
     * @return the word
     */
    @AuraEnabled
    public String getWord() {
      return word;
    }

    /**
     * Gets the translation.
     *
     * The phonetic or sounds-like translation for the word. A phonetic translation is based on the SSML format for
     * representing the phonetic string of a word either as an IPA or IBM SPR translation. A sounds-like translation
     * consists of one or more words that, when combined, sound like the word.
     *
     * @return the translation
     */
    @AuraEnabled
    public String getTranslation() {
      return translation;
    }

    /**
     * Gets the partOfSpeech.
     *
     * **Japanese only.** The part of speech for the word. The service uses the value to produce the correct intonation
     * for the word. You can create only a single entry, with or without a single part of speech, for any word; you
     * cannot create multiple entries with different parts of speech for the same word. For more information, see
     * [Working with Japanese
     * entries](https://cloud.ibm.com/docs/text-to-speech?topic=text-to-speech-rules#jaNotes).
     *
     * @return the partOfSpeech
     */
    @AuraEnabled
    public String getPartOfSpeech() {
      return partOfSpeech;
    }
  
    private Word(WordBuilder builder) {
      IBMWatsonValidator.notNull(builder.word, 'word cannot be null');
      IBMWatsonValidator.notNull(builder.translation, 'translation cannot be null');
      this.word = builder.word;
      this.translation = builder.translation;
      this.partOfSpeech = builder.partOfSpeech;
    }

    /**
     * New builder.
     *
     * @return a Word builder
     */
    public WordBuilder newBuilder() {
      return new WordBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'part_of_speech' => 'partOfSpeech'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Word ret = (Word) super.deserialize(jsonString, jsonMap, classType);
      WordBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
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
   * Word Builder.
   */
  public class WordBuilder {
    private String word;
    private String translation;
    private String partOfSpeech;

    private WordBuilder(Word word) {
      this.word = word.word;
      this.translation = word.translation;
      this.partOfSpeech = word.partOfSpeech;
    }

    /**
     * Instantiates a new builder.
     */
    public WordBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param word the word
     * @param translation the translation
     */
    public WordBuilder(String word, String translation) {
      this.word = word;
      this.translation = translation;
    }

    /**
     * Builds a Word.
     *
     * @return the word
     */
    public Word build() {
      return new Word(this);
    }

    /**
     * Set the word.
     *
     * @param word the word
     * @return the Word builder
     */
    public WordBuilder word(String word) {
      this.word = word;
      return this;
    }

    /**
     * Set the translation.
     *
     * @param translation the translation
     * @return the Word builder
     */
    public WordBuilder translation(String translation) {
      this.translation = translation;
      return this;
    }

    /**
     * Set the partOfSpeech.
     *
     * @param partOfSpeech the partOfSpeech
     * @return the Word builder
     */
    public WordBuilder partOfSpeech(String partOfSpeech) {
      this.partOfSpeech = partOfSpeech;
      return this;
    }
  }

  /**
   * For the **Add custom words** method, one or more words that are to be added or updated for the custom voice model
   * and the translation for each specified word.
   *
   * For the **List custom words** method, the words and their translations from the custom voice model.
   */
  public class Words extends IBMWatsonResponseModel {
    private List<Word> words;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Words() { }

    /**
     * Gets the words.
     *
     * The **Add custom words** method accepts an array of `Word` objects. Each object provides a word that is to be
     * added or updated for the custom voice model and the word's translation.
     *
     * The **List custom words** method returns an array of `Word` objects. Each object shows a word and its translation
     * from the custom voice model. The words are listed in alphabetical order, with uppercase letters listed before
     * lowercase letters. The array is empty if the custom model contains no words.
     *
     * @return the words
     */
    @AuraEnabled
    public List<Word> getWords() {
      return words;
    }
  
    private Words(WordsBuilder builder) {
      IBMWatsonValidator.notNull(builder.words, 'words cannot be null');
      this.words = builder.words;
    }

    /**
     * New builder.
     *
     * @return a Words builder
     */
    public WordsBuilder newBuilder() {
      return new WordsBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Words ret = (Words) super.deserialize(jsonString, jsonMap, classType);
      WordsBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for words
      List<Word> newWords = new List<Word>();
      List<Word> deserializedWords = ret.getWords();
      if (deserializedWords != null) {
        for (Integer i = 0; i < deserializedWords.size(); i++) {
          Word currentItem = ret.getWords().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('words');
          Word newItem = (Word) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Word.class);
          newWords.add(newItem);
        }
        retBuilder.words(newWords);
      }

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for words
      if (words != null) {
        List<Object> wordsJsonList = new List<Object>();
        for (Word listItem : words) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          wordsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('words', wordsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * Words Builder.
   */
  public class WordsBuilder {
    private List<Word> words;

    private WordsBuilder(Words words) {
      this.words = words.words;
    }

    /**
     * Instantiates a new builder.
     */
    public WordsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param words the words
     */
    public WordsBuilder(List<Word> words) {
      this.words = words;
    }

    /**
     * Builds a Words.
     *
     * @return the words
     */
    public Words build() {
      return new Words(this);
    }

    /**
     * Adds an words to words.
     *
     * @param words the new words
     * @return the Words builder
     */
    public WordsBuilder addWords(Word words) {
      IBMWatsonValidator.notNull(words, 'words cannot be null');
      if (this.words == null) {
        this.words = new List<Word>();
      }
      this.words.add(words);
      return this;
    }

    /**
     * Set the words.
     * Existing words will be replaced.
     *
     * @param words the words
     * @return the Words builder
     */
    public WordsBuilder words(List<Word> words) {
      this.words = words;
      return this;
    }
  }

}