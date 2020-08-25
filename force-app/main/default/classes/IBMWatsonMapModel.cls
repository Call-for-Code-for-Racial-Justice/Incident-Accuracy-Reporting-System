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
 * Class used to represent model properties of type Map<String, Object>, since the base deserializer can't handle
 * deserializing that type.
 */
public class IBMWatsonMapModel extends IBMWatsonDynamicModel {

  public override Object deserialize(String jsonString, Map<String, Object> jsonMap, Type classType) {
    if (jsonMap == null) {
      return null;
    }

    IBMWatsonMapModel ret = (IBMWatsonMapModel) super.deserialize(jsonString, jsonMap, classType);

    Set<String> baseProps = ((Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this))).keySet();

    for (String key : jsonMap.keySet()) {
      if (!baseProps.contains(key)) {
        ret.put(key, jsonMap.get(key));
      }
    }

    return ret;
  }

  public Map<String, Object> replacePropertyNames() {
    // get map representation of current model
    Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(this));

    jsonMap = IBMWatsonJSONUtil.raiseAdditionalProperties(jsonMap);

    return jsonMap;
  }
}