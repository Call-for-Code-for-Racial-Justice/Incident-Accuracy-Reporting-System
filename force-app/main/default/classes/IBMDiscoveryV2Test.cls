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

@isTest
private class IBMDiscoveryV2Test {
  private static String VERSION;
  private static String PROJECT_ID;
  private static String COLLECTION_ID;
  private static String FILENAME;
  private static String FILE_CONTENT_TYPE;
  private static String METADATA;
  private static String NATURAL_LANGUAGE_QUERY;
  private static String FILTER;
  private static String DOCUMENT_ID;
  private static Long RELEVANCE;
  private static String FIELD;
  private static String PREFIX;
  private static Long COUNT;
  private static String QUERY_ID;
  private static Long MAX_PER_DOCUMENT;
  private static Long CHARACTERS;
  private static String QUERY;
  private static String AGGREGATION;
  private static String TEST_RETURN;
  private static Long OFFSET;
  private static String TEST_SORT;
  private static String NAME;
  private static Long MATCHING_RESULTS;
  private static String SUGGESTED_QUERY;
  private static String DOCUMENT_RETRIEVAL_SOURCE;
  private static Double CONFIDENCE;
  private static String PASSAGE_TEXT;
  private static Long START_OFFSET;
  private static Long END_OFFSET;
  private static String TYPE;
  private static String DOCUMENT_RETRIEVAL_STRATEGY;
  private static String TEXT;
  private static String TABLE_ID;
  private static String SOURCE_DOCUMENT_ID;
  private static String TABLE_HTML;
  private static Long TABLE_HTML_OFFSET;
  private static Long TEST_BEGIN;
  private static Long TEST_END;
  private static String CELL_ID;
  private static Long ROW_INDEX_BEGIN;
  private static Long ROW_INDEX_END;
  private static Long COLUMN_INDEX_BEGIN;
  private static Long COLUMN_INDEX_END;
  private static String TEXT_NORMALIZED;
  private static String ID;
  private static String COMPLETION;
  private static String NOTICE_ID;
  private static String SEVERITY;
  private static String STEP;
  private static String DESCRIPTION;
  private static Long RESULTS_PER_PAGE;
  private static String LABEL;
  private static String VISUALIZATION_TYPE;
  private static String STATUS;
  private static String HEADER_NAME;
  private static String HEADER_VALUE;

  private static IBMWatsonFile testFile;
  private static Datetime testDate;
  private static IBMDiscoveryV2Models.TrainingExample trainingExampleMock;
  private static IBMDiscoveryV2Models.QueryLargeTableResults queryLargeTableResults;
  private static IBMDiscoveryV2Models.QueryLargeSuggestedRefinements queryLargeSuggestedRefinements;
  private static IBMDiscoveryV2Models.QueryLargePassages queryLargePassages;

  private static IBMDiscoveryV2 service;

  static {
    VERSION = '2019-11-22';
    PROJECT_ID = 'project_id';
    COLLECTION_ID = 'collection_id';
    FILENAME = 'filename';
    FILE_CONTENT_TYPE = 'application/pdf';
    METADATA = 'metadata';
    NATURAL_LANGUAGE_QUERY = 'natural_language_query';
    FILTER = 'filter';
    DOCUMENT_ID = 'document_id';
    RELEVANCE = 1L;
    FIELD = 'field';
    PREFIX = 'prefix';
    COUNT = 2L;
    QUERY_ID = 'query_id';
    MAX_PER_DOCUMENT = 3L;
    CHARACTERS = 4L;
    QUERY = 'query';
    AGGREGATION = 'aggregation';
    TEST_RETURN = 'return';
    OFFSET = 5L;
    TEST_SORT = 'sort';
    NAME = 'name';
    MATCHING_RESULTS = 6L;
    SUGGESTED_QUERY = 'suggested_query';
    DOCUMENT_RETRIEVAL_SOURCE = 'document_retrieval_source';
    CONFIDENCE = 0.0;
    PASSAGE_TEXT = 'passage_text';
    START_OFFSET = 7L;
    END_OFFSET = 8L;
    TYPE = 'type';
    DOCUMENT_RETRIEVAL_STRATEGY = 'document_retrieval_strategy';
    TEXT = 'text';
    TABLE_ID = 'table_id';
    SOURCE_DOCUMENT_ID = 'source_document_id';
    TABLE_HTML = 'table_html';
    TABLE_HTML_OFFSET = 9L;
    TEST_BEGIN = 10L;
    TEST_END = 11L;
    CELL_ID = 'cell_id';
    ROW_INDEX_BEGIN = 12L;
    ROW_INDEX_END = 13L;
    COLUMN_INDEX_BEGIN = 14L;
    COLUMN_INDEX_END = 15L;
    TEXT_NORMALIZED = 'text_normalized';
    ID = 'id';
    COMPLETION = 'completion';
    NOTICE_ID = 'notice_id';
    SEVERITY = 'severity';
    STEP = 'step';
    DESCRIPTION = 'description';
    RESULTS_PER_PAGE = 17L;
    LABEL = 'label';
    VISUALIZATION_TYPE = 'visualization_type';
    STATUS = 'status';
    HEADER_NAME = 'Header-Name';
    HEADER_VALUE = 'header_value';

    // create test models
    testFile = new IBMWatsonFile.FileBuilder()
      .name('file.pdf')
      .description('Test PDF file')
      .contentType('application/pdf')
      .body(blob.valueOf('Test string that is not a PDF'))
      .build();
    testDate = (Datetime) JSON.deserialize('"1995-06-12T01:11:11.111Z"', Datetime.class);
    trainingExampleMock = new IBMDiscoveryV2Models.TrainingExampleBuilder()
      .documentId(DOCUMENT_ID)
      .collectionId(COLLECTION_ID)
      .relevance(RELEVANCE)
      .build();
    queryLargeTableResults = new IBMDiscoveryV2Models.QueryLargeTableResultsBuilder().build();
    queryLargeSuggestedRefinements = new IBMDiscoveryV2Models.QueryLargeSuggestedRefinementsBuilder().build();
    queryLargePassages = new IBMDiscoveryV2Models.QueryLargePassagesBuilder().build();

    service = new IBMDiscoveryV2(VERSION, new IBMWatsonNoAuthAuthenticator());
    service.setServiceURL('https://discovery.test.com/api');
  }

  static testMethod void testAddDocumentOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.AddDocumentOptions options = new IBMDiscoveryV2Models.AddDocumentOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionId(COLLECTION_ID)
      .file(testFile)
      .filename(FILENAME)
      .fileContentType(FILE_CONTENT_TYPE)
      .metadata(METADATA)
      .xWatsonDiscoveryForce(true)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(testFile, options.file());
    System.assertEquals(FILENAME, options.filename());
    System.assertEquals(FILE_CONTENT_TYPE, options.fileContentType());
    System.assertEquals(METADATA, options.metadata());
    System.assert(options.xWatsonDiscoveryForce());
    Test.stopTest();
  }

  static testMethod void testCreateTrainingQueryOptions() {
    Test.startTest();
    List<IBMDiscoveryV2Models.TrainingExample> exampleList = new List<IBMDiscoveryV2Models.TrainingExample> { trainingExampleMock };

    IBMDiscoveryV2Models.CreateTrainingQueryOptions options = new IBMDiscoveryV2Models.CreateTrainingQueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .naturalLanguageQuery(NATURAL_LANGUAGE_QUERY)
      .filter(FILTER)
      .examples(exampleList)
      .addExamples(trainingExampleMock)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, options.naturalLanguageQuery());
    System.assertEquals(FILTER, options.filter());
    System.assertEquals(2, options.examples().size());
    System.assertEquals(trainingExampleMock, options.examples().get(0));
    Test.stopTest();
  }

  static testMethod void testDeleteDocumentOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.DeleteDocumentOptions options = new IBMDiscoveryV2Models.DeleteDocumentOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionId(COLLECTION_ID)
      .documentId(DOCUMENT_ID)
      .xWatsonDiscoveryForce(true)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(DOCUMENT_ID, options.documentId());
    System.assert(options.xWatsonDiscoveryForce());
    Test.stopTest();
  }

  static testMethod void testDeleteTrainingQueryOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.DeleteTrainingQueriesOptions options = new IBMDiscoveryV2Models.DeleteTrainingQueriesOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    Test.stopTest();
  }

  static testMethod void testGetAutocompletionOptions() {
    Test.startTest();
    List<String> collectionIds = new List<String> { COLLECTION_ID };

    IBMDiscoveryV2Models.GetAutocompletionOptions options = new IBMDiscoveryV2Models.GetAutocompletionOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionIds(collectionIds)
      .addCollectionIds(COLLECTION_ID)
      .field(FIELD)
      .prefix(PREFIX)
      .count(COUNT)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(2, options.collectionIds().size());
    System.assertEquals(COLLECTION_ID, options.collectionIds().get(0));
    System.assertEquals(FIELD, options.field());
    System.assertEquals(PREFIX, options.prefix());
    System.assertEquals(COUNT, options.count());
    Test.stopTest();
  }

  static testMethod void testGetComponentSettingsOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.GetComponentSettingsOptions options = new IBMDiscoveryV2Models.GetComponentSettingsOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    Test.stopTest();
  }

  static testMethod void testGetTrainingQueryOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.GetTrainingQueryOptions options = new IBMDiscoveryV2Models.GetTrainingQueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .queryId(QUERY_ID)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(QUERY_ID, options.queryId());
    Test.stopTest();
  }

  static testMethod void testListCollectionsOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.ListCollectionsOptions options = new IBMDiscoveryV2Models.ListCollectionsOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    Test.stopTest();
  }

  static testMethod void testListFieldsOptions() {
    Test.startTest();
    List<String> collectionIds = new List<String> { COLLECTION_ID };

    IBMDiscoveryV2Models.ListFieldsOptions options = new IBMDiscoveryV2Models.ListFieldsOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionIds(collectionIds)
      .addCollectionIds(COLLECTION_ID)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(2, options.collectionIds().size());
    System.assertEquals(COLLECTION_ID, options.collectionIds().get(0));
    Test.stopTest();
  }

  static testMethod void testListTrainingQueriesOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.ListTrainingQueriesOptions options = new IBMDiscoveryV2Models.ListTrainingQueriesOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    Test.stopTest();
  }

  static testMethod void testQueryLargePassages() {
    Test.startTest();
    List<String> fields = new List<String> { FIELD };

    IBMDiscoveryV2Models.QueryLargePassages queryLargePassages = new IBMDiscoveryV2Models.QueryLargePassagesBuilder()
      .enabled(true)
      .perDocument(true)
      .maxPerDocument(MAX_PER_DOCUMENT)
      .fields(fields)
      .addFields(FIELD)
      .count(COUNT)
      .characters(CHARACTERS)
      .build();
    queryLargePassages = queryLargePassages.newBuilder().build();

    System.assert(queryLargePassages.getEnabled());
    System.assert(queryLargePassages.getPerDocument());
    System.assertEquals(MAX_PER_DOCUMENT, queryLargePassages.getMaxPerDocument());
    System.assertEquals(2, queryLargePassages.getFields().size());
    System.assertEquals(FIELD, queryLargePassages.getFields().get(0));
    System.assertEquals(COUNT, queryLargePassages.getCount());
    System.assertEquals(CHARACTERS, queryLargePassages.getCharacters());
    Test.stopTest();
  }

  static testMethod void testQueryLargeSuggestedRefinements() {
    Test.startTest();
    IBMDiscoveryV2Models.QueryLargeSuggestedRefinements queryLargeSuggestedRefinements = new IBMDiscoveryV2Models.QueryLargeSuggestedRefinementsBuilder()
      .enabled(true)
      .count(COUNT)
      .build();
    queryLargeSuggestedRefinements = queryLargeSuggestedRefinements.newBuilder().build();

    System.assert(queryLargeSuggestedRefinements.getEnabled());
    System.assertEquals(COUNT, queryLargeSuggestedRefinements.getCount());
    Test.stopTest();
  }

  static testMethod void testQueryLargeTableResults() {
    Test.startTest();
    IBMDiscoveryV2Models.QueryLargeTableResults queryLargeTableResults = new IBMDiscoveryV2Models.QueryLargeTableResultsBuilder()
      .enabled(true)
      .count(COUNT)
      .build();
    queryLargeTableResults = queryLargeTableResults.newBuilder().build();

    System.assert(queryLargeTableResults.getEnabled());
    System.assertEquals(COUNT, queryLargeTableResults.getCount());
    Test.stopTest();
  }

  static testMethod void testQueryNoticesOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.QueryNoticesOptions options = new IBMDiscoveryV2Models.QueryNoticesOptionsBuilder()
      .projectId(PROJECT_ID)
      .filter(FILTER)
      .query(QUERY)
      .naturalLanguageQuery(NATURAL_LANGUAGE_QUERY)
      .count(COUNT)
      .offset(OFFSET)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(FILTER, options.filter());
    System.assertEquals(QUERY, options.query());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, options.naturalLanguageQuery());
    System.assertEquals(COUNT, options.count());
    System.assertEquals(OFFSET, options.offset());
    Test.stopTest();
  }

  
  static testMethod void testQueryOptions() {
    Test.startTest();
    List<String> collectionIds = new List<String> { COLLECTION_ID };
    List<String> returnList = new List<String> { TEST_RETURN };

    IBMDiscoveryV2Models.QueryOptions options = new IBMDiscoveryV2Models.QueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionIds(collectionIds)
      .addCollectionIds(COLLECTION_ID)
      .filter(FILTER)
      .query(QUERY)
      .naturalLanguageQuery(NATURAL_LANGUAGE_QUERY)
      .aggregation(AGGREGATION)
      .count(COUNT)
      .xReturn(returnList)
      .addXReturn(TEST_RETURN)
      .offset(OFFSET)
      .xSort(TEST_SORT)
      .highlight(true)
      .spellingSuggestions(true)
      .tableResults(queryLargeTableResults)
      .suggestedRefinements(queryLargeSuggestedRefinements)
      .passages(queryLargePassages)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(FILTER, options.filter());
    System.assertEquals(QUERY, options.query());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, options.naturalLanguageQuery());
    System.assertEquals(AGGREGATION, options.aggregation());
    System.assertEquals(COUNT, options.count());
    System.assertEquals(2, options.xReturn().size());
    System.assertEquals(TEST_RETURN, options.xReturn().get(0));
    System.assertEquals(OFFSET, options.offset());
    System.assertEquals(TEST_SORT, options.xSort());
    System.assert(options.highlight());
    System.assert(options.spellingSuggestions());
    System.assertEquals(queryLargeTableResults, options.tableResults());
    System.assertEquals(queryLargeSuggestedRefinements, options.suggestedRefinements());
    System.assertEquals(queryLargePassages, options.passages());
    Test.stopTest();
  }

  static testMethod void testTrainingExample() {
    Test.startTest();
    IBMDiscoveryV2Models.TrainingExample trainingExample = new IBMDiscoveryV2Models.TrainingExampleBuilder()
      .documentId(DOCUMENT_ID)
      .collectionId(COLLECTION_ID)
      .relevance(RELEVANCE)
      .created(testDate)
      .updated(testDate)
      .build();
    trainingExample = trainingExample.newBuilder().build();

    System.assertEquals(DOCUMENT_ID, trainingExample.getDocumentId());
    System.assertEquals(COLLECTION_ID, trainingExample.getCollectionId());
    System.assertEquals(RELEVANCE, trainingExample.getRelevance());
    System.assertEquals(testDate, trainingExample.getCreated());
    System.assertEquals(testDate, trainingExample.getUpdated());
    Test.stopTest();
  }

  static testMethod void testTrainingQuery() {
    Test.startTest();
    List<IBMDiscoveryV2Models.TrainingExample> exampleList = new List<IBMDiscoveryV2Models.TrainingExample> { trainingExampleMock };

    IBMDiscoveryV2Models.TrainingQuery trainingQuery = new IBMDiscoveryV2Models.TrainingQueryBuilder()
      .queryId(QUERY_ID)
      .naturalLanguageQuery(NATURAL_LANGUAGE_QUERY)
      .filter(FILTER)
      .created(testDate)
      .updated(testDate)
      .examples(exampleList)
      .addExamples(trainingExampleMock)
      .build();
    trainingQuery = trainingQuery.newBuilder().build();

    System.assertEquals(QUERY_ID, trainingQuery.getQueryId());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, trainingQuery.getNaturalLanguageQuery());
    System.assertEquals(FILTER, trainingQuery.getFilter());
    System.assertEquals(testDate, trainingQuery.getCreated());
    System.assertEquals(testDate, trainingQuery.getUpdated());
    System.assertEquals(2, trainingQuery.getExamples().size());
    System.assertEquals(trainingExampleMock, trainingQuery.getExamples().get(0));
    Test.stopTest();
  }

  static testMethod void testUpdateDocumentOptions() {
    Test.startTest();
    IBMDiscoveryV2Models.UpdateDocumentOptions options = new IBMDiscoveryV2Models.UpdateDocumentOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionId(COLLECTION_ID)
      .documentId(DOCUMENT_ID)
      .file(testFile)
      .filename(FILENAME)
      .fileContentType(FILE_CONTENT_TYPE)
      .metadata(METADATA)
      .xWatsonDiscoveryForce(true)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(COLLECTION_ID, options.collectionId());
    System.assertEquals(testFile, options.file());
    System.assertEquals(FILENAME, options.filename());
    System.assertEquals(FILE_CONTENT_TYPE, options.fileContentType());
    System.assertEquals(METADATA, options.metadata());
    System.assert(options.xWatsonDiscoveryForce());
    Test.stopTest();
  }

  static testMethod void testUpdateTrainingQueryOptions() {
    Test.startTest();
    List<IBMDiscoveryV2Models.TrainingExample> exampleList = new List<IBMDiscoveryV2Models.TrainingExample> { trainingExampleMock };

    IBMDiscoveryV2Models.UpdateTrainingQueryOptions options = new IBMDiscoveryV2Models.UpdateTrainingQueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .queryId(QUERY_ID)
      .naturalLanguageQuery(NATURAL_LANGUAGE_QUERY)
      .filter(FILTER)
      .examples(exampleList)
      .addExamples(trainingExampleMock)
      .build();
    options = options.newBuilder().build();

    System.assertEquals(PROJECT_ID, options.projectId());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, options.naturalLanguageQuery());
    System.assertEquals(FILTER, options.filter());
    System.assertEquals(2, options.examples().size());
    System.assertEquals(trainingExampleMock, options.examples().get(0));
    Test.stopTest();
  }

  static testMethod void testListCollections() {
    String body = IBMWatsonMockResponses.discoveryV2ListCollectionsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.ListCollectionsOptions options = new IBMDiscoveryV2Models.ListCollectionsOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    IBMDiscoveryV2Models.ListCollectionsResponse response = service.listCollections(options);

    System.assertEquals(COLLECTION_ID, response.getCollections().get(0).getCollectionId());
    System.assertEquals(NAME, response.getCollections().get(0).getName());
    Test.stopTest();
  }

  static testMethod void testQuery() {
    String body = IBMWatsonMockResponses.discoveryV2QueryResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.QueryOptions options = new IBMDiscoveryV2Models.QueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    IBMDiscoveryV2Models.QueryResponse response = service.query(options);

    System.assertEquals(MATCHING_RESULTS, response.getMatchingResults());
    System.assertEquals(DOCUMENT_ID, response.getResults().get(0).getDocumentId());
    System.assertEquals(DOCUMENT_RETRIEVAL_SOURCE,
        response.getResults().get(0).getResultMetadata().getDocumentRetrievalSource());
    System.assertEquals(COLLECTION_ID, response.getResults().get(0).getResultMetadata().getCollectionId());
    System.assertEquals(CONFIDENCE, response.getResults().get(0).getResultMetadata().getConfidence());
    System.assertEquals(PASSAGE_TEXT, response.getResults().get(0).getDocumentPassages().get(0).getPassageText());
    System.assertEquals(START_OFFSET, response.getResults().get(0).getDocumentPassages().get(0).getStartOffset());
    System.assertEquals(END_OFFSET, response.getResults().get(0).getDocumentPassages().get(0).getEndOffset());
    System.assertEquals(FIELD, response.getResults().get(0).getDocumentPassages().get(0).getField());
    System.assertEquals(TYPE, response.getAggregations().get(0).getXType());
    System.assertEquals(DOCUMENT_RETRIEVAL_STRATEGY, response.getRetrievalDetails().getDocumentRetrievalStrategy());
    System.assertEquals(SUGGESTED_QUERY, response.getSuggestedQuery());
    System.assertEquals(TEXT, response.getSuggestedRefinements().get(0).getText());
    System.assertEquals(TABLE_ID, response.getTableResults().get(0).getTableId());
    System.assertEquals(SOURCE_DOCUMENT_ID, response.getTableResults().get(0).getSourceDocumentId());
    System.assertEquals(COLLECTION_ID, response.getTableResults().get(0).getCollectionId());
    System.assertEquals(TABLE_HTML, response.getTableResults().get(0).getTableHtml());
    System.assertEquals(TABLE_HTML_OFFSET, response.getTableResults().get(0).getTableHtmlOffset());
    System.assertEquals(TEST_BEGIN, response.getTableResults().get(0).getTable().getLocation().getXBegin());
    System.assertEquals(TEST_END, response.getTableResults().get(0).getTable().getLocation().getXEnd());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getText());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getSectionTitle().getText());
    System.assertEquals(TEST_BEGIN, response.getTableResults().get(0).getTable().getSectionTitle().getLocation().getXBegin());
    System.assertEquals(TEST_END, response.getTableResults().get(0).getTable().getSectionTitle().getLocation().getXEnd());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getTitle().getText());
    System.assertEquals(TEST_BEGIN, response.getTableResults().get(0).getTable().getTitle().getLocation().getXBegin());
    System.assertEquals(TEST_END, response.getTableResults().get(0).getTable().getTitle().getLocation().getXEnd());
    System.assertEquals(CELL_ID, response.getTableResults().get(0).getTable().getTableHeaders().get(0).getCellId());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getTableHeaders().get(0).getText());
    System.assertEquals(ROW_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getTableHeaders().get(0).getRowIndexBegin());
    System.assertEquals(ROW_INDEX_END, response.getTableResults().get(0).getTable().getTableHeaders().get(0).getRowIndexEnd());
    System.assertEquals(COLUMN_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getTableHeaders().get(0).getColumnIndexBegin());
    System.assertEquals(COLUMN_INDEX_END,
        response.getTableResults().get(0).getTable().getTableHeaders().get(0).getColumnIndexEnd());
    System.assertEquals(CELL_ID, response.getTableResults().get(0).getTable().getRowHeaders().get(0).getCellId());
    System.assertEquals(TEST_BEGIN, response.getTableResults().get(0).getTable().getRowHeaders().get(0).getLocation().getXBegin());
    System.assertEquals(TEST_END, response.getTableResults().get(0).getTable().getRowHeaders().get(0).getLocation().getXEnd());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getRowHeaders().get(0).getText());
    System.assertEquals(ROW_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getRowHeaders().get(0).getRowIndexBegin());
    System.assertEquals(ROW_INDEX_END, response.getTableResults().get(0).getTable().getRowHeaders().get(0).getRowIndexEnd());
    System.assertEquals(COLUMN_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getRowHeaders().get(0).getColumnIndexBegin());
    System.assertEquals(COLUMN_INDEX_END,
        response.getTableResults().get(0).getTable().getRowHeaders().get(0).getColumnIndexEnd());
    System.assertEquals(CELL_ID, response.getTableResults().get(0).getTable().getColumnHeaders().get(0).getCellId());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getColumnHeaders().get(0).getText());
    System.assertEquals(ROW_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getColumnHeaders().get(0).getRowIndexBegin());
    System.assertEquals(ROW_INDEX_END,
        response.getTableResults().get(0).getTable().getColumnHeaders().get(0).getRowIndexEnd());
    System.assertEquals(COLUMN_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getColumnHeaders().get(0).getColumnIndexBegin());
    System.assertEquals(COLUMN_INDEX_END,
        response.getTableResults().get(0).getTable().getColumnHeaders().get(0).getColumnIndexEnd());
    System.assertEquals(CELL_ID, response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getKey().getCellId());
    System.assertEquals(TEST_BEGIN,
        response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getKey().getLocation().getXBegin());
    System.assertEquals(TEST_END,
        response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getKey().getLocation().getXEnd());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getKey().getText());
    System.assertEquals(CELL_ID,
        response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getValue().get(0).getCellId());
    System.assertEquals(TEST_BEGIN,
        response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getValue().get(0).getLocation()
            .getXBegin());
    System.assertEquals(TEST_END,
        response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getValue().get(0).getLocation()
            .getXEnd());
    System.assertEquals(TEXT,
        response.getTableResults().get(0).getTable().getKeyValuePairs().get(0).getValue().get(0).getText());
    System.assertEquals(CELL_ID, response.getTableResults().get(0).getTable().getBodyCells().get(0).getCellId());
    System.assertEquals(TEST_BEGIN, response.getTableResults().get(0).getTable().getBodyCells().get(0).getLocation().getXBegin());
    System.assertEquals(TEST_END, response.getTableResults().get(0).getTable().getBodyCells().get(0).getLocation().getXEnd());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getBodyCells().get(0).getText());
    System.assertEquals(ROW_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getRowIndexBegin());
    System.assertEquals(ROW_INDEX_END, response.getTableResults().get(0).getTable().getBodyCells().get(0).getRowIndexEnd());
    System.assertEquals(COLUMN_INDEX_BEGIN,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getColumnIndexBegin());
    System.assertEquals(COLUMN_INDEX_END,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getColumnIndexEnd());
    System.assertEquals(ID,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getRowHeaderIds().get(0).getId());
    System.assertEquals(TEXT,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getRowHeaderTexts().get(0).getText());
    System.assertEquals(TEXT_NORMALIZED,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getRowHeaderTextsNormalized().get(0)
            .getTextNormalized());
    System.assertEquals(ID,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getColumnHeaderIds().get(0).getId());
    System.assertEquals(TEXT,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getColumnHeaderTexts().get(0).getText());
    System.assertEquals(TEXT_NORMALIZED,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getColumnHeaderTextsNormalized().get(0)
            .getTextNormalized());
    System.assertEquals(TYPE,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getAttributes().get(0).getXType());
    System.assertEquals(TEXT,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getAttributes().get(0).getText());
    System.assertEquals(TEST_BEGIN,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getAttributes().get(0).getLocation()
            .getXBegin());
    System.assertEquals(TEST_END,
        response.getTableResults().get(0).getTable().getBodyCells().get(0).getAttributes().get(0).getLocation()
            .getXEnd());
    System.assertEquals(TEXT, response.getTableResults().get(0).getTable().getContexts().get(0).getText());
    System.assertEquals(TEST_BEGIN, response.getTableResults().get(0).getTable().getContexts().get(0).getLocation().getXBegin());
    System.assertEquals(TEST_END, response.getTableResults().get(0).getTable().getContexts().get(0).getLocation().getXEnd());
    Test.stopTest();
  }

  static testMethod void testGetAutocompletion() {
    String body = IBMWatsonMockResponses.discoveryV2Completions();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.GetAutocompletionOptions options = new IBMDiscoveryV2Models.GetAutocompletionOptionsBuilder()
      .projectId(PROJECT_ID)
      .prefix(PREFIX)
      .build();
    IBMDiscoveryV2Models.Completions response = service.getAutocompletion(options);

    System.assertEquals(COMPLETION, response.getCompletions().get(0));
    Test.stopTest();
  }

  static testMethod void testQueryNotices() {
    String body = IBMWatsonMockResponses.discoveryV2QueryNoticesResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.QueryNoticesOptions options = new IBMDiscoveryV2Models.QueryNoticesOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    IBMDiscoveryV2Models.QueryNoticesResponse response = service.queryNotices(options);

    System.assertEquals(MATCHING_RESULTS, response.getMatchingResults());
    System.assertEquals(NOTICE_ID, response.getNotices().get(0).getNoticeId());
    System.assertEquals(testDate, response.getNotices().get(0).getCreated());
    System.assertEquals(DOCUMENT_ID, response.getNotices().get(0).getDocumentId());
    System.assertEquals(COLLECTION_ID, response.getNotices().get(0).getCollectionId());
    System.assertEquals(QUERY_ID, response.getNotices().get(0).getQueryId());
    System.assertEquals(SEVERITY, response.getNotices().get(0).getSeverity());
    System.assertEquals(STEP, response.getNotices().get(0).getStep());
    System.assertEquals(DESCRIPTION, response.getNotices().get(0).getDescription());
    Test.stopTest();
  }

  static testMethod void testListFields() {
    String body = IBMWatsonMockResponses.discoveryV2ListFieldsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.ListFieldsOptions options = new IBMDiscoveryV2Models.ListFieldsOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    IBMDiscoveryV2Models.ListFieldsResponse response = service.listFields(options);

    System.assertEquals(FIELD, response.getFields().get(0).getField());
    System.assertEquals(TYPE, response.getFields().get(0).getXType());
    System.assertEquals(COLLECTION_ID, response.getFields().get(0).getCollectionId());
    Test.stopTest();
  }

  static testMethod void testGetComponentSettings() {
    String body = IBMWatsonMockResponses.discoveryV2ComponentSettingsResponse();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.GetComponentSettingsOptions options = new IBMDiscoveryV2Models.GetComponentSettingsOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    IBMDiscoveryV2Models.ComponentSettingsResponse response = service.getComponentSettings(options);

    System.assert(response.getFieldsShown().getBody().getUsePassage());
    System.assertEquals(FIELD, response.getFieldsShown().getBody().getField());
    System.assertEquals(FIELD, response.getFieldsShown().getTitle().getField());
    System.assert(response.getAutocomplete());
    System.assert(response.getStructuredSearch());
    System.assertEquals(RESULTS_PER_PAGE, response.getResultsPerPage());
    System.assertEquals(NAME, response.getAggregations().get(0).getName());
    System.assertEquals(LABEL, response.getAggregations().get(0).getLabel());
    System.assert(response.getAggregations().get(0).getMultipleSelectionsAllowed());
    System.assertEquals(VISUALIZATION_TYPE, response.getAggregations().get(0).getVisualizationType());
    Test.stopTest();
  }

  static testMethod void testAddDocument() {
    String body = IBMWatsonMockResponses.discoveryV2DocumentAccepted();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.AddDocumentOptions options = new IBMDiscoveryV2Models.AddDocumentOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionId(COLLECTION_ID)
      .file(testFile)
      .filename(FILENAME)
      .fileContentType(FILE_CONTENT_TYPE)
      .build();
    IBMDiscoveryV2Models.DocumentAccepted response = service.addDocument(options);

    System.assertEquals(DOCUMENT_ID, response.getDocumentId());
    System.assertEquals(STATUS, response.getStatus());
    Test.stopTest();
  }

  static testMethod void testUpdateDocument() {
    String body = IBMWatsonMockResponses.discoveryV2DocumentAccepted();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.UpdateDocumentOptions options = new IBMDiscoveryV2Models.UpdateDocumentOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionId(COLLECTION_ID)
      .documentId(DOCUMENT_ID)
      .file(testFile)
      .filename(FILENAME)
      .fileContentType(FILE_CONTENT_TYPE)
      .build();
    IBMDiscoveryV2Models.DocumentAccepted response = service.updateDocument(options);

    System.assertEquals(DOCUMENT_ID, response.getDocumentId());
    System.assertEquals(STATUS, response.getStatus());
    Test.stopTest();
  }

  static testMethod void testDeleteDocument() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.DeleteDocumentOptions options = new IBMDiscoveryV2Models.DeleteDocumentOptionsBuilder()
      .projectId(PROJECT_ID)
      .collectionId(COLLECTION_ID)
      .documentId(DOCUMENT_ID)
      .build();
    service.deleteDocument(options);

    Test.stopTest();
  }

  static testMethod void testListTrainingQueries() {
    String body = IBMWatsonMockResponses.discoveryV2TrainingQuerySet();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.ListTrainingQueriesOptions options = new IBMDiscoveryV2Models.ListTrainingQueriesOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    IBMDiscoveryV2Models.TrainingQuerySet response = service.listTrainingQueries(options);

    System.assertEquals(QUERY_ID, response.getQueries().get(0).getQueryId());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, response.getQueries().get(0).getNaturalLanguageQuery());
    System.assertEquals(FILTER, response.getQueries().get(0).getFilter());
    System.assertEquals(testDate, response.getQueries().get(0).getCreated());
    System.assertEquals(testDate, response.getQueries().get(0).getUpdated());
    System.assertEquals(DOCUMENT_ID, response.getQueries().get(0).getExamples().get(0).getDocumentId());
    System.assertEquals(COLLECTION_ID, response.getQueries().get(0).getExamples().get(0).getCollectionId());
    System.assertEquals(RELEVANCE, response.getQueries().get(0).getExamples().get(0).getRelevance());
    System.assertEquals(testDate, response.getQueries().get(0).getExamples().get(0).getCreated());
    System.assertEquals(testDate, response.getQueries().get(0).getExamples().get(0).getUpdated());
    Test.stopTest();
  }

  static testMethod void testDeleteTrainingQueries() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.DeleteTrainingQueriesOptions options = new IBMDiscoveryV2Models.DeleteTrainingQueriesOptionsBuilder()
      .projectId(PROJECT_ID)
      .build();
    service.deleteTrainingQueries(options);

    Test.stopTest();
  }

  static testMethod void testCreateTrainingQuery() {
    String body = IBMWatsonMockResponses.discoveryV2TrainingQuery();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.CreateTrainingQueryOptions options = new IBMDiscoveryV2Models.CreateTrainingQueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .naturalLanguageQuery(NATURAL_LANGUAGE_QUERY)
      .addExamples(trainingExampleMock)
      .build();
    IBMDiscoveryV2Models.TrainingQuery response = service.createTrainingQuery(options);

    System.assertEquals(QUERY_ID, response.getQueryId());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, response.getNaturalLanguageQuery());
    System.assertEquals(FILTER, response.getFilter());
    System.assertEquals(testDate, response.getCreated());
    System.assertEquals(testDate, response.getUpdated());
    System.assertEquals(DOCUMENT_ID, response.getExamples().get(0).getDocumentId());
    System.assertEquals(COLLECTION_ID, response.getExamples().get(0).getCollectionId());
    System.assertEquals(RELEVANCE, response.getExamples().get(0).getRelevance());
    System.assertEquals(testDate, response.getExamples().get(0).getCreated());
    System.assertEquals(testDate, response.getExamples().get(0).getUpdated());
    Test.stopTest();
  }

  static testMethod void testGetTrainingQuery() {
    String body = IBMWatsonMockResponses.discoveryV2TrainingQuery();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.GetTrainingQueryOptions options = new IBMDiscoveryV2Models.GetTrainingQueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .queryId(QUERY_ID)
      .build();
    IBMDiscoveryV2Models.TrainingQuery response = service.getTrainingQuery(options);

    System.assertEquals(QUERY_ID, response.getQueryId());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, response.getNaturalLanguageQuery());
    System.assertEquals(FILTER, response.getFilter());
    System.assertEquals(testDate, response.getCreated());
    System.assertEquals(testDate, response.getUpdated());
    System.assertEquals(DOCUMENT_ID, response.getExamples().get(0).getDocumentId());
    System.assertEquals(COLLECTION_ID, response.getExamples().get(0).getCollectionId());
    System.assertEquals(RELEVANCE, response.getExamples().get(0).getRelevance());
    System.assertEquals(testDate, response.getExamples().get(0).getCreated());
    System.assertEquals(testDate, response.getExamples().get(0).getUpdated());
    Test.stopTest();
  }

  static testMethod void testUpdateTrainingQuery() {
    String body = IBMWatsonMockResponses.discoveryV2TrainingQuery();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      body,
      null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMDiscoveryV2Models.UpdateTrainingQueryOptions options = new IBMDiscoveryV2Models.UpdateTrainingQueryOptionsBuilder()
      .projectId(PROJECT_ID)
      .queryId(QUERY_ID)
      .naturalLanguageQuery(NATURAL_LANGUAGE_QUERY)
      .addExamples(trainingExampleMock)
      .build();
    IBMDiscoveryV2Models.TrainingQuery response = service.updateTrainingQuery(options);

    System.assertEquals(QUERY_ID, response.getQueryId());
    System.assertEquals(NATURAL_LANGUAGE_QUERY, response.getNaturalLanguageQuery());
    System.assertEquals(FILTER, response.getFilter());
    System.assertEquals(testDate, response.getCreated());
    System.assertEquals(testDate, response.getUpdated());
    System.assertEquals(DOCUMENT_ID, response.getExamples().get(0).getDocumentId());
    System.assertEquals(COLLECTION_ID, response.getExamples().get(0).getCollectionId());
    System.assertEquals(RELEVANCE, response.getExamples().get(0).getRelevance());
    System.assertEquals(testDate, response.getExamples().get(0).getCreated());
    System.assertEquals(testDate, response.getExamples().get(0).getUpdated());
    Test.stopTest();
  }
}