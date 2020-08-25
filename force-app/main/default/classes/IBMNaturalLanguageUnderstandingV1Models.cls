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

public class IBMNaturalLanguageUnderstandingV1Models {
  /**
   * Results of the analysis, organized by feature.
   */
  public class AnalysisResults extends IBMWatsonResponseModel {
    private String language;
    private String analyzedText;
    private String retrievedUrl;
    private AnalysisResultsUsage usage;
    private List<ConceptsResult> concepts;
    private List<EntitiesResult> entities;
    private List<KeywordsResult> keywords;
    private List<CategoriesResult> categories;
    private EmotionResult emotion;
    private AnalysisResultsMetadata metadata;
    private List<RelationsResult> relations;
    private List<SemanticRolesResult> semanticRoles;
    private SentimentResult sentiment;
    private SyntaxResult syntax;

    /**
     * Gets the language.
     *
     * Language used to analyze the text.
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
    }

    /**
     * Gets the analyzedText.
     *
     * Text that was used in the analysis.
     *
     * @return the analyzedText
     */
    @AuraEnabled
    public String getAnalyzedText() {
      return analyzedText;
    }

    /**
     * Gets the retrievedUrl.
     *
     * URL of the webpage that was analyzed.
     *
     * @return the retrievedUrl
     */
    @AuraEnabled
    public String getRetrievedUrl() {
      return retrievedUrl;
    }

    /**
     * Gets the usage.
     *
     * API usage information for the request.
     *
     * @return the usage
     */
    @AuraEnabled
    public AnalysisResultsUsage getUsage() {
      return usage;
    }

    /**
     * Gets the concepts.
     *
     * The general concepts referenced or alluded to in the analyzed text.
     *
     * @return the concepts
     */
    @AuraEnabled
    public List<ConceptsResult> getConcepts() {
      return concepts;
    }

    /**
     * Gets the entities.
     *
     * The entities detected in the analyzed text.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<EntitiesResult> getEntities() {
      return entities;
    }

    /**
     * Gets the keywords.
     *
     * The keywords from the analyzed text.
     *
     * @return the keywords
     */
    @AuraEnabled
    public List<KeywordsResult> getKeywords() {
      return keywords;
    }

    /**
     * Gets the categories.
     *
     * The categories that the service assigned to the analyzed text.
     *
     * @return the categories
     */
    @AuraEnabled
    public List<CategoriesResult> getCategories() {
      return categories;
    }

    /**
     * Gets the emotion.
     *
     * The anger, disgust, fear, joy, or sadness conveyed by the content.
     *
     * @return the emotion
     */
    @AuraEnabled
    public EmotionResult getEmotion() {
      return emotion;
    }

    /**
     * Gets the metadata.
     *
     * Webpage metadata, such as the author and the title of the page.
     *
     * @return the metadata
     */
    @AuraEnabled
    public AnalysisResultsMetadata getMetadata() {
      return metadata;
    }

    /**
     * Gets the relations.
     *
     * The relationships between entities in the content.
     *
     * @return the relations
     */
    @AuraEnabled
    public List<RelationsResult> getRelations() {
      return relations;
    }

    /**
     * Gets the semanticRoles.
     *
     * Sentences parsed into `subject`, `action`, and `object` form.
     *
     * @return the semanticRoles
     */
    @AuraEnabled
    public List<SemanticRolesResult> getSemanticRoles() {
      return semanticRoles;
    }

    /**
     * Gets the sentiment.
     *
     * The sentiment of the content.
     *
     * @return the sentiment
     */
    @AuraEnabled
    public SentimentResult getSentiment() {
      return sentiment;
    }

    /**
     * Gets the syntax.
     *
     * Tokens and sentences returned from syntax analysis.
     *
     * @return the syntax
     */
    @AuraEnabled
    public SyntaxResult getSyntax() {
      return syntax;
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
     * Sets the analyzedText.
     *
     * @param analyzedText the new analyzedText
     */
    public void setAnalyzedText(final String analyzedText) {
      this.analyzedText = analyzedText;
    }

    /**
     * Sets the retrievedUrl.
     *
     * @param retrievedUrl the new retrievedUrl
     */
    public void setRetrievedUrl(final String retrievedUrl) {
      this.retrievedUrl = retrievedUrl;
    }

    /**
     * Sets the usage.
     *
     * @param usage the new usage
     */
    public void setUsage(final AnalysisResultsUsage usage) {
      this.usage = usage;
    }

    /**
     * Sets the concepts.
     *
     * @param concepts the new concepts
     */
    public void setConcepts(final List<ConceptsResult> concepts) {
      this.concepts = concepts;
    }

    /**
     * Sets the entities.
     *
     * @param entities the new entities
     */
    public void setEntities(final List<EntitiesResult> entities) {
      this.entities = entities;
    }

    /**
     * Sets the keywords.
     *
     * @param keywords the new keywords
     */
    public void setKeywords(final List<KeywordsResult> keywords) {
      this.keywords = keywords;
    }

    /**
     * Sets the categories.
     *
     * @param categories the new categories
     */
    public void setCategories(final List<CategoriesResult> categories) {
      this.categories = categories;
    }

    /**
     * Sets the emotion.
     *
     * @param emotion the new emotion
     */
    public void setEmotion(final EmotionResult emotion) {
      this.emotion = emotion;
    }

    /**
     * Sets the metadata.
     *
     * @param metadata the new metadata
     */
    public void setMetadata(final AnalysisResultsMetadata metadata) {
      this.metadata = metadata;
    }

    /**
     * Sets the relations.
     *
     * @param relations the new relations
     */
    public void setRelations(final List<RelationsResult> relations) {
      this.relations = relations;
    }

    /**
     * Sets the semanticRoles.
     *
     * @param semanticRoles the new semanticRoles
     */
    public void setSemanticRoles(final List<SemanticRolesResult> semanticRoles) {
      this.semanticRoles = semanticRoles;
    }

    /**
     * Sets the sentiment.
     *
     * @param sentiment the new sentiment
     */
    public void setSentiment(final SentimentResult sentiment) {
      this.sentiment = sentiment;
    }

    /**
     * Sets the syntax.
     *
     * @param syntax the new syntax
     */
    public void setSyntax(final SyntaxResult syntax) {
      this.syntax = syntax;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'analyzed_text' => 'analyzedText',
        'retrieved_url' => 'retrievedUrl',
        'semantic_roles' => 'semanticRoles'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      AnalysisResults ret = (AnalysisResults) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for usage
      Map<String, Object> usageMap = (Map<String, Object>) jsonMap.get('usage');
      AnalysisResultsUsage newUsage = (AnalysisResultsUsage) new AnalysisResultsUsage().deserialize(JSON.serialize(usageMap, true), usageMap, AnalysisResultsUsage.class);
      ret.setUsage(newUsage);

      // calling custom deserializer for concepts
      List<ConceptsResult> newConcepts = new List<ConceptsResult>();
      List<ConceptsResult> deserializedConcepts = ret.getConcepts();
      if (deserializedConcepts != null) {
        for (Integer i = 0; i < deserializedConcepts.size(); i++) {
          ConceptsResult currentItem = ret.getConcepts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('concepts');
          ConceptsResult newItem = (ConceptsResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ConceptsResult.class);
          newConcepts.add(newItem);
        }
        ret.concepts = newConcepts;
      }

      // calling custom deserializer for entities
      List<EntitiesResult> newEntities = new List<EntitiesResult>();
      List<EntitiesResult> deserializedEntities = ret.getEntities();
      if (deserializedEntities != null) {
        for (Integer i = 0; i < deserializedEntities.size(); i++) {
          EntitiesResult currentItem = ret.getEntities().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('entities');
          EntitiesResult newItem = (EntitiesResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), EntitiesResult.class);
          newEntities.add(newItem);
        }
        ret.entities = newEntities;
      }

      // calling custom deserializer for keywords
      List<KeywordsResult> newKeywords = new List<KeywordsResult>();
      List<KeywordsResult> deserializedKeywords = ret.getKeywords();
      if (deserializedKeywords != null) {
        for (Integer i = 0; i < deserializedKeywords.size(); i++) {
          KeywordsResult currentItem = ret.getKeywords().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('keywords');
          KeywordsResult newItem = (KeywordsResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), KeywordsResult.class);
          newKeywords.add(newItem);
        }
        ret.keywords = newKeywords;
      }

      // calling custom deserializer for categories
      List<CategoriesResult> newCategories = new List<CategoriesResult>();
      List<CategoriesResult> deserializedCategories = ret.getCategories();
      if (deserializedCategories != null) {
        for (Integer i = 0; i < deserializedCategories.size(); i++) {
          CategoriesResult currentItem = ret.getCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('categories');
          CategoriesResult newItem = (CategoriesResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), CategoriesResult.class);
          newCategories.add(newItem);
        }
        ret.categories = newCategories;
      }

      // calling custom deserializer for emotion
      Map<String, Object> emotionMap = (Map<String, Object>) jsonMap.get('emotion');
      EmotionResult newEmotion = (EmotionResult) new EmotionResult().deserialize(JSON.serialize(emotionMap, true), emotionMap, EmotionResult.class);
      ret.setEmotion(newEmotion);

      // calling custom deserializer for metadata
      Map<String, Object> metadataMap = (Map<String, Object>) jsonMap.get('metadata');
      AnalysisResultsMetadata newMetadata = (AnalysisResultsMetadata) new AnalysisResultsMetadata().deserialize(JSON.serialize(metadataMap, true), metadataMap, AnalysisResultsMetadata.class);
      ret.setMetadata(newMetadata);

      // calling custom deserializer for relations
      List<RelationsResult> newRelations = new List<RelationsResult>();
      List<RelationsResult> deserializedRelations = ret.getRelations();
      if (deserializedRelations != null) {
        for (Integer i = 0; i < deserializedRelations.size(); i++) {
          RelationsResult currentItem = ret.getRelations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('relations');
          RelationsResult newItem = (RelationsResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RelationsResult.class);
          newRelations.add(newItem);
        }
        ret.relations = newRelations;
      }

      // calling custom deserializer for semanticRoles
      List<SemanticRolesResult> newSemanticRoles = new List<SemanticRolesResult>();
      List<SemanticRolesResult> deserializedSemanticRoles = ret.getSemanticRoles();
      if (deserializedSemanticRoles != null) {
        for (Integer i = 0; i < deserializedSemanticRoles.size(); i++) {
          SemanticRolesResult currentItem = ret.getSemanticRoles().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('semanticRoles');
          SemanticRolesResult newItem = (SemanticRolesResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SemanticRolesResult.class);
          newSemanticRoles.add(newItem);
        }
        ret.semanticRoles = newSemanticRoles;
      }

      // calling custom deserializer for sentiment
      Map<String, Object> sentimentMap = (Map<String, Object>) jsonMap.get('sentiment');
      SentimentResult newSentiment = (SentimentResult) new SentimentResult().deserialize(JSON.serialize(sentimentMap, true), sentimentMap, SentimentResult.class);
      ret.setSentiment(newSentiment);

      // calling custom deserializer for syntax
      Map<String, Object> syntaxMap = (Map<String, Object>) jsonMap.get('syntax');
      SyntaxResult newSyntax = (SyntaxResult) new SyntaxResult().deserialize(JSON.serialize(syntaxMap, true), syntaxMap, SyntaxResult.class);
      ret.setSyntax(newSyntax);

      return ret;
    }
  }

  /**
   * Webpage metadata, such as the author and the title of the page.
   */
  public class AnalysisResultsMetadata extends IBMWatsonGenericModel {
    private List<Author> authors;
    private String publicationDate;
    private String title;
    private String image;
    private List<Feed> feeds;

    /**
     * Gets the authors.
     *
     * The authors of the document.
     *
     * @return the authors
     */
    @AuraEnabled
    public List<Author> getAuthors() {
      return authors;
    }

    /**
     * Gets the publicationDate.
     *
     * The publication date in the format ISO 8601.
     *
     * @return the publicationDate
     */
    @AuraEnabled
    public String getPublicationDate() {
      return publicationDate;
    }

    /**
     * Gets the title.
     *
     * The title of the document.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the image.
     *
     * URL of a prominent image on the webpage.
     *
     * @return the image
     */
    @AuraEnabled
    public String getImage() {
      return image;
    }

    /**
     * Gets the feeds.
     *
     * RSS/ATOM feeds found on the webpage.
     *
     * @return the feeds
     */
    @AuraEnabled
    public List<Feed> getFeeds() {
      return feeds;
    }

    /**
     * Sets the authors.
     *
     * @param authors the new authors
     */
    public void setAuthors(final List<Author> authors) {
      this.authors = authors;
    }

    /**
     * Sets the publicationDate.
     *
     * @param publicationDate the new publicationDate
     */
    public void setPublicationDate(final String publicationDate) {
      this.publicationDate = publicationDate;
    }

    /**
     * Sets the title.
     *
     * @param title the new title
     */
    public void setTitle(final String title) {
      this.title = title;
    }

    /**
     * Sets the image.
     *
     * @param image the new image
     */
    public void setImage(final String image) {
      this.image = image;
    }

    /**
     * Sets the feeds.
     *
     * @param feeds the new feeds
     */
    public void setFeeds(final List<Feed> feeds) {
      this.feeds = feeds;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'publication_date' => 'publicationDate'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      AnalysisResultsMetadata ret = (AnalysisResultsMetadata) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for authors
      List<Author> newAuthors = new List<Author>();
      List<Author> deserializedAuthors = ret.getAuthors();
      if (deserializedAuthors != null) {
        for (Integer i = 0; i < deserializedAuthors.size(); i++) {
          Author currentItem = ret.getAuthors().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('authors');
          Author newItem = (Author) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Author.class);
          newAuthors.add(newItem);
        }
        ret.authors = newAuthors;
      }

      // calling custom deserializer for feeds
      List<Feed> newFeeds = new List<Feed>();
      List<Feed> deserializedFeeds = ret.getFeeds();
      if (deserializedFeeds != null) {
        for (Integer i = 0; i < deserializedFeeds.size(); i++) {
          Feed currentItem = ret.getFeeds().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('feeds');
          Feed newItem = (Feed) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Feed.class);
          newFeeds.add(newItem);
        }
        ret.feeds = newFeeds;
      }

      return ret;
    }
  }

  /**
   * API usage information for the request.
   */
  public class AnalysisResultsUsage extends IBMWatsonGenericModel {
    private Long features;
    private Long textCharacters;
    private Long textUnits;

    /**
     * Gets the features.
     *
     * Number of features used in the API call.
     *
     * @return the features
     */
    @AuraEnabled
    public Long getFeatures() {
      return features;
    }

    /**
     * Gets the textCharacters.
     *
     * Number of text characters processed.
     *
     * @return the textCharacters
     */
    @AuraEnabled
    public Long getTextCharacters() {
      return textCharacters;
    }

    /**
     * Gets the textUnits.
     *
     * Number of 10,000-character units processed.
     *
     * @return the textUnits
     */
    @AuraEnabled
    public Long getTextUnits() {
      return textUnits;
    }

    /**
     * Sets the features.
     *
     * @param features the new features
     */
    public void setFeatures(final long features) {
      this.features = features;
    }

    /**
     * Sets the textCharacters.
     *
     * @param textCharacters the new textCharacters
     */
    public void setTextCharacters(final long textCharacters) {
      this.textCharacters = textCharacters;
    }

    /**
     * Sets the textUnits.
     *
     * @param textUnits the new textUnits
     */
    public void setTextUnits(final long textUnits) {
      this.textUnits = textUnits;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'text_characters' => 'textCharacters',
        'text_units' => 'textUnits'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      AnalysisResultsUsage ret = (AnalysisResultsUsage) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The analyze options.
   */
  public class AnalyzeOptions extends IBMWatsonOptionsModel {
    private Features features;
    private String text;
    private String html;
    private String url;
    private Boolean clean;
    private String xpath;
    private Boolean fallbackToRaw;
    private Boolean returnAnalyzedText;
    private String language;
    private Long limitTextCharacters;

    /**
     * Gets the features.
     *
     * Specific features to analyze the document for.
     *
     * @return the features
     */
    public Features features() {
      return features;
    }

    /**
     * Gets the text.
     *
     * The plain text to analyze. One of the `text`, `html`, or `url` parameters is required.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    /**
     * Gets the html.
     *
     * The HTML file to analyze. One of the `text`, `html`, or `url` parameters is required.
     *
     * @return the html
     */
    public String html() {
      return html;
    }

    /**
     * Gets the url.
     *
     * The webpage to analyze. One of the `text`, `html`, or `url` parameters is required.
     *
     * @return the url
     */
    public String url() {
      return url;
    }

    /**
     * Gets the clean.
     *
     * Set this to `false` to disable webpage cleaning. To learn more about webpage cleaning, see the [Analyzing
     * webpages](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-analyzing-webpages)
     * documentation.
     *
     * @return the clean
     */
    public Boolean clean() {
      return clean;
    }

    /**
     * Gets the xpath.
     *
     * An [XPath
     * query](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-analyzing-webpages#xpath)
     * to perform on `html` or `url` input. Results of the query will be appended to the cleaned webpage text before it
     * is analyzed. To analyze only the results of the XPath query, set the `clean` parameter to `false`.
     *
     * @return the xpath
     */
    public String xpath() {
      return xpath;
    }

    /**
     * Gets the fallbackToRaw.
     *
     * Whether to use raw HTML content if text cleaning fails.
     *
     * @return the fallbackToRaw
     */
    public Boolean fallbackToRaw() {
      return fallbackToRaw;
    }

    /**
     * Gets the returnAnalyzedText.
     *
     * Whether or not to return the analyzed text.
     *
     * @return the returnAnalyzedText
     */
    public Boolean returnAnalyzedText() {
      return returnAnalyzedText;
    }

    /**
     * Gets the language.
     *
     * ISO 639-1 code that specifies the language of your text. This overrides automatic language detection. Language
     * support differs depending on the features you include in your analysis. See [Language
     * support](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-language-support)
     * for more information.
     *
     * @return the language
     */
    public String language() {
      return language;
    }

    /**
     * Gets the limitTextCharacters.
     *
     * Sets the maximum number of characters that are processed by the service.
     *
     * @return the limitTextCharacters
     */
    public Long limitTextCharacters() {
      return limitTextCharacters;
    }

    private AnalyzeOptions(AnalyzeOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.features, 'features cannot be null');
      features = builder.features;
      text = builder.text;
      html = builder.html;
      url = builder.url;
      clean = builder.clean;
      xpath = builder.xpath;
      fallbackToRaw = builder.fallbackToRaw;
      returnAnalyzedText = builder.returnAnalyzedText;
      language = builder.language;
      limitTextCharacters = builder.limitTextCharacters;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder newBuilder() {
      return new AnalyzeOptionsBuilder(this);
    }
  }

  /**
   * AnalyzeOptions Builder.
   */
  public class AnalyzeOptionsBuilder extends IBMWatsonOptionsModel {
    private Features features;
    private String text;
    private String html;
    private String url;
    private Boolean clean;
    private String xpath;
    private Boolean fallbackToRaw;
    private Boolean returnAnalyzedText;
    private String language;
    private Long limitTextCharacters;

    private AnalyzeOptionsBuilder(AnalyzeOptions analyzeOptions) {
      features = analyzeOptions.features;
      text = analyzeOptions.text;
      html = analyzeOptions.html;
      url = analyzeOptions.url;
      clean = analyzeOptions.clean;
      xpath = analyzeOptions.xpath;
      fallbackToRaw = analyzeOptions.fallbackToRaw;
      returnAnalyzedText = analyzeOptions.returnAnalyzedText;
      language = analyzeOptions.language;
      limitTextCharacters = analyzeOptions.limitTextCharacters;
      this.requestHeaders.putAll(analyzeOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AnalyzeOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param features the features
     */
    public AnalyzeOptionsBuilder(Features features) {
      this.features = features;
    }

    /**
     * Builds a AnalyzeOptions.
     *
     * @return the analyzeOptions
     */
    public AnalyzeOptions build() {
      return new AnalyzeOptions(this);
    }

    /**
     * Set the features.
     *
     * @param features the features
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder features(Features features) {
      this.features = features;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the html.
     *
     * @param html the html
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder html(String html) {
      this.html = html;
      return this;
    }

    /**
     * Set the url.
     *
     * @param url the url
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder url(String url) {
      this.url = url;
      return this;
    }

    /**
     * Set the clean.
     *
     * @param clean the clean
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder clean(Boolean clean) {
      this.clean = clean;
      return this;
    }

    /**
     * Set the xpath.
     *
     * @param xpath the xpath
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder xpath(String xpath) {
      this.xpath = xpath;
      return this;
    }

    /**
     * Set the fallbackToRaw.
     *
     * @param fallbackToRaw the fallbackToRaw
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder fallbackToRaw(Boolean fallbackToRaw) {
      this.fallbackToRaw = fallbackToRaw;
      return this;
    }

    /**
     * Set the returnAnalyzedText.
     *
     * @param returnAnalyzedText the returnAnalyzedText
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder returnAnalyzedText(Boolean returnAnalyzedText) {
      this.returnAnalyzedText = returnAnalyzedText;
      return this;
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Set the limitTextCharacters.
     *
     * @param limitTextCharacters the limitTextCharacters
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder limitTextCharacters(Long limitTextCharacters) {
      this.limitTextCharacters = limitTextCharacters;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The author of the analyzed content.
   */
  public class Author extends IBMWatsonGenericModel {
    private String name;

    /**
     * Gets the name.
     *
     * Name of the author.
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

      Author ret = (Author) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Returns a five-level taxonomy of the content. The top three categories are returned.
   *
   * Supported languages: Arabic, English, French, German, Italian, Japanese, Korean, Portuguese, Spanish.
   */
  public class CategoriesOptions extends IBMWatsonGenericModel {
    private Boolean explanation;
    private Long xLimit;
    private String model;

    /**
     * Gets the explanation.
     *
     * Set this to `true` to return explanations for each categorization. **This is available only for English
     * categories.**.
     *
     * @return the explanation
     */
    public Boolean explanation() {
      return explanation;
    }

    /**
     * Gets the xLimit.
     *
     * Maximum number of categories to return.
     *
     * @return the xLimit
     */
    public Long xLimit() {
      return xLimit;
    }

    /**
     * Gets the model.
     *
     * Enter a [custom
     * model](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-customizing)
     * ID to override the standard categories model.
     *
     * @return the model
     * @deprecated the model parameter is no longer supported by the Natural Language Understanding service and will
     * be removed in the next major release
     */
    public String model() {
      return model;
    }
  
    private CategoriesOptions(CategoriesOptionsBuilder builder) {
      this.explanation = builder.explanation;
      this.xLimit = builder.xLimit;
      this.model = builder.model;
    }

    /**
     * New builder.
     *
     * @return a CategoriesOptions builder
     */
    public CategoriesOptionsBuilder newBuilder() {
      return new CategoriesOptionsBuilder(this);
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
   * CategoriesOptions Builder.
   */
  public class CategoriesOptionsBuilder {
    private Boolean explanation;
    private Long xLimit;
    private String model;

    private CategoriesOptionsBuilder(CategoriesOptions categoriesOptions) {
      this.explanation = categoriesOptions.explanation;
      this.xLimit = categoriesOptions.xLimit;
      this.model = categoriesOptions.model;
    }

    /**
     * Instantiates a new builder.
     */
    public CategoriesOptionsBuilder() {
    }

    /**
     * Builds a CategoriesOptions.
     *
     * @return the categoriesOptions
     */
    public CategoriesOptions build() {
      return new CategoriesOptions(this);
    }

    /**
     * Set the explanation.
     *
     * @param explanation the explanation
     * @return the CategoriesOptions builder
     */
    public CategoriesOptionsBuilder explanation(Boolean explanation) {
      this.explanation = explanation;
      return this;
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the CategoriesOptions builder
     */
    public CategoriesOptionsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the CategoriesOptions builder
     * @deprecated the model parameter is no longer supported by the Natural Language Understanding service and will
     * be removed in the next major release
     */
    public CategoriesOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }
  }

  /**
   * Relevant text that contributed to the categorization.
   */
  public class CategoriesRelevantText extends IBMWatsonGenericModel {
    private String text;

    /**
     * Gets the text.
     *
     * Text from the analyzed source that supports the categorization.
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

      CategoriesRelevantText ret = (CategoriesRelevantText) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A categorization of the analyzed text.
   */
  public class CategoriesResult extends IBMWatsonGenericModel {
    private String label;
    private Double score;
    private CategoriesResultExplanation explanation;

    /**
     * Gets the label.
     *
     * The path to the category through the 5-level taxonomy hierarchy. For the complete list of categories, see the
     * [Categories
     * hierarchy](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-categories#categories-hierarchy)
     * documentation.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
    }

    /**
     * Gets the score.
     *
     * Confidence score for the category classification. Higher values indicate greater confidence.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Gets the explanation.
     *
     * Information that helps to explain what contributed to the categories result.
     *
     * @return the explanation
     */
    @AuraEnabled
    public CategoriesResultExplanation getExplanation() {
      return explanation;
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
     * Sets the score.
     *
     * @param score the new score
     */
    public void setScore(final Double score) {
      this.score = score;
    }

    /**
     * Sets the explanation.
     *
     * @param explanation the new explanation
     */
    public void setExplanation(final CategoriesResultExplanation explanation) {
      this.explanation = explanation;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      CategoriesResult ret = (CategoriesResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for explanation
      Map<String, Object> explanationMap = (Map<String, Object>) jsonMap.get('explanation');
      CategoriesResultExplanation newExplanation = (CategoriesResultExplanation) new CategoriesResultExplanation().deserialize(JSON.serialize(explanationMap, true), explanationMap, CategoriesResultExplanation.class);
      ret.setExplanation(newExplanation);

      return ret;
    }
  }

  /**
   * Information that helps to explain what contributed to the categories result.
   */
  public class CategoriesResultExplanation extends IBMWatsonGenericModel {
    private List<CategoriesRelevantText> relevantText;

    /**
     * Gets the relevantText.
     *
     * An array of relevant text from the source that contributed to the categorization. The sorted array begins with
     * the phrase that contributed most significantly to the result, followed by phrases that were less and less
     * impactful.
     *
     * @return the relevantText
     */
    @AuraEnabled
    public List<CategoriesRelevantText> getRelevantText() {
      return relevantText;
    }

    /**
     * Sets the relevantText.
     *
     * @param relevantText the new relevantText
     */
    public void setRelevantText(final List<CategoriesRelevantText> relevantText) {
      this.relevantText = relevantText;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'relevant_text' => 'relevantText'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CategoriesResultExplanation ret = (CategoriesResultExplanation) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for relevantText
      List<CategoriesRelevantText> newRelevantText = new List<CategoriesRelevantText>();
      List<CategoriesRelevantText> deserializedRelevantText = ret.getRelevantText();
      if (deserializedRelevantText != null) {
        for (Integer i = 0; i < deserializedRelevantText.size(); i++) {
          CategoriesRelevantText currentItem = ret.getRelevantText().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('relevantText');
          CategoriesRelevantText newItem = (CategoriesRelevantText) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), CategoriesRelevantText.class);
          newRelevantText.add(newItem);
        }
        ret.relevantText = newRelevantText;
      }

      return ret;
    }
  }

  /**
   * Returns high-level concepts in the content. For example, a research paper about deep learning might return the
   * concept, "Artificial Intelligence" although the term is not mentioned.
   *
   * Supported languages: English, French, German, Italian, Japanese, Korean, Portuguese, Spanish.
   */
  public class ConceptsOptions extends IBMWatsonGenericModel {
    private Long xLimit;

    /**
     * Gets the xLimit.
     *
     * Maximum number of concepts to return.
     *
     * @return the xLimit
     */
    public Long xLimit() {
      return xLimit;
    }
  
    private ConceptsOptions(ConceptsOptionsBuilder builder) {
      this.xLimit = builder.xLimit;
    }

    /**
     * New builder.
     *
     * @return a ConceptsOptions builder
     */
    public ConceptsOptionsBuilder newBuilder() {
      return new ConceptsOptionsBuilder(this);
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
   * ConceptsOptions Builder.
   */
  public class ConceptsOptionsBuilder {
    private Long xLimit;

    private ConceptsOptionsBuilder(ConceptsOptions conceptsOptions) {
      this.xLimit = conceptsOptions.xLimit;
    }

    /**
     * Instantiates a new builder.
     */
    public ConceptsOptionsBuilder() {
    }

    /**
     * Builds a ConceptsOptions.
     *
     * @return the conceptsOptions
     */
    public ConceptsOptions build() {
      return new ConceptsOptions(this);
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the ConceptsOptions builder
     */
    public ConceptsOptionsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }
  }

  /**
   * The general concepts referenced or alluded to in the analyzed text.
   */
  public class ConceptsResult extends IBMWatsonGenericModel {
    private String text;
    private Double relevance;
    private String dbpediaResource;

    /**
     * Gets the text.
     *
     * Name of the concept.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the relevance.
     *
     * Relevance score between 0 and 1. Higher scores indicate greater relevance.
     *
     * @return the relevance
     */
    @AuraEnabled
    public Double getRelevance() {
      return relevance;
    }

    /**
     * Gets the dbpediaResource.
     *
     * Link to the corresponding DBpedia resource.
     *
     * @return the dbpediaResource
     */
    @AuraEnabled
    public String getDbpediaResource() {
      return dbpediaResource;
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
     * Sets the relevance.
     *
     * @param relevance the new relevance
     */
    public void setRelevance(final Double relevance) {
      this.relevance = relevance;
    }

    /**
     * Sets the dbpediaResource.
     *
     * @param dbpediaResource the new dbpediaResource
     */
    public void setDbpediaResource(final String dbpediaResource) {
      this.dbpediaResource = dbpediaResource;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dbpedia_resource' => 'dbpediaResource'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ConceptsResult ret = (ConceptsResult) super.deserialize(jsonString, jsonMap, classType);

      return ret;
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
   * Disambiguation information for the entity.
   */
  public class DisambiguationResult extends IBMWatsonGenericModel {
    private String name;
    private String dbpediaResource;
    private List<String> subtype;

    /**
     * Gets the name.
     *
     * Common entity name.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the dbpediaResource.
     *
     * Link to the corresponding DBpedia resource.
     *
     * @return the dbpediaResource
     */
    @AuraEnabled
    public String getDbpediaResource() {
      return dbpediaResource;
    }

    /**
     * Gets the subtype.
     *
     * Entity subtype information.
     *
     * @return the subtype
     */
    @AuraEnabled
    public List<String> getSubtype() {
      return subtype;
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
     * Sets the dbpediaResource.
     *
     * @param dbpediaResource the new dbpediaResource
     */
    public void setDbpediaResource(final String dbpediaResource) {
      this.dbpediaResource = dbpediaResource;
    }

    /**
     * Sets the subtype.
     *
     * @param subtype the new subtype
     */
    public void setSubtype(final List<String> subtype) {
      this.subtype = subtype;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'dbpedia_resource' => 'dbpediaResource'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DisambiguationResult ret = (DisambiguationResult) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Emotion results for the document as a whole.
   */
  public class DocumentEmotionResults extends IBMWatsonGenericModel {
    private EmotionScores emotion;

    /**
     * Gets the emotion.
     *
     * Emotion results for the document as a whole.
     *
     * @return the emotion
     */
    @AuraEnabled
    public EmotionScores getEmotion() {
      return emotion;
    }

    /**
     * Sets the emotion.
     *
     * @param emotion the new emotion
     */
    public void setEmotion(final EmotionScores emotion) {
      this.emotion = emotion;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DocumentEmotionResults ret = (DocumentEmotionResults) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for emotion
      Map<String, Object> emotionMap = (Map<String, Object>) jsonMap.get('emotion');
      EmotionScores newEmotion = (EmotionScores) new EmotionScores().deserialize(JSON.serialize(emotionMap, true), emotionMap, EmotionScores.class);
      ret.setEmotion(newEmotion);

      return ret;
    }
  }

  /**
   * DocumentSentimentResults.
   */
  public class DocumentSentimentResults extends IBMWatsonGenericModel {
    private String label;
    private Double score;

    /**
     * Gets the label.
     *
     * Indicates whether the sentiment is positive, neutral, or negative.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
    }

    /**
     * Gets the score.
     *
     * Sentiment score from -1 (negative) to 1 (positive).
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
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
     * Sets the score.
     *
     * @param score the new score
     */
    public void setScore(final Double score) {
      this.score = score;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DocumentSentimentResults ret = (DocumentSentimentResults) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Detects anger, disgust, fear, joy, or sadness that is conveyed in the content or by the context around target
   * phrases specified in the targets parameter. You can analyze emotion for detected entities with `entities.emotion`
   * and for keywords with `keywords.emotion`.
   *
   * Supported languages: English.
   */
  public class EmotionOptions extends IBMWatsonGenericModel {
    private Boolean document;
    private List<String> targets;

    /**
     * Gets the document.
     *
     * Set this to `false` to hide document-level emotion results.
     *
     * @return the document
     */
    public Boolean document() {
      return document;
    }

    /**
     * Gets the targets.
     *
     * Emotion results will be returned for each target string that is found in the document.
     *
     * @return the targets
     */
    public List<String> targets() {
      return targets;
    }
  
    private EmotionOptions(EmotionOptionsBuilder builder) {
      this.document = builder.document;
      this.targets = builder.targets;
    }

    /**
     * New builder.
     *
     * @return a EmotionOptions builder
     */
    public EmotionOptionsBuilder newBuilder() {
      return new EmotionOptionsBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * EmotionOptions Builder.
   */
  public class EmotionOptionsBuilder {
    private Boolean document;
    private List<String> targets;

    private EmotionOptionsBuilder(EmotionOptions emotionOptions) {
      this.document = emotionOptions.document;
      this.targets = emotionOptions.targets;
    }

    /**
     * Instantiates a new builder.
     */
    public EmotionOptionsBuilder() {
    }

    /**
     * Builds a EmotionOptions.
     *
     * @return the emotionOptions
     */
    public EmotionOptions build() {
      return new EmotionOptions(this);
    }

    /**
     * Adds an targets to targets.
     *
     * @param targets the new targets
     * @return the EmotionOptions builder
     */
    public EmotionOptionsBuilder addTargets(String targets) {
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
     * @return the EmotionOptions builder
     */
    public EmotionOptionsBuilder document(Boolean document) {
      this.document = document;
      return this;
    }

    /**
     * Set the targets.
     * Existing targets will be replaced.
     *
     * @param targets the targets
     * @return the EmotionOptions builder
     */
    public EmotionOptionsBuilder targets(List<String> targets) {
      this.targets = targets;
      return this;
    }
  }

  /**
   * The detected anger, disgust, fear, joy, or sadness that is conveyed by the content. Emotion information can be
   * returned for detected entities, keywords, or user-specified target phrases found in the text.
   */
  public class EmotionResult extends IBMWatsonGenericModel {
    private DocumentEmotionResults document;
    private List<TargetedEmotionResults> targets;

    /**
     * Gets the document.
     *
     * Emotion results for the document as a whole.
     *
     * @return the document
     */
    @AuraEnabled
    public DocumentEmotionResults getDocument() {
      return document;
    }

    /**
     * Gets the targets.
     *
     * Emotion results for specified targets.
     *
     * @return the targets
     */
    @AuraEnabled
    public List<TargetedEmotionResults> getTargets() {
      return targets;
    }

    /**
     * Sets the document.
     *
     * @param document the new document
     */
    public void setDocument(final DocumentEmotionResults document) {
      this.document = document;
    }

    /**
     * Sets the targets.
     *
     * @param targets the new targets
     */
    public void setTargets(final List<TargetedEmotionResults> targets) {
      this.targets = targets;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      EmotionResult ret = (EmotionResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for document
      Map<String, Object> documentMap = (Map<String, Object>) jsonMap.get('document');
      DocumentEmotionResults newDocument = (DocumentEmotionResults) new DocumentEmotionResults().deserialize(JSON.serialize(documentMap, true), documentMap, DocumentEmotionResults.class);
      ret.setDocument(newDocument);

      // calling custom deserializer for targets
      List<TargetedEmotionResults> newTargets = new List<TargetedEmotionResults>();
      List<TargetedEmotionResults> deserializedTargets = ret.getTargets();
      if (deserializedTargets != null) {
        for (Integer i = 0; i < deserializedTargets.size(); i++) {
          TargetedEmotionResults currentItem = ret.getTargets().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('targets');
          TargetedEmotionResults newItem = (TargetedEmotionResults) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TargetedEmotionResults.class);
          newTargets.add(newItem);
        }
        ret.targets = newTargets;
      }

      return ret;
    }
  }

  /**
   * EmotionScores.
   */
  public class EmotionScores extends IBMWatsonGenericModel {
    private Double anger;
    private Double disgust;
    private Double fear;
    private Double joy;
    private Double sadness;

    /**
     * Gets the anger.
     *
     * Anger score from 0 to 1. A higher score means that the text is more likely to convey anger.
     *
     * @return the anger
     */
    @AuraEnabled
    public Double getAnger() {
      return anger;
    }

    /**
     * Gets the disgust.
     *
     * Disgust score from 0 to 1. A higher score means that the text is more likely to convey disgust.
     *
     * @return the disgust
     */
    @AuraEnabled
    public Double getDisgust() {
      return disgust;
    }

    /**
     * Gets the fear.
     *
     * Fear score from 0 to 1. A higher score means that the text is more likely to convey fear.
     *
     * @return the fear
     */
    @AuraEnabled
    public Double getFear() {
      return fear;
    }

    /**
     * Gets the joy.
     *
     * Joy score from 0 to 1. A higher score means that the text is more likely to convey joy.
     *
     * @return the joy
     */
    @AuraEnabled
    public Double getJoy() {
      return joy;
    }

    /**
     * Gets the sadness.
     *
     * Sadness score from 0 to 1. A higher score means that the text is more likely to convey sadness.
     *
     * @return the sadness
     */
    @AuraEnabled
    public Double getSadness() {
      return sadness;
    }

    /**
     * Sets the anger.
     *
     * @param anger the new anger
     */
    public void setAnger(final Double anger) {
      this.anger = anger;
    }

    /**
     * Sets the disgust.
     *
     * @param disgust the new disgust
     */
    public void setDisgust(final Double disgust) {
      this.disgust = disgust;
    }

    /**
     * Sets the fear.
     *
     * @param fear the new fear
     */
    public void setFear(final Double fear) {
      this.fear = fear;
    }

    /**
     * Sets the joy.
     *
     * @param joy the new joy
     */
    public void setJoy(final Double joy) {
      this.joy = joy;
    }

    /**
     * Sets the sadness.
     *
     * @param sadness the new sadness
     */
    public void setSadness(final Double sadness) {
      this.sadness = sadness;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      EmotionScores ret = (EmotionScores) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Identifies people, cities, organizations, and other entities in the content. See [Entity types and
   * subtypes](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-entity-types).
   *
   * Supported languages: English, French, German, Italian, Japanese, Korean, Portuguese, Russian, Spanish, Swedish.
   * Arabic, Chinese, and Dutch are supported only through custom models.
   */
  public class EntitiesOptions extends IBMWatsonGenericModel {
    private Long xLimit;
    private Boolean mentions;
    private String model;
    private Boolean sentiment;
    private Boolean emotion;

    /**
     * Gets the xLimit.
     *
     * Maximum number of entities to return.
     *
     * @return the xLimit
     */
    public Long xLimit() {
      return xLimit;
    }

    /**
     * Gets the mentions.
     *
     * Set this to `true` to return locations of entity mentions.
     *
     * @return the mentions
     */
    public Boolean mentions() {
      return mentions;
    }

    /**
     * Gets the model.
     *
     * Enter a [custom
     * model](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-customizing)
     * ID to override the standard entity detection model.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    /**
     * Gets the sentiment.
     *
     * Set this to `true` to return sentiment information for detected entities.
     *
     * @return the sentiment
     */
    public Boolean sentiment() {
      return sentiment;
    }

    /**
     * Gets the emotion.
     *
     * Set this to `true` to analyze emotion for detected keywords.
     *
     * @return the emotion
     */
    public Boolean emotion() {
      return emotion;
    }
  
    private EntitiesOptions(EntitiesOptionsBuilder builder) {
      this.xLimit = builder.xLimit;
      this.mentions = builder.mentions;
      this.model = builder.model;
      this.sentiment = builder.sentiment;
      this.emotion = builder.emotion;
    }

    /**
     * New builder.
     *
     * @return a EntitiesOptions builder
     */
    public EntitiesOptionsBuilder newBuilder() {
      return new EntitiesOptionsBuilder(this);
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
   * EntitiesOptions Builder.
   */
  public class EntitiesOptionsBuilder {
    private Long xLimit;
    private Boolean mentions;
    private String model;
    private Boolean sentiment;
    private Boolean emotion;

    private EntitiesOptionsBuilder(EntitiesOptions entitiesOptions) {
      this.xLimit = entitiesOptions.xLimit;
      this.mentions = entitiesOptions.mentions;
      this.model = entitiesOptions.model;
      this.sentiment = entitiesOptions.sentiment;
      this.emotion = entitiesOptions.emotion;
    }

    /**
     * Instantiates a new builder.
     */
    public EntitiesOptionsBuilder() {
    }

    /**
     * Builds a EntitiesOptions.
     *
     * @return the entitiesOptions
     */
    public EntitiesOptions build() {
      return new EntitiesOptions(this);
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the EntitiesOptions builder
     */
    public EntitiesOptionsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }

    /**
     * Set the mentions.
     *
     * @param mentions the mentions
     * @return the EntitiesOptions builder
     */
    public EntitiesOptionsBuilder mentions(Boolean mentions) {
      this.mentions = mentions;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the EntitiesOptions builder
     */
    public EntitiesOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Set the sentiment.
     *
     * @param sentiment the sentiment
     * @return the EntitiesOptions builder
     */
    public EntitiesOptionsBuilder sentiment(Boolean sentiment) {
      this.sentiment = sentiment;
      return this;
    }

    /**
     * Set the emotion.
     *
     * @param emotion the emotion
     * @return the EntitiesOptions builder
     */
    public EntitiesOptionsBuilder emotion(Boolean emotion) {
      this.emotion = emotion;
      return this;
    }
  }

  /**
   * The important people, places, geopolitical entities and other types of entities in your content.
   */
  public class EntitiesResult extends IBMWatsonGenericModel {
    private String xType;
    private String text;
    private Double relevance;
    private Double confidence;
    private List<EntityMention> mentions;
    private Long count;
    private EmotionScores emotion;
    private FeatureSentimentResults sentiment;
    private DisambiguationResult disambiguation;

    /**
     * Gets the xType.
     *
     * Entity type.
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
     * The name of the entity.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the relevance.
     *
     * Relevance score from 0 to 1. Higher values indicate greater relevance.
     *
     * @return the relevance
     */
    @AuraEnabled
    public Double getRelevance() {
      return relevance;
    }

    /**
     * Gets the confidence.
     *
     * Confidence in the entity identification from 0 to 1. Higher values indicate higher confidence. In standard
     * entities requests, confidence is returned only for English text. All entities requests that use custom models
     * return the confidence score.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }

    /**
     * Gets the mentions.
     *
     * Entity mentions and locations.
     *
     * @return the mentions
     */
    @AuraEnabled
    public List<EntityMention> getMentions() {
      return mentions;
    }

    /**
     * Gets the count.
     *
     * How many times the entity was mentioned in the text.
     *
     * @return the count
     */
    @AuraEnabled
    public Long getCount() {
      return count;
    }

    /**
     * Gets the emotion.
     *
     * Emotion analysis results for the entity, enabled with the `emotion` option.
     *
     * @return the emotion
     */
    @AuraEnabled
    public EmotionScores getEmotion() {
      return emotion;
    }

    /**
     * Gets the sentiment.
     *
     * Sentiment analysis results for the entity, enabled with the `sentiment` option.
     *
     * @return the sentiment
     */
    @AuraEnabled
    public FeatureSentimentResults getSentiment() {
      return sentiment;
    }

    /**
     * Gets the disambiguation.
     *
     * Disambiguation information for the entity.
     *
     * @return the disambiguation
     */
    @AuraEnabled
    public DisambiguationResult getDisambiguation() {
      return disambiguation;
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
     * Sets the relevance.
     *
     * @param relevance the new relevance
     */
    public void setRelevance(final Double relevance) {
      this.relevance = relevance;
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
     * Sets the mentions.
     *
     * @param mentions the new mentions
     */
    public void setMentions(final List<EntityMention> mentions) {
      this.mentions = mentions;
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
     * Sets the emotion.
     *
     * @param emotion the new emotion
     */
    public void setEmotion(final EmotionScores emotion) {
      this.emotion = emotion;
    }

    /**
     * Sets the sentiment.
     *
     * @param sentiment the new sentiment
     */
    public void setSentiment(final FeatureSentimentResults sentiment) {
      this.sentiment = sentiment;
    }

    /**
     * Sets the disambiguation.
     *
     * @param disambiguation the new disambiguation
     */
    public void setDisambiguation(final DisambiguationResult disambiguation) {
      this.disambiguation = disambiguation;
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

      EntitiesResult ret = (EntitiesResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for mentions
      List<EntityMention> newMentions = new List<EntityMention>();
      List<EntityMention> deserializedMentions = ret.getMentions();
      if (deserializedMentions != null) {
        for (Integer i = 0; i < deserializedMentions.size(); i++) {
          EntityMention currentItem = ret.getMentions().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('mentions');
          EntityMention newItem = (EntityMention) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), EntityMention.class);
          newMentions.add(newItem);
        }
        ret.mentions = newMentions;
      }

      // calling custom deserializer for emotion
      Map<String, Object> emotionMap = (Map<String, Object>) jsonMap.get('emotion');
      EmotionScores newEmotion = (EmotionScores) new EmotionScores().deserialize(JSON.serialize(emotionMap, true), emotionMap, EmotionScores.class);
      ret.setEmotion(newEmotion);

      // calling custom deserializer for sentiment
      Map<String, Object> sentimentMap = (Map<String, Object>) jsonMap.get('sentiment');
      FeatureSentimentResults newSentiment = (FeatureSentimentResults) new FeatureSentimentResults().deserialize(JSON.serialize(sentimentMap, true), sentimentMap, FeatureSentimentResults.class);
      ret.setSentiment(newSentiment);

      // calling custom deserializer for disambiguation
      Map<String, Object> disambiguationMap = (Map<String, Object>) jsonMap.get('disambiguation');
      DisambiguationResult newDisambiguation = (DisambiguationResult) new DisambiguationResult().deserialize(JSON.serialize(disambiguationMap, true), disambiguationMap, DisambiguationResult.class);
      ret.setDisambiguation(newDisambiguation);

      return ret;
    }
  }

  /**
   * EntityMention.
   */
  public class EntityMention extends IBMWatsonGenericModel {
    private String text;
    private List<Long> location;
    private Double confidence;

    /**
     * Gets the text.
     *
     * Entity mention text.
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
     * Character offsets indicating the beginning and end of the mention in the analyzed text.
     *
     * @return the location
     */
    @AuraEnabled
    public List<Long> getLocation() {
      return location;
    }

    /**
     * Gets the confidence.
     *
     * Confidence in the entity identification from 0 to 1. Higher values indicate higher confidence. In standard
     * entities requests, confidence is returned only for English text. All entities requests that use custom models
     * return the confidence score.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
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
    public void setLocation(final List<Long> location) {
      this.location = location;
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

      EntityMention ret = (EntityMention) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * FeatureSentimentResults.
   */
  public class FeatureSentimentResults extends IBMWatsonGenericModel {
    private Double score;

    /**
     * Gets the score.
     *
     * Sentiment score from -1 (negative) to 1 (positive).
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Sets the score.
     *
     * @param score the new score
     */
    public void setScore(final Double score) {
      this.score = score;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      FeatureSentimentResults ret = (FeatureSentimentResults) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Analysis features and options.
   */
  public class Features extends IBMWatsonGenericModel {
    private ConceptsOptions concepts;
    private EmotionOptions emotion;
    private EntitiesOptions entities;
    private KeywordsOptions keywords;
    private MetadataOptions metadata;
    private RelationsOptions relations;
    private SemanticRolesOptions semanticRoles;
    private SentimentOptions sentiment;
    private CategoriesOptions categories;
    private SyntaxOptions syntax;

    /**
     * Gets the concepts.
     *
     * Returns high-level concepts in the content. For example, a research paper about deep learning might return the
     * concept, "Artificial Intelligence" although the term is not mentioned.
     *
     * Supported languages: English, French, German, Italian, Japanese, Korean, Portuguese, Spanish.
     *
     * @return the concepts
     */
    public ConceptsOptions concepts() {
      return concepts;
    }

    /**
     * Gets the emotion.
     *
     * Detects anger, disgust, fear, joy, or sadness that is conveyed in the content or by the context around target
     * phrases specified in the targets parameter. You can analyze emotion for detected entities with `entities.emotion`
     * and for keywords with `keywords.emotion`.
     *
     * Supported languages: English.
     *
     * @return the emotion
     */
    public EmotionOptions emotion() {
      return emotion;
    }

    /**
     * Gets the entities.
     *
     * Identifies people, cities, organizations, and other entities in the content. See [Entity types and
     * subtypes](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-entity-types).
     *
     * Supported languages: English, French, German, Italian, Japanese, Korean, Portuguese, Russian, Spanish, Swedish.
     * Arabic, Chinese, and Dutch are supported only through custom models.
     *
     * @return the entities
     */
    public EntitiesOptions entities() {
      return entities;
    }

    /**
     * Gets the keywords.
     *
     * Returns important keywords in the content.
     *
     * Supported languages: English, French, German, Italian, Japanese, Korean, Portuguese, Russian, Spanish, Swedish.
     *
     * @return the keywords
     */
    public KeywordsOptions keywords() {
      return keywords;
    }

    /**
     * Gets the metadata.
     *
     * Returns information from the document, including author name, title, RSS/ATOM feeds, prominent page image, and
     * publication date. Supports URL and HTML input types only.
     *
     * @return the metadata
     */
    public MetadataOptions metadata() {
      return metadata;
    }

    /**
     * Gets the relations.
     *
     * Recognizes when two entities are related and identifies the type of relation. For example, an `awardedTo`
     * relation might connect the entities "Nobel Prize" and "Albert Einstein". See [Relation
     * types](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-relations).
     *
     * Supported languages: Arabic, English, German, Japanese, Korean, Spanish. Chinese, Dutch, French, Italian, and
     * Portuguese custom models are also supported.
     *
     * @return the relations
     */
    public RelationsOptions relations() {
      return relations;
    }

    /**
     * Gets the semanticRoles.
     *
     * Parses sentences into subject, action, and object form.
     *
     * Supported languages: English, German, Japanese, Korean, Spanish.
     *
     * @return the semanticRoles
     */
    public SemanticRolesOptions semanticRoles() {
      return semanticRoles;
    }

    /**
     * Gets the sentiment.
     *
     * Analyzes the general sentiment of your content or the sentiment toward specific target phrases. You can analyze
     * sentiment for detected entities with `entities.sentiment` and for keywords with `keywords.sentiment`.
     *
     *  Supported languages: Arabic, English, French, German, Italian, Japanese, Korean, Portuguese, Russian, Spanish.
     *
     * @return the sentiment
     */
    public SentimentOptions sentiment() {
      return sentiment;
    }

    /**
     * Gets the categories.
     *
     * Returns a five-level taxonomy of the content. The top three categories are returned.
     *
     * Supported languages: Arabic, English, French, German, Italian, Japanese, Korean, Portuguese, Spanish.
     *
     * @return the categories
     */
    public CategoriesOptions categories() {
      return categories;
    }

    /**
     * Gets the syntax.
     *
     * Returns tokens and sentences from the input text.
     *
     * @return the syntax
     */
    public SyntaxOptions syntax() {
      return syntax;
    }
  
    private Features(FeaturesBuilder builder) {
      this.concepts = builder.concepts;
      this.emotion = builder.emotion;
      this.entities = builder.entities;
      this.keywords = builder.keywords;
      this.metadata = builder.metadata;
      this.relations = builder.relations;
      this.semanticRoles = builder.semanticRoles;
      this.sentiment = builder.sentiment;
      this.categories = builder.categories;
      this.syntax = builder.syntax;
    }

    /**
     * New builder.
     *
     * @return a Features builder
     */
    public FeaturesBuilder newBuilder() {
      return new FeaturesBuilder(this);
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

      // performing custom serialization for concepts
      if (concepts != null) {
        String conceptsJsonString = JSON.serialize(concepts.replacePropertyNames(), true);
        String conceptsKey = 'concepts';
        if (propertyNameMapping.containsKey(conceptsKey)) {
          conceptsKey = propertyNameMapping.get(conceptsKey);
        }
        jsonMap.put(conceptsKey, JSON.deserializeUntyped(conceptsJsonString));
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

      // performing custom serialization for entities
      if (entities != null) {
        String entitiesJsonString = JSON.serialize(entities.replacePropertyNames(), true);
        String entitiesKey = 'entities';
        if (propertyNameMapping.containsKey(entitiesKey)) {
          entitiesKey = propertyNameMapping.get(entitiesKey);
        }
        jsonMap.put(entitiesKey, JSON.deserializeUntyped(entitiesJsonString));
      }

      // performing custom serialization for keywords
      if (keywords != null) {
        String keywordsJsonString = JSON.serialize(keywords.replacePropertyNames(), true);
        String keywordsKey = 'keywords';
        if (propertyNameMapping.containsKey(keywordsKey)) {
          keywordsKey = propertyNameMapping.get(keywordsKey);
        }
        jsonMap.put(keywordsKey, JSON.deserializeUntyped(keywordsJsonString));
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

      // performing custom serialization for relations
      if (relations != null) {
        String relationsJsonString = JSON.serialize(relations.replacePropertyNames(), true);
        String relationsKey = 'relations';
        if (propertyNameMapping.containsKey(relationsKey)) {
          relationsKey = propertyNameMapping.get(relationsKey);
        }
        jsonMap.put(relationsKey, JSON.deserializeUntyped(relationsJsonString));
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

      // performing custom serialization for sentiment
      if (sentiment != null) {
        String sentimentJsonString = JSON.serialize(sentiment.replacePropertyNames(), true);
        String sentimentKey = 'sentiment';
        if (propertyNameMapping.containsKey(sentimentKey)) {
          sentimentKey = propertyNameMapping.get(sentimentKey);
        }
        jsonMap.put(sentimentKey, JSON.deserializeUntyped(sentimentJsonString));
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

      // performing custom serialization for syntax
      if (syntax != null) {
        String syntaxJsonString = JSON.serialize(syntax.replacePropertyNames(), true);
        String syntaxKey = 'syntax';
        if (propertyNameMapping.containsKey(syntaxKey)) {
          syntaxKey = propertyNameMapping.get(syntaxKey);
        }
        jsonMap.put(syntaxKey, JSON.deserializeUntyped(syntaxJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * Features Builder.
   */
  public class FeaturesBuilder {
    private ConceptsOptions concepts;
    private EmotionOptions emotion;
    private EntitiesOptions entities;
    private KeywordsOptions keywords;
    private MetadataOptions metadata;
    private RelationsOptions relations;
    private SemanticRolesOptions semanticRoles;
    private SentimentOptions sentiment;
    private CategoriesOptions categories;
    private SyntaxOptions syntax;

    private FeaturesBuilder(Features features) {
      this.concepts = features.concepts;
      this.emotion = features.emotion;
      this.entities = features.entities;
      this.keywords = features.keywords;
      this.metadata = features.metadata;
      this.relations = features.relations;
      this.semanticRoles = features.semanticRoles;
      this.sentiment = features.sentiment;
      this.categories = features.categories;
      this.syntax = features.syntax;
    }

    /**
     * Instantiates a new builder.
     */
    public FeaturesBuilder() {
    }

    /**
     * Builds a Features.
     *
     * @return the features
     */
    public Features build() {
      return new Features(this);
    }

    /**
     * Set the concepts.
     *
     * @param concepts the concepts
     * @return the Features builder
     */
    public FeaturesBuilder concepts(ConceptsOptions concepts) {
      this.concepts = concepts;
      return this;
    }

    /**
     * Set the emotion.
     *
     * @param emotion the emotion
     * @return the Features builder
     */
    public FeaturesBuilder emotion(EmotionOptions emotion) {
      this.emotion = emotion;
      return this;
    }

    /**
     * Set the entities.
     *
     * @param entities the entities
     * @return the Features builder
     */
    public FeaturesBuilder entities(EntitiesOptions entities) {
      this.entities = entities;
      return this;
    }

    /**
     * Set the keywords.
     *
     * @param keywords the keywords
     * @return the Features builder
     */
    public FeaturesBuilder keywords(KeywordsOptions keywords) {
      this.keywords = keywords;
      return this;
    }

    /**
     * Set the metadata.
     *
     * @param metadata the metadata
     * @return the Features builder
     */
    public FeaturesBuilder metadata(MetadataOptions metadata) {
      this.metadata = metadata;
      return this;
    }

    /**
     * Set the relations.
     *
     * @param relations the relations
     * @return the Features builder
     */
    public FeaturesBuilder relations(RelationsOptions relations) {
      this.relations = relations;
      return this;
    }

    /**
     * Set the semanticRoles.
     *
     * @param semanticRoles the semanticRoles
     * @return the Features builder
     */
    public FeaturesBuilder semanticRoles(SemanticRolesOptions semanticRoles) {
      this.semanticRoles = semanticRoles;
      return this;
    }

    /**
     * Set the sentiment.
     *
     * @param sentiment the sentiment
     * @return the Features builder
     */
    public FeaturesBuilder sentiment(SentimentOptions sentiment) {
      this.sentiment = sentiment;
      return this;
    }

    /**
     * Set the categories.
     *
     * @param categories the categories
     * @return the Features builder
     */
    public FeaturesBuilder categories(CategoriesOptions categories) {
      this.categories = categories;
      return this;
    }

    /**
     * Set the syntax.
     *
     * @param syntax the syntax
     * @return the Features builder
     */
    public FeaturesBuilder syntax(SyntaxOptions syntax) {
      this.syntax = syntax;
      return this;
    }
  }

  /**
   * RSS or ATOM feed found on the webpage.
   */
  public class Feed extends IBMWatsonGenericModel {
    private String link;

    /**
     * Gets the link.
     *
     * URL of the RSS or ATOM feed.
     *
     * @return the link
     */
    @AuraEnabled
    public String getLink() {
      return link;
    }

    /**
     * Sets the link.
     *
     * @param link the new link
     */
    public void setLink(final String link) {
      this.link = link;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Feed ret = (Feed) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Returns important keywords in the content.
   *
   * Supported languages: English, French, German, Italian, Japanese, Korean, Portuguese, Russian, Spanish, Swedish.
   */
  public class KeywordsOptions extends IBMWatsonGenericModel {
    private Long xLimit;
    private Boolean sentiment;
    private Boolean emotion;

    /**
     * Gets the xLimit.
     *
     * Maximum number of keywords to return.
     *
     * @return the xLimit
     */
    public Long xLimit() {
      return xLimit;
    }

    /**
     * Gets the sentiment.
     *
     * Set this to `true` to return sentiment information for detected keywords.
     *
     * @return the sentiment
     */
    public Boolean sentiment() {
      return sentiment;
    }

    /**
     * Gets the emotion.
     *
     * Set this to `true` to analyze emotion for detected keywords.
     *
     * @return the emotion
     */
    public Boolean emotion() {
      return emotion;
    }
  
    private KeywordsOptions(KeywordsOptionsBuilder builder) {
      this.xLimit = builder.xLimit;
      this.sentiment = builder.sentiment;
      this.emotion = builder.emotion;
    }

    /**
     * New builder.
     *
     * @return a KeywordsOptions builder
     */
    public KeywordsOptionsBuilder newBuilder() {
      return new KeywordsOptionsBuilder(this);
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
   * KeywordsOptions Builder.
   */
  public class KeywordsOptionsBuilder {
    private Long xLimit;
    private Boolean sentiment;
    private Boolean emotion;

    private KeywordsOptionsBuilder(KeywordsOptions keywordsOptions) {
      this.xLimit = keywordsOptions.xLimit;
      this.sentiment = keywordsOptions.sentiment;
      this.emotion = keywordsOptions.emotion;
    }

    /**
     * Instantiates a new builder.
     */
    public KeywordsOptionsBuilder() {
    }

    /**
     * Builds a KeywordsOptions.
     *
     * @return the keywordsOptions
     */
    public KeywordsOptions build() {
      return new KeywordsOptions(this);
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the KeywordsOptions builder
     */
    public KeywordsOptionsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }

    /**
     * Set the sentiment.
     *
     * @param sentiment the sentiment
     * @return the KeywordsOptions builder
     */
    public KeywordsOptionsBuilder sentiment(Boolean sentiment) {
      this.sentiment = sentiment;
      return this;
    }

    /**
     * Set the emotion.
     *
     * @param emotion the emotion
     * @return the KeywordsOptions builder
     */
    public KeywordsOptionsBuilder emotion(Boolean emotion) {
      this.emotion = emotion;
      return this;
    }
  }

  /**
   * The important keywords in the content, organized by relevance.
   */
  public class KeywordsResult extends IBMWatsonGenericModel {
    private Long count;
    private Double relevance;
    private String text;
    private EmotionScores emotion;
    private FeatureSentimentResults sentiment;

    /**
     * Gets the count.
     *
     * Number of times the keyword appears in the analyzed text.
     *
     * @return the count
     */
    @AuraEnabled
    public Long getCount() {
      return count;
    }

    /**
     * Gets the relevance.
     *
     * Relevance score from 0 to 1. Higher values indicate greater relevance.
     *
     * @return the relevance
     */
    @AuraEnabled
    public Double getRelevance() {
      return relevance;
    }

    /**
     * Gets the text.
     *
     * The keyword text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the emotion.
     *
     * Emotion analysis results for the keyword, enabled with the `emotion` option.
     *
     * @return the emotion
     */
    @AuraEnabled
    public EmotionScores getEmotion() {
      return emotion;
    }

    /**
     * Gets the sentiment.
     *
     * Sentiment analysis results for the keyword, enabled with the `sentiment` option.
     *
     * @return the sentiment
     */
    @AuraEnabled
    public FeatureSentimentResults getSentiment() {
      return sentiment;
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
     * Sets the relevance.
     *
     * @param relevance the new relevance
     */
    public void setRelevance(final Double relevance) {
      this.relevance = relevance;
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
     * Sets the emotion.
     *
     * @param emotion the new emotion
     */
    public void setEmotion(final EmotionScores emotion) {
      this.emotion = emotion;
    }

    /**
     * Sets the sentiment.
     *
     * @param sentiment the new sentiment
     */
    public void setSentiment(final FeatureSentimentResults sentiment) {
      this.sentiment = sentiment;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      KeywordsResult ret = (KeywordsResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for emotion
      Map<String, Object> emotionMap = (Map<String, Object>) jsonMap.get('emotion');
      EmotionScores newEmotion = (EmotionScores) new EmotionScores().deserialize(JSON.serialize(emotionMap, true), emotionMap, EmotionScores.class);
      ret.setEmotion(newEmotion);

      // calling custom deserializer for sentiment
      Map<String, Object> sentimentMap = (Map<String, Object>) jsonMap.get('sentiment');
      FeatureSentimentResults newSentiment = (FeatureSentimentResults) new FeatureSentimentResults().deserialize(JSON.serialize(sentimentMap, true), sentimentMap, FeatureSentimentResults.class);
      ret.setSentiment(newSentiment);

      return ret;
    }
  }

  /**
   * The listModels options.
   */
  public class ListModelsOptions extends IBMWatsonOptionsModel {

    private ListModelsOptions(ListModelsOptionsBuilder builder) {
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

    private ListModelsOptionsBuilder(ListModelsOptions listModelsOptions) {
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
   * Custom models that are available for entities and relations.
   */
  public class ListModelsResults extends IBMWatsonResponseModel {
    private List<Model> models;

    /**
     * Gets the models.
     *
     * An array of available models.
     *
     * @return the models
     */
    @AuraEnabled
    public List<Model> getModels() {
      return models;
    }

    /**
     * Sets the models.
     *
     * @param models the new models
     */
    public void setModels(final List<Model> models) {
      this.models = models;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ListModelsResults ret = (ListModelsResults) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for models
      List<Model> newModels = new List<Model>();
      List<Model> deserializedModels = ret.getModels();
      if (deserializedModels != null) {
        for (Integer i = 0; i < deserializedModels.size(); i++) {
          Model currentItem = ret.getModels().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('models');
          Model newItem = (Model) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Model.class);
          newModels.add(newItem);
        }
        ret.models = newModels;
      }

      return ret;
    }
  }

  /**
   * Returns information from the document, including author name, title, RSS/ATOM feeds, prominent page image, and
   * publication date. Supports URL and HTML input types only.
   */
  public class MetadataOptions extends IBMWatsonGenericModel {
  
    private MetadataOptions(MetadataOptionsBuilder builder) {
    }

    /**
     * New builder.
     *
     * @return a MetadataOptions builder
     */
    public MetadataOptionsBuilder newBuilder() {
      return new MetadataOptionsBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * MetadataOptions Builder.
   */
  public class MetadataOptionsBuilder {

    private MetadataOptionsBuilder(MetadataOptions metadataOptions) {
    }

    /**
     * Instantiates a new builder.
     */
    public MetadataOptionsBuilder() {
    }

    /**
     * Builds a MetadataOptions.
     *
     * @return the metadataOptions
     */
    public MetadataOptions build() {
      return new MetadataOptions(this);
    }
  }

  /**
   * Model.
   */
  public class Model extends IBMWatsonGenericModel {
    private String status;
    private String modelId;
    private String language;
    private String description;
    private String workspaceId;
    private String version;
    private String versionDescription;
    private Datetime created;

    /**
     * Gets the status.
     *
     * When the status is `available`, the model is ready to use.
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
     * Unique model ID.
     *
     * @return the modelId
     */
    @AuraEnabled
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the language.
     *
     * ISO 639-1 code indicating the language of the model.
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
     * Model description.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the workspaceId.
     *
     * ID of the Watson Knowledge Studio workspace that deployed this model to Natural Language Understanding.
     *
     * @return the workspaceId
     */
    @AuraEnabled
    public String getWorkspaceId() {
      return workspaceId;
    }

    /**
     * Gets the version.
     *
     * The model version, if it was manually provided in Watson Knowledge Studio.
     *
     * @return the version
     */
    @AuraEnabled
    public String getVersion() {
      return version;
    }

    /**
     * Gets the versionDescription.
     *
     * The description of the version, if it was manually provided in Watson Knowledge Studio.
     *
     * @return the versionDescription
     */
    @AuraEnabled
    public String getVersionDescription() {
      return versionDescription;
    }

    /**
     * Gets the created.
     *
     * A dateTime indicating when the model was created.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
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
     * Sets the workspaceId.
     *
     * @param workspaceId the new workspaceId
     */
    public void setWorkspaceId(final String workspaceId) {
      this.workspaceId = workspaceId;
    }

    /**
     * Sets the version.
     *
     * @param version the new version
     */
    public void setVersion(final String version) {
      this.version = version;
    }

    /**
     * Sets the versionDescription.
     *
     * @param versionDescription the new versionDescription
     */
    public void setVersionDescription(final String versionDescription) {
      this.versionDescription = versionDescription;
    }

    /**
     * Sets the created.
     *
     * @param created the new created
     */
    public void setCreated(final Datetime created) {
      this.created = created;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'model_id' => 'modelId',
        'workspace_id' => 'workspaceId',
        'version_description' => 'versionDescription'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Model ret = (Model) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * RelationArgument.
   */
  public class RelationArgument extends IBMWatsonGenericModel {
    private List<RelationEntity> entities;
    private List<Long> location;
    private String text;

    /**
     * Gets the entities.
     *
     * An array of extracted entities.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<RelationEntity> getEntities() {
      return entities;
    }

    /**
     * Gets the location.
     *
     * Character offsets indicating the beginning and end of the mention in the analyzed text.
     *
     * @return the location
     */
    @AuraEnabled
    public List<Long> getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * Text that corresponds to the argument.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the entities.
     *
     * @param entities the new entities
     */
    public void setEntities(final List<RelationEntity> entities) {
      this.entities = entities;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final List<Long> location) {
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

      RelationArgument ret = (RelationArgument) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for entities
      List<RelationEntity> newEntities = new List<RelationEntity>();
      List<RelationEntity> deserializedEntities = ret.getEntities();
      if (deserializedEntities != null) {
        for (Integer i = 0; i < deserializedEntities.size(); i++) {
          RelationEntity currentItem = ret.getEntities().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('entities');
          RelationEntity newItem = (RelationEntity) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RelationEntity.class);
          newEntities.add(newItem);
        }
        ret.entities = newEntities;
      }

      return ret;
    }
  }

  /**
   * An entity that corresponds with an argument in a relation.
   */
  public class RelationEntity extends IBMWatsonGenericModel {
    private String text;
    private String xType;

    /**
     * Gets the text.
     *
     * Text that corresponds to the entity.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the xType.
     *
     * Entity type.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
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

      RelationEntity ret = (RelationEntity) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Recognizes when two entities are related and identifies the type of relation. For example, an `awardedTo` relation
   * might connect the entities "Nobel Prize" and "Albert Einstein". See [Relation
   * types](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-relations).
   *
   * Supported languages: Arabic, English, German, Japanese, Korean, Spanish. Chinese, Dutch, French, Italian, and
   * Portuguese custom models are also supported.
   */
  public class RelationsOptions extends IBMWatsonGenericModel {
    private String model;

    /**
     * Gets the model.
     *
     * Enter a [custom
     * model](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-customizing)
     * ID to override the default model.
     *
     * @return the model
     */
    public String model() {
      return model;
    }
  
    private RelationsOptions(RelationsOptionsBuilder builder) {
      this.model = builder.model;
    }

    /**
     * New builder.
     *
     * @return a RelationsOptions builder
     */
    public RelationsOptionsBuilder newBuilder() {
      return new RelationsOptionsBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * RelationsOptions Builder.
   */
  public class RelationsOptionsBuilder {
    private String model;

    private RelationsOptionsBuilder(RelationsOptions relationsOptions) {
      this.model = relationsOptions.model;
    }

    /**
     * Instantiates a new builder.
     */
    public RelationsOptionsBuilder() {
    }

    /**
     * Builds a RelationsOptions.
     *
     * @return the relationsOptions
     */
    public RelationsOptions build() {
      return new RelationsOptions(this);
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the RelationsOptions builder
     */
    public RelationsOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }
  }

  /**
   * The relations between entities found in the content.
   */
  public class RelationsResult extends IBMWatsonGenericModel {
    private Double score;
    private String sentence;
    private String xType;
    private List<RelationArgument> arguments;

    /**
     * Gets the score.
     *
     * Confidence score for the relation. Higher values indicate greater confidence.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Gets the sentence.
     *
     * The sentence that contains the relation.
     *
     * @return the sentence
     */
    @AuraEnabled
    public String getSentence() {
      return sentence;
    }

    /**
     * Gets the xType.
     *
     * The type of the relation.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the arguments.
     *
     * Entity mentions that are involved in the relation.
     *
     * @return the arguments
     */
    @AuraEnabled
    public List<RelationArgument> getArguments() {
      return arguments;
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
     * Sets the sentence.
     *
     * @param sentence the new sentence
     */
    public void setSentence(final String sentence) {
      this.sentence = sentence;
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
     * Sets the arguments.
     *
     * @param arguments the new arguments
     */
    public void setArguments(final List<RelationArgument> arguments) {
      this.arguments = arguments;
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

      RelationsResult ret = (RelationsResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for arguments
      List<RelationArgument> newArguments = new List<RelationArgument>();
      List<RelationArgument> deserializedArguments = ret.getArguments();
      if (deserializedArguments != null) {
        for (Integer i = 0; i < deserializedArguments.size(); i++) {
          RelationArgument currentItem = ret.getArguments().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('arguments');
          RelationArgument newItem = (RelationArgument) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RelationArgument.class);
          newArguments.add(newItem);
        }
        ret.arguments = newArguments;
      }

      return ret;
    }
  }

  /**
   * SemanticRolesEntity.
   */
  public class SemanticRolesEntity extends IBMWatsonGenericModel {
    private String xType;
    private String text;

    /**
     * Gets the xType.
     *
     * Entity type.
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
     * The entity text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
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

      SemanticRolesEntity ret = (SemanticRolesEntity) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * SemanticRolesKeyword.
   */
  public class SemanticRolesKeyword extends IBMWatsonGenericModel {
    private String text;

    /**
     * Gets the text.
     *
     * The keyword text.
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

      SemanticRolesKeyword ret = (SemanticRolesKeyword) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Parses sentences into subject, action, and object form.
   *
   * Supported languages: English, German, Japanese, Korean, Spanish.
   */
  public class SemanticRolesOptions extends IBMWatsonGenericModel {
    private Long xLimit;
    private Boolean keywords;
    private Boolean entities;

    /**
     * Gets the xLimit.
     *
     * Maximum number of semantic_roles results to return.
     *
     * @return the xLimit
     */
    public Long xLimit() {
      return xLimit;
    }

    /**
     * Gets the keywords.
     *
     * Set this to `true` to return keyword information for subjects and objects.
     *
     * @return the keywords
     */
    public Boolean keywords() {
      return keywords;
    }

    /**
     * Gets the entities.
     *
     * Set this to `true` to return entity information for subjects and objects.
     *
     * @return the entities
     */
    public Boolean entities() {
      return entities;
    }
  
    private SemanticRolesOptions(SemanticRolesOptionsBuilder builder) {
      this.xLimit = builder.xLimit;
      this.keywords = builder.keywords;
      this.entities = builder.entities;
    }

    /**
     * New builder.
     *
     * @return a SemanticRolesOptions builder
     */
    public SemanticRolesOptionsBuilder newBuilder() {
      return new SemanticRolesOptionsBuilder(this);
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
   * SemanticRolesOptions Builder.
   */
  public class SemanticRolesOptionsBuilder {
    private Long xLimit;
    private Boolean keywords;
    private Boolean entities;

    private SemanticRolesOptionsBuilder(SemanticRolesOptions semanticRolesOptions) {
      this.xLimit = semanticRolesOptions.xLimit;
      this.keywords = semanticRolesOptions.keywords;
      this.entities = semanticRolesOptions.entities;
    }

    /**
     * Instantiates a new builder.
     */
    public SemanticRolesOptionsBuilder() {
    }

    /**
     * Builds a SemanticRolesOptions.
     *
     * @return the semanticRolesOptions
     */
    public SemanticRolesOptions build() {
      return new SemanticRolesOptions(this);
    }

    /**
     * Set the xLimit.
     *
     * @param xLimit the xLimit
     * @return the SemanticRolesOptions builder
     */
    public SemanticRolesOptionsBuilder xLimit(Long xLimit) {
      this.xLimit = xLimit;
      return this;
    }

    /**
     * Set the keywords.
     *
     * @param keywords the keywords
     * @return the SemanticRolesOptions builder
     */
    public SemanticRolesOptionsBuilder keywords(Boolean keywords) {
      this.keywords = keywords;
      return this;
    }

    /**
     * Set the entities.
     *
     * @param entities the entities
     * @return the SemanticRolesOptions builder
     */
    public SemanticRolesOptionsBuilder entities(Boolean entities) {
      this.entities = entities;
      return this;
    }
  }

  /**
   * The object containing the actions and the objects the actions act upon.
   */
  public class SemanticRolesResult extends IBMWatsonGenericModel {
    private String sentence;
    private SemanticRolesResultSubject subject;
    private SemanticRolesResultAction action;
    private SemanticRolesResultObject xObject;

    /**
     * Gets the sentence.
     *
     * Sentence from the source that contains the subject, action, and object.
     *
     * @return the sentence
     */
    @AuraEnabled
    public String getSentence() {
      return sentence;
    }

    /**
     * Gets the subject.
     *
     * The extracted subject from the sentence.
     *
     * @return the subject
     */
    @AuraEnabled
    public SemanticRolesResultSubject getSubject() {
      return subject;
    }

    /**
     * Gets the action.
     *
     * The extracted action from the sentence.
     *
     * @return the action
     */
    @AuraEnabled
    public SemanticRolesResultAction getAction() {
      return action;
    }

    /**
     * Gets the xObject.
     *
     * The extracted object from the sentence.
     *
     * @return the xObject
     */
    @AuraEnabled
    public SemanticRolesResultObject getXObject() {
      return xObject;
    }

    /**
     * Sets the sentence.
     *
     * @param sentence the new sentence
     */
    public void setSentence(final String sentence) {
      this.sentence = sentence;
    }

    /**
     * Sets the subject.
     *
     * @param subject the new subject
     */
    public void setSubject(final SemanticRolesResultSubject subject) {
      this.subject = subject;
    }

    /**
     * Sets the action.
     *
     * @param action the new action
     */
    public void setAction(final SemanticRolesResultAction action) {
      this.action = action;
    }

    /**
     * Sets the xObject.
     *
     * @param xObject the new xObject
     */
    public void setXObject(final SemanticRolesResultObject xObject) {
      this.xObject = xObject;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'object' => 'xObject'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SemanticRolesResult ret = (SemanticRolesResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for subject
      Map<String, Object> subjectMap = (Map<String, Object>) jsonMap.get('subject');
      SemanticRolesResultSubject newSubject = (SemanticRolesResultSubject) new SemanticRolesResultSubject().deserialize(JSON.serialize(subjectMap, true), subjectMap, SemanticRolesResultSubject.class);
      ret.setSubject(newSubject);

      // calling custom deserializer for action
      Map<String, Object> actionMap = (Map<String, Object>) jsonMap.get('action');
      SemanticRolesResultAction newAction = (SemanticRolesResultAction) new SemanticRolesResultAction().deserialize(JSON.serialize(actionMap, true), actionMap, SemanticRolesResultAction.class);
      ret.setAction(newAction);

      // calling custom deserializer for xObject
      Map<String, Object> xObjectMap = (Map<String, Object>) jsonMap.get('xObject');
      SemanticRolesResultObject newXObject = (SemanticRolesResultObject) new SemanticRolesResultObject().deserialize(JSON.serialize(xObjectMap, true), xObjectMap, SemanticRolesResultObject.class);
      ret.setXObject(newXObject);

      return ret;
    }
  }

  /**
   * The extracted action from the sentence.
   */
  public class SemanticRolesResultAction extends IBMWatsonGenericModel {
    private String text;
    private String normalized;
    private SemanticRolesVerb verb;

    /**
     * Gets the text.
     *
     * Analyzed text that corresponds to the action.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the normalized.
     *
     * normalized version of the action.
     *
     * @return the normalized
     */
    @AuraEnabled
    public String getNormalized() {
      return normalized;
    }

    /**
     * Gets the verb.
     *
     * @return the verb
     */
    @AuraEnabled
    public SemanticRolesVerb getVerb() {
      return verb;
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
     * Sets the normalized.
     *
     * @param normalized the new normalized
     */
    public void setNormalized(final String normalized) {
      this.normalized = normalized;
    }

    /**
     * Sets the verb.
     *
     * @param verb the new verb
     */
    public void setVerb(final SemanticRolesVerb verb) {
      this.verb = verb;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SemanticRolesResultAction ret = (SemanticRolesResultAction) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for verb
      Map<String, Object> verbMap = (Map<String, Object>) jsonMap.get('verb');
      SemanticRolesVerb newVerb = (SemanticRolesVerb) new SemanticRolesVerb().deserialize(JSON.serialize(verbMap, true), verbMap, SemanticRolesVerb.class);
      ret.setVerb(newVerb);

      return ret;
    }
  }

  /**
   * The extracted object from the sentence.
   */
  public class SemanticRolesResultObject extends IBMWatsonGenericModel {
    private String text;
    private List<SemanticRolesKeyword> keywords;

    /**
     * Gets the text.
     *
     * Object text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the keywords.
     *
     * An array of extracted keywords.
     *
     * @return the keywords
     */
    @AuraEnabled
    public List<SemanticRolesKeyword> getKeywords() {
      return keywords;
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
     * Sets the keywords.
     *
     * @param keywords the new keywords
     */
    public void setKeywords(final List<SemanticRolesKeyword> keywords) {
      this.keywords = keywords;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SemanticRolesResultObject ret = (SemanticRolesResultObject) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for keywords
      List<SemanticRolesKeyword> newKeywords = new List<SemanticRolesKeyword>();
      List<SemanticRolesKeyword> deserializedKeywords = ret.getKeywords();
      if (deserializedKeywords != null) {
        for (Integer i = 0; i < deserializedKeywords.size(); i++) {
          SemanticRolesKeyword currentItem = ret.getKeywords().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('keywords');
          SemanticRolesKeyword newItem = (SemanticRolesKeyword) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SemanticRolesKeyword.class);
          newKeywords.add(newItem);
        }
        ret.keywords = newKeywords;
      }

      return ret;
    }
  }

  /**
   * The extracted subject from the sentence.
   */
  public class SemanticRolesResultSubject extends IBMWatsonGenericModel {
    private String text;
    private List<SemanticRolesEntity> entities;
    private List<SemanticRolesKeyword> keywords;

    /**
     * Gets the text.
     *
     * Text that corresponds to the subject role.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the entities.
     *
     * An array of extracted entities.
     *
     * @return the entities
     */
    @AuraEnabled
    public List<SemanticRolesEntity> getEntities() {
      return entities;
    }

    /**
     * Gets the keywords.
     *
     * An array of extracted keywords.
     *
     * @return the keywords
     */
    @AuraEnabled
    public List<SemanticRolesKeyword> getKeywords() {
      return keywords;
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
     * Sets the entities.
     *
     * @param entities the new entities
     */
    public void setEntities(final List<SemanticRolesEntity> entities) {
      this.entities = entities;
    }

    /**
     * Sets the keywords.
     *
     * @param keywords the new keywords
     */
    public void setKeywords(final List<SemanticRolesKeyword> keywords) {
      this.keywords = keywords;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SemanticRolesResultSubject ret = (SemanticRolesResultSubject) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for entities
      List<SemanticRolesEntity> newEntities = new List<SemanticRolesEntity>();
      List<SemanticRolesEntity> deserializedEntities = ret.getEntities();
      if (deserializedEntities != null) {
        for (Integer i = 0; i < deserializedEntities.size(); i++) {
          SemanticRolesEntity currentItem = ret.getEntities().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('entities');
          SemanticRolesEntity newItem = (SemanticRolesEntity) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SemanticRolesEntity.class);
          newEntities.add(newItem);
        }
        ret.entities = newEntities;
      }

      // calling custom deserializer for keywords
      List<SemanticRolesKeyword> newKeywords = new List<SemanticRolesKeyword>();
      List<SemanticRolesKeyword> deserializedKeywords = ret.getKeywords();
      if (deserializedKeywords != null) {
        for (Integer i = 0; i < deserializedKeywords.size(); i++) {
          SemanticRolesKeyword currentItem = ret.getKeywords().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('keywords');
          SemanticRolesKeyword newItem = (SemanticRolesKeyword) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SemanticRolesKeyword.class);
          newKeywords.add(newItem);
        }
        ret.keywords = newKeywords;
      }

      return ret;
    }
  }

  /**
   * SemanticRolesVerb.
   */
  public class SemanticRolesVerb extends IBMWatsonGenericModel {
    private String text;
    private String tense;

    /**
     * Gets the text.
     *
     * The keyword text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the tense.
     *
     * Verb tense.
     *
     * @return the tense
     */
    @AuraEnabled
    public String getTense() {
      return tense;
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
     * Sets the tense.
     *
     * @param tense the new tense
     */
    public void setTense(final String tense) {
      this.tense = tense;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SemanticRolesVerb ret = (SemanticRolesVerb) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * SentenceResult.
   */
  public class SentenceResult extends IBMWatsonGenericModel {
    private String text;
    private List<Long> location;

    /**
     * Gets the text.
     *
     * The sentence.
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
     * Character offsets indicating the beginning and end of the sentence in the analyzed text.
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

      SentenceResult ret = (SentenceResult) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Analyzes the general sentiment of your content or the sentiment toward specific target phrases. You can analyze
   * sentiment for detected entities with `entities.sentiment` and for keywords with `keywords.sentiment`.
   *
   *  Supported languages: Arabic, English, French, German, Italian, Japanese, Korean, Portuguese, Russian, Spanish.
   */
  public class SentimentOptions extends IBMWatsonGenericModel {
    private Boolean document;
    private List<String> targets;

    /**
     * Gets the document.
     *
     * Set this to `false` to hide document-level sentiment results.
     *
     * @return the document
     */
    public Boolean document() {
      return document;
    }

    /**
     * Gets the targets.
     *
     * Sentiment results will be returned for each target string that is found in the document.
     *
     * @return the targets
     */
    public List<String> targets() {
      return targets;
    }
  
    private SentimentOptions(SentimentOptionsBuilder builder) {
      this.document = builder.document;
      this.targets = builder.targets;
    }

    /**
     * New builder.
     *
     * @return a SentimentOptions builder
     */
    public SentimentOptionsBuilder newBuilder() {
      return new SentimentOptionsBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * SentimentOptions Builder.
   */
  public class SentimentOptionsBuilder {
    private Boolean document;
    private List<String> targets;

    private SentimentOptionsBuilder(SentimentOptions sentimentOptions) {
      this.document = sentimentOptions.document;
      this.targets = sentimentOptions.targets;
    }

    /**
     * Instantiates a new builder.
     */
    public SentimentOptionsBuilder() {
    }

    /**
     * Builds a SentimentOptions.
     *
     * @return the sentimentOptions
     */
    public SentimentOptions build() {
      return new SentimentOptions(this);
    }

    /**
     * Adds an targets to targets.
     *
     * @param targets the new targets
     * @return the SentimentOptions builder
     */
    public SentimentOptionsBuilder addTargets(String targets) {
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
     * @return the SentimentOptions builder
     */
    public SentimentOptionsBuilder document(Boolean document) {
      this.document = document;
      return this;
    }

    /**
     * Set the targets.
     * Existing targets will be replaced.
     *
     * @param targets the targets
     * @return the SentimentOptions builder
     */
    public SentimentOptionsBuilder targets(List<String> targets) {
      this.targets = targets;
      return this;
    }
  }

  /**
   * The sentiment of the content.
   */
  public class SentimentResult extends IBMWatsonGenericModel {
    private DocumentSentimentResults document;
    private List<TargetedSentimentResults> targets;

    /**
     * Gets the document.
     *
     * The document level sentiment.
     *
     * @return the document
     */
    @AuraEnabled
    public DocumentSentimentResults getDocument() {
      return document;
    }

    /**
     * Gets the targets.
     *
     * The targeted sentiment to analyze.
     *
     * @return the targets
     */
    @AuraEnabled
    public List<TargetedSentimentResults> getTargets() {
      return targets;
    }

    /**
     * Sets the document.
     *
     * @param document the new document
     */
    public void setDocument(final DocumentSentimentResults document) {
      this.document = document;
    }

    /**
     * Sets the targets.
     *
     * @param targets the new targets
     */
    public void setTargets(final List<TargetedSentimentResults> targets) {
      this.targets = targets;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SentimentResult ret = (SentimentResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for document
      Map<String, Object> documentMap = (Map<String, Object>) jsonMap.get('document');
      DocumentSentimentResults newDocument = (DocumentSentimentResults) new DocumentSentimentResults().deserialize(JSON.serialize(documentMap, true), documentMap, DocumentSentimentResults.class);
      ret.setDocument(newDocument);

      // calling custom deserializer for targets
      List<TargetedSentimentResults> newTargets = new List<TargetedSentimentResults>();
      List<TargetedSentimentResults> deserializedTargets = ret.getTargets();
      if (deserializedTargets != null) {
        for (Integer i = 0; i < deserializedTargets.size(); i++) {
          TargetedSentimentResults currentItem = ret.getTargets().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('targets');
          TargetedSentimentResults newItem = (TargetedSentimentResults) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TargetedSentimentResults.class);
          newTargets.add(newItem);
        }
        ret.targets = newTargets;
      }

      return ret;
    }
  }

  /**
   * Returns tokens and sentences from the input text.
   */
  public class SyntaxOptions extends IBMWatsonGenericModel {
    private SyntaxOptionsTokens tokens;
    private Boolean sentences;

    /**
     * Gets the tokens.
     *
     * Tokenization options.
     *
     * @return the tokens
     */
    public SyntaxOptionsTokens tokens() {
      return tokens;
    }

    /**
     * Gets the sentences.
     *
     * Set this to `true` to return sentence information.
     *
     * @return the sentences
     */
    public Boolean sentences() {
      return sentences;
    }
  
    private SyntaxOptions(SyntaxOptionsBuilder builder) {
      this.tokens = builder.tokens;
      this.sentences = builder.sentences;
    }

    /**
     * New builder.
     *
     * @return a SyntaxOptions builder
     */
    public SyntaxOptionsBuilder newBuilder() {
      return new SyntaxOptionsBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for tokens
      if (tokens != null) {
        String tokensJsonString = JSON.serialize(tokens.replacePropertyNames(), true);
        jsonMap.put('tokens', JSON.deserializeUntyped(tokensJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * SyntaxOptions Builder.
   */
  public class SyntaxOptionsBuilder {
    private SyntaxOptionsTokens tokens;
    private Boolean sentences;

    private SyntaxOptionsBuilder(SyntaxOptions syntaxOptions) {
      this.tokens = syntaxOptions.tokens;
      this.sentences = syntaxOptions.sentences;
    }

    /**
     * Instantiates a new builder.
     */
    public SyntaxOptionsBuilder() {
    }

    /**
     * Builds a SyntaxOptions.
     *
     * @return the syntaxOptions
     */
    public SyntaxOptions build() {
      return new SyntaxOptions(this);
    }

    /**
     * Set the tokens.
     *
     * @param tokens the tokens
     * @return the SyntaxOptions builder
     */
    public SyntaxOptionsBuilder tokens(SyntaxOptionsTokens tokens) {
      this.tokens = tokens;
      return this;
    }

    /**
     * Set the sentences.
     *
     * @param sentences the sentences
     * @return the SyntaxOptions builder
     */
    public SyntaxOptionsBuilder sentences(Boolean sentences) {
      this.sentences = sentences;
      return this;
    }
  }

  /**
   * Tokenization options.
   */
  public class SyntaxOptionsTokens extends IBMWatsonGenericModel {
    private Boolean lemma;
    private Boolean partOfSpeech;

    /**
     * Gets the lemma.
     *
     * Set this to `true` to return the lemma for each token.
     *
     * @return the lemma
     */
    public Boolean getLemma() {
      return lemma;
    }

    /**
     * Gets the partOfSpeech.
     *
     * Set this to `true` to return the part of speech for each token.
     *
     * @return the partOfSpeech
     */
    public Boolean getPartOfSpeech() {
      return partOfSpeech;
    }
  
    private SyntaxOptionsTokens(SyntaxOptionsTokensBuilder builder) {
      this.lemma = builder.lemma;
      this.partOfSpeech = builder.partOfSpeech;
    }

    /**
     * New builder.
     *
     * @return a SyntaxOptionsTokens builder
     */
    public SyntaxOptionsTokensBuilder newBuilder() {
      return new SyntaxOptionsTokensBuilder(this);
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
   * SyntaxOptionsTokens Builder.
   */
  public class SyntaxOptionsTokensBuilder {
    private Boolean lemma;
    private Boolean partOfSpeech;

    private SyntaxOptionsTokensBuilder(SyntaxOptionsTokens syntaxOptionsTokens) {
      this.lemma = syntaxOptionsTokens.lemma;
      this.partOfSpeech = syntaxOptionsTokens.partOfSpeech;
    }

    /**
     * Instantiates a new builder.
     */
    public SyntaxOptionsTokensBuilder() {
    }

    /**
     * Builds a SyntaxOptionsTokens.
     *
     * @return the syntaxOptionsTokens
     */
    public SyntaxOptionsTokens build() {
      return new SyntaxOptionsTokens(this);
    }

    /**
     * Set the lemma.
     *
     * @param lemma the lemma
     * @return the SyntaxOptionsTokens builder
     */
    public SyntaxOptionsTokensBuilder lemma(Boolean lemma) {
      this.lemma = lemma;
      return this;
    }

    /**
     * Set the partOfSpeech.
     *
     * @param partOfSpeech the partOfSpeech
     * @return the SyntaxOptionsTokens builder
     */
    public SyntaxOptionsTokensBuilder partOfSpeech(Boolean partOfSpeech) {
      this.partOfSpeech = partOfSpeech;
      return this;
    }
  }

  /**
   * Tokens and sentences returned from syntax analysis.
   */
  public class SyntaxResult extends IBMWatsonGenericModel {
    private List<TokenResult> tokens;
    private List<SentenceResult> sentences;

    /**
     * Gets the tokens.
     *
     * @return the tokens
     */
    @AuraEnabled
    public List<TokenResult> getTokens() {
      return tokens;
    }

    /**
     * Gets the sentences.
     *
     * @return the sentences
     */
    @AuraEnabled
    public List<SentenceResult> getSentences() {
      return sentences;
    }

    /**
     * Sets the tokens.
     *
     * @param tokens the new tokens
     */
    public void setTokens(final List<TokenResult> tokens) {
      this.tokens = tokens;
    }

    /**
     * Sets the sentences.
     *
     * @param sentences the new sentences
     */
    public void setSentences(final List<SentenceResult> sentences) {
      this.sentences = sentences;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SyntaxResult ret = (SyntaxResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for tokens
      List<TokenResult> newTokens = new List<TokenResult>();
      List<TokenResult> deserializedTokens = ret.getTokens();
      if (deserializedTokens != null) {
        for (Integer i = 0; i < deserializedTokens.size(); i++) {
          TokenResult currentItem = ret.getTokens().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tokens');
          TokenResult newItem = (TokenResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TokenResult.class);
          newTokens.add(newItem);
        }
        ret.tokens = newTokens;
      }

      // calling custom deserializer for sentences
      List<SentenceResult> newSentences = new List<SentenceResult>();
      List<SentenceResult> deserializedSentences = ret.getSentences();
      if (deserializedSentences != null) {
        for (Integer i = 0; i < deserializedSentences.size(); i++) {
          SentenceResult currentItem = ret.getSentences().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('sentences');
          SentenceResult newItem = (SentenceResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SentenceResult.class);
          newSentences.add(newItem);
        }
        ret.sentences = newSentences;
      }

      return ret;
    }
  }

  /**
   * Emotion results for a specified target.
   */
  public class TargetedEmotionResults extends IBMWatsonGenericModel {
    private String text;
    private EmotionScores emotion;

    /**
     * Gets the text.
     *
     * Targeted text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the emotion.
     *
     * The emotion results for the target.
     *
     * @return the emotion
     */
    @AuraEnabled
    public EmotionScores getEmotion() {
      return emotion;
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
     * Sets the emotion.
     *
     * @param emotion the new emotion
     */
    public void setEmotion(final EmotionScores emotion) {
      this.emotion = emotion;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TargetedEmotionResults ret = (TargetedEmotionResults) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for emotion
      Map<String, Object> emotionMap = (Map<String, Object>) jsonMap.get('emotion');
      EmotionScores newEmotion = (EmotionScores) new EmotionScores().deserialize(JSON.serialize(emotionMap, true), emotionMap, EmotionScores.class);
      ret.setEmotion(newEmotion);

      return ret;
    }
  }

  /**
   * TargetedSentimentResults.
   */
  public class TargetedSentimentResults extends IBMWatsonGenericModel {
    private String text;
    private Double score;

    /**
     * Gets the text.
     *
     * Targeted text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the score.
     *
     * Sentiment score from -1 (negative) to 1 (positive).
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
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
     * Sets the score.
     *
     * @param score the new score
     */
    public void setScore(final Double score) {
      this.score = score;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TargetedSentimentResults ret = (TargetedSentimentResults) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * TokenResult.
   */
  public class TokenResult extends IBMWatsonGenericModel {
    private String text;
    private String partOfSpeech;
    private List<Long> location;
    private String lemma;

    /**
     * Gets the text.
     *
     * The token as it appears in the analyzed text.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the partOfSpeech.
     *
     * The part of speech of the token. For descriptions of the values, see [Universal Dependencies POS
     * tags](https://universaldependencies.org/u/pos/).
     *
     * @return the partOfSpeech
     */
    @AuraEnabled
    public String getPartOfSpeech() {
      return partOfSpeech;
    }

    /**
     * Gets the location.
     *
     * Character offsets indicating the beginning and end of the token in the analyzed text.
     *
     * @return the location
     */
    @AuraEnabled
    public List<Long> getLocation() {
      return location;
    }

    /**
     * Gets the lemma.
     *
     * The [lemma](https://wikipedia.org/wiki/Lemma_%28morphology%29) of the token.
     *
     * @return the lemma
     */
    @AuraEnabled
    public String getLemma() {
      return lemma;
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
     * Sets the partOfSpeech.
     *
     * @param partOfSpeech the new partOfSpeech
     */
    public void setPartOfSpeech(final String partOfSpeech) {
      this.partOfSpeech = partOfSpeech;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final List<Long> location) {
      this.location = location;
    }

    /**
     * Sets the lemma.
     *
     * @param lemma the new lemma
     */
    public void setLemma(final String lemma) {
      this.lemma = lemma;
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

      TokenResult ret = (TokenResult) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

}