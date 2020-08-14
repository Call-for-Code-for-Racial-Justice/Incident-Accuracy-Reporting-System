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

public class IBMWatsonMediaType {

  private static final String TOKEN = '([a-zA-Z0-9-!#$%&\'*+.^_`{|}~]+)';
  private static final String QUOTED = '"([^"]*)"';
  private static final System.Pattern TYPE_SUBTYPE = System.Pattern.compile(TOKEN + '/' + TOKEN);
  private static final System.Pattern PARAMETER = System.Pattern.compile(';\\s*(?:' + TOKEN + '=(?:' + TOKEN + '|' + QUOTED + '))?');

  private final String mediaType;
  public final String typeM {public get; private set;}
  public final String subtype {public get; private set;}
  public final String charset {public get; private set;}

  private IBMWatsonMediaType(String mediaType, String typeM, String subtype, String charset) {
    this.mediaType = mediaType;
    this.typeM = typeM;
    this.subtype = subtype;
    this.charset = charset;
  }

  /**
   * Returns a media type for {@code string}, or null if {@code string} is not a well-formed media
   * type.
   */
  public static IBMWatsonMediaType parse(String str) {
    Matcher typeSubtypeMatcher = TYPE_SUBTYPE.matcher(str);
    if (!typeSubtypeMatcher.lookingAt()) return null;
    String typeStr = typeSubtypeMatcher.group(1).toLowerCase('en');
    String subtype = typeSubtypeMatcher.group(2).toLowerCase('en');
    String charset = null;
    Matcher parameterMatcher = PARAMETER.matcher(str);
    for (integer s = typeSubtypeMatcher.end(); s < str.length(); s = parameterMatcher.end()) {
      parameterMatcher.region(s, str.length());
      if (!parameterMatcher.lookingAt()) {
        return null; // This is not a well-formed media type.
      }
      String name;
      if (parameterMatcher.groupCount() > 0) {
        name = parameterMatcher.group(1);
      }
      if (name == null || !name.equalsIgnoreCase('charset')) continue;
      String charsetParameter;
      String token;
      if (parameterMatcher.groupCount() > 1) {
        token = parameterMatcher.group(2);
      }
      if (token != null) {
        // If the token is 'single-quoted' it's invalid! But we're lenient and strip the quotes.
        charsetParameter = (token.startsWith('\'') && token.endsWith('\'') && token.length() > 2)
            ? token.substring(1, token.length() - 1)
            : token;
      } else {
        // Value is "double-quoted". That's valid and our regex group already strips the quotes.
        charsetParameter = parameterMatcher.group(3);
      }
      if (charset != null && !charsetParameter.equalsIgnoreCase(charset)) {
        return null; // Multiple different charsets!
      }
      charset = charsetParameter;
    }
    return new IBMWatsonMediaType(str, typeStr, subtype, charset);
  }

  /**
   * Returns the encoded media type, like "text/plain; charset=utf-8", appropriate for use in a
   * Content-Type header.
   */
  public override String toString() {
    return mediaType;
  }

  public boolean equals(Object other) {
    return other instanceof IBMWatsonMediaType && ((IBMWatsonMediaType) other).mediaType.equals(mediaType);
  }


  public integer hashCode() {
    return mediaType.hashCode();
  }
}