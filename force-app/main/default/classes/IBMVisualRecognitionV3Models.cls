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

public class IBMVisualRecognitionV3Models {
  /**
   * A category within a classifier.
   */
  public class ModelClass extends IBMWatsonGenericModel {
    private String xClass;

    /**
     * Gets the xClass.
     *
     * The name of the class.
     *
     * @return the xClass
     */
    @AuraEnabled
    public String getXClass() {
      return xClass;
    }

    /**
     * Sets the xClass.
     *
     * @param xClass the new xClass
     */
    public void setXClass(final String xClass) {
      this.xClass = xClass;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'class' => 'xClass'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ModelClass ret = (ModelClass) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Result of a class within a classifier.
   */
  public class ClassResult extends IBMWatsonGenericModel {
    private String xClass;
    private Double score;
    private String typeHierarchy;

    /**
     * Gets the xClass.
     *
     * Name of the class.
     *
     * Class names are translated in the language defined by the **Accept-Language** request header for the build-in
     * classifier IDs (`default`, `food`, and `explicit`). Class names of custom classifiers are not translated. The
     * response might not be in the specified language when the requested language is not supported or when there is no
     * translation for the class name.
     *
     * @return the xClass
     */
    @AuraEnabled
    public String getXClass() {
      return xClass;
    }

    /**
     * Gets the score.
     *
     * Confidence score for the property in the range of 0 to 1. A higher score indicates greater likelihood that the
     * class is depicted in the image. The default threshold for returning scores from a classifier is 0.5.
     *
     * @return the score
     */
    @AuraEnabled
    public Double getScore() {
      return score;
    }

    /**
     * Gets the typeHierarchy.
     *
     * Knowledge graph of the property. For example, `/fruit/pome/apple/eating apple/Granny Smith`. Included only if
     * identified.
     *
     * @return the typeHierarchy
     */
    @AuraEnabled
    public String getTypeHierarchy() {
      return typeHierarchy;
    }

    /**
     * Sets the xClass.
     *
     * @param xClass the new xClass
     */
    public void setXClass(final String xClass) {
      this.xClass = xClass;
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
     * Sets the typeHierarchy.
     *
     * @param typeHierarchy the new typeHierarchy
     */
    public void setTypeHierarchy(final String typeHierarchy) {
      this.typeHierarchy = typeHierarchy;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'class' => 'xClass',
        'type_hierarchy' => 'typeHierarchy'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ClassResult ret = (ClassResult) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Results for one image.
   */
  public class ClassifiedImage extends IBMWatsonGenericModel {
    private String sourceUrl;
    private String resolvedUrl;
    private String image;
    private ErrorInfo error;
    private List<ClassifierResult> classifiers;

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
     * Gets the image.
     *
     * Relative path of the image file if uploaded directly. Not returned when the image is passed by URL.
     *
     * @return the image
     */
    @AuraEnabled
    public String getImage() {
      return image;
    }

    /**
     * Gets the error.
     *
     * Information about what might have caused a failure, such as an image that is too large. Not returned when there
     * is no error.
     *
     * @return the error
     */
    @AuraEnabled
    public ErrorInfo getError() {
      return error;
    }

    /**
     * Gets the classifiers.
     *
     * The classifiers.
     *
     * @return the classifiers
     */
    @AuraEnabled
    public List<ClassifierResult> getClassifiers() {
      return classifiers;
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

    /**
     * Sets the image.
     *
     * @param image the new image
     */
    public void setImage(final String image) {
      this.image = image;
    }

    /**
     * Sets the error.
     *
     * @param error the new error
     */
    public void setError(final ErrorInfo error) {
      this.error = error;
    }

    /**
     * Sets the classifiers.
     *
     * @param classifiers the new classifiers
     */
    public void setClassifiers(final List<ClassifierResult> classifiers) {
      this.classifiers = classifiers;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'source_url' => 'sourceUrl',
        'resolved_url' => 'resolvedUrl'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ClassifiedImage ret = (ClassifiedImage) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for error
      Map<String, Object> errorMap = (Map<String, Object>) jsonMap.get('error');
      ErrorInfo newError = (ErrorInfo) new ErrorInfo().deserialize(JSON.serialize(errorMap, true), errorMap, ErrorInfo.class);
      ret.setError(newError);

      // calling custom deserializer for classifiers
      List<ClassifierResult> newClassifiers = new List<ClassifierResult>();
      List<ClassifierResult> deserializedClassifiers = ret.getClassifiers();
      if (deserializedClassifiers != null) {
        for (Integer i = 0; i < deserializedClassifiers.size(); i++) {
          ClassifierResult currentItem = ret.getClassifiers().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('classifiers');
          ClassifierResult newItem = (ClassifierResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ClassifierResult.class);
          newClassifiers.add(newItem);
        }
        ret.classifiers = newClassifiers;
      }

      return ret;
    }
  }

  /**
   * Results for all images.
   */
  public class ClassifiedImages extends IBMWatsonResponseModel {
    private Long customClasses;
    private Long imagesProcessed;
    private List<ClassifiedImage> images;
    private List<WarningInfo> warnings;

    /**
     * Gets the customClasses.
     *
     * Number of custom classes identified in the images.
     *
     * @return the customClasses
     */
    @AuraEnabled
    public Long getCustomClasses() {
      return customClasses;
    }

    /**
     * Gets the imagesProcessed.
     *
     * Number of images processed for the API call.
     *
     * @return the imagesProcessed
     */
    @AuraEnabled
    public Long getImagesProcessed() {
      return imagesProcessed;
    }

    /**
     * Gets the images.
     *
     * Classified images.
     *
     * @return the images
     */
    @AuraEnabled
    public List<ClassifiedImage> getImages() {
      return images;
    }

    /**
     * Gets the warnings.
     *
     * Information about what might cause less than optimal output. For example, a request sent with a corrupt .zip file
     * and a list of image URLs will still complete, but does not return the expected output. Not returned when there is
     * no warning.
     *
     * @return the warnings
     */
    @AuraEnabled
    public List<WarningInfo> getWarnings() {
      return warnings;
    }

    /**
     * Sets the customClasses.
     *
     * @param customClasses the new customClasses
     */
    public void setCustomClasses(final long customClasses) {
      this.customClasses = customClasses;
    }

    /**
     * Sets the imagesProcessed.
     *
     * @param imagesProcessed the new imagesProcessed
     */
    public void setImagesProcessed(final long imagesProcessed) {
      this.imagesProcessed = imagesProcessed;
    }

    /**
     * Sets the images.
     *
     * @param images the new images
     */
    public void setImages(final List<ClassifiedImage> images) {
      this.images = images;
    }

    /**
     * Sets the warnings.
     *
     * @param warnings the new warnings
     */
    public void setWarnings(final List<WarningInfo> warnings) {
      this.warnings = warnings;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'custom_classes' => 'customClasses',
        'images_processed' => 'imagesProcessed'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ClassifiedImages ret = (ClassifiedImages) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for images
      List<ClassifiedImage> newImages = new List<ClassifiedImage>();
      List<ClassifiedImage> deserializedImages = ret.getImages();
      if (deserializedImages != null) {
        for (Integer i = 0; i < deserializedImages.size(); i++) {
          ClassifiedImage currentItem = ret.getImages().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('images');
          ClassifiedImage newItem = (ClassifiedImage) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ClassifiedImage.class);
          newImages.add(newItem);
        }
        ret.images = newImages;
      }

      // calling custom deserializer for warnings
      List<WarningInfo> newWarnings = new List<WarningInfo>();
      List<WarningInfo> deserializedWarnings = ret.getWarnings();
      if (deserializedWarnings != null) {
        for (Integer i = 0; i < deserializedWarnings.size(); i++) {
          WarningInfo currentItem = ret.getWarnings().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('warnings');
          WarningInfo newItem = (WarningInfo) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), WarningInfo.class);
          newWarnings.add(newItem);
        }
        ret.warnings = newWarnings;
      }

      return ret;
    }
  }

  /**
   * Information about a classifier.
   */
  public class Classifier extends IBMWatsonResponseModel {
    private String classifierId;
    private String name;
    private String owner;
    private String status;
    private Boolean coreMlEnabled;
    private String explanation;
    private Datetime created;
    private List<ModelClass> classes;
    private Datetime retrained;
    private Datetime updated;

    /**
     * Gets the classifierId.
     *
     * ID of a classifier identified in the image.
     *
     * @return the classifierId
     */
    @AuraEnabled
    public String getClassifierId() {
      return classifierId;
    }

    /**
     * Gets the name.
     *
     * Name of the classifier.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the owner.
     *
     * Unique ID of the account who owns the classifier. Might not be returned by some requests.
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
     * Training status of classifier.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the coreMlEnabled.
     *
     * Whether the classifier can be downloaded as a Core ML model after the training status is `ready`.
     *
     * @return the coreMlEnabled
     */
    @AuraEnabled
    public Boolean getCoreMlEnabled() {
      return coreMlEnabled;
    }

    /**
     * Gets the explanation.
     *
     * If classifier training has failed, this field might explain why.
     *
     * @return the explanation
     */
    @AuraEnabled
    public String getExplanation() {
      return explanation;
    }

    /**
     * Gets the created.
     *
     * Date and time in Coordinated Universal Time (UTC) that the classifier was created.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the classes.
     *
     * Classes that define a classifier.
     *
     * @return the classes
     */
    @AuraEnabled
    public List<ModelClass> getClasses() {
      return classes;
    }

    /**
     * Gets the retrained.
     *
     * Date and time in Coordinated Universal Time (UTC) that the classifier was updated. Might not be returned by some
     * requests. Identical to `updated` and retained for backward compatibility.
     *
     * @return the retrained
     */
    @AuraEnabled
    public Datetime getRetrained() {
      return retrained;
    }

    /**
     * Gets the updated.
     *
     * Date and time in Coordinated Universal Time (UTC) that the classifier was most recently updated. The field
     * matches either `retrained` or `created`. Might not be returned by some requests.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
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
     * Sets the name.
     *
     * @param name the new name
     */
    public void setName(final String name) {
      this.name = name;
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

    /**
     * Sets the coreMlEnabled.
     *
     * @param coreMlEnabled the new coreMlEnabled
     */
    public void setCoreMlEnabled(final Boolean coreMlEnabled) {
      this.coreMlEnabled = coreMlEnabled;
    }

    /**
     * Sets the explanation.
     *
     * @param explanation the new explanation
     */
    public void setExplanation(final String explanation) {
      this.explanation = explanation;
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
     * Sets the classes.
     *
     * @param classes the new classes
     */
    public void setClasses(final List<ModelClass> classes) {
      this.classes = classes;
    }

    /**
     * Sets the retrained.
     *
     * @param retrained the new retrained
     */
    public void setRetrained(final Datetime retrained) {
      this.retrained = retrained;
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
        'classifier_id' => 'classifierId',
        'core_ml_enabled' => 'coreMlEnabled'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Classifier ret = (Classifier) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for classes
      List<ModelClass> newClasses = new List<ModelClass>();
      List<ModelClass> deserializedClasses = ret.getClasses();
      if (deserializedClasses != null) {
        for (Integer i = 0; i < deserializedClasses.size(); i++) {
          ModelClass currentItem = ret.getClasses().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('classes');
          ModelClass newItem = (ModelClass) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ModelClass.class);
          newClasses.add(newItem);
        }
        ret.classes = newClasses;
      }

      return ret;
    }
  }

  /**
   * Classifier and score combination.
   */
  public class ClassifierResult extends IBMWatsonGenericModel {
    private String name;
    private String classifierId;
    private List<ClassResult> classes;

    /**
     * Gets the name.
     *
     * Name of the classifier.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the classifierId.
     *
     * ID of a classifier identified in the image.
     *
     * @return the classifierId
     */
    @AuraEnabled
    public String getClassifierId() {
      return classifierId;
    }

    /**
     * Gets the classes.
     *
     * Classes within the classifier.
     *
     * @return the classes
     */
    @AuraEnabled
    public List<ClassResult> getClasses() {
      return classes;
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
     * Sets the classifierId.
     *
     * @param classifierId the new classifierId
     */
    public void setClassifierId(final String classifierId) {
      this.classifierId = classifierId;
    }

    /**
     * Sets the classes.
     *
     * @param classes the new classes
     */
    public void setClasses(final List<ClassResult> classes) {
      this.classes = classes;
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

      ClassifierResult ret = (ClassifierResult) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for classes
      List<ClassResult> newClasses = new List<ClassResult>();
      List<ClassResult> deserializedClasses = ret.getClasses();
      if (deserializedClasses != null) {
        for (Integer i = 0; i < deserializedClasses.size(); i++) {
          ClassResult currentItem = ret.getClasses().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('classes');
          ClassResult newItem = (ClassResult) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ClassResult.class);
          newClasses.add(newItem);
        }
        ret.classes = newClasses;
      }

      return ret;
    }
  }

  /**
   * A container for the list of classifiers.
   */
  public class Classifiers extends IBMWatsonResponseModel {
    private List<Classifier> classifiers;

    /**
     * Gets the classifiers.
     *
     * List of classifiers.
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

      Classifiers ret = (Classifiers) super.deserialize(jsonString, jsonMap, classType);

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
   * The classify options.
   */
  public class ClassifyOptions extends IBMWatsonOptionsModel {
    private IBMWatsonFile imagesFile;
    private String imagesFilename;
    private String imagesFileContentType;
    private String url;
    private Double threshold;
    private List<String> owners;
    private List<String> classifierIds;
    private String acceptLanguage;

    /**
     * Gets the imagesFile.
     *
     * An image file (.gif, .jpg, .png, .tif) or .zip file with images. Maximum image size is 10 MB. Include no more
     * than 20 images and limit the .zip file to 100 MB. Encode the image and .zip file names in UTF-8 if they contain
     * non-ASCII characters. The service assumes UTF-8 encoding if it encounters non-ASCII characters.
     *
     * You can also include an image with the **url** parameter.
     *
     * @return the imagesFile
     */
    public IBMWatsonFile imagesFile() {
      return imagesFile;
    }

    /**
     * Gets the imagesFilename.
     *
     * The filename for imagesFile.
     *
     * @return the imagesFilename
     */
    public String imagesFilename() {
      return imagesFilename;
    }

    /**
     * Gets the imagesFileContentType.
     *
     * The content type of imagesFile.
     *
     * @return the imagesFileContentType
     */
    public String imagesFileContentType() {
      return imagesFileContentType;
    }

    /**
     * Gets the url.
     *
     * The URL of an image (.gif, .jpg, .png, .tif) to analyze. The minimum recommended pixel density is 32X32 pixels,
     * but the service tends to perform better with images that are at least 224 x 224 pixels. The maximum image size is
     * 10 MB.
     *
     * You can also include images with the **images_file** parameter.
     *
     * @return the url
     */
    public String url() {
      return url;
    }

    /**
     * Gets the threshold.
     *
     * The minimum score a class must have to be displayed in the response. Set the threshold to `0.0` to return all
     * identified classes.
     *
     * @return the threshold
     */
    public Double threshold() {
      return threshold;
    }

    /**
     * Gets the owners.
     *
     * The categories of classifiers to apply. The **classifier_ids** parameter overrides **owners**, so make sure that
     * **classifier_ids** is empty.
     * - Use `IBM` to classify against the `default` general classifier. You get the same result if both
     * **classifier_ids** and **owners** parameters are empty.
     * - Use `me` to classify against all your custom classifiers. However, for better performance use
     * **classifier_ids** to specify the specific custom classifiers to apply.
     * - Use both `IBM` and `me` to analyze the image against both classifier categories.
     *
     * @return the owners
     */
    public List<String> owners() {
      return owners;
    }

    /**
     * Gets the classifierIds.
     *
     * Which classifiers to apply. Overrides the **owners** parameter. You can specify both custom and built-in
     * classifier IDs. The built-in `default` classifier is used if both **classifier_ids** and **owners** parameters
     * are empty.
     *
     * The following built-in classifier IDs require no training:
     * - `default`: Returns classes from thousands of general tags.
     * - `food`: Enhances specificity and accuracy for images of food items.
     * - `explicit`: Evaluates whether the image might be pornographic.
     *
     * @return the classifierIds
     */
    public List<String> classifierIds() {
      return classifierIds;
    }

    /**
     * Gets the acceptLanguage.
     *
     * The desired language of parts of the response. See the response for details.
     *
     * @return the acceptLanguage
     */
    public String acceptLanguage() {
      return acceptLanguage;
    }

    private ClassifyOptions(ClassifyOptionsBuilder builder) {
      IBMWatsonValidator.isTrue(builder.imagesFile == null || builder.imagesFileContentType != null, 'content type cannot be null if file is not null');
      imagesFile = builder.imagesFile;
      imagesFilename = builder.imagesFilename;
      imagesFileContentType = builder.imagesFileContentType;
      url = builder.url;
      threshold = builder.threshold;
      owners = builder.owners;
      classifierIds = builder.classifierIds;
      acceptLanguage = builder.acceptLanguage;
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
    private IBMWatsonFile imagesFile;
    private String imagesFilename;
    private String imagesFileContentType;
    private String url;
    private Double threshold;
    private List<String> owners;
    private List<String> classifierIds;
    private String acceptLanguage;

    private ClassifyOptionsBuilder(ClassifyOptions classifyOptions) {
      imagesFile = classifyOptions.imagesFile;
      imagesFilename = classifyOptions.imagesFilename;
      imagesFileContentType = classifyOptions.imagesFileContentType;
      url = classifyOptions.url;
      threshold = classifyOptions.threshold;
      owners = classifyOptions.owners;
      classifierIds = classifyOptions.classifierIds;
      acceptLanguage = classifyOptions.acceptLanguage;
      this.requestHeaders.putAll(classifyOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ClassifyOptionsBuilder() {
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
     * Adds an owners to owners.
     *
     * @param owners the new owners
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder addOwners(String owners) {
      IBMWatsonValidator.notNull(owners, 'owners cannot be null');
      if (this.owners == null) {
        this.owners = new List<String>();
      }
      this.owners.add(owners);
      return this;
    }

    /**
     * Adds an classifierIds to classifierIds.
     *
     * @param classifierIds the new classifierIds
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder addClassifierIds(String classifierIds) {
      IBMWatsonValidator.notNull(classifierIds, 'classifierIds cannot be null');
      if (this.classifierIds == null) {
        this.classifierIds = new List<String>();
      }
      this.classifierIds.add(classifierIds);
      return this;
    }

    /**
     * Set the imagesFile.
     *
     * @param imagesFile the imagesFile
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder imagesFile(IBMWatsonFile imagesFile) {
      this.imagesFile = imagesFile;
      return this;
    }

    /**
     * Set the imagesFilename.
     *
     * @param imagesFilename the imagesFilename
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder imagesFilename(String imagesFilename) {
      this.imagesFilename = imagesFilename;
      return this;
    }

    /**
     * Set the imagesFileContentType.
     *
     * @param imagesFileContentType the imagesFileContentType
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder imagesFileContentType(String imagesFileContentType) {
      this.imagesFileContentType = imagesFileContentType;
      return this;
    }

    /**
     * Set the url.
     *
     * @param url the url
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder url(String url) {
      this.url = url;
      return this;
    }

    /**
     * Set the threshold.
     *
     * @param threshold the threshold
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder threshold(Double threshold) {
      this.threshold = threshold;
      return this;
    }

    /**
     * Set the owners.
     * Existing owners will be replaced.
     *
     * @param owners the owners
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder owners(List<String> owners) {
      this.owners = owners;
      return this;
    }

    /**
     * Set the classifierIds.
     * Existing classifierIds will be replaced.
     *
     * @param classifierIds the classifierIds
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder classifierIds(List<String> classifierIds) {
      this.classifierIds = classifierIds;
      return this;
    }

    /**
     * Set the acceptLanguage.
     *
     * @param acceptLanguage the acceptLanguage
     * @return the ClassifyOptions builder
     */
    public ClassifyOptionsBuilder acceptLanguage(String acceptLanguage) {
      this.acceptLanguage = acceptLanguage;
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
   * The createClassifier options.
   */
  public class CreateClassifierOptions extends IBMWatsonOptionsModel {
    private String name;
    private Map<String, IBMWatsonFile> positiveExamples;
    private IBMWatsonFile negativeExamples;
    private String negativeExamplesFilename;

    /**
     * Gets the name.
     *
     * The name of the new classifier. Encode special characters in UTF-8.
     *
     * @return the name
     */
    public String name() {
      return name;
    }

    /**
     * Gets the positiveExamples.
     *
     * A .zip file of images that depict the visual subject of a class in the new classifier. You can include more than
     * one positive example file in a call.
     *
     * Specify the parameter name by appending `_positive_examples` to the class name. For example,
     * `goldenretriever_positive_examples` creates the class **goldenretriever**. The string cannot contain the
     * following characters: ``$ * - { } \ | / ' " ` [ ]``.
     *
     * Include at least 10 images in .jpg or .png format. The minimum recommended image resolution is 32X32 pixels. The
     * maximum number of images is 10,000 images or 100 MB per .zip file.
     *
     * Encode special characters in the file name in UTF-8.
     *
     * @return the positiveExamples
     */
    public Map<String, IBMWatsonFile> positiveExamples() {
      return positiveExamples;
    }

    /**
     * Gets the negativeExamples.
     *
     * A .zip file of images that do not depict the visual subject of any of the classes of the new classifier. Must
     * contain a minimum of 10 images.
     *
     * Encode special characters in the file name in UTF-8.
     *
     * @return the negativeExamples
     */
    public IBMWatsonFile negativeExamples() {
      return negativeExamples;
    }

    /**
     * Gets the negativeExamplesFilename.
     *
     * The filename for negativeExamples.
     *
     * @return the negativeExamplesFilename
     */
    public String negativeExamplesFilename() {
      return negativeExamplesFilename;
    }

    private CreateClassifierOptions(CreateClassifierOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.name, 'name cannot be null');
      IBMWatsonValidator.isTrue(builder.negativeExamples == null || builder.negativeExamplesFilename != null, 'filename cannot be null if file is not null');
      IBMWatsonValidator.isTrue(builder.positiveExamples != null && !builder.positiveExamples.isEmpty(), 'positiveExamples cannot be null or empty');
      name = builder.name;
      positiveExamples = builder.positiveExamples;
      negativeExamples = builder.negativeExamples;
      negativeExamplesFilename = builder.negativeExamplesFilename;
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
    private String name;
    private Map<String, IBMWatsonFile> positiveExamples;
    private IBMWatsonFile negativeExamples;
    private String negativeExamplesFilename;

    private CreateClassifierOptionsBuilder(CreateClassifierOptions createClassifierOptions) {
      name = createClassifierOptions.name;
      positiveExamples = createClassifierOptions.positiveExamples;
      negativeExamples = createClassifierOptions.negativeExamples;
      negativeExamplesFilename = createClassifierOptions.negativeExamplesFilename;
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
     * @param name the name
     */
    public CreateClassifierOptionsBuilder(String name) {
      this.name = name;
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
     * Adds an entry to the positiveExamples map.
     *
     * @param classname the key associated with the map entry to be added
     * @param positiveExamples the value associated with the map entry to be added
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder addPositiveExamples(String classname, IBMWatsonFile positiveExamples) {
      IBMWatsonValidator.notNull(classname, 'classname cannot be null');
      IBMWatsonValidator.notNull(positiveExamples, 'positiveExamples cannot be null');
      if (this.positiveExamples == null) {
        this.positiveExamples = new Map<String, IBMWatsonFile>();
      }
      this.positiveExamples.put(classname, positiveExamples);
      return this;
    }

    /**
     * Set the name.
     *
     * @param name the name
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder name(String name) {
      this.name = name;
      return this;
    }

    /**
     * Set the positiveExamples.
     * Existing positiveExamples map will be replaced.
     *
     * @param positiveExamples the positiveExamples
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder positiveExamples(Map<String, IBMWatsonFile> positiveExamples) {
      this.positiveExamples = positiveExamples;
      return this;
    }

    /**
     * Set the negativeExamples.
     *
     * @param negativeExamples the negativeExamples
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder negativeExamples(IBMWatsonFile negativeExamples) {
      this.negativeExamples = negativeExamples;
      return this;
    }

    /**
     * Set the negativeExamplesFilename.
     *
     * @param negativeExamplesFilename the negativeExamplesFilename
     * @return the CreateClassifierOptions builder
     */
    public CreateClassifierOptionsBuilder negativeExamplesFilename(String negativeExamplesFilename) {
      this.negativeExamplesFilename = negativeExamplesFilename;
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
     * The ID of the classifier.
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
   * Information about what might have caused a failure, such as an image that is too large. Not returned when there is
   * no error.
   */
  public class ErrorInfo extends IBMWatsonResponseModel {
    private Long code;
    private String description;
    private String errorId;

    /**
     * Gets the code.
     *
     * HTTP status code.
     *
     * @return the code
     */
    @AuraEnabled
    public Long getCode() {
      return code;
    }

    /**
     * Gets the description.
     *
     * Human-readable error description. For example, `File size limit exceeded`.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
    }

    /**
     * Gets the errorId.
     *
     * Codified error string. For example, `limit_exceeded`.
     *
     * @return the errorId
     */
    @AuraEnabled
    public String getErrorId() {
      return errorId;
    }

    /**
     * Sets the code.
     *
     * @param code the new code
     */
    public void setCode(final long code) {
      this.code = code;
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
     * Sets the errorId.
     *
     * @param errorId the new errorId
     */
    public void setErrorId(final String errorId) {
      this.errorId = errorId;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'error_id' => 'errorId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ErrorInfo ret = (ErrorInfo) super.deserialize(jsonString, jsonMap, classType);

      return ret;
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
     * The ID of the classifier.
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
   * The getCoreMlModel options.
   */
  public class GetCoreMlModelOptions extends IBMWatsonOptionsModel {
    private String classifierId;

    /**
     * Gets the classifierId.
     *
     * The ID of the classifier.
     *
     * @return the classifierId
     */
    public String classifierId() {
      return classifierId;
    }

    private GetCoreMlModelOptions(GetCoreMlModelOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.classifierId, 'classifierId cannot be empty');
      classifierId = builder.classifierId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetCoreMlModelOptions builder
     */
    public GetCoreMlModelOptionsBuilder newBuilder() {
      return new GetCoreMlModelOptionsBuilder(this);
    }
  }

  /**
   * GetCoreMlModelOptions Builder.
   */
  public class GetCoreMlModelOptionsBuilder extends IBMWatsonOptionsModel {
    private String classifierId;

    private GetCoreMlModelOptionsBuilder(GetCoreMlModelOptions getCoreMlModelOptions) {
      classifierId = getCoreMlModelOptions.classifierId;
      this.requestHeaders.putAll(getCoreMlModelOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetCoreMlModelOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param classifierId the classifierId
     */
    public GetCoreMlModelOptionsBuilder(String classifierId) {
      this.classifierId = classifierId;
    }

    /**
     * Builds a GetCoreMlModelOptions.
     *
     * @return the getCoreMlModelOptions
     */
    public GetCoreMlModelOptions build() {
      return new GetCoreMlModelOptions(this);
    }

    /**
     * Set the classifierId.
     *
     * @param classifierId the classifierId
     * @return the GetCoreMlModelOptions builder
     */
    public GetCoreMlModelOptionsBuilder classifierId(String classifierId) {
      this.classifierId = classifierId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetCoreMlModelOptions builder
     */
    public GetCoreMlModelOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listClassifiers options.
   */
  public class ListClassifiersOptions extends IBMWatsonOptionsModel {
    private Boolean verbose;

    /**
     * Gets the verbose.
     *
     * Specify `true` to return details about the classifiers. Omit this parameter to return a brief list of
     * classifiers.
     *
     * @return the verbose
     */
    public Boolean verbose() {
      return verbose;
    }

    private ListClassifiersOptions(ListClassifiersOptionsBuilder builder) {
      verbose = builder.verbose;
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
    private Boolean verbose;

    private ListClassifiersOptionsBuilder(ListClassifiersOptions listClassifiersOptions) {
      verbose = listClassifiersOptions.verbose;
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
     * Set the verbose.
     *
     * @param verbose the verbose
     * @return the ListClassifiersOptions builder
     */
    public ListClassifiersOptionsBuilder verbose(Boolean verbose) {
      this.verbose = verbose;
      return this;
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

  /**
   * The updateClassifier options.
   */
  public class UpdateClassifierOptions extends IBMWatsonOptionsModel {
    private String classifierId;
    private Map<String, IBMWatsonFile> positiveExamples;
    private IBMWatsonFile negativeExamples;
    private String negativeExamplesFilename;

    /**
     * Gets the classifierId.
     *
     * The ID of the classifier.
     *
     * @return the classifierId
     */
    public String classifierId() {
      return classifierId;
    }

    /**
     * Gets the positiveExamples.
     *
     * A .zip file of images that depict the visual subject of a class in the classifier. The positive examples create
     * or update classes in the classifier. You can include more than one positive example file in a call.
     *
     * Specify the parameter name by appending `_positive_examples` to the class name. For example,
     * `goldenretriever_positive_examples` creates the class `goldenretriever`. The string cannot contain the following
     * characters: ``$ * - { } \ | / ' " ` [ ]``.
     *
     * Include at least 10 images in .jpg or .png format. The minimum recommended image resolution is 32X32 pixels. The
     * maximum number of images is 10,000 images or 100 MB per .zip file.
     *
     * Encode special characters in the file name in UTF-8.
     *
     * @return the positiveExamples
     */
    public Map<String, IBMWatsonFile> positiveExamples() {
      return positiveExamples;
    }

    /**
     * Gets the negativeExamples.
     *
     * A .zip file of images that do not depict the visual subject of any of the classes of the new classifier. Must
     * contain a minimum of 10 images.
     *
     * Encode special characters in the file name in UTF-8.
     *
     * @return the negativeExamples
     */
    public IBMWatsonFile negativeExamples() {
      return negativeExamples;
    }

    /**
     * Gets the negativeExamplesFilename.
     *
     * The filename for negativeExamples.
     *
     * @return the negativeExamplesFilename
     */
    public String negativeExamplesFilename() {
      return negativeExamplesFilename;
    }

    private UpdateClassifierOptions(UpdateClassifierOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.classifierId, 'classifierId cannot be empty');
      IBMWatsonValidator.isTrue(builder.negativeExamples == null || builder.negativeExamplesFilename != null, 'filename cannot be null if file is not null');
      classifierId = builder.classifierId;
      positiveExamples = builder.positiveExamples;
      negativeExamples = builder.negativeExamples;
      negativeExamplesFilename = builder.negativeExamplesFilename;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateClassifierOptions builder
     */
    public UpdateClassifierOptionsBuilder newBuilder() {
      return new UpdateClassifierOptionsBuilder(this);
    }
  }

  /**
   * UpdateClassifierOptions Builder.
   */
  public class UpdateClassifierOptionsBuilder extends IBMWatsonOptionsModel {
    private String classifierId;
    private Map<String, IBMWatsonFile> positiveExamples;
    private IBMWatsonFile negativeExamples;
    private String negativeExamplesFilename;

    private UpdateClassifierOptionsBuilder(UpdateClassifierOptions updateClassifierOptions) {
      classifierId = updateClassifierOptions.classifierId;
      positiveExamples = updateClassifierOptions.positiveExamples;
      negativeExamples = updateClassifierOptions.negativeExamples;
      negativeExamplesFilename = updateClassifierOptions.negativeExamplesFilename;
      this.requestHeaders.putAll(updateClassifierOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateClassifierOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param classifierId the classifierId
     */
    public UpdateClassifierOptionsBuilder(String classifierId) {
      this.classifierId = classifierId;
    }

    /**
     * Builds a UpdateClassifierOptions.
     *
     * @return the updateClassifierOptions
     */
    public UpdateClassifierOptions build() {
      return new UpdateClassifierOptions(this);
    }

    /**
     * Adds an entry to the positiveExamples map.
     *
     * @param classname the key associated with the map entry to be added
     * @param positiveExamples the value associated with the map entry to be added
     * @return the UpdateClassifierOptions builder
     */
    public UpdateClassifierOptionsBuilder addPositiveExamples(String classname, IBMWatsonFile positiveExamples) {
      IBMWatsonValidator.notNull(classname, 'classname cannot be null');
      IBMWatsonValidator.notNull(positiveExamples, 'positiveExamples cannot be null');
      if (this.positiveExamples == null) {
        this.positiveExamples = new Map<String, IBMWatsonFile>();
      }
      this.positiveExamples.put(classname, positiveExamples);
      return this;
    }

    /**
     * Set the classifierId.
     *
     * @param classifierId the classifierId
     * @return the UpdateClassifierOptions builder
     */
    public UpdateClassifierOptionsBuilder classifierId(String classifierId) {
      this.classifierId = classifierId;
      return this;
    }

    /**
     * Set the positiveExamples.
     * Existing positiveExamples map will be replaced.
     *
     * @param positiveExamples the positiveExamples
     * @return the UpdateClassifierOptions builder
     */
    public UpdateClassifierOptionsBuilder positiveExamples(Map<String, IBMWatsonFile> positiveExamples) {
      this.positiveExamples = positiveExamples;
      return this;
    }

    /**
     * Set the negativeExamples.
     *
     * @param negativeExamples the negativeExamples
     * @return the UpdateClassifierOptions builder
     */
    public UpdateClassifierOptionsBuilder negativeExamples(IBMWatsonFile negativeExamples) {
      this.negativeExamples = negativeExamples;
      return this;
    }

    /**
     * Set the negativeExamplesFilename.
     *
     * @param negativeExamplesFilename the negativeExamplesFilename
     * @return the UpdateClassifierOptions builder
     */
    public UpdateClassifierOptionsBuilder negativeExamplesFilename(String negativeExamplesFilename) {
      this.negativeExamplesFilename = negativeExamplesFilename;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateClassifierOptions builder
     */
    public UpdateClassifierOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Information about something that went wrong.
   */
  public class WarningInfo extends IBMWatsonGenericModel {
    private String warningId;
    private String description;

    /**
     * Gets the warningId.
     *
     * Codified warning string, such as `limit_reached`.
     *
     * @return the warningId
     */
    @AuraEnabled
    public String getWarningId() {
      return warningId;
    }

    /**
     * Gets the description.
     *
     * Information about the error.
     *
     * @return the description
     */
    @AuraEnabled
    public String getDescription() {
      return description;
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
        'warning_id' => 'warningId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      WarningInfo ret = (WarningInfo) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

}