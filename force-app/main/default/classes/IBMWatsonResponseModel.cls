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

public virtual class IBMWatsonResponseModel extends IBMWatsonGenericModel {
  private Map<String, String> headers = new Map<String, String>();

  /**
   * Allows user to see the JSON string by default for easier debugging.
   *
   * @return serialized String form of this
   */
  public override String toString() {
    // remove response headers from string representation
    Map<String, Object> fullJsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));
    fullJsonMap.remove('headers');

    // raise additional props
    fullJsonMap = IBMWatsonJSONUtil.raiseAdditionalProperties(fullJsonMap);

    // pretty print formatting
    return JSON.serializePretty(fullJsonMap);
  }

  /**
   * Gets the response headers attached to this response model.
   */
  public Map<String, String> getHeaders() {
    return this.headers;
  }

  /**
   * Adds a header to this response model.
   *
   * Meant to only be used internally to populate response headers from the IBMWatsonService class.
   */
  public void addHeader(String name, String value) {
    if (this.headers == null) {
      this.headers = new Map<String, String>();
    }
    this.headers.put(name, value);
  }
}