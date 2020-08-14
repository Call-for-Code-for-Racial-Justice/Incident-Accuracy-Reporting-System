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

/**
 * IBM Watson&trade; Compare and Comply analyzes governing documents to provide details about critical aspects of the
 * documents.
 *
 * @version V1
 * @see <a href="https://cloud.ibm.com/docs/compare-comply?topic=compare-comply-about">Compare Comply</a>
 */
public class IBMCompareComplyV1 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'compare_comply';
  private static final String SERVICE_URL = 'https://gateway.watsonplatform.net/compare-comply/api';

  private String versionDate;

  /**
   * Instantiates a new `IBMCompareComplyV1`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMCompareComplyV1(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMCompareComplyV1`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMCompareComplyV1(String versionDate, IBMWatsonAuthenticator authenticator) {
    super(SERVICE_NAME, 'v1', authenticator);

    if ((getServiceURL() == null) || String.isBlank(getServiceURL())) {
      setServiceURL(SERVICE_URL);
    }

    if (String.isBlank(versionDate)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('versionDate cannot be null.');
    }
    this.versionDate = versionDate;
  }

  /**
   * Convert document to HTML.
   *
   * Converts a document to HTML.
   *
   * @param convertToHtmlOptions the {@link IBMCompareComplyV1Models.ConvertToHtmlOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.HTMLReturn} with the response
   */
  public IBMCompareComplyV1Models.HTMLReturn convertToHtml(IBMCompareComplyV1Models.ConvertToHtmlOptions convertToHtmlOptions) {
    IBMWatsonValidator.notNull(convertToHtmlOptions, 'convertToHtmlOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/html_conversion');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=convertToHtml');
    Map<String, String> requestHeaders = (convertToHtmlOptions != null) ? convertToHtmlOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (convertToHtmlOptions.model() != null) {
      builder.query('model', convertToHtmlOptions.model());
    }
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    IBMWatsonRequestBody fileBody = IBMWatsonRequestBody.create(convertToHtmlOptions.file(), convertToHtmlOptions.fileContentType());
    multipartBuilder.addFormDataPart('file', 'filename', fileBody);
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMCompareComplyV1Models.HTMLReturn) createServiceCall(builder.build(), IBMCompareComplyV1Models.HTMLReturn.class);
  }

  /**
   * Classify the elements of a document.
   *
   * Analyzes the structural and semantic elements of a document.
   *
   * @param classifyElementsOptions the {@link IBMCompareComplyV1Models.ClassifyElementsOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.ClassifyReturn} with the response
   */
  public IBMCompareComplyV1Models.ClassifyReturn classifyElements(IBMCompareComplyV1Models.ClassifyElementsOptions classifyElementsOptions) {
    IBMWatsonValidator.notNull(classifyElementsOptions, 'classifyElementsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/element_classification');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=classifyElements');
    Map<String, String> requestHeaders = (classifyElementsOptions != null) ? classifyElementsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (classifyElementsOptions.model() != null) {
      builder.query('model', classifyElementsOptions.model());
    }
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    IBMWatsonRequestBody fileBody = IBMWatsonRequestBody.create(classifyElementsOptions.file(), classifyElementsOptions.fileContentType());
    multipartBuilder.addFormDataPart('file', 'filename', fileBody);
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMCompareComplyV1Models.ClassifyReturn) createServiceCall(builder.build(), IBMCompareComplyV1Models.ClassifyReturn.class);
  }

  /**
   * Extract a document's tables.
   *
   * Analyzes the tables in a document.
   *
   * @param extractTablesOptions the {@link IBMCompareComplyV1Models.ExtractTablesOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.TableReturn} with the response
   */
  public IBMCompareComplyV1Models.TableReturn extractTables(IBMCompareComplyV1Models.ExtractTablesOptions extractTablesOptions) {
    IBMWatsonValidator.notNull(extractTablesOptions, 'extractTablesOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/tables');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=extractTables');
    Map<String, String> requestHeaders = (extractTablesOptions != null) ? extractTablesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (extractTablesOptions.model() != null) {
      builder.query('model', extractTablesOptions.model());
    }
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    IBMWatsonRequestBody fileBody = IBMWatsonRequestBody.create(extractTablesOptions.file(), extractTablesOptions.fileContentType());
    multipartBuilder.addFormDataPart('file', 'filename', fileBody);
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMCompareComplyV1Models.TableReturn) createServiceCall(builder.build(), IBMCompareComplyV1Models.TableReturn.class);
  }

  /**
   * Compare two documents.
   *
   * Compares two input documents. Documents must be in the same format.
   *
   * @param compareDocumentsOptions the {@link IBMCompareComplyV1Models.CompareDocumentsOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.CompareReturn} with the response
   */
  public IBMCompareComplyV1Models.CompareReturn compareDocuments(IBMCompareComplyV1Models.CompareDocumentsOptions compareDocumentsOptions) {
    IBMWatsonValidator.notNull(compareDocumentsOptions, 'compareDocumentsOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/comparison');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=compareDocuments');
    Map<String, String> requestHeaders = (compareDocumentsOptions != null) ? compareDocumentsOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (compareDocumentsOptions.file1Label() != null) {
      builder.query('file_1_label', compareDocumentsOptions.file1Label());
    }
    if (compareDocumentsOptions.file2Label() != null) {
      builder.query('file_2_label', compareDocumentsOptions.file2Label());
    }
    if (compareDocumentsOptions.model() != null) {
      builder.query('model', compareDocumentsOptions.model());
    }
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    IBMWatsonRequestBody file1Body = IBMWatsonRequestBody.create(compareDocumentsOptions.file1(), compareDocumentsOptions.file1ContentType());
    multipartBuilder.addFormDataPart('file_1', 'filename', file1Body);
    IBMWatsonRequestBody file2Body = IBMWatsonRequestBody.create(compareDocumentsOptions.file2(), compareDocumentsOptions.file2ContentType());
    multipartBuilder.addFormDataPart('file_2', 'filename', file2Body);
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMCompareComplyV1Models.CompareReturn) createServiceCall(builder.build(), IBMCompareComplyV1Models.CompareReturn.class);
  }

  /**
   * Add feedback.
   *
   * Adds feedback in the form of _labels_ from a subject-matter expert (SME) to a governing document.
   * **Important:** Feedback is not immediately incorporated into the training model, nor is it guaranteed to be
   * incorporated at a later date. Instead, submitted feedback is used to suggest future updates to the training model.
   *
   * @param addFeedbackOptions the {@link IBMCompareComplyV1Models.AddFeedbackOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.FeedbackReturn} with the response
   */
  public IBMCompareComplyV1Models.FeedbackReturn addFeedback(IBMCompareComplyV1Models.AddFeedbackOptions addFeedbackOptions) {
    IBMWatsonValidator.notNull(addFeedbackOptions, 'addFeedbackOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/feedback');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=addFeedback');
    Map<String, String> requestHeaders = (addFeedbackOptions != null) ? addFeedbackOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    contentJson.put('feedback_data', addFeedbackOptions.feedbackData().replacePropertyNames());
    if (addFeedbackOptions.userId() != null) {
      contentJson.put('user_id', addFeedbackOptions.userId());
    }
    if (addFeedbackOptions.comment() != null) {
      contentJson.put('comment', addFeedbackOptions.comment());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMCompareComplyV1Models.FeedbackReturn) createServiceCall(builder.build(), IBMCompareComplyV1Models.FeedbackReturn.class);
  }

  /**
   * List the feedback in a document.
   *
   * Lists the feedback in a document.
   *
   * @param listFeedbackOptions the {@link IBMCompareComplyV1Models.ListFeedbackOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.FeedbackList} with the response
   */
  public IBMCompareComplyV1Models.FeedbackList listFeedback(IBMCompareComplyV1Models.ListFeedbackOptions listFeedbackOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/feedback');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=listFeedback');
    Map<String, String> requestHeaders = (listFeedbackOptions != null) ? listFeedbackOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (listFeedbackOptions != null && listFeedbackOptions.feedbackType() != null) {
      builder.query('feedback_type', listFeedbackOptions.feedbackType());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.before() != null) {
      builder.query('before', String.valueOf(listFeedbackOptions.before()));
    }
    if (listFeedbackOptions != null && listFeedbackOptions.after() != null) {
      builder.query('after', String.valueOf(listFeedbackOptions.after()));
    }
    if (listFeedbackOptions != null && listFeedbackOptions.documentTitle() != null) {
      builder.query('document_title', listFeedbackOptions.documentTitle());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.modelId() != null) {
      builder.query('model_id', listFeedbackOptions.modelId());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.modelVersion() != null) {
      builder.query('model_version', listFeedbackOptions.modelVersion());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.categoryRemoved() != null) {
      builder.query('category_removed', listFeedbackOptions.categoryRemoved());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.categoryAdded() != null) {
      builder.query('category_added', listFeedbackOptions.categoryAdded());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.categoryNotChanged() != null) {
      builder.query('category_not_changed', listFeedbackOptions.categoryNotChanged());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.typeRemoved() != null) {
      builder.query('type_removed', listFeedbackOptions.typeRemoved());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.typeAdded() != null) {
      builder.query('type_added', listFeedbackOptions.typeAdded());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.typeNotChanged() != null) {
      builder.query('type_not_changed', listFeedbackOptions.typeNotChanged());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.pageLimit() != null) {
      builder.query('page_limit', String.valueOf(listFeedbackOptions.pageLimit()));
    }
    if (listFeedbackOptions != null && listFeedbackOptions.cursor() != null) {
      builder.query('cursor', listFeedbackOptions.cursor());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.xSort() != null) {
      builder.query('sort', listFeedbackOptions.xSort());
    }
    if (listFeedbackOptions != null && listFeedbackOptions.includeTotal() != null) {
      builder.query('include_total', String.valueOf(listFeedbackOptions.includeTotal()));
    }

    return (IBMCompareComplyV1Models.FeedbackList) createServiceCall(builder.build(), IBMCompareComplyV1Models.FeedbackList.class);
  }

  /**
   * Get a specified feedback entry.
   *
   * Gets a feedback entry with a specified `feedback_id`.
   *
   * @param getFeedbackOptions the {@link IBMCompareComplyV1Models.GetFeedbackOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.GetFeedback} with the response
   */
  public IBMCompareComplyV1Models.GetFeedback getFeedback(IBMCompareComplyV1Models.GetFeedbackOptions getFeedbackOptions) {
    IBMWatsonValidator.notNull(getFeedbackOptions, 'getFeedbackOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/feedback/{0}', new String[]{ getFeedbackOptions.feedbackId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=getFeedback');
    Map<String, String> requestHeaders = (getFeedbackOptions != null) ? getFeedbackOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (getFeedbackOptions.model() != null) {
      builder.query('model', getFeedbackOptions.model());
    }

    return (IBMCompareComplyV1Models.GetFeedback) createServiceCall(builder.build(), IBMCompareComplyV1Models.GetFeedback.class);
  }

  /**
   * Delete a specified feedback entry.
   *
   * Deletes a feedback entry with a specified `feedback_id`.
   *
   * @param deleteFeedbackOptions the {@link IBMCompareComplyV1Models.DeleteFeedbackOptions} containing the options for the call
   * @return the service call
   */
  public void deleteFeedback(IBMCompareComplyV1Models.DeleteFeedbackOptions deleteFeedbackOptions) {
    IBMWatsonValidator.notNull(deleteFeedbackOptions, 'deleteFeedbackOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v1/feedback/{0}', new String[]{ deleteFeedbackOptions.feedbackId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=deleteFeedback');
    Map<String, String> requestHeaders = (deleteFeedbackOptions != null) ? deleteFeedbackOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (deleteFeedbackOptions.model() != null) {
      builder.query('model', deleteFeedbackOptions.model());
    }

    createServiceCall(builder.build(), null);
  }

  /**
   * Submit a batch-processing request.
   *
   * Run Compare and Comply methods over a collection of input documents.
   *
   * **Important:** Batch processing requires the use of the [IBM Cloud Object Storage
   * service](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-about#about-ibm-cloud-object-storage).
   * The use of IBM Cloud Object Storage with Compare and Comply is discussed at [Using batch
   * processing](https://cloud.ibm.com/docs/compare-comply?topic=compare-comply-batching#before-you-batch).
   *
   * @param createBatchOptions the {@link IBMCompareComplyV1Models.CreateBatchOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.BatchStatus} with the response
   */
  public IBMCompareComplyV1Models.BatchStatus createBatch(IBMCompareComplyV1Models.CreateBatchOptions createBatchOptions) {
    IBMWatsonValidator.notNull(createBatchOptions, 'createBatchOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v1/batches');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=createBatch');
    Map<String, String> requestHeaders = (createBatchOptions != null) ? createBatchOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (createBatchOptions.function() != null) {
      builder.query('function', createBatchOptions.function());
    }
    if (createBatchOptions.model() != null) {
      builder.query('model', createBatchOptions.model());
    }
    IBMWatsonMultipartBody.Builder multipartBuilder = new IBMWatsonMultipartBody.Builder();
    multipartBuilder.setType(IBMWatsonMultipartBody.FORM);
    IBMWatsonRequestBody inputCredentialsFileBody = IBMWatsonRequestBody.create(createBatchOptions.inputCredentialsFile(), 'application/json');
    multipartBuilder.addFormDataPart('input_credentials_file', 'filename', inputCredentialsFileBody);
    multipartBuilder.addFormDataPart('input_bucket_location', createBatchOptions.inputBucketLocation());
    multipartBuilder.addFormDataPart('input_bucket_name', createBatchOptions.inputBucketName());
    IBMWatsonRequestBody outputCredentialsFileBody = IBMWatsonRequestBody.create(createBatchOptions.outputCredentialsFile(), 'application/json');
    multipartBuilder.addFormDataPart('output_credentials_file', 'filename', outputCredentialsFileBody);
    multipartBuilder.addFormDataPart('output_bucket_location', createBatchOptions.outputBucketLocation());
    multipartBuilder.addFormDataPart('output_bucket_name', createBatchOptions.outputBucketName());
    IBMWatsonMultipartBody multipartBody = multipartBuilder.build();
    builder.body(multipartBody).addHeaders(multipartBody.getAllHeaders());

    return (IBMCompareComplyV1Models.BatchStatus) createServiceCall(builder.build(), IBMCompareComplyV1Models.BatchStatus.class);
  }

  /**
   * List submitted batch-processing jobs.
   *
   * Lists batch-processing jobs submitted by users.
   *
   * @param listBatchesOptions the {@link IBMCompareComplyV1Models.ListBatchesOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.Batches} with the response
   */
  public IBMCompareComplyV1Models.Batches listBatches(IBMCompareComplyV1Models.ListBatchesOptions listBatchesOptions) {
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + '/v1/batches');
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=listBatches');
    Map<String, String> requestHeaders = (listBatchesOptions != null) ? listBatchesOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMCompareComplyV1Models.Batches) createServiceCall(builder.build(), IBMCompareComplyV1Models.Batches.class);
  }

  /**
   * Get information about a specific batch-processing job.
   *
   * Gets information about a batch-processing job with a specified ID.
   *
   * @param getBatchOptions the {@link IBMCompareComplyV1Models.GetBatchOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.BatchStatus} with the response
   */
  public IBMCompareComplyV1Models.BatchStatus getBatch(IBMCompareComplyV1Models.GetBatchOptions getBatchOptions) {
    IBMWatsonValidator.notNull(getBatchOptions, 'getBatchOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpGet(getServiceURL() + String.format('/v1/batches/{0}', new String[]{ getBatchOptions.batchId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=getBatch');
    Map<String, String> requestHeaders = (getBatchOptions != null) ? getBatchOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    return (IBMCompareComplyV1Models.BatchStatus) createServiceCall(builder.build(), IBMCompareComplyV1Models.BatchStatus.class);
  }

  /**
   * Update a pending or active batch-processing job.
   *
   * Updates a pending or active batch-processing job. You can rescan the input bucket to check for new documents or
   * cancel a job.
   *
   * @param updateBatchOptions the {@link IBMCompareComplyV1Models.UpdateBatchOptions} containing the options for the call
   * @return the {@link IBMCompareComplyV1Models.BatchStatus} with the response
   */
  public IBMCompareComplyV1Models.BatchStatus updateBatch(IBMCompareComplyV1Models.UpdateBatchOptions updateBatchOptions) {
    IBMWatsonValidator.notNull(updateBatchOptions, 'updateBatchOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPut(getServiceURL() + String.format('/v1/batches/{0}', new String[]{ updateBatchOptions.batchId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=compare-comply;service_version=V1;operation_id=updateBatch');
    Map<String, String> requestHeaders = (updateBatchOptions != null) ? updateBatchOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (updateBatchOptions.action() != null) {
      builder.query('action', updateBatchOptions.action());
    }
    if (updateBatchOptions.model() != null) {
      builder.query('model', updateBatchOptions.model());
    }
    builder.bodyJson('{}');

    return (IBMCompareComplyV1Models.BatchStatus) createServiceCall(builder.build(), IBMCompareComplyV1Models.BatchStatus.class);
  }

}