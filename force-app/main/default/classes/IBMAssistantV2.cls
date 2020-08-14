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
 * The IBM Watson&trade; Assistant service combines machine learning, natural language understanding, and an integrated
 * dialog editor to create conversation flows between your apps and your users.
 *
 * The Assistant v2 API provides runtime methods your client application can use to send user input to an assistant and
 * receive a response.
 *
 * @version V2
 * @see <a href="https://cloud.ibm.com/docs/assistant/">Assistant</a>
 */
public class IBMAssistantV2 extends IBMWatsonService {

  private static final String SERVICE_NAME = 'assistant';
  private static final String SERVICE_URL = 'https://gateway.watsonplatform.net/assistant/api';

  private String versionDate;

  /**
   * Instantiates a new `IBMAssistantV2`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *          calls from failing when the service introduces breaking changes.
   */
   public IBMAssistantV2(String versionDate) {
     this(versionDate, IBMWatsonConfigBasedAuthenticatorFactory.getAuthenticator(SERVICE_NAME));
   }

  /**
   * Instantiates a new `IBMAssistantV2`.
   *
   * @param versionDate The version date (yyyy-MM-dd) of the REST API to use. Specifying this value will keep your API
   *        calls from failing when the service introduces breaking changes.
   * @param authenticator The IBMWatsonAuthenticator implementation to use for authenticating when making service requests
   */
  public IBMAssistantV2(String versionDate, IBMWatsonAuthenticator authenticator) {
    super(SERVICE_NAME, 'v2', authenticator);

    if ((getServiceURL() == null) || String.isBlank(getServiceURL())) {
      setServiceURL(SERVICE_URL);
    }

    if (String.isBlank(versionDate)) {
      throw new IBMWatsonServiceExceptions.IllegalArgumentException('versionDate cannot be null.');
    }
    this.versionDate = versionDate;
  }

  /**
   * Create a session.
   *
   * Create a new session. A session is used to send user input to a skill and receive responses. It also maintains the
   * state of the conversation. A session persists until it is deleted, or until it times out because of inactivity.
   * (For more information, see the
   * [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-assistant-settings).
   *
   * @param createSessionOptions the {@link IBMAssistantV2Models.CreateSessionOptions} containing the options for the call
   * @return the {@link IBMAssistantV2Models.SessionResponse} with the response
   */
  public IBMAssistantV2Models.SessionResponse createSession(IBMAssistantV2Models.CreateSessionOptions createSessionOptions) {
    IBMWatsonValidator.notNull(createSessionOptions, 'createSessionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v2/assistants/{0}/sessions', new String[]{ createSessionOptions.assistantId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=conversation;service_version=V2;operation_id=createSession');
    Map<String, String> requestHeaders = (createSessionOptions != null) ? createSessionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    builder.bodyJson('{}');

    return (IBMAssistantV2Models.SessionResponse) createServiceCall(builder.build(), IBMAssistantV2Models.SessionResponse.class);
  }

  /**
   * Delete session.
   *
   * Deletes a session explicitly before it times out. (For more information about the session inactivity timeout, see
   * the [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-assistant-settings)).
   *
   * @param deleteSessionOptions the {@link IBMAssistantV2Models.DeleteSessionOptions} containing the options for the call
   * @return the service call
   */
  public void deleteSession(IBMAssistantV2Models.DeleteSessionOptions deleteSessionOptions) {
    IBMWatsonValidator.notNull(deleteSessionOptions, 'deleteSessionOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpDelete(getServiceURL() + String.format('/v2/assistants/{0}/sessions/{1}', new String[]{ deleteSessionOptions.assistantId(), deleteSessionOptions.sessionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=conversation;service_version=V2;operation_id=deleteSession');
    Map<String, String> requestHeaders = (deleteSessionOptions != null) ? deleteSessionOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);

    createServiceCall(builder.build(), null);
  }

  /**
   * Send user input to assistant.
   *
   * Send user input to an assistant and receive a response.
   *
   * There is no rate limit for this operation.
   *
   * @param messageOptions the {@link IBMAssistantV2Models.MessageOptions} containing the options for the call
   * @return the {@link IBMAssistantV2Models.MessageResponse} with the response
   */
  public IBMAssistantV2Models.MessageResponse message(IBMAssistantV2Models.MessageOptions messageOptions) {
    IBMWatsonValidator.notNull(messageOptions, 'messageOptions cannot be null');
    IBMWatsonValidator.notEmpty(getServiceURL(), 'The service URL cannot be null');
    IBMWatsonRequestBuilder builder = IBMWatsonRequestBuilder.httpPost(getServiceURL() + String.format('/v2/assistants/{0}/sessions/{1}/message', new String[]{ messageOptions.assistantId(), messageOptions.sessionId() }));
    builder.addHeader('Accept', 'application/json');
    builder.addHeader('X-IBMCloud-SDK-Analytics', 'service_name=conversation;service_version=V2;operation_id=message');
    Map<String, String> requestHeaders = (messageOptions != null) ? messageOptions.requestHeaders() : null;
    if (requestHeaders != null && requestHeaders.size() > 0) {
      for (String name : requestHeaders.keySet()) {
        builder.addHeader(name, requestHeaders.get(name));
      }
    }
    builder.query('version', versionDate);
    final Map<String, Object> contentJson = new Map<String, Object>();
    if (messageOptions.input() != null) {
      contentJson.put('input', messageOptions.input().replacePropertyNames());
    }
    if (messageOptions.context() != null) {
      contentJson.put('context', messageOptions.context().replacePropertyNames());
    }
    builder.bodyJson(JSON.serialize(contentJson, true));

    return (IBMAssistantV2Models.MessageResponse) createServiceCall(builder.build(), IBMAssistantV2Models.MessageResponse.class);
  }

}