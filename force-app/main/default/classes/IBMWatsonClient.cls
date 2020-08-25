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

public class IBMWatsonClient {
  private static final Integer REQUEST_TIMEOUT = 120000;

  private IBMWatsonClient() {
    // This is a utility class - no instantiation allowed.
  }

  /**
   * Executes the IBMWatsonRequest and returns an IBMWatsonResponse.
   */
  public static IBMWatsonResponse executeRequest(IBMWatsonRequest wreq) {
    // build the httpRequest
    HttpRequest request = toHttpRequest(wreq);

    // Execute the httpRequest
    Http http = new Http();
    HTTPResponse httpResponse = http.send(request);

    // Creates an IBMWatsonResponse based on the service URL and HttpResponse
    return new IBMWatsonResponse(request.getEndpoint(), httpResponse);
  }

  private static HttpRequest toHttpRequest(IBMWatsonRequest request) {
    HttpRequest httpRequest = new HttpRequest();

    // Set request headers
    for (String name : request.getAllHeaders().keySet()) {
      httpRequest.setHeader(name, request.getAllHeaders().get(name));
    }

    // Set request body
    if (request.getMethod().equals('POST') || request.getMethod().equals('PUT')) {
      if (request.getBody() instanceof IBMWatsonMultipartBody) {
        IBMWatsonMultipartBody multipartBody = (IBMWatsonMultipartBody) request.getBody();
        if (multipartBody.form64() != null) {
          String form64 = multipartBody.form64();
          httpRequest.setBodyAsBlob(EncodingUtil.base64Decode(form64));
          httpRequest.setHeader('Content-Length', String.valueof(form64.length()));
        } else {
          Blob multipartBodyBlob = multipartBody.multipartBody();
          httpRequest.setBodyAsBlob(multipartBodyBlob);
          httpRequest.setHeader('Content-Length', String.valueof(multipartBody.contentLength()));
        }
      } else if (request.getBody().contentType.toString().contains(IBMWatsonHttpMediaType.APPLICATION_JSON)) {
        httpRequest.setBody(request.getBody().content);
      } else {
        if (request.getBody().content != null) {
          httpRequest.setBody(request.getBody().content);
        } else {
          httpRequest.setBody(request.getBody().blobContent.toString());
        }
      }
    }

    httpRequest.setMethod(request.getMethod());
    httpRequest.setEndpoint(request.getUrl().toExternalForm());
    httpRequest.setTimeout(REQUEST_TIMEOUT);
    return httpRequest;
  }
}