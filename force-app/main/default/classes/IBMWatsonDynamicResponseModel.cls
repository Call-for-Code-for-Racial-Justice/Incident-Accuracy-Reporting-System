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

public virtual class IBMWatsonDynamicResponseModel extends IBMWatsonResponseModel {
  private Map<String, Object> additionalProperties;

  public Object get(String key) {
    if (additionalProperties == null) {
      additionalProperties = new Map<String, Object>();
    }
    return additionalProperties.get(key);
  }

  public void put(String key, Object val) {
    if (additionalProperties == null) {
      additionalProperties = new Map<String, Object>();
    }
    additionalProperties.put(key, val);
  }

  public Map<String, Object> getDynamicProperties() {
    return this.additionalProperties;
  }
}