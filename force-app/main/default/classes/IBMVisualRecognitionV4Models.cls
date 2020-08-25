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

public class IBMVisualRecognitionV4Models {
  /**
   * The addImageTrainingData options.
   */
  public class AddImageTrainingDataOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;
    private List<TrainingDataObject> objects;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the imageId.
     *
     * The identifier of the image.
     *
     * @return the imageId
     */
    public String imageId() {
      return imageId;
    }

    /**
     * Gets the objects.
     *
     * Training data for specific objects.
     *
     * @return the objects
     */
    public List<TrainingDataObject> objects() {
      return objects;
    }

    private AddImageTrainingDataOptions(AddImageTrainingDataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.imageId, 'imageId cannot be empty');
      collectionId = builder.collectionId;
      imageId = builder.imageId;
      objects = builder.objects;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AddImageTrainingDataOptions builder
     */
    public AddImageTrainingDataOptionsBuilder newBuilder() {
      return new AddImageTrainingDataOptionsBuilder(this);
    }
  }

  /**
   * AddImageTrainingDataOptions Builder.
   */
  public class AddImageTrainingDataOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;
    private List<TrainingDataObject> objects;

    private AddImageTrainingDataOptionsBuilder(AddImageTrainingDataOptions addImageTrainingDataOptions) {
      collectionId = addImageTrainingDataOptions.collectionId;
      imageId = addImageTrainingDataOptions.imageId;
      objects = addImageTrainingDataOptions.objects;
      this.requestHeaders.putAll(addImageTrainingDataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AddImageTrainingDataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     * @param imageId the imageId
     */
    public AddImageTrainingDataOptionsBuilder(String collectionId, String imageId) {
      this.collectionId = collectionId;
      this.imageId = imageId;
    }

    /**
     * Builds a AddImageTrainingDataOptions.
     *
     * @return the addImageTrainingDataOptions
     */
    public AddImageTrainingDataOptions build() {
      return new AddImageTrainingDataOptions(this);
    }

    /**
     * Adds an objects to objects.
     *
     * @param objects the new objects
     * @return the AddImageTrainingDataOptions builder
     */
    public AddImageTrainingDataOptionsBuilder addObjects(TrainingDataObject objects) {
      IBMWatsonValidator.notNull(objects, 'objects cannot be null');
      if (this.objects == null) {
        this.objects = new List<TrainingDataObject>();
      }
      this.objects.add(objects);
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the AddImageTrainingDataOptions builder
     */
    public AddImageTrainingDataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the imageId.
     *
     * @param imageId the imageId
     * @return the AddImageTrainingDataOptions builder
     */
    public AddImageTrainingDataOptionsBuilder imageId(String imageId) {
      this.imageId = imageId;
      return this;
    }

    /**
     * Set the objects.
     * Existing objects will be replaced.
     *
     * @param objects the objects
     * @return the AddImageTrainingDataOptions builder
     */
    public AddImageTrainingDataOptionsBuilder objects(List<TrainingDataObject> objects) {
      this.objects = objects;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AddImageTrainingDataOptions builder
     */
    public AddImageTrainingDataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The addImages options.
   */
  public class AddImagesOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private List<IBMWatsonFile> imagesFile;
    private List<String> imageUrl;
    private String trainingData;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the imagesFile.
     *
     * An array of image files (.jpg or .png) or .zip files with images.
     * - Include a maximum of 20 images in a request.
     * - Limit the .zip file to 100 MB.
     * - Limit each image file to 10 MB.
     *
     * You can also include an image with the **image_url** parameter.
     *
     * @return the imagesFile
     */
    public List<IBMWatsonFile> imagesFile() {
      return imagesFile;
    }

    /**
     * Gets the imageUrl.
     *
     * The array of URLs of image files (.jpg or .png).
     * - Include a maximum of 20 images in a request.
     * - Limit each image file to 10 MB.
     * - Minimum width and height is 30 pixels, but the service tends to perform better with images that are at least
     * 300 x 300 pixels. Maximum is 5400 pixels for either height or width.
     *
     * You can also include images with the **images_file** parameter.
     *
     * @return the imageUrl
     */
    public List<String> imageUrl() {
      return imageUrl;
    }

    /**
     * Gets the trainingData.
     *
     * Training data for a single image. Include training data only if you add one image with the request.
     *
     * The `object` property can contain alphanumeric, underscore, hyphen, space, and dot characters. It cannot begin
     * with the reserved prefix `sys-` and must be no longer than 32 characters.
     *
     * @return the trainingData
     */
    public String trainingData() {
      return trainingData;
    }

    private AddImagesOptions(AddImagesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      collectionId = builder.collectionId;
      imagesFile = builder.imagesFile;
      imageUrl = builder.imageUrl;
      trainingData = builder.trainingData;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AddImagesOptions builder
     */
    public AddImagesOptionsBuilder newBuilder() {
      return new AddImagesOptionsBuilder(this);
    }
  }

  /**
   * AddImagesOptions Builder.
   */
  public class AddImagesOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private List<IBMWatsonFile> imagesFile;
    private List<String> imageUrl;
    private String trainingData;

    private AddImagesOptionsBuilder(AddImagesOptions addImagesOptions) {
      collectionId = addImagesOptions.collectionId;
      imagesFile = addImagesOptions.imagesFile;
      imageUrl = addImagesOptions.imageUrl;
      trainingData = addImagesOptions.trainingData;
      this.requestHeaders.putAll(addImagesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AddImagesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     */
    public AddImagesOptionsBuilder(String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Builds a AddImagesOptions.
     *
     * @return the addImagesOptions
     */
    public AddImagesOptions build() {
      return new AddImagesOptions(this);
    }

    /**
     * Adds an imagesFile to imagesFile.
     *
     * @param imagesFile the new imagesFile
     * @return the AddImagesOptions builder
     */
    public AddImagesOptionsBuilder addImagesFile(IBMWatsonFile imagesFile) {
      IBMWatsonValidator.notNull(imagesFile, 'imagesFile cannot be null');
      if (this.imagesFile == null) {
        this.imagesFile = new List<IBMWatsonFile>();
      }
      this.imagesFile.add(imagesFile);
      return this;
    }

    /**
     * Adds an imageUrl to imageUrl.
     *
     * @param imageUrl the new imageUrl
     * @return the AddImagesOptions builder
     */
    public AddImagesOptionsBuilder addImageUrl(String imageUrl) {
      IBMWatsonValidator.notNull(imageUrl, 'imageUrl cannot be null');
      if (this.imageUrl == null) {
        this.imageUrl = new List<String>();
      }
      this.imageUrl.add(imageUrl);
      return this;
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the AddImagesOptions builder
     */
    public AddImagesOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the imagesFile.
     * Existing imagesFile will be replaced.
     *
     * @param imagesFile the imagesFile
     * @return the AddImagesOptions builder
     */
    public AddImagesOptionsBuilder imagesFile(List<IBMWatsonFile> imagesFile) {
      this.imagesFile = imagesFile;
      return this;
    }

    /**
     * Set the imageUrl.
     * Existing imageUrl will be replaced.
     *
     * @param imageUrl the imageUrl
     * @return the AddImagesOptions builder
     */
    public AddImagesOptionsBuilder imageUrl(List<String> imageUrl) {
      this.imageUrl = imageUrl;
      return this;
    }

    /**
     * Set the trainingData.
     *
     * @param trainingData the trainingData
     * @return the AddImagesOptions builder
     */
    public AddImagesOptionsBuilder trainingData(String trainingData) {
      this.trainingData = trainingData;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AddImagesOptions builder
     */
    public AddImagesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The analyze options.
   */
  public class AnalyzeOptions extends IBMWatsonOptionsModel {
    private List<String> collectionIds;
    private List<String> features;
    private List<IBMWatsonFile> imagesFile;
    private List<String> imageUrl;
    private Double threshold;

    /**
     * Gets the collectionIds.
     *
     * The IDs of the collections to analyze.
     *
     * @return the collectionIds
     */
    public List<String> collectionIds() {
      return collectionIds;
    }

    /**
     * Gets the features.
     *
     * The features to analyze.
     *
     * @return the features
     */
    public List<String> features() {
      return features;
    }

    /**
     * Gets the imagesFile.
     *
     * An array of image files (.jpg or .png) or .zip files with images.
     * - Include a maximum of 20 images in a request.
     * - Limit the .zip file to 100 MB.
     * - Limit each image file to 10 MB.
     *
     * You can also include an image with the **image_url** parameter.
     *
     * @return the imagesFile
     */
    public List<IBMWatsonFile> imagesFile() {
      return imagesFile;
    }

    /**
     * Gets the imageUrl.
     *
     * An array of URLs of image files (.jpg or .png).
     * - Include a maximum of 20 images in a request.
     * - Limit each image file to 10 MB.
     * - Minimum width and height is 30 pixels, but the service tends to perform better with images that are at least
     * 300 x 300 pixels. Maximum is 5400 pixels for either height or width.
     *
     * You can also include images with the **images_file** parameter.
     *
     * @return the imageUrl
     */
    public List<String> imageUrl() {
      return imageUrl;
    }

    /**
     * Gets the threshold.
     *
     * The minimum score a feature must have to be returned.
     *
     * @return the threshold
     */
    public Double threshold() {
      return threshold;
    }

    private AnalyzeOptions(AnalyzeOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.collectionIds, 'collectionIds cannot be null');
      IBMWatsonValidator.notNull(builder.features, 'features cannot be null');
      collectionIds = builder.collectionIds;
      features = builder.features;
      imagesFile = builder.imagesFile;
      imageUrl = builder.imageUrl;
      threshold = builder.threshold;
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
    private List<String> collectionIds;
    private List<String> features;
    private List<IBMWatsonFile> imagesFile;
    private List<String> imageUrl;
    private Double threshold;

    private AnalyzeOptionsBuilder(AnalyzeOptions analyzeOptions) {
      collectionIds = analyzeOptions.collectionIds;
      features = analyzeOptions.features;
      imagesFile = analyzeOptions.imagesFile;
      imageUrl = analyzeOptions.imageUrl;
      threshold = analyzeOptions.threshold;
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
     * @param collectionIds the collectionIds
     * @param features the features
     */
    public AnalyzeOptionsBuilder(List<String> collectionIds, List<String> features) {
      this.collectionIds = collectionIds;
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
     * Adds an collectionIds to collectionIds.
     *
     * @param collectionIds the new collectionIds
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder addCollectionIds(String collectionIds) {
      IBMWatsonValidator.notNull(collectionIds, 'collectionIds cannot be null');
      if (this.collectionIds == null) {
        this.collectionIds = new List<String>();
      }
      this.collectionIds.add(collectionIds);
      return this;
    }

    /**
     * Adds an features to features.
     *
     * @param features the new features
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder addFeatures(String features) {
      IBMWatsonValidator.notNull(features, 'features cannot be null');
      if (this.features == null) {
        this.features = new List<String>();
      }
      this.features.add(features);
      return this;
    }

    /**
     * Adds an imagesFile to imagesFile.
     *
     * @param imagesFile the new imagesFile
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder addImagesFile(IBMWatsonFile imagesFile) {
      IBMWatsonValidator.notNull(imagesFile, 'imagesFile cannot be null');
      if (this.imagesFile == null) {
        this.imagesFile = new List<IBMWatsonFile>();
      }
      this.imagesFile.add(imagesFile);
      return this;
    }

    /**
     * Adds an imageUrl to imageUrl.
     *
     * @param imageUrl the new imageUrl
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder addImageUrl(String imageUrl) {
      IBMWatsonValidator.notNull(imageUrl, 'imageUrl cannot be null');
      if (this.imageUrl == null) {
        this.imageUrl = new List<String>();
      }
      this.imageUrl.add(imageUrl);
      return this;
    }

    /**
     * Set the collectionIds.
     * Existing collectionIds will be replaced.
     *
     * @param collectionIds the collectionIds
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder collectionIds(List<String> collectionIds) {
      this.collectionIds = collectionIds;
      return this;
    }

    /**
     * Set the features.
     * Existing features will be replaced.
     *
     * @param features the features
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder features(List<String> features) {
      this.features = features;
      return this;
    }

    /**
     * Set the imagesFile.
     * Existing imagesFile will be replaced.
     *
     * @param imagesFile the imagesFile
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder imagesFile(List<IBMWatsonFile> imagesFile) {
      this.imagesFile = imagesFile;
      return this;
    }

    /**
     * Set the imageUrl.
     * Existing imageUrl will be replaced.
     *
     * @param imageUrl the imageUrl
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder imageUrl(List<String> imageUrl) {
      this.imageUrl = imageUrl;
      return this;
    }

    /**
     * Set the threshold.
     *
     * @param threshold the threshold
     * @return the AnalyzeOptions builder
     */
    public AnalyzeOptionsBuilder threshold(Double threshold) {
      this.threshold = threshold;
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
   * Results for all images.
   */
  public class AnalyzeResponse extends IBMWatsonResponseModel {
    private List<Image> images;
    private List<Warning> warnings;
    private String trace;

    /**
     * Gets the images.
     *
     * Analyzed images.
     *
     * @return the images
     */
    @AuraEnabled
    public List<Image> getImages() {
      return images;
    }

    /**
     * Gets the warnings.
     *
     * Information about what might cause less than optimal output.
     *
     * @return the warnings
     */
    @AuraEnabled
    public List<Warning> getWarnings() {
      return warnings;
    }

    /**
     * Gets the trace.
     *
     * A unique identifier of the request. Included only when an error or warning is returned.
     *
     * @return the trace
     */
    @AuraEnabled
    public String getTrace() {
      return trace;
    }

    /**
     * Sets the images.
     *
     * @param images the new images
     */
    public void setImages(final List<Image> images) {
      this.images = images;
    }

    /**
     * Sets the warnings.
     *
     * @param warnings the new warnings
     */
    public void setWarnings(final List<Warning> warnings) {
      this.warnings = warnings;
    }

    /**
     * Sets the trace.
     *
     * @param trace the new trace
     */
    public void setTrace(final String trace) {
      this.trace = trace;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      AnalyzeResponse ret = (AnalyzeResponse) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for images
      List<Image> newImages = new List<Image>();
      List<Image> deserializedImages = ret.getImages();
      if (deserializedImages != null) {
        for (Integer i = 0; i < deserializedImages.size(); i++) {
          Image currentItem = ret.getImages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('images');
          Image newItem = (Image) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Image.class);
          newImages.add(newItem);
        }
        ret.images = newImages;
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
   * Details about a collection.
   */
  public class Collection extends IBMWatsonResponseModel {
    private String collectionId;
    private String name;
    private String description;
    private Datetime created;
    private Datetime updated;
    private Long imageCount;
    private TrainingStatus trainingStatus;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the name.
     *
     * The name of the collection.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the collection.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the created.
     *
     * Date and time in Coordinated Universal Time (UTC) that the collection was created.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the updated.
     *
     * Date and time in Coordinated Universal Time (UTC) that the collection was most recently updated.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the imageCount.
     *
     * Number of images in the collection.
     *
     * @return the imageCount
     */
    @AuraEnabled
    public Long getImageCount() {
      return imageCount;
    }

    /**
     * Gets the trainingStatus.
     *
     * Training status information for the collection.
     *
     * @return the trainingStatus
     */
    @AuraEnabled
    public TrainingStatus getTrainingStatus() {
      return trainingStatus;
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
     * Sets the description.
     *
     * @param description the new description
     */
    public void setDescription(final String description) {
      this.description = description;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'collection_id' => 'collectionId',
        'image_count' => 'imageCount',
        'training_status' => 'trainingStatus'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Collection ret = (Collection) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for trainingStatus
      Map<String, Object> trainingStatusMap = (Map<String, Object>) jsonMap.get('trainingStatus');
      TrainingStatus newTrainingStatus = (TrainingStatus) new TrainingStatus().deserialize(JSON.serialize(trainingStatusMap, true), trainingStatusMap, TrainingStatus.class);
      ret.trainingStatus = newTrainingStatus;

      return ret;
    }
  }

  /**
   * The objects in a collection that are detected in an image.
   */
  public class CollectionObjects extends IBMWatsonGenericModel {
    private String collectionId;
    private List<ObjectDetail> objects;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the objects.
     *
     * The identified objects in a collection.
     *
     * @return the objects
     */
    @AuraEnabled
    public List<ObjectDetail> getObjects() {
      return objects;
    }

    /**
     * Sets the collectionId.
     *
     * @param collectionId the new collectionId
     */
    public void setCollectionId(final String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Sets the objects.
     *
     * @param objects the new objects
     */
    public void setObjects(final List<ObjectDetail> objects) {
      this.objects = objects;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'collection_id' => 'collectionId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CollectionObjects ret = (CollectionObjects) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for objects
      List<ObjectDetail> newObjects = new List<ObjectDetail>();
      List<ObjectDetail> deserializedObjects = ret.getObjects();
      if (deserializedObjects != null) {
        for (Integer i = 0; i < deserializedObjects.size(); i++) {
          ObjectDetail currentItem = ret.getObjects().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('objects');
          ObjectDetail newItem = (ObjectDetail) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ObjectDetail.class);
          newObjects.add(newItem);
        }
        ret.objects = newObjects;
      }

      return ret;
    }
  }

  /**
   * A container for the list of collections.
   */
  public class CollectionsList extends IBMWatsonResponseModel {
    private List<Collection> collections;

    /**
     * Gets the collections.
     *
     * The collections in this service instance.
     *
     * @return the collections
     */
    @AuraEnabled
    public List<Collection> getCollections() {
      return collections;
    }

    /**
     * Sets the collections.
     *
     * @param collections the new collections
     */
    public void setCollections(final List<Collection> collections) {
      this.collections = collections;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      CollectionsList ret = (CollectionsList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for collections
      List<Collection> newCollections = new List<Collection>();
      List<Collection> deserializedCollections = ret.getCollections();
      if (deserializedCollections != null) {
        for (Integer i = 0; i < deserializedCollections.size(); i++) {
          Collection currentItem = ret.getCollections().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('collections');
          Collection newItem = (Collection) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Collection.class);
          newCollections.add(newItem);
        }
        ret.collections = newCollections;
      }

      return ret;
    }
  }

  /**
   * The createCollection options.
   */
  public class CreateCollectionOptions extends IBMWatsonOptionsModel {
    private String name;
    private String description;

    /**
     * Gets the name.
     *
     * The name of the collection. The name can contain alphanumeric, underscore, hyphen, and dot characters. It cannot
     * begin with the reserved prefix `sys-`.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the collection.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    private CreateCollectionOptions(CreateCollectionOptionsBuilder builder) {
      name = builder.name;
      description = builder.description;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder newBuilder() {
      return new CreateCollectionOptionsBuilder(this);
    }
  }

  /**
   * CreateCollectionOptions Builder.
   */
  public class CreateCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String name;
    private String description;

    private CreateCollectionOptionsBuilder(CreateCollectionOptions createCollectionOptions) {
      name = createCollectionOptions.name;
      description = createCollectionOptions.description;
      this.requestHeaders.putAll(createCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateCollectionOptionsBuilder() {
    }

    /**
     * Builds a CreateCollectionOptions.
     *
     * @return the createCollectionOptions
     */
    public CreateCollectionOptions build() {
      return new CreateCollectionOptions(this);
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateCollectionOptions builder
     */
    public CreateCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteCollection options.
   */
  public class DeleteCollectionOptions extends IBMWatsonOptionsModel {
    private String collectionId;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    private DeleteCollectionOptions(DeleteCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteCollectionOptions builder
     */
    public DeleteCollectionOptionsBuilder newBuilder() {
      return new DeleteCollectionOptionsBuilder(this);
    }
  }

  /**
   * DeleteCollectionOptions Builder.
   */
  public class DeleteCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;

    private DeleteCollectionOptionsBuilder(DeleteCollectionOptions deleteCollectionOptions) {
      collectionId = deleteCollectionOptions.collectionId;
      this.requestHeaders.putAll(deleteCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     */
    public DeleteCollectionOptionsBuilder(String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Builds a DeleteCollectionOptions.
     *
     * @return the deleteCollectionOptions
     */
    public DeleteCollectionOptions build() {
      return new DeleteCollectionOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteCollectionOptions builder
     */
    public DeleteCollectionOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteCollectionOptions builder
     */
    public DeleteCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteImage options.
   */
  public class DeleteImageOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the imageId.
     *
     * The identifier of the image.
     *
     * @return the imageId
     */
    public String imageId() {
      return imageId;
    }

    private DeleteImageOptions(DeleteImageOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.imageId, 'imageId cannot be empty');
      collectionId = builder.collectionId;
      imageId = builder.imageId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteImageOptions builder
     */
    public DeleteImageOptionsBuilder newBuilder() {
      return new DeleteImageOptionsBuilder(this);
    }
  }

  /**
   * DeleteImageOptions Builder.
   */
  public class DeleteImageOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;

    private DeleteImageOptionsBuilder(DeleteImageOptions deleteImageOptions) {
      collectionId = deleteImageOptions.collectionId;
      imageId = deleteImageOptions.imageId;
      this.requestHeaders.putAll(deleteImageOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteImageOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     * @param imageId the imageId
     */
    public DeleteImageOptionsBuilder(String collectionId, String imageId) {
      this.collectionId = collectionId;
      this.imageId = imageId;
    }

    /**
     * Builds a DeleteImageOptions.
     *
     * @return the deleteImageOptions
     */
    public DeleteImageOptions build() {
      return new DeleteImageOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteImageOptions builder
     */
    public DeleteImageOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the imageId.
     *
     * @param imageId the imageId
     * @return the DeleteImageOptions builder
     */
    public DeleteImageOptionsBuilder imageId(String imageId) {
      this.imageId = imageId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteImageOptions builder
     */
    public DeleteImageOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteObject options.
   */
  public class DeleteObjectOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String xObject;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the xObject.
     *
     * The name of the object.
     *
     * @return the xObject
     */
    public String xObject() {
      return xObject;
    }

    private DeleteObjectOptions(DeleteObjectOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.xObject, 'xObject cannot be empty');
      collectionId = builder.collectionId;
      xObject = builder.xObject;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteObjectOptions builder
     */
    public DeleteObjectOptionsBuilder newBuilder() {
      return new DeleteObjectOptionsBuilder(this);
    }
  }

  /**
   * DeleteObjectOptions Builder.
   */
  public class DeleteObjectOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String xObject;

    private DeleteObjectOptionsBuilder(DeleteObjectOptions deleteObjectOptions) {
      collectionId = deleteObjectOptions.collectionId;
      xObject = deleteObjectOptions.xObject;
      this.requestHeaders.putAll(deleteObjectOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteObjectOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     * @param xObject the xObject
     */
    public DeleteObjectOptionsBuilder(String collectionId, String xObject) {
      this.collectionId = collectionId;
      this.xObject = xObject;
    }

    /**
     * Builds a DeleteObjectOptions.
     *
     * @return the deleteObjectOptions
     */
    public DeleteObjectOptions build() {
      return new DeleteObjectOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the DeleteObjectOptions builder
     */
    public DeleteObjectOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the xObject.
     *
     * @param xObject the xObject
     * @return the DeleteObjectOptions builder
     */
    public DeleteObjectOptionsBuilder xObject(String xObject) {
      this.xObject = xObject;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteObjectOptions builder
     */
    public DeleteObjectOptionsBuilder addHeader(String name, String value) {
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
   * Container for the list of collections that have objects detected in an image.
   */
  public class DetectedObjects extends IBMWatsonGenericModel {
    private List<CollectionObjects> collections;

    /**
     * Gets the collections.
     *
     * The collections with identified objects.
     *
     * @return the collections
     */
    @AuraEnabled
    public List<CollectionObjects> getCollections() {
      return collections;
    }

    /**
     * Sets the collections.
     *
     * @param collections the new collections
     */
    public void setCollections(final List<CollectionObjects> collections) {
      this.collections = collections;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DetectedObjects ret = (DetectedObjects) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for collections
      List<CollectionObjects> newCollections = new List<CollectionObjects>();
      List<CollectionObjects> deserializedCollections = ret.getCollections();
      if (deserializedCollections != null) {
        for (Integer i = 0; i < deserializedCollections.size(); i++) {
          CollectionObjects currentItem = ret.getCollections().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('collections');
          CollectionObjects newItem = (CollectionObjects) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), CollectionObjects.class);
          newCollections.add(newItem);
        }
        ret.collections = newCollections;
      }

      return ret;
    }
  }

  /**
   * Details about an error.
   */
  public class Error extends IBMWatsonGenericModel {
    private String code;
    private String message;
    private String moreInfo;
    private ErrorTarget target;

    /**
     * Gets the code.
     *
     * Identifier of the problem.
     *
     * @return the code
     */
    @AuraEnabled
    public String getCode() {
      return code;
    }

    /**
     * Gets the message.
     *
     * An explanation of the problem with possible solutions.
     *
     * @return the message
     */
    @AuraEnabled
    public String getMessage() {
      return message;
    }

    /**
     * Gets the moreInfo.
     *
     * A URL for more information about the solution.
     *
     * @return the moreInfo
     */
    @AuraEnabled
    public String getMoreInfo() {
      return moreInfo;
    }

    /**
     * Gets the target.
     *
     * Details about the specific area of the problem.
     *
     * @return the target
     */
    @AuraEnabled
    public ErrorTarget getTarget() {
      return target;
    }

    /**
     * Sets the code.
     *
     * @param code the new code
     */
    public void setCode(final String code) {
      this.code = code;
    }

    /**
     * Sets the message.
     *
     * @param message the new message
     */
    public void setMessage(final String message) {
      this.message = message;
    }

    /**
     * Sets the moreInfo.
     *
     * @param moreInfo the new moreInfo
     */
    public void setMoreInfo(final String moreInfo) {
      this.moreInfo = moreInfo;
    }

    /**
     * Sets the target.
     *
     * @param target the new target
     */
    public void setTarget(final ErrorTarget target) {
      this.target = target;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'more_info' => 'moreInfo'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Error ret = (Error) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for target
      Map<String, Object> targetMap = (Map<String, Object>) jsonMap.get('target');
      ErrorTarget newTarget = (ErrorTarget) new ErrorTarget().deserialize(JSON.serialize(targetMap, true), targetMap, ErrorTarget.class);
      ret.setTarget(newTarget);

      return ret;
    }
  }

  /**
   * Details about the specific area of the problem.
   */
  public class ErrorTarget extends IBMWatsonGenericModel {
    private String xType;
    private String name;

    /**
     * Gets the xType.
     *
     * The parameter or property that is the focus of the problem.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the name.
     *
     * The property that is identified with the problem.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
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

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ErrorTarget ret = (ErrorTarget) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The getCollection options.
   */
  public class GetCollectionOptions extends IBMWatsonOptionsModel {
    private String collectionId;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    private GetCollectionOptions(GetCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetCollectionOptions builder
     */
    public GetCollectionOptionsBuilder newBuilder() {
      return new GetCollectionOptionsBuilder(this);
    }
  }

  /**
   * GetCollectionOptions Builder.
   */
  public class GetCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;

    private GetCollectionOptionsBuilder(GetCollectionOptions getCollectionOptions) {
      collectionId = getCollectionOptions.collectionId;
      this.requestHeaders.putAll(getCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     */
    public GetCollectionOptionsBuilder(String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Builds a GetCollectionOptions.
     *
     * @return the getCollectionOptions
     */
    public GetCollectionOptions build() {
      return new GetCollectionOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetCollectionOptions builder
     */
    public GetCollectionOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetCollectionOptions builder
     */
    public GetCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getImageDetails options.
   */
  public class GetImageDetailsOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the imageId.
     *
     * The identifier of the image.
     *
     * @return the imageId
     */
    public String imageId() {
      return imageId;
    }

    private GetImageDetailsOptions(GetImageDetailsOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.imageId, 'imageId cannot be empty');
      collectionId = builder.collectionId;
      imageId = builder.imageId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetImageDetailsOptions builder
     */
    public GetImageDetailsOptionsBuilder newBuilder() {
      return new GetImageDetailsOptionsBuilder(this);
    }
  }

  /**
   * GetImageDetailsOptions Builder.
   */
  public class GetImageDetailsOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;

    private GetImageDetailsOptionsBuilder(GetImageDetailsOptions getImageDetailsOptions) {
      collectionId = getImageDetailsOptions.collectionId;
      imageId = getImageDetailsOptions.imageId;
      this.requestHeaders.putAll(getImageDetailsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetImageDetailsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     * @param imageId the imageId
     */
    public GetImageDetailsOptionsBuilder(String collectionId, String imageId) {
      this.collectionId = collectionId;
      this.imageId = imageId;
    }

    /**
     * Builds a GetImageDetailsOptions.
     *
     * @return the getImageDetailsOptions
     */
    public GetImageDetailsOptions build() {
      return new GetImageDetailsOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetImageDetailsOptions builder
     */
    public GetImageDetailsOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the imageId.
     *
     * @param imageId the imageId
     * @return the GetImageDetailsOptions builder
     */
    public GetImageDetailsOptionsBuilder imageId(String imageId) {
      this.imageId = imageId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetImageDetailsOptions builder
     */
    public GetImageDetailsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getJpegImage options.
   */
  public class GetJpegImageOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;
    private String size;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the imageId.
     *
     * The identifier of the image.
     *
     * @return the imageId
     */
    public String imageId() {
      return imageId;
    }

    /**
     * Gets the size.
     *
     * The image size. Specify `thumbnail` to return a version that maintains the original aspect ratio but is no larger
     * than 200 pixels in the larger dimension. For example, an original 800 x 1000 image is resized to 160 x 200
     * pixels.
     *
     * @return the size
     */
    public String size() {
      return size;
    }

    private GetJpegImageOptions(GetJpegImageOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.imageId, 'imageId cannot be empty');
      collectionId = builder.collectionId;
      imageId = builder.imageId;
      size = builder.size;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetJpegImageOptions builder
     */
    public GetJpegImageOptionsBuilder newBuilder() {
      return new GetJpegImageOptionsBuilder(this);
    }
  }

  /**
   * GetJpegImageOptions Builder.
   */
  public class GetJpegImageOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String imageId;
    private String size;

    private GetJpegImageOptionsBuilder(GetJpegImageOptions getJpegImageOptions) {
      collectionId = getJpegImageOptions.collectionId;
      imageId = getJpegImageOptions.imageId;
      size = getJpegImageOptions.size;
      this.requestHeaders.putAll(getJpegImageOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetJpegImageOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     * @param imageId the imageId
     */
    public GetJpegImageOptionsBuilder(String collectionId, String imageId) {
      this.collectionId = collectionId;
      this.imageId = imageId;
    }

    /**
     * Builds a GetJpegImageOptions.
     *
     * @return the getJpegImageOptions
     */
    public GetJpegImageOptions build() {
      return new GetJpegImageOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetJpegImageOptions builder
     */
    public GetJpegImageOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the imageId.
     *
     * @param imageId the imageId
     * @return the GetJpegImageOptions builder
     */
    public GetJpegImageOptionsBuilder imageId(String imageId) {
      this.imageId = imageId;
      return this;
    }

    /**
     * Set the size.
     *
     * @param size the size
     * @return the GetJpegImageOptions builder
     */
    public GetJpegImageOptionsBuilder size(String size) {
      this.size = size;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetJpegImageOptions builder
     */
    public GetJpegImageOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getObjectMetadata options.
   */
  public class GetObjectMetadataOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String xObject;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the xObject.
     *
     * The name of the object.
     *
     * @return the xObject
     */
    public String xObject() {
      return xObject;
    }

    private GetObjectMetadataOptions(GetObjectMetadataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.xObject, 'xObject cannot be empty');
      collectionId = builder.collectionId;
      xObject = builder.xObject;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetObjectMetadataOptions builder
     */
    public GetObjectMetadataOptionsBuilder newBuilder() {
      return new GetObjectMetadataOptionsBuilder(this);
    }
  }

  /**
   * GetObjectMetadataOptions Builder.
   */
  public class GetObjectMetadataOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String xObject;

    private GetObjectMetadataOptionsBuilder(GetObjectMetadataOptions getObjectMetadataOptions) {
      collectionId = getObjectMetadataOptions.collectionId;
      xObject = getObjectMetadataOptions.xObject;
      this.requestHeaders.putAll(getObjectMetadataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetObjectMetadataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     * @param xObject the xObject
     */
    public GetObjectMetadataOptionsBuilder(String collectionId, String xObject) {
      this.collectionId = collectionId;
      this.xObject = xObject;
    }

    /**
     * Builds a GetObjectMetadataOptions.
     *
     * @return the getObjectMetadataOptions
     */
    public GetObjectMetadataOptions build() {
      return new GetObjectMetadataOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the GetObjectMetadataOptions builder
     */
    public GetObjectMetadataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the xObject.
     *
     * @param xObject the xObject
     * @return the GetObjectMetadataOptions builder
     */
    public GetObjectMetadataOptionsBuilder xObject(String xObject) {
      this.xObject = xObject;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetObjectMetadataOptions builder
     */
    public GetObjectMetadataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The getTrainingUsage options.
   */
  public class GetTrainingUsageOptions extends IBMWatsonOptionsModel {
    private String startTime;
    private String endTime;

    /**
     * Gets the startTime.
     *
     * The earliest day to include training events. Specify dates in YYYY-MM-DD format. If empty or not specified, the
     * earliest training event is included.
     *
     * @return the startTime
     */
    public String startTime() {
      return startTime;
    }

    /**
     * Gets the endTime.
     *
     * The most recent day to include training events. Specify dates in YYYY-MM-DD format. All events for the day are
     * included. If empty or not specified, the current day is used. Specify the same value as `start_time` to request
     * events for a single day.
     *
     * @return the endTime
     */
    public String endTime() {
      return endTime;
    }

    private GetTrainingUsageOptions(GetTrainingUsageOptionsBuilder builder) {
      startTime = builder.startTime;
      endTime = builder.endTime;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetTrainingUsageOptions builder
     */
    public GetTrainingUsageOptionsBuilder newBuilder() {
      return new GetTrainingUsageOptionsBuilder(this);
    }
  }

  /**
   * GetTrainingUsageOptions Builder.
   */
  public class GetTrainingUsageOptionsBuilder extends IBMWatsonOptionsModel {
    private String startTime;
    private String endTime;

    private GetTrainingUsageOptionsBuilder(GetTrainingUsageOptions getTrainingUsageOptions) {
      startTime = getTrainingUsageOptions.startTime;
      endTime = getTrainingUsageOptions.endTime;
      this.requestHeaders.putAll(getTrainingUsageOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetTrainingUsageOptionsBuilder() {
    }

    /**
     * Builds a GetTrainingUsageOptions.
     *
     * @return the getTrainingUsageOptions
     */
    public GetTrainingUsageOptions build() {
      return new GetTrainingUsageOptions(this);
    }

    /**
     * Set the startTime.
     *
     * @param startTime the startTime
     * @return the GetTrainingUsageOptions builder
     */
    public GetTrainingUsageOptionsBuilder startTime(String startTime) {
      this.startTime = startTime;
      return this;
    }

    /**
     * Set the endTime.
     *
     * @param endTime the endTime
     * @return the GetTrainingUsageOptions builder
     */
    public GetTrainingUsageOptionsBuilder endTime(String endTime) {
      this.endTime = endTime;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetTrainingUsageOptions builder
     */
    public GetTrainingUsageOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Details about an image.
   */
  public class Image extends IBMWatsonGenericModel {
    private ImageSource source;
    private ImageDimensions dimensions;
    private DetectedObjects objects;
    private List<Error> errors;

    /**
     * Gets the source.
     *
     * The source type of the image.
     *
     * @return the source
     */
    @AuraEnabled
    public ImageSource getSource() {
      return source;
    }

    /**
     * Gets the dimensions.
     *
     * Height and width of an image.
     *
     * @return the dimensions
     */
    @AuraEnabled
    public ImageDimensions getDimensions() {
      return dimensions;
    }

    /**
     * Gets the objects.
     *
     * Container for the list of collections that have objects detected in an image.
     *
     * @return the objects
     */
    @AuraEnabled
    public DetectedObjects getObjects() {
      return objects;
    }

    /**
     * Gets the errors.
     *
     * A container for the problems in the request.
     *
     * @return the errors
     */
    @AuraEnabled
    public List<Error> getErrors() {
      return errors;
    }

    /**
     * Sets the source.
     *
     * @param source the new source
     */
    public void setSource(final ImageSource source) {
      this.source = source;
    }

    /**
     * Sets the dimensions.
     *
     * @param dimensions the new dimensions
     */
    public void setDimensions(final ImageDimensions dimensions) {
      this.dimensions = dimensions;
    }

    /**
     * Sets the objects.
     *
     * @param objects the new objects
     */
    public void setObjects(final DetectedObjects objects) {
      this.objects = objects;
    }

    /**
     * Sets the errors.
     *
     * @param errors the new errors
     */
    public void setErrors(final List<Error> errors) {
      this.errors = errors;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Image ret = (Image) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for source
      Map<String, Object> sourceMap = (Map<String, Object>) jsonMap.get('source');
      ImageSource newSource = (ImageSource) new ImageSource().deserialize(JSON.serialize(sourceMap, true), sourceMap, ImageSource.class);
      ret.setSource(newSource);

      // calling custom deserializer for dimensions
      Map<String, Object> dimensionsMap = (Map<String, Object>) jsonMap.get('dimensions');
      ImageDimensions newDimensions = (ImageDimensions) new ImageDimensions().deserialize(JSON.serialize(dimensionsMap, true), dimensionsMap, ImageDimensions.class);
      ret.setDimensions(newDimensions);

      // calling custom deserializer for objects
      Map<String, Object> objectsMap = (Map<String, Object>) jsonMap.get('objects');
      DetectedObjects newObjects = (DetectedObjects) new DetectedObjects().deserialize(JSON.serialize(objectsMap, true), objectsMap, DetectedObjects.class);
      ret.setObjects(newObjects);

      // calling custom deserializer for errors
      List<Error> newErrors = new List<Error>();
      List<Error> deserializedErrors = ret.getErrors();
      if (deserializedErrors != null) {
        for (Integer i = 0; i < deserializedErrors.size(); i++) {
          Error currentItem = ret.getErrors().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('errors');
          Error newItem = (Error) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Error.class);
          newErrors.add(newItem);
        }
        ret.errors = newErrors;
      }

      return ret;
    }
  }

  /**
   * Details about an image.
   */
  public class ImageDetails extends IBMWatsonResponseModel {
    private String imageId;
    private Datetime updated;
    private Datetime created;
    private ImageSource source;
    private ImageDimensions dimensions;
    private List<Error> errors;
    private TrainingDataObjects trainingData;

    /**
     * Gets the imageId.
     *
     * The identifier of the image.
     *
     * @return the imageId
     */
    @AuraEnabled
    public String getImageId() {
      return imageId;
    }

    /**
     * Gets the updated.
     *
     * Date and time in Coordinated Universal Time (UTC) that the image was most recently updated.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Gets the created.
     *
     * Date and time in Coordinated Universal Time (UTC) that the image was created.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the source.
     *
     * The source type of the image.
     *
     * @return the source
     */
    @AuraEnabled
    public ImageSource getSource() {
      return source;
    }

    /**
     * Gets the dimensions.
     *
     * Height and width of an image.
     *
     * @return the dimensions
     */
    @AuraEnabled
    public ImageDimensions getDimensions() {
      return dimensions;
    }

    /**
     * Gets the errors.
     *
     * @return the errors
     */
    @AuraEnabled
    public List<Error> getErrors() {
      return errors;
    }

    /**
     * Gets the trainingData.
     *
     * Training data for all objects.
     *
     * @return the trainingData
     */
    @AuraEnabled
    public TrainingDataObjects getTrainingData() {
      return trainingData;
    }

    /**
     * Sets the imageId.
     *
     * @param imageId the new imageId
     */
    public void setImageId(final String imageId) {
      this.imageId = imageId;
    }

    /**
     * Sets the updated.
     *
     * @param updated the new updated
     */
    public void setUpdated(final Datetime updated) {
      this.updated = updated;
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
     * Sets the source.
     *
     * @param source the new source
     */
    public void setSource(final ImageSource source) {
      this.source = source;
    }

    /**
     * Sets the dimensions.
     *
     * @param dimensions the new dimensions
     */
    public void setDimensions(final ImageDimensions dimensions) {
      this.dimensions = dimensions;
    }

    /**
     * Sets the errors.
     *
     * @param errors the new errors
     */
    public void setErrors(final List<Error> errors) {
      this.errors = errors;
    }

    /**
     * Sets the trainingData.
     *
     * @param trainingData the new trainingData
     */
    public void setTrainingData(final TrainingDataObjects trainingData) {
      this.trainingData = trainingData;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'image_id' => 'imageId',
        'training_data' => 'trainingData'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ImageDetails ret = (ImageDetails) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for source
      Map<String, Object> sourceMap = (Map<String, Object>) jsonMap.get('source');
      ImageSource newSource = (ImageSource) new ImageSource().deserialize(JSON.serialize(sourceMap, true), sourceMap, ImageSource.class);
      ret.setSource(newSource);

      // calling custom deserializer for dimensions
      Map<String, Object> dimensionsMap = (Map<String, Object>) jsonMap.get('dimensions');
      ImageDimensions newDimensions = (ImageDimensions) new ImageDimensions().deserialize(JSON.serialize(dimensionsMap, true), dimensionsMap, ImageDimensions.class);
      ret.setDimensions(newDimensions);

      // calling custom deserializer for errors
      List<Error> newErrors = new List<Error>();
      List<Error> deserializedErrors = ret.getErrors();
      if (deserializedErrors != null) {
        for (Integer i = 0; i < deserializedErrors.size(); i++) {
          Error currentItem = ret.getErrors().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('errors');
          Error newItem = (Error) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Error.class);
          newErrors.add(newItem);
        }
        ret.errors = newErrors;
      }

      // calling custom deserializer for trainingData
      Map<String, Object> trainingDataMap = (Map<String, Object>) jsonMap.get('trainingData');
      TrainingDataObjects newTrainingData = (TrainingDataObjects) new TrainingDataObjects().deserialize(JSON.serialize(trainingDataMap, true), trainingDataMap, TrainingDataObjects.class);
      ret.setTrainingData(newTrainingData);

      return ret;
    }
  }

  /**
   * List of information about the images.
   */
  public class ImageDetailsList extends IBMWatsonResponseModel {
    private List<ImageDetails> images;
    private List<Warning> warnings;
    private String trace;

    /**
     * Gets the images.
     *
     * The images in the collection.
     *
     * @return the images
     */
    @AuraEnabled
    public List<ImageDetails> getImages() {
      return images;
    }

    /**
     * Gets the warnings.
     *
     * Information about what might cause less than optimal output.
     *
     * @return the warnings
     */
    @AuraEnabled
    public List<Warning> getWarnings() {
      return warnings;
    }

    /**
     * Gets the trace.
     *
     * A unique identifier of the request. Included only when an error or warning is returned.
     *
     * @return the trace
     */
    @AuraEnabled
    public String getTrace() {
      return trace;
    }

    /**
     * Sets the images.
     *
     * @param images the new images
     */
    public void setImages(final List<ImageDetails> images) {
      this.images = images;
    }

    /**
     * Sets the warnings.
     *
     * @param warnings the new warnings
     */
    public void setWarnings(final List<Warning> warnings) {
      this.warnings = warnings;
    }

    /**
     * Sets the trace.
     *
     * @param trace the new trace
     */
    public void setTrace(final String trace) {
      this.trace = trace;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ImageDetailsList ret = (ImageDetailsList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for images
      List<ImageDetails> newImages = new List<ImageDetails>();
      List<ImageDetails> deserializedImages = ret.getImages();
      if (deserializedImages != null) {
        for (Integer i = 0; i < deserializedImages.size(); i++) {
          ImageDetails currentItem = ret.getImages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('images');
          ImageDetails newItem = (ImageDetails) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ImageDetails.class);
          newImages.add(newItem);
        }
        ret.images = newImages;
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
   * Height and width of an image.
   */
  public class ImageDimensions extends IBMWatsonGenericModel {
    private Long height;
    private Long width;

    /**
     * Gets the height.
     *
     * Height in pixels of the image.
     *
     * @return the height
     */
    @AuraEnabled
    public Long getHeight() {
      return height;
    }

    /**
     * Gets the width.
     *
     * Width in pixels of the image.
     *
     * @return the width
     */
    @AuraEnabled
    public Long getWidth() {
      return width;
    }

    /**
     * Sets the height.
     *
     * @param height the new height
     */
    public void setHeight(final long height) {
      this.height = height;
    }

    /**
     * Sets the width.
     *
     * @param width the new width
     */
    public void setWidth(final long width) {
      this.width = width;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ImageDimensions ret = (ImageDimensions) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The source type of the image.
   */
  public class ImageSource extends IBMWatsonGenericModel {
    private String xType;
    private String filename;
    private String archiveFilename;
    private String sourceUrl;
    private String resolvedUrl;

    /**
     * Gets the xType.
     *
     * The source type of the image.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the filename.
     *
     * Name of the image file if uploaded. Not returned when the image is passed by URL.
     *
     * @return the filename
     */
    @AuraEnabled
    public String getFilename() {
      return filename;
    }

    /**
     * Gets the archiveFilename.
     *
     * Name of the .zip file of images if uploaded. Not returned when the image is passed directly or by URL.
     *
     * @return the archiveFilename
     */
    @AuraEnabled
    public String getArchiveFilename() {
      return archiveFilename;
    }

    /**
     * Gets the sourceUrl.
     *
     * Source of the image before any redirects. Not returned when the image is uploaded.
     *
     * @return the sourceUrl
     */
    @AuraEnabled
    public String getSourceUrl() {
      return sourceUrl;
    }

    /**
     * Gets the resolvedUrl.
     *
     * Fully resolved URL of the image after redirects are followed. Not returned when the image is uploaded.
     *
     * @return the resolvedUrl
     */
    @AuraEnabled
    public String getResolvedUrl() {
      return resolvedUrl;
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
     * Sets the filename.
     *
     * @param filename the new filename
     */
    public void setFilename(final String filename) {
      this.filename = filename;
    }

    /**
     * Sets the archiveFilename.
     *
     * @param archiveFilename the new archiveFilename
     */
    public void setArchiveFilename(final String archiveFilename) {
      this.archiveFilename = archiveFilename;
    }

    /**
     * Sets the sourceUrl.
     *
     * @param sourceUrl the new sourceUrl
     */
    public void setSourceUrl(final String sourceUrl) {
      this.sourceUrl = sourceUrl;
    }

    /**
     * Sets the resolvedUrl.
     *
     * @param resolvedUrl the new resolvedUrl
     */
    public void setResolvedUrl(final String resolvedUrl) {
      this.resolvedUrl = resolvedUrl;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType',
        'archive_filename' => 'archiveFilename',
        'source_url' => 'sourceUrl',
        'resolved_url' => 'resolvedUrl'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ImageSource ret = (ImageSource) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Basic information about an image.
   */
  public class ImageSummary extends IBMWatsonGenericModel {
    private String imageId;
    private Datetime updated;

    /**
     * Gets the imageId.
     *
     * The identifier of the image.
     *
     * @return the imageId
     */
    @AuraEnabled
    public String getImageId() {
      return imageId;
    }

    /**
     * Gets the updated.
     *
     * Date and time in Coordinated Universal Time (UTC) that the image was most recently updated.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Sets the imageId.
     *
     * @param imageId the new imageId
     */
    public void setImageId(final String imageId) {
      this.imageId = imageId;
    }

    /**
     * Sets the updated.
     *
     * @param updated the new updated
     */
    public void setUpdated(final Datetime updated) {
      this.updated = updated;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'image_id' => 'imageId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ImageSummary ret = (ImageSummary) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * List of images.
   */
  public class ImageSummaryList extends IBMWatsonResponseModel {
    private List<ImageSummary> images;

    /**
     * Gets the images.
     *
     * The images in the collection.
     *
     * @return the images
     */
    @AuraEnabled
    public List<ImageSummary> getImages() {
      return images;
    }

    /**
     * Sets the images.
     *
     * @param images the new images
     */
    public void setImages(final List<ImageSummary> images) {
      this.images = images;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ImageSummaryList ret = (ImageSummaryList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for images
      List<ImageSummary> newImages = new List<ImageSummary>();
      List<ImageSummary> deserializedImages = ret.getImages();
      if (deserializedImages != null) {
        for (Integer i = 0; i < deserializedImages.size(); i++) {
          ImageSummary currentItem = ret.getImages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('images');
          ImageSummary newItem = (ImageSummary) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ImageSummary.class);
          newImages.add(newItem);
        }
        ret.images = newImages;
      }

      return ret;
    }
  }

  /**
   * The listCollections options.
   */
  public class ListCollectionsOptions extends IBMWatsonOptionsModel {

    private ListCollectionsOptions(ListCollectionsOptionsBuilder builder) {
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListCollectionsOptions builder
     */
    public ListCollectionsOptionsBuilder newBuilder() {
      return new ListCollectionsOptionsBuilder(this);
    }
  }

  /**
   * ListCollectionsOptions Builder.
   */
  public class ListCollectionsOptionsBuilder extends IBMWatsonOptionsModel {

    private ListCollectionsOptionsBuilder(ListCollectionsOptions listCollectionsOptions) {
      this.requestHeaders.putAll(listCollectionsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListCollectionsOptionsBuilder() {
    }

    /**
     * Builds a ListCollectionsOptions.
     *
     * @return the listCollectionsOptions
     */
    public ListCollectionsOptions build() {
      return new ListCollectionsOptions(this);
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListCollectionsOptions builder
     */
    public ListCollectionsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listImages options.
   */
  public class ListImagesOptions extends IBMWatsonOptionsModel {
    private String collectionId;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    private ListImagesOptions(ListImagesOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListImagesOptions builder
     */
    public ListImagesOptionsBuilder newBuilder() {
      return new ListImagesOptionsBuilder(this);
    }
  }

  /**
   * ListImagesOptions Builder.
   */
  public class ListImagesOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;

    private ListImagesOptionsBuilder(ListImagesOptions listImagesOptions) {
      collectionId = listImagesOptions.collectionId;
      this.requestHeaders.putAll(listImagesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListImagesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     */
    public ListImagesOptionsBuilder(String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Builds a ListImagesOptions.
     *
     * @return the listImagesOptions
     */
    public ListImagesOptions build() {
      return new ListImagesOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the ListImagesOptions builder
     */
    public ListImagesOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListImagesOptions builder
     */
    public ListImagesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listObjectMetadata options.
   */
  public class ListObjectMetadataOptions extends IBMWatsonOptionsModel {
    private String collectionId;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    private ListObjectMetadataOptions(ListObjectMetadataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListObjectMetadataOptions builder
     */
    public ListObjectMetadataOptionsBuilder newBuilder() {
      return new ListObjectMetadataOptionsBuilder(this);
    }
  }

  /**
   * ListObjectMetadataOptions Builder.
   */
  public class ListObjectMetadataOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;

    private ListObjectMetadataOptionsBuilder(ListObjectMetadataOptions listObjectMetadataOptions) {
      collectionId = listObjectMetadataOptions.collectionId;
      this.requestHeaders.putAll(listObjectMetadataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListObjectMetadataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     */
    public ListObjectMetadataOptionsBuilder(String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Builds a ListObjectMetadataOptions.
     *
     * @return the listObjectMetadataOptions
     */
    public ListObjectMetadataOptions build() {
      return new ListObjectMetadataOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the ListObjectMetadataOptions builder
     */
    public ListObjectMetadataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListObjectMetadataOptions builder
     */
    public ListObjectMetadataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Defines the location of the bounding box around the object.
   */
  public class Location extends IBMWatsonGenericModel {
    private Long top;
    private Long left;
    private Long width;
    private Long height;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Location() { }

    /**
     * Gets the top.
     *
     * Y-position of top-left pixel of the bounding box.
     *
     * @return the top
     */
    @AuraEnabled
    public Long getTop() {
      return top;
    }

    /**
     * Gets the left.
     *
     * X-position of top-left pixel of the bounding box.
     *
     * @return the left
     */
    @AuraEnabled
    public Long getLeft() {
      return left;
    }

    /**
     * Gets the width.
     *
     * Width in pixels of of the bounding box.
     *
     * @return the width
     */
    @AuraEnabled
    public Long getWidth() {
      return width;
    }

    /**
     * Gets the height.
     *
     * Height in pixels of the bounding box.
     *
     * @return the height
     */
    @AuraEnabled
    public Long getHeight() {
      return height;
    }
  
    private Location(LocationBuilder builder) {
      IBMWatsonValidator.notNull(builder.top, 'top cannot be null');
      IBMWatsonValidator.notNull(builder.left, 'left cannot be null');
      IBMWatsonValidator.notNull(builder.width, 'width cannot be null');
      IBMWatsonValidator.notNull(builder.height, 'height cannot be null');
      this.top = builder.top;
      this.left = builder.left;
      this.width = builder.width;
      this.height = builder.height;
    }

    /**
     * New builder.
     *
     * @return a Location builder
     */
    public LocationBuilder newBuilder() {
      return new LocationBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Location ret = (Location) super.deserialize(jsonString, jsonMap, classType);
      LocationBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * Location Builder.
   */
  public class LocationBuilder {
    private Long top;
    private Long left;
    private Long width;
    private Long height;

    private LocationBuilder(Location location) {
      this.top = location.top;
      this.left = location.left;
      this.width = location.width;
      this.height = location.height;
    }

    /**
     * Instantiates a new builder.
     */
    public LocationBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param top the top
     * @param left the left
     * @param width the width
     * @param height the height
     */
    public LocationBuilder(Long top, Long left, Long width, Long height) {
      this.top = top;
      this.left = left;
      this.width = width;
      this.height = height;
    }

    /**
     * Builds a Location.
     *
     * @return the location
     */
    public Location build() {
      return new Location(this);
    }

    /**
     * Set the top.
     *
     * @param top the top
     * @return the Location builder
     */
    public LocationBuilder top(Long top) {
      this.top = top;
      return this;
    }

    /**
     * Set the left.
     *
     * @param left the left
     * @return the Location builder
     */
    public LocationBuilder left(Long left) {
      this.left = left;
      return this;
    }

    /**
     * Set the width.
     *
     * @param width the width
     * @return the Location builder
     */
    public LocationBuilder width(Long width) {
      this.width = width;
      return this;
    }

    /**
     * Set the height.
     *
     * @param height the height
     * @return the Location builder
     */
    public LocationBuilder height(Long height) {
      this.height = height;
      return this;
    }
  }

  /**
   * Details about an object in the collection.
   */
  public class ObjectDetail extends IBMWatsonGenericModel {
    private String xObject;
    private Location location;
    private Double score;

    /**
     * Gets the xObject.
     *
     * The label for the object.
     *
     * @return the xObject
     */
    @AuraEnabled
    public String getXObject() {
      return xObject;
    }

    /**
     * Gets the location.
     *
     * Defines the location of the bounding box around the object.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the score.
     *
     * Confidence score for the object in the range of 0 to 1. A higher score indicates greater likelihood that the
     * object is depicted at this location in the image.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Sets the xObject.
     *
     * @param xObject the new xObject
     */
    public void setXObject(final String xObject) {
      this.xObject = xObject;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
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
        'object' => 'xObject'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ObjectDetail ret = (ObjectDetail) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Basic information about an object.
   */
  public class ObjectMetadata extends IBMWatsonResponseModel {
    private String xObject;
    private Long count;

    /**
     * Gets the xObject.
     *
     * The name of the object.
     *
     * @return the xObject
     */
    @AuraEnabled
    public String getXObject() {
      return xObject;
    }

    /**
     * Gets the count.
     *
     * Number of bounding boxes with this object name in the collection.
     *
     * @return the count
     */
    @AuraEnabled
    public Long getCount() {
      return count;
    }

    /**
     * Sets the xObject.
     *
     * @param xObject the new xObject
     */
    public void setXObject(final String xObject) {
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

      ObjectMetadata ret = (ObjectMetadata) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * List of objects.
   */
  public class ObjectMetadataList extends IBMWatsonResponseModel {
    private Long objectCount;
    private List<ObjectMetadata> objects;

    /**
     * Gets the objectCount.
     *
     * Number of unique named objects in the collection.
     *
     * @return the objectCount
     */
    @AuraEnabled
    public Long getObjectCount() {
      return objectCount;
    }

    /**
     * Gets the objects.
     *
     * The objects in the collection.
     *
     * @return the objects
     */
    @AuraEnabled
    public List<ObjectMetadata> getObjects() {
      return objects;
    }

    /**
     * Sets the objects.
     *
     * @param objects the new objects
     */
    public void setObjects(final List<ObjectMetadata> objects) {
      this.objects = objects;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'object_count' => 'objectCount'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ObjectMetadataList ret = (ObjectMetadataList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for objects
      List<ObjectMetadata> newObjects = new List<ObjectMetadata>();
      List<ObjectMetadata> deserializedObjects = ret.getObjects();
      if (deserializedObjects != null) {
        for (Integer i = 0; i < deserializedObjects.size(); i++) {
          ObjectMetadata currentItem = ret.getObjects().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('objects');
          ObjectMetadata newItem = (ObjectMetadata) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ObjectMetadata.class);
          newObjects.add(newItem);
        }
        ret.objects = newObjects;
      }

      return ret;
    }
  }

  /**
   * Training status for the objects in the collection.
   */
  public class ObjectTrainingStatus extends IBMWatsonGenericModel {
    private Boolean ready;
    private Boolean inProgress;
    private Boolean dataChanged;
    private Boolean latestFailed;
    private String description;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public ObjectTrainingStatus() { }

    /**
     * Gets the ready.
     *
     * Whether you can analyze images in the collection with the **objects** feature.
     *
     * @return the ready
     */
    @AuraEnabled
    public Boolean getReady() {
      return ready;
    }

    /**
     * Gets the inProgress.
     *
     * Whether training is in progress.
     *
     * @return the inProgress
     */
    @AuraEnabled
    public Boolean getInProgress() {
      return inProgress;
    }

    /**
     * Gets the dataChanged.
     *
     * Whether there are changes to the training data since the most recent training.
     *
     * @return the dataChanged
     */
    @AuraEnabled
    public Boolean getDataChanged() {
      return dataChanged;
    }

    /**
     * Gets the latestFailed.
     *
     * Whether the most recent training failed.
     *
     * @return the latestFailed
     */
    @AuraEnabled
    public Boolean getLatestFailed() {
      return latestFailed;
    }

    /**
     * Gets the description.
     *
     * Details about the training. If training is in progress, includes information about the status. If training is not
     * in progress, includes a success message or information about why training failed.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }
  
    private ObjectTrainingStatus(ObjectTrainingStatusBuilder builder) {
      IBMWatsonValidator.notNull(builder.ready, 'ready cannot be null');
      IBMWatsonValidator.notNull(builder.inProgress, 'inProgress cannot be null');
      IBMWatsonValidator.notNull(builder.dataChanged, 'dataChanged cannot be null');
      IBMWatsonValidator.notNull(builder.latestFailed, 'latestFailed cannot be null');
      IBMWatsonValidator.notNull(builder.description, 'description cannot be null');
      this.ready = builder.ready;
      this.inProgress = builder.inProgress;
      this.dataChanged = builder.dataChanged;
      this.latestFailed = builder.latestFailed;
      this.description = builder.description;
    }

    /**
     * New builder.
     *
     * @return a ObjectTrainingStatus builder
     */
    public ObjectTrainingStatusBuilder newBuilder() {
      return new ObjectTrainingStatusBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'in_progress' => 'inProgress',
        'data_changed' => 'dataChanged',
        'latest_failed' => 'latestFailed'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ObjectTrainingStatus ret = (ObjectTrainingStatus) super.deserialize(jsonString, jsonMap, classType);
      ObjectTrainingStatusBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'inProgress' => 'in_progress',
        'dataChanged' => 'data_changed',
        'latestFailed' => 'latest_failed'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * ObjectTrainingStatus Builder.
   */
  public class ObjectTrainingStatusBuilder {
    private Boolean ready;
    private Boolean inProgress;
    private Boolean dataChanged;
    private Boolean latestFailed;
    private String description;

    private ObjectTrainingStatusBuilder(ObjectTrainingStatus objectTrainingStatus) {
      this.ready = objectTrainingStatus.ready;
      this.inProgress = objectTrainingStatus.inProgress;
      this.dataChanged = objectTrainingStatus.dataChanged;
      this.latestFailed = objectTrainingStatus.latestFailed;
      this.description = objectTrainingStatus.description;
    }

    /**
     * Instantiates a new builder.
     */
    public ObjectTrainingStatusBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param ready the ready
     * @param inProgress the inProgress
     * @param dataChanged the dataChanged
     * @param latestFailed the latestFailed
     * @param description the description
     */
    public ObjectTrainingStatusBuilder(Boolean ready, Boolean inProgress, Boolean dataChanged, Boolean latestFailed, String description) {
      this.ready = ready;
      this.inProgress = inProgress;
      this.dataChanged = dataChanged;
      this.latestFailed = latestFailed;
      this.description = description;
    }

    /**
     * Builds a ObjectTrainingStatus.
     *
     * @return the objectTrainingStatus
     */
    public ObjectTrainingStatus build() {
      return new ObjectTrainingStatus(this);
    }

    /**
     * Set the ready.
     *
     * @param ready the ready
     * @return the ObjectTrainingStatus builder
     */
    public ObjectTrainingStatusBuilder ready(Boolean ready) {
      this.ready = ready;
      return this;
    }

    /**
     * Set the inProgress.
     *
     * @param inProgress the inProgress
     * @return the ObjectTrainingStatus builder
     */
    public ObjectTrainingStatusBuilder inProgress(Boolean inProgress) {
      this.inProgress = inProgress;
      return this;
    }

    /**
     * Set the dataChanged.
     *
     * @param dataChanged the dataChanged
     * @return the ObjectTrainingStatus builder
     */
    public ObjectTrainingStatusBuilder dataChanged(Boolean dataChanged) {
      this.dataChanged = dataChanged;
      return this;
    }

    /**
     * Set the latestFailed.
     *
     * @param latestFailed the latestFailed
     * @return the ObjectTrainingStatus builder
     */
    public ObjectTrainingStatusBuilder latestFailed(Boolean latestFailed) {
      this.latestFailed = latestFailed;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the ObjectTrainingStatus builder
     */
    public ObjectTrainingStatusBuilder description(String description) {
      this.description = description;
      return this;
    }
  }

  /**
   * The train options.
   */
  public class TrainOptions extends IBMWatsonOptionsModel {
    private String collectionId;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    private TrainOptions(TrainOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      collectionId = builder.collectionId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a TrainOptions builder
     */
    public TrainOptionsBuilder newBuilder() {
      return new TrainOptionsBuilder(this);
    }
  }

  /**
   * TrainOptions Builder.
   */
  public class TrainOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;

    private TrainOptionsBuilder(TrainOptions trainOptions) {
      collectionId = trainOptions.collectionId;
      this.requestHeaders.putAll(trainOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public TrainOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     */
    public TrainOptionsBuilder(String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Builds a TrainOptions.
     *
     * @return the trainOptions
     */
    public TrainOptions build() {
      return new TrainOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the TrainOptions builder
     */
    public TrainOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the TrainOptions builder
     */
    public TrainOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Details about the training data.
   */
  public class TrainingDataObject extends IBMWatsonGenericModel {
    private String xObject;
    private Location location;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public TrainingDataObject() { }

    /**
     * Gets the xObject.
     *
     * The name of the object.
     *
     * @return the xObject
     */
    @AuraEnabled
    public String getXObject() {
      return xObject;
    }

    /**
     * Gets the location.
     *
     * Defines the location of the bounding box around the object.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }
  
    private TrainingDataObject(TrainingDataObjectBuilder builder) {
      this.xObject = builder.xObject;
      this.location = builder.location;
    }

    /**
     * New builder.
     *
     * @return a TrainingDataObject builder
     */
    public TrainingDataObjectBuilder newBuilder() {
      return new TrainingDataObjectBuilder(this);
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

      TrainingDataObject ret = (TrainingDataObject) super.deserialize(jsonString, jsonMap, classType);
      TrainingDataObjectBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      retBuilder.location(newLocation);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xObject' => 'object'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for location
      if (location != null) {
        String locationJsonString = JSON.serialize(location.replacePropertyNames(), true);
        String locationKey = 'location';
        if (propertyNameMapping.containsKey(locationKey)) {
          locationKey = propertyNameMapping.get(locationKey);
        }
        jsonMap.put(locationKey, JSON.deserializeUntyped(locationJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * TrainingDataObject Builder.
   */
  public class TrainingDataObjectBuilder {
    private String xObject;
    private Location location;

    private TrainingDataObjectBuilder(TrainingDataObject trainingDataObject) {
      this.xObject = trainingDataObject.xObject;
      this.location = trainingDataObject.location;
    }

    /**
     * Instantiates a new builder.
     */
    public TrainingDataObjectBuilder() {
    }

    /**
     * Builds a TrainingDataObject.
     *
     * @return the trainingDataObject
     */
    public TrainingDataObject build() {
      return new TrainingDataObject(this);
    }

    /**
     * Set the xObject.
     *
     * @param xObject the xObject
     * @return the TrainingDataObject builder
     */
    public TrainingDataObjectBuilder xObject(String xObject) {
      this.xObject = xObject;
      return this;
    }

    /**
     * Set the location.
     *
     * @param location the location
     * @return the TrainingDataObject builder
     */
    public TrainingDataObjectBuilder location(Location location) {
      this.location = location;
      return this;
    }
  }

  /**
   * Training data for all objects.
   */
  public class TrainingDataObjects extends IBMWatsonResponseModel {
    private List<TrainingDataObject> objects;

    /**
     * Gets the objects.
     *
     * Training data for specific objects.
     *
     * @return the objects
     */
    @AuraEnabled
    public List<TrainingDataObject> getObjects() {
      return objects;
    }

    /**
     * Sets the objects.
     *
     * @param objects the new objects
     */
    public void setObjects(final List<TrainingDataObject> objects) {
      this.objects = objects;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TrainingDataObjects ret = (TrainingDataObjects) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for objects
      List<TrainingDataObject> newObjects = new List<TrainingDataObject>();
      List<TrainingDataObject> deserializedObjects = ret.getObjects();
      if (deserializedObjects != null) {
        for (Integer i = 0; i < deserializedObjects.size(); i++) {
          TrainingDataObject currentItem = ret.getObjects().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('objects');
          TrainingDataObject newItem = (TrainingDataObject) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TrainingDataObject.class);
          newObjects.add(newItem);
        }
        ret.objects = newObjects;
      }

      return ret;
    }
  }

  /**
   * Details about the training event.
   */
  public class TrainingEvent extends IBMWatsonGenericModel {
    private String xType;
    private String collectionId;
    private Datetime completionTime;
    private String status;
    private Long imageCount;

    /**
     * Gets the xType.
     *
     * Trained object type. Only `objects` is currently supported.
     *
     * @return the xType
     */
    @AuraEnabled
    public String getXType() {
      return xType;
    }

    /**
     * Gets the collectionId.
     *
     * Identifier of the trained collection.
     *
     * @return the collectionId
     */
    @AuraEnabled
    public String getCollectionId() {
      return collectionId;
    }

    /**
     * Gets the completionTime.
     *
     * Date and time in Coordinated Universal Time (UTC) that training on the collection finished.
     *
     * @return the completionTime
     */
    @AuraEnabled
    public Datetime getCompletionTime() {
      return completionTime;
    }

    /**
     * Gets the status.
     *
     * Training status of the training event.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the imageCount.
     *
     * The total number of images that were used in training for this training event.
     *
     * @return the imageCount
     */
    @AuraEnabled
    public Long getImageCount() {
      return imageCount;
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
     * Sets the collectionId.
     *
     * @param collectionId the new collectionId
     */
    public void setCollectionId(final String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Sets the completionTime.
     *
     * @param completionTime the new completionTime
     */
    public void setCompletionTime(final Datetime completionTime) {
      this.completionTime = completionTime;
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
     * Sets the imageCount.
     *
     * @param imageCount the new imageCount
     */
    public void setImageCount(final long imageCount) {
      this.imageCount = imageCount;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'type' => 'xType',
        'collection_id' => 'collectionId',
        'completion_time' => 'completionTime',
        'image_count' => 'imageCount'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TrainingEvent ret = (TrainingEvent) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Details about the training events.
   */
  public class TrainingEvents extends IBMWatsonResponseModel {
    private Datetime startTime;
    private Datetime endTime;
    private Long completedEvents;
    private Long trainedImages;
    private List<TrainingEvent> events;

    /**
     * Gets the startTime.
     *
     * The starting day for the returned training events in Coordinated Universal Time (UTC). If not specified in the
     * request, it identifies the earliest training event.
     *
     * @return the startTime
     */
    @AuraEnabled
    public Datetime getStartTime() {
      return startTime;
    }

    /**
     * Gets the endTime.
     *
     * The ending day for the returned training events in Coordinated Universal Time (UTC). If not specified in the
     * request, it lists the current time.
     *
     * @return the endTime
     */
    @AuraEnabled
    public Datetime getEndTime() {
      return endTime;
    }

    /**
     * Gets the completedEvents.
     *
     * The total number of training events in the response for the start and end times.
     *
     * @return the completedEvents
     */
    @AuraEnabled
    public Long getCompletedEvents() {
      return completedEvents;
    }

    /**
     * Gets the trainedImages.
     *
     * The total number of images that were used in training for the start and end times.
     *
     * @return the trainedImages
     */
    @AuraEnabled
    public Long getTrainedImages() {
      return trainedImages;
    }

    /**
     * Gets the events.
     *
     * The completed training events for the start and end time.
     *
     * @return the events
     */
    @AuraEnabled
    public List<TrainingEvent> getEvents() {
      return events;
    }

    /**
     * Sets the startTime.
     *
     * @param startTime the new startTime
     */
    public void setStartTime(final Datetime startTime) {
      this.startTime = startTime;
    }

    /**
     * Sets the endTime.
     *
     * @param endTime the new endTime
     */
    public void setEndTime(final Datetime endTime) {
      this.endTime = endTime;
    }

    /**
     * Sets the completedEvents.
     *
     * @param completedEvents the new completedEvents
     */
    public void setCompletedEvents(final long completedEvents) {
      this.completedEvents = completedEvents;
    }

    /**
     * Sets the trainedImages.
     *
     * @param trainedImages the new trainedImages
     */
    public void setTrainedImages(final long trainedImages) {
      this.trainedImages = trainedImages;
    }

    /**
     * Sets the events.
     *
     * @param events the new events
     */
    public void setEvents(final List<TrainingEvent> events) {
      this.events = events;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'start_time' => 'startTime',
        'end_time' => 'endTime',
        'completed_events' => 'completedEvents',
        'trained_images' => 'trainedImages'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TrainingEvents ret = (TrainingEvents) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for events
      List<TrainingEvent> newEvents = new List<TrainingEvent>();
      List<TrainingEvent> deserializedEvents = ret.getEvents();
      if (deserializedEvents != null) {
        for (Integer i = 0; i < deserializedEvents.size(); i++) {
          TrainingEvent currentItem = ret.getEvents().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('events');
          TrainingEvent newItem = (TrainingEvent) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TrainingEvent.class);
          newEvents.add(newItem);
        }
        ret.events = newEvents;
      }

      return ret;
    }
  }

  /**
   * Training status information for the collection.
   */
  public class TrainingStatus extends IBMWatsonGenericModel {
    private ObjectTrainingStatus objects;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public TrainingStatus() { }

    /**
     * Gets the objects.
     *
     * Training status for the objects in the collection.
     *
     * @return the objects
     */
    @AuraEnabled
    public ObjectTrainingStatus getObjects() {
      return objects;
    }
  
    private TrainingStatus(TrainingStatusBuilder builder) {
      IBMWatsonValidator.notNull(builder.objects, 'objects cannot be null');
      this.objects = builder.objects;
    }

    /**
     * New builder.
     *
     * @return a TrainingStatus builder
     */
    public TrainingStatusBuilder newBuilder() {
      return new TrainingStatusBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TrainingStatus ret = (TrainingStatus) super.deserialize(jsonString, jsonMap, classType);
      TrainingStatusBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for objects
      Map<String, Object> objectsMap = (Map<String, Object>) jsonMap.get('objects');
      ObjectTrainingStatus newObjects = (ObjectTrainingStatus) new ObjectTrainingStatus().deserialize(JSON.serialize(objectsMap, true), objectsMap, ObjectTrainingStatus.class);
      retBuilder.objects(newObjects);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for objects
      if (objects != null) {
        String objectsJsonString = JSON.serialize(objects.replacePropertyNames(), true);
        jsonMap.put('objects', JSON.deserializeUntyped(objectsJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * TrainingStatus Builder.
   */
  public class TrainingStatusBuilder {
    private ObjectTrainingStatus objects;

    private TrainingStatusBuilder(TrainingStatus trainingStatus) {
      this.objects = trainingStatus.objects;
    }

    /**
     * Instantiates a new builder.
     */
    public TrainingStatusBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param objects the objects
     */
    public TrainingStatusBuilder(ObjectTrainingStatus objects) {
      this.objects = objects;
    }

    /**
     * Builds a TrainingStatus.
     *
     * @return the trainingStatus
     */
    public TrainingStatus build() {
      return new TrainingStatus(this);
    }

    /**
     * Set the objects.
     *
     * @param objects the objects
     * @return the TrainingStatus builder
     */
    public TrainingStatusBuilder objects(ObjectTrainingStatus objects) {
      this.objects = objects;
      return this;
    }
  }

  /**
   * The updateCollection options.
   */
  public class UpdateCollectionOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String name;
    private String description;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the name.
     *
     * The name of the collection. The name can contain alphanumeric, underscore, hyphen, and dot characters. It cannot
     * begin with the reserved prefix `sys-`.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the description.
     *
     * The description of the collection.
     *
     * @return the description
     */
    public String description() {
      return description;
    }

    private UpdateCollectionOptions(UpdateCollectionOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      collectionId = builder.collectionId;
      name = builder.name;
      description = builder.description;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder newBuilder() {
      return new UpdateCollectionOptionsBuilder(this);
    }
  }

  /**
   * UpdateCollectionOptions Builder.
   */
  public class UpdateCollectionOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String name;
    private String description;

    private UpdateCollectionOptionsBuilder(UpdateCollectionOptions updateCollectionOptions) {
      collectionId = updateCollectionOptions.collectionId;
      name = updateCollectionOptions.name;
      description = updateCollectionOptions.description;
      this.requestHeaders.putAll(updateCollectionOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateCollectionOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     */
    public UpdateCollectionOptionsBuilder(String collectionId) {
      this.collectionId = collectionId;
    }

    /**
     * Builds a UpdateCollectionOptions.
     *
     * @return the updateCollectionOptions
     */
    public UpdateCollectionOptions build() {
      return new UpdateCollectionOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the description.
     *
     * @param description the description
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateCollectionOptions builder
     */
    public UpdateCollectionOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Basic information about an updated object.
   */
  public class UpdateObjectMetadata extends IBMWatsonResponseModel {
    private String xObject;
    private Long count;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public UpdateObjectMetadata() { }

    /**
     * Gets the xObject.
     *
     * The updated name of the object. The name can contain alphanumeric, underscore, hyphen, space, and dot characters.
     * It cannot begin with the reserved prefix `sys-`.
     *
     * @return the xObject
     */
    @AuraEnabled
    public String getXObject() {
      return xObject;
    }

    /**
     * Gets the count.
     *
     * Number of bounding boxes in the collection with the updated object name.
     *
     * @return the count
     */
    @AuraEnabled
    public Long getCount() {
      return count;
    }
  
    private UpdateObjectMetadata(UpdateObjectMetadataBuilder builder) {
      IBMWatsonValidator.notNull(builder.xObject, 'xObject cannot be null');
      IBMWatsonValidator.notNull(builder.count, 'count cannot be null');
      this.xObject = builder.xObject;
      this.count = builder.count;
    }

    /**
     * New builder.
     *
     * @return a UpdateObjectMetadata builder
     */
    public UpdateObjectMetadataBuilder newBuilder() {
      return new UpdateObjectMetadataBuilder(this);
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

      UpdateObjectMetadata ret = (UpdateObjectMetadata) super.deserialize(jsonString, jsonMap, classType);
      UpdateObjectMetadataBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xObject' => 'object'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * UpdateObjectMetadata Builder.
   */
  public class UpdateObjectMetadataBuilder {
    private String xObject;
    private Long count;

    private UpdateObjectMetadataBuilder(UpdateObjectMetadata updateObjectMetadata) {
      this.xObject = updateObjectMetadata.xObject;
      this.count = updateObjectMetadata.count;
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateObjectMetadataBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param xObject the xObject
     * @param count the count
     */
    public UpdateObjectMetadataBuilder(String xObject, Long count) {
      this.xObject = xObject;
      this.count = count;
    }

    /**
     * Builds a UpdateObjectMetadata.
     *
     * @return the updateObjectMetadata
     */
    public UpdateObjectMetadata build() {
      return new UpdateObjectMetadata(this);
    }

    /**
     * Set the xObject.
     *
     * @param xObject the xObject
     * @return the UpdateObjectMetadata builder
     */
    public UpdateObjectMetadataBuilder xObject(String xObject) {
      this.xObject = xObject;
      return this;
    }

    /**
     * Set the count.
     *
     * @param count the count
     * @return the UpdateObjectMetadata builder
     */
    public UpdateObjectMetadataBuilder count(Long count) {
      this.count = count;
      return this;
    }
  }

  /**
   * The updateObjectMetadata options.
   */
  public class UpdateObjectMetadataOptions extends IBMWatsonOptionsModel {
    private String collectionId;
    private String xObject;
    private String newObject;

    /**
     * Gets the collectionId.
     *
     * The identifier of the collection.
     *
     * @return the collectionId
     */
    public String collectionId() {
      return collectionId;
    }

    /**
     * Gets the xObject.
     *
     * The name of the object.
     *
     * @return the xObject
     */
    public String xObject() {
      return xObject;
    }

    /**
     * Gets the newObject.
     *
     * The updated name of the object. The name can contain alphanumeric, underscore, hyphen, space, and dot characters.
     * It cannot begin with the reserved prefix `sys-`.
     *
     * @return the newObject
     */
    public String newObject() {
      return newObject;
    }

    private UpdateObjectMetadataOptions(UpdateObjectMetadataOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.collectionId, 'collectionId cannot be empty');
      IBMWatsonValidator.notEmpty(builder.xObject, 'xObject cannot be empty');
      IBMWatsonValidator.notNull(builder.newObject, 'newObject cannot be null');
      collectionId = builder.collectionId;
      xObject = builder.xObject;
      newObject = builder.newObject;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateObjectMetadataOptions builder
     */
    public UpdateObjectMetadataOptionsBuilder newBuilder() {
      return new UpdateObjectMetadataOptionsBuilder(this);
    }
  }

  /**
   * UpdateObjectMetadataOptions Builder.
   */
  public class UpdateObjectMetadataOptionsBuilder extends IBMWatsonOptionsModel {
    private String collectionId;
    private String xObject;
    private String newObject;

    private UpdateObjectMetadataOptionsBuilder(UpdateObjectMetadataOptions updateObjectMetadataOptions) {
      collectionId = updateObjectMetadataOptions.collectionId;
      xObject = updateObjectMetadataOptions.xObject;
      newObject = updateObjectMetadataOptions.newObject;
      this.requestHeaders.putAll(updateObjectMetadataOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateObjectMetadataOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param collectionId the collectionId
     * @param xObject the xObject
     * @param newObject the newObject
     */
    public UpdateObjectMetadataOptionsBuilder(String collectionId, String xObject, String newObject) {
      this.collectionId = collectionId;
      this.xObject = xObject;
      this.newObject = newObject;
    }

    /**
     * Builds a UpdateObjectMetadataOptions.
     *
     * @return the updateObjectMetadataOptions
     */
    public UpdateObjectMetadataOptions build() {
      return new UpdateObjectMetadataOptions(this);
    }

    /**
     * Set the collectionId.
     *
     * @param collectionId the collectionId
     * @return the UpdateObjectMetadataOptions builder
     */
    public UpdateObjectMetadataOptionsBuilder collectionId(String collectionId) {
      this.collectionId = collectionId;
      return this;
    }

    /**
     * Set the xObject.
     *
     * @param xObject the xObject
     * @return the UpdateObjectMetadataOptions builder
     */
    public UpdateObjectMetadataOptionsBuilder xObject(String xObject) {
      this.xObject = xObject;
      return this;
    }

    /**
     * Set the newObject.
     *
     * @param newObject the newObject
     * @return the UpdateObjectMetadataOptions builder
     */
    public UpdateObjectMetadataOptionsBuilder newObject(String newObject) {
      this.newObject = newObject;
      return this;
    }

    /**
     * Set the updateObjectMetadata.
     *
     * @param updateObjectMetadata the updateObjectMetadata
     * @return the UpdateObjectMetadataOptions builder
     */
    public UpdateObjectMetadataOptionsBuilder updateObjectMetadata(UpdateObjectMetadata updateObjectMetadata) {
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateObjectMetadataOptions builder
     */
    public UpdateObjectMetadataOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Details about a problem.
   */
  public class Warning extends IBMWatsonGenericModel {
    private String code;
    private String message;
    private String moreInfo;

    /**
     * Gets the code.
     *
     * Identifier of the problem.
     *
     * @return the code
     */
    @AuraEnabled
    public String getCode() {
      return code;
    }

    /**
     * Gets the message.
     *
     * An explanation of the problem with possible solutions.
     *
     * @return the message
     */
    @AuraEnabled
    public String getMessage() {
      return message;
    }

    /**
     * Gets the moreInfo.
     *
     * A URL for more information about the solution.
     *
     * @return the moreInfo
     */
    @AuraEnabled
    public String getMoreInfo() {
      return moreInfo;
    }

    /**
     * Sets the code.
     *
     * @param code the new code
     */
    public void setCode(final String code) {
      this.code = code;
    }

    /**
     * Sets the message.
     *
     * @param message the new message
     */
    public void setMessage(final String message) {
      this.message = message;
    }

    /**
     * Sets the moreInfo.
     *
     * @param moreInfo the new moreInfo
     */
    public void setMoreInfo(final String moreInfo) {
      this.moreInfo = moreInfo;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'more_info' => 'moreInfo'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Warning ret = (Warning) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

}