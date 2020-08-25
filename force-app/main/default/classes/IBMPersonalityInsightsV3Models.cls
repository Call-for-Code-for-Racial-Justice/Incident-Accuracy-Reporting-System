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

public class IBMPersonalityInsightsV3Models {
  /**
   * The temporal behavior for the input content.
   */
  public class Behavior extends IBMWatsonGenericModel {
    private String traitId;
    private String name;
    private String category;
    private Double percentage;

    /**
     * Gets the traitId.
     *
     * The unique, non-localized identifier of the characteristic to which the results pertain. IDs have the form
     * `behavior_{value}`.
     *
     * @return the traitId
     */
    @AuraEnabled
    public String getTraitId() {
      return traitId;
    }

    /**
     * Gets the name.
     *
     * The user-visible, localized name of the characteristic.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the category.
     *
     * The category of the characteristic: `behavior` for temporal data.
     *
     * @return the category
     */
    @AuraEnabled
    public String getCategory() {
      return category;
    }

    /**
     * Gets the percentage.
     *
     * For JSON content that is timestamped, the percentage of timestamped input data that occurred during that day of
     * the week or hour of the day. The range is 0 to 1.
     *
     * @return the percentage
     */
    @AuraEnabled
    public Double getPercentage() {
      return percentage;
    }

    /**
     * Sets the traitId.
     *
     * @param traitId the new traitId
     */
    public void setTraitId(final String traitId) {
      this.traitId = traitId;
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
     * Sets the category.
     *
     * @param category the new category
     */
    public void setCategory(final String category) {
      this.category = category;
    }

    /**
     * Sets the percentage.
     *
     * @param percentage the new percentage
     */
    public void setPercentage(final Double percentage) {
      this.percentage = percentage;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'trait_id' => 'traitId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Behavior ret = (Behavior) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A consumption preference that the service inferred from the input content.
   */
  public class ConsumptionPreferences extends IBMWatsonGenericModel {
    private String consumptionPreferenceId;
    private String name;
    private Double score;

    /**
     * Gets the consumptionPreferenceId.
     *
     * The unique, non-localized identifier of the consumption preference to which the results pertain. IDs have the
     * form `consumption_preferences_{preference}`.
     *
     * @return the consumptionPreferenceId
     */
    @AuraEnabled
    public String getConsumptionPreferenceId() {
      return consumptionPreferenceId;
    }

    /**
     * Gets the name.
     *
     * The user-visible, localized name of the consumption preference.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the score.
     *
     * The score for the consumption preference:
     * * `0.0`: Unlikely
     * * `0.5`: Neutral
     * * `1.0`: Likely
     *
     * The scores for some preferences are binary and do not allow a neutral value. The score is an indication of
     * preference based on the results inferred from the input text, not a normalized percentile.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Sets the consumptionPreferenceId.
     *
     * @param consumptionPreferenceId the new consumptionPreferenceId
     */
    public void setConsumptionPreferenceId(final String consumptionPreferenceId) {
      this.consumptionPreferenceId = consumptionPreferenceId;
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

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'consumption_preference_id' => 'consumptionPreferenceId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ConsumptionPreferences ret = (ConsumptionPreferences) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The consumption preferences that the service inferred from the input content.
   */
  public class ConsumptionPreferencesCategory extends IBMWatsonGenericModel {
    private String consumptionPreferenceCategoryId;
    private String name;
    private List<ConsumptionPreferences> consumptionPreferences;

    /**
     * Gets the consumptionPreferenceCategoryId.
     *
     * The unique, non-localized identifier of the consumption preferences category to which the results pertain. IDs
     * have the form `consumption_preferences_{category}`.
     *
     * @return the consumptionPreferenceCategoryId
     */
    @AuraEnabled
    public String getConsumptionPreferenceCategoryId() {
      return consumptionPreferenceCategoryId;
    }

    /**
     * Gets the name.
     *
     * The user-visible name of the consumption preferences category.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the consumptionPreferences.
     *
     * Detailed results inferred from the input text for the individual preferences of the category.
     *
     * @return the consumptionPreferences
     */
    @AuraEnabled
    public List<ConsumptionPreferences> getConsumptionPreferences() {
      return consumptionPreferences;
    }

    /**
     * Sets the consumptionPreferenceCategoryId.
     *
     * @param consumptionPreferenceCategoryId the new consumptionPreferenceCategoryId
     */
    public void setConsumptionPreferenceCategoryId(final String consumptionPreferenceCategoryId) {
      this.consumptionPreferenceCategoryId = consumptionPreferenceCategoryId;
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
     * Sets the consumptionPreferences.
     *
     * @param consumptionPreferences the new consumptionPreferences
     */
    public void setConsumptionPreferences(final List<ConsumptionPreferences> consumptionPreferences) {
      this.consumptionPreferences = consumptionPreferences;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'consumption_preference_category_id' => 'consumptionPreferenceCategoryId',
        'consumption_preferences' => 'consumptionPreferences'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ConsumptionPreferencesCategory ret = (ConsumptionPreferencesCategory) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for consumptionPreferences
      List<ConsumptionPreferences> newConsumptionPreferences = new List<ConsumptionPreferences>();
      List<ConsumptionPreferences> deserializedConsumptionPreferences = ret.getConsumptionPreferences();
      if (deserializedConsumptionPreferences != null) {
        for (Integer i = 0; i < deserializedConsumptionPreferences.size(); i++) {
          ConsumptionPreferences currentItem = ret.getConsumptionPreferences().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('consumptionPreferences');
          ConsumptionPreferences newItem = (ConsumptionPreferences) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ConsumptionPreferences.class);
          newConsumptionPreferences.add(newItem);
        }
        ret.consumptionPreferences = newConsumptionPreferences;
      }

      return ret;
    }
  }

  /**
   * The full input content that the service is to analyze.
   */
  public class Content extends IBMWatsonGenericModel {
    private List<ContentItem> contentItems;

    /**
     * Gets the contentItems.
     *
     * An array of `ContentItem` objects that provides the text that is to be analyzed.
     *
     * @return the contentItems
     */
    public List<ContentItem> contentItems() {
      return contentItems;
    }
  
    private Content(ContentBuilder builder) {
      IBMWatsonValidator.notNull(builder.contentItems, 'contentItems cannot be null');
      this.contentItems = builder.contentItems;
    }

    /**
     * New builder.
     *
     * @return a Content builder
     */
    public ContentBuilder newBuilder() {
      return new ContentBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for contentItems
      if (contentItems != null) {
        List<Object> contentItemsJsonList = new List<Object>();
        for (ContentItem listItem : contentItems) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          contentItemsJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('contentItems', contentItemsJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * Content Builder.
   */
  public class ContentBuilder {
    private List<ContentItem> contentItems;

    private ContentBuilder(Content content) {
      this.contentItems = content.contentItems;
    }

    /**
     * Instantiates a new builder.
     */
    public ContentBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param contentItems the contentItems
     */
    public ContentBuilder(List<ContentItem> contentItems) {
      this.contentItems = contentItems;
    }

    /**
     * Builds a Content.
     *
     * @return the content
     */
    public Content build() {
      return new Content(this);
    }

    /**
     * Adds an contentItems to contentItems.
     *
     * @param contentItems the new contentItems
     * @return the Content builder
     */
    public ContentBuilder addContentItems(ContentItem contentItems) {
      IBMWatsonValidator.notNull(contentItems, 'contentItems cannot be null');
      if (this.contentItems == null) {
        this.contentItems = new List<ContentItem>();
      }
      this.contentItems.add(contentItems);
      return this;
    }

    /**
     * Set the contentItems.
     * Existing contentItems will be replaced.
     *
     * @param contentItems the contentItems
     * @return the Content builder
     */
    public ContentBuilder contentItems(List<ContentItem> contentItems) {
      this.contentItems = contentItems;
      return this;
    }
  }

  /**
   * An input content item that the service is to analyze.
   */
  public class ContentItem extends IBMWatsonGenericModel {
    private String content;
    private String id;
    private Long created;
    private Long updated;
    private String contenttype;
    private String language;
    private String parentid;
    private Boolean reply;
    private Boolean forward;

    /**
     * Gets the content.
     *
     * The content that is to be analyzed. The service supports up to 20 MB of content for all `ContentItem` objects
     * combined.
     *
     * @return the content
     */
    public String content() {
      return content;
    }

    /**
     * Gets the id.
     *
     * A unique identifier for this content item.
     *
     * @return the id
     */
    public String id() {
      return id;
    }

    /**
     * Gets the created.
     *
     * A timestamp that identifies when this content was created. Specify a value in milliseconds since the UNIX Epoch
     * (January 1, 1970, at 0:00 UTC). Required only for results that include temporal behavior data.
     *
     * @return the created
     */
    public Long created() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * A timestamp that identifies when this content was last updated. Specify a value in milliseconds since the UNIX
     * Epoch (January 1, 1970, at 0:00 UTC). Required only for results that include temporal behavior data.
     *
     * @return the updated
     */
    public Long updated() {
      return updated;
    }

    /**
     * Gets the contenttype.
     *
     * The MIME type of the content. The default is plain text. The tags are stripped from HTML content before it is
     * analyzed; plain text is processed as submitted.
     *
     * @return the contenttype
     */
    public String contenttype() {
      return contenttype;
    }

    /**
     * Gets the language.
     *
     * The language identifier (two-letter ISO 639-1 identifier) for the language of the content item. The default is
     * `en` (English). Regional variants are treated as their parent language; for example, `en-US` is interpreted as
     * `en`. A language specified with the **Content-Type** parameter overrides the value of this parameter; any content
     * items that specify a different language are ignored. Omit the **Content-Type** parameter to base the language on
     * the most prevalent specification among the content items; again, content items that specify a different language
     * are ignored. You can specify any combination of languages for the input and response content.
     *
     * @return the language
     */
    public String language() {
      return language;
    }

    /**
     * Gets the parentid.
     *
     * The unique ID of the parent content item for this item. Used to identify hierarchical relationships between
     * posts/replies, messages/replies, and so on.
     *
     * @return the parentid
     */
    public String parentid() {
      return parentid;
    }

    /**
     * Gets the reply.
     *
     * Indicates whether this content item is a reply to another content item.
     *
     * @return the reply
     */
    public Boolean reply() {
      return reply;
    }

    /**
     * Gets the forward.
     *
     * Indicates whether this content item is a forwarded/copied version of another content item.
     *
     * @return the forward
     */
    public Boolean forward() {
      return forward;
    }
  
    private ContentItem(ContentItemBuilder builder) {
      IBMWatsonValidator.notNull(builder.content, 'content cannot be null');
      this.content = builder.content;
      this.id = builder.id;
      this.created = builder.created;
      this.updated = builder.updated;
      this.contenttype = builder.contenttype;
      this.language = builder.language;
      this.parentid = builder.parentid;
      this.reply = builder.reply;
      this.forward = builder.forward;
    }

    /**
     * New builder.
     *
     * @return a ContentItem builder
     */
    public ContentItemBuilder newBuilder() {
      return new ContentItemBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * ContentItem Builder.
   */
  public class ContentItemBuilder {
    private String content;
    private String id;
    private Long created;
    private Long updated;
    private String contenttype;
    private String language;
    private String parentid;
    private Boolean reply;
    private Boolean forward;

    private ContentItemBuilder(ContentItem contentItem) {
      this.content = contentItem.content;
      this.id = contentItem.id;
      this.created = contentItem.created;
      this.updated = contentItem.updated;
      this.contenttype = contentItem.contenttype;
      this.language = contentItem.language;
      this.parentid = contentItem.parentid;
      this.reply = contentItem.reply;
      this.forward = contentItem.forward;
    }

    /**
     * Instantiates a new builder.
     */
    public ContentItemBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param content the content
     */
    public ContentItemBuilder(String content) {
      this.content = content;
    }

    /**
     * Builds a ContentItem.
     *
     * @return the contentItem
     */
    public ContentItem build() {
      return new ContentItem(this);
    }

    /**
     * Set the content.
     *
     * @param content the content
     * @return the ContentItem builder
     */
    public ContentItemBuilder content(String content) {
      this.content = content;
      return this;
    }

    /**
     * Set the id.
     *
     * @param id the id
     * @return the ContentItem builder
     */
    public ContentItemBuilder id(String id) {
      this.id = id;
      return this;
    }

    /**
     * Set the created.
     *
     * @param created the created
     * @return the ContentItem builder
     */
    public ContentItemBuilder created(Long created) {
      this.created = created;
      return this;
    }

    /**
     * Set the updated.
     *
     * @param updated the updated
     * @return the ContentItem builder
     */
    public ContentItemBuilder updated(Long updated) {
      this.updated = updated;
      return this;
    }

    /**
     * Set the contenttype.
     *
     * @param contenttype the contenttype
     * @return the ContentItem builder
     */
    public ContentItemBuilder contenttype(String contenttype) {
      this.contenttype = contenttype;
      return this;
    }

    /**
     * Set the language.
     *
     * @param language the language
     * @return the ContentItem builder
     */
    public ContentItemBuilder language(String language) {
      this.language = language;
      return this;
    }

    /**
     * Set the parentid.
     *
     * @param parentid the parentid
     * @return the ContentItem builder
     */
    public ContentItemBuilder parentid(String parentid) {
      this.parentid = parentid;
      return this;
    }

    /**
     * Set the reply.
     *
     * @param reply the reply
     * @return the ContentItem builder
     */
    public ContentItemBuilder reply(Boolean reply) {
      this.reply = reply;
      return this;
    }

    /**
     * Set the forward.
     *
     * @param forward the forward
     * @return the ContentItem builder
     */
    public ContentItemBuilder forward(Boolean forward) {
      this.forward = forward;
      return this;
    }
  }

  /**
   * The personality profile that the service generated for the input content.
   */
  public class Profile extends IBMWatsonResponseModel {
    private String processedLanguage;
    private Long wordCount;
    private String wordCountMessage;
    private List<Trait> personality;
    private List<Trait> needs;
    private List<Trait> values;
    private List<Behavior> behavior;
    private List<ConsumptionPreferencesCategory> consumptionPreferences;
    private List<Warning> warnings;

    /**
     * Gets the processedLanguage.
     *
     * The language model that was used to process the input.
     *
     * @return the processedLanguage
     */
    @AuraEnabled
    public String getProcessedLanguage() {
      return processedLanguage;
    }

    /**
     * Gets the wordCount.
     *
     * The number of words from the input that were used to produce the profile.
     *
     * @return the wordCount
     */
    @AuraEnabled
    public Long getWordCount() {
      return wordCount;
    }

    /**
     * Gets the wordCountMessage.
     *
     * When guidance is appropriate, a string that provides a message that indicates the number of words found and where
     * that value falls in the range of required or suggested number of words.
     *
     * @return the wordCountMessage
     */
    @AuraEnabled
    public String getWordCountMessage() {
      return wordCountMessage;
    }

    /**
     * Gets the personality.
     *
     * A recursive array of `Trait` objects that provides detailed results for the Big Five personality characteristics
     * (dimensions and facets) inferred from the input text.
     *
     * @return the personality
     */
    @AuraEnabled
    public List<Trait> getPersonality() {
      return personality;
    }

    /**
     * Gets the needs.
     *
     * Detailed results for the Needs characteristics inferred from the input text.
     *
     * @return the needs
     */
    @AuraEnabled
    public List<Trait> getNeeds() {
      return needs;
    }

    /**
     * Gets the values.
     *
     * Detailed results for the Values characteristics inferred from the input text.
     *
     * @return the values
     */
    @AuraEnabled
    public List<Trait> getValues() {
      return values;
    }

    /**
     * Gets the behavior.
     *
     * For JSON content that is timestamped, detailed results about the social behavior disclosed by the input in terms
     * of temporal characteristics. The results include information about the distribution of the content over the days
     * of the week and the hours of the day.
     *
     * @return the behavior
     */
    @AuraEnabled
    public List<Behavior> getBehavior() {
      return behavior;
    }

    /**
     * Gets the consumptionPreferences.
     *
     * If the **consumption_preferences** parameter is `true`, detailed results for each category of consumption
     * preferences. Each element of the array provides information inferred from the input text for the individual
     * preferences of that category.
     *
     * @return the consumptionPreferences
     */
    @AuraEnabled
    public List<ConsumptionPreferencesCategory> getConsumptionPreferences() {
      return consumptionPreferences;
    }

    /**
     * Gets the warnings.
     *
     * An array of warning messages that are associated with the input text for the request. The array is empty if the
     * input generated no warnings.
     *
     * @return the warnings
     */
    @AuraEnabled
    public List<Warning> getWarnings() {
      return warnings;
    }

    /**
     * Sets the processedLanguage.
     *
     * @param processedLanguage the new processedLanguage
     */
    public void setProcessedLanguage(final String processedLanguage) {
      this.processedLanguage = processedLanguage;
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
     * Sets the wordCountMessage.
     *
     * @param wordCountMessage the new wordCountMessage
     */
    public void setWordCountMessage(final String wordCountMessage) {
      this.wordCountMessage = wordCountMessage;
    }

    /**
     * Sets the personality.
     *
     * @param personality the new personality
     */
    public void setPersonality(final List<Trait> personality) {
      this.personality = personality;
    }

    /**
     * Sets the needs.
     *
     * @param needs the new needs
     */
    public void setNeeds(final List<Trait> needs) {
      this.needs = needs;
    }

    /**
     * Sets the values.
     *
     * @param values the new values
     */
    public void setValues(final List<Trait> values) {
      this.values = values;
    }

    /**
     * Sets the behavior.
     *
     * @param behavior the new behavior
     */
    public void setBehavior(final List<Behavior> behavior) {
      this.behavior = behavior;
    }

    /**
     * Sets the consumptionPreferences.
     *
     * @param consumptionPreferences the new consumptionPreferences
     */
    public void setConsumptionPreferences(final List<ConsumptionPreferencesCategory> consumptionPreferences) {
      this.consumptionPreferences = consumptionPreferences;
    }

    /**
     * Sets the warnings.
     *
     * @param warnings the new warnings
     */
    public void setWarnings(final List<Warning> warnings) {
      this.warnings = warnings;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'processed_language' => 'processedLanguage',
        'word_count' => 'wordCount',
        'word_count_message' => 'wordCountMessage',
        'consumption_preferences' => 'consumptionPreferences'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Profile ret = (Profile) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for personality
      List<Trait> newPersonality = new List<Trait>();
      List<Trait> deserializedPersonality = ret.getPersonality();
      if (deserializedPersonality != null) {
        for (Integer i = 0; i < deserializedPersonality.size(); i++) {
          Trait currentItem = ret.getPersonality().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('personality');
          Trait newItem = (Trait) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Trait.class);
          newPersonality.add(newItem);
        }
        ret.personality = newPersonality;
      }

      // calling custom deserializer for needs
      List<Trait> newNeeds = new List<Trait>();
      List<Trait> deserializedNeeds = ret.getNeeds();
      if (deserializedNeeds != null) {
        for (Integer i = 0; i < deserializedNeeds.size(); i++) {
          Trait currentItem = ret.getNeeds().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('needs');
          Trait newItem = (Trait) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Trait.class);
          newNeeds.add(newItem);
        }
        ret.needs = newNeeds;
      }

      // calling custom deserializer for values
      List<Trait> newValues = new List<Trait>();
      List<Trait> deserializedValues = ret.getValues();
      if (deserializedValues != null) {
        for (Integer i = 0; i < deserializedValues.size(); i++) {
          Trait currentItem = ret.getValues().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('values');
          Trait newItem = (Trait) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Trait.class);
          newValues.add(newItem);
        }
        ret.values = newValues;
      }

      // calling custom deserializer for behavior
      List<Behavior> newBehavior = new List<Behavior>();
      List<Behavior> deserializedBehavior = ret.getBehavior();
      if (deserializedBehavior != null) {
        for (Integer i = 0; i < deserializedBehavior.size(); i++) {
          Behavior currentItem = ret.getBehavior().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('behavior');
          Behavior newItem = (Behavior) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Behavior.class);
          newBehavior.add(newItem);
        }
        ret.behavior = newBehavior;
      }

      // calling custom deserializer for consumptionPreferences
      List<ConsumptionPreferencesCategory> newConsumptionPreferences = new List<ConsumptionPreferencesCategory>();
      List<ConsumptionPreferencesCategory> deserializedConsumptionPreferences = ret.getConsumptionPreferences();
      if (deserializedConsumptionPreferences != null) {
        for (Integer i = 0; i < deserializedConsumptionPreferences.size(); i++) {
          ConsumptionPreferencesCategory currentItem = ret.getConsumptionPreferences().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('consumptionPreferences');
          ConsumptionPreferencesCategory newItem = (ConsumptionPreferencesCategory) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ConsumptionPreferencesCategory.class);
          newConsumptionPreferences.add(newItem);
        }
        ret.consumptionPreferences = newConsumptionPreferences;
      }

      // calling custom deserializer for warnings
      List<Warning> newWarnings = new List<Warning>();
      List<Warning> deserializedWarnings = ret.getWarnings();
      if (deserializedWarnings != null) {
        for (Integer i = 0; i < deserializedWarnings.size(); i++) {
          Warning currentItem = ret.getWarnings().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('warnings');
          Warning newItem = (Warning) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Warning.class);
          newWarnings.add(newItem);
        }
        ret.warnings = newWarnings;
      }

      return ret;
    }
  }

  /**
   * The profile options.
   */
  public class ProfileOptions extends IBMWatsonOptionsModel {
    private Content content;
    private String body;
    private String contentType;
    private String contentLanguage;
    private String acceptLanguage;
    private Boolean rawScores;
    private Boolean csvHeaders;
    private Boolean consumptionPreferences;

    /**
     * Gets the content.
     *
     * A maximum of 20 MB of content to analyze, though the service requires much less text; for more information, see
     * [Providing sufficient
     * input](https://cloud.ibm.com/docs/personality-insights?topic=personality-insights-input#sufficient). For
     * JSON input, provide an object of type `Content`.
     *
     * @return the content
     */
    public Content content() {
      return content;
    }

    /**
     * Gets the body.
     *
     * A maximum of 20 MB of content to analyze, though the service requires much less text; for more information, see
     * [Providing sufficient
     * input](https://cloud.ibm.com/docs/personality-insights?topic=personality-insights-input#sufficient). For
     * JSON input, provide an object of type `Content`.
     *
     * @return the body
     */
    public String body() {
      return body;
    }

    /**
     * Gets the contentType.
     *
     * The type of the input. For more information, see **Content types** in the method description.
     *
     * @return the contentType
     */
    public String contentType() {
      return contentType;
    }

    /**
     * Gets the contentLanguage.
     *
     * The language of the input text for the request: Arabic, English, Japanese, Korean, or Spanish. Regional variants
     * are treated as their parent language; for example, `en-US` is interpreted as `en`.
     *
     * The effect of the **Content-Language** parameter depends on the **Content-Type** parameter. When **Content-Type**
     * is `text/plain` or `text/html`, **Content-Language** is the only way to specify the language. When
     * **Content-Type** is `application/json`, **Content-Language** overrides a language specified with the `language`
     * parameter of a `ContentItem` object, and content items that specify a different language are ignored; omit this
     * parameter to base the language on the specification of the content items. You can specify any combination of
     * languages for **Content-Language** and **Accept-Language**.
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
     * language; for example, `en-US` is interpreted as `en`. You can specify any combination of languages for the input
     * and response content.
     *
     * @return the acceptLanguage
     */
    public String acceptLanguage() {
      return acceptLanguage;
    }

    /**
     * Gets the rawScores.
     *
     * Indicates whether a raw score in addition to a normalized percentile is returned for each characteristic; raw
     * scores are not compared with a sample population. By default, only normalized percentiles are returned.
     *
     * @return the rawScores
     */
    public Boolean rawScores() {
      return rawScores;
    }

    /**
     * Gets the csvHeaders.
     *
     * Indicates whether column labels are returned with a CSV response. By default, no column labels are returned.
     * Applies only when the response type is CSV (`text/csv`).
     *
     * @return the csvHeaders
     */
    public Boolean csvHeaders() {
      return csvHeaders;
    }

    /**
     * Gets the consumptionPreferences.
     *
     * Indicates whether consumption preferences are returned with the results. By default, no consumption preferences
     * are returned.
     *
     * @return the consumptionPreferences
     */
    public Boolean consumptionPreferences() {
      return consumptionPreferences;
    }

    private ProfileOptions(ProfileOptionsBuilder builder) {
      content = builder.content;
      body = builder.body;
      contentType = builder.contentType;
      contentLanguage = builder.contentLanguage;
      acceptLanguage = builder.acceptLanguage;
      rawScores = builder.rawScores;
      csvHeaders = builder.csvHeaders;
      consumptionPreferences = builder.consumptionPreferences;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ProfileOptions builder
     */
    public ProfileOptionsBuilder newBuilder() {
      return new ProfileOptionsBuilder(this);
    }
  }

  /**
   * ProfileOptions Builder.
   */
  public class ProfileOptionsBuilder extends IBMWatsonOptionsModel {
    private Content content;
    private String body;
    private String contentType;
    private String contentLanguage;
    private String acceptLanguage;
    private Boolean rawScores;
    private Boolean csvHeaders;
    private Boolean consumptionPreferences;

    private ProfileOptionsBuilder(ProfileOptions profileOptions) {
      content = profileOptions.content;
      body = profileOptions.body;
      contentType = profileOptions.contentType;
      contentLanguage = profileOptions.contentLanguage;
      acceptLanguage = profileOptions.acceptLanguage;
      rawScores = profileOptions.rawScores;
      csvHeaders = profileOptions.csvHeaders;
      consumptionPreferences = profileOptions.consumptionPreferences;
      this.requestHeaders.putAll(profileOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ProfileOptionsBuilder() {
    }

    /**
     * Builds a ProfileOptions.
     *
     * @return the profileOptions
     */
    public ProfileOptions build() {
      return new ProfileOptions(this);
    }

    /**
     * Set the contentLanguage.
     *
     * @param contentLanguage the contentLanguage
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder contentLanguage(String contentLanguage) {
      this.contentLanguage = contentLanguage;
      return this;
    }

    /**
     * Set the acceptLanguage.
     *
     * @param acceptLanguage the acceptLanguage
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder acceptLanguage(String acceptLanguage) {
      this.acceptLanguage = acceptLanguage;
      return this;
    }

    /**
     * Set the rawScores.
     *
     * @param rawScores the rawScores
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder rawScores(Boolean rawScores) {
      this.rawScores = rawScores;
      return this;
    }

    /**
     * Set the csvHeaders.
     *
     * @param csvHeaders the csvHeaders
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder csvHeaders(Boolean csvHeaders) {
      this.csvHeaders = csvHeaders;
      return this;
    }

    /**
     * Set the consumptionPreferences.
     *
     * @param consumptionPreferences the consumptionPreferences
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder consumptionPreferences(Boolean consumptionPreferences) {
      this.consumptionPreferences = consumptionPreferences;
      return this;
    }

    /**
     * Set the content.
     *
     * @param content the content
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder content(Content content) {
      this.content = content;
      this.contentType = IBMWatsonHttpMediaType.APPLICATION_JSON;
      return this;
    }

    /**
     * Set the html.
     *
     * @param html the html
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder html(String html) {
      this.body = html;
      this.contentType = IBMWatsonHttpMediaType.TEXT_HTML;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder text(String text) {
      this.body = text;
      this.contentType = IBMWatsonHttpMediaType.TEXT_PLAIN;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ProfileOptions builder
     */
    public ProfileOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The characteristics that the service inferred from the input content.
   */
  public class Trait extends IBMWatsonGenericModel {
    private String traitId;
    private String name;
    private String category;
    private Double percentile;
    private Double rawScore;
    private Boolean significant;
    private List<Trait> children;

    /**
     * Gets the traitId.
     *
     * The unique, non-localized identifier of the characteristic to which the results pertain. IDs have the form
     * * `big5_{characteristic}` for Big Five personality dimensions
     * * `facet_{characteristic}` for Big Five personality facets
     * * `need_{characteristic}` for Needs
     *  *`value_{characteristic}` for Values.
     *
     * @return the traitId
     */
    @AuraEnabled
    public String getTraitId() {
      return traitId;
    }

    /**
     * Gets the name.
     *
     * The user-visible, localized name of the characteristic.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the category.
     *
     * The category of the characteristic: `personality` for Big Five personality characteristics, `needs` for Needs,
     * and `values` for Values.
     *
     * @return the category
     */
    @AuraEnabled
    public String getCategory() {
      return category;
    }

    /**
     * Gets the percentile.
     *
     * The normalized percentile score for the characteristic. The range is 0 to 1. For example, if the percentage for
     * Openness is 0.60, the author scored in the 60th percentile; the author is more open than 59 percent of the
     * population and less open than 39 percent of the population.
     *
     * @return the percentile
     */
    @AuraEnabled
    public Double getPercentile() {
      return percentile;
    }

    /**
     * Gets the rawScore.
     *
     * The raw score for the characteristic. The range is 0 to 1. A higher score generally indicates a greater
     * likelihood that the author has that characteristic, but raw scores must be considered in aggregate: The range of
     * values in practice might be much smaller than 0 to 1, so an individual score must be considered in the context of
     * the overall scores and their range.
     *
     * The raw score is computed based on the input and the service model; it is not normalized or compared with a
     * sample population. The raw score enables comparison of the results against a different sampling population and
     * with a custom normalization approach.
     *
     * @return the rawScore
     */
    @AuraEnabled
    public Double getRawScore() {
      return rawScore;
    }

    /**
     * Gets the significant.
     *
     * **`2017-10-13`**: Indicates whether the characteristic is meaningful for the input language. The field is always
     * `true` for all characteristics of English, Spanish, and Japanese input. The field is `false` for the subset of
     * characteristics of Arabic and Korean input for which the service's models are unable to generate meaningful
     * results. **`2016-10-19`**: Not returned.
     *
     * @return the significant
     */
    @AuraEnabled
    public Boolean getSignificant() {
      return significant;
    }

    /**
     * Gets the children.
     *
     * For `personality` (Big Five) dimensions, more detailed results for the facets of each dimension as inferred from
     * the input text.
     *
     * @return the children
     */
    @AuraEnabled
    public List<Trait> getChildren() {
      return children;
    }

    /**
     * Sets the traitId.
     *
     * @param traitId the new traitId
     */
    public void setTraitId(final String traitId) {
      this.traitId = traitId;
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
     * Sets the category.
     *
     * @param category the new category
     */
    public void setCategory(final String category) {
      this.category = category;
    }

    /**
     * Sets the percentile.
     *
     * @param percentile the new percentile
     */
    public void setPercentile(final Double percentile) {
      this.percentile = percentile;
    }

    /**
     * Sets the rawScore.
     *
     * @param rawScore the new rawScore
     */
    public void setRawScore(final Double rawScore) {
      this.rawScore = rawScore;
    }

    /**
     * Sets the significant.
     *
     * @param significant the new significant
     */
    public void setSignificant(final Boolean significant) {
      this.significant = significant;
    }

    /**
     * Sets the children.
     *
     * @param children the new children
     */
    public void setChildren(final List<Trait> children) {
      this.children = children;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'trait_id' => 'traitId',
        'raw_score' => 'rawScore'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Trait ret = (Trait) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for children
      List<Trait> newChildren = new List<Trait>();
      List<Trait> deserializedChildren = ret.getChildren();
      if (deserializedChildren != null) {
        for (Integer i = 0; i < deserializedChildren.size(); i++) {
          Trait currentItem = ret.getChildren().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('children');
          Trait newItem = (Trait) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Trait.class);
          newChildren.add(newItem);
        }
        ret.children = newChildren;
      }

      return ret;
    }
  }

  /**
   * A warning message that is associated with the input content.
   */
  public class Warning extends IBMWatsonGenericModel {
    private String warningId;
    private String message;

    /**
     * Gets the warningId.
     *
     * The identifier of the warning message.
     *
     * @return the warningId
     */
    @AuraEnabled
    public String getWarningId() {
      return warningId;
    }

    /**
     * Gets the message.
     *
     * The message associated with the `warning_id`:
     * * `WORD_COUNT_MESSAGE`: "There were {number} words in the input. We need a minimum of 600, preferably 1,200 or
     * more, to compute statistically significant estimates."
     * * `JSON_AS_TEXT`: "Request input was processed as text/plain as indicated, however detected a JSON input. Did you
     * mean application/json?"
     * * `CONTENT_TRUNCATED`: "For maximum accuracy while also optimizing processing time, only the first 250KB of input
     * text (excluding markup) was analyzed. Accuracy levels off at approximately 3,000 words so this did not affect the
     * accuracy of the profile."
     * * `PARTIAL_TEXT_USED`, "The text provided to compute the profile was trimmed for performance reasons. This action
     * does not affect the accuracy of the output, as not all of the input text was required." Applies only when Arabic
     * input text exceeds a threshold at which additional words do not contribute to the accuracy of the profile.
     *
     * @return the message
     */
    @AuraEnabled
    public String getMessage() {
      return message;
    }

    /**
     * Sets the warningId.
     *
     * @param warningId the new warningId
     */
    public void setWarningId(final String warningId) {
      this.warningId = warningId;
    }

    /**
     * Sets the message.
     *
     * @param message the new message
     */
    public void setMessage(final String message) {
      this.message = message;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'warning_id' => 'warningId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Warning ret = (Warning) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

}