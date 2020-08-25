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

public virtual class IBMWatsonOptionsModel {
  public Map<String, String> requestHeaders = new Map<String, String>();
  
  /**
   * Gets the internal request headers.
   */
  public Map<String, String> requestHeaders() {
    return this.requestHeaders;
  }

  public virtual Map<String, String> getSdkToApiMapping() {
    return new Map<String, String>();
  }

  public virtual Map<String, String> getApiToSdkMapping() {
    return new Map<String, String>();
  }
}