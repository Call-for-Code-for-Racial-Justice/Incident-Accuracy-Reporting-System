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

@isTest
/**
 * This class provide the mockresponses for unit tests.<br>
 * mock responses are copied from IBM Watson Api Explorer.
 */
public class IBMWatsonMockResponses {
  public static String IBMNaturalLanguageClassifierClassifyBaseURL = 
    'https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/10D41B-nlc-1';
  public static String IBMNaturalLanguageClassifierClassifyURL = 
    IBMNaturalLanguageClassifierClassifyBaseURL + '/classify?text=How%20hot%20wil/10D41B-nlc-1';
    
  public static testMethod String environment() {
    return '{"environment_id": "f822208e-e4c2-45f8-a0d6-c2be950fbcc8","name": "test_environment", ' +
                        '"description": "Test environment", "created": "2016-06-16T10:56:54.957Z", ' +
                          '"updated": "2017-05-16T13:56:54.957Z", "status": "active", "read_only": false, ' +
                          '"index_capacity": {"documents": {"indexed": 0, "maximum_allowed": 1000000}, ' +
                          '"disk_usage": {"used_bytes": 0, "maximum_allowed_bytes": 99345920}}}';
  }
  public static testMethod String configuration() {
    return  '{' +
            '  "configuration_id": "448e3545-51ca-4530-a03b-6ff282ceac2e", ' +
            '  "name": "IBM News", ' +
            '  "created": "2015-08-24T18:42:25.324Z", ' +
            '  "updated": "2015-08-24T18:42:25.324Z", ' +
            '  "description": "A configuration useful for ingesting IBM press releases.", ' +
            '  "conversions": {' +
            '    "html": {' +
            '      "exclude_tags_keep_content": [' +
            '        "span"' +
            '      ], ' +
            '      "exclude_content": {' +
            '        "xpaths": [' +
            '          "/home"' +
            '        ]' +
            '      }' +
            '    }, ' +
            '    "json_normalizations": [' +
            '      {' +
            '        "operation": "move", ' +
            '        "source_field": "extracted_metadata.title", ' +
            '        "destination_field": "metadata.title"' +
            '      }, ' +
            '      {' +
            '        "operation": "move", ' +
            '        "source_field": "extracted_metadata.author", ' +
            '        "destination_field": "metadata.author"' +
            '      }, ' +
            '      {' +
            '        "operation": "remove", ' +
            '        "source_field": "extracted_metadata"' +
            '      }' +
            '    ]' +
            '  }, ' +
            '  "enrichments": [' +
            '    {' +
            '      "source_field": "text", ' +
            '      "destination_field": "alchemy_enriched_text", ' +
            '      "enrichment": "alchemy_language", ' +
            '      "options": {' +
            '        "extract": ["wert"], ' +
            '        "showSourceText": true' +
            '      }' +
            '    }, ' +
            '    {' +
            '      "source_field": "alchemy_enriched_text.text", ' +
            '      "destination_field": "sire_enriched_text", ' +
            '      "enrichment": "alchemy_language", ' +
            '      "options": {' +
            '        "extract": ["typed-rels"], ' +
            '        "model": "ie-en-news"' +
            '      }' +
            '    }' +
            '  ], ' +
            '  "normalizations": [' +
            '    {' +
            '      "operation": "move", ' +
            '      "source_field": "metadata.title", ' +
            '      "destination_field": "title"' +
            '    }, ' +
            '    {' +
            '      "operation": "move", ' +
            '      "source_field": "metadata.author", ' +
            '      "destination_field": "author"' +
            '    }, ' +
            '    {' +
            '      "operation": "move", ' +
            '      "source_field": "alchemy_enriched_text.language", ' +
            '      "destination_field": "language"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "html"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "alchemy_enriched_text.status"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "alchemy_enriched_text.text"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "sire_enriched_text.language"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "sire_enriched_text.model"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "sire_enriched_text.status"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove_nulls"' +
            '    }' +
            '  ]' +
            '}';
  }

  public static testMethod String listConfigurationsResponse() {
    return '{' +
           ' "configurations": [' +
           '{' +
            '  "configuration_id": "448e3545-51ca-4530-a03b-6ff282ceac2e", ' +
            '  "name": "IBM News", ' +
            '  "created": "2015-08-24T18:42:25.324Z", ' +
            '  "updated": "2015-08-24T18:42:25.324Z", ' +
            '  "description": "A configuration useful for ingesting IBM press releases.", ' +
            '  "conversions": {' +
            '    "html": {' +
            '      "exclude_tags_keep_content": [' +
            '        "span"' +
            '      ], ' +
            '      "exclude_content": {' +
            '        "xpaths": [' +
            '          "/home"' +
            '        ]' +
            '      }' +
            '    }, ' +
            '    "json_normalizations": [' +
            '      {' +
            '        "operation": "move", ' +
            '        "source_field": "extracted_metadata.title", ' +
            '        "destination_field": "metadata.title"' +
            '      }, ' +
            '      {' +
            '        "operation": "move", ' +
            '        "source_field": "extracted_metadata.author", ' +
            '        "destination_field": "metadata.author"' +
            '      }, ' +
            '      {' +
            '        "operation": "remove", ' +
            '        "source_field": "extracted_metadata"' +
            '      }' +
            '    ]' +
            '  }, ' +
            '  "enrichments": [' +
            '    {' +
            '      "source_field": "text", ' +
            '      "destination_field": "alchemy_enriched_text", ' +
            '      "enrichment": "alchemy_language", ' +
            '      "options": {' +
            '        "extract": ["wert"], ' +
            '        "showSourceText": true' +
            '      }' +
            '    }, ' +
            '    {' +
            '      "source_field": "alchemy_enriched_text.text", ' +
            '      "destination_field": "sire_enriched_text", ' +
            '      "enrichment": "alchemy_language", ' +
            '      "options": {' +
            '        "extract": ["typed-rels"], ' +
            '        "model": "ie-en-news"' +
            '      }' +
            '    }' +
            '  ], ' +
            '  "normalizations": [' +
            '    {' +
            '      "operation": "move", ' +
            '      "source_field": "metadata.title", ' +
            '      "destination_field": "title"' +
            '    }, ' +
            '    {' +
            '      "operation": "move", ' +
            '      "source_field": "metadata.author", ' +
            '      "destination_field": "author"' +
            '    }, ' +
            '    {' +
            '      "operation": "move", ' +
            '      "source_field": "alchemy_enriched_text.language", ' +
            '      "destination_field": "language"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "html"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "alchemy_enriched_text.status"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "alchemy_enriched_text.text"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "sire_enriched_text.language"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "sire_enriched_text.model"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove", ' +
            '      "source_field": "sire_enriched_text.status"' +
            '    }, ' +
            '    {' +
            '      "operation": "remove_nulls"' +
            '    }' +
            '  ]' +
            '}' +
           ' ]' +
           '}';
  }

   public static testMethod String listCollectionFieldsResponse() {
    return '{' +
              '  "fields": [' +
              '    {' +
              '      "field": "warnings", ' +
              '      "type": "nested"' +
              '    }, ' +
              '    {' +
              '      "field": "warnings.properties.description", ' +
              '      "type": "string"' +
              '    }, ' +
              '    {' +
              '      "field": "warnings.properties.phase", ' +
              '      "type": "string"' +
              '    }, ' +
              '    {' +
              '      "field": "warnings.properties.warning_id", ' +
              '      "type": "string"' +
              '    }' +
              '  ]' +
              '}';
  }

  public static testMethod String listEnvironmentsResponse() {
    return '{' +
              '  "environments": [' +
              '    {' +
              '      "environment_id": "ecbda78e-fb06-40b1-a43f-a039fac0adc6", ' +
              '      "name": "byod_environment", ' +
              '      "description": "Private Data Environment", ' +
              '      "created": "2017-07-14T12:54:40.985Z", ' +
              '      "updated": "2017-07-14T12:54:40.985Z", ' +
              '      "read_only": false' +
              '    }, ' +
              '    {' +
              '      "environment_id": "system", ' +
              '      "name": "Watson System Environment", ' +
              '      "description": "Watson System environment", ' +
              '      "created": "2017-07-13T01:14:20.761Z", ' +
              '      "updated": "2017-07-13T01:14:20.761Z", ' +
              '      "read_only": true' +
              '    }' +
              '  ]' +
              '}';
  }

   public static testMethod String collection() {
    return  '{' +
            '   "collection_id": "800e58e4-198d-45eb-be87-74e1d6df4e96", ' +
            '  "name": "test-collection", ' +
            '  "configuration_id": "3c4fff84-1500-455c-b125-eaa2d319f6d3", ' +
            '  "language": "de", ' +
            '  "status": "active", ' +
            '  "description": "A test collection to show as an example", ' +
            '  "created": "2017-07-14T12:55:40.652Z", ' +
            '  "updated": "2017-07-14T12:55:40.652Z", ' +
            '  "document_counts": {' +
            '    "available": 0, ' +
            '    "processing": 0, ' +
            '    "failed": 0,' +
            '    "pending": 100' +
            '  }, ' +
            '  "disk_usage": {' +
            '    "used_bytes": 260' +
            '  }, ' +
            '  "training_status": {' +
            '    "data_updated": "2017-07-14T12:55:40.652Z", ' +
            '    "total_examples": 0, ' +
            '    "sufficient_label_diversity": false, ' +
            '    "processing": false, ' +
            '    "minimum_examples_added": false, ' +
            '    "successfully_trained": "2017-07-14T12:55:40.652Z", ' +
            '    "available": false, ' +
            '    "notices": 0, ' +
            '    "minimum_queries_added": false' +
            '  }' +
            '}';
  }

  public static testMethod String collectionTrained() {
    return  '{' +
            '  "collection_id": "800e58e4-198d-45eb-be87-74e1d6df4e96", ' +
            '  "name": "test-collection", ' +
            '  "configuration_id": "3c4fff84-1500-455c-b125-eaa2d319f6d3", ' +
            '  "language": "de", ' +
            '  "status": "active", ' +
            '  "description": "A trained test collection to show as an example", ' +
            '  "created": "2017-07-14T12:55:40.652Z", ' +
            '  "updated": "2017-07-14T12:55:40.652Z", ' +
            '  "document_counts": {' +
            '    "available": 0, ' +
            '    "processing": 0, ' +
            '    "failed": 0,' +
            '    "pending": 100' +
            '  }, ' +
            '  "disk_usage": {' +
            '    "used_bytes": 260' +
            '  }, ' +
            '  "training_status": {' +
            '    "data_updated": "2017-07-14T12:55:40.652Z", ' +
            '    "total_examples": 10, ' +
            '    "sufficient_label_diversity": true, ' +
            '    "processing": false, ' +
            '    "minimum_examples_added": true, ' +
            '    "successfully_trained": "2017-07-14T12:55:40.652Z", ' +
            '    "available": true, ' +
            '    "notices": 0, ' +
            '    "minimum_queries_added": true' +
            '  }' +
            '}';
  }

  public static testMethod String listCollectionsResponse() {
    return '{ "collections": [' +
           '   {' +
           '     "collection_id": "f1360220-ea2d-4271-9d62-89a910b13c37", ' +
           '     "name": "example", ' +
           '     "description": "this is a demo collection", ' +
           '     "created": "2015-08-24T18:42:25.324Z", ' +
           '     "updated": "2015-08-24T18:42:25.324Z", ' +
           '     "status": "active", ' +
           '     "configuration_id": "6963be41-2dea-4f79-8f52-127c63c479b0", ' +
           '     "language": "en"' +
           '   }' +
           ' ]' +
           '}';
  }

  public static testMethod String documentStatus() {
    return '{' +
            '  "document_id": "f1360220-ea2d-4271-9d62-89a910b13c37", ' +
            '  "configuration_id": "e8b9d793-b163-452a-9373-bce07efb510b", ' +
            '  "created": "2015-08-24T18:42:25.324Z", ' +
            '  "updated": "2015-08-24T18:42:25.324Z", ' +
            '  "status": "available with notices", ' +
            '  "status_description": "Document is successfully ingested but was indexed with warnings", ' +
            '  "filename": "instructions.html", ' +
            '  "file_type": "html", ' +
            '  "sha1": "de9f2c7fd25e1b3afad3e85a0bd17d9b100db4b3", ' +
            '  "notices": [' +
            '    {' +
            '      "notice_id": "index_342", ' +
            '      "created": "2015-08-24T18:42:25.324Z", ' +
            '      "severity": "warning", ' +
            '      "step": "indexing", ' +
            '      "description": "something bad happened", ' +
            '      "query_id": "f1360220-ea2d-4271-9d62-89a910b13c37", ' +
            '      "document_id": "f1360220-ea2d-4271-9d62-89a910b13c37"' +
            '    }' +
            '  ]' +
            '}';
  }

  public static testMethod String queryResponse() {
    return '{' +
            '  "matching_results": 24, ' +
            '  "results": [' +
            '    {' +
            '      "id": "watson-generated ID", ' +
            '      "score": 1' +
            '    }' +
            '  ], ' +
            '  "aggregations":[ {' +
            '    "term": {' +
            '      "results": [' +
            '        {' +
            '          "key": "active", ' +
            '          "matching_results": 34' +
            '        }' +
            '      ]' +
            '    }' +
            '  }],' +
            '  "retrieval_details": {' +
            '    "document_retrieval_strategy": "relevancy_training"' +
            '  }' +
            '}';
  }

  public static testMethod String queryNoticesResponse() {
    return '{' +
            '  "matching_results": 24, ' +
            '  "results": [' +
            '    {' +
            '      "id": "030ba125-29db-43f2-8552-f941ae30a7a8", ' +
            '      "collection_id": "f1360220-ea2d-4271-9d62-89a910b13c37", ' +
            '      "code": 200, ' +
            '      "score": 1, ' +
            '      "filename": "instructions.html", ' +
            '      "file_type": "html", ' +
            '      "sha1": "de9f2c7fd25e1b3afad3e85a0bd17d9b100db4b3", ' +
            '      "notices": [' +
            '        {' +
            '          "notice_id": "xpath_not_found", ' +
            '          "created": "2016-09-20T17:26:17.000Z", ' +
            '          "document_id": "030ba125-29db-43f2-8552-f941ae30a7a8", ' +
            '          "severity": "warning", ' +
            '          "step": "html-to-html", ' +
            '          "description": "The xpath expression boom was not found."' +
            '        }' +
            '      ]' +
            '    }' +
            '  ], ' +
            '  "aggregations": [{' +
            '    "term": {' +
            '      "results": [' +
            '        {' +
            '          "key": "warning", ' +
            '          "matching_results": 34' +
            '        }' +
            '      ]' +
            '    }' +
            '  }]' +
            '}';
  }

   public static testMethod String trainingQuery() {
    return  '{' +
            '  "query_id": "string", ' +
            '  "natural_language_query": "string", ' +
            '  "filter": "string", ' +
            '  "examples": [' +
            '    {' +
            '      "document_id": "string", ' +
            '      "cross_reference": "string", ' +
            '      "relevance": 0' +
            '    }' +
            '  ]' +
            '}';
  }

  public static testMethod String trainingDataSet() {
    return  '{ "queries": [{' +
            '  "query_id": "string", ' +
            '  "natural_language_query": "string", ' +
            '  "filter": "string", ' +
            '  "examples": [' +
            '    {' +
            '      "document_id": "string", ' +
            '      "cross_reference": "string", ' +
            '      "relevance": 0' +
            '    }' +
            '  ]' +
            '}]}';
  }

  public static testMethod String trainingExample() {
    return  '{' +
            '  "document_id": "string", ' +
            '  "cross_reference": "string", ' +
            '  "relevance": 2' +
            '}';
  }

  public static testMethod String workspace() {
    return '{' +
        '"name": "test_workspace", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"language": "en", ' +
        '"metadata": {' +
          '"code": "test_code"' +
        '}, ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"description": "Description of test_workspace", ' +
        '"status": "Available", ' +
        '"workspace_id": "123456789", ' +
        '"learning_opt_out": false,' +
        '"system_settings": {' +
          '"tooling": {' +
            '"store_generic_responses": true' +
          '},' +
          '"disambiguation": {' +
            '"none_of_the_above_prompt": "none of the above",' +
            '"enabled": true,' +
            '"prompt": "prompt",' +
            '"sensitivity": "high"' +
          '}' +
        '}' +
      '}';
  }

  public static testMethod String workspaceExport() {
    return '{' +
        '"name": "test_workspace", ' +
        '"description": "Description of test_workspace", ' +
        '"language": "en", ' +
        '"metadata": {' +
        '"code": "test_code"' +
        '}, ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"workspace_id": "123456789", ' +
        '"status": "Available", ' +
        '"learning_opt_out": false, ' +
        '"intents": [' +
        '{' +
        '"intent": "test_intent", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"description": "Description of test_intent", ' +
        '"examples": [' +
        '{' +
        '"text": "Example of test_intent", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800"' +
        '}' +
        ']' +
        '}' +
        '], ' +
        '"entities": [' +
        '{' +
        '"entity": "test_entity", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"description": "Description of test_entity", ' +
        '"values": [' +
        '{' +
        '"value": "Value of test_entity", ' +
        '"type": "value_type",' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"synonyms": [' +
        '"Synonym for value of test_entity"' +
        ']' +
        '}' +
        ']' +
        '}' +
        '], ' +
        '"counterexamples": [' +
        '{' +
        '"text": "Counterexample for test_workspace", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800"' +
        '}' +
        '], ' +
        '"dialog_nodes": []' +
        '}';
  }

  public static testMethod String workspaceCollection() {
    return '{' +
        '"workspaces": [' +
        '{' +
        '"name": "test_workspace", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"language": "en", ' +
        '"metadata": {' +
        '"code": "test_code"' +
        '}, ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"description": "Description of test_workspace", ' +
        '"workspace_id": "123456789", ' +
        '"learning_opt_out": false' +
        '}' +
        '], ' +
        '"pagination": {' +
        '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
        '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
        '"total": 1, ' +
        '"matched": 1' +
        '}' +
        '}';
  }

  public static testMethod String value() {
    return '{' +
        '"value": "Value of test_entity", ' +
        '"type": "value_type",' +
        '"metadata": {' +
        '"code": "test_code"' +
        '}, ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"patterns": [' +
        '"test_pattern"' +
        '], ' +
        '"synonyms": [' +
        '"Synonym for value of test_entity"' +
        ']' +
        '}';
  }

  public static testMethod String valueCollection() {
    return '{' +
        '"values": [' +
        '{' +
        '"value": "Value of test_entity", ' +
        '"type": "value_type",' +
        '"metadata": {' +
        '"code": "test_code"' +
        '}, ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"patterns": [' +
        '"test_pattern"' +
        '], ' +
        '"synonyms": [' +
        '"Synonym for value of test_entity"' +
        ']' +
        '}' +
        '], ' +
        '"pagination": {' +
        '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
        '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
        '"total": 1, ' +
        '"matched": 1' +
        '}' +
        '}';
  }

  public static testMethod String messageResponse() {
    return '{' +
        '"intents": [' +
        '{' +
          '"intent": "test_intent", ' +
          '"confidence": 0.314159' +
        '}' +
        '], ' +
        '"entities": [' +
        '{' +
          '"entity": "test_entity", ' +
          '"location": [' +
            '10' +
          '], ' +
          '"value": "Value of test_entity", ' +
          '"confidence": 0.314159' +
        '}' +
        '], ' +
        '"input": {' +
          '"text": "This is a message"' +
        '}, ' +
        '"alternate_intents": false, ' +
        '"context": {' +
          '"conversation_id": "0000000", ' +
          '"system": {' +
            '"dialog_turn_counter": "5"' +
          '}' +
        '}, ' +
        '"output": {' +
          '"text": [' +
            '"This is a response"' +
          '], ' +
          '"nodes_visited": [' +
            '"node_1"' +
          '], ' +
          '"log_messages": [' +
          '{' +
            '"level": "warn", ' +
            '"msg": "test_warning"' +
          '}' +
          '],' +
          '"actions": [ ' +
          '{' +
            '"name": "action",' +
            '"type": "server",' +
            '"parameters": {' +
              '"param_1": "param_1_val"' +
            '},' +
            '"result_variable": "action_var",' +
            '"credentials": "creds"' +
          '}' +
          '],' +
          '"nodes_visited_details": [' +
          '{' +
            '"dialog_node": "node",' +
            '"title": "node_title",' +
            '"conditions": "#condition"' +
          '}' +  
          '],' +
          '"generic": [' +
          '{' +
            '"response_type": "response_type",' +
            '"text": "text",' +
            '"time": 200,' +
            '"typing": true,' +
            '"source": "source",' +
            '"title": "title",' +
            '"description": "description",' +
            '"preference": "preference",' +
            '"options": [' +
            '{' +
              '"label": "label",' +
              '"value": {' +
                '"input": {' +
                  '"text": "text"' +
                '},' +
                '"intents": [' +
                  '{' +
                    '"intent": "test_intent", ' +
                    '"confidence": 0.314159' +
                  '}' +
                '],' +
                '"entities": [' +
                  '{' +
                    '"entity": "test_entity", ' +
                    '"location": [' +
                      '10' +
                    '], ' +
                    '"value": "Value of test_entity", ' +
                    '"confidence": 0.314159' +
                  '}' +
                ']' +
              '}' +
            '}' +
            '],' +
            '"message_to_human_agent": "message_to_human_agent",' +
            '"topic": "topic",' +
            '"dialog_node": "dialog_node",' +
            '"suggestions": [' +
            '{' +
              '"label": "label",' +
              '"value": {' +
                '"input": {' +
                  '"text": "text"' +
                '},' +
                '"intents": [' +
                '{' +
                  '"intent": "test_intent",' +
                  '"confidence": 0.314159' +
                '}' +
                '],' +
                '"entities": [' +
                '{' +
                  '"entity": "test_entity",' +
                  '"location": [' +
                    '10' +
                  '],' +
                  '"value": "Value of test_entity"' +
                '}' +
                ']' +
              '},' +
              '"dialog_node": "dialog_node"' +
            '}' +
            ']' +
          '}' +
          ']' +
        '},' +
        '"actions": [ ' +
        '{' +
          '"name": "action",' +
          '"type": "server",' +
          '"parameters": {' +
            '"param_1": "param_1_val"' +
          '},' +
          '"result_variable": "action_var",' +
          '"credentials": "creds"' +
        '}' +
        ']' +
        '}';
  }

  public static testMethod String intent() {
    return '{' +
        '"intent": "test_intent", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"description": "Description of test_intent"' +
        '}';
  }

  public static testMethod String intentExport() {
    return '{' +
        '"intent": "test_intent", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"description": "Description of test_intent", ' +
        '"examples": [' +
        '{' +
          '"text": "Example of test_intent", ' +
          '"created": "2015-12-06T23:53:59.153Z", ' +
          '"updated": "2017-10-18T15:44:56.800"' +
        '}' +
        ']' +
        '}';
  }

  public static testMethod String intentCollection() {
    return '{' +
        '"intents": [' +
        '{' +
          '"intent": "test_intent", ' +
          '"created": "2015-12-06T23:53:59.153Z", ' +
          '"updated": "2017-10-18T15:44:56.800", ' +
          '"description": "Description of test_intent", ' +
          '"examples": [' +
          '{' +
            '"text": "Example of test_intent", ' +
            '"created": "2015-12-06T23:53:59.153Z", ' +
            '"updated": "2017-10-18T15:44:56.800"' +
          '}' +
          ']' +
        '}' +
        '], ' +
        '"pagination": {' +
          '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
          '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
          '"total": 1, ' +
          '"matched": 1,' +
          '"next_cursor": "next_cursor",' +
          '"refresh_cursor": "refresh_cursor"' +
        '}' +
        '}';
  }

  public static testMethod String example() {
    return '{' +
        '"text": "Example of test_intent", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800"' +
        '}';
  }

  public static testMethod String exampleCollection() {
    return '{' +
        '"examples": [' +
        '{' +
          '"text": "Example of test_intent", ' +
          '"created": "2015-12-06T23:53:59.153Z", ' +
          '"updated": "2017-10-18T15:44:56.800"' +
        '}' +
        '], ' +
        '"pagination": {' +
          '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
          '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
          '"total": 1, ' +
          '"matched": 1' +
        '}' +
        '}';
  }

  public static testMethod String entity() {
    return '{' +
        '"entity": "test_entity", ' +
        '"description": "Description of test_entity", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"metadata": {' +
          '"code": "test_code"' +
        '}, ' +
        '"fuzzy_match": false' +
        '}';
  }

  public static testMethod String entityExport() {
    return '{' +
        '"entity": "test_entity", ' +
        '"description": "Description of test_entity", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"metadata": {' +
        '"code": "test_code"' +
        '}, ' +
        '"fuzzy_match": false, ' +
        '"values": [' +
        '{' +
          '"value": "Value of test_entity", ' +
          '"type": "value_type",' +
          '"metadata": {' +
            '"code": "test_code"' +
          '}, ' +
          '"created": "2015-12-06T23:53:59.153Z", ' +
          '"updated": "2017-10-18T15:44:56.800", ' +
          '"patterns": [' +
            '"test_pattern"' +
          '], ' +
          '"synonyms": [' +
            '"Synonym for value of test_entity"' +
          ']' +
        '}' +
        ']' +
        '}';
  }

  public static testMethod String entityCollection() {
    return '{' +
        '"entities": [' +
        '{' +
          '"entity": "test_entity", ' +
          '"description": "Description of test_entity", ' +
          '"created": "2015-12-06T23:53:59.153Z", ' +
          '"updated": "2017-10-18T15:44:56.800", ' +
          '"metadata": {' +
            '"code": "test_code"' +
          '}, ' +
          '"fuzzy_match": false, ' +
          '"values": [' +
          '{' +
            '"value": "Value of test_entity", ' +
            '"type": "value_type",' +
            '"metadata": {' +
            '"code": "test_code"' +
            '}, ' +
            '"created": "2015-12-06T23:53:59.153Z", ' +
            '"updated": "2017-10-18T15:44:56.800", ' +
            '"patterns": [' +
            '"test_pattern"' +
            '], ' +
            '"synonyms": [' +
            '"Synonym for value of test_entity"' +
            ']' +
          '}' +
          ']' +
        '}' +
        '], ' +
        '"pagination": {' +
          '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
          '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
          '"total": 1, ' +
          '"matched": 1' +
        '}' +
        '}';
  }

  public static testMethod String synonym() {
    return '{' +
        '"synonym": "Synonym for value of test_entity", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800"' +
        '}';
  }

  public static testMethod String synonymCollection() {
    return '{' +
        '"synonyms": [' +
        '{' +
          '"synonym": "Synonym for value of test_entity", ' +
          '"created": "2015-12-06T23:53:59.153Z", ' +
          '"updated": "2017-10-18T15:44:56.800"' +
        '}' +
        '], ' +
        '"pagination": {' +
          '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
          '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
          '"total": 1, ' +
          '"matched": 1' +
        '}' +
        '}';
  }

  public static testMethod String dialogNode() {
    return '{' +
        '"dialog_node": "dialog_node", ' +
        '"description": "Description of dialog_node", ' +
        '"title": "dialog_node_title", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"conditions": "#test", ' +
        '"parent": "parent", ' +
        '"previous_sibling": "sibling", ' +
        '"next_step": {' +
          '"dialog_node": "next_dialog_node", ' +
          '"behavior": "behavior", ' +
          '"selector": "body"' +
        '}, ' +
        '"output": {' +
          '"text": "output text"' +
        '}, ' +
        '"metadata": {' +
          '"code": "test_code"' +
        '}, ' +
        '"context": {' +
          '"context": "context_val"' +
        '}, ' +
        '"actions": [' +
        '{' +
          '"name": "action", ' +
          '"type": "server", ' +
          '"parameters": {' +
            '"param_1": "param_1_val"' +
          '}, ' +
          '"result_variable": "action_var", ' +
          '"credentials": "creds"' +
        '}' +
        '], ' +
        '"type": "standard", ' +
        '"event_name": "dialog_node_event", ' +
        '"variable": "dialog_node_var",' +
        '"digress_in": "returns",' +
        '"digress_out": "allow_all",' +
        '"digress_out_slots": "allow_all"' +
        '}';
  }

  public static testMethod String dialogNodeCollection() {
    return '{' +
        '"dialog_nodes": [' +
        '{' +
        '"dialog_node": "dialog_node", ' +
        '"description": "Description of dialog_node", ' +
        '"title": "dialog_node_title", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800", ' +
        '"conditions": "#test", ' +
        '"parent": "parent", ' +
        '"previous_sibling": "sibling", ' +
        '"next_step": {' +
        '"dialog_node": "next_dialog_node", ' +
        '"behavior": "behavior", ' +
        '"selector": "body"' +
        '}, ' +
        '"output": {' +
        '"text": "output text"' +
        '}, ' +
        '"metadata": {' +
        '"code": "test_code"' +
        '}, ' +
        '"context": {' +
        '"context": "context_val"' +
        '}, ' +
        '"actions": [' +
        '{' +
        '"name": "action", ' +
        '"type": "server", ' +
        '"parameters": {' +
        '"param_1": "param_1_val"' +
        '}, ' +
        '"result_variable": "action_var", ' +
        '"credentials": "creds"' +
        '}' +
        '], ' +
        '"type": "standard", ' +
        '"event_name": "dialog_node_event", ' +
        '"variable": "dialog_node_var"' +
        '}' +
        '], ' +
        '"pagination": {' +
        '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
        '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
        '"total": 1, ' +
        '"matched": 1' +
        '}' +
        '}';
  }

  public static testMethod String logCollection() {
    return '{' +
        '"logs": [' +
        '{' +
          '"request": {' +
            '"input": {' +
            '"text": "This is a message"' +
            '}, ' +
            '"context": {}' +
          '}, ' +
          '"response": {' +
            '"intents": [' +
            '{' +
            '"intent": "test_intent", ' +
            '"confidence": 0.314159' +
            '}' +
            '], ' +
            '"entities": [' +
            '{' +
            '"entity": "test_entity", ' +
            '"location": [' +
              '10' +
            '], ' +
            '"value": "Value of test_entity", ' +
            '"confidence": 0.314159' +
            '}' +
            '], ' +
            '"input": {' +
            '"text": "This is a message"' +
            '}, ' +
            '"alternate_intents": false, ' +
            '"context": {' +
            '"conversation_id": "0000000", ' +
            '"system": {' +
              '"dialog_turn_counter": "5"' +
            '}' +
            '}, ' +
            '"output": {' +
            '"text": [' +
              '"This is a response"' +
            '], ' +
            '"nodes_visited": [' +
              '"node_1"' +
            '], ' +
            '"log_messages": [' +
            '{' +
              '"level": "warn", ' +
              '"msg": "test_warning"' +
            '}' +
            ']' +
            '}' +
          '}, ' +
          '"language": "en", ' +
          '"workspace_id": "123456789", ' +
          '"request_timestamp": "2017-12-06T23:53:59.153Z", ' +
          '"response_timestamp": "2017-12-06T23:54:59.153Z", ' +
          '"log_id": "987654321"' +
        '}' +
        '], ' +
        '"pagination": {' +
          '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
          '"matched": 1,' +
          '"next_cursor": "next_cursor",' +
          '"refresh_cursor": "refresh_cursor"' +
        '}' +
      '}';
  }

  public static testMethod String counterexample() {
    return '{' +
        '"text": "Counterexample for test_workspace", ' +
        '"created": "2015-12-06T23:53:59.153Z", ' +
        '"updated": "2017-10-18T15:44:56.800"' +
        '}';
  }

  public static testMethod String counterexampleCollection() {
    return '{' +
        '"counterexamples": [' +
        '{' +
          '"text": "Counterexample for test_workspace", ' +
          '"created": "2015-12-06T23:53:59.153Z", ' +
          '"updated": "2017-10-18T15:44:56.800"' +
        '}' +
        '], ' +
        '"pagination": {' +
          '"refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1", ' +
          '"next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1", ' +
          '"total": 1, ' +
          '"matched": 1' +
        '}' +
        '}';
  }
  public static testMethod String documentAccepted() {
    return '{' +
            '"document_id": "f1360220-ea2d-4271-9d62-89a910b13c37", ' +
            '"status": "processing"' +
           '}';
  }
  
  public static testMethod String Classify() {
    return '{' +
    '  "classifier_id": "10D41B-nlc-1", ' +
    '  "url": "' +IBMNaturalLanguageClassifierClassifyURL+'", ' +
    '  "text": "How hot will it be today?", ' +
    '  "top_class": "temperature", ' +
    '  "classes": [' +
    '    {' +
    '      "class_name": "temperature", ' +
    '      "confidence": 0.9998201258549781' +
    '    }, ' +
    '    {' +
    '      "class_name": "conditions", ' +
    '      "confidence": 0.00017987414502176904' +
    '    }' +
    '  ]' +
    '}';
  }

  public static testMethod String ClassifyCollection() {
    return '{' +
    '  "classifier_id" : "10D41B-nlc-1",' +
    '  "url" : "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/10D41B-nlc-1",' +
    '  "collection" : [ {' +
    '    "text" : "How hot will it be today?",' +
    '    "top_class" : "temperature",' +
    '    "classes" : [ {' +
    '      "class_name" : "temperature",' +
    '      "confidence" : 0.9930558798985937' +
    '    }, {' +
    '      "class_name" : "conditions",' +
    '      "confidence" : 0.006944120101406304' +
    '    } ]' +
    '  }, {' +
    '    "text" : "Is it hot outside?",' +
    '    "top_class" : "temperature",' +
    '    "classes" : [ {' +
    '      "class_name" : "temperature",' +
    '      "confidence" : 1' +
    '    }, {' +
    '      "class_name" : "conditions",' +
    '      "confidence" : 0' +
    '    } ]' +
    '  } ]' +
    '}';
  }
  
  public static testMethod String CreateClassifier() {
    return '{' +
    '  "classifier_id": "10D41B-nlc-1", ' +
    '  "name": "My Classifier", ' +
    '  "language": "en", ' +
    '  "created": "2015-05-28T18:01:57.393Z", ' +
    '  "url": "' + IBMNaturalLanguageClassifierClassifyBaseURL + '", ' +
    '  "status": "Training", ' +
    '  "status_description": "The classifier instance is in its training phase, not yet ready to accept classify requests"' +
    '}';
  }
  
  public static testMethod String DeleteClassifier() {
    return '{}';
  }

  public static testMethod String getClassifier() {
    return '{' +
    '"classifier_id": "10D41B-nlc-1", ' +
    '"name": "My Classifier", ' +
    '"language": "en", ' +
    '"created": "2015-05-28T18:01:57.393Z", ' +
    '"url": "' +IBMNaturalLanguageClassifierClassifyBaseURL+'", ' +
    '"status": "Available", ' +
    '"status_description": "The classifier instance is now available and is ready to take classifier requests."' +
    '}';
  }
  
  public static testMethod String listClassifiers() {
    return '{' +
    '"classifiers": [' +
    '  {' +
    '    "classifier_id": "10D41B-nlc-1", ' +
    '    "url": "' +IBMNaturalLanguageClassifierClassifyBaseURL+'", ' +
    '    "name": "My Classifier", ' +
    '    "language": "en", ' +
    '    "created": "2015-05-28T18:01:57.393Z"' +
    '  }' +
    ' ]' +
    '}';
  }
  
  public static testMethod String analysisResults() {
    return  '{' +
            '  "entities": [' +
            '    {' +
            '      "type": "Company", ' +
            '      "relevance": 0.89792, ' +
            '      "count": 12, ' +
            '      "name": "IBM", ' +
            '      "disambiguation": {' +
            '        "name": "IBM", ' +
            '        "dbpedia_resource": "http://dbpedia.org/resource/IBM", ' +
            '        "subtype": [' +
            '          "SoftwareLicense", ' +
            '          "OperatingSystemDeveloper", ' +
            '          "ProcessorManufacturer", ' +
            '          "SoftwareDeveloper", ' +
            '          "CompanyFounder", ' +
            '          "ProgrammingLanguageDesigner", ' +
            '          "ProgrammingLanguageDeveloper"' +
            '        ]' +
            '      }, ' +
            '      "sentiment": {' +
            '        "score": 0.099437' +
            '      }, ' +
            '      "emotion": {' +
            '        "sadness": 0.271362, ' +
            '        "joy": 0.618694, ' +
            '        "fear": 0.033186, ' +
            '        "disgust": 0.056113, ' +
            '        "anger": 0.099437' +
            '      },' +
                  '"confidence": 0.5,' +
                  '"mentions": [' +
                    '{' +
                      '"text": "text",' +
                      '"location": [' +
                        '0' +
                      '],' +
                      '"confidence": 0.5' +
                    '}' +
                  ']' +
            '    }' +
            '  ], ' +
            '  "usage": { "features": 4, "text_characters": 40, "text_units": 5}, ' +
            '  "concepts":[{"text": "test", "relevance": 0.66382, "dbpedia_resource": "test"}], ' +
            '  "keywords": [' +
            '    {' +
            '      "emotion": {' +
            '        "sadness": 0.174379, ' +
            '        "joy": 0.66067, ' +
            '        "fear": 0.051475, ' +
            '        "disgust": 0.114401, ' +
            '        "anger": 0.044105' +
            '      }, ' +
            '      "relevance": "0.900808", ' +
            '      "sentiment": {' +
            '        "score": 0.419889' +
            '      }, ' +
            '      "text": "free trial"' +
            '    }' +
            '  ], ' +
            '"categories": [' +
              '{' +
                '"label": "Company",' +
                '"score": 0.89792,' +
                '"explanation": {' +
                  '"relevant_text": [' +
                    '{' +
                      '"text": "text"' +
                    '}' +
                  ']' +
                '}' +
              '}' +
            '],' +
            '  "metadata": { "authors": [{"name": "test"}], "publication_date": "2017-05-16T13:56:54.957Z","title": "test"}, ' +
            '  "emotion": { "targets": [{"text": "test", "score": 0.89792,"emotion": {"anger": 0.099437}}], "document": {"label": "test", "score": 0.89792, "emotion": {"anger": 0.099437}}}, ' +
            '  "relations": [{ "type": "Company", "sentence": "Company", "score": 0.89792,"arguments": [{"entities": [{"text": "test","type": "Company"}],"text": "test"}]}], ' +
            '  "semantic_roles": [{ "sentence": "Company","subject": {"text": "test","entities":[{"type": "Company","text": "test"}],"keywords":[{"text": "test"}]}, "action": {"text": "test","normalized": "test","verb": {"text": "test","tense": "test"}}, "object": {"text": "test","keywords":[{"text": "test"}]}}], ' +
            '  "sentiment": { "targets": [{"text": "test", "score": 0.89792}], "document": {"label": "test", "score": 0.89792}}, ' +
            '  "language": "en", ' +
            '  "retrieved_url": "https://www.ibm.com/us-en/",' +
            '"syntax": {' +
              '"tokens": [' +
                '{' +
                  '"text": "Ginni",' +
                  '"part_of_speech": "PROPN",' +
                  '"location": [' +
                    '0,' +
                    '5' +
                  '],' +
                  '"lemma": "lemma"' +
                '}' +
              '],' +
              '"sentences": [' +
              '{' +
                '"text": "sentence",' +
                '"location": [' +
                    '0,' +
                    '5' +
                  ']' +
              '}' +
              ']' +
            '}' +
          '}';
  }
  
   public static testMethod String listModelsResults() {
    return  '{' +
            '  "models": [' +
            '    {' +
            '      "status": "string", ' +
            '      "model_id": "string", ' +
            '      "language": "string", ' +
            '      "description": "string"' +
            '    }' +
            '  ]' +
            '}';
  }
  
  public static testMethod String profile() {
    return  '{' +
            '  "processed_language": "ar", ' +
            '  "word_count": 0, ' +
            '  "word_count_message": "string", ' +
            '  "personality": [' +
            '    {' +
            '      "trait_id": "string", ' +
            '      "name": "string", ' +
            '      "category": "personality", ' +
            '      "percentile": 0, ' +
            '      "raw_score": 0, ' +
            '      "significant": true, ' +
            '      "children": [' +
            '        {}' +
            '      ]' +
            '    }' +
            '  ], ' +
            '  "values": [' +
            '    {' +
            '      "trait_id": "string", ' +
            '      "name": "string", ' +
            '      "category": "personality", ' +
            '      "percentile": 0, ' +
            '      "raw_score": 0, ' +
            '      "significant": true, ' +
            '      "children": [' +
            '        {}' +
            '      ]' +
            '    }' +
            '  ], ' +
            '  "needs": [' +
            '    {' +
            '      "trait_id": "string", ' +
            '      "name": "string", ' +
            '      "category": "personality", ' +
            '      "percentile": 0, ' +
            '      "raw_score": 0, ' +
            '      "significant": true, ' +
            '      "children": [' +
            '        {}' +
            '      ]' +
            '    }' +
            '  ], ' +
            '  "behavior": [' +
            '    {' +
            '      "trait_id": "string", ' +
            '      "name": "string", ' +
            '      "category": "string", ' +
            '      "percentage": 0' +
            '    }' +
            '  ], ' +
            '  "consumption_preferences": [' +
            '    {' +
            '      "consumption_preference_category_id": "string", ' +
            '      "name": "string", ' +
            '      "consumption_preferences": [' +
            '        {' +
            '          "consumption_preference_id": "string", ' +
            '          "name": "string", ' +
            '          "score": "0.0"' +
            '        }' +
            '      ]' +
            '    }' +
            '  ], ' +
            '  "warnings": [' +
            '    {' +
            '      "warning_id": "WORD_COUNT_MESSAGE", ' +
            '      "message": "string"' +
            '    }' +
            '  ]' +
            '}';
  }
  public static testMethod String toneAnalysis() {
    return  '{' +
            ' "document_tone": {' +
            ' "tones": [' +
            '   {' +
            '     "score": 0, ' +
            '     "tone_id": "string", ' +
            '     "tone_name": "string"' +
            '   }' +
            ' ], ' +
            ' "tone_categories": [' +
            '   {' +
            '     "tones": [' +
            '       {' +
            '         "score": 0, ' +
            '         "tone_id": "string", ' +
            '         "tone_name": "string"' +
            '       }' +
            '     ], ' +
            '     "category_id": "string", ' +
            '     "category_name": "string"' +
            '   }' +
            ' ], ' +
            ' "warning": "string"' +
            '  }, ' +
            '  "sentences_tone": [' +
            '    {' +
            '      "sentence_id": 0, ' +
            '      "text": "string", ' +
            '      "tones": [' +
            '        {' +
            '          "score": 0, ' +
            '          "tone_id": "string", ' +
            '          "tone_name": "string"' +
            '        }' +
            '      ], ' +
            '      "tone_categories": [' +
            '        {' +
            '          "tones": [' +
            '            {' +
            '              "score": 0, ' +
            '              "tone_id": "string", ' +
            '              "tone_name": "string"' +
            '            }' +
            '          ], ' +
            '          "category_id": "string", ' +
            '          "category_name": "string"' +
            '        }' +
            '      ], ' +
            '      "input_from": 0, ' +
            '      "input_to": 0' +
            '    }' +
            '  ]' +
            '}';
  }
  
  public static testMethod String utteranceAnalyses() {
    return  '{' +
            '  "utterances_tone": [' +
            '    {' +
            '      "utterance_id": 0, ' +
            '      "utterance_text": "string", ' +
            '      "tones": [' +
            '        {' +
            '          "score": 0, ' +
            '          "tone_id": "string", ' +
            '          "tone_name": "string"' +
            '        }' +
            '      ], ' +
            '      "error": "string"' +
            '    }' +
            '  ], ' +
            '  "warning": "string"' +
            '}';
  }
  
  public static testMethod String classifiedImages() {
    return  '{' +
                      '  "custom_classes": 0, ' +
                      '  "images_processed": 0, ' +
                      '  "images": [' +
                      '    {' +
                      '      "source_url": "string", ' +
                      '      "resolved_url": "string", ' +
                      '      "image": "string", ' +
                      '      "error": {' +
                      '        "error_id": "string", ' +
                      '        "description": "string"' +
                      '      }, ' +
                      '      "classifiers": [' +
                      '        {' +
                      '          "name": "string", ' +
                      '          "classifier_id": "string", ' +
                      '          "classes": [' +
                      '            {' +
                      '              "class": "string", ' +
                      '              "score": 0, ' +
                      '              "type_hierarchy": "string"' +
                      '            }' +
                      '          ]' +
                      '        }' +
                      '      ]' +
                      '    }' +
                      '  ], ' +
                      '  "warnings": [' +
                      '    {' +
                      '      "warning_id": "string", ' +
                      '      "description": "string"' +
                      '    }' +
                      '  ]' +
                      '}';
  }

  public static testMethod String classifiers() {
    return  '{' +
                      '  "classifiers": [' +
                      '    {' +
                      '      "classifier_id": "string", ' +
                      '      "name": "string", ' +
                      '      "owner": "string", ' +
                      '      "status": "ready", ' +
                      '      "explanation": "string", ' +
                      '      "created": "2017-12-01T17:50:28.684Z", ' +
                      '      "classes": [' +
                      '        {' +
                      '          "class": "string"' +
                      '        }' +
                      '      ]' +
                      '    }' +
                      '  ]' +
                      '}';
  }
  public static testMethod String classifier() {
    return  '{' +
            '      "classifier_id": "string", ' +
            '      "name": "string", ' +
            '      "owner": "string", ' +
            '      "status": "ready", ' +
            '      "explanation": "string", ' +
            '      "created": "2017-12-01T17:50:28.684Z", ' +
            '      "classes": [' +
            '        {' +
            '          "class": "string"' +
            '        }' +
            '      ]' +
            '}';
  }

  public static testMethod String CreateModel() {
    return '{' +
           '  "model_id": "3e7dfdbe-f757-4150-afee-458e71eb93fb"' +
           '}';
  }
  
  public static testMethod String DeleteModel() {
    return '{}';
  }
  
  public static testMethod String GetModel() {
    return '{' +
           '  "models": [{' +
           '  "model_id ": "3e7dfdbe-f757-4150-afee-458e71eb93fb", ' +
           '  "source": "en", ' +
           '  "target": "es", ' +
           '  "base_model_id": "en-es", ' +
           '  "customizable": "false", ' +
           '  "default_model": "false", ' +
           '  "domain": "travel", ' +
           '  "owner": "74a239fa-f2db-42ef-8737-7bf74f49e35f", ' +
           '  "status": "available", ' +
           '  "name": "mymodel"' +
           ' }]' +
           '}';
  }
  
  public static testMethod String ListModels() {
    return '{' +
           '  "models": [{' +
           '  "model_id ": "3e7dfdbe-f757-4150-afee-458e71eb93fb", ' +
           '  "source": "en", ' +
           '  "target": "es", ' +
           '  "base_model_id": "en-es", ' +
           //'  "customizable": "false", ' +
           //'  "default_model": "false", ' +
           '  "domain": "travel", ' +
           '  "owner": "74a239fa-f2db-42ef-8737-7bf74f49e35f", ' +
           '  "status": "available", ' +
           '  "name": "mymodel"' +
           ' }]' +
           '}';
  }
  
  public static testMethod String ListIdentifiableLanguages() {
    return '{' +
           ' "languages": [' +
           '  {' +
           '   "language": "af", ' +
           '   "name": "Afrikaans"' +
           '  }, ' +
           '  {' +
           '   "language": "ar", ' +
           '   "name": "Arabic"' +
           '  }, ' +
           '  {' +
           '   "language": "az", ' +
           '   "name": "Azerbaijani"' +
           '  }, ' +
           '  {' +
           '   "language": "ba", ' +
           '   "name": "Bashkir"' +
           '  }' +
           '  ]' +
           '}';
  }
  
  public static testMethod String Translate() {
    return '{' +
           ' "translations": [{' +
           ' "translation": "Hola"' +
           ' }], ' +
           ' "word_count": 1, ' +
           ' "character_count": 5' +
           '}';
  }
  
  public static testMethod String voices() {
    return '{' +
           ' "voices": [' +
           '   {' +
           '     "url": "string", ' +
           '     "gender": "string", ' +
           '     "name": "string", ' +
           '     "language": "string", ' +
           '     "description": "string", ' +
           '     "customizable": true, ' +
           '     "supported_features": {' +
           '       "custom_pronunciation": true, ' +
           '       "voice_transformation": true' +
           '     }, ' +
           '     "customization": {' +
           '       "customization_id": "string", ' +
           '       "name": "string", ' +
           '       "language": "string", ' +
           '       "owner": "string", ' +
           '       "created": "string", ' +
           '       "last_modified": "string", ' +
           '       "description": "string", ' +
           '       "words": [' +
           '         {' +
           '           "word": "string", ' +
           '           "translation": "string", ' +
           '           "part_of_speech": "Josi"' +
           '         }' +
           '       ]' +
           '     }' +
           '   }' +
           ' ]' +
           '}';
  }
  
  public static testMethod String voice() {
    return '{' +
           '     "url": "string", ' +
           '     "gender": "string", ' +
           '     "name": "string", ' +
           '     "language": "string", ' +
           '     "description": "string", ' +
           '     "customizable": true, ' +
           '     "supported_features": {' +
           '       "custom_pronunciation": true, ' +
           '       "voice_transformation": true' +
           '     }, ' +
           '     "customization": {' +
           '       "customization_id": "string", ' +
           '       "name": "string", ' +
           '       "language": "string", ' +
           '       "owner": "string", ' +
           '       "created": "string", ' +
           '       "last_modified": "string", ' +
           '       "description": "string", ' +
           '       "words": [' +
           '         {' +
           '           "word": "string", ' +
           '           "translation": "string", ' +
           '           "part_of_speech": "Josi"' +
           '         }' +
           '       ]' +
           '     }' +
           '}';
  }
  
  public static testMethod String pronunciation() {
    return '{' +
           '  "pronunciation": "string"' +
           '}';
  }
  
  public static testMethod String voiceModels() {
    return '{' +
           '  "customizations": [' +
           '    {' +
           '      "customization_id": "string", ' +
           '      "name": "string", ' +
           '      "language": "string", ' +
           '      "owner": "string", ' +
           '      "created": "string", ' +
           '      "last_modified": "string", ' +
           '      "description": "string", ' +
           '      "words": [' +
           '        {' +
           '          "word": "string", ' +
           '          "translation": "string", ' +
           '          "part_of_speech": "Josi"' +
           '        }' +
           '      ]' +
           '    }' +
           '  ]' +
           '}';
  }
  
  public static testMethod String voiceModel() {
    return '{' +
           '      "customization_id": "string", ' +
           '      "name": "string", ' +
           '      "language": "string", ' +
           '      "owner": "string", ' +
           '      "created": "string", ' +
           '      "last_modified": "string", ' +
           '      "description": "string", ' +
           '      "words": [' +
           '        {' +
           '          "word": "string", ' +
           '          "translation": "string", ' +
           '          "part_of_speech": "Josi"' +
           '        }' +
           '      ]' +
           '}';
  }
  
  public static testMethod String words() {
    return '{' +
           '  "words": [' +
           '    {' +
           '      "word": "string", ' +
           '      "translation": "string", ' +
           '      "part_of_speech": "Josi"' +
           '    }' +
           '  ]' +
           '}';
  }
  
  public static testMethod String word() {
    return '{' +
           '  "word": "string", ' +
           '  "translation": "string", ' +
           '  "part_of_speech": "Josi"' +
           '}';
  }

  public static testMethod String speechToTextListModels() {
    return '{' +
      ' "models": [' +
      '  {' +
      '    "name": "en-US_NarrowbandModel", ' +
      '    "language": "en-US", ' +
      '    "url": "https://stream.watsonplatform.net/speech-to-text/api/v1/models/en-US_NarrowbandModel", ' +
      '    "rate": 8000, ' +
      '    "supported_features": {' +
      '      "custom_language_model": true, ' +
      '      "speaker_labels": true' +
      '    }, ' +
      '    "description": "US English narrowband model."' +
      '  }, ' +
      '  {' +
      '    "name": "es-ES_BroadbandModel", ' +
      '    "language": "es-ES", ' +
      '    "url": "https://stream.watsonplatform.net/speech-to-text/api/v1/models/es-ES_BroadbandModel", ' +
      '    "rate": 16000, ' +
      '    "supported_features": {' +
      '      "custom_language_model": true, ' +
      '      "speaker_labels": true' +
      '    }, ' +
      '    "description": "Spanish broadband model."' +
      '  }, ' +
      '  {' +
      '    "name": "es-ES_NarrowbandModel", ' +
      '    "language": "es-ES", ' +
      '    "url": "https://stream.watsonplatform.net/speech-to-text/api/v1/models/es-ES_NarrowbandModel", ' +
      '    "rate": 8000, ' +
      '    "supported_features": {' +
      '      "custom_language_model": true, ' +
      '      "speaker_labels": true' +
      '    }, ' +
      '    "description": "Spanish narrowband model."' +
      '  }, ' +
      '  {' +
      '    "name": "en-US_BroadbandModel", ' +
      '    "language": "en-US", ' +
      '    "url": "https://stream.watsonplatform.net/speech-to-text/api/v1/models/en-US_BroadbandModel", ' +
      '    "rate": 16000, ' +
      '    "supported_features": {' +
      '      "custom_language_model": true, ' +
      '      "speaker_labels": true' +
      '    }, ' +
      '    "description": "US English broadband model."' +
      '  }' +
      ' ]' +
      '}';
  }
  
  public static testMethod String speechToTextGetModel() {
    return '{' +
     ' "name": "en-US_NarrowbandModel", ' +
     ' "language": "en-US", ' +
     ' "sessions": "https://stream.watsonplatform.net/speech-to-text/api/v1/sessions?model=en-US_NarrowbandModel", ' +
     ' "url": "https://stream.watsonplatform.net/speech-to-text/api/v1/models/en-US_NarrowbandModel", ' +
     ' "rate": 8000, ' +
     ' "supported_features": {' +
     '   "custom_language_model": true, ' +
     '   "speaker_labels": true' +
     ' }, ' +
     ' "description": "US English narrowband model."' +
     ' }';
  }
  
  public static testMethod String speechToTextCreateJob() {
    return '{' +
      ' "created": "2017-12-13T16:11:55.815Z", ' +
      ' "id": "56d09f2c-e020-11e7-9ee3-33bf91161141", ' +
      ' "url": "https://stream.watsonplatform.net/speech-to-text/api/v1/recognitions/56d09f2c-e020-11e7-9ee3-33bf91161141", ' +
      ' "status": "processing"' +
    '}';
  }
  
  public static testMethod String speechToTextCheckJobCreate() {
    return '{' +
           '  "id": "string", ' +
           '  "status": "waiting", ' +
           '  "created": "string", ' +
           '  "updated": "string", ' +
           '  "url": "string", ' +
           '  "user_token": "string", ' +
           '  "results": [' +
           '    {' +
           '      "results": [' +
           '        {' +
           '          "final": true, ' +
           '          "alternatives": [' +
           '            {' +
           '              "transcript": "string", ' +
           '              "confidence": 0, ' +
           '              "timestamps": [' +
           '                [' +
           '                  "thunderstorms", ' +
           '                  1.49, ' +
           '                  2.32 ' +
           '                ]' +
           '              ], ' +
           '              "word_confidence": [ ' +
           '                [' +
           '                  "thunderstorms", ' +
           '                  1' +
           '                ]' +
           '              ]' +
           '            }' +
           '          ], ' +
           '          "keywords_result": {' +
           '            "keyword": [' +
           '              {' +
           '                "normalized_text": "string", ' +
           '                "start_time": 0, ' +
           '                "end_time": 0, ' +
           '                "confidence": 0' +
           '              }' +
           '            ]' +
           '          }, ' +
           '          "word_alternatives": [' +
           '            {' +
           '              "start_time": 0, ' +
           '              "end_time": 0, ' +
           '              "alternatives": [' +
           '                {' +
           '                  "confidence": 0, ' +
           '                  "word": "string"' +
           '                }' +
           '              ]' +
           '            }' +
           '          ],' +
           '          "end_of_utterance": "end_of_data"' +
           '        }' +
           '      ], ' +
           '      "result_index": 0, ' +
           '      "speaker_labels": [' +
           '        {' +
           '          "from": 0, ' +
           '          "to": 0, ' +
           '          "speaker": 0, ' +
           '          "confidence": 0, ' +
           '          "final": true' +
           '        }' +
           '      ], ' +
           '      "warnings": [' +
           '        "string"' +
           '      ]' +
           '    }' +
           '  ], ' +
           '  "warnings": [' +
           '    "string"' +
           '  ]' +
           '}';
  }
  
  public static testMethod String speechToTextCheckJob() {
    return '{' +
      ' "created": "2017-12-13T16:11:55.815Z", ' +
      ' "id": "56d09f2c-e020-11e7-9ee3-33bf91161141", ' +
      ' "updated": "2017-12-13T16:11:57.393Z", ' +
      ' "status": "failed"' +
      '}';
  }
  
  public static testMethod String speechToTextCheckJobs() {
    return '{' +
      ' "recognitions": [' +
      ' {' +
      '   "created": "2017-12-13T16:11:55.815Z", ' +
      '   "id": "56d09f2c-e020-11e7-9ee3-33bf91161141", ' +
      '   "updated": "2017-12-13T16:11:57.393Z", ' +
      '   "status": "completed"' +
      ' }' +
    ' ]' +
    ' }';
  }
  
  public static testMethod String speechToTextDeleteJob() {
    return '{}';
  }
  
  public static testMethod String speechToTextRegisterCallback() {
    return '{' +
    ' "status": "created", ' +
    ' "url": "https://ibmdf17-watson-dxhub.my.salesforce.com/"' +
    '}';
  }
  
  public static testMethod String speechToTextUnRegisterCallback() {
    return '{}';
  }
  
  public static testMethod String speechToTextListLanguageModels() {
    return '{' +
      ' "customizations": [' +
      ' {' +
      '  "owner": "952e2069-9ece-48d8-96c9-0206b4473819", ' +
      '  "base_model_name": "en-US_BroadbandModel", ' +
      '  "customization_id": "d0bdc477-59e6-4e45-86f3-1a9a39664eb5", ' +
      '  "dialect": "en-US", ' +
      '  "created": "2017-12-11T17:50:11.862Z", ' +
      '  "name": "custom_en_US", ' +
      '  "description": "language customization", ' +
      '  "progress": 100, ' +
      '  "language": "en-US", ' +
      '  "status": "available"' +
      ' }' +
      ']' +
      '}';
  }
  
  public static testMethod String speechToTextGetLanguageModel() {
    return '{' +
      ' "owner": "952e2069-9ece-48d8-96c9-0206b4473819", ' +
      ' "base_model_name": "en-US_BroadbandModel", ' +
      ' "customization_id": "d0bdc477-59e6-4e45-86f3-1a9a39664eb5", ' +
      ' "dialect": "en-US", ' +
      ' "created": "2017-12-11T17:50:11.862Z", ' +
      ' "name": "custom_en_US", ' +
      ' "description": "language customization", ' +
      ' "progress": 100, ' +
      ' "language": "en-US", ' +
      ' "status": "available", ' +
      ' "dialect": "customization", ' +
      ' "warnings": "customization",' +
      ' "updated": "2019-10-11T19:16:58.547Z"' +
      ' }';
  }
  
  public static testMethod String speechToTextTrainLanguageModel() {
    return '{' +
      '"warnings": [' +
        '{' +
          '"description": "description",' +
          '"warning_id": "warning_id"' +
        '}' +
      ']' +
    '}';
  }
  
  public static testMethod String speechToTextUpgradeLanguageModel() {
    return '{}';
  }
  
  public static testMethod String speechToTextResetLanguageModel() {
    return '{}';
  }

  public static testMethod String speechToTextDeleteLanguageModel() {
    return '{}';
  }

  public static testMethod String speechToTextListCorpora() {
    return '{' +
      ' "corpora": [' +
      ' {' +
      '   "out_of_vocabulary_words": 3, ' +
      '   "total_words": 160, ' +
      '   "name": "custom_corpus", ' +
      '   "status": "analyzed"' +
      ' }' +
      ']' +
      '}';
  }

  public static testMethod String speechToTextGetCorpus() {
    return '{' +
      ' "out_of_vocabulary_words": 3, ' +
      ' "total_words": 160, ' +
      ' "name": "custom_corpus", ' +
      ' "status": "analyzed", ' +
      ' "error": "none"' +
      '}';
  }

  public static testMethod String speechToTextDeleteCorpus() {
    return '{}';
  }
  
  public static testMethod String speechToTextAddCorpus() {
    return '{}';
  }

  public static testMethod String speechToTextDeleteWord() {
    return '{}';
  }

  public static testMethod String speechToTextGetWord() {
    return '{' +
      ' "display_as": "words matter", ' +
      ' "sounds_like": [' +
      '   "words matter"' +
      ' ], ' +
      ' "count": 2, ' +
      ' "source": [' +
       '  "custom_corpus"' +
      ' ], ' +
      ' "error": [{' +
      '  "element": "custom_corpus"' +
      ' }], ' +
      ' "word": "words matter"' +
      '}';
  }
  
  public static testMethod String speechToTextListWords() {
    return '{' +
      ' "words": [' +
      ' {' +
      ' "display_as": "words matter", ' +
      ' "sounds_like": [' +
      '   "words matter"' +
      ' ], ' +
      ' "count": 2, ' +
      ' "source": [' +
      '  "custom_corpus"' +
      ' ], ' +
      ' "error": [{' +
       '  "element": "custom_corpus"' +
      ' }], ' +
      ' "word": "words matter"' +
      '}]}';
  }
  
  
  public static testMethod String speechToTextListAcousticModels() {
    return '{' +
      ' "customizations": [' +
      '   {' +
      '     "owner": "952e2069-9ece-48d8-96c9-0206b4473819", ' +
      '     "base_model_name": "en-US_BroadbandModel", ' +
      '     "customization_id": "825485d7-af3f-44e7-b1ea-76130dec8a61", ' +
      '     "created": "2017-12-11T17:57:06.654Z", ' +
      '     "name": "custom acoustic", ' +
      '     "description": "customization", ' +
      '     "progress": 0, ' +
      '     "language": "en-US", ' +
      '     "status": "ready"' +
      '   }' +
      ' ]' +
      '}';
  }
  
  public static testMethod String speechToTextGetAcousticModel() {
    return '{' +
      ' "owner": "952e2069-9ece-48d8-96c9-0206b4473819", ' +
      ' "base_model_name": "en-US_BroadbandModel", ' +
      ' "customization_id": "825485d7-af3f-44e7-b1ea-76130dec8a61", ' +
      ' "created": "2017-12-11T17:57:06.654Z", ' +
      ' "name": "custom acoustic", ' +
      ' "description": "customization", ' +
      ' "progress": 0, ' +
      ' "language": "en-US", ' +
      ' "status": "ready", ' +
      ' "warnings": "customization",' +
      ' "updated": "2019-10-11T19:16:58.547Z"' +
      '}';
  }

  public static testMethod String speechToTextDeleteAcousticModel() {
    return '{}';
  }
  
  public static testMethod String speechToTextTrainAcousticModel() {
    return '{}';
  }

  public static testMethod String speechToTextResetAcousticModel() {
    return '{}';
  }

  public static testMethod String speechToTextDeleteAudio() {
    return '{}';
  }
  
  public static testMethod String speechToTextGetAudio() {
    return '{' +
      '  "duration": 0, ' +
      '  "name": "string", ' +
      '  "details": {' +
      '   "type": "audio", ' +
      '   "codec": "string", ' +
      '   "frequency": 0, ' +
      '   "compression": "zip"' +
      '  }, ' +
      ' "status": "ok", ' +
      ' "container": ' +
      '  {' +
      '   "duration": 0, ' +
      '   "name": "string", ' +
      '   "details": {' +
      '   "type": "audio", ' +
      '   "codec": "string", ' +
      '   "frequency": 0, ' +
      '   "compression": "zip"' +
      '  }, ' +
      ' "status": "ok"' +
      ' }, ' +
      ' "audio": [' +
      '  {' +
      '   "duration": 0, ' +
      '   "name": "string", ' +
      '   "details": {' +
      '   "type": "audio", ' +
      '   "codec": "string", ' +
      '   "frequency": 0, ' +
      '   "compression": "zip"' +
      '  }, ' +
      ' "status": "ok"' +
      '}' +
      ']' +
      '}';
  }
  
  public static testMethod String speechToTextListAudio() {
    return '{}';
  }
  
  public static testMethod String speechToTextAddAudio() {
    return '{}';
  }
  
  public static testMethod String speechToTextAddWord() {
    return '{}';
  }
  
  public static testMethod String speechToTextCreateAcousticModel() {
    return '{}';
  }
  
  public static testMethod String speechToTextCreateLanguageModel() {
    return '{' +
     ' "customization_id": "74f4807e-b5ff-4866-824e-6bba1a84fe96", ' +
     ' "owner": "952e2069-9ece-48d8-96c9-0206b4473819", ' +
     ' "base_model_name": "en-US_BroadbandModel", ' +
     ' "created": "2017-12-11T17:57:06.654Z", ' +
     ' "name": "custom acoustic", ' +
     ' "description": "customization", ' +
     ' "progress": 0, ' +
     ' "language": "en-US", ' +
     ' "status": "ready", ' +
     ' "dialect": "customization", ' +
     ' "warnings": "customization"' +
     '}';
  }

  public static testMethod String speechToTextRecognize() {
    return ' {' +
      '"results": [' +
      '  {' +
      '    "word_alternatives": [' +
      '      {' +
      '        "start_time": 0.14, ' +
      '        "alternatives": [' +
      '          {' +
      '            "confidence": 1, ' +
      '            "word": "a"' +
      '          }' +
      '        ], ' +
      '        "end_time": 0.28' +
      '      }, ' +
      '      {' +
      '        "start_time": 5.33, ' +
      '        "alternatives": [' +
      '          {' +
      '            "confidence": 0.9953, ' +
      '            "word": "Sunday"' +
      '          }' +
      '        ], ' +
      '        "end_time": 6.04' +
      '      }' +
      '    ], ' +
      '    "keywords_result": {' +
      '      "tornadoes": [' +
      '        {' +
      '          "normalized_text": "tornadoes", ' +
      '          "start_time": 3.03, ' +
      '          "confidence": 0.953, ' +
      '          "end_time": 3.85' +
      '        }' +
      '      ], ' +
      '      "colorado": [' +
      '        {' +
      '          "normalized_text": "Colorado", ' +
      '          "start_time": 4.59, ' +
      '          "confidence": 0.999, ' +
      '          "end_time": 5.18' +
      '        }' +
      '      ]' +
      '    }, ' +
      '    "alternatives": [' +
      '      {' +
      '        "timestamps": [' +
      '          [' +
      '            "a", ' +
      '            0.14, ' +
      '            0.28' +
      '          ], ' +
      '          [' +
      '            "Sunday", ' +
      '            5.33, ' +
      '            6.04' +
      '          ]' +
      '        ], ' +
      '        "confidence": 0.983, ' +
      '        "transcript": "a line of severe thunderstorms with several possible tornadoes is approaching Colorado on Sunday "' +
      '      }' +
      '    ], ' +
      '    "final": true,' +
      '    "end_of_utterance": "end_of_data"' +
      '  }' +
      '], ' +
      '"result_index": 0,' +
      '"audio_metrics": {' +
        '"sampling_interval": 0.1,' +
        '"accumulated": {' +
          '"final": true,' +
          '"end_time": 0.2,' +
          '"speech_ratio": 0.4,' +
          '"high_frequency_loss": 0.5,' +
          '"signal_to_noise_ratio": 0.3,' +
          '"direct_current_offset": [' +
            '{' +
              '"begin": 3.1,' +
              '"end": 6.2,' +
              '"count": 10' +
            '}' +
          '],' +
          '"clipping_rate": [' +
            '{' +
              '"begin": 3.1,' +
              '"end": 6.2,' +
              '"count": 10' +
            '}' +
          '],' +
          '"speech_level": [' +
            '{' +
              '"begin": 3.1,' +
              '"end": 6.2,' +
              '"count": 10' +
            '}' +
          '],' +
          '"non_speech_level": [' +
            '{' +
              '"begin": 3.1,' +
              '"end": 6.2,' +
              '"count": 10' +
            '}' +
          ']' +
        '}' +
      '},' +
      '"processing_metrics": {' +
        '"processed_audio": {' +
          '"received": 300.0,' +
          '"seen_by_engine": 400.0,' +
          '"transcription": 500.0,' +
          '"speaker_labels": 600.0' +
        '},' +
        '"wall_clock_since_first_byte_received": 47.0,' +
        '"periodic": true' +
      '}' +
    '}';
  }
  
  public static testMethod String expansionsResponse() {
    return '{' +
    ' "expansions": [' +
    ' {' +
    '   "input_terms": [' +
    '     "weekday",' +
    '     "week day"' +
    '   ],' +
    '   "expanded_terms": [' +
    '     "monday",' +
    '     "tuesday",' +
    '     "wednesday",' +
    '     "thursday",' +
    '     "friday"' +
    '   ]' +
    ' },' +
    ' {' +
    '   "input_terms": [' +
    '     "weekend",' +
    '     "week end"' +
    '   ],' +
    '   "expanded_terms": [' +
    '     "saturday",' +
    '     "sunday"' +
    '   ]' +
    ' }' +
    ' ]' +
    '}';
  }

  public static testMethod String validTokenData() {
    return '{' +
      '"access_token": "aaaa-1111",' +
      '"refresh_token": "99999999",' +
      '"token_type": "Bearer",' +
      '"expires_in": 3600,' +
      '"expiration": 999999999999999999' +
    '}';
  }

  public static testMethod String expiredTokenData() {
    return '{' +
      '"access_token": "wxyz-9876",' +
      '"refresh_token": "00000000",' +
      '"token_type": "Bearer",' +
      '"expires_in": 3600,' +
      '"expiration": 10000' +
    '}';
  }

  public static testMethod String credentials() {
    return '{' +
      '"credential_id" : "00000d8c-0000-00e8-ba89-0ed5f89f718b",' +
      '"source_type" : "salesforce",' +
      '"credential_details" : {' +
        '"credential_type" : "username_password",' +
        '"url" : "login.salesforce.com",' +
        '"username" : "user@email.address"' +
      '},' +
      '"status" : "connected"' +
    '}';
  }

  public static testMethod String credentialList() {
    return '{' +
      '"credentials" : [ {' +
      '"credential_id" : "00000d8c-0000-00e8-ba89-0ed5f89f718b",' +
      '"source_type" : "salesforce",' +
      '"credential_details" : {' +
        '"credential_type" : "username_password",' +
        '"url" : "login.salesforce.com",' +
        '"username" : "user@email.address"' +
      '}' +
    '}, {' +
      '"credential_id" : "00000d8c-0000-00e8-ba89-0ed5f89f111c",' +
      '"source_type" : "box",' +
      '"credential_details" : {' +
        '"credential_type" : "oauth2",' +
        '"client_id" : "1234567899bz7micz6x6p5zfnycw98e3",' +
        '"enterprise_id" : "000000001"' +
      '}' +
    '}, {' +
      '"credential_id" : "00000d8c-0000-00e8-ba22-0ed5f89f999d",' +
      '"source_type" : "sharepoint",' +
      '"credential_details" : {' +
        '"credential_type" : "saml",' +
        '"organization_url" : "https://site001.sharepointonline.com",' +
        '"site_collection_path" : "/sites/TestSite1",' +
        '"username" : "userA@sharepointonline.com"' +
      '}' +
    '} ]' +
  '}';
  }

  public static testMethod String mentions() {
    return '{' +
      '"examples" : [ {' +
        '"text" : "I would like to order a pizza",' +
        '"intent" : "FoodTypes",' +
        '"location" : [ 20, 24 ]' +
      '} ]' +
    '}';
  }

  public static testMethod String createEventResponse() {
    return '{' +
      '"type": "click",' +
      '"data": {' +
        '"environment_id": "5ae96bb9-80e5-43ea-916e-1f3412fbc283",' +
        '"session_token": "mock_session_token",' +
        '"client_timestamp": "2017-07-14T12:55:40.652Z",' +
        '"display_rank": 1,' +
        '"collection_id": "mock_collid",' +
        '"document_id": "mock_docid",' +
        '"query_id": "mock_queryid"' +
      '}' +
    '}';
  }

  public static testMethod String logQueryResponse() {
    return '{' +
      '"matching_results": 2,' +
      '"results": [' +
        '{' +
          '"environment_id": "5ae96bb9-80e5-43ea-916e-1f3412fbc283",' +
          '"customer_id": "",' +
          '"natural_language_query": "Who beat Ken Jennings in Jeopardy!",' +
          '"document_results": {' +
            '"results": [],' +
            '"count": 0' +
          '},' +
          '"created_timestamp": "2017-07-14T12:55:40.652Z",' +
          '"query_id": "mock_queryid",' +
          '"session_token": "mock_session_token",' +
          '"event_type": "query"' +
        '},' +
        '{' +
          '"environment_id": "5ae96bb9-80e5-43ea-916e-1f3412fbc283",' +
          '"customer_id": "",' +
          '"document_results": {' +
            '"results": [' +
              '{' +
                '"position": 1,' +
                '"document_id": "mock_docid",' +
                '"score": 1.0,' +
                '"collection_id": "mock_collid"' +
              '},' +
              '{' +
                '"position": 2,' +
                '"document_id": "mock_docid",' +
                '"score": 1.0,' +
                '"collection_id": "mock_collid"' +
              '}' +
            '],' +
            '"count": 2' +
          '},' +
          '"created_timestamp": "2017-07-14T12:55:40.652Z",' +
          '"query_id": "mock_queryid",' +
          '"session_token": "mock_session_token",' +
          '"event_type": "query"' +
        '}' +
      ']' +
    '}'; 
  }

  public static testMethod String metricResponse() {
    return '{' +
      '"aggregations": [' +
        '{' +
          '"interval": "1d",' +
          '"event_type": "click",' +
          '"results": [' +
            '{' +
              '"key_as_string": "2018-08-05T20:00:00.000",' +
              '"key": 1533513600000,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key_as_string": "2018-08-06T20:00:00.000",' +
              '"key": 1533600000000,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key_as_string": "2018-08-07T20:00:00.000",' +
              '"key": 1533686400000,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key_as_string": "2018-08-08T20:00:00.000",' +
              '"key": 1533772800000,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key_as_string": "2018-08-09T20:00:00.000",' +
              '"key": 1533859200000,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key_as_string": "2018-08-10T20:00:00.000",' +
              '"key": 1533945600000,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key_as_string": "2018-08-11T20:00:00.000",' +
              '"key": 1534032000000,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key_as_string": "2018-08-12T20:00:00.000",' +
              '"key": 1534118400000,' +
              '"event_rate": 0.09090909090909091' +
            '}' +
          ']' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String metricTokenResponse() {
    return '{' +
      '"aggregations": [' +
        '{' +
          '"event_type": "click",' +
          '"results": [' +
            '{' +
              '"key": "beat",' +
              '"matching_results": 117,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key": "in",' +
              '"matching_results": 117,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key": "jennings",' +
              '"matching_results": 117,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key": "jeopardy",' +
              '"matching_results": 117,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key": "ken",' +
              '"matching_results": 117,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key": "who",' +
              '"matching_results": 117,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key": "watson",' +
              '"matching_results": 3,' +
              '"event_rate": 0.0' +
            '},' +
            '{' +
              '"key": "1",' +
              '"matching_results": 2,' +
              '"event_rate": 0.5' +
            '},' +
            '{' +
              '"key": "field",' +
              '"matching_results": 2,' +
              '"event_rate": 0.5' +
            '},' +
            '{' +
              '"key": "number",' +
              '"matching_results": 2,' +
              '"event_rate": 0.5' +
            '}' +
          ']' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String messageResponseV2() {
    return '{' +
      '"context": {' +
        '"global": {' +
          '"system": {' +
            '"timezone": "timezone",' +
            '"user_id": "user_id",' +
            '"turn_count": "10"' +
          '}' +
        '},' +
        '"skills": {' +
          '"skill_key": "skill_var"' +
        '}' +
      '},' +
      '"output": {' +
        '"generic": [' +
          '{' +
            '"response_type": "text",' +
            '"text": "text",' +
            '"time": 1234,' +
            '"typing": true,' +
            '"source": "source",' +
            '"title": "title",' +
            '"description": "description",' +
            '"preference": "button",' +
            '"options": [' +
              '{' +
                '"label": "label",' +
                '"value": {' +
                  '"input": {' +
                    '"message_type": "text",' +
                    '"text": "text",' +
                    '"options": {' +
                      '"debug": true,' +
                      '"restart": true,' +
                      '"alternate_intents": true,' +
                      '"return_context": true' +
                    '},' +
                    '"intents": [' +
                      '{' +
                        '"intent": "intent",' +
                        '"confidence": 0.0' +
                      '}' +
                    '],' +
                    '"entities": [' +
                      '{' +
                        '"entity": "entity",' +
                        '"location": [' +
                          '1,' +
                          '2' +
                        '],' +
                        '"value": "value",' +
                        '"confidence": 0.0,' +
                        '"metadata": {' +
                          '"key": "value"' +
                        '},' +
                        '"groups": [' +
                          '{' +
                            '"group": "group",' +
                            '"location": [' +
                              '1,' +
                              '2' +
                            ']' +
                          '}' +
                        ']' +
                      '}' +
                    '],' +
                    '"suggestion_id": "suggestion_id"' +
                  '}' +
                '}' +
              '}' +
            '],' +
            '"message_to_human_agent": "message",' +
            '"topic": "topic",' +
            '"suggestions": [' +
              '{' +
                '"label": "label",' +
                '"value": {' +
                  '"input": {' +
                    '"message_type": "text",' +
                    '"text": "text",' +
                    '"options": {' +
                      '"debug": true,' +
                      '"restart": true,' +
                      '"alternate_intents": true,' +
                      '"return_context": true' +
                    '},' +
                    '"intents": [' +
                      '{' +
                        '"intent": "intent",' +
                        '"confidence": 0.0' +
                      '}' +
                    '],' +
                    '"entities": [' +
                      '{' +
                        '"entity": "entity",' +
                        '"location": [' +
                          '1,' +
                          '2' +
                        '],' +
                        '"value": "value",' +
                        '"confidence": 0.0,' +
                        '"metadata": {' +
                          '"key": "value"' +
                        '},' +
                        '"groups": [' +
                          '{' +
                            '"group": "group",' +
                            '"location": [' +
                              '1,' +
                              '2' +
                            ']' +
                          '}' +
                        ']' +
                      '}' +
                    '],' +
                    '"suggestion_id": "suggestion_id"' +
                  '}' +
                '},' +
                '"output": {' +
                  '"key": "value"' +
                '}' +
              '}' +
            ']' +
          '}' +
        '],' +
        '"intents": [' +
          '{' +
            '"intent": "intent",' +
            '"confidence": 0.0' +
          '}' +
        '],' +
        '"entities": [' +
          '{' +
            '"entity": "entity",' +
            '"location": [' +
              '1,' +
              '2' +
            '],' +
            '"value": "value",' +
            '"confidence": 0.0,' +
            '"metadata": {' +
              '"key": "value"' +
            '},' +
            '"groups": [' +
              '{' +
                '"group": "group",' +
                '"location": [' +
                  '1,' +
                  '2' +
                ']' +
              '}' +
            ']' +
          '}' +
        '],' +
        '"actions": [' +
          '{' +
            '"name": "name",' +
            '"type": "client",' +
            '"parameters": {' +
              '"key": "value"' +
            '},' +
            '"result_variable": "result_variable",' +
            '"credentials": "credentials"' +
          '}' +
        '],' +
        '"debug": {' +
          '"nodes_visited": [' +
            '{' +
              '"dialog_node": "dialog_node",' +
              '"title": "title",' +
              '"conditions": "conditions"' +
            '}' +
          '],' +
          '"log_messages": [' +
            '{' +
              '"level": "info",' +
              '"message": "message"' +
            '}' +
          '],' +
          '"branch_exited": true,' +
          '"branch_exited_reason": "completed"' +
        '},' +
        '"user_defined": {' +
          '"key": "value"' +
        '}' +
      '}' +
    '}';
  }

  public static testMethod String sessionResponse() {
    return '{' +
      '"session_id": "session_id"' +
    '}';
  }

  public static testMethod String tokenDictStatusResponse() {
    return '{' +
      '"status" : "active",' +
      '"type" : "tokenization_dictionary"' +
    '}';
  }

  public static testMethod String tokenDictStatusResponseStopwords() {
    return '{' +
      '"status" : "active",' +
      '"type" : "stopwords"' +
    '}';
  }

  public static testMethod String batchStatusResponse() {
    return '{' +
      '"function": "element_classification",' +
      '"input_bucket_location": "bucket_location",' +
      '"input_bucket_name": "bucket_name",' +
      '"output_bucket_location": "bucket_location",' +
      '"output_bucket_name": "bucket_name",' +
      '"batch_id": "batch_id",' +
      '"document_counts": {' +
        '"total": 1000,' +
        '"pending": 300,' +
        '"successful": 400,' +
        '"failed": 500' +
      '},' +
      '"status": "status",' +
      '"created": "1995-06-12T01:11:11.111Z",' +
      '"updated": "1995-06-12T01:11:11.111Z"' +
    '}';
  }

  public static testMethod String batchesResponse() {
    return '{' +
      '"batches": [' +
        '{' +
          '"function": "element_classification",' +
          '"input_bucket_location": "bucket_location",' +
          '"input_bucket_name": "bucket_name",' +
          '"output_bucket_location": "bucket_location",' +
          '"output_bucket_name": "bucket_name",' +
          '"batch_id": "batch_id",' +
          '"document_counts": {' +
            '"total": 1000,' +
            '"pending": 300,' +
            '"successful": 400,' +
            '"failed": 500' +
          '},' +
          '"status": "status",' +
          '"created": "1995-06-12T01:11:11.111Z",' +
          '"updated": "1995-06-12T01:11:11.111Z"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String classifyReturnResponse() {
    return '{' +
      '"document": {' +
        '"title": "title",' +
        '"html": "html",' +
        '"hash": "hash",' +
        '"label": "label"' +
      '},' +
      '"model_id": "model_id",' +
      '"model_version": "model_version",' +
      '"elements": [' +
        '{' +
          '"location": {' +
          '"begin": 0,' +
          '"end": 1' +
          '},' +
          '"text": "text",' +
          '"types": [' +
            '{' +
              '"label": {' +
                '"nature": "nature",' +
                '"party": "party"' +
              '},' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"categories": [' +
            '{' +
              '"label": "label",' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"attributes": [' +
            '{' +
              '"type": "type",' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '}' +
            '}' +
          ']' +
        '}' +
      '],' +
      '"tables": [' +
        '{' +
          '"location": {' +
          '  "begin": 0,' +
          '  "end": 1' +
          '},' +
          '"text": "text",' +
          '"section_title": {' +
          '  "location": {' +
          '    "begin": 0,' +
          '    "end": 1' +
          '  }' +
          '},' +
          '"table_headers": [' +
          '  {' +
          '    "cell_id": "cell_id",' +
          '    "location": {' +
          '      "begin": 0,' +
          '      "end": 1' +
          '    },' +
          '    "text": "text",' +
          '    "row_index_begin": 2000,' +
          '    "row_index_end": 3000,' +
          '    "column_index_begin": 4000,' +
          '    "column_index_end": 5000' +
          '  }' +
          '],' +
          '"row_headers": [' +
          '  {' +
          '    "cell_id": "cell_id",' +
          '    "location": {' +
          '      "begin": 0,' +
          '      "end": 1' +
          '    },' +
          '    "text": "text",' +
          '    "text_normalized": "text_normalized",' +
          '    "row_index_begin": 2000,' +
          '    "row_index_end": 3000,' +
          '    "column_index_begin": 4000,' +
          '    "column_index_end": 5000' +
          '  }' +
          '],' +
          '"column_headers": [' +
          '  {' +
          '    "cell_id": "cell_id",' +
          '    "location": {' +
          '      "begin": 0,' +
          '      "end": 1' +
          '    },' +
          '    "text": "text",' +
          '    "text_normalized": "text_normalized",' +
          '    "row_index_begin": 2000,' +
          '    "row_index_end": 3000,' +
          '    "column_index_begin": 4000,' +
          '    "column_index_end": 5000' +
          '  }' +
          '],' +
          '"body_cells": [' +
            '{' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text",' +
              '"row_index_begin": 2000,' +
              '"row_index_end": 3000,' +
              '"column_index_begin": 4000,' +
              '"column_index_end": 5000,' +
              '"row_header_ids": [' +
                '"id"' +
              '],' +
              '"row_header_texts": [' +
                '"text"' +
              '],' +
              '"row_header_texts_normalized": [' +
                '"text_normalized"' +
              '],' +
              '"column_header_ids": [' +
                '"id"' +
              '],' +
              '"column_header_texts": [' +
                '"text"' +
              '],' +
              '"column_header_texts_normalized": [' +
                '"text_normalized"' +
              '],' +
              '"attributes": [' +
              '  {' +
              '    "type": "type",' +
              '    "text": "text",' +
              '    "location": {' +
              '      "begin": 0,' +
              '      "end": 1' +
              '    }' +
              '  }' +
              ']' +
            '}' +
          '],' +
          '"key_value_pairs": [' +
          '{' +
            '"key": {' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text"' +
            '},' +
            '"value": [{' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text"' +
            '}]' +
          '}' +
          '],' +
          '"title": {' +
            '"text": "text",' +
            '"location": {' +
              '"begin": 0,' +
              '"end": 1' +
            '}' +
          '},' +
          '"contexts": [' +
            '{' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '}' +
            '}' +
          ']' +
        '}' +
      '],' +
      '"document_structure": {' +
        '"section_titles": [' +
          '{' +
            '"text": "text",' +
            '"location": {' +
              '"begin": 0,' +
              '"end": 1' +
            '},' +
            '"level": 12,' +
            '"element_locations": [' +
              '{' +
                '"begin": 0,' +
                '"end": 1' +
              '}' +
            ']' +
          '}' +
        '],' +
        '"leading_sentences": [' +
          '{' +
            '"text": "text",' +
            '"location": {' +
              '"begin": 0,' +
              '"end": 1' +
            '},' +
            '"element_locations": [' +
              '{' +
                '"begin": 0,' +
                '"end": 1' +
              '}' +
            ']' +
          '}' +
        '],' +
        '"paragraphs": [' +
          '{' +
            '"location": {' +
              '"begin": 0,' +
              '"end": 1' +
            '}' +
          '}' +
        ']' +
      '},' +
      '"parties": [' +
        '{' +
          '"party": "party",' +
          '"importance": "Unknown",' +
          '"role": "role",' +
          '"addresses": [' +
            '{' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '}' +
            '}' +
          '],' +
          '"contacts": [' +
            '{' +
              '"name": "name",' +
              '"role": "role"' +
            '}' +
          '],' +
          '"mentions": [' +
            '{' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '}' +
            '}' +
          ']' +
        '}' +
      '],' +
      '"effective_dates": [' +
        '{' +
          '"text": "text",' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '},' +
          '"confidence_level": "High",' +
          '"text_normalized": "text_normalized",' +
          '"provenance_ids": [' +
            '"provenance_id"' +
          ']' +
        '}' +
      '],' +
      '"contract_amounts": [' +
        '{' +
          '"text": "text",' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '},' +
          '"confidence_level": "High",' +
          '"text_normalized": "text_normalized",' +
          '"interpretation": {' +
            '"value": "value",' +
            '"numeric_value": 21,' +
            '"unit": "unit"' +
          '},' +
          '"provenance_ids": [' +
            '"provenance_id"' +
          ']' +
        '}' +
      '],' +
      '"termination_dates": [' +
        '{' +
          '"text": "text",' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '},' +
          '"confidence_level": "High",' +
          '"text_normalized": "text_normalized",' +
          '"provenance_ids": [' +
            '"provenance_id"' +
          ']' +
        '}' +
      '],' +
      '"contract_types": [' +
      '{' +
        '"text": "text",' +
        '"location": {' +
          '"begin": 0,' +
          '"end": 1' +
        '},' +
        '"confidence_level": "High"' +
      '}' +
      '],' +
      '"contract_terms": [' +
        '{' +
          '"confidence_level": "High",' +
          '"text": "text",' +
          '"text_normalized": "text_normalized",' +
          '"interpretation": {' +
            '"value": "value",' +
            '"numeric_value": 21,' +
            '"unit": "unit"' +
          '},' +
          '"provenance_ids": [' +
            '"provenance_id"' +
          '],' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '}' +
        '}' +
      '],' +
      '"payment_terms": [' +
        '{' +
          '"confidence_level": "High",' +
          '"text": "text",' +
          '"text_normalized": "text_normalized",' +
          '"interpretation": {' +
            '"value": "value",' +
            '"numeric_value": 21,' +
            '"unit": "unit"' +
          '},' +
          '"provenance_ids": [' +
            '"provenance_id"' +
          '],' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '}' +
        '}' +
      '],' +
      '"contract_currencies": [' +
        '{' +
          '"confidence_level": "High",' +
          '"text": "text",' +
          '"text_normalized": "text_normalized",' +
          '"provenance_ids": [' +
            '"provenance_id"' +
          '],' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '}' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String compareReturnResponse() {
    return '{' +
      '"documents": [' +
        '{' +
          '"title": "title",' +
          '"html": "html",' +
          '"hash": "hash",' +
          '"label": "label"' +
        '}' +
      '],' +
      '"aligned_elements": [' +
        '{' +
          '"element_pair": [' +
            '{' +
              '"document_label": "document_label",' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"types": [' +
                '{' +
                  '"label": {' +
                    '"nature": "nature",' +
                    '"party": "party"' +
                  '}' +
                '}' +
              '],' +
              '"categories": [' +
                '{' +
                  '"label": "label"' +
                '}' +
              '],' +
              '"attributes": [' +
                '{' +
                  '"type": "type",' +
                  '"text": "text",' +
                  '"location": {' +
                    '"begin": 0,' +
                    '"end": 1' +
                  '}' +
                '}' +
              ']' +
            '}' +
          '],' +
          '"identical_text": true,' +
          '"provenance_ids": [' +
            '"provenance_id"' +
          '],' +
          '"significant_elements": true' +
        '}' +
      '],' +
      '"unaligned_elements": [' +
        '{' +
          '"document_label": "document_label",' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '},' +
          '"text": "text",' +
          '"types": [' +
            '{' +
              '"label": {' +
                '"nature": "nature",' +
                '"party": "party"' +
              '}' +
            '}' +
          '],' +
          '"categories": [' +
            '{' +
              '"label": "label"' +
            '}' +
          '],' +
          '"attributes": [' +
            '{' +
              '"type": "type",' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '}' +
            '}' +
          ']' +
        '}' +
      '],' +
      '"model_id": "model_id",' +
      '"model_version": "model_version"' +
    '}';
  }

  public static testMethod String feedbackListResponse() {
    return '{' +
      '"feedback": [' +
        '{' +
          '"feedback_id": "feedback_id",' +
          '"comment": "comment",' +
          '"created": "1995-06-12T01:11:11.111Z",' +
          '"feedback_data": {' +
            '"feedback_type": "feedback_type",' +
            '"document": {' +
              '"title": "title",' +
              '"hash": "hash"' +
            '},' +
            '"model_id": "model_id",' +
            '"model_version": "model_version",' +
            '"location": {' +
              '"begin": 0,' +
              '"end": 1' +
            '},' +
            '"text": "text",' +
            '"original_labels": {' +
              '"types": [' +
                '{' +
                  '"label": {' +
                    '"nature": "nature",' +
                    '"party": "party"' +
                  '},' +
                  '"provenance_ids": [' +
                    '"provenance_id"' +
                  ']' +
                '}' +
              '],' +
              '"categories": [' +
                '{' +
                  '"label": "label",' +
                  '"provenance_ids": [' +
                    '"provenance_id"' +
                  ']' +
                '}' +
              '],' +
              '"modification": "added"' +
            '},' +
            '"updated_labels": {' +
              '"types": [' +
                '{' +
                  '"label": {' +
                    '"nature": "nature",' +
                    '"party": "party"' +
                  '},' +
                  '"provenance_ids": [' +
                    '"provenance_id"' +
                  ']' +
                '}' +
              '],' +
              '"categories": [' +
                '{' +
                  '"label": "label",' +
                  '"provenance_ids": [' +
                    '"provenance_id"' +
                  ']' +
                '}' +
              '],' +
              '"modification": "added"' +
            '},' +
            '"pagination": {' +
              '"refresh_cursor": "refresh_cursor",' +
              '"next_cursor": "next_cursor",' +
              '"refresh_url": "refresh_url",' +
              '"next_url": "next_url",' +
              '"total": 1000' +
            '}' +
          '}' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String feedbackReturnResponse() {
    return '{' +
      '"feedback_id": "feedback_id",' +
      '"user_id": "user_id",' +
      '"comment": "comment",' +
      '"created": "1995-06-12T01:11:11.111Z",' +
      '"feedback_data": {' +
        '"feedback_type": "feedback_type",' +
        '"document": {' +
          '"title": "title",' +
          '"hash": "hash"' +
        '},' +
        '"model_id": "model_id",' +
        '"model_version": "model_version",' +
        '"location": {' +
          '"begin": 0,' +
          '"end": 1' +
        '},' +
        '"text": "text",' +
        '"original_labels": {' +
          '"types": [' +
            '{' +
              '"label": {' +
                '"nature": "nature",' +
                '"party": "party"' +
              '},' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"categories": [' +
            '{' +
              '"label": "label",' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"modification": "added"' +
        '},' +
        '"updated_labels": {' +
          '"types": [' +
            '{' +
              '"label": {' +
                '"nature": "nature",' +
                '"party": "party"' +
              '},' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"categories": [' +
            '{' +
              '"label": "label",' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"modification": "added"' +
        '},' +
        '"pagination": {' +
          '"refresh_cursor": "refresh_cursor",' +
          '"next_cursor": "next_cursor",' +
          '"refresh_url": "refresh_url",' +
          '"next_url": "next_url",' +
          '"total": 1000' +
        '}' +
      '}' +
    '}';
  }

  public static testMethod String getFeedbackResponse() {
    return '{' +
      '"feedback_id": "feedback_id",' +
      '"comment": "comment",' +
      '"created": "1995-06-12T01:11:11.111Z",' +
      '"feedback_data": {' +
        '"feedback_type": "feedback_type",' +
        '"document": {' +
          '"title": "title",' +
          '"hash": "hash"' +
        '},' +
        '"model_id": "model_id",' +
        '"model_version": "model_version",' +
        '"location": {' +
          '"begin": 0,' +
          '"end": 1' +
        '},' +
        '"text": "text",' +
        '"original_labels": {' +
          '"types": [' +
            '{' +
              '"label": {' +
                '"nature": "nature",' +
                '"party": "party"' +
              '},' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"categories": [' +
            '{' +
              '"label": "label",' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"modification": "added"' +
        '},' +
        '"updated_labels": {' +
          '"types": [' +
            '{' +
              '"label": {' +
                '"nature": "nature",' +
                '"party": "party"' +
              '},' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"categories": [' +
            '{' +
              '"label": "label",' +
              '"provenance_ids": [' +
                '"provenance_id"' +
              ']' +
            '}' +
          '],' +
          '"modification": "added"' +
        '},' +
        '"pagination": {' +
          '"refresh_cursor": "refresh_cursor",' +
          '"next_cursor": "next_cursor",' +
          '"refresh_url": "refresh_url",' +
          '"next_url": "next_url",' +
          '"total": 1000' +
        '}' +
      '}' +
    '}';
  }

  public static testMethod String htmlReturnResponse() {
    return '{' +
      '"num_pages": "20",' +
      '"author": "author",' +
      '"publication_date": "06-12-1995",' +
      '"title": "title",' +
      '"html": "html"' +
    '}';
  }

  public static testMethod String tableReturnResponse() {
    return '{' +
      '"document": {' +
        '"html": "html",' +
        '"title": "title",' +
        '"hash": "hash"' +
      '},' +
      '"model_id": "model_id",' +
      '"model_version": "model_version",' +
      '"tables": [' +
        '{' +
          '"location": {' +
            '"begin": 0,' +
            '"end": 1' +
          '},' +
          '"text": "text",' +
          '"section_title": {' +
            '"location": {' +
              '"begin": 0,' +
              '"end": 1' +
            '}' +
          '},' +
          '"table_headers": [' +
            '{' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text",' +
              '"row_index_begin": 2000,' +
              '"row_index_end": 3000,' +
              '"column_index_begin": 4000,' +
              '"column_index_end": 5000' +
            '}' +
          '],' +
          '"row_headers": [' +
            '{' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text",' +
              '"text_normalized": "text_normalized",' +
              '"row_index_begin": 2000,' +
              '"row_index_end": 3000,' +
              '"column_index_begin": 4000,' +
              '"column_index_end": 5000' +
            '}' +
          '],' +
          '"column_headers": [' +
            '{' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text",' +
              '"text_normalized": "text_normalized",' +
              '"row_index_begin": 2000,' +
              '"row_index_end": 3000,' +
              '"column_index_begin": 4000,' +
              '"column_index_end": 5000' +
            '}' +
          '],' +
          '"body_cells": [' +
            '{' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text",' +
              '"row_index_begin": 2000,' +
              '"row_index_end": 3000,' +
              '"column_index_begin": 4000,' +
              '"column_index_end": 5000,' +
              '"row_header_ids": [' +
                '"id"' +
              '],' +
              '"row_header_texts": [' +
                '"text"' +
              '],' +
              '"row_header_texts_normalized": [' +
                '"text_normalized"' +
              '],' +
              '"column_header_ids": [' +
                '"id"' +
              '],' +
              '"column_header_texts": [' +
                '"text"' +
              '],' +
              '"column_header_texts_normalized": [' +
                '"text_normalized"' +
              '],' +
              '"attributes": [' +
              '  {' +
              '    "type": "type",' +
              '    "text": "text",' +
              '    "location": {' +
              '      "begin": 0,' +
              '      "end": 1' +
              '    }' +
              '  }' +
              ']' +
            '}' +
          '],' +
          '"key_value_pairs": [' +
          '{' +
            '"key": {' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text"' +
            '},' +
            '"value": [{' +
              '"cell_id": "cell_id",' +
              '"location": {' +
                '"begin": 0,' +
                '"end": 1' +
              '},' +
              '"text": "text"' +
            '}]' +
          '}' +
          ']' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String gatewayResponse() {
    return '{' +
      '"gateway_id": "gateway_id",' +
      '"name": "name",' +
      '"status": "connected",' +
      '"token": "token",' +
      '"token_id": "token_id"' +
    '}';
  }

  public static testMethod String listGatewaysResponse() {
    return '{' +
      '"gateways": [' +
        '{' +
          '"gateway_id": "gateway_id_1",' +
          '"name": "name",' +
          '"status": "connected",' +
          '"token": "token",' +
          '"token_id": "token_id"' +
        '},' +
        '{' +
          '"gateway_id": "gateway_id_2",' +
          '"name": "name",' +
          '"status": "connected",' +
          '"token": "token",' +
          '"token_id": "token_id"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String listGrammarsResponse() {
    return '{' +
      '"grammars": [' +
        '{' +
          '"out_of_vocabulary_words": 10,' +
          '"name": "name_1",' +
          '"status": "analyzed"' +
        '},' +
        '{' +
          '"out_of_vocabulary_words": 20,' +
          '"name": "name_2",' +
          '"status": "analyzed"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String getGrammarResponse() {
    return '{' +
      '"out_of_vocabulary_words": 10,' +
      '"name": "grammar_name",' +
      '"status": "analyzed"' +
    '}';
  }

  public static testMethod String validICP4DToken() {
    return '{' +
      '"username": "admin",' +
      '"role": "Admin",' +
      '"permissions": [' +
        '"administrator",' +
        '"manage_catalog",' +
        '"access_catalog",' +
        '"manage_policies",' +
        '"access_policies",' +
        '"virtualize_transform",' +
        '"can_provision",' +
        '"deployment_admin"' +
      '],' +
      '"sub": "admin",' +
      '"iss": "test",' +
      '"aud": "DSX",' +
      '"uid": "999",' +
      '"accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6IkFkbWluIiwicGVybWlzc2lvbnMiOlsiYWRtaW5pc3RyYXRvciIsIm1hbmFnZV9jYXRhbG9nIiwiYWNjZXNzX2NhdGFsb2ciLCJtYW5hZ2VfcG9saWNpZXMiLCJhY2Nlc3NfcG9saWNpZXMiLCJ2aXJ0dWFsaXplX3RyYW5zZm9ybSIsImNhbl9wcm92aXNpb24iLCJkZXBsb3ltZW50X2FkbWluIl0sInN1YiI6ImFkbWluIiwiaXNzIjoiS05PWFNTTyIsImF1ZCI6IkRTWCIsInVpZCI6Ijk5OSIsImlhdCI6MTU1OTMyODk1NSwiZXhwIjo5OTk5OTk5OTk5OTk5OTk5OTl9.GE-ML3JWmI3oB0z5mjMG3jFtYVVA5bQCsOTOOj9ab7PcgJc1mA5hn1sONkO0JAFADhUoAgpG4KgQef5tjnCSrtl1tbnDuhaP1DH4QKMCZOkWrKyfQ2X8P1jhyJmV-KpE4wuTrGdMoMVj4wVRZwnxMRSK6LhV6pIzyOLLYR21zcW_2KcKWxCYfIC7tiM1d2PSM5nWa_5Vb068F8PtdiFUElEYHYKrvmwpV57_k2jpXoY6zw8PDcIiWQe3g20w6vCB6zWhxbcFWyjMg1tPOZHgTNNskPShHQBbtZFsSrc7rkNPzttKF70m7_JqrRYUZDNN8TmuR9uyitwxEFkr2L0WDQ",' +
      '"_messageCode_": "success",' +
      '"message": "success"' +
    '}'; 
  }

  public static testMethod String expiredICP4DToken() {
    return '{' +
      '"username": "admin",' +
      '"role": "Admin",' +
      '"permissions": [' +
        '"administrator",' +
        '"manage_catalog",' +
        '"access_catalog",' +
        '"manage_policies",' +
        '"access_policies",' +
        '"virtualize_transform",' +
        '"can_provision",' +
        '"deployment_admin"' +
      '],' +
      '"sub": "admin",' +
      '"iss": "test",' +
      '"aud": "DSX",' +
      '"uid": "999",' +
      '"accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6IkFkbWluIiwicGVybWlzc2lvbnMiOlsiYWRtaW5pc3RyYXRvciIsIm1hbmFnZV9jYXRhbG9nIiwiYWNjZXNzX2NhdGFsb2ciLCJtYW5hZ2VfcG9saWNpZXMiLCJhY2Nlc3NfcG9saWNpZXMiLCJ2aXJ0dWFsaXplX3RyYW5zZm9ybSIsImNhbl9wcm92aXNpb24iLCJkZXBsb3ltZW50X2FkbWluIl0sInN1YiI6ImFkbWluIiwiaXNzIjoiS05PWFNTTyIsImF1ZCI6IkRTWCIsInVpZCI6Ijk5OSIsImlhdCI6MTU1OTMyODk1NSwiZXhwIjoxNTU5MzI4OTU1fQ==.GE-ML3JWmI3oB0z5mjMG3jFtYVVA5bQCsOTOOj9ab7PcgJc1mA5hn1sONkO0JAFADhUoAgpG4KgQef5tjnCSrtl1tbnDuhaP1DH4QKMCZOkWrKyfQ2X8P1jhyJmV-KpE4wuTrGdMoMVj4wVRZwnxMRSK6LhV6pIzyOLLYR21zcW_2KcKWxCYfIC7tiM1d2PSM5nWa_5Vb068F8PtdiFUElEYHYKrvmwpV57_k2jpXoY6zw8PDcIiWQe3g20w6vCB6zWhxbcFWyjMg1tPOZHgTNNskPShHQBbtZFsSrc7rkNPzttKF70m7_JqrRYUZDNN8TmuR9uyitwxEFkr2L0WDQ",' +
      '"_messageCode_": "success",' +
      '"message": "success"' +
    '}';
  }

  public static testMethod String languageTranslatorDocumentStatus() {
    return '{' +
      '"document_id": "id",' +
      '"filename": "test-file.txt",' +
      '"model_id": "model-id",' +
      '"base_model_id": "en-es",' +
      '"source": "en",' +
      '"target": "es",' +
      '"status": "available",' +
      '"created": "2018-08-24T08:20:30.5Z",' +
      '"completed": "2018-08-24T08:20:30.5Z",' +
      '"word_count": 1,' +
      '"character_count": 2' +
    '}';
  }

  public static testMethod String listDocuments() {
    return '{' +
      '"documents": [' +
        '{' +
          '"document_id": "id",' +
          '"filename": "test-file.txt",' +
          '"model_id": "model-id",' +
          '"base_model_id": "en-es",' +
          '"source": "en",' +
          '"target": "es",' +
          '"status": "available",' +
          '"created": "2018-08-24T08:20:30.5Z",' +
          '"completed": "2018-08-24T08:20:35.5Z",' +
          '"word_count": 1,' +
          '"character_count": 2' +
        '},' +
        '{' +
          '"document_id": "id",' +
          '"filename": "en.pdf",' +
          '"model_id": "9ef1eda2-e4dc-460f-b51a-efeec95f239f",' +
          '"base_model_id": "en-fr",' +
          '"source": "en",' +
          '"target": "fr",' +
          '"status": "available",' +
          '"created": "2018-08-24T08:20:30.5Z",' +
          '"completed": "2018-08-24T08:20:35.5Z"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String analyzeResponse() {
    return '{' +
      '"images": [' +
        '{' +
          '"source": {' +
            '"type": "file",' +
            '"filename": "filename",' +
            '"archive_filename": "archive_filename",' +
            '"source_url": "source_url",' +
            '"resolved_url": "resolved_url"' +
          '},' +
          '"dimensions": {' +
            '"height": 200,' +
            '"width": 100' +
          '},' +
          '"objects": {' +
            '"collections": [' +
              '{' +
                '"collection_id": "123456789",' +
                '"objects": [' +
                  '{' +
                    '"object": "object",' +
                    '"location": {' +
                      '"top": 0,' +
                      '"left": 10,' +
                      '"width": 100,' +
                      '"height": 200' +
                    '},' +
                    '"score": 5.0' +
                  '}' +
                ']' +
              '}' +
            ']' +
          '},' +
          '"errors": [' +
            '{' +
              '"code": "code",' +
              '"message": "message",' +
              '"more_info": "more_info",' +
              '"target": {' +
                '"type": "field",' +
                '"name": "name"' +
              '}' +
            '}' +
          ']' +
        '}' +
      '],' +
      '"warnings": [' +
        '{' +
          '"code": "code",' +
          '"message": "message",' +
          '"more_info": "more_info"' +
        '}' +
      '],' +
      '"trace": "trace"' +
    '}';
  }

  public static testMethod String visRecCollection() {
    return '{' +
      '"collection_id": "123456789",' +
      '"name": "name",' +
      '"description": "description",' +
      '"created": "1995-06-12T01:11:11.111Z",' +
      '"updated": "1995-06-12T01:11:11.111Z",' +
      '"image_count": 50,' +
      '"training_status": {' +
        '"objects": {' +
          '"ready": true,' +
          '"in_progress": true,' +
          '"data_changed": true,' +
          '"latest_failed": true,' +
          '"description": "description"' +
        '}' +
      '}' +
    '}';
  }

  public static testMethod String collectionsList() {
    return '{' +
      '"collections": [' +
        '{' +
          '"collection_id": "123456789",' +
          '"name": "name",' +
          '"description": "description",' +
          '"created": "1995-06-12T01:11:11.111Z",' +
          '"updated": "1995-06-12T01:11:11.111Z",' +
          '"image_count": 50,' +
          '"training_status": {' +
            '"objects": {' +
              '"ready": true,' +
              '"in_progress": true,' +
              '"data_changed": true,' +
              '"latest_failed": true,' +
              '"description": "description"' +
            '}' +
          '}' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String imageDetails() {
    return '{' +
      '"image_id": "image_id",' +
      '"updated": "1995-06-12T01:11:11.111Z",' +
      '"created": "1995-06-12T01:11:11.111Z",' +
      '"source": {' +
        '"type": "file",' +
        '"filename": "filename",' +
        '"archive_filename": "archive_filename",' +
        '"source_url": "source_url",' +
        '"resolved_url": "resolved_url"' +
      '},' +
      '"dimensions": {' +
        '"height": 200,' +
        '"width": 100' +
      '},' +
      '"errors": [' +
        '{' +
          '"code": "code",' +
          '"message": "message",' +
          '"more_info": "more_info",' +
          '"target": {' +
            '"type": "field",' +
            '"name": "name"' +
          '}' +
        '}' +
      '],' +
      '"training_data": {' +
        '"objects": [' +
          '{' +
            '"object": "object",' +
            '"location": {' +
              '"top": 0,' +
              '"left": 10,' +
              '"width": 100,' +
              '"height": 200' +
            '}' +
          '}' +
        ']' +
      '}' +
    '}';
  }

  public static testMethod String imageDetailsList() {
    return '{' +
      '"images": [' +
        '{' +
          '"image_id": "image_id",' +
          '"updated": "1995-06-12T01:11:11.111Z",' +
          '"created": "1995-06-12T01:11:11.111Z",' +
          '"source": {' +
            '"type": "file",' +
            '"filename": "filename",' +
            '"archive_filename": "archive_filename",' +
            '"source_url": "source_url",' +
            '"resolved_url": "resolved_url"' +
          '},' +
          '"dimensions": {' +
            '"height": 200,' +
            '"width": 100' +
          '},' +
          '"errors": [' +
            '{' +
              '"code": "code",' +
              '"message": "message",' +
              '"more_info": "more_info",' +
              '"target": {' +
                '"type": "field",' +
                '"name": "name"' +
              '}' +
            '}' +
          '],' +
          '"training_data": {' +
            '"objects": [' +
              '{' +
                '"object": "object",' +
                '"location": {' +
                  '"top": 0,' +
                  '"left": 10,' +
                  '"width": 100,' +
                  '"height": 200' +
                '}' +
              '}' +
            ']' +
          '}' +
        '}' +
      '],' +
      '"warnings": [' +
        '{' +
          '"code": "code",' +
          '"message": "message",' +
          '"more_info": "more_info"' +
        '}' +
      '],' +
      '"trace": "trace"' +
    '}';
  }

  public static testMethod String imageSummaryList() {
    return '{' +
      '"images": [' +
        '{' +
          '"image_id": "image_id",' +
          '"updated": "1995-06-12T01:11:11.111Z"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String trainingDataObjects() {
    return '{' +
      '"objects": [' +
        '{' +
          '"object": "object",' +
          '"location": {' +
            '"top": 0,' +
            '"left": 10,' +
            '"width": 100,' +
            '"height": 200' +
          '}' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2ListCollectionsResponse() {
    return '{' +
      '"collections": [' +
        '{' +
          '"collection_id": "collection_id",' +
          '"name": "name"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2Completions() {
    return '{' +
      '"completions": [' +
        '"completion"' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2ComponentSettingsResponse() {
    return '{' +
      '"fields_shown": {' +
        '"body": {' +
          '"use_passage": true,' +
          '"field": "field"' +
        '},' +
        '"title": {' +
          '"field": "field"' +
        '}' +
      '},' +
      '"autocomplete": true,' +
      '"structured_search": true,' +
      '"results_per_page": 17,' +
      '"aggregations": [' +
        '{' +
          '"name": "name",' +
          '"label": "label",' +
          '"multiple_selections_allowed": true,' +
          '"visualization_type": "visualization_type"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2DocumentAccepted() {
    return '{' +
      '"document_id": "document_id",' +
      '"status": "status"' +
    '}';
  }

  public static testMethod String discoveryV2ListFieldsResponse() {
    return '{' +
      '"fields": [' +
        '{' +
          '"field": "field",' +
          '"type": "type",' +
          '"collection_id": "collection_id"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2QueryNoticesResponse() {
    return '{' +
      '"matching_results": 6,' +
      '"notices": [' +
        '{' +
          '"notice_id": "notice_id",' +
          '"created": "1995-06-12T01:11:11.111Z",' +
          '"document_id": "document_id",' +
          '"collection_id": "collection_id",' +
          '"query_id": "query_id",' +
          '"severity": "severity",' +
          '"step": "step",' +
          '"description": "description"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2QueryResponse() {
    return '{' +
      '"matching_results": 6,' +
      '"results": [' +
        '{' +
          '"document_id": "document_id",' +
          '"metadata": {},' +
          '"result_metadata": {' +
            '"document_retrieval_source": "document_retrieval_source",' +
            '"collection_id": "collection_id",' +
            '"confidence": 0.0' +
          '},' +
          '"document_passages": [' +
            '{' +
              '"passage_text": "passage_text",' +
              '"start_offset": 7,' +
              '"end_offset": 8,' +
              '"field": "field"' +
            '}' +
          ']' +
        '}' +
      '],' +
      '"aggregations": [' +
        '{' +
          '"type": "type"' +
        '}' +
      '],' +
      '"retrieval_details": {' +
        '"document_retrieval_strategy": "document_retrieval_strategy"' +
      '},' +
      '"suggested_query": "suggested_query",' +
      '"suggested_refinements": [' +
        '{' +
          '"text": "text"' +
        '}' +
      '],' +
      '"table_results": [' +
        '{' +
          '"table_id": "table_id",' +
          '"source_document_id": "source_document_id",' +
          '"collection_id": "collection_id",' +
          '"table_html": "table_html",' +
          '"table_html_offset": 9,' +
          '"table": {' +
            '"location": {' +
              '"begin": 10,' +
              '"end": 11' +
            '},' +
            '"text": "text",' +
            '"section_title": {' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 10,' +
                '"end": 11' +
              '}' +
            '},' +
            '"title": {' +
              '"text": "text",' +
              '"location": {' +
                '"begin": 10,' +
                '"end": 11' +
              '}' +
            '},' +
            '"table_headers": [' +
              '{' +
                '"cell_id": "cell_id",' +
                '"location": {},' +
                '"text": "text",' +
                '"row_index_begin": 12,' +
                '"row_index_end": 13,' +
                '"column_index_begin": 14,' +
                '"column_index_end": 15' +
              '}' +
            '],' +
            '"row_headers": [' +
              '{' +
                '"cell_id": "cell_id",' +
                '"location": {' +
                  '"begin": 10,' +
                  '"end": 11' +
                '},' +
                '"text": "text",' +
                '"text_normalized": "text_normalized",' +
                '"row_index_begin": 12,' +
                '"row_index_end": 13,' +
                '"column_index_begin": 14,' +
                '"column_index_end": 15' +
              '}' +
            '],' +
            '"column_headers": [' +
              '{' +
                '"cell_id": "cell_id",' +
                '"location": {},' +
                '"text": "text",' +
                '"text_normalized": "text_normalized",' +
                '"row_index_begin": 12,' +
                '"row_index_end": 13,' +
                '"column_index_begin": 14,' +
                '"column_index_end": 15' +
              '}' +
            '],' +
            '"key_value_pairs": [' +
              '{' +
                '"key": {' +
                  '"cell_id": "cell_id",' +
                  '"location": {' +
                    '"begin": 10,' +
                    '"end": 11' +
                  '},' +
                  '"text": "text"' +
                '},' +
                '"value": [' +
                  '{' +
                    '"cell_id": "cell_id",' +
                    '"location": {' +
                      '"begin": 10,' +
                      '"end": 11' +
                    '},' +
                    '"text": "text"' +
                  '}' +
                ']' +
              '}' +
            '],' +
            '"body_cells": [' +
              '{' +
                '"cell_id": "cell_id",' +
                '"location": {' +
                  '"begin": 10,' +
                  '"end": 11' +
                '},' +
                '"text": "text",' +
                '"row_index_begin": 12,' +
                '"row_index_end": 13,' +
                '"column_index_begin": 14,' +
                '"column_index_end": 15,' +
                '"row_header_ids": [' +
                  '{' +
                    '"id": "id"' +
                  '}' +
                '],' +
                '"row_header_texts": [' +
                  '{' +
                    '"text": "text"' +
                  '}' +
                '],' +
                '"row_header_texts_normalized": [' +
                  '{' +
                    '"text_normalized": "text_normalized"' +
                  '}' +
                '],' +
                '"column_header_ids": [' +
                  '{' +
                    '"id": "id"' +
                  '}' +
                '],' +
                '"column_header_texts": [' +
                  '{' +
                    '"text": "text"' +
                  '}' +
                '],' +
                '"column_header_texts_normalized": [' +
                  '{' +
                    '"text_normalized": "text_normalized"' +
                  '}' +
                '],' +
                '"attributes": [' +
                  '{' +
                    '"type": "type",' +
                    '"text": "text",' +
                    '"location": {' +
                      '"begin": 10,' +
                      '"end": 11' +
                    '}' +
                  '}' +
                ']' +
              '}' +
            '],' +
            '"contexts": [' +
              '{' +
                '"text": "text",' +
                '"location": {' +
                  '"begin": 10,' +
                  '"end": 11' +
                '}' +
              '}' +
            ']' +
          '}' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2TrainingQuery() {
    return '{' +
      '"query_id": "query_id",' +
      '"natural_language_query": "natural_language_query",' +
      '"filter": "filter",' +
      '"created": "1995-06-12T01:11:11.111Z",' +
      '"updated": "1995-06-12T01:11:11.111Z",' +
      '"examples": [' +
        '{' +
          '"document_id": "document_id",' +
          '"collection_id": "collection_id",' +
          '"relevance": 1,' +
          '"created": "1995-06-12T01:11:11.111Z",' +
          '"updated": "1995-06-12T01:11:11.111Z"' +
        '}' +
      ']' +
    '}';
  }

  public static testMethod String discoveryV2TrainingQuerySet() {
    return '{' +
      '"queries": [' +
        '{' +
          '"query_id": "query_id",' +
          '"natural_language_query": "natural_language_query",' +
          '"filter": "filter",' +
          '"created": "1995-06-12T01:11:11.111Z",' +
          '"updated": "1995-06-12T01:11:11.111Z",' +
          '"examples": [' +
            '{' +
              '"document_id": "document_id",' +
              '"collection_id": "collection_id",' +
              '"relevance": 1,' +
              '"created": "1995-06-12T01:11:11.111Z",' +
              '"updated": "1995-06-12T01:11:11.111Z"' +
            '}' +
          ']' +
        '}' +
      ']' +
    '}';
  }
}