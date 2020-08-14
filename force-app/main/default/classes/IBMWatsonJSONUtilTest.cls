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
private class IBMWatsonJSONUtilTest {
  static testMethod void testReplaceKeyNamesInMap() {
    String mockJson = '{"foo":"bar","go":"bucks"}';
    Map<String, Object> mockObject = (Map<String, Object>) JSON.deserializeUntyped(mockJson);
    Map<String, String> propertyMapping = new Map<String, String> { 'foo' => 'oof' };
    String expectedJson = '{"oof":"bar","go":"bucks"}';
    Map<String, Object> expectedMap = (Map<String, Object>) JSON.deserializeUntyped(expectedJson);

    Map<String, Object> actualMap = IBMWatsonJSONUtil.replaceKeyNamesInMap(mockObject, propertyMapping);

    System.assert(expectedMap.equals(actualMap));
  }

  static testMethod void testReplaceKeyNamesInString() {
    String mockJson = '{"foo":"bar","go":"bucks"}';
    Map<String, String> propertyMapping = new Map<String, String> { 'foo' => 'oof' };
    String expectedJson = '{"oof":"bar","go":"bucks"}';
    Map<String, Object> expectedMap = (Map<String, Object>) JSON.deserializeUntyped(expectedJson);

    Map<String, Object> actualMap = (Map<String, Object>) JSON.deserializeUntyped(IBMWatsonJSONUtil.replaceKeyNamesInString(mockJson, propertyMapping));

    System.assert(expectedMap.equals(actualMap));
  }

  /**
   * Test that additional properties are brought up a level as expected with flat JSON.
   */
  static testMethod void testRaiseAdditionalPropertiesFlat() {
    String mockJson = '{"foo":"bar","additionalProperties":{"drink": "coffee"}}';
    Map<String, Object> mockObject = (Map<String, Object>) JSON.deserializeUntyped(mockJson);
    String expectedJson = '{"foo":"bar","drink":"coffee"}';
    Map<String, Object> expectedMap = (Map<String, Object>) JSON.deserializeUntyped(expectedJson);

    Map<String, Object> actualMap = IBMWatsonJSONUtil.raiseAdditionalProperties(mockObject);

    System.assert(expectedMap.equals(actualMap));
  }

  /**
   * Test that additional properties are brought up a level as expected with nested JSON.
   */
  static testMethod void testRaiseAdditionalPropertiesNested() {
    String mockJson = '{"foo":"bar","ohio":{"city":"columbus","additionalProperties": {"very":"cool"}}}';
    Map<String, Object> mockObject = (Map<String, Object>) JSON.deserializeUntyped(mockJson);
    String expectedJson = '{"foo":"bar","ohio":{"city":"columbus","very":"cool"}}';
    Map<String, Object> expectedMap = (Map<String, Object>) JSON.deserializeUntyped(expectedJson);

    Map<String, Object> actualMap = IBMWatsonJSONUtil.raiseAdditionalProperties(mockObject);

    System.assert(expectedMap.equals(actualMap));
  }

  /**
   * Test that additional properties are brought up a level as expected with JSON containing an array.
   */
  static testMethod void testRaiseAdditionalPropertiesList() {
    String mockJson = '{"foo":"bar","teams":[{"soccer":"crew","basketball":{"name": "cavaliers","additionalProperties":{"king":"lebron"}}}]}';
    Map<String, Object> mockObject = (Map<String, Object>) JSON.deserializeUntyped(mockJson);
    String expectedJson = '{"foo":"bar","teams":[{"soccer":"crew","basketball":{"name": "cavaliers","king":"lebron"}}]}';
    Map<String, Object> expectedMap = (Map<String, Object>) JSON.deserializeUntyped(expectedJson);

    Map<String, Object> actualMap = IBMWatsonJSONUtil.raiseAdditionalProperties(mockObject);

    System.assert(expectedMap.equals(actualMap));
  }
}