/*
 * (C) Copyright IBM Corp. 2019, 2020.
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

public interface IBMWatsonAuthenticator {

  /**
   * Returns the authentication type associated with the IBMWatsonAuthenticator instance.
   *
   * @return a string representing the authentication type (e.g. "iam", "basic", "cp4d", etc.)
   */
  String authenticationType();

  /**
   * Perform the necessary authentication steps for the specified request.
   *
   * @param requestBuilder the IBMWatsonRequest.Builder instance to authenticate
   */
  void authenticate(IBMWatsonRequest.Builder requestBuilder);

  /**
   * Validates the current set of configuration information in the IBMWatsonAuthenticator.
   */
  void validate();
}