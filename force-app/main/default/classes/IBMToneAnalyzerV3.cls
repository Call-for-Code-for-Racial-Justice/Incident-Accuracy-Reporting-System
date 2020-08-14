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
 * The IBM Watson&trade; Tone Analyzer service uses linguistic analysis to detect emotional and language tones in
 * written text. The service can analyze tone at both the document and sentence levels. You can use the service to
 * understand how your written communications are perceived and then to improve the tone of your communications.
 * Businesses can use the service to learn the tone of their customers' communications and to respond to each customer
 * appropriately, or to understand and improve their customer conversations.
 *
 * **Note:** Request logging is disabled for the Tone Analyzer service. Regardless of whether you set the
 * `X-Watson-Learning-Opt-Out` request header, the service does not log or retain data from requests and responses.
 *
 * @version V3
 * @see <a href="https://cloud.ibm.com/docs/tone-analyzer/">Tone Analyzer</a>
 */
public class IBMToneAnalyzerV3 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'tone_analyzer';
  private static final String SERVICE_URL = 'https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/8ac7dee3-e3ba-4388-8790-ae7f1294854e';

  private String versionDate;

  /**
   * Instantiates a new `IBMToneAnalyzerV3`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMToneAnalyzerV3(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMToneAnalyzerV3`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMToneAnalyzerV3(String versionDate, IBMWatsonAuthenticator authenticator) {
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
   * Analyze general tone.
   *
   * Use the general-purpose endpoint to analyze the tone of your input content. The service analyzes the content for
   * emotional and language tones. The method always analyzes the tone of the full document; by default, it also
   * analyzes the tone of each individual sentence of the content.
   *
   * You can submit no more than 128 KB of total input content and no more than 1000 individual sentences in JSON, plain
   * text, or HTML format. The service analyzes the first 1000 sentences for document-level analysis and only the first
   * 100 sentences for sentence-level analysis.
   *
   * Per the JSON specification, the default character encoding for JSON content is effectively always UTF-8; per the
   * HTTP specification, the default encoding for plain text and HTML is ISO-8859-1 (effectively, the ASCII character
   * set). When specifying a content type of plain text or HTML, include the `charset` parameter to indicate the
   * character encoding of the input text; for example: `Content-Type: text/plain;charset=utf-8`. For `text/html`, the
   * service removes HTML tags and analyzes only the textual content.
   *
   * **See also:** [Using the general-purpose
   * endpoint](https://cloud.ibm.com/docs/tone-analyzer?topic=tone-analyzer-utgpe#utgpe).
   *
   * @param toneOptions the {@link IBMToneAnalyzerV3Models.ToneOptions} containing the options for the call
   * @return the {@link IBMToneAnalyzerV3Models.ToneAnalysis} with the response
   */
  public IBMToneAnalyzerV3Models.ToneAnalysis tone(IBMToneAnalyzerV3Models.ToneOptions toneOptions) {
    IBMWatsonValidator.notNull(toneOptions, 'toneOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/tone');
    builder.addHeader('Accept', 'application/json');
    if (toneOptions.contentType() != null) {
      builder.addHeader('Content-Type', toneOptions.contentType());
    }
    if (toneOptions.contentLanguage() != null) {
      builder.addHeader('Content-Language', toneOptions.contentLanguage());
    }
    if (toneOptions.acceptLanguage() != null) {
      builder.addHeader('Accept-Language', toneOptions.acceptLanguage());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=tone_analyzer;service_version=V3;operation_id=tone');
    Map<String, String> requestHeaders = (toneOptions != null) ? toneOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    if (toneOptions.sentences() != null) {
      builder.query('sentences', String.valueOf(toneOptions.sentences()));
    }
    if (toneOptions.tones() != null) {
      builder.query('tones', String.join(toneOptions.tones(), ','));
    }
    builder.bodyContent(toneOptions.contentType(), toneOptions.toneInput(), null, toneOptions.body());

    return (IBMToneAnalyzerV3Models.ToneAnalysis) createServiceCall(builder.build(), IBMToneAnalyzerV3Models.ToneAnalysis.class);
  }

  /**
   * Analyze customer-engagement tone.
   *
   * Use the customer-engagement endpoint to analyze the tone of customer service and customer support conversations.
   * For each utterance of a conversation, the method reports the most prevalent subset of the following seven tones:
   * sad, frustrated, satisfied, excited, polite, impolite, and sympathetic.
   *
   * If you submit more than 50 utterances, the service returns a warning for the overall content and analyzes only the
   * first 50 utterances. If you submit a single utterance that contains more than 500 characters, the service returns
   * an error for that utterance and does not analyze the utterance. The request fails if all utterances have more than
   * 500 characters. Per the JSON specification, the default character encoding for JSON content is effectively always
   * UTF-8.
   *
   * **See also:** [Using the customer-engagement
   * endpoint](https://cloud.ibm.com/docs/tone-analyzer?topic=tone-analyzer-utco#utco).
   *
   * @param toneChatOptions the {@link IBMToneAnalyzerV3Models.ToneChatOptions} containing the options for the call
   * @return the {@link IBMToneAnalyzerV3Models.UtteranceAnalyses} with the response
   */
  public IBMToneAnalyzerV3Models.UtteranceAnalyses toneChat(IBMToneAnalyzerV3Models.ToneChatOptions toneChatOptions) {
    IBMWatsonValidator.notNull(toneChatOptions, 'toneChatOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + '/v3/tone_chat');
    builder.addHeader('Accept', 'application/json');
    if (toneChatOptions.contentLanguage() != null) {
      builder.addHeader('Content-Language', toneChatOptions.contentLanguage());
    }
    if (toneChatOptions.acceptLanguage() != null) {
      builder.addHeader('Accept-Language', toneChatOptions.acceptLanguage());
    }
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=tone_analyzer;service_version=V3;operation_id=toneChat');
    Map<String, String> requestHeaders = (toneChatOptions != null) ? toneChatOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    List<Object> utterancesList = new List<Object>();
    for (IBMToneAnalyzerV3Models.Utterance utterancesItem : toneChatOptions.utterances()) {
      utterancesList.add(utterancesItem.replacePropertyNames());
    }
    contentJson.put('utterances', utterancesList);
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMToneAnalyzerV3Models.UtteranceAnalyses) createServiceCall(builder.build(), IBMToneAnalyzerV3Models.UtteranceAnalyses.class);
  }

}