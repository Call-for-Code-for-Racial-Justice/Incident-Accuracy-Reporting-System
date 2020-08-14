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

public class IBMWatsonFormBody extends IBMWatsonRequestBody {

  private static final String ENCODING_SCHEME = 'UTF-8';
  private static final String CONTENT_TYPE = 'application/x-www-form-urlencoded';

  private List<String> names;
  private List<String> values;

  private IBMWatsonFormBody(Builder builder) {
    this.names = builder.names;
    this.values = builder.values;
    this.contentType = IBMWatsonMediaType.parse(CONTENT_TYPE);
    writeContent();
  }

  private void writeContent() {
    this.content = '';
    for (Integer i = 0; i < names.size(); i++) {
      if (i > 0) {
      	content += '&';
      }
      this.content += names.get(i) + '=' + values.get(i);
    }
  }

  public class Builder {
    private List<String> names = new List<String>();
    private List<String> values = new List<String>();

    public Builder add(String name, String value) {
      names.add(EncodingUtil.urlEncode(name, ENCODING_SCHEME));
      values.add(EncodingUtil.urlEncode(value, ENCODING_SCHEME));
      return this;
    }

    public IBMWatsonFormBody build() {
      return new IBMWatsonFormBody(this);
    }
  }

}