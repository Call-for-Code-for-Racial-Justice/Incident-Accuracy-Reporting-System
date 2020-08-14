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

public class IBMCompareComplyV1Models {
  /**
   * The addFeedback options.
   */
  public class AddFeedbackOptions extends IBMWatsonOptionsModel {
    private FeedbackDataInput feedbackData;
    private String userId;
    private String comment;

    /**
     * Gets the feedbackData.
     *
     * Feedback data for submission.
     *
     * @return the feedbackData
     */
    public FeedbackDataInput feedbackData() {
      return feedbackData;
    }

    /**
     * Gets the userId.
     *
     * An optional string identifying the user.
     *
     * @return the userId
     */
    public String userId() {
      return userId;
    }

    /**
     * Gets the comment.
     *
     * An optional comment on or description of the feedback.
     *
     * @return the comment
     */
    public String comment() {
      return comment;
    }

    private AddFeedbackOptions(AddFeedbackOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.feedbackData, 'feedbackData cannot be null');
      feedbackData = builder.feedbackData;
      userId = builder.userId;
      comment = builder.comment;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a AddFeedbackOptions builder
     */
    public AddFeedbackOptionsBuilder newBuilder() {
      return new AddFeedbackOptionsBuilder(this);
    }
  }

  /**
   * AddFeedbackOptions Builder.
   */
  public class AddFeedbackOptionsBuilder extends IBMWatsonOptionsModel {
    private FeedbackDataInput feedbackData;
    private String userId;
    private String comment;

    private AddFeedbackOptionsBuilder(AddFeedbackOptions addFeedbackOptions) {
      feedbackData = addFeedbackOptions.feedbackData;
      userId = addFeedbackOptions.userId;
      comment = addFeedbackOptions.comment;
      this.requestHeaders.putAll(addFeedbackOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public AddFeedbackOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param feedbackData the feedbackData
     */
    public AddFeedbackOptionsBuilder(FeedbackDataInput feedbackData) {
      this.feedbackData = feedbackData;
    }

    /**
     * Builds a AddFeedbackOptions.
     *
     * @return the addFeedbackOptions
     */
    public AddFeedbackOptions build() {
      return new AddFeedbackOptions(this);
    }

    /**
     * Set the feedbackData.
     *
     * @param feedbackData the feedbackData
     * @return the AddFeedbackOptions builder
     */
    public AddFeedbackOptionsBuilder feedbackData(FeedbackDataInput feedbackData) {
      this.feedbackData = feedbackData;
      return this;
    }

    /**
     * Set the userId.
     *
     * @param userId the userId
     * @return the AddFeedbackOptions builder
     */
    public AddFeedbackOptionsBuilder userId(String userId) {
      this.userId = userId;
      return this;
    }

    /**
     * Set the comment.
     *
     * @param comment the comment
     * @return the AddFeedbackOptions builder
     */
    public AddFeedbackOptionsBuilder comment(String comment) {
      this.comment = comment;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the AddFeedbackOptions builder
     */
    public AddFeedbackOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * A party's address.
   */
  public class Address extends IBMWatsonGenericModel {
    private String text;
    private Location location;

    /**
     * Gets the text.
     *
     * A string listing the address.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
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
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Address ret = (Address) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * AlignedElement.
   */
  public class AlignedElement extends IBMWatsonGenericModel {
    private List<ElementPair> elementPair;
    private Boolean identicalText;
    private List<String> provenanceIds;
    private Boolean significantElements;

    /**
     * Gets the elementPair.
     *
     * Identifies two elements that semantically align between the compared documents.
     *
     * @return the elementPair
     */
    @AuraEnabled
    public List<ElementPair> getElementPair() {
      return elementPair;
    }

    /**
     * Gets the identicalText.
     *
     * Specifies whether the aligned element is identical. Elements are considered identical despite minor differences
     * such as leading punctuation, end-of-sentence punctuation, whitespace, the presence or absence of definite or
     * indefinite articles, and others.
     *
     * @return the identicalText
     */
    @AuraEnabled
    public Boolean getIdenticalText() {
      return identicalText;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the significantElements.
     *
     * Indicates that the elements aligned are contractual clauses of significance.
     *
     * @return the significantElements
     */
    @AuraEnabled
    public Boolean getSignificantElements() {
      return significantElements;
    }

    /**
     * Sets the elementPair.
     *
     * @param elementPair the new elementPair
     */
    public void setElementPair(final List<ElementPair> elementPair) {
      this.elementPair = elementPair;
    }

    /**
     * Sets the identicalText.
     *
     * @param identicalText the new identicalText
     */
    public void setIdenticalText(final Boolean identicalText) {
      this.identicalText = identicalText;
    }

    /**
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the significantElements.
     *
     * @param significantElements the new significantElements
     */
    public void setSignificantElements(final Boolean significantElements) {
      this.significantElements = significantElements;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'element_pair' => 'elementPair',
        'identical_text' => 'identicalText',
        'provenance_ids' => 'provenanceIds',
        'significant_elements' => 'significantElements'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      AlignedElement ret = (AlignedElement) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for elementPair
      List<ElementPair> newElementPair = new List<ElementPair>();
      List<ElementPair> deserializedElementPair = ret.getElementPair();
      if (deserializedElementPair != null) {
        for (Integer i = 0; i < deserializedElementPair.size(); i++) {
          ElementPair currentItem = ret.getElementPair().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('elementPair');
          ElementPair newItem = (ElementPair) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ElementPair.class);
          newElementPair.add(newItem);
        }
        ret.elementPair = newElementPair;
      }

      return ret;
    }
  }

  /**
   * List of document attributes.
   */
  public class Attribute extends IBMWatsonGenericModel {
    private String xType;
    private String text;
    private Location location;

    /**
     * Gets the xType.
     *
     * The type of attribute.
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
     * The text associated with the attribute.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
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
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
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

      Attribute ret = (Attribute) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The batch-request status.
   */
  public class BatchStatus extends IBMWatsonResponseModel {
    private String function;
    private String inputBucketLocation;
    private String inputBucketName;
    private String outputBucketLocation;
    private String outputBucketName;
    private String batchId;
    private DocCounts documentCounts;
    private String status;
    private Datetime created;
    private Datetime updated;

    /**
     * Gets the function.
     *
     * The method to be run against the documents. Possible values are `html_conversion`, `element_classification`, and
     * `tables`.
     *
     * @return the function
     */
    @AuraEnabled
    public String getFunction() {
      return function;
    }

    /**
     * Gets the inputBucketLocation.
     *
     * The geographical location of the Cloud Object Storage input bucket as listed on the **Endpoint** tab of your COS
     * instance; for example, `us-geo`, `eu-geo`, or `ap-geo`.
     *
     * @return the inputBucketLocation
     */
    @AuraEnabled
    public String getInputBucketLocation() {
      return inputBucketLocation;
    }

    /**
     * Gets the inputBucketName.
     *
     * The name of the Cloud Object Storage input bucket.
     *
     * @return the inputBucketName
     */
    @AuraEnabled
    public String getInputBucketName() {
      return inputBucketName;
    }

    /**
     * Gets the outputBucketLocation.
     *
     * The geographical location of the Cloud Object Storage output bucket as listed on the **Endpoint** tab of your COS
     * instance; for example, `us-geo`, `eu-geo`, or `ap-geo`.
     *
     * @return the outputBucketLocation
     */
    @AuraEnabled
    public String getOutputBucketLocation() {
      return outputBucketLocation;
    }

    /**
     * Gets the outputBucketName.
     *
     * The name of the Cloud Object Storage output bucket.
     *
     * @return the outputBucketName
     */
    @AuraEnabled
    public String getOutputBucketName() {
      return outputBucketName;
    }

    /**
     * Gets the batchId.
     *
     * The unique identifier for the batch request.
     *
     * @return the batchId
     */
    @AuraEnabled
    public String getBatchId() {
      return batchId;
    }

    /**
     * Gets the documentCounts.
     *
     * Document counts.
     *
     * @return the documentCounts
     */
    @AuraEnabled
    public DocCounts getDocumentCounts() {
      return documentCounts;
    }

    /**
     * Gets the status.
     *
     * The status of the batch request.
     *
     * @return the status
     */
    @AuraEnabled
    public String getStatus() {
      return status;
    }

    /**
     * Gets the created.
     *
     * The creation time of the batch request.
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
     * The time of the most recent update to the batch request.
     *
     * @return the updated
     */
    @AuraEnabled
    public Datetime getUpdated() {
      return updated;
    }

    /**
     * Sets the function.
     *
     * @param function the new function
     */
    public void setFunction(final String function) {
      this.function = function;
    }

    /**
     * Sets the inputBucketLocation.
     *
     * @param inputBucketLocation the new inputBucketLocation
     */
    public void setInputBucketLocation(final String inputBucketLocation) {
      this.inputBucketLocation = inputBucketLocation;
    }

    /**
     * Sets the inputBucketName.
     *
     * @param inputBucketName the new inputBucketName
     */
    public void setInputBucketName(final String inputBucketName) {
      this.inputBucketName = inputBucketName;
    }

    /**
     * Sets the outputBucketLocation.
     *
     * @param outputBucketLocation the new outputBucketLocation
     */
    public void setOutputBucketLocation(final String outputBucketLocation) {
      this.outputBucketLocation = outputBucketLocation;
    }

    /**
     * Sets the outputBucketName.
     *
     * @param outputBucketName the new outputBucketName
     */
    public void setOutputBucketName(final String outputBucketName) {
      this.outputBucketName = outputBucketName;
    }

    /**
     * Sets the batchId.
     *
     * @param batchId the new batchId
     */
    public void setBatchId(final String batchId) {
      this.batchId = batchId;
    }

    /**
     * Sets the documentCounts.
     *
     * @param documentCounts the new documentCounts
     */
    public void setDocumentCounts(final DocCounts documentCounts) {
      this.documentCounts = documentCounts;
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
     * Sets the created.
     *
     * @param created the new created
     */
    public void setCreated(final Datetime created) {
      this.created = created;
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
        'input_bucket_location' => 'inputBucketLocation',
        'input_bucket_name' => 'inputBucketName',
        'output_bucket_location' => 'outputBucketLocation',
        'output_bucket_name' => 'outputBucketName',
        'batch_id' => 'batchId',
        'document_counts' => 'documentCounts'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      BatchStatus ret = (BatchStatus) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for documentCounts
      Map<String, Object> documentCountsMap = (Map<String, Object>) jsonMap.get('documentCounts');
      DocCounts newDocumentCounts = (DocCounts) new DocCounts().deserialize(JSON.serialize(documentCountsMap, true), documentCountsMap, DocCounts.class);
      ret.setDocumentCounts(newDocumentCounts);

      return ret;
    }
  }

  /**
   * The results of a successful **List Batches** request.
   */
  public class Batches extends IBMWatsonResponseModel {
    private List<BatchStatus> batches;

    /**
     * Gets the batches.
     *
     * A list of the status of all batch requests.
     *
     * @return the batches
     */
    @AuraEnabled
    public List<BatchStatus> getBatches() {
      return batches;
    }

    /**
     * Sets the batches.
     *
     * @param batches the new batches
     */
    public void setBatches(final List<BatchStatus> batches) {
      this.batches = batches;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Batches ret = (Batches) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for batches
      List<BatchStatus> newBatches = new List<BatchStatus>();
      List<BatchStatus> deserializedBatches = ret.getBatches();
      if (deserializedBatches != null) {
        for (Integer i = 0; i < deserializedBatches.size(); i++) {
          BatchStatus currentItem = ret.getBatches().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('batches');
          BatchStatus newItem = (BatchStatus) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), BatchStatus.class);
          newBatches.add(newItem);
        }
        ret.batches = newBatches;
      }

      return ret;
    }
  }

  /**
   * Cells that are not table header, column header, or row header cells.
   */
  public class BodyCells extends IBMWatsonGenericModel {
    private String cellId;
    private Location location;
    private String text;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;
    private List<String> rowHeaderIds;
    private List<String> rowHeaderTexts;
    private List<String> rowHeaderTextsNormalized;
    private List<String> columnHeaderIds;
    private List<String> columnHeaderTexts;
    private List<String> columnHeaderTextsNormalized;
    private List<Attribute> attributes;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of this cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Gets the rowHeaderIds.
     *
     * An array that contains the `id` value of a row header that is applicable to this body cell.
     *
     * @return the rowHeaderIds
     */
    @AuraEnabled
    public List<String> getRowHeaderIds() {
      return rowHeaderIds;
    }

    /**
     * Gets the rowHeaderTexts.
     *
     * An array that contains the `text` value of a row header that is applicable to this body cell.
     *
     * @return the rowHeaderTexts
     */
    @AuraEnabled
    public List<String> getRowHeaderTexts() {
      return rowHeaderTexts;
    }

    /**
     * Gets the rowHeaderTextsNormalized.
     *
     * If you provide customization input, the normalized version of the row header texts according to the
     * customization; otherwise, the same value as `row_header_texts`.
     *
     * @return the rowHeaderTextsNormalized
     */
    @AuraEnabled
    public List<String> getRowHeaderTextsNormalized() {
      return rowHeaderTextsNormalized;
    }

    /**
     * Gets the columnHeaderIds.
     *
     * An array that contains the `id` value of a column header that is applicable to the current cell.
     *
     * @return the columnHeaderIds
     */
    @AuraEnabled
    public List<String> getColumnHeaderIds() {
      return columnHeaderIds;
    }

    /**
     * Gets the columnHeaderTexts.
     *
     * An array that contains the `text` value of a column header that is applicable to the current cell.
     *
     * @return the columnHeaderTexts
     */
    @AuraEnabled
    public List<String> getColumnHeaderTexts() {
      return columnHeaderTexts;
    }

    /**
     * Gets the columnHeaderTextsNormalized.
     *
     * If you provide customization input, the normalized version of the column header texts according to the
     * customization; otherwise, the same value as `column_header_texts`.
     *
     * @return the columnHeaderTextsNormalized
     */
    @AuraEnabled
    public List<String> getColumnHeaderTextsNormalized() {
      return columnHeaderTextsNormalized;
    }

    /**
     * Gets the attributes.
     *
     * @return the attributes
     */
    @AuraEnabled
    public List<Attribute> getAttributes() {
      return attributes;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    /**
     * Sets the rowHeaderIds.
     *
     * @param rowHeaderIds the new rowHeaderIds
     */
    public void setRowHeaderIds(final List<String> rowHeaderIds) {
      this.rowHeaderIds = rowHeaderIds;
    }

    /**
     * Sets the rowHeaderTexts.
     *
     * @param rowHeaderTexts the new rowHeaderTexts
     */
    public void setRowHeaderTexts(final List<String> rowHeaderTexts) {
      this.rowHeaderTexts = rowHeaderTexts;
    }

    /**
     * Sets the rowHeaderTextsNormalized.
     *
     * @param rowHeaderTextsNormalized the new rowHeaderTextsNormalized
     */
    public void setRowHeaderTextsNormalized(final List<String> rowHeaderTextsNormalized) {
      this.rowHeaderTextsNormalized = rowHeaderTextsNormalized;
    }

    /**
     * Sets the columnHeaderIds.
     *
     * @param columnHeaderIds the new columnHeaderIds
     */
    public void setColumnHeaderIds(final List<String> columnHeaderIds) {
      this.columnHeaderIds = columnHeaderIds;
    }

    /**
     * Sets the columnHeaderTexts.
     *
     * @param columnHeaderTexts the new columnHeaderTexts
     */
    public void setColumnHeaderTexts(final List<String> columnHeaderTexts) {
      this.columnHeaderTexts = columnHeaderTexts;
    }

    /**
     * Sets the columnHeaderTextsNormalized.
     *
     * @param columnHeaderTextsNormalized the new columnHeaderTextsNormalized
     */
    public void setColumnHeaderTextsNormalized(final List<String> columnHeaderTextsNormalized) {
      this.columnHeaderTextsNormalized = columnHeaderTextsNormalized;
    }

    /**
     * Sets the attributes.
     *
     * @param attributes the new attributes
     */
    public void setAttributes(final List<Attribute> attributes) {
      this.attributes = attributes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd',
        'row_header_ids' => 'rowHeaderIds',
        'row_header_texts' => 'rowHeaderTexts',
        'row_header_texts_normalized' => 'rowHeaderTextsNormalized',
        'column_header_ids' => 'columnHeaderIds',
        'column_header_texts' => 'columnHeaderTexts',
        'column_header_texts_normalized' => 'columnHeaderTextsNormalized'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      BodyCells ret = (BodyCells) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for attributes
      List<Attribute> newAttributes = new List<Attribute>();
      List<Attribute> deserializedAttributes = ret.getAttributes();
      if (deserializedAttributes != null) {
        for (Integer i = 0; i < deserializedAttributes.size(); i++) {
          Attribute currentItem = ret.getAttributes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('attributes');
          Attribute newItem = (Attribute) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Attribute.class);
          newAttributes.add(newItem);
        }
        ret.attributes = newAttributes;
      }

      return ret;
    }
  }

  /**
   * Information defining an element's subject matter.
   */
  public class Category extends IBMWatsonGenericModel {
    private String label;
    private List<String> provenanceIds;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Category() { }

    /**
     * Gets the label.
     *
     * The category of the associated element.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }
  
    private Category(CategoryBuilder builder) {
      this.label = builder.label;
      this.provenanceIds = builder.provenanceIds;
    }

    /**
     * New builder.
     *
     * @return a Category builder
     */
    public CategoryBuilder newBuilder() {
      return new CategoryBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Category ret = (Category) super.deserialize(jsonString, jsonMap, classType);
      CategoryBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'provenanceIds' => 'provenance_ids'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * Category Builder.
   */
  public class CategoryBuilder {
    private String label;
    private List<String> provenanceIds;

    private CategoryBuilder(Category category) {
      this.label = category.label;
      this.provenanceIds = category.provenanceIds;
    }

    /**
     * Instantiates a new builder.
     */
    public CategoryBuilder() {
    }

    /**
     * Builds a Category.
     *
     * @return the category
     */
    public Category build() {
      return new Category(this);
    }

    /**
     * Adds an provenanceIds to provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     * @return the Category builder
     */
    public CategoryBuilder addProvenanceIds(String provenanceIds) {
      IBMWatsonValidator.notNull(provenanceIds, 'provenanceIds cannot be null');
      if (this.provenanceIds == null) {
        this.provenanceIds = new List<String>();
      }
      this.provenanceIds.add(provenanceIds);
      return this;
    }

    /**
     * Set the label.
     *
     * @param label the label
     * @return the Category builder
     */
    public CategoryBuilder label(String label) {
      this.label = label;
      return this;
    }

    /**
     * Set the provenanceIds.
     * Existing provenanceIds will be replaced.
     *
     * @param provenanceIds the provenanceIds
     * @return the Category builder
     */
    public CategoryBuilder provenanceIds(List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
      return this;
    }
  }

  /**
   * Information defining an element's subject matter.
   */
  public class CategoryComparison extends IBMWatsonGenericModel {
    private String label;

    /**
     * Gets the label.
     *
     * The category of the associated element.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
    }

    /**
     * Sets the label.
     *
     * @param label the new label
     */
    public void setLabel(final String label) {
      this.label = label;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      CategoryComparison ret = (CategoryComparison) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The classifyElements options.
   */
  public class ClassifyElementsOptions extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String fileContentType;
    private String model;

    /**
     * Gets the file.
     *
     * The document to classify.
     *
     * @return the file
     */
    public IBMWatsonFile file() {
      return file;
    }

    /**
     * Gets the fileContentType.
     *
     * The content type of file.
     *
     * @return the fileContentType
     */
    public String fileContentType() {
      return fileContentType;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private ClassifyElementsOptions(ClassifyElementsOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.file, 'file cannot be null');
      file = builder.file;
      fileContentType = builder.fileContentType;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ClassifyElementsOptions builder
     */
    public ClassifyElementsOptionsBuilder newBuilder() {
      return new ClassifyElementsOptionsBuilder(this);
    }
  }

  /**
   * ClassifyElementsOptions Builder.
   */
  public class ClassifyElementsOptionsBuilder extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String fileContentType;
    private String model;

    private ClassifyElementsOptionsBuilder(ClassifyElementsOptions classifyElementsOptions) {
      file = classifyElementsOptions.file;
      fileContentType = classifyElementsOptions.fileContentType;
      model = classifyElementsOptions.model;
      this.requestHeaders.putAll(classifyElementsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ClassifyElementsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param file the file
     */
    public ClassifyElementsOptionsBuilder(IBMWatsonFile file) {
      this.file = file;
    }

    /**
     * Builds a ClassifyElementsOptions.
     *
     * @return the classifyElementsOptions
     */
    public ClassifyElementsOptions build() {
      return new ClassifyElementsOptions(this);
    }

    /**
     * Set the file.
     *
     * @param file the file
     * @return the ClassifyElementsOptions builder
     */
    public ClassifyElementsOptionsBuilder file(IBMWatsonFile file) {
      this.file = file;
      return this;
    }

    /**
     * Set the fileContentType.
     *
     * @param fileContentType the fileContentType
     * @return the ClassifyElementsOptions builder
     */
    public ClassifyElementsOptionsBuilder fileContentType(String fileContentType) {
      this.fileContentType = fileContentType;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the ClassifyElementsOptions builder
     */
    public ClassifyElementsOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ClassifyElementsOptions builder
     */
    public ClassifyElementsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The analysis of objects returned by the **Element classification** method.
   */
  public class ClassifyReturn extends IBMWatsonResponseModel {
    private Document document;
    private String modelId;
    private String modelVersion;
    private List<Element> elements;
    private List<EffectiveDates> effectiveDates;
    private List<ContractAmts> contractAmounts;
    private List<TerminationDates> terminationDates;
    private List<ContractTypes> contractTypes;
    private List<ContractTerms> contractTerms;
    private List<PaymentTerms> paymentTerms;
    private List<ContractCurrencies> contractCurrencies;
    private List<Tables> tables;
    private DocStructure documentStructure;
    private List<Parties> parties;

    /**
     * Gets the document.
     *
     * Basic information about the input document.
     *
     * @return the document
     */
    @AuraEnabled
    public Document getDocument() {
      return document;
    }

    /**
     * Gets the modelId.
     *
     * The analysis model used to classify the input document. For the **Element classification** method, the only valid
     * value is `contracts`.
     *
     * @return the modelId
     */
    @AuraEnabled
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the modelVersion.
     *
     * The version of the analysis model identified by the value of the `model_id` key.
     *
     * @return the modelVersion
     */
    @AuraEnabled
    public String getModelVersion() {
      return modelVersion;
    }

    /**
     * Gets the elements.
     *
     * Document elements identified by the service.
     *
     * @return the elements
     */
    @AuraEnabled
    public List<Element> getElements() {
      return elements;
    }

    /**
     * Gets the effectiveDates.
     *
     * The date or dates on which the document becomes effective.
     *
     * @return the effectiveDates
     */
    @AuraEnabled
    public List<EffectiveDates> getEffectiveDates() {
      return effectiveDates;
    }

    /**
     * Gets the contractAmounts.
     *
     * The monetary amounts that identify the total amount of the contract that needs to be paid from one party to
     * another.
     *
     * @return the contractAmounts
     */
    @AuraEnabled
    public List<ContractAmts> getContractAmounts() {
      return contractAmounts;
    }

    /**
     * Gets the terminationDates.
     *
     * The dates on which the document is to be terminated.
     *
     * @return the terminationDates
     */
    @AuraEnabled
    public List<TerminationDates> getTerminationDates() {
      return terminationDates;
    }

    /**
     * Gets the contractTypes.
     *
     * The contract type as declared in the document.
     *
     * @return the contractTypes
     */
    @AuraEnabled
    public List<ContractTypes> getContractTypes() {
      return contractTypes;
    }

    /**
     * Gets the contractTerms.
     *
     * The durations of the contract.
     *
     * @return the contractTerms
     */
    @AuraEnabled
    public List<ContractTerms> getContractTerms() {
      return contractTerms;
    }

    /**
     * Gets the paymentTerms.
     *
     * The document's payment durations.
     *
     * @return the paymentTerms
     */
    @AuraEnabled
    public List<PaymentTerms> getPaymentTerms() {
      return paymentTerms;
    }

    /**
     * Gets the contractCurrencies.
     *
     * The contract currencies as declared in the document.
     *
     * @return the contractCurrencies
     */
    @AuraEnabled
    public List<ContractCurrencies> getContractCurrencies() {
      return contractCurrencies;
    }

    /**
     * Gets the tables.
     *
     * Definition of tables identified in the input document.
     *
     * @return the tables
     */
    @AuraEnabled
    public List<Tables> getTables() {
      return tables;
    }

    /**
     * Gets the documentStructure.
     *
     * The structure of the input document.
     *
     * @return the documentStructure
     */
    @AuraEnabled
    public DocStructure getDocumentStructure() {
      return documentStructure;
    }

    /**
     * Gets the parties.
     *
     * Definitions of the parties identified in the input document.
     *
     * @return the parties
     */
    @AuraEnabled
    public List<Parties> getParties() {
      return parties;
    }

    /**
     * Sets the document.
     *
     * @param document the new document
     */
    public void setDocument(final Document document) {
      this.document = document;
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
     * Sets the modelVersion.
     *
     * @param modelVersion the new modelVersion
     */
    public void setModelVersion(final String modelVersion) {
      this.modelVersion = modelVersion;
    }

    /**
     * Sets the elements.
     *
     * @param elements the new elements
     */
    public void setElements(final List<Element> elements) {
      this.elements = elements;
    }

    /**
     * Sets the effectiveDates.
     *
     * @param effectiveDates the new effectiveDates
     */
    public void setEffectiveDates(final List<EffectiveDates> effectiveDates) {
      this.effectiveDates = effectiveDates;
    }

    /**
     * Sets the contractAmounts.
     *
     * @param contractAmounts the new contractAmounts
     */
    public void setContractAmounts(final List<ContractAmts> contractAmounts) {
      this.contractAmounts = contractAmounts;
    }

    /**
     * Sets the terminationDates.
     *
     * @param terminationDates the new terminationDates
     */
    public void setTerminationDates(final List<TerminationDates> terminationDates) {
      this.terminationDates = terminationDates;
    }

    /**
     * Sets the contractTypes.
     *
     * @param contractTypes the new contractTypes
     */
    public void setContractTypes(final List<ContractTypes> contractTypes) {
      this.contractTypes = contractTypes;
    }

    /**
     * Sets the contractTerms.
     *
     * @param contractTerms the new contractTerms
     */
    public void setContractTerms(final List<ContractTerms> contractTerms) {
      this.contractTerms = contractTerms;
    }

    /**
     * Sets the paymentTerms.
     *
     * @param paymentTerms the new paymentTerms
     */
    public void setPaymentTerms(final List<PaymentTerms> paymentTerms) {
      this.paymentTerms = paymentTerms;
    }

    /**
     * Sets the contractCurrencies.
     *
     * @param contractCurrencies the new contractCurrencies
     */
    public void setContractCurrencies(final List<ContractCurrencies> contractCurrencies) {
      this.contractCurrencies = contractCurrencies;
    }

    /**
     * Sets the tables.
     *
     * @param tables the new tables
     */
    public void setTables(final List<Tables> tables) {
      this.tables = tables;
    }

    /**
     * Sets the documentStructure.
     *
     * @param documentStructure the new documentStructure
     */
    public void setDocumentStructure(final DocStructure documentStructure) {
      this.documentStructure = documentStructure;
    }

    /**
     * Sets the parties.
     *
     * @param parties the new parties
     */
    public void setParties(final List<Parties> parties) {
      this.parties = parties;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'model_id' => 'modelId',
        'model_version' => 'modelVersion',
        'effective_dates' => 'effectiveDates',
        'contract_amounts' => 'contractAmounts',
        'termination_dates' => 'terminationDates',
        'contract_types' => 'contractTypes',
        'contract_terms' => 'contractTerms',
        'payment_terms' => 'paymentTerms',
        'contract_currencies' => 'contractCurrencies',
        'document_structure' => 'documentStructure'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ClassifyReturn ret = (ClassifyReturn) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for document
      Map<String, Object> documentMap = (Map<String, Object>) jsonMap.get('document');
      Document newDocument = (Document) new Document().deserialize(JSON.serialize(documentMap, true), documentMap, Document.class);
      ret.setDocument(newDocument);

      // calling custom deserializer for elements
      List<Element> newElements = new List<Element>();
      List<Element> deserializedElements = ret.getElements();
      if (deserializedElements != null) {
        for (Integer i = 0; i < deserializedElements.size(); i++) {
          Element currentItem = ret.getElements().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('elements');
          Element newItem = (Element) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Element.class);
          newElements.add(newItem);
        }
        ret.elements = newElements;
      }

      // calling custom deserializer for effectiveDates
      List<EffectiveDates> newEffectiveDates = new List<EffectiveDates>();
      List<EffectiveDates> deserializedEffectiveDates = ret.getEffectiveDates();
      if (deserializedEffectiveDates != null) {
        for (Integer i = 0; i < deserializedEffectiveDates.size(); i++) {
          EffectiveDates currentItem = ret.getEffectiveDates().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('effectiveDates');
          EffectiveDates newItem = (EffectiveDates) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), EffectiveDates.class);
          newEffectiveDates.add(newItem);
        }
        ret.effectiveDates = newEffectiveDates;
      }

      // calling custom deserializer for contractAmounts
      List<ContractAmts> newContractAmounts = new List<ContractAmts>();
      List<ContractAmts> deserializedContractAmounts = ret.getContractAmounts();
      if (deserializedContractAmounts != null) {
        for (Integer i = 0; i < deserializedContractAmounts.size(); i++) {
          ContractAmts currentItem = ret.getContractAmounts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('contractAmounts');
          ContractAmts newItem = (ContractAmts) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ContractAmts.class);
          newContractAmounts.add(newItem);
        }
        ret.contractAmounts = newContractAmounts;
      }

      // calling custom deserializer for terminationDates
      List<TerminationDates> newTerminationDates = new List<TerminationDates>();
      List<TerminationDates> deserializedTerminationDates = ret.getTerminationDates();
      if (deserializedTerminationDates != null) {
        for (Integer i = 0; i < deserializedTerminationDates.size(); i++) {
          TerminationDates currentItem = ret.getTerminationDates().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('terminationDates');
          TerminationDates newItem = (TerminationDates) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TerminationDates.class);
          newTerminationDates.add(newItem);
        }
        ret.terminationDates = newTerminationDates;
      }

      // calling custom deserializer for contractTypes
      List<ContractTypes> newContractTypes = new List<ContractTypes>();
      List<ContractTypes> deserializedContractTypes = ret.getContractTypes();
      if (deserializedContractTypes != null) {
        for (Integer i = 0; i < deserializedContractTypes.size(); i++) {
          ContractTypes currentItem = ret.getContractTypes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('contractTypes');
          ContractTypes newItem = (ContractTypes) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ContractTypes.class);
          newContractTypes.add(newItem);
        }
        ret.contractTypes = newContractTypes;
      }

      // calling custom deserializer for contractTerms
      List<ContractTerms> newContractTerms = new List<ContractTerms>();
      List<ContractTerms> deserializedContractTerms = ret.getContractTerms();
      if (deserializedContractTerms != null) {
        for (Integer i = 0; i < deserializedContractTerms.size(); i++) {
          ContractTerms currentItem = ret.getContractTerms().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('contractTerms');
          ContractTerms newItem = (ContractTerms) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ContractTerms.class);
          newContractTerms.add(newItem);
        }
        ret.contractTerms = newContractTerms;
      }

      // calling custom deserializer for paymentTerms
      List<PaymentTerms> newPaymentTerms = new List<PaymentTerms>();
      List<PaymentTerms> deserializedPaymentTerms = ret.getPaymentTerms();
      if (deserializedPaymentTerms != null) {
        for (Integer i = 0; i < deserializedPaymentTerms.size(); i++) {
          PaymentTerms currentItem = ret.getPaymentTerms().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('paymentTerms');
          PaymentTerms newItem = (PaymentTerms) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), PaymentTerms.class);
          newPaymentTerms.add(newItem);
        }
        ret.paymentTerms = newPaymentTerms;
      }

      // calling custom deserializer for contractCurrencies
      List<ContractCurrencies> newContractCurrencies = new List<ContractCurrencies>();
      List<ContractCurrencies> deserializedContractCurrencies = ret.getContractCurrencies();
      if (deserializedContractCurrencies != null) {
        for (Integer i = 0; i < deserializedContractCurrencies.size(); i++) {
          ContractCurrencies currentItem = ret.getContractCurrencies().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('contractCurrencies');
          ContractCurrencies newItem = (ContractCurrencies) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ContractCurrencies.class);
          newContractCurrencies.add(newItem);
        }
        ret.contractCurrencies = newContractCurrencies;
      }

      // calling custom deserializer for tables
      List<Tables> newTables = new List<Tables>();
      List<Tables> deserializedTables = ret.getTables();
      if (deserializedTables != null) {
        for (Integer i = 0; i < deserializedTables.size(); i++) {
          Tables currentItem = ret.getTables().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tables');
          Tables newItem = (Tables) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Tables.class);
          newTables.add(newItem);
        }
        ret.tables = newTables;
      }

      // calling custom deserializer for documentStructure
      Map<String, Object> documentStructureMap = (Map<String, Object>) jsonMap.get('documentStructure');
      DocStructure newDocumentStructure = (DocStructure) new DocStructure().deserialize(JSON.serialize(documentStructureMap, true), documentStructureMap, DocStructure.class);
      ret.setDocumentStructure(newDocumentStructure);

      // calling custom deserializer for parties
      List<Parties> newParties = new List<Parties>();
      List<Parties> deserializedParties = ret.getParties();
      if (deserializedParties != null) {
        for (Integer i = 0; i < deserializedParties.size(); i++) {
          Parties currentItem = ret.getParties().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('parties');
          Parties newItem = (Parties) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Parties.class);
          newParties.add(newItem);
        }
        ret.parties = newParties;
      }

      return ret;
    }
  }

  /**
   * Column-level cells, each applicable as a header to other cells in the same column as itself, of the current table.
   */
  public class ColumnHeaders extends IBMWatsonGenericModel {
    private String cellId;
    private IBMWatsonMapModel location;
    private String text;
    private String textNormalized;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The location of the column header cell in the current table as defined by its `begin` and `end` offsets,
     * respectfully, in the input document.
     *
     * @return the location
     */
    @AuraEnabled
    public IBMWatsonMapModel getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of this cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * If you provide customization input, the normalized version of the cell text according to the customization;
     * otherwise, the same value as `text`.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final IBMWatsonMapModel location) {
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

    /**
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'text_normalized' => 'textNormalized',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ColumnHeaders ret = (ColumnHeaders) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      IBMWatsonMapModel newLocation = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(locationMap, true), locationMap, IBMWatsonMapModel.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The compareDocuments options.
   */
  public class CompareDocumentsOptions extends IBMWatsonOptionsModel {
    private IBMWatsonFile file1;
    private IBMWatsonFile file2;
    private String file1ContentType;
    private String file2ContentType;
    private String file1Label;
    private String file2Label;
    private String model;

    /**
     * Gets the file1.
     *
     * The first document to compare.
     *
     * @return the file1
     */
    public IBMWatsonFile file1() {
      return file1;
    }

    /**
     * Gets the file2.
     *
     * The second document to compare.
     *
     * @return the file2
     */
    public IBMWatsonFile file2() {
      return file2;
    }

    /**
     * Gets the file1ContentType.
     *
     * The content type of file1.
     *
     * @return the file1ContentType
     */
    public String file1ContentType() {
      return file1ContentType;
    }

    /**
     * Gets the file2ContentType.
     *
     * The content type of file2.
     *
     * @return the file2ContentType
     */
    public String file2ContentType() {
      return file2ContentType;
    }

    /**
     * Gets the file1Label.
     *
     * A text label for the first document.
     *
     * @return the file1Label
     */
    public String file1Label() {
      return file1Label;
    }

    /**
     * Gets the file2Label.
     *
     * A text label for the second document.
     *
     * @return the file2Label
     */
    public String file2Label() {
      return file2Label;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private CompareDocumentsOptions(CompareDocumentsOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.file1, 'file1 cannot be null');
      IBMWatsonValidator.notNull(builder.file2, 'file2 cannot be null');
      file1 = builder.file1;
      file2 = builder.file2;
      file1ContentType = builder.file1ContentType;
      file2ContentType = builder.file2ContentType;
      file1Label = builder.file1Label;
      file2Label = builder.file2Label;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder newBuilder() {
      return new CompareDocumentsOptionsBuilder(this);
    }
  }

  /**
   * CompareDocumentsOptions Builder.
   */
  public class CompareDocumentsOptionsBuilder extends IBMWatsonOptionsModel {
    private IBMWatsonFile file1;
    private IBMWatsonFile file2;
    private String file1ContentType;
    private String file2ContentType;
    private String file1Label;
    private String file2Label;
    private String model;

    private CompareDocumentsOptionsBuilder(CompareDocumentsOptions compareDocumentsOptions) {
      file1 = compareDocumentsOptions.file1;
      file2 = compareDocumentsOptions.file2;
      file1ContentType = compareDocumentsOptions.file1ContentType;
      file2ContentType = compareDocumentsOptions.file2ContentType;
      file1Label = compareDocumentsOptions.file1Label;
      file2Label = compareDocumentsOptions.file2Label;
      model = compareDocumentsOptions.model;
      this.requestHeaders.putAll(compareDocumentsOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CompareDocumentsOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param file1 the file1
     * @param file2 the file2
     */
    public CompareDocumentsOptionsBuilder(IBMWatsonFile file1, IBMWatsonFile file2) {
      this.file1 = file1;
      this.file2 = file2;
    }

    /**
     * Builds a CompareDocumentsOptions.
     *
     * @return the compareDocumentsOptions
     */
    public CompareDocumentsOptions build() {
      return new CompareDocumentsOptions(this);
    }

    /**
     * Set the file1.
     *
     * @param file1 the file1
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder file1(IBMWatsonFile file1) {
      this.file1 = file1;
      return this;
    }

    /**
     * Set the file2.
     *
     * @param file2 the file2
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder file2(IBMWatsonFile file2) {
      this.file2 = file2;
      return this;
    }

    /**
     * Set the file1ContentType.
     *
     * @param file1ContentType the file1ContentType
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder file1ContentType(String file1ContentType) {
      this.file1ContentType = file1ContentType;
      return this;
    }

    /**
     * Set the file2ContentType.
     *
     * @param file2ContentType the file2ContentType
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder file2ContentType(String file2ContentType) {
      this.file2ContentType = file2ContentType;
      return this;
    }

    /**
     * Set the file1Label.
     *
     * @param file1Label the file1Label
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder file1Label(String file1Label) {
      this.file1Label = file1Label;
      return this;
    }

    /**
     * Set the file2Label.
     *
     * @param file2Label the file2Label
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder file2Label(String file2Label) {
      this.file2Label = file2Label;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CompareDocumentsOptions builder
     */
    public CompareDocumentsOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The comparison of the two submitted documents.
   */
  public class CompareReturn extends IBMWatsonResponseModel {
    private String modelId;
    private String modelVersion;
    private List<Document> documents;
    private List<AlignedElement> alignedElements;
    private List<UnalignedElement> unalignedElements;

    /**
     * Gets the modelId.
     *
     * The analysis model used to compare the input documents. For the **Compare two documents** method, the only valid
     * value is `contracts`.
     *
     * @return the modelId
     */
    @AuraEnabled
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the modelVersion.
     *
     * The version of the analysis model identified by the value of the `model_id` key.
     *
     * @return the modelVersion
     */
    @AuraEnabled
    public String getModelVersion() {
      return modelVersion;
    }

    /**
     * Gets the documents.
     *
     * Information about the documents being compared.
     *
     * @return the documents
     */
    @AuraEnabled
    public List<Document> getDocuments() {
      return documents;
    }

    /**
     * Gets the alignedElements.
     *
     * A list of pairs of elements that semantically align between the compared documents.
     *
     * @return the alignedElements
     */
    @AuraEnabled
    public List<AlignedElement> getAlignedElements() {
      return alignedElements;
    }

    /**
     * Gets the unalignedElements.
     *
     * A list of elements that do not semantically align between the compared documents.
     *
     * @return the unalignedElements
     */
    @AuraEnabled
    public List<UnalignedElement> getUnalignedElements() {
      return unalignedElements;
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
     * Sets the modelVersion.
     *
     * @param modelVersion the new modelVersion
     */
    public void setModelVersion(final String modelVersion) {
      this.modelVersion = modelVersion;
    }

    /**
     * Sets the documents.
     *
     * @param documents the new documents
     */
    public void setDocuments(final List<Document> documents) {
      this.documents = documents;
    }

    /**
     * Sets the alignedElements.
     *
     * @param alignedElements the new alignedElements
     */
    public void setAlignedElements(final List<AlignedElement> alignedElements) {
      this.alignedElements = alignedElements;
    }

    /**
     * Sets the unalignedElements.
     *
     * @param unalignedElements the new unalignedElements
     */
    public void setUnalignedElements(final List<UnalignedElement> unalignedElements) {
      this.unalignedElements = unalignedElements;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'model_id' => 'modelId',
        'model_version' => 'modelVersion',
        'aligned_elements' => 'alignedElements',
        'unaligned_elements' => 'unalignedElements'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      CompareReturn ret = (CompareReturn) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for documents
      List<Document> newDocuments = new List<Document>();
      List<Document> deserializedDocuments = ret.getDocuments();
      if (deserializedDocuments != null) {
        for (Integer i = 0; i < deserializedDocuments.size(); i++) {
          Document currentItem = ret.getDocuments().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('documents');
          Document newItem = (Document) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Document.class);
          newDocuments.add(newItem);
        }
        ret.documents = newDocuments;
      }

      // calling custom deserializer for alignedElements
      List<AlignedElement> newAlignedElements = new List<AlignedElement>();
      List<AlignedElement> deserializedAlignedElements = ret.getAlignedElements();
      if (deserializedAlignedElements != null) {
        for (Integer i = 0; i < deserializedAlignedElements.size(); i++) {
          AlignedElement currentItem = ret.getAlignedElements().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('alignedElements');
          AlignedElement newItem = (AlignedElement) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), AlignedElement.class);
          newAlignedElements.add(newItem);
        }
        ret.alignedElements = newAlignedElements;
      }

      // calling custom deserializer for unalignedElements
      List<UnalignedElement> newUnalignedElements = new List<UnalignedElement>();
      List<UnalignedElement> deserializedUnalignedElements = ret.getUnalignedElements();
      if (deserializedUnalignedElements != null) {
        for (Integer i = 0; i < deserializedUnalignedElements.size(); i++) {
          UnalignedElement currentItem = ret.getUnalignedElements().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('unalignedElements');
          UnalignedElement newItem = (UnalignedElement) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), UnalignedElement.class);
          newUnalignedElements.add(newItem);
        }
        ret.unalignedElements = newUnalignedElements;
      }

      return ret;
    }
  }

  /**
   * A contact.
   */
  public class Contact extends IBMWatsonGenericModel {
    private String name;
    private String role;

    /**
     * Gets the name.
     *
     * A string listing the name of the contact.
     *
     * @return the name
     */
    @AuraEnabled
    public String getName() {
      return name;
    }

    /**
     * Gets the role.
     *
     * A string listing the role of the contact.
     *
     * @return the role
     */
    @AuraEnabled
    public String getRole() {
      return role;
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
     * Sets the role.
     *
     * @param role the new role
     */
    public void setRole(final String role) {
      this.role = role;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Contact ret = (Contact) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Text that is related to the contents of the table and that precedes or follows the current table.
   */
  public class Contexts extends IBMWatsonGenericModel {
    private String text;
    private Location location;

    /**
     * Gets the text.
     *
     * The related text.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
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
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Contexts ret = (Contexts) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * A monetary amount identified in the input document.
   */
  public class ContractAmts extends IBMWatsonGenericModel {
    private String confidenceLevel;
    private String text;
    private String textNormalized;
    private Interpretation interpretation;
    private List<String> provenanceIds;
    private Location location;

    /**
     * Gets the confidenceLevel.
     *
     * The confidence level in the identification of the contract amount.
     *
     * @return the confidenceLevel
     */
    @AuraEnabled
    public String getConfidenceLevel() {
      return confidenceLevel;
    }

    /**
     * Gets the text.
     *
     * The monetary amount.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * The normalized form of the amount, which is listed as a string. This element is optional; it is returned only if
     * normalized text exists.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the interpretation.
     *
     * The details of the normalized text, if applicable. This element is optional; it is returned only if normalized
     * text exists.
     *
     * @return the interpretation
     */
    @AuraEnabled
    public Interpretation getInterpretation() {
      return interpretation;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the confidenceLevel.
     *
     * @param confidenceLevel the new confidenceLevel
     */
    public void setConfidenceLevel(final String confidenceLevel) {
      this.confidenceLevel = confidenceLevel;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the interpretation.
     *
     * @param interpretation the new interpretation
     */
    public void setInterpretation(final Interpretation interpretation) {
      this.interpretation = interpretation;
    }

    /**
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'confidence_level' => 'confidenceLevel',
        'text_normalized' => 'textNormalized',
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ContractAmts ret = (ContractAmts) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for interpretation
      Map<String, Object> interpretationMap = (Map<String, Object>) jsonMap.get('interpretation');
      Interpretation newInterpretation = (Interpretation) new Interpretation().deserialize(JSON.serialize(interpretationMap, true), interpretationMap, Interpretation.class);
      ret.setInterpretation(newInterpretation);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The contract currencies that are declared in the document.
   */
  public class ContractCurrencies extends IBMWatsonGenericModel {
    private String confidenceLevel;
    private String text;
    private String textNormalized;
    private List<String> provenanceIds;
    private Location location;

    /**
     * Gets the confidenceLevel.
     *
     * The confidence level in the identification of the contract currency.
     *
     * @return the confidenceLevel
     */
    @AuraEnabled
    public String getConfidenceLevel() {
      return confidenceLevel;
    }

    /**
     * Gets the text.
     *
     * The contract currency.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * The normalized form of the contract currency, which is listed as a string in
     * [ISO-4217](https://www.iso.org/iso-4217-currency-codes.html) format. This element is optional; it is returned
     * only if normalized text exists.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the confidenceLevel.
     *
     * @param confidenceLevel the new confidenceLevel
     */
    public void setConfidenceLevel(final String confidenceLevel) {
      this.confidenceLevel = confidenceLevel;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'confidence_level' => 'confidenceLevel',
        'text_normalized' => 'textNormalized',
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ContractCurrencies ret = (ContractCurrencies) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The duration or durations of the contract.
   */
  public class ContractTerms extends IBMWatsonGenericModel {
    private String confidenceLevel;
    private String text;
    private String textNormalized;
    private Interpretation interpretation;
    private List<String> provenanceIds;
    private Location location;

    /**
     * Gets the confidenceLevel.
     *
     * The confidence level in the identification of the contract term.
     *
     * @return the confidenceLevel
     */
    @AuraEnabled
    public String getConfidenceLevel() {
      return confidenceLevel;
    }

    /**
     * Gets the text.
     *
     * The contract term (duration).
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * The normalized form of the contract term, which is listed as a string. This element is optional; it is returned
     * only if normalized text exists.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the interpretation.
     *
     * The details of the normalized text, if applicable. This element is optional; it is returned only if normalized
     * text exists.
     *
     * @return the interpretation
     */
    @AuraEnabled
    public Interpretation getInterpretation() {
      return interpretation;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the confidenceLevel.
     *
     * @param confidenceLevel the new confidenceLevel
     */
    public void setConfidenceLevel(final String confidenceLevel) {
      this.confidenceLevel = confidenceLevel;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the interpretation.
     *
     * @param interpretation the new interpretation
     */
    public void setInterpretation(final Interpretation interpretation) {
      this.interpretation = interpretation;
    }

    /**
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'confidence_level' => 'confidenceLevel',
        'text_normalized' => 'textNormalized',
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ContractTerms ret = (ContractTerms) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for interpretation
      Map<String, Object> interpretationMap = (Map<String, Object>) jsonMap.get('interpretation');
      Interpretation newInterpretation = (Interpretation) new Interpretation().deserialize(JSON.serialize(interpretationMap, true), interpretationMap, Interpretation.class);
      ret.setInterpretation(newInterpretation);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The contract type identified in the input document.
   */
  public class ContractTypes extends IBMWatsonGenericModel {
    private String confidenceLevel;
    private String text;
    private List<String> provenanceIds;
    private Location location;

    /**
     * Gets the confidenceLevel.
     *
     * The confidence level in the identification of the contract type.
     *
     * @return the confidenceLevel
     */
    @AuraEnabled
    public String getConfidenceLevel() {
      return confidenceLevel;
    }

    /**
     * Gets the text.
     *
     * The contract type.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the confidenceLevel.
     *
     * @param confidenceLevel the new confidenceLevel
     */
    public void setConfidenceLevel(final String confidenceLevel) {
      this.confidenceLevel = confidenceLevel;
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
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'confidence_level' => 'confidenceLevel',
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ContractTypes ret = (ContractTypes) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The convertToHtml options.
   */
  public class ConvertToHtmlOptions extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String fileContentType;
    private String model;

    /**
     * Gets the file.
     *
     * The document to convert.
     *
     * @return the file
     */
    public IBMWatsonFile file() {
      return file;
    }

    /**
     * Gets the fileContentType.
     *
     * The content type of file.
     *
     * @return the fileContentType
     */
    public String fileContentType() {
      return fileContentType;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private ConvertToHtmlOptions(ConvertToHtmlOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.file, 'file cannot be null');
      file = builder.file;
      fileContentType = builder.fileContentType;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ConvertToHtmlOptions builder
     */
    public ConvertToHtmlOptionsBuilder newBuilder() {
      return new ConvertToHtmlOptionsBuilder(this);
    }
  }

  /**
   * ConvertToHtmlOptions Builder.
   */
  public class ConvertToHtmlOptionsBuilder extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String fileContentType;
    private String model;

    private ConvertToHtmlOptionsBuilder(ConvertToHtmlOptions convertToHtmlOptions) {
      file = convertToHtmlOptions.file;
      fileContentType = convertToHtmlOptions.fileContentType;
      model = convertToHtmlOptions.model;
      this.requestHeaders.putAll(convertToHtmlOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ConvertToHtmlOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param file the file
     */
    public ConvertToHtmlOptionsBuilder(IBMWatsonFile file) {
      this.file = file;
    }

    /**
     * Builds a ConvertToHtmlOptions.
     *
     * @return the convertToHtmlOptions
     */
    public ConvertToHtmlOptions build() {
      return new ConvertToHtmlOptions(this);
    }

    /**
     * Set the file.
     *
     * @param file the file
     * @return the ConvertToHtmlOptions builder
     */
    public ConvertToHtmlOptionsBuilder file(IBMWatsonFile file) {
      this.file = file;
      return this;
    }

    /**
     * Set the fileContentType.
     *
     * @param fileContentType the fileContentType
     * @return the ConvertToHtmlOptions builder
     */
    public ConvertToHtmlOptionsBuilder fileContentType(String fileContentType) {
      this.fileContentType = fileContentType;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the ConvertToHtmlOptions builder
     */
    public ConvertToHtmlOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ConvertToHtmlOptions builder
     */
    public ConvertToHtmlOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The createBatch options.
   */
  public class CreateBatchOptions extends IBMWatsonOptionsModel {
    private String function;
    private IBMWatsonFile inputCredentialsFile;
    private String inputBucketLocation;
    private String inputBucketName;
    private IBMWatsonFile outputCredentialsFile;
    private String outputBucketLocation;
    private String outputBucketName;
    private String model;

    /**
     * Gets the function.
     *
     * The Compare and Comply method to run across the submitted input documents.
     *
     * @return the function
     */
    public String function() {
      return function;
    }

    /**
     * Gets the inputCredentialsFile.
     *
     * A JSON file containing the input Cloud Object Storage credentials. At a minimum, the credentials must enable
     * `READ` permissions on the bucket defined by the `input_bucket_name` parameter.
     *
     * @return the inputCredentialsFile
     */
    public IBMWatsonFile inputCredentialsFile() {
      return inputCredentialsFile;
    }

    /**
     * Gets the inputBucketLocation.
     *
     * The geographical location of the Cloud Object Storage input bucket as listed on the **Endpoint** tab of your
     * Cloud Object Storage instance; for example, `us-geo`, `eu-geo`, or `ap-geo`.
     *
     * @return the inputBucketLocation
     */
    public String inputBucketLocation() {
      return inputBucketLocation;
    }

    /**
     * Gets the inputBucketName.
     *
     * The name of the Cloud Object Storage input bucket.
     *
     * @return the inputBucketName
     */
    public String inputBucketName() {
      return inputBucketName;
    }

    /**
     * Gets the outputCredentialsFile.
     *
     * A JSON file that lists the Cloud Object Storage output credentials. At a minimum, the credentials must enable
     * `READ` and `WRITE` permissions on the bucket defined by the `output_bucket_name` parameter.
     *
     * @return the outputCredentialsFile
     */
    public IBMWatsonFile outputCredentialsFile() {
      return outputCredentialsFile;
    }

    /**
     * Gets the outputBucketLocation.
     *
     * The geographical location of the Cloud Object Storage output bucket as listed on the **Endpoint** tab of your
     * Cloud Object Storage instance; for example, `us-geo`, `eu-geo`, or `ap-geo`.
     *
     * @return the outputBucketLocation
     */
    public String outputBucketLocation() {
      return outputBucketLocation;
    }

    /**
     * Gets the outputBucketName.
     *
     * The name of the Cloud Object Storage output bucket.
     *
     * @return the outputBucketName
     */
    public String outputBucketName() {
      return outputBucketName;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private CreateBatchOptions(CreateBatchOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.function, 'function cannot be null');
      IBMWatsonValidator.notNull(builder.inputCredentialsFile, 'inputCredentialsFile cannot be null');
      IBMWatsonValidator.notNull(builder.inputBucketLocation, 'inputBucketLocation cannot be null');
      IBMWatsonValidator.notNull(builder.inputBucketName, 'inputBucketName cannot be null');
      IBMWatsonValidator.notNull(builder.outputCredentialsFile, 'outputCredentialsFile cannot be null');
      IBMWatsonValidator.notNull(builder.outputBucketLocation, 'outputBucketLocation cannot be null');
      IBMWatsonValidator.notNull(builder.outputBucketName, 'outputBucketName cannot be null');
      function = builder.function;
      inputCredentialsFile = builder.inputCredentialsFile;
      inputBucketLocation = builder.inputBucketLocation;
      inputBucketName = builder.inputBucketName;
      outputCredentialsFile = builder.outputCredentialsFile;
      outputBucketLocation = builder.outputBucketLocation;
      outputBucketName = builder.outputBucketName;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder newBuilder() {
      return new CreateBatchOptionsBuilder(this);
    }
  }

  /**
   * CreateBatchOptions Builder.
   */
  public class CreateBatchOptionsBuilder extends IBMWatsonOptionsModel {
    private String function;
    private IBMWatsonFile inputCredentialsFile;
    private String inputBucketLocation;
    private String inputBucketName;
    private IBMWatsonFile outputCredentialsFile;
    private String outputBucketLocation;
    private String outputBucketName;
    private String model;

    private CreateBatchOptionsBuilder(CreateBatchOptions createBatchOptions) {
      function = createBatchOptions.function;
      inputCredentialsFile = createBatchOptions.inputCredentialsFile;
      inputBucketLocation = createBatchOptions.inputBucketLocation;
      inputBucketName = createBatchOptions.inputBucketName;
      outputCredentialsFile = createBatchOptions.outputCredentialsFile;
      outputBucketLocation = createBatchOptions.outputBucketLocation;
      outputBucketName = createBatchOptions.outputBucketName;
      model = createBatchOptions.model;
      this.requestHeaders.putAll(createBatchOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public CreateBatchOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param function the function
     * @param inputCredentialsFile the inputCredentialsFile
     * @param inputBucketLocation the inputBucketLocation
     * @param inputBucketName the inputBucketName
     * @param outputCredentialsFile the outputCredentialsFile
     * @param outputBucketLocation the outputBucketLocation
     * @param outputBucketName the outputBucketName
     */
    public CreateBatchOptionsBuilder(String function, IBMWatsonFile inputCredentialsFile, String inputBucketLocation, String inputBucketName, IBMWatsonFile outputCredentialsFile, String outputBucketLocation, String outputBucketName) {
      this.function = function;
      this.inputCredentialsFile = inputCredentialsFile;
      this.inputBucketLocation = inputBucketLocation;
      this.inputBucketName = inputBucketName;
      this.outputCredentialsFile = outputCredentialsFile;
      this.outputBucketLocation = outputBucketLocation;
      this.outputBucketName = outputBucketName;
    }

    /**
     * Builds a CreateBatchOptions.
     *
     * @return the createBatchOptions
     */
    public CreateBatchOptions build() {
      return new CreateBatchOptions(this);
    }

    /**
     * Set the function.
     *
     * @param function the function
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder function(String function) {
      this.function = function;
      return this;
    }

    /**
     * Set the inputCredentialsFile.
     *
     * @param inputCredentialsFile the inputCredentialsFile
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder inputCredentialsFile(IBMWatsonFile inputCredentialsFile) {
      this.inputCredentialsFile = inputCredentialsFile;
      return this;
    }

    /**
     * Set the inputBucketLocation.
     *
     * @param inputBucketLocation the inputBucketLocation
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder inputBucketLocation(String inputBucketLocation) {
      this.inputBucketLocation = inputBucketLocation;
      return this;
    }

    /**
     * Set the inputBucketName.
     *
     * @param inputBucketName the inputBucketName
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder inputBucketName(String inputBucketName) {
      this.inputBucketName = inputBucketName;
      return this;
    }

    /**
     * Set the outputCredentialsFile.
     *
     * @param outputCredentialsFile the outputCredentialsFile
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder outputCredentialsFile(IBMWatsonFile outputCredentialsFile) {
      this.outputCredentialsFile = outputCredentialsFile;
      return this;
    }

    /**
     * Set the outputBucketLocation.
     *
     * @param outputBucketLocation the outputBucketLocation
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder outputBucketLocation(String outputBucketLocation) {
      this.outputBucketLocation = outputBucketLocation;
      return this;
    }

    /**
     * Set the outputBucketName.
     *
     * @param outputBucketName the outputBucketName
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder outputBucketName(String outputBucketName) {
      this.outputBucketName = outputBucketName;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the CreateBatchOptions builder
     */
    public CreateBatchOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The deleteFeedback options.
   */
  public class DeleteFeedbackOptions extends IBMWatsonOptionsModel {
    private String feedbackId;
    private String model;

    /**
     * Gets the feedbackId.
     *
     * A string that specifies the feedback entry to be deleted from the document.
     *
     * @return the feedbackId
     */
    public String feedbackId() {
      return feedbackId;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private DeleteFeedbackOptions(DeleteFeedbackOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.feedbackId, 'feedbackId cannot be empty');
      feedbackId = builder.feedbackId;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a DeleteFeedbackOptions builder
     */
    public DeleteFeedbackOptionsBuilder newBuilder() {
      return new DeleteFeedbackOptionsBuilder(this);
    }
  }

  /**
   * DeleteFeedbackOptions Builder.
   */
  public class DeleteFeedbackOptionsBuilder extends IBMWatsonOptionsModel {
    private String feedbackId;
    private String model;

    private DeleteFeedbackOptionsBuilder(DeleteFeedbackOptions deleteFeedbackOptions) {
      feedbackId = deleteFeedbackOptions.feedbackId;
      model = deleteFeedbackOptions.model;
      this.requestHeaders.putAll(deleteFeedbackOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public DeleteFeedbackOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param feedbackId the feedbackId
     */
    public DeleteFeedbackOptionsBuilder(String feedbackId) {
      this.feedbackId = feedbackId;
    }

    /**
     * Builds a DeleteFeedbackOptions.
     *
     * @return the deleteFeedbackOptions
     */
    public DeleteFeedbackOptions build() {
      return new DeleteFeedbackOptions(this);
    }

    /**
     * Set the feedbackId.
     *
     * @param feedbackId the feedbackId
     * @return the DeleteFeedbackOptions builder
     */
    public DeleteFeedbackOptionsBuilder feedbackId(String feedbackId) {
      this.feedbackId = feedbackId;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the DeleteFeedbackOptions builder
     */
    public DeleteFeedbackOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the DeleteFeedbackOptions builder
     */
    public DeleteFeedbackOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Document counts.
   */
  public class DocCounts extends IBMWatsonGenericModel {
    private Long total;
    private Long pending;
    private Long successful;
    private Long failed;

    /**
     * Gets the total.
     *
     * Total number of documents.
     *
     * @return the total
     */
    @AuraEnabled
    public Long getTotal() {
      return total;
    }

    /**
     * Gets the pending.
     *
     * Number of pending documents.
     *
     * @return the pending
     */
    @AuraEnabled
    public Long getPending() {
      return pending;
    }

    /**
     * Gets the successful.
     *
     * Number of documents successfully processed.
     *
     * @return the successful
     */
    @AuraEnabled
    public Long getSuccessful() {
      return successful;
    }

    /**
     * Gets the failed.
     *
     * Number of documents not successfully processed.
     *
     * @return the failed
     */
    @AuraEnabled
    public Long getFailed() {
      return failed;
    }

    /**
     * Sets the total.
     *
     * @param total the new total
     */
    public void setTotal(final long total) {
      this.total = total;
    }

    /**
     * Sets the pending.
     *
     * @param pending the new pending
     */
    public void setPending(final long pending) {
      this.pending = pending;
    }

    /**
     * Sets the successful.
     *
     * @param successful the new successful
     */
    public void setSuccessful(final long successful) {
      this.successful = successful;
    }

    /**
     * Sets the failed.
     *
     * @param failed the new failed
     */
    public void setFailed(final long failed) {
      this.failed = failed;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DocCounts ret = (DocCounts) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Information about the parsed input document.
   */
  public class DocInfo extends IBMWatsonGenericModel {
    private String html;
    private String title;
    private String hash;

    /**
     * Gets the html.
     *
     * The full text of the parsed document in HTML format.
     *
     * @return the html
     */
    @AuraEnabled
    public String getHtml() {
      return html;
    }

    /**
     * Gets the title.
     *
     * The title of the parsed document. If the service did not detect a title, the value of this element is `null`.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the hash.
     *
     * The MD5 hash of the input document.
     *
     * @return the hash
     */
    @AuraEnabled
    public String getHash() {
      return hash;
    }

    /**
     * Sets the html.
     *
     * @param html the new html
     */
    public void setHtml(final String html) {
      this.html = html;
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
     * Sets the hash.
     *
     * @param hash the new hash
     */
    public void setHash(final String hash) {
      this.hash = hash;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      DocInfo ret = (DocInfo) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The structure of the input document.
   */
  public class DocStructure extends IBMWatsonGenericModel {
    private List<SectionTitles> sectionTitles;
    private List<LeadingSentence> leadingSentences;
    private List<Paragraphs> paragraphs;

    /**
     * Gets the sectionTitles.
     *
     * An array containing one object per section or subsection identified in the input document.
     *
     * @return the sectionTitles
     */
    @AuraEnabled
    public List<SectionTitles> getSectionTitles() {
      return sectionTitles;
    }

    /**
     * Gets the leadingSentences.
     *
     * An array containing one object per section or subsection, in parallel with the `section_titles` array, that
     * details the leading sentences in the corresponding section or subsection.
     *
     * @return the leadingSentences
     */
    @AuraEnabled
    public List<LeadingSentence> getLeadingSentences() {
      return leadingSentences;
    }

    /**
     * Gets the paragraphs.
     *
     * An array containing one object per paragraph, in parallel with the `section_titles` and `leading_sentences`
     * arrays.
     *
     * @return the paragraphs
     */
    @AuraEnabled
    public List<Paragraphs> getParagraphs() {
      return paragraphs;
    }

    /**
     * Sets the sectionTitles.
     *
     * @param sectionTitles the new sectionTitles
     */
    public void setSectionTitles(final List<SectionTitles> sectionTitles) {
      this.sectionTitles = sectionTitles;
    }

    /**
     * Sets the leadingSentences.
     *
     * @param leadingSentences the new leadingSentences
     */
    public void setLeadingSentences(final List<LeadingSentence> leadingSentences) {
      this.leadingSentences = leadingSentences;
    }

    /**
     * Sets the paragraphs.
     *
     * @param paragraphs the new paragraphs
     */
    public void setParagraphs(final List<Paragraphs> paragraphs) {
      this.paragraphs = paragraphs;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'section_titles' => 'sectionTitles',
        'leading_sentences' => 'leadingSentences'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      DocStructure ret = (DocStructure) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for sectionTitles
      List<SectionTitles> newSectionTitles = new List<SectionTitles>();
      List<SectionTitles> deserializedSectionTitles = ret.getSectionTitles();
      if (deserializedSectionTitles != null) {
        for (Integer i = 0; i < deserializedSectionTitles.size(); i++) {
          SectionTitles currentItem = ret.getSectionTitles().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('sectionTitles');
          SectionTitles newItem = (SectionTitles) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), SectionTitles.class);
          newSectionTitles.add(newItem);
        }
        ret.sectionTitles = newSectionTitles;
      }

      // calling custom deserializer for leadingSentences
      List<LeadingSentence> newLeadingSentences = new List<LeadingSentence>();
      List<LeadingSentence> deserializedLeadingSentences = ret.getLeadingSentences();
      if (deserializedLeadingSentences != null) {
        for (Integer i = 0; i < deserializedLeadingSentences.size(); i++) {
          LeadingSentence currentItem = ret.getLeadingSentences().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('leadingSentences');
          LeadingSentence newItem = (LeadingSentence) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), LeadingSentence.class);
          newLeadingSentences.add(newItem);
        }
        ret.leadingSentences = newLeadingSentences;
      }

      // calling custom deserializer for paragraphs
      List<Paragraphs> newParagraphs = new List<Paragraphs>();
      List<Paragraphs> deserializedParagraphs = ret.getParagraphs();
      if (deserializedParagraphs != null) {
        for (Integer i = 0; i < deserializedParagraphs.size(); i++) {
          Paragraphs currentItem = ret.getParagraphs().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('paragraphs');
          Paragraphs newItem = (Paragraphs) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Paragraphs.class);
          newParagraphs.add(newItem);
        }
        ret.paragraphs = newParagraphs;
      }

      return ret;
    }
  }

  /**
   * Basic information about the input document.
   */
  public class Document extends IBMWatsonGenericModel {
    private String title;
    private String html;
    private String hash;
    private String label;

    /**
     * Gets the title.
     *
     * Document title, if detected.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the html.
     *
     * The input document converted into HTML format.
     *
     * @return the html
     */
    @AuraEnabled
    public String getHtml() {
      return html;
    }

    /**
     * Gets the hash.
     *
     * The MD5 hash value of the input document.
     *
     * @return the hash
     */
    @AuraEnabled
    public String getHash() {
      return hash;
    }

    /**
     * Gets the label.
     *
     * The label applied to the input document with the calling method's `file_1_label` or `file_2_label` value. This
     * field is specified only in the output of the **Comparing two documents** method.
     *
     * @return the label
     */
    @AuraEnabled
    public String getLabel() {
      return label;
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
     * Sets the html.
     *
     * @param html the new html
     */
    public void setHtml(final String html) {
      this.html = html;
    }

    /**
     * Sets the hash.
     *
     * @param hash the new hash
     */
    public void setHash(final String hash) {
      this.hash = hash;
    }

    /**
     * Sets the label.
     *
     * @param label the new label
     */
    public void setLabel(final String label) {
      this.label = label;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Document ret = (Document) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * An effective date.
   */
  public class EffectiveDates extends IBMWatsonGenericModel {
    private String confidenceLevel;
    private String text;
    private String textNormalized;
    private List<String> provenanceIds;
    private Location location;

    /**
     * Gets the confidenceLevel.
     *
     * The confidence level in the identification of the effective date.
     *
     * @return the confidenceLevel
     */
    @AuraEnabled
    public String getConfidenceLevel() {
      return confidenceLevel;
    }

    /**
     * Gets the text.
     *
     * The effective date, listed as a string.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * The normalized form of the effective date, which is listed as a string. This element is optional; it is returned
     * only if normalized text exists.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the confidenceLevel.
     *
     * @param confidenceLevel the new confidenceLevel
     */
    public void setConfidenceLevel(final String confidenceLevel) {
      this.confidenceLevel = confidenceLevel;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'confidence_level' => 'confidenceLevel',
        'text_normalized' => 'textNormalized',
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      EffectiveDates ret = (EffectiveDates) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * A component part of the document.
   */
  public class Element extends IBMWatsonGenericModel {
    private Location location;
    private String text;
    private List<TypeLabel> types;
    private List<Category> categories;
    private List<Attribute> attributes;

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text of the element.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the types.
     *
     * Description of the action specified by the element  and whom it affects.
     *
     * @return the types
     */
    @AuraEnabled
    public List<TypeLabel> getTypes() {
      return types;
    }

    /**
     * Gets the categories.
     *
     * List of functional categories into which the element falls; in other words, the subject matter of the element.
     *
     * @return the categories
     */
    @AuraEnabled
    public List<Category> getCategories() {
      return categories;
    }

    /**
     * Gets the attributes.
     *
     * List of document attributes.
     *
     * @return the attributes
     */
    @AuraEnabled
    public List<Attribute> getAttributes() {
      return attributes;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the types.
     *
     * @param types the new types
     */
    public void setTypes(final List<TypeLabel> types) {
      this.types = types;
    }

    /**
     * Sets the categories.
     *
     * @param categories the new categories
     */
    public void setCategories(final List<Category> categories) {
      this.categories = categories;
    }

    /**
     * Sets the attributes.
     *
     * @param attributes the new attributes
     */
    public void setAttributes(final List<Attribute> attributes) {
      this.attributes = attributes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Element ret = (Element) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for types
      List<TypeLabel> newTypes = new List<TypeLabel>();
      List<TypeLabel> deserializedTypes = ret.getTypes();
      if (deserializedTypes != null) {
        for (Integer i = 0; i < deserializedTypes.size(); i++) {
          TypeLabel currentItem = ret.getTypes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('types');
          TypeLabel newItem = (TypeLabel) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TypeLabel.class);
          newTypes.add(newItem);
        }
        ret.types = newTypes;
      }

      // calling custom deserializer for categories
      List<Category> newCategories = new List<Category>();
      List<Category> deserializedCategories = ret.getCategories();
      if (deserializedCategories != null) {
        for (Integer i = 0; i < deserializedCategories.size(); i++) {
          Category currentItem = ret.getCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('categories');
          Category newItem = (Category) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Category.class);
          newCategories.add(newItem);
        }
        ret.categories = newCategories;
      }

      // calling custom deserializer for attributes
      List<Attribute> newAttributes = new List<Attribute>();
      List<Attribute> deserializedAttributes = ret.getAttributes();
      if (deserializedAttributes != null) {
        for (Integer i = 0; i < deserializedAttributes.size(); i++) {
          Attribute currentItem = ret.getAttributes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('attributes');
          Attribute newItem = (Attribute) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Attribute.class);
          newAttributes.add(newItem);
        }
        ret.attributes = newAttributes;
      }

      return ret;
    }
  }

  /**
   * A list of `begin` and `end` indexes that indicate the locations of the elements in the input document.
   */
  public class ElementLocations extends IBMWatsonGenericModel {
    private Long xBegin;
    private Long xEnd;

    /**
     * Gets the xBegin.
     *
     * An integer that indicates the starting position of the element in the input document.
     *
     * @return the xBegin
     */
    @AuraEnabled
    public Long getXBegin() {
      return xBegin;
    }

    /**
     * Gets the xEnd.
     *
     * An integer that indicates the ending position of the element in the input document.
     *
     * @return the xEnd
     */
    @AuraEnabled
    public Long getXEnd() {
      return xEnd;
    }

    /**
     * Sets the xBegin.
     *
     * @param xBegin the new xBegin
     */
    public void setXBegin(final long xBegin) {
      this.xBegin = xBegin;
    }

    /**
     * Sets the xEnd.
     *
     * @param xEnd the new xEnd
     */
    public void setXEnd(final long xEnd) {
      this.xEnd = xEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'begin' => 'xBegin',
        'end' => 'xEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ElementLocations ret = (ElementLocations) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * Details of semantically aligned elements.
   */
  public class ElementPair extends IBMWatsonGenericModel {
    private String documentLabel;
    private String text;
    private Location location;
    private List<TypeLabelComparison> types;
    private List<CategoryComparison> categories;
    private List<Attribute> attributes;

    /**
     * Gets the documentLabel.
     *
     * The label of the document (that is, the value of either the `file_1_label` or `file_2_label` parameters) in which
     * the element occurs.
     *
     * @return the documentLabel
     */
    @AuraEnabled
    public String getDocumentLabel() {
      return documentLabel;
    }

    /**
     * Gets the text.
     *
     * The contents of the element.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the types.
     *
     * Description of the action specified by the element and whom it affects.
     *
     * @return the types
     */
    @AuraEnabled
    public List<TypeLabelComparison> getTypes() {
      return types;
    }

    /**
     * Gets the categories.
     *
     * List of functional categories into which the element falls; in other words, the subject matter of the element.
     *
     * @return the categories
     */
    @AuraEnabled
    public List<CategoryComparison> getCategories() {
      return categories;
    }

    /**
     * Gets the attributes.
     *
     * List of document attributes.
     *
     * @return the attributes
     */
    @AuraEnabled
    public List<Attribute> getAttributes() {
      return attributes;
    }

    /**
     * Sets the documentLabel.
     *
     * @param documentLabel the new documentLabel
     */
    public void setDocumentLabel(final String documentLabel) {
      this.documentLabel = documentLabel;
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
    public void setLocation(final Location location) {
      this.location = location;
    }

    /**
     * Sets the types.
     *
     * @param types the new types
     */
    public void setTypes(final List<TypeLabelComparison> types) {
      this.types = types;
    }

    /**
     * Sets the categories.
     *
     * @param categories the new categories
     */
    public void setCategories(final List<CategoryComparison> categories) {
      this.categories = categories;
    }

    /**
     * Sets the attributes.
     *
     * @param attributes the new attributes
     */
    public void setAttributes(final List<Attribute> attributes) {
      this.attributes = attributes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_label' => 'documentLabel'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      ElementPair ret = (ElementPair) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for types
      List<TypeLabelComparison> newTypes = new List<TypeLabelComparison>();
      List<TypeLabelComparison> deserializedTypes = ret.getTypes();
      if (deserializedTypes != null) {
        for (Integer i = 0; i < deserializedTypes.size(); i++) {
          TypeLabelComparison currentItem = ret.getTypes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('types');
          TypeLabelComparison newItem = (TypeLabelComparison) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TypeLabelComparison.class);
          newTypes.add(newItem);
        }
        ret.types = newTypes;
      }

      // calling custom deserializer for categories
      List<CategoryComparison> newCategories = new List<CategoryComparison>();
      List<CategoryComparison> deserializedCategories = ret.getCategories();
      if (deserializedCategories != null) {
        for (Integer i = 0; i < deserializedCategories.size(); i++) {
          CategoryComparison currentItem = ret.getCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('categories');
          CategoryComparison newItem = (CategoryComparison) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), CategoryComparison.class);
          newCategories.add(newItem);
        }
        ret.categories = newCategories;
      }

      // calling custom deserializer for attributes
      List<Attribute> newAttributes = new List<Attribute>();
      List<Attribute> deserializedAttributes = ret.getAttributes();
      if (deserializedAttributes != null) {
        for (Integer i = 0; i < deserializedAttributes.size(); i++) {
          Attribute currentItem = ret.getAttributes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('attributes');
          Attribute newItem = (Attribute) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Attribute.class);
          newAttributes.add(newItem);
        }
        ret.attributes = newAttributes;
      }

      return ret;
    }
  }

  /**
   * The extractTables options.
   */
  public class ExtractTablesOptions extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String fileContentType;
    private String model;

    /**
     * Gets the file.
     *
     * The document on which to run table extraction.
     *
     * @return the file
     */
    public IBMWatsonFile file() {
      return file;
    }

    /**
     * Gets the fileContentType.
     *
     * The content type of file.
     *
     * @return the fileContentType
     */
    public String fileContentType() {
      return fileContentType;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private ExtractTablesOptions(ExtractTablesOptionsBuilder builder) {
      IBMWatsonValidator.notNull(builder.file, 'file cannot be null');
      file = builder.file;
      fileContentType = builder.fileContentType;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ExtractTablesOptions builder
     */
    public ExtractTablesOptionsBuilder newBuilder() {
      return new ExtractTablesOptionsBuilder(this);
    }
  }

  /**
   * ExtractTablesOptions Builder.
   */
  public class ExtractTablesOptionsBuilder extends IBMWatsonOptionsModel {
    private IBMWatsonFile file;
    private String fileContentType;
    private String model;

    private ExtractTablesOptionsBuilder(ExtractTablesOptions extractTablesOptions) {
      file = extractTablesOptions.file;
      fileContentType = extractTablesOptions.fileContentType;
      model = extractTablesOptions.model;
      this.requestHeaders.putAll(extractTablesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ExtractTablesOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param file the file
     */
    public ExtractTablesOptionsBuilder(IBMWatsonFile file) {
      this.file = file;
    }

    /**
     * Builds a ExtractTablesOptions.
     *
     * @return the extractTablesOptions
     */
    public ExtractTablesOptions build() {
      return new ExtractTablesOptions(this);
    }

    /**
     * Set the file.
     *
     * @param file the file
     * @return the ExtractTablesOptions builder
     */
    public ExtractTablesOptionsBuilder file(IBMWatsonFile file) {
      this.file = file;
      return this;
    }

    /**
     * Set the fileContentType.
     *
     * @param fileContentType the fileContentType
     * @return the ExtractTablesOptions builder
     */
    public ExtractTablesOptionsBuilder fileContentType(String fileContentType) {
      this.fileContentType = fileContentType;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the ExtractTablesOptions builder
     */
    public ExtractTablesOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ExtractTablesOptions builder
     */
    public ExtractTablesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * Feedback data for submission.
   */
  public class FeedbackDataInput extends IBMWatsonGenericModel {
    private String feedbackType;
    private ShortDoc document;
    private String modelId;
    private String modelVersion;
    private Location location;
    private String text;
    private OriginalLabelsIn originalLabels;
    private UpdatedLabelsIn updatedLabels;

    /**
     * Gets the feedbackType.
     *
     * The type of feedback. The only permitted value is `element_classification`.
     *
     * @return the feedbackType
     */
    public String getFeedbackType() {
      return feedbackType;
    }

    /**
     * Gets the document.
     *
     * Brief information about the input document.
     *
     * @return the document
     */
    public ShortDoc getDocument() {
      return document;
    }

    /**
     * Gets the modelId.
     *
     * An optional string identifying the model ID. The only permitted value is `contracts`.
     *
     * @return the modelId
     */
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the modelVersion.
     *
     * An optional string identifying the version of the model used.
     *
     * @return the modelVersion
     */
    public String getModelVersion() {
      return modelVersion;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text on which to submit feedback.
     *
     * @return the text
     */
    public String getText() {
      return text;
    }

    /**
     * Gets the originalLabels.
     *
     * The original labeling from the input document, without the submitted feedback.
     *
     * @return the originalLabels
     */
    public OriginalLabelsIn getOriginalLabels() {
      return originalLabels;
    }

    /**
     * Gets the updatedLabels.
     *
     * The updated labeling from the input document, accounting for the submitted feedback.
     *
     * @return the updatedLabels
     */
    public UpdatedLabelsIn getUpdatedLabels() {
      return updatedLabels;
    }
  
    private FeedbackDataInput(FeedbackDataInputBuilder builder) {
      IBMWatsonValidator.notNull(builder.feedbackType, 'feedbackType cannot be null');
      IBMWatsonValidator.notNull(builder.location, 'location cannot be null');
      IBMWatsonValidator.notNull(builder.text, 'text cannot be null');
      IBMWatsonValidator.notNull(builder.originalLabels, 'originalLabels cannot be null');
      IBMWatsonValidator.notNull(builder.updatedLabels, 'updatedLabels cannot be null');
      this.feedbackType = builder.feedbackType;
      this.document = builder.document;
      this.modelId = builder.modelId;
      this.modelVersion = builder.modelVersion;
      this.location = builder.location;
      this.text = builder.text;
      this.originalLabels = builder.originalLabels;
      this.updatedLabels = builder.updatedLabels;
    }

    /**
     * New builder.
     *
     * @return a FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder newBuilder() {
      return new FeedbackDataInputBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'feedbackType' => 'feedback_type',
        'modelId' => 'model_id',
        'modelVersion' => 'model_version',
        'originalLabels' => 'original_labels',
        'updatedLabels' => 'updated_labels'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for document
      if (document != null) {
        String documentJsonString = JSON.serialize(document.replacePropertyNames(), true);
        String documentKey = 'document';
        if (propertyNameMapping.containsKey(documentKey)) {
          documentKey = propertyNameMapping.get(documentKey);
        }
        jsonMap.put(documentKey, JSON.deserializeUntyped(documentJsonString));
      }

      // performing custom serialization for location
      if (location != null) {
        String locationJsonString = JSON.serialize(location.replacePropertyNames(), true);
        String locationKey = 'location';
        if (propertyNameMapping.containsKey(locationKey)) {
          locationKey = propertyNameMapping.get(locationKey);
        }
        jsonMap.put(locationKey, JSON.deserializeUntyped(locationJsonString));
      }

      // performing custom serialization for originalLabels
      if (originalLabels != null) {
        String originalLabelsJsonString = JSON.serialize(originalLabels.replacePropertyNames(), true);
        String originalLabelsKey = 'originalLabels';
        if (propertyNameMapping.containsKey(originalLabelsKey)) {
          originalLabelsKey = propertyNameMapping.get(originalLabelsKey);
        }
        jsonMap.put(originalLabelsKey, JSON.deserializeUntyped(originalLabelsJsonString));
      }

      // performing custom serialization for updatedLabels
      if (updatedLabels != null) {
        String updatedLabelsJsonString = JSON.serialize(updatedLabels.replacePropertyNames(), true);
        String updatedLabelsKey = 'updatedLabels';
        if (propertyNameMapping.containsKey(updatedLabelsKey)) {
          updatedLabelsKey = propertyNameMapping.get(updatedLabelsKey);
        }
        jsonMap.put(updatedLabelsKey, JSON.deserializeUntyped(updatedLabelsJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * FeedbackDataInput Builder.
   */
  public class FeedbackDataInputBuilder {
    private String feedbackType;
    private ShortDoc document;
    private String modelId;
    private String modelVersion;
    private Location location;
    private String text;
    private OriginalLabelsIn originalLabels;
    private UpdatedLabelsIn updatedLabels;

    private FeedbackDataInputBuilder(FeedbackDataInput feedbackDataInput) {
      this.feedbackType = feedbackDataInput.feedbackType;
      this.document = feedbackDataInput.document;
      this.modelId = feedbackDataInput.modelId;
      this.modelVersion = feedbackDataInput.modelVersion;
      this.location = feedbackDataInput.location;
      this.text = feedbackDataInput.text;
      this.originalLabels = feedbackDataInput.originalLabels;
      this.updatedLabels = feedbackDataInput.updatedLabels;
    }

    /**
     * Instantiates a new builder.
     */
    public FeedbackDataInputBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param feedbackType the feedbackType
     * @param location the location
     * @param text the text
     * @param originalLabels the originalLabels
     * @param updatedLabels the updatedLabels
     */
    public FeedbackDataInputBuilder(String feedbackType, Location location, String text, OriginalLabelsIn originalLabels, UpdatedLabelsIn updatedLabels) {
      this.feedbackType = feedbackType;
      this.location = location;
      this.text = text;
      this.originalLabels = originalLabels;
      this.updatedLabels = updatedLabels;
    }

    /**
     * Builds a FeedbackDataInput.
     *
     * @return the feedbackDataInput
     */
    public FeedbackDataInput build() {
      return new FeedbackDataInput(this);
    }

    /**
     * Set the feedbackType.
     *
     * @param feedbackType the feedbackType
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder feedbackType(String feedbackType) {
      this.feedbackType = feedbackType;
      return this;
    }

    /**
     * Set the document.
     *
     * @param document the document
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder document(ShortDoc document) {
      this.document = document;
      return this;
    }

    /**
     * Set the modelId.
     *
     * @param modelId the modelId
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder modelId(String modelId) {
      this.modelId = modelId;
      return this;
    }

    /**
     * Set the modelVersion.
     *
     * @param modelVersion the modelVersion
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder modelVersion(String modelVersion) {
      this.modelVersion = modelVersion;
      return this;
    }

    /**
     * Set the location.
     *
     * @param location the location
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder location(Location location) {
      this.location = location;
      return this;
    }

    /**
     * Set the text.
     *
     * @param text the text
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder text(String text) {
      this.text = text;
      return this;
    }

    /**
     * Set the originalLabels.
     *
     * @param originalLabels the originalLabels
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder originalLabels(OriginalLabelsIn originalLabels) {
      this.originalLabels = originalLabels;
      return this;
    }

    /**
     * Set the updatedLabels.
     *
     * @param updatedLabels the updatedLabels
     * @return the FeedbackDataInput builder
     */
    public FeedbackDataInputBuilder updatedLabels(UpdatedLabelsIn updatedLabels) {
      this.updatedLabels = updatedLabels;
      return this;
    }
  }

  /**
   * Information returned from the **Add Feedback** method.
   */
  public class FeedbackDataOutput extends IBMWatsonGenericModel {
    private String feedbackType;
    private ShortDoc document;
    private String modelId;
    private String modelVersion;
    private Location location;
    private String text;
    private OriginalLabelsOut originalLabels;
    private UpdatedLabelsOut updatedLabels;
    private Pagination pagination;

    /**
     * Gets the feedbackType.
     *
     * A string identifying the user adding the feedback. The only permitted value is `element_classification`.
     *
     * @return the feedbackType
     */
    @AuraEnabled
    public String getFeedbackType() {
      return feedbackType;
    }

    /**
     * Gets the document.
     *
     * Brief information about the input document.
     *
     * @return the document
     */
    @AuraEnabled
    public ShortDoc getDocument() {
      return document;
    }

    /**
     * Gets the modelId.
     *
     * An optional string identifying the model ID. The only permitted value is `contracts`.
     *
     * @return the modelId
     */
    @AuraEnabled
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the modelVersion.
     *
     * An optional string identifying the version of the model used.
     *
     * @return the modelVersion
     */
    @AuraEnabled
    public String getModelVersion() {
      return modelVersion;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text to which the feedback applies.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the originalLabels.
     *
     * The original labeling from the input document, without the submitted feedback.
     *
     * @return the originalLabels
     */
    @AuraEnabled
    public OriginalLabelsOut getOriginalLabels() {
      return originalLabels;
    }

    /**
     * Gets the updatedLabels.
     *
     * The updated labeling from the input document, accounting for the submitted feedback.
     *
     * @return the updatedLabels
     */
    @AuraEnabled
    public UpdatedLabelsOut getUpdatedLabels() {
      return updatedLabels;
    }

    /**
     * Gets the pagination.
     *
     * Pagination details, if required by the length of the output.
     *
     * @return the pagination
     */
    @AuraEnabled
    public Pagination getPagination() {
      return pagination;
    }

    /**
     * Sets the feedbackType.
     *
     * @param feedbackType the new feedbackType
     */
    public void setFeedbackType(final String feedbackType) {
      this.feedbackType = feedbackType;
    }

    /**
     * Sets the document.
     *
     * @param document the new document
     */
    public void setDocument(final ShortDoc document) {
      this.document = document;
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
     * Sets the modelVersion.
     *
     * @param modelVersion the new modelVersion
     */
    public void setModelVersion(final String modelVersion) {
      this.modelVersion = modelVersion;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the originalLabels.
     *
     * @param originalLabels the new originalLabels
     */
    public void setOriginalLabels(final OriginalLabelsOut originalLabels) {
      this.originalLabels = originalLabels;
    }

    /**
     * Sets the updatedLabels.
     *
     * @param updatedLabels the new updatedLabels
     */
    public void setUpdatedLabels(final UpdatedLabelsOut updatedLabels) {
      this.updatedLabels = updatedLabels;
    }

    /**
     * Sets the pagination.
     *
     * @param pagination the new pagination
     */
    public void setPagination(final Pagination pagination) {
      this.pagination = pagination;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'feedback_type' => 'feedbackType',
        'model_id' => 'modelId',
        'model_version' => 'modelVersion',
        'original_labels' => 'originalLabels',
        'updated_labels' => 'updatedLabels'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      FeedbackDataOutput ret = (FeedbackDataOutput) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for document
      Map<String, Object> documentMap = (Map<String, Object>) jsonMap.get('document');
      ShortDoc newDocument = (ShortDoc) new ShortDoc().deserialize(JSON.serialize(documentMap, true), documentMap, ShortDoc.class);
      ret.setDocument(newDocument);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for originalLabels
      Map<String, Object> originalLabelsMap = (Map<String, Object>) jsonMap.get('originalLabels');
      OriginalLabelsOut newOriginalLabels = (OriginalLabelsOut) new OriginalLabelsOut().deserialize(JSON.serialize(originalLabelsMap, true), originalLabelsMap, OriginalLabelsOut.class);
      ret.setOriginalLabels(newOriginalLabels);

      // calling custom deserializer for updatedLabels
      Map<String, Object> updatedLabelsMap = (Map<String, Object>) jsonMap.get('updatedLabels');
      UpdatedLabelsOut newUpdatedLabels = (UpdatedLabelsOut) new UpdatedLabelsOut().deserialize(JSON.serialize(updatedLabelsMap, true), updatedLabelsMap, UpdatedLabelsOut.class);
      ret.setUpdatedLabels(newUpdatedLabels);

      // calling custom deserializer for pagination
      Map<String, Object> paginationMap = (Map<String, Object>) jsonMap.get('pagination');
      Pagination newPagination = (Pagination) new Pagination().deserialize(JSON.serialize(paginationMap, true), paginationMap, Pagination.class);
      ret.setPagination(newPagination);

      return ret;
    }
  }

  /**
   * The results of a successful **List Feedback** request for all feedback.
   */
  public class FeedbackList extends IBMWatsonResponseModel {
    private List<GetFeedback> feedback;

    /**
     * Gets the feedback.
     *
     * A list of all feedback for the document.
     *
     * @return the feedback
     */
    @AuraEnabled
    public List<GetFeedback> getFeedback() {
      return feedback;
    }

    /**
     * Sets the feedback.
     *
     * @param feedback the new feedback
     */
    public void setFeedback(final List<GetFeedback> feedback) {
      this.feedback = feedback;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      FeedbackList ret = (FeedbackList) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for feedback
      List<GetFeedback> newFeedback = new List<GetFeedback>();
      List<GetFeedback> deserializedFeedback = ret.getFeedback();
      if (deserializedFeedback != null) {
        for (Integer i = 0; i < deserializedFeedback.size(); i++) {
          GetFeedback currentItem = ret.getFeedback().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('feedback');
          GetFeedback newItem = (GetFeedback) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), GetFeedback.class);
          newFeedback.add(newItem);
        }
        ret.feedback = newFeedback;
      }

      return ret;
    }
  }

  /**
   * Information about the document and the submitted feedback.
   */
  public class FeedbackReturn extends IBMWatsonResponseModel {
    private String feedbackId;
    private String userId;
    private String comment;
    private Datetime created;
    private FeedbackDataOutput feedbackData;

    /**
     * Gets the feedbackId.
     *
     * The unique ID of the feedback object.
     *
     * @return the feedbackId
     */
    @AuraEnabled
    public String getFeedbackId() {
      return feedbackId;
    }

    /**
     * Gets the userId.
     *
     * An optional string identifying the person submitting feedback.
     *
     * @return the userId
     */
    @AuraEnabled
    public String getUserId() {
      return userId;
    }

    /**
     * Gets the comment.
     *
     * An optional comment from the person submitting the feedback.
     *
     * @return the comment
     */
    @AuraEnabled
    public String getComment() {
      return comment;
    }

    /**
     * Gets the created.
     *
     * Timestamp listing the creation time of the feedback submission.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the feedbackData.
     *
     * Information returned from the **Add Feedback** method.
     *
     * @return the feedbackData
     */
    @AuraEnabled
    public FeedbackDataOutput getFeedbackData() {
      return feedbackData;
    }

    /**
     * Sets the feedbackId.
     *
     * @param feedbackId the new feedbackId
     */
    public void setFeedbackId(final String feedbackId) {
      this.feedbackId = feedbackId;
    }

    /**
     * Sets the userId.
     *
     * @param userId the new userId
     */
    public void setUserId(final String userId) {
      this.userId = userId;
    }

    /**
     * Sets the comment.
     *
     * @param comment the new comment
     */
    public void setComment(final String comment) {
      this.comment = comment;
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
     * Sets the feedbackData.
     *
     * @param feedbackData the new feedbackData
     */
    public void setFeedbackData(final FeedbackDataOutput feedbackData) {
      this.feedbackData = feedbackData;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'feedback_id' => 'feedbackId',
        'user_id' => 'userId',
        'feedback_data' => 'feedbackData'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      FeedbackReturn ret = (FeedbackReturn) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for feedbackData
      Map<String, Object> feedbackDataMap = (Map<String, Object>) jsonMap.get('feedbackData');
      FeedbackDataOutput newFeedbackData = (FeedbackDataOutput) new FeedbackDataOutput().deserialize(JSON.serialize(feedbackDataMap, true), feedbackDataMap, FeedbackDataOutput.class);
      ret.setFeedbackData(newFeedbackData);

      return ret;
    }
  }

  /**
   * The getBatch options.
   */
  public class GetBatchOptions extends IBMWatsonOptionsModel {
    private String batchId;

    /**
     * Gets the batchId.
     *
     * The ID of the batch-processing job whose information you want to retrieve.
     *
     * @return the batchId
     */
    public String batchId() {
      return batchId;
    }

    private GetBatchOptions(GetBatchOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.batchId, 'batchId cannot be empty');
      batchId = builder.batchId;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetBatchOptions builder
     */
    public GetBatchOptionsBuilder newBuilder() {
      return new GetBatchOptionsBuilder(this);
    }
  }

  /**
   * GetBatchOptions Builder.
   */
  public class GetBatchOptionsBuilder extends IBMWatsonOptionsModel {
    private String batchId;

    private GetBatchOptionsBuilder(GetBatchOptions getBatchOptions) {
      batchId = getBatchOptions.batchId;
      this.requestHeaders.putAll(getBatchOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetBatchOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param batchId the batchId
     */
    public GetBatchOptionsBuilder(String batchId) {
      this.batchId = batchId;
    }

    /**
     * Builds a GetBatchOptions.
     *
     * @return the getBatchOptions
     */
    public GetBatchOptions build() {
      return new GetBatchOptions(this);
    }

    /**
     * Set the batchId.
     *
     * @param batchId the batchId
     * @return the GetBatchOptions builder
     */
    public GetBatchOptionsBuilder batchId(String batchId) {
      this.batchId = batchId;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetBatchOptions builder
     */
    public GetBatchOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The results of a successful **Get Feedback** request for a single feedback entry.
   */
  public class GetFeedback extends IBMWatsonResponseModel {
    private String feedbackId;
    private Datetime created;
    private String comment;
    private FeedbackDataOutput feedbackData;

    /**
     * Gets the feedbackId.
     *
     * A string uniquely identifying the feedback entry.
     *
     * @return the feedbackId
     */
    @AuraEnabled
    public String getFeedbackId() {
      return feedbackId;
    }

    /**
     * Gets the created.
     *
     * A timestamp identifying the creation time of the feedback entry.
     *
     * @return the created
     */
    @AuraEnabled
    public Datetime getCreated() {
      return created;
    }

    /**
     * Gets the comment.
     *
     * A string containing the user's comment about the feedback entry.
     *
     * @return the comment
     */
    @AuraEnabled
    public String getComment() {
      return comment;
    }

    /**
     * Gets the feedbackData.
     *
     * Information returned from the **Add Feedback** method.
     *
     * @return the feedbackData
     */
    @AuraEnabled
    public FeedbackDataOutput getFeedbackData() {
      return feedbackData;
    }

    /**
     * Sets the feedbackId.
     *
     * @param feedbackId the new feedbackId
     */
    public void setFeedbackId(final String feedbackId) {
      this.feedbackId = feedbackId;
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
     * Sets the comment.
     *
     * @param comment the new comment
     */
    public void setComment(final String comment) {
      this.comment = comment;
    }

    /**
     * Sets the feedbackData.
     *
     * @param feedbackData the new feedbackData
     */
    public void setFeedbackData(final FeedbackDataOutput feedbackData) {
      this.feedbackData = feedbackData;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'feedback_id' => 'feedbackId',
        'feedback_data' => 'feedbackData'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      GetFeedback ret = (GetFeedback) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for feedbackData
      Map<String, Object> feedbackDataMap = (Map<String, Object>) jsonMap.get('feedbackData');
      FeedbackDataOutput newFeedbackData = (FeedbackDataOutput) new FeedbackDataOutput().deserialize(JSON.serialize(feedbackDataMap, true), feedbackDataMap, FeedbackDataOutput.class);
      ret.setFeedbackData(newFeedbackData);

      return ret;
    }
  }

  /**
   * The getFeedback options.
   */
  public class GetFeedbackOptions extends IBMWatsonOptionsModel {
    private String feedbackId;
    private String model;

    /**
     * Gets the feedbackId.
     *
     * A string that specifies the feedback entry to be included in the output.
     *
     * @return the feedbackId
     */
    public String feedbackId() {
      return feedbackId;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private GetFeedbackOptions(GetFeedbackOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.feedbackId, 'feedbackId cannot be empty');
      feedbackId = builder.feedbackId;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a GetFeedbackOptions builder
     */
    public GetFeedbackOptionsBuilder newBuilder() {
      return new GetFeedbackOptionsBuilder(this);
    }
  }

  /**
   * GetFeedbackOptions Builder.
   */
  public class GetFeedbackOptionsBuilder extends IBMWatsonOptionsModel {
    private String feedbackId;
    private String model;

    private GetFeedbackOptionsBuilder(GetFeedbackOptions getFeedbackOptions) {
      feedbackId = getFeedbackOptions.feedbackId;
      model = getFeedbackOptions.model;
      this.requestHeaders.putAll(getFeedbackOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public GetFeedbackOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param feedbackId the feedbackId
     */
    public GetFeedbackOptionsBuilder(String feedbackId) {
      this.feedbackId = feedbackId;
    }

    /**
     * Builds a GetFeedbackOptions.
     *
     * @return the getFeedbackOptions
     */
    public GetFeedbackOptions build() {
      return new GetFeedbackOptions(this);
    }

    /**
     * Set the feedbackId.
     *
     * @param feedbackId the feedbackId
     * @return the GetFeedbackOptions builder
     */
    public GetFeedbackOptionsBuilder feedbackId(String feedbackId) {
      this.feedbackId = feedbackId;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the GetFeedbackOptions builder
     */
    public GetFeedbackOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the GetFeedbackOptions builder
     */
    public GetFeedbackOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The HTML converted from an input document.
   */
  public class HTMLReturn extends IBMWatsonResponseModel {
    private String numPages;
    private String author;
    private String publicationDate;
    private String title;
    private String html;

    /**
     * Gets the numPages.
     *
     * The number of pages in the input document.
     *
     * @return the numPages
     */
    @AuraEnabled
    public String getNumPages() {
      return numPages;
    }

    /**
     * Gets the author.
     *
     * The author of the input document, if identified.
     *
     * @return the author
     */
    @AuraEnabled
    public String getAuthor() {
      return author;
    }

    /**
     * Gets the publicationDate.
     *
     * The publication date of the input document, if identified.
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
     * The title of the input document, if identified.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the html.
     *
     * The HTML version of the input document.
     *
     * @return the html
     */
    @AuraEnabled
    public String getHtml() {
      return html;
    }

    /**
     * Sets the numPages.
     *
     * @param numPages the new numPages
     */
    public void setNumPages(final String numPages) {
      this.numPages = numPages;
    }

    /**
     * Sets the author.
     *
     * @param author the new author
     */
    public void setAuthor(final String author) {
      this.author = author;
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
     * Sets the html.
     *
     * @param html the new html
     */
    public void setHtml(final String html) {
      this.html = html;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'num_pages' => 'numPages',
        'publication_date' => 'publicationDate'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      HTMLReturn ret = (HTMLReturn) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The details of the normalized text, if applicable. This element is optional; it is returned only if normalized text
   * exists.
   */
  public class Interpretation extends IBMWatsonGenericModel {
    private String value;
    private Double numericValue;
    private String unit;

    /**
     * Gets the value.
     *
     * The value that was located in the normalized text.
     *
     * @return the value
     */
    @AuraEnabled
    public String getValue() {
      return value;
    }

    /**
     * Gets the numericValue.
     *
     * An integer or float expressing the numeric value of the `value` key.
     *
     * @return the numericValue
     */
    @AuraEnabled
    public Double getNumericValue() {
      return numericValue;
    }

    /**
     * Gets the unit.
     *
     * A string listing the unit of the value that was found in the normalized text.
     *
     * **Note:** The value of `unit` is the [ISO-4217 currency code](https://www.iso.org/iso-4217-currency-codes.html)
     * identified for the currency amount (for example, `USD` or `EUR`). If the service cannot disambiguate a currency
     * symbol (for example, `$` or `£`), the value of `unit` contains the ambiguous symbol as-is.
     *
     * @return the unit
     */
    @AuraEnabled
    public String getUnit() {
      return unit;
    }

    /**
     * Sets the value.
     *
     * @param value the new value
     */
    public void setValue(final String value) {
      this.value = value;
    }

    /**
     * Sets the numericValue.
     *
     * @param numericValue the new numericValue
     */
    public void setNumericValue(final Double numericValue) {
      this.numericValue = numericValue;
    }

    /**
     * Sets the unit.
     *
     * @param unit the new unit
     */
    public void setUnit(final String unit) {
      this.unit = unit;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'numeric_value' => 'numericValue'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Interpretation ret = (Interpretation) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * A key in a key-value pair.
   */
  public class Key extends IBMWatsonGenericModel {
    private String cellId;
    private Location location;
    private String text;

    /**
     * Gets the cellId.
     *
     * The unique ID of the key in the table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text content of the table cell without HTML markup.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
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
        'cell_id' => 'cellId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Key ret = (Key) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Key-value pairs detected across cell boundaries.
   */
  public class KeyValuePair extends IBMWatsonGenericModel {
    private Key key;
    private List<Value> value;

    /**
     * Gets the key.
     *
     * A key in a key-value pair.
     *
     * @return the key
     */
    @AuraEnabled
    public Key getKey() {
      return key;
    }

    /**
     * Gets the value.
     *
     * A list of values in a key-value pair.
     *
     * @return the value
     */
    @AuraEnabled
    public List<Value> getValue() {
      return value;
    }

    /**
     * Sets the key.
     *
     * @param key the new key
     */
    public void setKey(final Key key) {
      this.key = key;
    }

    /**
     * Sets the value.
     *
     * @param value the new value
     */
    public void setValue(final List<Value> value) {
      this.value = value;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      KeyValuePair ret = (KeyValuePair) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for key
      Map<String, Object> keyMap = (Map<String, Object>) jsonMap.get('key');
      Key newKey = (Key) new Key().deserialize(JSON.serialize(keyMap, true), keyMap, Key.class);
      ret.setKey(newKey);

      // calling custom deserializer for value
      List<Value> newValue = new List<Value>();
      List<Value> deserializedValue = ret.getValue();
      if (deserializedValue != null) {
        for (Integer i = 0; i < deserializedValue.size(); i++) {
          Value currentItem = ret.getValue().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('value');
          Value newItem = (Value) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Value.class);
          newValue.add(newItem);
        }
        ret.value = newValue;
      }

      return ret;
    }
  }

  /**
   * A pair of `nature` and `party` objects. The `nature` object identifies the effect of the element on the identified
   * `party`, and the `party` object identifies the affected party.
   */
  public class Label extends IBMWatsonGenericModel {
    private String nature;
    private String party;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Label() { }

    /**
     * Gets the nature.
     *
     * The identified `nature` of the element.
     *
     * @return the nature
     */
    @AuraEnabled
    public String getNature() {
      return nature;
    }

    /**
     * Gets the party.
     *
     * The identified `party` of the element.
     *
     * @return the party
     */
    @AuraEnabled
    public String getParty() {
      return party;
    }
  
    private Label(LabelBuilder builder) {
      IBMWatsonValidator.notNull(builder.nature, 'nature cannot be null');
      IBMWatsonValidator.notNull(builder.party, 'party cannot be null');
      this.nature = builder.nature;
      this.party = builder.party;
    }

    /**
     * New builder.
     *
     * @return a Label builder
     */
    public LabelBuilder newBuilder() {
      return new LabelBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Label ret = (Label) super.deserialize(jsonString, jsonMap, classType);
      LabelBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * Label Builder.
   */
  public class LabelBuilder {
    private String nature;
    private String party;

    private LabelBuilder(Label label) {
      this.nature = label.nature;
      this.party = label.party;
    }

    /**
     * Instantiates a new builder.
     */
    public LabelBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param nature the nature
     * @param party the party
     */
    public LabelBuilder(String nature, String party) {
      this.nature = nature;
      this.party = party;
    }

    /**
     * Builds a Label.
     *
     * @return the label
     */
    public Label build() {
      return new Label(this);
    }

    /**
     * Set the nature.
     *
     * @param nature the nature
     * @return the Label builder
     */
    public LabelBuilder nature(String nature) {
      this.nature = nature;
      return this;
    }

    /**
     * Set the party.
     *
     * @param party the party
     * @return the Label builder
     */
    public LabelBuilder party(String party) {
      this.party = party;
      return this;
    }
  }

  /**
   * The leading sentences in a section or subsection of the input document.
   */
  public class LeadingSentence extends IBMWatsonGenericModel {
    private String text;
    private Location location;
    private List<ElementLocations> elementLocations;

    /**
     * Gets the text.
     *
     * The text of the leading sentence.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the elementLocations.
     *
     * An array of `location` objects that lists the locations of detected leading sentences.
     *
     * @return the elementLocations
     */
    @AuraEnabled
    public List<ElementLocations> getElementLocations() {
      return elementLocations;
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
    public void setLocation(final Location location) {
      this.location = location;
    }

    /**
     * Sets the elementLocations.
     *
     * @param elementLocations the new elementLocations
     */
    public void setElementLocations(final List<ElementLocations> elementLocations) {
      this.elementLocations = elementLocations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'element_locations' => 'elementLocations'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      LeadingSentence ret = (LeadingSentence) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for elementLocations
      List<ElementLocations> newElementLocations = new List<ElementLocations>();
      List<ElementLocations> deserializedElementLocations = ret.getElementLocations();
      if (deserializedElementLocations != null) {
        for (Integer i = 0; i < deserializedElementLocations.size(); i++) {
          ElementLocations currentItem = ret.getElementLocations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('elementLocations');
          ElementLocations newItem = (ElementLocations) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ElementLocations.class);
          newElementLocations.add(newItem);
        }
        ret.elementLocations = newElementLocations;
      }

      return ret;
    }
  }

  /**
   * The listBatches options.
   */
  public class ListBatchesOptions extends IBMWatsonOptionsModel {

    private ListBatchesOptions(ListBatchesOptionsBuilder builder) {
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListBatchesOptions builder
     */
    public ListBatchesOptionsBuilder newBuilder() {
      return new ListBatchesOptionsBuilder(this);
    }
  }

  /**
   * ListBatchesOptions Builder.
   */
  public class ListBatchesOptionsBuilder extends IBMWatsonOptionsModel {

    private ListBatchesOptionsBuilder(ListBatchesOptions listBatchesOptions) {
      this.requestHeaders.putAll(listBatchesOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListBatchesOptionsBuilder() {
    }

    /**
     * Builds a ListBatchesOptions.
     *
     * @return the listBatchesOptions
     */
    public ListBatchesOptions build() {
      return new ListBatchesOptions(this);
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListBatchesOptions builder
     */
    public ListBatchesOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The listFeedback options.
   */
  public class ListFeedbackOptions extends IBMWatsonOptionsModel {
    private String feedbackType;
    private Datetime before;
    private Datetime after;
    private String documentTitle;
    private String modelId;
    private String modelVersion;
    private String categoryRemoved;
    private String categoryAdded;
    private String categoryNotChanged;
    private String typeRemoved;
    private String typeAdded;
    private String typeNotChanged;
    private Long pageLimit;
    private String cursor;
    private String xSort;
    private Boolean includeTotal;

    /**
     * Gets the feedbackType.
     *
     * An optional string that filters the output to include only feedback with the specified feedback type. The only
     * permitted value is `element_classification`.
     *
     * @return the feedbackType
     */
    public String feedbackType() {
      return feedbackType;
    }

    /**
     * Gets the before.
     *
     * An optional string in the format `YYYY-MM-DD` that filters the output to include only feedback that was added
     * before the specified date.
     *
     * @return the before
     */
    public Datetime before() {
      return before;
    }

    /**
     * Gets the after.
     *
     * An optional string in the format `YYYY-MM-DD` that filters the output to include only feedback that was added
     * after the specified date.
     *
     * @return the after
     */
    public Datetime after() {
      return after;
    }

    /**
     * Gets the documentTitle.
     *
     * An optional string that filters the output to include only feedback from the document with the specified
     * `document_title`.
     *
     * @return the documentTitle
     */
    public String documentTitle() {
      return documentTitle;
    }

    /**
     * Gets the modelId.
     *
     * An optional string that filters the output to include only feedback with the specified `model_id`. The only
     * permitted value is `contracts`.
     *
     * @return the modelId
     */
    public String modelId() {
      return modelId;
    }

    /**
     * Gets the modelVersion.
     *
     * An optional string that filters the output to include only feedback with the specified `model_version`.
     *
     * @return the modelVersion
     */
    public String modelVersion() {
      return modelVersion;
    }

    /**
     * Gets the categoryRemoved.
     *
     * An optional string in the form of a comma-separated list of categories. If it is specified, the service filters
     * the output to include only feedback that has at least one category from the list removed.
     *
     * @return the categoryRemoved
     */
    public String categoryRemoved() {
      return categoryRemoved;
    }

    /**
     * Gets the categoryAdded.
     *
     * An optional string in the form of a comma-separated list of categories. If this is specified, the service filters
     * the output to include only feedback that has at least one category from the list added.
     *
     * @return the categoryAdded
     */
    public String categoryAdded() {
      return categoryAdded;
    }

    /**
     * Gets the categoryNotChanged.
     *
     * An optional string in the form of a comma-separated list of categories. If this is specified, the service filters
     * the output to include only feedback that has at least one category from the list unchanged.
     *
     * @return the categoryNotChanged
     */
    public String categoryNotChanged() {
      return categoryNotChanged;
    }

    /**
     * Gets the typeRemoved.
     *
     * An optional string of comma-separated `nature`:`party` pairs. If this is specified, the service filters the
     * output to include only feedback that has at least one `nature`:`party` pair from the list removed.
     *
     * @return the typeRemoved
     */
    public String typeRemoved() {
      return typeRemoved;
    }

    /**
     * Gets the typeAdded.
     *
     * An optional string of comma-separated `nature`:`party` pairs. If this is specified, the service filters the
     * output to include only feedback that has at least one `nature`:`party` pair from the list removed.
     *
     * @return the typeAdded
     */
    public String typeAdded() {
      return typeAdded;
    }

    /**
     * Gets the typeNotChanged.
     *
     * An optional string of comma-separated `nature`:`party` pairs. If this is specified, the service filters the
     * output to include only feedback that has at least one `nature`:`party` pair from the list unchanged.
     *
     * @return the typeNotChanged
     */
    public String typeNotChanged() {
      return typeNotChanged;
    }

    /**
     * Gets the pageLimit.
     *
     * An optional integer specifying the number of documents that you want the service to return.
     *
     * @return the pageLimit
     */
    public Long pageLimit() {
      return pageLimit;
    }

    /**
     * Gets the cursor.
     *
     * An optional string that returns the set of documents after the previous set. Use this parameter with the
     * `page_limit` parameter.
     *
     * @return the cursor
     */
    public String cursor() {
      return cursor;
    }

    /**
     * Gets the xSort.
     *
     * An optional comma-separated list of fields in the document to sort on. You can optionally specify the sort
     * direction by prefixing the value of the field with `-` for descending order or `+` for ascending order (the
     * default). Currently permitted sorting fields are `created`, `user_id`, and `document_title`.
     *
     * @return the xSort
     */
    public String xSort() {
      return xSort;
    }

    /**
     * Gets the includeTotal.
     *
     * An optional boolean value. If specified as `true`, the `pagination` object in the output includes a value called
     * `total` that gives the total count of feedback created.
     *
     * @return the includeTotal
     */
    public Boolean includeTotal() {
      return includeTotal;
    }

    private ListFeedbackOptions(ListFeedbackOptionsBuilder builder) {
      feedbackType = builder.feedbackType;
      before = builder.before;
      after = builder.after;
      documentTitle = builder.documentTitle;
      modelId = builder.modelId;
      modelVersion = builder.modelVersion;
      categoryRemoved = builder.categoryRemoved;
      categoryAdded = builder.categoryAdded;
      categoryNotChanged = builder.categoryNotChanged;
      typeRemoved = builder.typeRemoved;
      typeAdded = builder.typeAdded;
      typeNotChanged = builder.typeNotChanged;
      pageLimit = builder.pageLimit;
      cursor = builder.cursor;
      xSort = builder.xSort;
      includeTotal = builder.includeTotal;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder newBuilder() {
      return new ListFeedbackOptionsBuilder(this);
    }
  }

  /**
   * ListFeedbackOptions Builder.
   */
  public class ListFeedbackOptionsBuilder extends IBMWatsonOptionsModel {
    private String feedbackType;
    private Datetime before;
    private Datetime after;
    private String documentTitle;
    private String modelId;
    private String modelVersion;
    private String categoryRemoved;
    private String categoryAdded;
    private String categoryNotChanged;
    private String typeRemoved;
    private String typeAdded;
    private String typeNotChanged;
    private Long pageLimit;
    private String cursor;
    private String xSort;
    private Boolean includeTotal;

    private ListFeedbackOptionsBuilder(ListFeedbackOptions listFeedbackOptions) {
      feedbackType = listFeedbackOptions.feedbackType;
      before = listFeedbackOptions.before;
      after = listFeedbackOptions.after;
      documentTitle = listFeedbackOptions.documentTitle;
      modelId = listFeedbackOptions.modelId;
      modelVersion = listFeedbackOptions.modelVersion;
      categoryRemoved = listFeedbackOptions.categoryRemoved;
      categoryAdded = listFeedbackOptions.categoryAdded;
      categoryNotChanged = listFeedbackOptions.categoryNotChanged;
      typeRemoved = listFeedbackOptions.typeRemoved;
      typeAdded = listFeedbackOptions.typeAdded;
      typeNotChanged = listFeedbackOptions.typeNotChanged;
      pageLimit = listFeedbackOptions.pageLimit;
      cursor = listFeedbackOptions.cursor;
      xSort = listFeedbackOptions.xSort;
      includeTotal = listFeedbackOptions.includeTotal;
      this.requestHeaders.putAll(listFeedbackOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public ListFeedbackOptionsBuilder() {
    }

    /**
     * Builds a ListFeedbackOptions.
     *
     * @return the listFeedbackOptions
     */
    public ListFeedbackOptions build() {
      return new ListFeedbackOptions(this);
    }

    /**
     * Set the feedbackType.
     *
     * @param feedbackType the feedbackType
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder feedbackType(String feedbackType) {
      this.feedbackType = feedbackType;
      return this;
    }

    /**
     * Set the before.
     *
     * @param before the before
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder before(Datetime before) {
      this.before = before;
      return this;
    }

    /**
     * Set the after.
     *
     * @param after the after
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder after(Datetime after) {
      this.after = after;
      return this;
    }

    /**
     * Set the documentTitle.
     *
     * @param documentTitle the documentTitle
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder documentTitle(String documentTitle) {
      this.documentTitle = documentTitle;
      return this;
    }

    /**
     * Set the modelId.
     *
     * @param modelId the modelId
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder modelId(String modelId) {
      this.modelId = modelId;
      return this;
    }

    /**
     * Set the modelVersion.
     *
     * @param modelVersion the modelVersion
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder modelVersion(String modelVersion) {
      this.modelVersion = modelVersion;
      return this;
    }

    /**
     * Set the categoryRemoved.
     *
     * @param categoryRemoved the categoryRemoved
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder categoryRemoved(String categoryRemoved) {
      this.categoryRemoved = categoryRemoved;
      return this;
    }

    /**
     * Set the categoryAdded.
     *
     * @param categoryAdded the categoryAdded
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder categoryAdded(String categoryAdded) {
      this.categoryAdded = categoryAdded;
      return this;
    }

    /**
     * Set the categoryNotChanged.
     *
     * @param categoryNotChanged the categoryNotChanged
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder categoryNotChanged(String categoryNotChanged) {
      this.categoryNotChanged = categoryNotChanged;
      return this;
    }

    /**
     * Set the typeRemoved.
     *
     * @param typeRemoved the typeRemoved
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder typeRemoved(String typeRemoved) {
      this.typeRemoved = typeRemoved;
      return this;
    }

    /**
     * Set the typeAdded.
     *
     * @param typeAdded the typeAdded
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder typeAdded(String typeAdded) {
      this.typeAdded = typeAdded;
      return this;
    }

    /**
     * Set the typeNotChanged.
     *
     * @param typeNotChanged the typeNotChanged
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder typeNotChanged(String typeNotChanged) {
      this.typeNotChanged = typeNotChanged;
      return this;
    }

    /**
     * Set the pageLimit.
     *
     * @param pageLimit the pageLimit
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder pageLimit(Long pageLimit) {
      this.pageLimit = pageLimit;
      return this;
    }

    /**
     * Set the cursor.
     *
     * @param cursor the cursor
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder cursor(String cursor) {
      this.cursor = cursor;
      return this;
    }

    /**
     * Set the xSort.
     *
     * @param xSort the xSort
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder xSort(String xSort) {
      this.xSort = xSort;
      return this;
    }

    /**
     * Set the includeTotal.
     *
     * @param includeTotal the includeTotal
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder includeTotal(Boolean includeTotal) {
      this.includeTotal = includeTotal;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the ListFeedbackOptions builder
     */
    public ListFeedbackOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
   * `end`.
   */
  public class Location extends IBMWatsonGenericModel {
    private Long xBegin;
    private Long xEnd;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public Location() { }

    /**
     * Gets the xBegin.
     *
     * The element's `begin` index.
     *
     * @return the xBegin
     */
    @AuraEnabled
    public Long getXBegin() {
      return xBegin;
    }

    /**
     * Gets the xEnd.
     *
     * The element's `end` index.
     *
     * @return the xEnd
     */
    @AuraEnabled
    public Long getXEnd() {
      return xEnd;
    }
  
    private Location(LocationBuilder builder) {
      IBMWatsonValidator.notNull(builder.xBegin, 'xBegin cannot be null');
      IBMWatsonValidator.notNull(builder.xEnd, 'xEnd cannot be null');
      this.xBegin = builder.xBegin;
      this.xEnd = builder.xEnd;
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

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'begin' => 'xBegin',
        'end' => 'xEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Location ret = (Location) super.deserialize(jsonString, jsonMap, classType);
      LocationBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'xBegin' => 'begin',
        'xEnd' => 'end'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      return jsonMap;
    }
  }

  /**
   * Location Builder.
   */
  public class LocationBuilder {
    private Long xBegin;
    private Long xEnd;

    private LocationBuilder(Location location) {
      this.xBegin = location.xBegin;
      this.xEnd = location.xEnd;
    }

    /**
     * Instantiates a new builder.
     */
    public LocationBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param xBegin the xBegin
     * @param xEnd the xEnd
     */
    public LocationBuilder(Long xBegin, Long xEnd) {
      this.xBegin = xBegin;
      this.xEnd = xEnd;
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
     * Set the xBegin.
     *
     * @param xBegin the xBegin
     * @return the Location builder
     */
    public LocationBuilder xBegin(Long xBegin) {
      this.xBegin = xBegin;
      return this;
    }

    /**
     * Set the xEnd.
     *
     * @param xEnd the xEnd
     * @return the Location builder
     */
    public LocationBuilder xEnd(Long xEnd) {
      this.xEnd = xEnd;
      return this;
    }
  }

  /**
   * A mention of a party.
   */
  public class Mention extends IBMWatsonGenericModel {
    private String text;
    private Location location;

    /**
     * Gets the text.
     *
     * The name of the party.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
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
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Mention ret = (Mention) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The original labeling from the input document, without the submitted feedback.
   */
  public class OriginalLabelsIn extends IBMWatsonGenericModel {
    private List<TypeLabel> types;
    private List<Category> categories;

    /**
     * Gets the types.
     *
     * Description of the action specified by the element and whom it affects.
     *
     * @return the types
     */
    public List<TypeLabel> getTypes() {
      return types;
    }

    /**
     * Gets the categories.
     *
     * List of functional categories into which the element falls; in other words, the subject matter of the element.
     *
     * @return the categories
     */
    public List<Category> getCategories() {
      return categories;
    }
  
    private OriginalLabelsIn(OriginalLabelsInBuilder builder) {
      IBMWatsonValidator.notNull(builder.types, 'types cannot be null');
      IBMWatsonValidator.notNull(builder.categories, 'categories cannot be null');
      this.types = builder.types;
      this.categories = builder.categories;
    }

    /**
     * New builder.
     *
     * @return a OriginalLabelsIn builder
     */
    public OriginalLabelsInBuilder newBuilder() {
      return new OriginalLabelsInBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for types
      if (types != null) {
        List<Object> typesJsonList = new List<Object>();
        for (TypeLabel listItem : types) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          typesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('types', typesJsonList);
      }

      // performing custom serialization for categories
      if (categories != null) {
        List<Object> categoriesJsonList = new List<Object>();
        for (Category listItem : categories) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          categoriesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('categories', categoriesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * OriginalLabelsIn Builder.
   */
  public class OriginalLabelsInBuilder {
    private List<TypeLabel> types;
    private List<Category> categories;

    private OriginalLabelsInBuilder(OriginalLabelsIn originalLabelsIn) {
      this.types = originalLabelsIn.types;
      this.categories = originalLabelsIn.categories;
    }

    /**
     * Instantiates a new builder.
     */
    public OriginalLabelsInBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param types the types
     * @param categories the categories
     */
    public OriginalLabelsInBuilder(List<TypeLabel> types, List<Category> categories) {
      this.types = types;
      this.categories = categories;
    }

    /**
     * Builds a OriginalLabelsIn.
     *
     * @return the originalLabelsIn
     */
    public OriginalLabelsIn build() {
      return new OriginalLabelsIn(this);
    }

    /**
     * Adds an types to types.
     *
     * @param types the new types
     * @return the OriginalLabelsIn builder
     */
    public OriginalLabelsInBuilder addTypes(TypeLabel types) {
      IBMWatsonValidator.notNull(types, 'types cannot be null');
      if (this.types == null) {
        this.types = new List<TypeLabel>();
      }
      this.types.add(types);
      return this;
    }

    /**
     * Adds an categories to categories.
     *
     * @param categories the new categories
     * @return the OriginalLabelsIn builder
     */
    public OriginalLabelsInBuilder addCategories(Category categories) {
      IBMWatsonValidator.notNull(categories, 'categories cannot be null');
      if (this.categories == null) {
        this.categories = new List<Category>();
      }
      this.categories.add(categories);
      return this;
    }

    /**
     * Set the types.
     * Existing types will be replaced.
     *
     * @param types the types
     * @return the OriginalLabelsIn builder
     */
    public OriginalLabelsInBuilder types(List<TypeLabel> types) {
      this.types = types;
      return this;
    }

    /**
     * Set the categories.
     * Existing categories will be replaced.
     *
     * @param categories the categories
     * @return the OriginalLabelsIn builder
     */
    public OriginalLabelsInBuilder categories(List<Category> categories) {
      this.categories = categories;
      return this;
    }
  }

  /**
   * The original labeling from the input document, without the submitted feedback.
   */
  public class OriginalLabelsOut extends IBMWatsonGenericModel {
    private List<TypeLabel> types;
    private List<Category> categories;
    private String modification;

    /**
     * Gets the types.
     *
     * Description of the action specified by the element and whom it affects.
     *
     * @return the types
     */
    @AuraEnabled
    public List<TypeLabel> getTypes() {
      return types;
    }

    /**
     * Gets the categories.
     *
     * List of functional categories into which the element falls; in other words, the subject matter of the element.
     *
     * @return the categories
     */
    @AuraEnabled
    public List<Category> getCategories() {
      return categories;
    }

    /**
     * Gets the modification.
     *
     * A string identifying the type of modification the feedback entry in the `updated_labels` array. Possible values
     * are `added`, `not_changed`, and `removed`.
     *
     * @return the modification
     */
    @AuraEnabled
    public String getModification() {
      return modification;
    }

    /**
     * Sets the types.
     *
     * @param types the new types
     */
    public void setTypes(final List<TypeLabel> types) {
      this.types = types;
    }

    /**
     * Sets the categories.
     *
     * @param categories the new categories
     */
    public void setCategories(final List<Category> categories) {
      this.categories = categories;
    }

    /**
     * Sets the modification.
     *
     * @param modification the new modification
     */
    public void setModification(final String modification) {
      this.modification = modification;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      OriginalLabelsOut ret = (OriginalLabelsOut) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for types
      List<TypeLabel> newTypes = new List<TypeLabel>();
      List<TypeLabel> deserializedTypes = ret.getTypes();
      if (deserializedTypes != null) {
        for (Integer i = 0; i < deserializedTypes.size(); i++) {
          TypeLabel currentItem = ret.getTypes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('types');
          TypeLabel newItem = (TypeLabel) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TypeLabel.class);
          newTypes.add(newItem);
        }
        ret.types = newTypes;
      }

      // calling custom deserializer for categories
      List<Category> newCategories = new List<Category>();
      List<Category> deserializedCategories = ret.getCategories();
      if (deserializedCategories != null) {
        for (Integer i = 0; i < deserializedCategories.size(); i++) {
          Category currentItem = ret.getCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('categories');
          Category newItem = (Category) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Category.class);
          newCategories.add(newItem);
        }
        ret.categories = newCategories;
      }

      return ret;
    }
  }

  /**
   * Pagination details, if required by the length of the output.
   */
  public class Pagination extends IBMWatsonGenericModel {
    private String refreshCursor;
    private String nextCursor;
    private String refreshUrl;
    private String nextUrl;
    private Long total;

    /**
     * Gets the refreshCursor.
     *
     * A token identifying the current page of results.
     *
     * @return the refreshCursor
     */
    @AuraEnabled
    public String getRefreshCursor() {
      return refreshCursor;
    }

    /**
     * Gets the nextCursor.
     *
     * A token identifying the next page of results.
     *
     * @return the nextCursor
     */
    @AuraEnabled
    public String getNextCursor() {
      return nextCursor;
    }

    /**
     * Gets the refreshUrl.
     *
     * The URL that returns the current page of results.
     *
     * @return the refreshUrl
     */
    @AuraEnabled
    public String getRefreshUrl() {
      return refreshUrl;
    }

    /**
     * Gets the nextUrl.
     *
     * The URL that returns the next page of results.
     *
     * @return the nextUrl
     */
    @AuraEnabled
    public String getNextUrl() {
      return nextUrl;
    }

    /**
     * Gets the total.
     *
     * Reserved for future use.
     *
     * @return the total
     */
    @AuraEnabled
    public Long getTotal() {
      return total;
    }

    /**
     * Sets the refreshCursor.
     *
     * @param refreshCursor the new refreshCursor
     */
    public void setRefreshCursor(final String refreshCursor) {
      this.refreshCursor = refreshCursor;
    }

    /**
     * Sets the nextCursor.
     *
     * @param nextCursor the new nextCursor
     */
    public void setNextCursor(final String nextCursor) {
      this.nextCursor = nextCursor;
    }

    /**
     * Sets the refreshUrl.
     *
     * @param refreshUrl the new refreshUrl
     */
    public void setRefreshUrl(final String refreshUrl) {
      this.refreshUrl = refreshUrl;
    }

    /**
     * Sets the nextUrl.
     *
     * @param nextUrl the new nextUrl
     */
    public void setNextUrl(final String nextUrl) {
      this.nextUrl = nextUrl;
    }

    /**
     * Sets the total.
     *
     * @param total the new total
     */
    public void setTotal(final long total) {
      this.total = total;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'refresh_cursor' => 'refreshCursor',
        'next_cursor' => 'nextCursor',
        'refresh_url' => 'refreshUrl',
        'next_url' => 'nextUrl'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Pagination ret = (Pagination) super.deserialize(jsonString, jsonMap, classType);

      return ret;
    }
  }

  /**
   * The locations of each paragraph in the input document.
   */
  public class Paragraphs extends IBMWatsonGenericModel {
    private Location location;

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Paragraphs ret = (Paragraphs) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * A party and its corresponding role, including address and contact information if identified.
   */
  public class Parties extends IBMWatsonGenericModel {
    private String party;
    private String role;
    private String importance;
    private List<Address> addresses;
    private List<Contact> contacts;
    private List<Mention> mentions;

    /**
     * Gets the party.
     *
     * The normalized form of the party's name.
     *
     * @return the party
     */
    @AuraEnabled
    public String getParty() {
      return party;
    }

    /**
     * Gets the role.
     *
     * A string identifying the party's role.
     *
     * @return the role
     */
    @AuraEnabled
    public String getRole() {
      return role;
    }

    /**
     * Gets the importance.
     *
     * A string that identifies the importance of the party.
     *
     * @return the importance
     */
    @AuraEnabled
    public String getImportance() {
      return importance;
    }

    /**
     * Gets the addresses.
     *
     * A list of the party's address or addresses.
     *
     * @return the addresses
     */
    @AuraEnabled
    public List<Address> getAddresses() {
      return addresses;
    }

    /**
     * Gets the contacts.
     *
     * A list of the names and roles of contacts identified in the input document.
     *
     * @return the contacts
     */
    @AuraEnabled
    public List<Contact> getContacts() {
      return contacts;
    }

    /**
     * Gets the mentions.
     *
     * A list of the party's mentions in the input document.
     *
     * @return the mentions
     */
    @AuraEnabled
    public List<Mention> getMentions() {
      return mentions;
    }

    /**
     * Sets the party.
     *
     * @param party the new party
     */
    public void setParty(final String party) {
      this.party = party;
    }

    /**
     * Sets the role.
     *
     * @param role the new role
     */
    public void setRole(final String role) {
      this.role = role;
    }

    /**
     * Sets the importance.
     *
     * @param importance the new importance
     */
    public void setImportance(final String importance) {
      this.importance = importance;
    }

    /**
     * Sets the addresses.
     *
     * @param addresses the new addresses
     */
    public void setAddresses(final List<Address> addresses) {
      this.addresses = addresses;
    }

    /**
     * Sets the contacts.
     *
     * @param contacts the new contacts
     */
    public void setContacts(final List<Contact> contacts) {
      this.contacts = contacts;
    }

    /**
     * Sets the mentions.
     *
     * @param mentions the new mentions
     */
    public void setMentions(final List<Mention> mentions) {
      this.mentions = mentions;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      Parties ret = (Parties) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for addresses
      List<Address> newAddresses = new List<Address>();
      List<Address> deserializedAddresses = ret.getAddresses();
      if (deserializedAddresses != null) {
        for (Integer i = 0; i < deserializedAddresses.size(); i++) {
          Address currentItem = ret.getAddresses().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('addresses');
          Address newItem = (Address) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Address.class);
          newAddresses.add(newItem);
        }
        ret.addresses = newAddresses;
      }

      // calling custom deserializer for contacts
      List<Contact> newContacts = new List<Contact>();
      List<Contact> deserializedContacts = ret.getContacts();
      if (deserializedContacts != null) {
        for (Integer i = 0; i < deserializedContacts.size(); i++) {
          Contact currentItem = ret.getContacts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('contacts');
          Contact newItem = (Contact) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Contact.class);
          newContacts.add(newItem);
        }
        ret.contacts = newContacts;
      }

      // calling custom deserializer for mentions
      List<Mention> newMentions = new List<Mention>();
      List<Mention> deserializedMentions = ret.getMentions();
      if (deserializedMentions != null) {
        for (Integer i = 0; i < deserializedMentions.size(); i++) {
          Mention currentItem = ret.getMentions().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('mentions');
          Mention newItem = (Mention) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Mention.class);
          newMentions.add(newItem);
        }
        ret.mentions = newMentions;
      }

      return ret;
    }
  }

  /**
   * The document's payment duration or durations.
   */
  public class PaymentTerms extends IBMWatsonGenericModel {
    private String confidenceLevel;
    private String text;
    private String textNormalized;
    private Interpretation interpretation;
    private List<String> provenanceIds;
    private Location location;

    /**
     * Gets the confidenceLevel.
     *
     * The confidence level in the identification of the payment term.
     *
     * @return the confidenceLevel
     */
    @AuraEnabled
    public String getConfidenceLevel() {
      return confidenceLevel;
    }

    /**
     * Gets the text.
     *
     * The payment term (duration).
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * The normalized form of the payment term, which is listed as a string. This element is optional; it is returned
     * only if normalized text exists.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the interpretation.
     *
     * The details of the normalized text, if applicable. This element is optional; it is returned only if normalized
     * text exists.
     *
     * @return the interpretation
     */
    @AuraEnabled
    public Interpretation getInterpretation() {
      return interpretation;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the confidenceLevel.
     *
     * @param confidenceLevel the new confidenceLevel
     */
    public void setConfidenceLevel(final String confidenceLevel) {
      this.confidenceLevel = confidenceLevel;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the interpretation.
     *
     * @param interpretation the new interpretation
     */
    public void setInterpretation(final Interpretation interpretation) {
      this.interpretation = interpretation;
    }

    /**
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'confidence_level' => 'confidenceLevel',
        'text_normalized' => 'textNormalized',
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      PaymentTerms ret = (PaymentTerms) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for interpretation
      Map<String, Object> interpretationMap = (Map<String, Object>) jsonMap.get('interpretation');
      Interpretation newInterpretation = (Interpretation) new Interpretation().deserialize(JSON.serialize(interpretationMap, true), interpretationMap, Interpretation.class);
      ret.setInterpretation(newInterpretation);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Row-level cells, each applicable as a header to other cells in the same row as itself, of the current table.
   */
  public class RowHeaders extends IBMWatsonGenericModel {
    private String cellId;
    private Location location;
    private String text;
    private String textNormalized;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of this cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * If you provide customization input, the normalized version of the cell text according to the customization;
     * otherwise, the same value as `text`.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'text_normalized' => 'textNormalized',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      RowHeaders ret = (RowHeaders) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The table's section title, if identified.
   */
  public class SectionTitle extends IBMWatsonGenericModel {
    private String text;
    private Location location;

    /**
     * Gets the text.
     *
     * The text of the section title, if identified.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
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
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      SectionTitle ret = (SectionTitle) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * An array containing one object per section or subsection detected in the input document. Sections and subsections
   * are not nested; instead, they are flattened out and can be placed back in order by using the `begin` and `end`
   * values of the element and the `level` value of the section.
   */
  public class SectionTitles extends IBMWatsonGenericModel {
    private String text;
    private Location location;
    private Long level;
    private List<ElementLocations> elementLocations;

    /**
     * Gets the text.
     *
     * The text of the section title, if identified.
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
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the level.
     *
     * An integer indicating the level at which the section is located in the input document. For example, `1`
     * represents a top-level section, `2` represents a subsection within the level `1` section, and so forth.
     *
     * @return the level
     */
    @AuraEnabled
    public Long getLevel() {
      return level;
    }

    /**
     * Gets the elementLocations.
     *
     * An array of `location` objects that lists the locations of detected section titles.
     *
     * @return the elementLocations
     */
    @AuraEnabled
    public List<ElementLocations> getElementLocations() {
      return elementLocations;
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
    public void setLocation(final Location location) {
      this.location = location;
    }

    /**
     * Sets the level.
     *
     * @param level the new level
     */
    public void setLevel(final long level) {
      this.level = level;
    }

    /**
     * Sets the elementLocations.
     *
     * @param elementLocations the new elementLocations
     */
    public void setElementLocations(final List<ElementLocations> elementLocations) {
      this.elementLocations = elementLocations;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'element_locations' => 'elementLocations'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      SectionTitles ret = (SectionTitles) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for elementLocations
      List<ElementLocations> newElementLocations = new List<ElementLocations>();
      List<ElementLocations> deserializedElementLocations = ret.getElementLocations();
      if (deserializedElementLocations != null) {
        for (Integer i = 0; i < deserializedElementLocations.size(); i++) {
          ElementLocations currentItem = ret.getElementLocations().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('elementLocations');
          ElementLocations newItem = (ElementLocations) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ElementLocations.class);
          newElementLocations.add(newItem);
        }
        ret.elementLocations = newElementLocations;
      }

      return ret;
    }
  }

  /**
   * Brief information about the input document.
   */
  public class ShortDoc extends IBMWatsonGenericModel {
    private String title;
    private String hash;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public ShortDoc() { }

    /**
     * Gets the title.
     *
     * The title of the input document, if identified.
     *
     * @return the title
     */
    @AuraEnabled
    public String getTitle() {
      return title;
    }

    /**
     * Gets the hash.
     *
     * The MD5 hash of the input document.
     *
     * @return the hash
     */
    @AuraEnabled
    public String getHash() {
      return hash;
    }
  
    private ShortDoc(ShortDocBuilder builder) {
      this.title = builder.title;
      this.hash = builder.hash;
    }

    /**
     * New builder.
     *
     * @return a ShortDoc builder
     */
    public ShortDocBuilder newBuilder() {
      return new ShortDocBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      ShortDoc ret = (ShortDoc) super.deserialize(jsonString, jsonMap, classType);
      ShortDocBuilder retBuilder = ret.newBuilder();

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      return jsonMap;
    }
  }

  /**
   * ShortDoc Builder.
   */
  public class ShortDocBuilder {
    private String title;
    private String hash;

    private ShortDocBuilder(ShortDoc shortDoc) {
      this.title = shortDoc.title;
      this.hash = shortDoc.hash;
    }

    /**
     * Instantiates a new builder.
     */
    public ShortDocBuilder() {
    }

    /**
     * Builds a ShortDoc.
     *
     * @return the shortDoc
     */
    public ShortDoc build() {
      return new ShortDoc(this);
    }

    /**
     * Set the title.
     *
     * @param title the title
     * @return the ShortDoc builder
     */
    public ShortDocBuilder title(String title) {
      this.title = title;
      return this;
    }

    /**
     * Set the hash.
     *
     * @param hash the hash
     * @return the ShortDoc builder
     */
    public ShortDocBuilder hash(String hash) {
      this.hash = hash;
      return this;
    }
  }

  /**
   * The contents of the current table's header.
   */
  public class TableHeaders extends IBMWatsonGenericModel {
    private String cellId;
    private IBMWatsonMapModel location;
    private String text;
    private Long rowIndexBegin;
    private Long rowIndexEnd;
    private Long columnIndexBegin;
    private Long columnIndexEnd;

    /**
     * Gets the cellId.
     *
     * The unique ID of the cell in the current table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The location of the table header cell in the current table as defined by its `begin` and `end` offsets,
     * respectfully, in the input document.
     *
     * @return the location
     */
    @AuraEnabled
    public IBMWatsonMapModel getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of the cell from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the rowIndexBegin.
     *
     * The `begin` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexBegin
     */
    @AuraEnabled
    public Long getRowIndexBegin() {
      return rowIndexBegin;
    }

    /**
     * Gets the rowIndexEnd.
     *
     * The `end` index of this cell's `row` location in the current table.
     *
     * @return the rowIndexEnd
     */
    @AuraEnabled
    public Long getRowIndexEnd() {
      return rowIndexEnd;
    }

    /**
     * Gets the columnIndexBegin.
     *
     * The `begin` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexBegin
     */
    @AuraEnabled
    public Long getColumnIndexBegin() {
      return columnIndexBegin;
    }

    /**
     * Gets the columnIndexEnd.
     *
     * The `end` index of this cell's `column` location in the current table.
     *
     * @return the columnIndexEnd
     */
    @AuraEnabled
    public Long getColumnIndexEnd() {
      return columnIndexEnd;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final IBMWatsonMapModel location) {
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

    /**
     * Sets the rowIndexBegin.
     *
     * @param rowIndexBegin the new rowIndexBegin
     */
    public void setRowIndexBegin(final long rowIndexBegin) {
      this.rowIndexBegin = rowIndexBegin;
    }

    /**
     * Sets the rowIndexEnd.
     *
     * @param rowIndexEnd the new rowIndexEnd
     */
    public void setRowIndexEnd(final long rowIndexEnd) {
      this.rowIndexEnd = rowIndexEnd;
    }

    /**
     * Sets the columnIndexBegin.
     *
     * @param columnIndexBegin the new columnIndexBegin
     */
    public void setColumnIndexBegin(final long columnIndexBegin) {
      this.columnIndexBegin = columnIndexBegin;
    }

    /**
     * Sets the columnIndexEnd.
     *
     * @param columnIndexEnd the new columnIndexEnd
     */
    public void setColumnIndexEnd(final long columnIndexEnd) {
      this.columnIndexEnd = columnIndexEnd;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'cell_id' => 'cellId',
        'row_index_begin' => 'rowIndexBegin',
        'row_index_end' => 'rowIndexEnd',
        'column_index_begin' => 'columnIndexBegin',
        'column_index_end' => 'columnIndexEnd'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableHeaders ret = (TableHeaders) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      IBMWatsonMapModel newLocation = (IBMWatsonMapModel) new IBMWatsonMapModel().deserialize(JSON.serialize(locationMap, true), locationMap, IBMWatsonMapModel.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The analysis of the document's tables.
   */
  public class TableReturn extends IBMWatsonResponseModel {
    private DocInfo document;
    private String modelId;
    private String modelVersion;
    private List<Tables> tables;

    /**
     * Gets the document.
     *
     * Information about the parsed input document.
     *
     * @return the document
     */
    @AuraEnabled
    public DocInfo getDocument() {
      return document;
    }

    /**
     * Gets the modelId.
     *
     * The ID of the model used to extract the table contents. The value for table extraction is `tables`.
     *
     * @return the modelId
     */
    @AuraEnabled
    public String getModelId() {
      return modelId;
    }

    /**
     * Gets the modelVersion.
     *
     * The version of the `tables` model ID.
     *
     * @return the modelVersion
     */
    @AuraEnabled
    public String getModelVersion() {
      return modelVersion;
    }

    /**
     * Gets the tables.
     *
     * Definitions of the tables identified in the input document.
     *
     * @return the tables
     */
    @AuraEnabled
    public List<Tables> getTables() {
      return tables;
    }

    /**
     * Sets the document.
     *
     * @param document the new document
     */
    public void setDocument(final DocInfo document) {
      this.document = document;
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
     * Sets the modelVersion.
     *
     * @param modelVersion the new modelVersion
     */
    public void setModelVersion(final String modelVersion) {
      this.modelVersion = modelVersion;
    }

    /**
     * Sets the tables.
     *
     * @param tables the new tables
     */
    public void setTables(final List<Tables> tables) {
      this.tables = tables;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'model_id' => 'modelId',
        'model_version' => 'modelVersion'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TableReturn ret = (TableReturn) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for document
      Map<String, Object> documentMap = (Map<String, Object>) jsonMap.get('document');
      DocInfo newDocument = (DocInfo) new DocInfo().deserialize(JSON.serialize(documentMap, true), documentMap, DocInfo.class);
      ret.setDocument(newDocument);

      // calling custom deserializer for tables
      List<Tables> newTables = new List<Tables>();
      List<Tables> deserializedTables = ret.getTables();
      if (deserializedTables != null) {
        for (Integer i = 0; i < deserializedTables.size(); i++) {
          Tables currentItem = ret.getTables().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tables');
          Tables newItem = (Tables) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Tables.class);
          newTables.add(newItem);
        }
        ret.tables = newTables;
      }

      return ret;
    }
  }

  /**
   * If identified, the title or caption of the current table of the form `Table x.: ...`. Empty when no title is
   * identified. When exposed, the `title` is also excluded from the `contexts` array of the same table.
   */
  public class TableTitle extends IBMWatsonGenericModel {
    private Location location;
    private String text;

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text of the identified table title or caption.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
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

      TableTitle ret = (TableTitle) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * The contents of the tables extracted from a document.
   */
  public class Tables extends IBMWatsonGenericModel {
    private Location location;
    private String text;
    private SectionTitle sectionTitle;
    private TableTitle title;
    private List<TableHeaders> tableHeaders;
    private List<RowHeaders> rowHeaders;
    private List<ColumnHeaders> columnHeaders;
    private List<BodyCells> bodyCells;
    private List<Contexts> contexts;
    private List<KeyValuePair> keyValuePairs;

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The textual contents of the current table from the input document without associated markup content.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the sectionTitle.
     *
     * The table's section title, if identified.
     *
     * @return the sectionTitle
     */
    @AuraEnabled
    public SectionTitle getSectionTitle() {
      return sectionTitle;
    }

    /**
     * Gets the title.
     *
     * If identified, the title or caption of the current table of the form `Table x.: ...`. Empty when no title is
     * identified. When exposed, the `title` is also excluded from the `contexts` array of the same table.
     *
     * @return the title
     */
    @AuraEnabled
    public TableTitle getTitle() {
      return title;
    }

    /**
     * Gets the tableHeaders.
     *
     * An array of table-level cells that apply as headers to all the other cells in the current table.
     *
     * @return the tableHeaders
     */
    @AuraEnabled
    public List<TableHeaders> getTableHeaders() {
      return tableHeaders;
    }

    /**
     * Gets the rowHeaders.
     *
     * An array of row-level cells, each applicable as a header to other cells in the same row as itself, of the current
     * table.
     *
     * @return the rowHeaders
     */
    @AuraEnabled
    public List<RowHeaders> getRowHeaders() {
      return rowHeaders;
    }

    /**
     * Gets the columnHeaders.
     *
     * An array of column-level cells, each applicable as a header to other cells in the same column as itself, of the
     * current table.
     *
     * @return the columnHeaders
     */
    @AuraEnabled
    public List<ColumnHeaders> getColumnHeaders() {
      return columnHeaders;
    }

    /**
     * Gets the bodyCells.
     *
     * An array of cells that are neither table header nor column header nor row header cells, of the current table with
     * corresponding row and column header associations.
     *
     * @return the bodyCells
     */
    @AuraEnabled
    public List<BodyCells> getBodyCells() {
      return bodyCells;
    }

    /**
     * Gets the contexts.
     *
     * An array of objects that list text that is related to the table contents and that precedes or follows the current
     * table.
     *
     * @return the contexts
     */
    @AuraEnabled
    public List<Contexts> getContexts() {
      return contexts;
    }

    /**
     * Gets the keyValuePairs.
     *
     * An array of key-value pairs identified in the current table.
     *
     * @return the keyValuePairs
     */
    @AuraEnabled
    public List<KeyValuePair> getKeyValuePairs() {
      return keyValuePairs;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the sectionTitle.
     *
     * @param sectionTitle the new sectionTitle
     */
    public void setSectionTitle(final SectionTitle sectionTitle) {
      this.sectionTitle = sectionTitle;
    }

    /**
     * Sets the title.
     *
     * @param title the new title
     */
    public void setTitle(final TableTitle title) {
      this.title = title;
    }

    /**
     * Sets the tableHeaders.
     *
     * @param tableHeaders the new tableHeaders
     */
    public void setTableHeaders(final List<TableHeaders> tableHeaders) {
      this.tableHeaders = tableHeaders;
    }

    /**
     * Sets the rowHeaders.
     *
     * @param rowHeaders the new rowHeaders
     */
    public void setRowHeaders(final List<RowHeaders> rowHeaders) {
      this.rowHeaders = rowHeaders;
    }

    /**
     * Sets the columnHeaders.
     *
     * @param columnHeaders the new columnHeaders
     */
    public void setColumnHeaders(final List<ColumnHeaders> columnHeaders) {
      this.columnHeaders = columnHeaders;
    }

    /**
     * Sets the bodyCells.
     *
     * @param bodyCells the new bodyCells
     */
    public void setBodyCells(final List<BodyCells> bodyCells) {
      this.bodyCells = bodyCells;
    }

    /**
     * Sets the contexts.
     *
     * @param contexts the new contexts
     */
    public void setContexts(final List<Contexts> contexts) {
      this.contexts = contexts;
    }

    /**
     * Sets the keyValuePairs.
     *
     * @param keyValuePairs the new keyValuePairs
     */
    public void setKeyValuePairs(final List<KeyValuePair> keyValuePairs) {
      this.keyValuePairs = keyValuePairs;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'section_title' => 'sectionTitle',
        'table_headers' => 'tableHeaders',
        'row_headers' => 'rowHeaders',
        'column_headers' => 'columnHeaders',
        'body_cells' => 'bodyCells',
        'key_value_pairs' => 'keyValuePairs'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Tables ret = (Tables) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for sectionTitle
      Map<String, Object> sectionTitleMap = (Map<String, Object>) jsonMap.get('sectionTitle');
      SectionTitle newSectionTitle = (SectionTitle) new SectionTitle().deserialize(JSON.serialize(sectionTitleMap, true), sectionTitleMap, SectionTitle.class);
      ret.setSectionTitle(newSectionTitle);

      // calling custom deserializer for title
      Map<String, Object> titleMap = (Map<String, Object>) jsonMap.get('title');
      TableTitle newTitle = (TableTitle) new TableTitle().deserialize(JSON.serialize(titleMap, true), titleMap, TableTitle.class);
      ret.setTitle(newTitle);

      // calling custom deserializer for tableHeaders
      List<TableHeaders> newTableHeaders = new List<TableHeaders>();
      List<TableHeaders> deserializedTableHeaders = ret.getTableHeaders();
      if (deserializedTableHeaders != null) {
        for (Integer i = 0; i < deserializedTableHeaders.size(); i++) {
          TableHeaders currentItem = ret.getTableHeaders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('tableHeaders');
          TableHeaders newItem = (TableHeaders) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TableHeaders.class);
          newTableHeaders.add(newItem);
        }
        ret.tableHeaders = newTableHeaders;
      }

      // calling custom deserializer for rowHeaders
      List<RowHeaders> newRowHeaders = new List<RowHeaders>();
      List<RowHeaders> deserializedRowHeaders = ret.getRowHeaders();
      if (deserializedRowHeaders != null) {
        for (Integer i = 0; i < deserializedRowHeaders.size(); i++) {
          RowHeaders currentItem = ret.getRowHeaders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('rowHeaders');
          RowHeaders newItem = (RowHeaders) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), RowHeaders.class);
          newRowHeaders.add(newItem);
        }
        ret.rowHeaders = newRowHeaders;
      }

      // calling custom deserializer for columnHeaders
      List<ColumnHeaders> newColumnHeaders = new List<ColumnHeaders>();
      List<ColumnHeaders> deserializedColumnHeaders = ret.getColumnHeaders();
      if (deserializedColumnHeaders != null) {
        for (Integer i = 0; i < deserializedColumnHeaders.size(); i++) {
          ColumnHeaders currentItem = ret.getColumnHeaders().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('columnHeaders');
          ColumnHeaders newItem = (ColumnHeaders) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), ColumnHeaders.class);
          newColumnHeaders.add(newItem);
        }
        ret.columnHeaders = newColumnHeaders;
      }

      // calling custom deserializer for bodyCells
      List<BodyCells> newBodyCells = new List<BodyCells>();
      List<BodyCells> deserializedBodyCells = ret.getBodyCells();
      if (deserializedBodyCells != null) {
        for (Integer i = 0; i < deserializedBodyCells.size(); i++) {
          BodyCells currentItem = ret.getBodyCells().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('bodyCells');
          BodyCells newItem = (BodyCells) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), BodyCells.class);
          newBodyCells.add(newItem);
        }
        ret.bodyCells = newBodyCells;
      }

      // calling custom deserializer for contexts
      List<Contexts> newContexts = new List<Contexts>();
      List<Contexts> deserializedContexts = ret.getContexts();
      if (deserializedContexts != null) {
        for (Integer i = 0; i < deserializedContexts.size(); i++) {
          Contexts currentItem = ret.getContexts().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('contexts');
          Contexts newItem = (Contexts) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Contexts.class);
          newContexts.add(newItem);
        }
        ret.contexts = newContexts;
      }

      // calling custom deserializer for keyValuePairs
      List<KeyValuePair> newKeyValuePairs = new List<KeyValuePair>();
      List<KeyValuePair> deserializedKeyValuePairs = ret.getKeyValuePairs();
      if (deserializedKeyValuePairs != null) {
        for (Integer i = 0; i < deserializedKeyValuePairs.size(); i++) {
          KeyValuePair currentItem = ret.getKeyValuePairs().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('keyValuePairs');
          KeyValuePair newItem = (KeyValuePair) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), KeyValuePair.class);
          newKeyValuePairs.add(newItem);
        }
        ret.keyValuePairs = newKeyValuePairs;
      }

      return ret;
    }
  }

  /**
   * Termination dates identified in the input document.
   */
  public class TerminationDates extends IBMWatsonGenericModel {
    private String confidenceLevel;
    private String text;
    private String textNormalized;
    private List<String> provenanceIds;
    private Location location;

    /**
     * Gets the confidenceLevel.
     *
     * The confidence level in the identification of the termination date.
     *
     * @return the confidenceLevel
     */
    @AuraEnabled
    public String getConfidenceLevel() {
      return confidenceLevel;
    }

    /**
     * Gets the text.
     *
     * The termination date.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the textNormalized.
     *
     * The normalized form of the termination date, which is listed as a string. This element is optional; it is
     * returned only if normalized text exists.
     *
     * @return the textNormalized
     */
    @AuraEnabled
    public String getTextNormalized() {
      return textNormalized;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Sets the confidenceLevel.
     *
     * @param confidenceLevel the new confidenceLevel
     */
    public void setConfidenceLevel(final String confidenceLevel) {
      this.confidenceLevel = confidenceLevel;
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
     * Sets the textNormalized.
     *
     * @param textNormalized the new textNormalized
     */
    public void setTextNormalized(final String textNormalized) {
      this.textNormalized = textNormalized;
    }

    /**
     * Sets the provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     */
    public void setProvenanceIds(final List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
    }

    /**
     * Sets the location.
     *
     * @param location the new location
     */
    public void setLocation(final Location location) {
      this.location = location;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'confidence_level' => 'confidenceLevel',
        'text_normalized' => 'textNormalized',
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TerminationDates ret = (TerminationDates) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

  /**
   * Identification of a specific type.
   */
  public class TypeLabel extends IBMWatsonGenericModel {
    private Label label;
    private List<String> provenanceIds;

    /**
     * This constructor is strictly for internal serialization/deserialization purposes
     * and should not be called by the client.
     */
    public TypeLabel() { }

    /**
     * Gets the label.
     *
     * A pair of `nature` and `party` objects. The `nature` object identifies the effect of the element on the
     * identified `party`, and the `party` object identifies the affected party.
     *
     * @return the label
     */
    @AuraEnabled
    public Label getLabel() {
      return label;
    }

    /**
     * Gets the provenanceIds.
     *
     * Hashed values that you can send to IBM to provide feedback or receive support.
     *
     * @return the provenanceIds
     */
    @AuraEnabled
    public List<String> getProvenanceIds() {
      return provenanceIds;
    }
  
    private TypeLabel(TypeLabelBuilder builder) {
      this.label = builder.label;
      this.provenanceIds = builder.provenanceIds;
    }

    /**
     * New builder.
     *
     * @return a TypeLabel builder
     */
    public TypeLabelBuilder newBuilder() {
      return new TypeLabelBuilder(this);
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'provenance_ids' => 'provenanceIds'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      TypeLabel ret = (TypeLabel) super.deserialize(jsonString, jsonMap, classType);
      TypeLabelBuilder retBuilder = ret.newBuilder();

      // calling custom deserializer for label
      Map<String, Object> labelMap = (Map<String, Object>) jsonMap.get('label');
      Label newLabel = (Label) new Label().deserialize(JSON.serialize(labelMap, true), labelMap, Label.class);
      retBuilder.label(newLabel);

      return retBuilder.build();
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // remove headers if there are any
      jsonMap.remove('headers');

      // replace any names that are different between the SDK and API
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'provenanceIds' => 'provenance_ids'
      };
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      // performing custom serialization for label
      if (label != null) {
        String labelJsonString = JSON.serialize(label.replacePropertyNames(), true);
        String labelKey = 'label';
        if (propertyNameMapping.containsKey(labelKey)) {
          labelKey = propertyNameMapping.get(labelKey);
        }
        jsonMap.put(labelKey, JSON.deserializeUntyped(labelJsonString));
      }

      return jsonMap;
    }
  }

  /**
   * TypeLabel Builder.
   */
  public class TypeLabelBuilder {
    private Label label;
    private List<String> provenanceIds;

    private TypeLabelBuilder(TypeLabel typeLabel) {
      this.label = typeLabel.label;
      this.provenanceIds = typeLabel.provenanceIds;
    }

    /**
     * Instantiates a new builder.
     */
    public TypeLabelBuilder() {
    }

    /**
     * Builds a TypeLabel.
     *
     * @return the typeLabel
     */
    public TypeLabel build() {
      return new TypeLabel(this);
    }

    /**
     * Adds an provenanceIds to provenanceIds.
     *
     * @param provenanceIds the new provenanceIds
     * @return the TypeLabel builder
     */
    public TypeLabelBuilder addProvenanceIds(String provenanceIds) {
      IBMWatsonValidator.notNull(provenanceIds, 'provenanceIds cannot be null');
      if (this.provenanceIds == null) {
        this.provenanceIds = new List<String>();
      }
      this.provenanceIds.add(provenanceIds);
      return this;
    }

    /**
     * Set the label.
     *
     * @param label the label
     * @return the TypeLabel builder
     */
    public TypeLabelBuilder label(Label label) {
      this.label = label;
      return this;
    }

    /**
     * Set the provenanceIds.
     * Existing provenanceIds will be replaced.
     *
     * @param provenanceIds the provenanceIds
     * @return the TypeLabel builder
     */
    public TypeLabelBuilder provenanceIds(List<String> provenanceIds) {
      this.provenanceIds = provenanceIds;
      return this;
    }
  }

  /**
   * Identification of a specific type.
   */
  public class TypeLabelComparison extends IBMWatsonGenericModel {
    private Label label;

    /**
     * Gets the label.
     *
     * A pair of `nature` and `party` objects. The `nature` object identifies the effect of the element on the
     * identified `party`, and the `party` object identifies the affected party.
     *
     * @return the label
     */
    @AuraEnabled
    public Label getLabel() {
      return label;
    }

    /**
     * Sets the label.
     *
     * @param label the new label
     */
    public void setLabel(final Label label) {
      this.label = label;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      TypeLabelComparison ret = (TypeLabelComparison) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for label
      Map<String, Object> labelMap = (Map<String, Object>) jsonMap.get('label');
      Label newLabel = (Label) new Label().deserialize(JSON.serialize(labelMap, true), labelMap, Label.class);
      ret.setLabel(newLabel);

      return ret;
    }
  }

  /**
   * Element that does not align semantically between two compared documents.
   */
  public class UnalignedElement extends IBMWatsonGenericModel {
    private String documentLabel;
    private Location location;
    private String text;
    private List<TypeLabelComparison> types;
    private List<CategoryComparison> categories;
    private List<Attribute> attributes;

    /**
     * Gets the documentLabel.
     *
     * The label assigned to the document by the value of the `file_1_label` or `file_2_label` parameters on the
     * **Compare two documents** method.
     *
     * @return the documentLabel
     */
    @AuraEnabled
    public String getDocumentLabel() {
      return documentLabel;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text of the element.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Gets the types.
     *
     * Description of the action specified by the element and whom it affects.
     *
     * @return the types
     */
    @AuraEnabled
    public List<TypeLabelComparison> getTypes() {
      return types;
    }

    /**
     * Gets the categories.
     *
     * List of functional categories into which the element falls; in other words, the subject matter of the element.
     *
     * @return the categories
     */
    @AuraEnabled
    public List<CategoryComparison> getCategories() {
      return categories;
    }

    /**
     * Gets the attributes.
     *
     * List of document attributes.
     *
     * @return the attributes
     */
    @AuraEnabled
    public List<Attribute> getAttributes() {
      return attributes;
    }

    /**
     * Sets the documentLabel.
     *
     * @param documentLabel the new documentLabel
     */
    public void setDocumentLabel(final String documentLabel) {
      this.documentLabel = documentLabel;
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
     * Sets the text.
     *
     * @param text the new text
     */
    public void setText(final String text) {
      this.text = text;
    }

    /**
     * Sets the types.
     *
     * @param types the new types
     */
    public void setTypes(final List<TypeLabelComparison> types) {
      this.types = types;
    }

    /**
     * Sets the categories.
     *
     * @param categories the new categories
     */
    public void setCategories(final List<CategoryComparison> categories) {
      this.categories = categories;
    }

    /**
     * Sets the attributes.
     *
     * @param attributes the new attributes
     */
    public void setAttributes(final List<Attribute> attributes) {
      this.attributes = attributes;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      // replace any names that are different between the API and SDK
      Map<String, String> propertyNameMapping = new Map<String, String> {
        'document_label' => 'documentLabel'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      UnalignedElement ret = (UnalignedElement) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      // calling custom deserializer for types
      List<TypeLabelComparison> newTypes = new List<TypeLabelComparison>();
      List<TypeLabelComparison> deserializedTypes = ret.getTypes();
      if (deserializedTypes != null) {
        for (Integer i = 0; i < deserializedTypes.size(); i++) {
          TypeLabelComparison currentItem = ret.getTypes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('types');
          TypeLabelComparison newItem = (TypeLabelComparison) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TypeLabelComparison.class);
          newTypes.add(newItem);
        }
        ret.types = newTypes;
      }

      // calling custom deserializer for categories
      List<CategoryComparison> newCategories = new List<CategoryComparison>();
      List<CategoryComparison> deserializedCategories = ret.getCategories();
      if (deserializedCategories != null) {
        for (Integer i = 0; i < deserializedCategories.size(); i++) {
          CategoryComparison currentItem = ret.getCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('categories');
          CategoryComparison newItem = (CategoryComparison) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), CategoryComparison.class);
          newCategories.add(newItem);
        }
        ret.categories = newCategories;
      }

      // calling custom deserializer for attributes
      List<Attribute> newAttributes = new List<Attribute>();
      List<Attribute> deserializedAttributes = ret.getAttributes();
      if (deserializedAttributes != null) {
        for (Integer i = 0; i < deserializedAttributes.size(); i++) {
          Attribute currentItem = ret.getAttributes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('attributes');
          Attribute newItem = (Attribute) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Attribute.class);
          newAttributes.add(newItem);
        }
        ret.attributes = newAttributes;
      }

      return ret;
    }
  }

  /**
   * The updateBatch options.
   */
  public class UpdateBatchOptions extends IBMWatsonOptionsModel {
    private String batchId;
    private String action;
    private String model;

    /**
     * Gets the batchId.
     *
     * The ID of the batch-processing job you want to update.
     *
     * @return the batchId
     */
    public String batchId() {
      return batchId;
    }

    /**
     * Gets the action.
     *
     * The action you want to perform on the specified batch-processing job.
     *
     * @return the action
     */
    public String action() {
      return action;
    }

    /**
     * Gets the model.
     *
     * The analysis model to be used by the service. For the **Element classification** and **Compare two documents**
     * methods, the default is `contracts`. For the **Extract tables** method, the default is `tables`. These defaults
     * apply to the standalone methods as well as to the methods' use in batch-processing requests.
     *
     * @return the model
     */
    public String model() {
      return model;
    }

    private UpdateBatchOptions(UpdateBatchOptionsBuilder builder) {
      IBMWatsonValidator.notEmpty(builder.batchId, 'batchId cannot be empty');
      IBMWatsonValidator.notNull(builder.action, 'action cannot be null');
      batchId = builder.batchId;
      action = builder.action;
      model = builder.model;
      this.requestHeaders = builder.requestHeaders;
    }

    /**
     * New builder.
     *
     * @return a UpdateBatchOptions builder
     */
    public UpdateBatchOptionsBuilder newBuilder() {
      return new UpdateBatchOptionsBuilder(this);
    }
  }

  /**
   * UpdateBatchOptions Builder.
   */
  public class UpdateBatchOptionsBuilder extends IBMWatsonOptionsModel {
    private String batchId;
    private String action;
    private String model;

    private UpdateBatchOptionsBuilder(UpdateBatchOptions updateBatchOptions) {
      batchId = updateBatchOptions.batchId;
      action = updateBatchOptions.action;
      model = updateBatchOptions.model;
      this.requestHeaders.putAll(updateBatchOptions.requestHeaders());
    }

    /**
     * Instantiates a new builder.
     */
    public UpdateBatchOptionsBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param batchId the batchId
     * @param action the action
     */
    public UpdateBatchOptionsBuilder(String batchId, String action) {
      this.batchId = batchId;
      this.action = action;
    }

    /**
     * Builds a UpdateBatchOptions.
     *
     * @return the updateBatchOptions
     */
    public UpdateBatchOptions build() {
      return new UpdateBatchOptions(this);
    }

    /**
     * Set the batchId.
     *
     * @param batchId the batchId
     * @return the UpdateBatchOptions builder
     */
    public UpdateBatchOptionsBuilder batchId(String batchId) {
      this.batchId = batchId;
      return this;
    }

    /**
     * Set the action.
     *
     * @param action the action
     * @return the UpdateBatchOptions builder
     */
    public UpdateBatchOptionsBuilder action(String action) {
      this.action = action;
      return this;
    }

    /**
     * Set the model.
     *
     * @param model the model
     * @return the UpdateBatchOptions builder
     */
    public UpdateBatchOptionsBuilder model(String model) {
      this.model = model;
      return this;
    }

    /**
     * Add a request header.
     *
     * @param name the header name
     * @param value the header value
     * @return the UpdateBatchOptions builder
     */
    public UpdateBatchOptionsBuilder addHeader(String name, String value) {
      this.requestHeaders.put(name, value);
      return this;
    }
  }

  /**
   * The updated labeling from the input document, accounting for the submitted feedback.
   */
  public class UpdatedLabelsIn extends IBMWatsonGenericModel {
    private List<TypeLabel> types;
    private List<Category> categories;

    /**
     * Gets the types.
     *
     * Description of the action specified by the element and whom it affects.
     *
     * @return the types
     */
    public List<TypeLabel> getTypes() {
      return types;
    }

    /**
     * Gets the categories.
     *
     * List of functional categories into which the element falls; in other words, the subject matter of the element.
     *
     * @return the categories
     */
    public List<Category> getCategories() {
      return categories;
    }
  
    private UpdatedLabelsIn(UpdatedLabelsInBuilder builder) {
      IBMWatsonValidator.notNull(builder.types, 'types cannot be null');
      IBMWatsonValidator.notNull(builder.categories, 'categories cannot be null');
      this.types = builder.types;
      this.categories = builder.categories;
    }

    /**
     * New builder.
     *
     * @return a UpdatedLabelsIn builder
     */
    public UpdatedLabelsInBuilder newBuilder() {
      return new UpdatedLabelsInBuilder(this);
    }

    public Map<String, Object> replacePropertyNames() {
      // get map representation of current model
      Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));

      // performing custom serialization for types
      if (types != null) {
        List<Object> typesJsonList = new List<Object>();
        for (TypeLabel listItem : types) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          typesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('types', typesJsonList);
      }

      // performing custom serialization for categories
      if (categories != null) {
        List<Object> categoriesJsonList = new List<Object>();
        for (Category listItem : categories) {
          String listItemJsonString = JSON.serialize(listItem.replacePropertyNames(), true);
          categoriesJsonList.add(JSON.deserializeUntyped(listItemJsonString));
        }
        jsonMap.put('categories', categoriesJsonList);
      }

      return jsonMap;
    }
  }

  /**
   * UpdatedLabelsIn Builder.
   */
  public class UpdatedLabelsInBuilder {
    private List<TypeLabel> types;
    private List<Category> categories;

    private UpdatedLabelsInBuilder(UpdatedLabelsIn updatedLabelsIn) {
      this.types = updatedLabelsIn.types;
      this.categories = updatedLabelsIn.categories;
    }

    /**
     * Instantiates a new builder.
     */
    public UpdatedLabelsInBuilder() {
    }

    /**
     * Instantiates a new builder with required properties.
     *
     * @param types the types
     * @param categories the categories
     */
    public UpdatedLabelsInBuilder(List<TypeLabel> types, List<Category> categories) {
      this.types = types;
      this.categories = categories;
    }

    /**
     * Builds a UpdatedLabelsIn.
     *
     * @return the updatedLabelsIn
     */
    public UpdatedLabelsIn build() {
      return new UpdatedLabelsIn(this);
    }

    /**
     * Adds an types to types.
     *
     * @param types the new types
     * @return the UpdatedLabelsIn builder
     */
    public UpdatedLabelsInBuilder addTypes(TypeLabel types) {
      IBMWatsonValidator.notNull(types, 'types cannot be null');
      if (this.types == null) {
        this.types = new List<TypeLabel>();
      }
      this.types.add(types);
      return this;
    }

    /**
     * Adds an categories to categories.
     *
     * @param categories the new categories
     * @return the UpdatedLabelsIn builder
     */
    public UpdatedLabelsInBuilder addCategories(Category categories) {
      IBMWatsonValidator.notNull(categories, 'categories cannot be null');
      if (this.categories == null) {
        this.categories = new List<Category>();
      }
      this.categories.add(categories);
      return this;
    }

    /**
     * Set the types.
     * Existing types will be replaced.
     *
     * @param types the types
     * @return the UpdatedLabelsIn builder
     */
    public UpdatedLabelsInBuilder types(List<TypeLabel> types) {
      this.types = types;
      return this;
    }

    /**
     * Set the categories.
     * Existing categories will be replaced.
     *
     * @param categories the categories
     * @return the UpdatedLabelsIn builder
     */
    public UpdatedLabelsInBuilder categories(List<Category> categories) {
      this.categories = categories;
      return this;
    }
  }

  /**
   * The updated labeling from the input document, accounting for the submitted feedback.
   */
  public class UpdatedLabelsOut extends IBMWatsonGenericModel {
    private List<TypeLabel> types;
    private List<Category> categories;
    private String modification;

    /**
     * Gets the types.
     *
     * Description of the action specified by the element and whom it affects.
     *
     * @return the types
     */
    @AuraEnabled
    public List<TypeLabel> getTypes() {
      return types;
    }

    /**
     * Gets the categories.
     *
     * List of functional categories into which the element falls; in other words, the subject matter of the element.
     *
     * @return the categories
     */
    @AuraEnabled
    public List<Category> getCategories() {
      return categories;
    }

    /**
     * Gets the modification.
     *
     * The type of modification the feedback entry in the `updated_labels` array. Possible values are `added`,
     * `not_changed`, and `removed`.
     *
     * @return the modification
     */
    @AuraEnabled
    public String getModification() {
      return modification;
    }

    /**
     * Sets the types.
     *
     * @param types the new types
     */
    public void setTypes(final List<TypeLabel> types) {
      this.types = types;
    }

    /**
     * Sets the categories.
     *
     * @param categories the new categories
     */
    public void setCategories(final List<Category> categories) {
      this.categories = categories;
    }

    /**
     * Sets the modification.
     *
     * @param modification the new modification
     */
    public void setModification(final String modification) {
      this.modification = modification;
    }

    public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
      if (jsonMap == null) {
        return null;
      }

      UpdatedLabelsOut ret = (UpdatedLabelsOut) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for types
      List<TypeLabel> newTypes = new List<TypeLabel>();
      List<TypeLabel> deserializedTypes = ret.getTypes();
      if (deserializedTypes != null) {
        for (Integer i = 0; i < deserializedTypes.size(); i++) {
          TypeLabel currentItem = ret.getTypes().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('types');
          TypeLabel newItem = (TypeLabel) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), TypeLabel.class);
          newTypes.add(newItem);
        }
        ret.types = newTypes;
      }

      // calling custom deserializer for categories
      List<Category> newCategories = new List<Category>();
      List<Category> deserializedCategories = ret.getCategories();
      if (deserializedCategories != null) {
        for (Integer i = 0; i < deserializedCategories.size(); i++) {
          Category currentItem = ret.getCategories().get(i);
          List<Object> itemInMap = (List<Object>) jsonMap.get('categories');
          Category newItem = (Category) currentItem.deserialize(JSON.serialize(itemInMap.get(i), true), (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(itemInMap.get(i), true)), Category.class);
          newCategories.add(newItem);
        }
        ret.categories = newCategories;
      }

      return ret;
    }
  }

  /**
   * A value in a key-value pair.
   */
  public class Value extends IBMWatsonGenericModel {
    private String cellId;
    private Location location;
    private String text;

    /**
     * Gets the cellId.
     *
     * The unique ID of the value in the table.
     *
     * @return the cellId
     */
    @AuraEnabled
    public String getCellId() {
      return cellId;
    }

    /**
     * Gets the location.
     *
     * The numeric location of the identified element in the document, represented with two integers labeled `begin` and
     * `end`.
     *
     * @return the location
     */
    @AuraEnabled
    public Location getLocation() {
      return location;
    }

    /**
     * Gets the text.
     *
     * The text content of the table cell without HTML markup.
     *
     * @return the text
     */
    @AuraEnabled
    public String getText() {
      return text;
    }

    /**
     * Sets the cellId.
     *
     * @param cellId the new cellId
     */
    public void setCellId(final String cellId) {
      this.cellId = cellId;
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
        'cell_id' => 'cellId'
      };
      jsonString = IBMWatsonJSONUtil.replaceKeyNamesInString(jsonString, propertyNameMapping);
      jsonMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(jsonMap, propertyNameMapping);

      Value ret = (Value) super.deserialize(jsonString, jsonMap, classType);

      // calling custom deserializer for location
      Map<String, Object> locationMap = (Map<String, Object>) jsonMap.get('location');
      Location newLocation = (Location) new Location().deserialize(JSON.serialize(locationMap, true), locationMap, Location.class);
      ret.setLocation(newLocation);

      return ret;
    }
  }

}