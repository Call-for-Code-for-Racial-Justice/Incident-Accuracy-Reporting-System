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

public class IBMWatsonFile {

  private String name;
  private String description;
  private String contentType;
  private Long bodyLength;
  private Blob body;

  /**
   * File Builder.
   */
  public class FileBuilder {

    private String name;
    private String description;
    private String contentType;
    private Long bodyLength;
    private Blob body;

    /**
     * Instantiates a new builder.
     */
    public FileBuilder() {
    }

    /**
     * Set the file name.
     *
     * @param name the file name
     * @return the FileBuilder builder
     */
    public FileBuilder name(String name) {
      this.name = name;
      return this;
    }


    /**
     * Set the file information based on the Attachment.
     *
     * @param attach the attachment
     * @return the FileBuilder builder
     */
    public FileBuilder attachment(Attachment attach) {
      this.name = attach.name;
      this.body = attach.Body;
      this.description = attach.Description;
      this.contentType = attach.ContentType;
      return this;
    }

    /**
     * Set the file description if any.
     *
     * @param Description the file description
     * @return the FileBuilder builder
     */
    public FileBuilder description(String description) {
      this.description = description;
      return this;
    }

    /**
     * Set the file content type.
     *
     * @param ContentType the file content type
     * @return the FileBuilder builder
     */
    public FileBuilder contentType(String contentType) {
      this.contentType = contentType;
      return this;
    }

    /**
     * Set the file body as a blob type (base64).
     *
     * @param Body the file base64 content
     * @return the FileBuilder builder
     */
    public FileBuilder body(Blob body) {
      this.body = body;
      this.bodyLength = body != null ? body.size() : -1;
      return this;
    }

    /**
     * Builds a IBMWatsonFile.
     *
     * @return the IBMWatsonFile
     */
    public IBMWatsonFile build() {
      return new IBMWatsonFile(this);
    }
  }

  private IBMWatsonFile(FileBuilder builder) {
    this.name = builder.name;
    this.description = builder.description;
    this.contentType = builder.contentType;
    this.bodyLength = builder.bodyLength;
    this.body = builder.body;
  }


  public String name() {
    return this.name;
  }

  public String description() {
    return this.description;
  }

  public String contentType() {
    return this.contentType;
  }

  public Long bodyLength() {
    return this.bodyLength;
  }

  public Blob body() {
    return this.body;
  }

  public String bodyAsString() {
    if (this.body != null) {
      return this.body.toString();
    }
    return null;
  }
}