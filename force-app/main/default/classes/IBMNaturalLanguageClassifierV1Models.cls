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

public class IBMNaturalLanguageClassifierV1Models {
  /**
   * Response from the classifier for a phrase.
   */
  public class Classification extends IBMWatsonResponseModel {
    private String classifierId;
    private String url;
    private String text;
    private String topClass;
    private List<ClassifiedClass> classes;

    /**
     * Gets the classifierId.
     *
     * Unique identifier for this classifier.
     *
     * @return the classifierId
     */
    @AuraEnabled
    public String getClassifierId() {
      return classifierId;
    }

    /**
     * Gets the url.
     *
     * Link to the classifier.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the text.
     *
     * The submitted phrase.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the topClass.
     *
     * The class with the highest confidence.
     *
     * @return the topClass
     */
    @AuraEnabled
    public String getTopClass() {
      return topClass;
    }

    /**
     * Gets the classes.
     *
     * An array of up to ten class-confidence pairs sorted in descending order of confidence.
     *
     * @return the classes
     */
    @AuraEnabled
    public List<ClassifiedClass> getClasses() {
      return classes;
    }

    /**
     * Sets the classifierId.
     *
     * @param classifierId the new classifierId
     */
    public void setClassifierId(final String classifierId) {
      this.classifierId = classifierId;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the topClass.
     *
     * @param topClass the new topClass
     */
    public void setTopClass(final String topClass) {
      this.topClass = topClass;
    }

    /**
     * Sets the classes.
     *
     * @param classes the new classes
     */
    public void setClasses(final List<ClassifiedClass> classes) {
      this.classes = classes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'classifier_id' => 'classifierId',
        'top_class' => 'topClass'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Classification ret = (Classification) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for classes
      List<ClassifiedClass> newClasses = new List<ClassifiedClass>();
      List<ClassifiedClass> deserializedClasses = ret.getClasses();
      if (deserializedClasses != null) {
        for (Integer i = 0; i < deserializedClasses.size(); i++) {
          ClassifiedClass currentItem = ret.getClasses().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('classes');
          ClassifiedClass newItem = (ClassifiedClass) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ClassifiedClass.class);
          newClasses.add(newItem);
        }
        ret.classes = newClasses;
      }

      return ret;
    }
  }

  /**
   * Response from the classifier for multiple phrases.
   */
  public class ClassificationCollection extends IBMWatsonResponseModel {
    private String classifierId;
    private String url;
    private List<CollectionItem> collection;

    /**
     * Gets the classifierId.
     *
     * Unique identifier for this classifier.
     *
     * @return the classifierId
     */
    @AuraEnabled
    public String getClassifierId() {
      return classifierId;
    }

    /**
     * Gets the url.
     *
     * Link to the classifier.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the collection.
     *
     * An array of classifier responses for each submitted phrase.
     *
     * @return the collection
     */
    @AuraEnabled
    public List<CollectionItem> getCollection() {
      return collection;
    }

    /**
     * Sets the classifierId.
     *
     * @param classifierId the new classifierId
     */
    public void setClassifierId(final String classifierId) {
      this.classifierId = classifierId;
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
     * Sets the collection.
     *
     * @param collection the new collection
     */
    public void setCollection(final List<CollectionItem> collection) {
      this.collection = collection;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'classifier_id' => 'classifierId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ClassificationCollection ret = (ClassificationCollection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for collection
      List<CollectionItem> newCollection = new List<CollectionItem>();
      List<CollectionItem> deserializedCollection = ret.getCollection();
      if (deserializedCollection != null) {
        for (Integer i = 0; i < deserializedCollection.size(); i++) {
          CollectionItem currentItem = ret.getCollection().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('collection');
          CollectionItem newItem = (CollectionItem) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), CollectionItem.class);
          newCollection.add(newItem);
        }
        ret.collection = newCollection;
      }

      return ret;
    }
  }

  /**
   * Class and confidence.
   */
  public class ClassifiedClass extends IBMWatsonGenericModel {
    private Double confidence;
    private String className;

    /**
     * Gets the confidence.
     *
     * A decimal percentage that represents the confidence that Watson has in this class. Higher values represent higher
     * confidences.
     *
     * @return the confidence
     */
    @AuraEnabled
    public Double getConfidence() {
      return confidence;
    }

    /**
     * Gets the className.
     *
     * Class label.
     *
     * @return the className
     */
    @AuraEnabled
    public String getClassName() {
      return className;
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
     * Sets the className.
     *
     * @param className the new className
     */
    public void setClassName(final String className) {
      this.className = className;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'class_name' => 'className'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ClassifiedClass ret = (ClassifiedClass) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A classifier for natural language phrases.
   */
  public class Classifier extends IBMWatsonResponseModel {
    private String name;
    private String url;
    private String status;
    private String classifierId;
    private Datetime created;
    private String statusDescription;
    private String language;

    /**
     * Gets the name.
     *
     * User-supplied name for the classifier.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the url.
     *
     * Link to the classifier.
     *
     * @return the url
     */
    @AuraEnabled
    public String getUrl() {
      return url;
    }

    /**
     * Gets the status.
     *
     * The state of the classifier.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the classifierId.
     *
     * Unique identifier for this classifier.
     *
     * @return the classifierId
     */
    @AuraEnabled
    public String getClassifierId() {
      return classifierId;
    }

    /**
     * Gets the created.
     *
     * Date and time (UTC) the classifier was created.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the statusDescription.
     *
     * Additional detail about the status.
     *
     * @return the statusDescription
     */
    @AuraEnabled
    public String getStatusDescription() {
      return statusDescription;
    }

    /**
     * Gets the language.
     *
     * The language used for the classifier.
     *
     * @return the language
     */
    @AuraEnabled
    public String getLanguage() {
      return language;
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
     * Sets the url.
     *
     * @param url the new url
     */
    public void setUrl(final String url) {
      this.url = url;
    }

    /**
     * Sets the classifierId.
     *
     * @param classifierId the new classifierId
     */
    public void setClassifierId(final String classifierId) {
      this.classifierId = classifierId;
    }

    /**
     * Sets the language.
     *
     * @param language the new language
     */
    public void setLanguage(final String language) {
      this.language = language;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'classifier_id' => 'classifierId',
        'status_description' => 'statusDescription'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Classifier ret = (Classifier) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * List of available classifiers.
   */
  public class ClassifierList extends IBMWatsonResponseModel {
    private List<Classifier> classifiers;

    /**
     * Gets the classifiers.
     *
     * The classifiers available to the user. Returns an empty array if no classifiers are available.
     *
     * @return the classifiers
     */
    @AuraEnabled
    public List<Classifier> getClassifiers() {
      return classifiers;
    }

    /**
     * Sets the classifiers.
     *
     * @param classifiers the new classifiers
     */
    public void setClassifiers(final List<Classifier> classifiers) {
      this.classifiers = classifiers;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ClassifierList ret = (ClassifierList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for classifiers
      List<Classifier> newClassifiers = new List<Classifier>();
      List<Classifier> deserializedClassifiers = ret.getClassifiers();
      if (deserializedClassifiers != null) {
        for (Integer i = 0; i < deserializedClassifiers.size(); i++) {
          Classifier currentItem = ret.getClassifiers().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('classifiers');
          Classifier newItem = (Classifier) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Classifier.class);
          newClassifiers.add(newItem);
        }
        ret.classifiers = newClassifiers;
      }

      return ret;
    }
  }

  /**
   * The classifyCollection options.
   */
  public class ClassifyCollectionOptions extends IBMWatsonOptionsModel {
    private String classifierId;
    private List<ClassifyInput> collection;

    /**
     * Gets the classifierId.
     *
     * Classifier ID to use.
     *
     * @return the classifierId
     */
    public String classifierId() {
      return classifierId;
    }

    /**
     * Gets the collection.
     *
     * The submitted phrases.
     *
     * @return the collection
     */
    public List<ClassifyInput> collection() {
      return collection;
    }

    private ClassifyCollectionOptions(ClassifyCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.classifierId, 'classifierId cannot be empty');
      IBMWatsonValidator.notNull(builder.collection, 'collection cannot be null');
      classifierId = builder.classifierId;
      collection = builder.collection;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ClassifyCollectionOptions builder
     */
    public ClassifyCollectionOptionsBuilder newBuilder() {
      return new ClassifyCollectionOptionsBuilder(this);
    }
  }

  /**
   * ClassifyCollectionOptions Builder.
   */
  public class ClassifyCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String classifierId;
    private List<ClassifyInput> collection;

    private ClassifyCollectionOptionsBuilder(ClassifyCollectionOptions classifyCollectionOptions) {
      classifierId = classifyCollectionOptions.classifierId;
      collection = classifyCollectionOptions.collection;
      this.requestHeaders.putAll(classifyCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ClassifyCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param classifierId the classifierId
     * @param collection the collection
     */
    public ClassifyCollectionOptionsBuilder(String classifierId, List<ClassifyInput> collection) {
      this.classifierId = classifierId;
      this.collection = collection;
    }

    /**
     * Builds a ClassifyCollectionOptions.
     *
     * @return the classifyCollectionOptions
     */
    public ClassifyCollectionOptions build() {
      return new ClassifyCollectionOptions(this);
    }

    /**
     * Adds an collection to collection.
     *
     * @param collection the new collection
     * @return the ClassifyCollectionOptions builder
     */
    public ClassifyCollectionOptionsBuilder addCollection(ClassifyInput collection) {
      IBMWatsonValidator.notNull(collection, 'collection cannot be null');
      if (this.collection == null) {
        this.collection = new List<ClassifyInput>();
      }
      this.collection.add(collection);
      return this;
    }

    /**
     * Set the classifierId.
     *
     * @param classifierId the classifierId
     * @return the ClassifyCollectionOptions builder
     */
    public ClassifyCollectionOptionsBuilder classifierId(String classifierId) {
      this.classifierId = classifierId;
      return this;
    }

    /**
     * Set the collection.
     * Existing collection will be replaced.
     *
     * @param collection the collection
     * @return the ClassifyCollectionOptions builder
     */
    public ClassifyCollectionOptionsBuilder collection(List<ClassifyInput> collection) {
      this.collection = collection;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ClassifyCollectionOptions builder
     */
    public ClassifyCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Request payload to classify.
   */
  public class ClassifyInput extends IBMWatsonGenericModel {
    private String text;

    /**
     * Gets the text.
     *
     * The submitted phrase. The maximum length is 2048 characters.
     *
     * @return the text
     */
    public String getText() {
      return text;
    }
  
    private ClassifyInput(ClassifyInputBuilder builder) {
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      this.text = builder.text;
    }

    /**
     * New builder.
     *
     * @return a ClassifyInput builder
     */
    public ClassifyInputBuilder newBuilder() {
      return new ClassifyInputBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * ClassifyInput Builder.
   */
  public class ClassifyInputBuilder {
    private String text;

    private ClassifyInputBuilder(ClassifyInput classifyInput) {
      this.text = classifyInput.text;
    }

    /**
     * Instantiates a new builder.
     */
    public ClassifyInputBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param text the text
     */
    public ClassifyInputBuilder(String text) {
      this.text = text;
    }

    /**
     * Builds a ClassifyInput.
     *
     * @return the classifyInput
     */
    public ClassifyInput build() {
      return new ClassifyInput(this);
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the ClassifyInput builder
     */
    public ClassifyInputBuilder text(String text) {
      this.text = text;
      return this;
    }
  }

  /**
   * The classify options.
   */
  public class ClassifyOptions extends IBMWatsonOptionsModel {
    private String classifierId;
    private String text;

    /**
     * Gets the classifierId.
     *
     * Classifier ID to use.
     *
     * @return the classifierId
     */
    public String classifierId() {
      return classifierId;
    }

    /**
     * Gets the text.
     *
     * The submitted phrase. The maximum length is 2048 characters.
     *
     * @return the text
     */
    public String text() {
      return text;
    }

    private ClassifyOptions(ClassifyOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.classifierId, 'classifierId cannot be empty');
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      classifierId = builder.classifierId;
      text = builder.text;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ClassifyOptions builder
     */
    public ClassifyOptionsBuilder newBuilder() {
      return new ClassifyOptionsBuilder(this);
    }
  }

  /**
   * ClassifyOptions Builder.
   */
  public class ClassifyOptionsBuilder extends IBMWatsonOptionsModel {
    private String classifierId;
    private String text;

    private ClassifyOptionsBuilder(ClassifyOptions classifyOptions) {
      classifierId = classifyOptions.classifierId;
      text = classifyOptions.text;
      this.requestHeaders.putAll(classifyOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ClassifyOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param classifierId the classifierId
     * @param text the text
     */
    public ClassifyOptionsBuilder(String classifierId, String text) {
      this.classifierId = classifierId;
      this.text = text;
    }

    /**
     * Builds a ClassifyOptions.
     *
     * @return the classifyOptions
     */
    public ClassifyOptions build() {
      return new ClassifyOptions(this);
    }

    /**
     * Set the classifierId.
     *
     * @param classifierId the classifierId
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder classifierId(String classifierId) {
      this.classifierId = classifierId;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Response from the classifier for a phrase in a collection.
   */
  public class CollectionItem extends IBMWatsonGenericModel {
    private String text;
    private String topClass;
    private List<ClassifiedClass> classes;

    /**
     * Gets the text.
     *
     * The submitted phrase. The maximum length is 2048 characters.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the topClass.
     *
     * The class with the highest confidence.
     *
     * @return the topClass
     */
    @AuraEnabled
    public String getTopClass() {
      return topClass;
    }

    /**
     * Gets the classes.
     *
     * An array of up to ten class-confidence pairs sorted in descending order of confidence.
     *
     * @return the classes
     */
    @AuraEnabled
    public List<ClassifiedClass> getClasses() {
      return classes;
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
     * Sets the topClass.
     *
     * @param topClass the new topClass
     */
    public void setTopClass(final String topClass) {
      this.topClass = topClass;
    }

    /**
     * Sets the classes.
     *
     * @param classes the new classes
     */
    public void setClasses(final List<ClassifiedClass> classes) {
      this.classes = classes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'top_class' => 'topClass'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CollectionItem ret = (CollectionItem) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for classes
      List<ClassifiedClass> newClasses = new List<ClassifiedClass>();
      List<ClassifiedClass> deserializedClasses = ret.getClasses();
      if (deserializedClasses != null) {
        for (Integer i = 0; i < deserializedClasses.size(); i++) {
          ClassifiedClass currentItem = ret.getClasses().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('classes');
          ClassifiedClass newItem = (ClassifiedClass) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ClassifiedClass.class);
          newClasses.add(newItem);
        }
        ret.classes = newClasses;
      }

      return ret;
    }
  }

  /**
   * The createClassifier options.
   */
  public class CreateClassifierOptions extends IBMWatsonOptionsModel {
    private IBMWatsonFile trainingMetadata;
    private IBMWatsonFile trainingData;

    /**
     * Gets the trainingMetadata.
     *
     * Metadata in JSON format. The metadata identifies the language of the data, and an optional name to identify the
     * classifier. Specify the language with the 2-letter primary language code as assigned in ISO standard 639.
     *
     * Supported languages are English (`en`), Arabic (`ar`), French (`fr`), German, (`de`), Italian (`it`), Japanese
     * (`ja`), Korean (`ko`), Brazilian Portuguese (`pt`), and Spanish (`es`).
     *
     * @return the trainingMetadata
     */
    public IBMWatsonFile trainingMetadata() {
      return trainingMetadata;
    }

    /**
     * Gets the trainingData.
     *
     * Training data in CSV format. Each text value must have at least one class. The data can include up to 3,000
     * classes and 20,000 records. For details, see [Data
     * preparation](https://cloud.ibm.com/docs/natural-language-classifier?topic=natural-language-classifier-using-your-data).
     *
     * @return the trainingData
     */
    public IBMWatsonFile trainingData() {
      return trainingData;
    }

    private CreateClassifierOptions(CreateClassifierOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.trainingMetadata, 'trainingMetadata cannot be null');
      IBMWatsonValidator.notNull(builder.trainingData, 'trainingData cannot be null');
      trainingMetadata = builder.trainingMetadata;
      trainingData = builder.trainingData;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder newBuilder() {
      return new CreateClassifierOptionsBuilder(this);
    }
  }

  /**
   * CreateClassifierOptions Builder.
   */
  public class CreateClassifierOptionsBuilder extends IBMWatsonOptionsModel {
    private IBMWatsonFile trainingMetadata;
    private IBMWatsonFile trainingData;

    private CreateClassifierOptionsBuilder(CreateClassifierOptions createClassifierOptions) {
      trainingMetadata = createClassifierOptions.trainingMetadata;
      trainingData = createClassifierOptions.trainingData;
      this.requestHeaders.putAll(createClassifierOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateClassifierOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param trainingMetadata the trainingMetadata
     * @param trainingData the trainingData
     */
    public CreateClassifierOptionsBuilder(IBMWatsonFile trainingMetadata, IBMWatsonFile trainingData) {
      this.trainingMetadata = trainingMetadata;
      this.trainingData = trainingData;
    }

    /**
     * Builds a CreateClassifierOptions.
     *
     * @return the createClassifierOptions
     */
    public CreateClassifierOptions build() {
      return new CreateClassifierOptions(this);
    }

    /**
     * Set the trainingMetadata.
     *
     * @param trainingMetadata the trainingMetadata
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder trainingMetadata(IBMWatsonFile trainingMetadata) {
      this.trainingMetadata = trainingMetadata;
      return this;
    }

    /**
     * Set the trainingData.
     *
     * @param trainingData the trainingData
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder trainingData(IBMWatsonFile trainingData) {
      this.trainingData = trainingData;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteClassifier options.
   */
  public class DeleteClassifierOptions extends IBMWatsonOptionsModel {
    private String classifierId;

    /**
     * Gets the classifierId.
     *
     * Classifier ID to delete.
     *
     * @return the classifierId
     */
    public String classifierId() {
      return classifierId;
    }

    private DeleteClassifierOptions(DeleteClassifierOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.classifierId, 'classifierId cannot be empty');
      classifierId = builder.classifierId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteClassifierOptions builder
     */
    public DeleteClassifierOptionsBuilder newBuilder() {
      return new DeleteClassifierOptionsBuilder(this);
    }
  }

  /**
   * DeleteClassifierOptions Builder.
   */
  public class DeleteClassifierOptionsBuilder extends IBMWatsonOptionsModel {
    private String classifierId;

    private DeleteClassifierOptionsBuilder(DeleteClassifierOptions deleteClassifierOptions) {
      classifierId = deleteClassifierOptions.classifierId;
      this.requestHeaders.putAll(deleteClassifierOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteClassifierOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param classifierId the classifierId
     */
    public DeleteClassifierOptionsBuilder(String classifierId) {
      this.classifierId = classifierId;
    }

    /**
     * Builds a DeleteClassifierOptions.
     *
     * @return the deleteClassifierOptions
     */
    public DeleteClassifierOptions build() {
      return new DeleteClassifierOptions(this);
    }

    /**
     * Set the classifierId.
     *
     * @param classifierId the classifierId
     * @return the DeleteClassifierOptions builder
     */
    public DeleteClassifierOptionsBuilder classifierId(String classifierId) {
      this.classifierId = classifierId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteClassifierOptions builder
     */
    public DeleteClassifierOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getClassifier options.
   */
  public class GetClassifierOptions extends IBMWatsonOptionsModel {
    private String classifierId;

    /**
     * Gets the classifierId.
     *
     * Classifier ID to query.
     *
     * @return the classifierId
     */
    public String classifierId() {
      return classifierId;
    }

    private GetClassifierOptions(GetClassifierOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.classifierId, 'classifierId cannot be empty');
      classifierId = builder.classifierId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetClassifierOptions builder
     */
    public GetClassifierOptionsBuilder newBuilder() {
      return new GetClassifierOptionsBuilder(this);
    }
  }

  /**
   * GetClassifierOptions Builder.
   */
  public class GetClassifierOptionsBuilder extends IBMWatsonOptionsModel {
    private String classifierId;

    private GetClassifierOptionsBuilder(GetClassifierOptions getClassifierOptions) {
      classifierId = getClassifierOptions.classifierId;
      this.requestHeaders.putAll(getClassifierOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetClassifierOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param classifierId the classifierId
     */
    public GetClassifierOptionsBuilder(String classifierId) {
      this.classifierId = classifierId;
    }

    /**
     * Builds a GetClassifierOptions.
     *
     * @return the getClassifierOptions
     */
    public GetClassifierOptions build() {
      return new GetClassifierOptions(this);
    }

    /**
     * Set the classifierId.
     *
     * @param classifierId the classifierId
     * @return the GetClassifierOptions builder
     */
    public GetClassifierOptionsBuilder classifierId(String classifierId) {
      this.classifierId = classifierId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetClassifierOptions builder
     */
    public GetClassifierOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listClassifiers options.
   */
  public class ListClassifiersOptions extends IBMWatsonOptionsModel {

    private ListClassifiersOptions(ListClassifiersOptionsBuilder builder) {
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListClassifiersOptions builder
     */
    public ListClassifiersOptionsBuilder newBuilder() {
      return new ListClassifiersOptionsBuilder(this);
    }
  }

  /**
   * ListClassifiersOptions Builder.
   */
  public class ListClassifiersOptionsBuilder extends IBMWatsonOptionsModel {

    private ListClassifiersOptionsBuilder(ListClassifiersOptions listClassifiersOptions) {
      this.requestHeaders.putAll(listClassifiersOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListClassifiersOptionsBuilder() {
    }

    /**
     * Builds a ListClassifiersOptions.
     *
     * @return the listClassifiersOptions
     */
    public ListClassifiersOptions build() {
      return new ListClassifiersOptions(this);
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListClassifiersOptions builder
     */
    public ListClassifiersOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

}