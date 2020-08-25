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

/**
 * The IBM Watson&trade; Visual Recognition service uses deep learning algorithms to identify scenes and objects in
 * images that you upload to the service. You can create and train a custom classifier to identify subjects that suit
 * your needs.
 *
 * @version V3
 * @see <a href="https://cloud.ibm.com/docs/visual-recognition/">Visual Recognition</a>
 */
public class IBMVisualRecognitionV3 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'visual_recognition';
  private static final String SERVICE_URL = 'https://gateway.watsonplatform.net/visual-recognition/api';

  private String versionDate;

  /**
   * Instantiates a new `IBMVisualRecognitionV3`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMVisualRecognitionV3(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMVisualRecognitionV3`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMVisualRecognitionV3(String versionDate, IBMWatsonAuthenticator authenticator) {
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
   * Classify images.
   *
   * Classify images with built-in or custom classifiers.
   *
   * @param classifyOptions the {@link IBMVisualRecognitionV3Models.ClassifyOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV3Models.ClassifiedImages} with the response
   */
  public IBMVisualRecognitionV3Models.ClassifiedImages classify(IBMVisualRecognitionV3Models.ClassifyOptions classifyOptions) {
    IBMWatsonValidator.notNull(classifyOptions, 'classifyOptions cannot be null');
    IBMWatsonValidator.isTrue((classifyOptions.imagesFile() != null) || (classifyOptions.url() != null) || (classifyOptions.threshold() != null) || (classifyOptions.owners() != null) || (classifyOptions.classifierIds() != null), 'At least one of images_file, url, threshold, owners, or classifier_ids must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/classify');
    builder.addHeader('Accept', 'application/json');
    if (classifyOptions.acceptLanguage() != null) {
      builder.addHeader('Accept-Language', classifyOptions.acceptLanguage());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=classify');
    Map<String, String> requestHeaders = (classifyOptions != null) ? classifyOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    if (classifyOptions.imagesFile() != null) {
      IBMWatsonRequestBody imagesFileBody = IBMWatsonRequestBody.create(classifyOptions.imagesFile(), classifyOptions.imagesFileContentType());
      multipartBuilder.addFormDataPart('images_file', classifyOptions.imagesFilename(), imagesFileBody);
    }
    if (classifyOptions.url() != null) {
      multipartBuilder.addFormDataPart('url', classifyOptions.url());
    }
    if (classifyOptions.threshold() != null) {
      multipartBuilder.addFormDataPart('threshold', String.valueOf(classifyOptions.threshold()));
    }
    if (classifyOptions.owners() != null) {
      for (String item : classifyOptions.owners()) {
        multipartBuilder.addFormDataPart('owners', item);
      }
    }
    if (classifyOptions.classifierIds() != null) {
      for (String item : classifyOptions.classifierIds()) {
        multipartBuilder.addFormDataPart('classifier_ids', item);
      }
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMVisualRecognitionV3Models.ClassifiedImages) createServiceCall(builder.build(), IBMVisualRecognitionV3Models.ClassifiedImages.class);
  }

  /**
   * Create a classifier.
   *
   * Train a new multi-faceted classifier on the uploaded image data. Create your custom classifier with positive or
   * negative example training images. Include at least two sets of examples, either two positive example files or one
   * positive and one negative file. You can upload a maximum of 256 MB per call.
   *
   * **Tips when creating:**
   *
   * - If you set the **X-Watson-Learning-Opt-Out** header parameter to `true` when you create a classifier, the example
   * training images are not stored. Save your training images locally. For more information, see [Data
   * collection](#data-collection).
   *
   * - Encode all names in UTF-8 if they contain non-ASCII characters (.zip and image file names, and classifier and
   * class names). The service assumes UTF-8 encoding if it encounters non-ASCII characters.
   *
   * @param createClassifierOptions the {@link IBMVisualRecognitionV3Models.CreateClassifierOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV3Models.Classifier} with the response
   */
  public IBMVisualRecognitionV3Models.Classifier createClassifier(IBMVisualRecognitionV3Models.CreateClassifierOptions createClassifierOptions) {
    IBMWatsonValidator.notNull(createClassifierOptions, 'createClassifierOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/classifiers');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=createClassifier');
    Map<String, String> requestHeaders = (createClassifierOptions != null) ? createClassifierOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    multipartBuilder.addFormDataPart('name', createClassifierOptions.name());
    for (String key : createClassifierOptions.positiveExamples().keySet()) {
      String partName = String.format('{0}_positive_examples', new String[] { key });
      IBMWatsonFile file = createClassifierOptions.positiveExamples().get(key);
      IBMWatsonRequestBody formPart = IBMWatsonRequestBody.create(file, 'application/octet-stream');
      multipartBuilder.addFormDataPart(partName, file.name() + '.zip', formPart);
    }
    if (createClassifierOptions.negativeExamples() != null) {
      IBMWatsonRequestBody negativeExamplesBody = IBMWatsonRequestBody.create(createClassifierOptions.negativeExamples(), 'application/octet-stream');
      String negativeExamplesFilename = createClassifierOptions.negativeExamplesFilename();
      if (!negativeExamplesFilename.contains('.')) {
        negativeExamplesFilename += '.zip';
      }
      multipartBuilder.addFormDataPart('negative_examples', negativeExamplesFilename, negativeExamplesBody);
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMVisualRecognitionV3Models.Classifier) createServiceCall(builder.build(), IBMVisualRecognitionV3Models.Classifier.class);
  }

  /**
   * Retrieve a list of classifiers.
   *
   * @param listClassifiersOptions the {@link IBMVisualRecognitionV3Models.ListClassifiersOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV3Models.Classifiers} with the response
   */
  public IBMVisualRecognitionV3Models.Classifiers listClassifiers(IBMVisualRecognitionV3Models.ListClassifiersOptions listClassifiersOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v3/classifiers');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=listClassifiers');
    Map<String, String> requestHeaders = (listClassifiersOptions != null) ? listClassifiersOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (listClassifiersOptions != null && listClassifiersOptions.verbose() != null) {
      builder.query('verbose', String.valueOf(listClassifiersOptions.verbose()));
    }

    return (IBMVisualRecognitionV3Models.Classifiers) createServiceCall(builder.build(), IBMVisualRecognitionV3Models.Classifiers.class);
  }

  /**
   * Retrieve classifier details.
   *
   * Retrieve information about a custom classifier.
   *
   * @param getClassifierOptions the {@link IBMVisualRecognitionV3Models.GetClassifierOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV3Models.Classifier} with the response
   */
  public IBMVisualRecognitionV3Models.Classifier getClassifier(IBMVisualRecognitionV3Models.GetClassifierOptions getClassifierOptions) {
    IBMWatsonValidator.notNull(getClassifierOptions, 'getClassifierOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v3/classifiers/{0}', new String[]{ getClassifierOptions.classifierId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=getClassifier');
    Map<String, String> requestHeaders = (getClassifierOptions != null) ? getClassifierOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMVisualRecognitionV3Models.Classifier) createServiceCall(builder.build(), IBMVisualRecognitionV3Models.Classifier.class);
  }

  /**
   * Update a classifier.
   *
   * Update a custom classifier by adding new positive or negative classes or by adding new images to existing classes.
   * You must supply at least one set of positive or negative examples. For details, see [Updating custom
   * classifiers](https://cloud.ibm.com/docs/visual-recognition?topic=visual-recognition-customizing#updating-custom-classifiers).
   *
   * Encode all names in UTF-8 if they contain non-ASCII characters (.zip and image file names, and classifier and class
   * names). The service assumes UTF-8 encoding if it encounters non-ASCII characters.
   *
   * **Tips about retraining:**
   *
   * - You can't update the classifier if the **X-Watson-Learning-Opt-Out** header parameter was set to `true` when the
   * classifier was created. Training images are not stored in that case. Instead, create another classifier. For more
   * information, see [Data collection](#data-collection).
   *
   * - Don't make retraining calls on a classifier until the status is ready. When you submit retraining requests in
   * parallel, the last request overwrites the previous requests. The `retrained` property shows the last time the
   * classifier retraining finished.
   *
   * @param updateClassifierOptions the {@link IBMVisualRecognitionV3Models.UpdateClassifierOptions} containing the options for the call
   * @return the {@link IBMVisualRecognitionV3Models.Classifier} with the response
   */
  public IBMVisualRecognitionV3Models.Classifier updateClassifier(IBMVisualRecognitionV3Models.UpdateClassifierOptions updateClassifierOptions) {
    IBMWatsonValidator.notNull(updateClassifierOptions, 'updateClassifierOptions cannot be null');
    IBMWatsonValidator.isTrue((updateClassifierOptions.positiveExamples() != null) || (updateClassifierOptions.negativeExamples() != null), 'At least one of positive_examples or negative_examples must be supplied.');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v3/classifiers/{0}', new String[]{ updateClassifierOptions.classifierId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=updateClassifier');
    Map<String, String> requestHeaders = (updateClassifierOptions != null) ? updateClassifierOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    if (updateClassifierOptions.positiveExamples() != null) {
      for (String key : updateClassifierOptions.positiveExamples().keySet()) {
        String partName = String.format('{0}_positive_examples', new String[] { key });
        IBMWatsonFile file = updateClassifierOptions.positiveExamples().get(key);
        IBMWatsonRequestBody formPart = IBMWatsonRequestBody.create(file, 'application/octet-stream');
        multipartBuilder.addFormDataPart(partName, file.name(), formPart);
      }
    }
    if (updateClassifierOptions.negativeExamples() != null) {
      IBMWatsonRequestBody negativeExamplesBody = IBMWatsonRequestBody.create(updateClassifierOptions.negativeExamples(), 'application/octet-stream');
      multipartBuilder.addFormDataPart('negative_examples', updateClassifierOptions.negativeExamplesFilename(), negativeExamplesBody);
    }
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMVisualRecognitionV3Models.Classifier) createServiceCall(builder.build(), IBMVisualRecognitionV3Models.Classifier.class);
  }

  /**
   * Delete a classifier.
   *
   * @param deleteClassifierOptions the {@link IBMVisualRecognitionV3Models.DeleteClassifierOptions} containing the options for the call
   * @return the service call
   */
  public void deleteClassifier(IBMVisualRecognitionV3Models.DeleteClassifierOptions deleteClassifierOptions) {
    IBMWatsonValidator.notNull(deleteClassifierOptions, 'deleteClassifierOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v3/classifiers/{0}', new String[]{ deleteClassifierOptions.classifierId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=deleteClassifier');
    Map<String, String> requestHeaders = (deleteClassifierOptions != null) ? deleteClassifierOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Retrieve a Core ML model of a classifier.
   *
   * Download a Core ML model file (.mlmodel) of a custom classifier that returns <tt>"core_ml_enabled": true</tt> in
   * the classifier details.
   *
   * @param getCoreMlModelOptions the {@link IBMVisualRecognitionV3Models.GetCoreMlModelOptions} containing the options for the call
   * @return the {@link IBMWatsonFile} with the response
   */
  public IBMWatsonFile getCoreMlModel(IBMVisualRecognitionV3Models.GetCoreMlModelOptions getCoreMlModelOptions) {
    IBMWatsonValidator.notNull(getCoreMlModelOptions, 'getCoreMlModelOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v3/classifiers/{0}/core_ml_model', new String[]{ getCoreMlModelOptions.classifierId() }));
    builder.addHeader('Accept', 'application/octet-stream');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=getCoreMlModel');
    Map<String, String> requestHeaders = (getCoreMlModelOptions != null) ? getCoreMlModelOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMWatsonFile) createServiceCall(builder.build(), IBMWatsonFile.class);
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
   * @param deleteUserDataOptions the {@link IBMVisualRecognitionV3Models.DeleteUserDataOptions} containing the options for the call
   * @return the service call
   */
  public void deleteUserData(IBMVisualRecognitionV3Models.DeleteUserDataOptions deleteUserDataOptions) {
    IBMWatsonValidator.notNull(deleteUserDataOptions, 'deleteUserDataOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + '/v3/user_data');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=watson_vision_combined;service_version=V3;operation_id=deleteUserData');
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