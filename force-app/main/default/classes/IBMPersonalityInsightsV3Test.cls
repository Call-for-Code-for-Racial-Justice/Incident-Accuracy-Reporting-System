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
private class IBMPersonalityInsightsV3Test {
  private static String VERSION;
  private static String HEADER_KEY;
  private static String HEADER_VAL;

  private static IBMPersonalityInsightsV3 service;

  static {
    VERSION = '2017-10-13';
    HEADER_KEY = 'Header-Key';
    HEADER_VAL = 'header_val';
    service = new IBMPersonalityInsightsV3(VERSION, new IBMWatsonNoAuthAuthenticator());
  }

  /**
   * Generates a personality profile based on input text.
   *
   */
  static testMethod void testProfile() {
    String body = IBMWatsonMockResponses.profile();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMPersonalityInsightsV3Models.ContentItem contentItem = new IBMPersonalityInsightsV3Models.ContentItemBuilder()
      .content('text/plain')
      .id('test')
      .created(1)
      .updated(1)
      .contenttype(IBMWatsonHttpMediaType.APPLICATION_JSON)
      .language('en')
      .parentid('test')
      .reply(false)
      .forward(false)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    contentItem = contentItem.newBuilder().build();
    IBMPersonalityInsightsV3Models.Content content = new IBMPersonalityInsightsV3Models.ContentBuilder()
      .addContentItems(contentItem)
      .contentItems(new List<IBMPersonalityInsightsV3Models.ContentItem>{ contentItem })
      .build();
    // or you can use following
    content = new IBMPersonalityInsightsV3Models.ContentBuilder(new List<IBMPersonalityInsightsV3Models.ContentItem>{contentItem})
      .addContentItems(contentItem)
      .contentItems(new List<IBMPersonalityInsightsV3Models.ContentItem>{contentItem})
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    content = content.newBuilder().build();
    IBMPersonalityInsightsV3Models.ProfileOptions options = new IBMPersonalityInsightsV3Models.ProfileOptionsBuilder()
      .contentLanguage('en')
      .acceptLanguage('en')
      .rawScores(true)
      .consumptionPreferences(true)
      .content(content)
      .html('<html><body>test</body></html>')
      .text('test')
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMPersonalityInsightsV3Models.Profile resp = service.profile(options);
    System.assertEquals(content.contentItems().size(), 1);
    System.assertEquals(contentItem.content(), 'text/plain');
    System.assertEquals(contentItem.contenttype(), IBMWatsonHttpMediaType.APPLICATION_JSON);
    System.assertEquals(contentItem.created(), 1);
    System.assertEquals(contentItem.updated(), 1);
    System.assertEquals(contentItem.id(), 'test');
    System.assertEquals(contentItem.parentid(), 'test');
    System.assertEquals(contentItem.language(), 'en');
    System.assertEquals(contentItem.reply(), false);
    System.assertEquals(contentItem.forward(), false);
    System.assertEquals(resp.getProcessedLanguage(), 'ar');
    System.assertEquals(resp.getPersonality()[0].getTraitId(), 'string');
    System.assertEquals(resp.getPersonality()[0].getName(), 'string');
    System.assertEquals(resp.getPersonality()[0].getCategory(), 'personality');
    System.assertEquals(resp.getPersonality()[0].getPercentile(), 0);
    System.assertEquals(resp.getPersonality()[0].getRawScore(), 0);
    System.assertEquals(resp.getPersonality()[0].getSignificant(), true);
    System.assertEquals(resp.getPersonality()[0].getChildren().size(), 1);
    System.assertEquals(resp.getValues().size(), 1);
    System.assertEquals(resp.getNeeds().size(), 1);
    System.assertEquals(resp.getBehavior()[0].getTraitId(), 'string');
    System.assertEquals(resp.getBehavior()[0].getName(), 'string');
    System.assertEquals(resp.getBehavior()[0].getCategory(), 'string');
    System.assertEquals(resp.getBehavior()[0].getPercentage(), 0);
    System.assertEquals(resp.getConsumptionPreferences()[0].getConsumptionPreferenceCategoryId(), 'string');
    System.assertEquals(resp.getConsumptionPreferences()[0].getName(), 'string');
    System.assertEquals(resp.getConsumptionPreferences()[0].getConsumptionPreferences()[0].getConsumptionPreferenceId(), 'string');
    System.assertEquals(resp.getConsumptionPreferences()[0].getConsumptionPreferences()[0].getName(), 'string');
    System.assertEquals(resp.getConsumptionPreferences()[0].getConsumptionPreferences()[0].getScore(), 0.0);
    System.assertEquals(resp.getwarnings()[0].getWarningId(), 'WORD_COUNT_MESSAGE');
    System.assertEquals(resp.getwarnings()[0].getMessage(), 'string');
    Test.stopTest();
  }

  static testMethod void testProfileAsCsv() {
    String testBody = 'this,is,a,csv,file';
    Map<String, String> responseHeaders = new Map<String, String> {
      IBMWatsonHttpHeaders.CONTENT_DISPOSITION => 'filename=testfile.csv',
      IBMWatsonHttpHeaders.CONTENT_TYPE => 'test/csv'
    };
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(
      200,
      'Success',
      testBody,
      responseHeaders
    );
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();

    IBMPersonalityInsightsV3Models.ProfileOptions options = new IBMPersonalityInsightsV3Models.ProfileOptionsBuilder()
      .text('text')
      .contentLanguage('en')
      .acceptLanguage('en')
      .rawScores(true)
      .csvHeaders(true)
      .consumptionPreferences(true)
      .addHeader(HEADER_KEY, HEADER_VAL)
      .build();
    IBMWatsonFile response = service.profileAsCsv(options);

    System.assert(response != null);
    System.assertEquals(testBody, response.bodyAsString());

    Test.stopTest();
  }
}