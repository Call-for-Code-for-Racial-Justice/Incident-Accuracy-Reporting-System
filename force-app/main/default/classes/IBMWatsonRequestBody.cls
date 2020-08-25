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

public virtual class IBMWatsonRequestBody {

  public IBMWatsonMediaType contentType {get;set;}
  public Long contentSize {get;set;}
  public String content {get;set;}
  public Blob blobContent {get;set;}
  public String name {get;set;}

  private static final String UTF_8 = 'UTF-8';

  public IBMWatsonRequestBody() {
    name = '';
  }

  public IBMWatsonMediaType bodyContentType() {
    return contentType;
  }

  public Boolean hasBase64Data() {
    return blobContent != null;
  }

  public static IBMWatsonRequestBody create() {
    IBMWatsonRequestBody reqBody = new IBMWatsonRequestBody();
    reqBody.contentSize = 0;
    reqBody.content = null;
    reqBody.contentType = null;
    return reqBody;
  }

  public static IBMWatsonRequestBody create(String content, IBMWatsonMediaType contentType) {
    IBMWatsonRequestBody reqBody = new IBMWatsonRequestBody();
    String charset = UTF_8;
    if (contentType != null) {
      charset = contentType.charset;
      if (String.isBlank(charset)) {
        charset = UTF_8;
        contentType = IBMWatsonMediaType.parse(contentType + '; charset=utf-8');
      }
    }
    reqBody.contentSize = (String.isNotBlank(content)) ? content.length() : 0;
    reqBody.contentType = contentType;
    reqBody.content = content;
    return reqBody;
  }

  public static IBMWatsonRequestBody create(IBMWatsonFile fileContent, String contentType) {
    IBMWatsonMediaType mediaType = (contentType != null) ? IBMWatsonMediaType.parse(contentType) : IBMWatsonHttpMediaType.BINARY_FILE;
    return create(fileContent, mediaType);
  }

  public static IBMWatsonRequestBody create(IBMWatsonFile fileContent, IBMWatsonMediaType mediaType) {
    IBMWatsonRequestBody reqBody = new IBMWatsonRequestBody();
    reqBody.contentSize = (fileContent != null) ? fileContent.bodyLength() : 0;
    reqBody.contentType = mediaType;
    reqBody.blobContent = fileContent.body();
    reqBody.name = fileContent.name();
    return reqBody;
  }
}