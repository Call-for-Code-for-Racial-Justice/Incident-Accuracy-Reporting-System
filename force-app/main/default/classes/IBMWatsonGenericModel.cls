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

public virtual class IBMWatsonGenericModel {

  /**
   * Allows user to see the JSON string by default for easier debugging.
   *
   * @return serialized String form of this
   */
  public virtual override String toString() {
    // get Map representation and raise additional props
    Map<String, Object> objectMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this, true));
    objectMap = IBMWatsonJSONUtil.raiseAdditionalProperties(objectMap);

    // pretty print formatting
    return JSON.serializePretty(objectMap);
  }

  /**
   * Allows comparison of custom models based on their serialized String form.
   *
   * @param obj the object this is being compared to
   *
   * @return Boolean indicating whether or not the two objects are equal
   */
  public Boolean equals(Object obj) {
    if ((obj == null)) {
      return false;
    }

    IBMWatsonGenericModel other = (IBMWatsonGenericModel) obj;

    return this.toString().equals(other.toString());
  }

  public virtual Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
    if (jsonMap == null) {
      return null;
    }

    Object ret;
    if (jsonString.equals('null')) {
      ret = classType.newInstance();
    }
    else {
      ret = JSON.deserialize(jsonString, classType);
    }

    return ret;
  }
}