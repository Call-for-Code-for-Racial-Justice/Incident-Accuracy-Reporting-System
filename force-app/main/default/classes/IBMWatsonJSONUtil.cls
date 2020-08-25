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

/*
 * Utility class to handle any special JSON serialization/deserialization beyond the
 * scope of the default JSON methods.
 */
public class IBMWatsonJSONUtil {

  /**
   * Replaces top-level keys in a map based on the provided mapping.
   *
   * @param jsonMap the map on which key substitution will be performed
   * @param nameMapping Map containing names to replace and the value to use instead
   *
   * @return the map with keys replaced
   */
  public static Map<String, Object> replaceKeyNamesInMap(Map<String, Object> jsonMap, Map<String, String> nameMapping) {
    for (String key : jsonMap.keySet()) {
      if (nameMapping.containsKey(key)) {
        String replacementKey = nameMapping.get(key);
        jsonMap.put(replacementKey, jsonMap.get(key));
        jsonMap.remove(key);
      }
    }
    return jsonMap;
  }

  /**
   * Replaces top-level keys in a JSON string based on the provided mapping.
   *
   * @param jsonString the string on which key substitution will be performed
   * @param nameMapping Map containing names to replace and the value to use instead
   *
   * @return the string with keys replaced
   */
  public static String replaceKeyNamesInString(String jsonString, Map<String, String> nameMapping) {
    Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
    jsonMap = replaceKeyNamesInMap(jsonMap, nameMapping);
    return JSON.serialize(jsonMap);
  }

  /**
   * Brings additional properties on dynamic models up one JSON level so that they can
   * be processed properly by the service.
   *
   * @param jsonMap Map representation of the JSON request
   *
   * @return Map representing the JSON request with moved additional properties
   */
  public static Map<String, Object> raiseAdditionalProperties(Map<String, Object> jsonMap) {
    Map<String, Object> additionalProperties = (Map<String, Object>) jsonMap.get('additionalProperties');
    if (additionalProperties != null) {
      for (String key : additionalProperties.keySet()) {
        jsonMap.put(key, additionalProperties.get(key));
      }
      jsonMap.remove('additionalProperties');
    }

    for (String key : jsonMap.keySet()) {
      Object jsonSection = jsonMap.get(key);
      if (jsonSection instanceof Map<String, Object>) {
        Map<String, Object> raisedSection = raiseAdditionalProperties((Map<String, Object>) jsonSection);
        jsonMap.put(key, raisedSection);
      }
      if (jsonSection instanceof List<Object>) {
        List<Object> raisedSection = raiseAdditionalPropertiesList((List<Object>) jsonSection);
        jsonMap.put(key, raisedSection);
      }
    }

    return jsonMap;
  }

  /**
   * Helper function for the public method to specifically handle JSON arrays.
   *
   * @param jsonList List representation of the current JSON array
   *
   * @return List with any nested additional properties brought up a level
   */
  private static List<Object> raiseAdditionalPropertiesList(List<Object> jsonList) {
    List<Object> modifiedList = new List<Object>();
    for (Object val : jsonList) {
      if (val instanceof Map<String, Object>) {
        modifiedList.add(raiseAdditionalProperties((Map<String, Object>) val));
      } else {
        modifiedList.add(val);
      }
    }
    return modifiedList;
  }
}