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

public class IBMWatsonServiceExceptions {
  
  public abstract class ServiceException extends Exception {

    private final Integer statusCode;
    private final IBMWatsonResponse response;

    /**
    * Instantiates a new Service Response Exception.
    *
    * @param statusCode the status code
    * @param message the error message
    * @param response the HTTP response
    */
    public ServiceException(Integer statusCode, String message, IBMWatsonResponse response) {
      this(message);
      this.statusCode = statusCode;
      this.response = response;
    }

    /**
    * Gets the HTTP status code.
    *
    * @return the http status code
    */
    public Integer getStatusCode() {
      return statusCode;
    }
    /**
    * Gets the HTTP response.
    *
    * @return the HTTP response
    */
    public IBMWatsonResponse getResponse() {
      return response;
    }
  }


  /**
   * 400 Bad Request (HTTP/1.1).
   */
  public class BadRequestException extends ServiceException {

    /**
     * Instantiates a new BadRequest Exception. HTTP 400
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public BadRequestException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.BAD_REQUEST, message, response);
    }
  }

  /**
   * 409 Conflict (HTTP/1.1).
   */
  public class ConflictException  extends ServiceException {

    /**
     * Instantiates a new Conflict Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public ConflictException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.CONFLICT, message, response);
    }
  }

  /**
   * 403 Forbidden (HTTP/1.0).
   */
  public class ForbiddenException extends ServiceException {

    /**
     * Instantiates a new Forbidden Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public ForbiddenException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.FORBIDDEN, message, response);
    }
  }

  /**
   * 500 Server Error (HTTP/1.0).
   */
  public class InternalServerErrorException extends ServiceException {

    /**
     * Instantiates a new Forbidden Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public InternalServerErrorException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.INTERNAL_SERVER_ERROR, message, response);
    }
  }

  /**
   * 404 Not Found (HTTP/1.0).
   */
  public class NotFoundException extends ServiceException {

    /**
     * Instantiates a new Not Found Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public NotFoundException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.NOT_FOUND, message, response);
    }
  }

  /**
   * 413 Request Entity Too Large (HTTP/1.1).
   */
  public class RequestTooLargeException extends ServiceException {

    /**
     * Instantiates a new Request Too Large Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public RequestTooLargeException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.REQUEST_TOO_LONG, message, response);
    }
  }

  /**
   * Default Response Exception  (HTTP/1.1).
   */
  public class ResponseException extends ServiceException {

    /**
     * Instantiates a new Response Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public ResponseException(Integer statusCode, String message, IBMWatsonResponse response) {
      super(statusCode, message, response);
    }
  }

  /**
   * 503 Service Unavailable  (HTTP/1.1).
   */
  public class ServiceUnavailableException extends ServiceException {

    /**
     * Instantiates a new Service Unavailable Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public ServiceUnavailableException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.SERVICE_UNAVAILABLE, message, response);
    }
  }

  /**
   * 429 Too Many Requests  (HTTP/1.1).
   */
  public class TooManyRequestsException extends ServiceException {

    /**
     * Instantiates a new Too Many Requests Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public TooManyRequestsException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.TOO_MANY_REQUESTS, message, response);
    }
  }

  /**
   * 401 Unauthorized  (HTTP/1.0).
   */
  public class UnauthorizedException extends ServiceException {

    /**
     * Instantiates a new Unauthorized Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public UnauthorizedException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.UNAUTHORIZED, message, response);
    }
  }

  /**
   * 415 Unsupported Media Type  (HTTP/1.1).
   */
  public class UnsupportedException extends ServiceException {

    /**
     * Instantiates a new unsupported Exception.
     *
     * @param message the error message
     * @param response the HTTP response
     */
    public UnsupportedException(String message, IBMWatsonResponse response) {
      super(IBMWatsonHttpStatus.UNSUPPORTED_MEDIA_TYPE, message, response);
    }
  }

  public class IllegalArgumentException extends Exception { }
}