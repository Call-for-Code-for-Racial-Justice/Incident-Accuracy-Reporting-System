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

/**
 * Provide images to the IBM Watson&trade; Visual Recognition service for analysis. The service detects objects based on
 * a set of images with training data.
 *
 * @version V4
 * @see <a href="https://cloud.ibm.com/docs/visual-recognition?topic=visual-recognition-object-detection-overview">Visual Recognition</a>
 */
public class IBMVisualRecognitionV4 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'visual_recognition';
  private static final String SERVICE_URL = 'https://gateway.watsonplatform.net/visual-recognition/api';

  private String versionDate;

  /**
   * Instantiates a new `IBMVisualRecognitionV4`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMVisualRecognitionV4(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMVisualRecognitionV4`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMVisualRecognitionV4(String versionDate, IBMWatsonAuthenticator authenticator) {
    super(SERVICE_NAME, 'v4', authenticator);

    if ((getServiceURL() == null) || String.isBlank(getServiceURL())) {
      setServiceURL(SERVICE_URL);
    }

    if (String.isBlank(versionDate)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('versionDate cannot be null.');
    }
    this.versionDate = versionDate;
  }

  /**
   * Analyze images.
   *
   * Analyze images by URL, by file, or both against your own collection. Make sure that
   * **training_status.objects.ready** is `true` for the feature before you use a collection to analyze images.
   *
   * Encode the image and .zip file names in UTF-8 if they contain non-ASCII characters. The service assumes UTF-8
   * encoding if it encounters non-ASCII characters.
   *
   * @param analyzeOptions the {@link IBMVisualRecognitionV4Models.AnalyzeOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.AnalyzeResponse} with the response
   */
  public IBMVisualRecognitionV4Models.AnalyzeResponse analyze(IBMVisualRecognitionV4Models.AnalyzeOptions analyzeOptions) {
    IBMWatsonValidator.notNull(analyzeOptions, 'analyzeOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v4/analyze');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=analyze');
    Map<String, String> requestHeaders = (analyzeOptions != null) ? analyzeOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    multipartBuilder.addFormDataPart('collection_ids', String.join(analyzeOptions.collectionIds(), ','));
    multipartBuilder.addFormDataPart('features', String.join(analyzeOptions.features(), ','));
    if (analyzeOptions.imagesFile() != null) {
      for (IBMWatsonFile item : analyzeOptions.imagesFile()) {
        IBMWatsonRequestBody itemBody = IBMWatsonRequestBody.create(item, item.contentType());
        multipartBuilder.addFormDataPart('images_file', item.name(), itemBody);
      }
    }
    if (analyzeOptions.imageUrl() != null) {
      for (String item : analyzeOptions.imageUrl()) {
        multipartBuilder.addFormDataPart('image_url', item);
      }
    }
    if (analyzeOptions.threshold() != null) {
      multipartBuilder.addFormDataPart('threshold', String.valueOf(analyzeOptions.threshold()));
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMVisualRecognitionV4Models.AnalyzeResponse) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.AnalyzeResponse.class);
  }

  /**
   * Create a collection.
   *
   * Create a collection that can be used to store images.
   *
   * To create a collection without specifying a name and description, include an empty JSON object in the request body.
   *
   * Encode the name and description in UTF-8 if they contain non-ASCII characters. The service assumes UTF-8 encoding
   * if it encounters non-ASCII characters.
   *
   * @param createCollectionOptions the {@link IBMVisualRecognitionV4Models.CreateCollectionOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.Collection} with the response
   */
  public IBMVisualRecognitionV4Models.Collection createCollection(IBMVisualRecognitionV4Models.CreateCollectionOptions createCollectionOptions) {
    IBMWatsonValidator.notNull(createCollectionOptions, 'createCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v4/collections');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=createCollection');
    Map<String, String> requestHeaders = (createCollectionOptions != null) ? createCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (createCollectionOptions.name() != null) {
      contentJson.put('name', createCollectionOptions.name());
    }
    if (createCollectionOptions.description() != null) {
      contentJson.put('description', createCollectionOptions.description());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMVisualRecognitionV4Models.Collection) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.Collection.class);
  }

  /**
   * List collections.
   *
   * Retrieves a list of collections for the service instance.
   *
   * @param listCollectionsOptions the {@link IBMVisualRecognitionV4Models.ListCollectionsOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.CollectionsList} with the response
   */
  public IBMVisualRecognitionV4Models.CollectionsList listCollections(IBMVisualRecognitionV4Models.ListCollectionsOptions listCollectionsOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v4/collections');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=listCollections');
    Map<String, String> requestHeaders = (listCollectionsOptions != null) ? listCollectionsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMVisualRecognitionV4Models.CollectionsList) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.CollectionsList.class);
  }

  /**
   * Get collection details.
   *
   * Get details of one collection.
   *
   * @param getCollectionOptions the {@link IBMVisualRecognitionV4Models.GetCollectionOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.Collection} with the response
   */
  public IBMVisualRecognitionV4Models.Collection getCollection(IBMVisualRecognitionV4Models.GetCollectionOptions getCollectionOptions) {
    IBMWatsonValidator.notNull(getCollectionOptions, 'getCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v4/collections/{0}', new String[]{ getCollectionOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=getCollection');
    Map<String, String> requestHeaders = (getCollectionOptions != null) ? getCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMVisualRecognitionV4Models.Collection) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.Collection.class);
  }

  /**
   * Update a collection.
   *
   * Update the name or description of a collection.
   *
   * Encode the name and description in UTF-8 if they contain non-ASCII characters. The service assumes UTF-8 encoding
   * if it encounters non-ASCII characters.
   *
   * @param updateCollectionOptions the {@link IBMVisualRecognitionV4Models.UpdateCollectionOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.Collection} with the response
   */
  public IBMVisualRecognitionV4Models.Collection updateCollection(IBMVisualRecognitionV4Models.UpdateCollectionOptions updateCollectionOptions) {
    IBMWatsonValidator.notNull(updateCollectionOptions, 'updateCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v4/collections/{0}', new String[]{ updateCollectionOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=updateCollection');
    Map<String, String> requestHeaders = (updateCollectionOptions != null) ? updateCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (updateCollectionOptions.name() != null) {
      contentJson.put('name', updateCollectionOptions.name());
    }
    if (updateCollectionOptions.description() != null) {
      contentJson.put('description', updateCollectionOptions.description());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMVisualRecognitionV4Models.Collection) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.Collection.class);
  }

  /**
   * Delete a collection.
   *
   * Delete a collection from the service instance.
   *
   * @param deleteCollectionOptions the {@link IBMVisualRecognitionV4Models.DeleteCollectionOptions} containing the options for the call
   * @return the service call
   */
  public void deleteCollection(IBMVisualRecognitionV4Models.DeleteCollectionOptions deleteCollectionOptions) {
    IBMWatsonValidator.notNull(deleteCollectionOptions, 'deleteCollectionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v4/collections/{0}', new String[]{ deleteCollectionOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=deleteCollection');
    Map<String, String> requestHeaders = (deleteCollectionOptions != null) ? deleteCollectionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Add images.
   *
   * Add images to a collection by URL, by file, or both.
   *
   * Encode the image and .zip file names in UTF-8 if they contain non-ASCII characters. The service assumes UTF-8
   * encoding if it encounters non-ASCII characters.
   *
   * @param addImagesOptions the {@link IBMVisualRecognitionV4Models.AddImagesOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.ImageDetailsList} with the response
   */
  public IBMVisualRecognitionV4Models.ImageDetailsList addImages(IBMVisualRecognitionV4Models.AddImagesOptions addImagesOptions) {
    IBMWatsonValidator.notNull(addImagesOptions, 'addImagesOptions cannot be null');
    IBMWatsonValidator.isTrue((addImagesOptions.imagesFile() != null) || (addImagesOptions.imageUrl() != null) || (addImagesOptions.trainingData() != null), 'At least one of images_file, image_url, or training_data must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v4/collections/{0}/images', new String[]{ addImagesOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=addImages');
    Map<String, String> requestHeaders = (addImagesOptions != null) ? addImagesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    if (addImagesOptions.imagesFile() != null) {
      for (IBMWatsonFile item : addImagesOptions.imagesFile()) {
        IBMWatsonRequestBody itemBody = IBMWatsonRequestBody.create(item, item.contentType());
        multipartBuilder.addFormDataPart('images_file', item.name(), itemBody);
      }
    }
    if (addImagesOptions.imageUrl() != null) {
      for (String item : addImagesOptions.imageUrl()) {
        multipartBuilder.addFormDataPart('image_url', item);
      }
    }
    if (addImagesOptions.trainingData() != null) {
      multipartBuilder.addFormDataPart('training_data', addImagesOptions.trainingData());
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMVisualRecognitionV4Models.ImageDetailsList) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.ImageDetailsList.class);
  }

  /**
   * List images.
   *
   * Retrieves a list of images in a collection.
   *
   * @param listImagesOptions the {@link IBMVisualRecognitionV4Models.ListImagesOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.ImageSummaryList} with the response
   */
  public IBMVisualRecognitionV4Models.ImageSummaryList listImages(IBMVisualRecognitionV4Models.ListImagesOptions listImagesOptions) {
    IBMWatsonValidator.notNull(listImagesOptions, 'listImagesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v4/collections/{0}/images', new String[]{ listImagesOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=listImages');
    Map<String, String> requestHeaders = (listImagesOptions != null) ? listImagesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMVisualRecognitionV4Models.ImageSummaryList) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.ImageSummaryList.class);
  }

  /**
   * Get image details.
   *
   * Get the details of an image in a collection.
   *
   * @param getImageDetailsOptions the {@link IBMVisualRecognitionV4Models.GetImageDetailsOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.ImageDetails} with the response
   */
  public IBMVisualRecognitionV4Models.ImageDetails getImageDetails(IBMVisualRecognitionV4Models.GetImageDetailsOptions getImageDetailsOptions) {
    IBMWatsonValidator.notNull(getImageDetailsOptions, 'getImageDetailsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v4/collections/{0}/images/{1}', new String[]{ getImageDetailsOptions.collectionId(), getImageDetailsOptions.imageId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=getImageDetails');
    Map<String, String> requestHeaders = (getImageDetailsOptions != null) ? getImageDetailsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMVisualRecognitionV4Models.ImageDetails) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.ImageDetails.class);
  }

  /**
   * Delete an image.
   *
   * Delete one image from a collection.
   *
   * @param deleteImageOptions the {@link IBMVisualRecognitionV4Models.DeleteImageOptions} containing the options for the call
   * @return the service call
   */
  public void deleteImage(IBMVisualRecognitionV4Models.DeleteImageOptions deleteImageOptions) {
    IBMWatsonValidator.notNull(deleteImageOptions, 'deleteImageOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v4/collections/{0}/images/{1}', new String[]{ deleteImageOptions.collectionId(), deleteImageOptions.imageId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=deleteImage');
    Map<String, String> requestHeaders = (deleteImageOptions != null) ? deleteImageOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Get a JPEG file of an image.
   *
   * Download a JPEG representation of an image.
   *
   * @param getJpegImageOptions the {@link IBMVisualRecognitionV4Models.GetJpegImageOptions} containing the options for the call
   * @return the {@link IBMWatsonFile} with the response
   */
  public IBMWatsonFile getJpegImage(IBMVisualRecognitionV4Models.GetJpegImageOptions getJpegImageOptions) {
    IBMWatsonValidator.notNull(getJpegImageOptions, 'getJpegImageOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v4/collections/{0}/images/{1}/jpeg', new String[]{ getJpegImageOptions.collectionId(), getJpegImageOptions.imageId() }));
    builder.addHeader('Accept', 'image/jpeg');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=getJpegImage');
    Map<String, String> requestHeaders = (getJpegImageOptions != null) ? getJpegImageOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getJpegImageOptions.size() != null) {
      builder.query('size', getJpegImageOptions.size());
    }

    return (IBMWatsonFile) createServiceCall(builder.build(), IBMWatsonFile.class);
  }

  /**
   * List object metadata.
   *
   * Retrieves a list of object names in a collection.
   *
   * @param listObjectMetadataOptions the {@link IBMVisualRecognitionV4Models.ListObjectMetadataOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.ObjectMetadataList} with the response
   */
  public IBMVisualRecognitionV4Models.ObjectMetadataList listObjectMetadata(IBMVisualRecognitionV4Models.ListObjectMetadataOptions listObjectMetadataOptions) {
    IBMWatsonValidator.notNull(listObjectMetadataOptions, 'listObjectMetadataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v4/collections/{0}/objects', new String[]{ listObjectMetadataOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=listObjectMetadata');
    Map<String, String> requestHeaders = (listObjectMetadataOptions != null) ? listObjectMetadataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMVisualRecognitionV4Models.ObjectMetadataList) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.ObjectMetadataList.class);
  }

  /**
   * Update an object name.
   *
   * Update the name of an object. A successful request updates the training data for all images that use the object.
   *
   * @param updateObjectMetadataOptions the {@link IBMVisualRecognitionV4Models.UpdateObjectMetadataOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.UpdateObjectMetadata} with the response
   */
  public IBMVisualRecognitionV4Models.UpdateObjectMetadata updateObjectMetadata(IBMVisualRecognitionV4Models.UpdateObjectMetadataOptions updateObjectMetadataOptions) {
    IBMWatsonValidator.notNull(updateObjectMetadataOptions, 'updateObjectMetadataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v4/collections/{0}/objects/{1}', new String[]{ updateObjectMetadataOptions.collectionId(), updateObjectMetadataOptions.xObject() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=updateObjectMetadata');
    Map<String, String> requestHeaders = (updateObjectMetadataOptions != null) ? updateObjectMetadataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('object', updateObjectMetadataOptions.newObject());
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMVisualRecognitionV4Models.UpdateObjectMetadata) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.UpdateObjectMetadata.class);
  }

  /**
   * Get object metadata.
   *
   * Get the number of bounding boxes for a single object in a collection.
   *
   * @param getObjectMetadataOptions the {@link IBMVisualRecognitionV4Models.GetObjectMetadataOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.ObjectMetadata} with the response
   */
  public IBMVisualRecognitionV4Models.ObjectMetadata getObjectMetadata(IBMVisualRecognitionV4Models.GetObjectMetadataOptions getObjectMetadataOptions) {
    IBMWatsonValidator.notNull(getObjectMetadataOptions, 'getObjectMetadataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v4/collections/{0}/objects/{1}', new String[]{ getObjectMetadataOptions.collectionId(), getObjectMetadataOptions.xObject() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=getObjectMetadata');
    Map<String, String> requestHeaders = (getObjectMetadataOptions != null) ? getObjectMetadataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMVisualRecognitionV4Models.ObjectMetadata) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.ObjectMetadata.class);
  }

  /**
   * Delete an object.
   *
   * Delete one object from a collection. A successful request deletes the training data from all images that use the
   * object.
   *
   * @param deleteObjectOptions the {@link IBMVisualRecognitionV4Models.DeleteObjectOptions} containing the options for the call
   * @return the service call
   */
  public void deleteObject(IBMVisualRecognitionV4Models.DeleteObjectOptions deleteObjectOptions) {
    IBMWatsonValidator.notNull(deleteObjectOptions, 'deleteObjectOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v4/collections/{0}/objects/{1}', new String[]{ deleteObjectOptions.collectionId(), deleteObjectOptions.xObject() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=deleteObject');
    Map<String, String> requestHeaders = (deleteObjectOptions != null) ? deleteObjectOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Train a collection.
   *
   * Start training on images in a collection. The collection must have enough training data and untrained data (the
   * **training_status.objects.data_changed** is `true`). If training is in progress, the request queues the next
   * training job.
   *
   * @param trainOptions the {@link IBMVisualRecognitionV4Models.TrainOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.Collection} with the response
   */
  public IBMVisualRecognitionV4Models.Collection train(IBMVisualRecognitionV4Models.TrainOptions trainOptions) {
    IBMWatsonValidator.notNull(trainOptions, 'trainOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v4/collections/{0}/train', new String[]{ trainOptions.collectionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=train');
    Map<String, String> requestHeaders = (trainOptions != null) ? trainOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    builder.bodyJson('{}');

    return (IBMVisualRecognitionV4Models.Collection) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.Collection.class);
  }

  /**
   * Add training data to an image.
   *
   * Add, update, or delete training data for an image. Encode the object name in UTF-8 if it contains non-ASCII
   * characters. The service assumes UTF-8 encoding if it encounters non-ASCII characters.
   *
   * Elements in the request replace the existing elements.
   *
   * - To update the training data, provide both the unchanged and the new or changed values.
   *
   * - To delete the training data, provide an empty value for the training data.
   *
   * @param addImageTrainingDataOptions the {@link IBMVisualRecognitionV4Models.AddImageTrainingDataOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.TrainingDataObjects} with the response
   */
  public IBMVisualRecognitionV4Models.TrainingDataObjects addImageTrainingData(IBMVisualRecognitionV4Models.AddImageTrainingDataOptions addImageTrainingDataOptions) {
    IBMWatsonValidator.notNull(addImageTrainingDataOptions, 'addImageTrainingDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v4/collections/{0}/images/{1}/training_data', new String[]{ addImageTrainingDataOptions.collectionId(), addImageTrainingDataOptions.imageId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=addImageTrainingData');
    Map<String, String> requestHeaders = (addImageTrainingDataOptions != null) ? addImageTrainingDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (addImageTrainingDataOptions.objects() != null) {
      List<Object> objectsList = new List<Object>();
      for (IBMVisualRecognitionV4Models.TrainingDataObject objectsItem : addImageTrainingDataOptions.objects()) {
        objectsList.add(objectsItem.replacePropertyNames());
      }
      contentJson.put('objects', objectsList);
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMVisualRecognitionV4Models.TrainingDataObjects) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.TrainingDataObjects.class);
  }

  /**
   * Get training usage.
   *
   * Information about the completed training events. You can use this information to determine how close you are to the
   * training limits for the month.
   *
   * @param getTrainingUsageOptions the {@link IBMVisualRecognitionV4Models.GetTrainingUsageOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV4Models.TrainingEvents} with the response
   */
  public IBMVisualRecognitionV4Models.TrainingEvents getTrainingUsage(IBMVisualRecognitionV4Models.GetTrainingUsageOptions getTrainingUsageOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v4/training_usage');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=getTrainingUsage');
    Map<String, String> requestHeaders = (getTrainingUsageOptions != null) ? getTrainingUsageOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getTrainingUsageOptions != null && getTrainingUsageOptions.startTime() != null) {
      builder.query('start_time', getTrainingUsageOptions.startTime());
    }
    if (getTrainingUsageOptions != null && getTrainingUsageOptions.endTime() != null) {
      builder.query('end_time', getTrainingUsageOptions.endTime());
    }

    return (IBMVisualRecognitionV4Models.TrainingEvents) createServiceCall(builder.build(), IBMVisualRecognitionV4Models.TrainingEvents.class);
  }

  /**
   * Delete labeled data.
   *
   * Deletes all data associated with a specified customer ID. The method has no effect if no data is associated with
   * the customer ID.
   *
   * You associate a customer ID with data by passing the `X-Watson-Metadata` header with a request that passes data.
   * For more information about personal data and customer IDs, see [Information
   * security](https://cloud.ibm.com/docs/visual-recognition?topic=visual-recognition-information-security).
   *
   * @param deleteUserDataOptions the {@link IBMVisualRecognitionV4Models.DeleteUserDataOptions} containing the options for the call
   * @return the service call
   */
  public void deleteUserData(IBMVisualRecognitionV4Models.DeleteUserDataOptions deleteUserDataOptions) {
    IBMWatsonValidator.notNull(deleteUserDataOptions, 'deleteUserDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + '/v4/user_data');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V4;operation_id=deleteUserData');
    Map<String, String> requestHeaders = (deleteUserDataOptions != null) ? deleteUserDataOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (deleteUserDataOptions.customerId() != null) {
      builder.query('customer_id', deleteUserDataOptions.customerId());
    }

    createServiceCall(builder.build(), null);
  }

}