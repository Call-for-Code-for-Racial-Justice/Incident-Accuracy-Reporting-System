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

public class IBMWatsonMockHttpResponse implements HttpCalloutMock  {
  protected Integer code;
  protected String status;
  protected String bodyAsString;
  protected Blob bodyAsBlob;
  protected Map<String, String> responseHeaders;

  public IBMWatsonMockHttpResponse(Integer code, String status, String body, Map<String, String> responseHeaders) {
    this.code = code;
    this.status = status;
    this.bodyAsString = body;
    this.bodyAsBlob = null;
    this.responseHeaders = responseHeaders;
  }

  public HTTPResponse respond(HTTPRequest req) {
    HttpResponse resp = new HttpResponse();
    resp.setStatusCode(code);
    resp.setStatus(status);
    if (bodyAsBlob != null) {
      resp.setBodyAsBlob(bodyAsBlob);
    } else {
      resp.setBody(bodyAsString);
    }

    if (responseHeaders != null) {
      for (String key : responseHeaders.keySet()) {
        resp.setHeader(key, responseHeaders.get(key));
      }
    }
    return resp;
  }
}