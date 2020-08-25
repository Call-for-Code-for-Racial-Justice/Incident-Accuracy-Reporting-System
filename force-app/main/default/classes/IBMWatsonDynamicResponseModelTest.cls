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
private class IBMWatsonDynamicResponseModelTest {
  private class TestModel extends IBMWatsonDynamicResponseModel {}

  static testMethod void testAdditionalProps() {
    Test.startTest();

    String testKey = 'key';
    String testVal = 'val';
    TestModel testModel = new TestModel();

    testModel.put(testKey, testVal);
    System.assertEquals(testVal, testModel.get(testKey));
    System.assert(testModel.getDynamicProperties().size() == 1);

    Test.stopTest();
  }

  static testMethod void testGetEmptyAdditionalProps() {
    Test.startTest();

    TestModel testModel = new TestModel();
    Object nullResponse = testModel.get('nonexistent key');
    System.assert(nullResponse == null);

    Test.stopTest();
  }
}