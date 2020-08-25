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

public with sharing class IBMWatsonHttpStatus {
  /** 202 Accepted (HTTP/1.0 - RFC 1945). */
  public static final Integer ACCEPTED = 202;
  /** 502 Bad Gateway (HTTP/1.0 - RFC 1945). */
  public static final Integer BAD_GATEWAY = 502;
  /** 400 Bad Request (HTTP/1.1 - RFC 2616). */
  public static final Integer BAD_REQUEST = 400;
  /** 409 Conflict (HTTP/1.1 - RFC 2616). */
  public static final Integer CONFLICT = 409;
  /** 100 Continue (HTTP/1.1 - RFC 2616). */
  public static final Integer REQ_CONTINUE = 100;
  /** 201 Created (HTTP/1.0 - RFC 1945). */
  public static final Integer CREATED = 201;
  /** 417 Expectation Failed (HTTP/1.1 - RFC 2616). */
  public static final Integer EXPECTATION_FAILED = 417;
  /** 424 Failed Dependency (WebDAV - RFC 2518). */
  public static final Integer FAILED_DEPENDENCY = 424;
  /** 403 Forbidden (HTTP/1.0 - RFC 1945). */
  public static final Integer FORBIDDEN = 403;
  /** 504 Gateway Timeout (HTTP/1.1 - RFC 2616). */
  public static final Integer GATEWAY_TIMEOUT = 504;
  /** 410 Gone (HTTP/1.1 - RFC 2616). */
  public static final Integer GONE = 410;
  /** 505 HTTP Version Not Supported (HTTP/1.1 - RFC 2616). */
  public static final Integer HTTP_VERSION_NOT_SUPPORTED = 505;
  /** 507 Insufficient Storage (WebDAV - RFC 2518). */
  public static final Integer INSUFFICIENT_STORAGE = 507;
  /** 500 Server Error (HTTP/1.0 - RFC 1945). */
  public static final Integer INTERNAL_SERVER_ERROR = 500;
  /** 411 Length Required (HTTP/1.1 - RFC 2616). */
  public static final Integer LENGTH_REQUIRED = 411;
  /** 423 Locked (WebDAV - RFC 2518). */
  public static final Integer LOCKED = 423;
  /** 405 Method Not Allowed (HTTP/1.1 - RFC 2616). */
  public static final Integer METHOD_NOT_ALLOWED = 405;
  /** 301 Moved Permanently (HTTP/1.0 - RFC 1945). */
  public static final Integer MOVED_PERMANENTLY = 301;
  /** 302 Moved Temporarily (Sometimes Found) (HTTP/1.0 - RFC 1945). */
  public static final Integer MOVED_TEMPORARILY = 302;
  /**
   * 207 Multi-Status (WebDAV - RFC 2518) or 207 Partial Update OK (HTTP/1.1 - draft-ietf-http-v11-spec-rev-01?).
   */
  public static final Integer MULTI_STATUS = 207;
  /** 300 Multiple Choices (HTTP/1.1 - RFC 2616). */
  public static final Integer MULTIPLE_CHOICES = 300;
  /** 204 No Content (HTTP/1.0 - RFC 1945). */
  public static final Integer NO_CONTENT = 204;
  /** 203 Non Authoritative Information (HTTP/1.1 - RFC 2616). */
  public static final Integer NON_AUTHORITATIVE_INFORMATION = 203;
  /** 406 Not Acceptable (HTTP/1.1 - RFC 2616). */
  public static final Integer NOT_ACCEPTABLE = 406;
  /** 404 Not Found (HTTP/1.0 - RFC 1945). */
  public static final Integer NOT_FOUND = 404;
  /** 501 Not Implemented (HTTP/1.0 - RFC 1945). */
  public static final Integer NOT_IMPLEMENTED = 501;
  /** 304 Not Modified (HTTP/1.0 - RFC 1945). */
  public static final Integer NOT_MODIFIED = 304;
  /** 200 OK (HTTP/1.0 - RFC 1945). */
  public static final Integer OK = 200;
  /** 206 Partial Content (HTTP/1.1 - RFC 2616). */
  public static final Integer PARTIAL_CONTENT = 206;
  /** 402 Payment Required (HTTP/1.1 - RFC 2616). */
  public static final Integer PAYMENT_REQUIRED = 402;
  /** 412 Precondition Failed (HTTP/1.1 - RFC 2616). */
  public static final Integer PRECONDITION_FAILED = 412;
  /** 407 Proxy Authentication Required (HTTP/1.1 - RFC 2616). */
  public static final Integer PROXY_AUTHENTICATION_REQUIRED = 407;
  /** 408 Request Timeout (HTTP/1.1 - RFC 2616). */
  public static final Integer REQUEST_TIMEOUT = 408;
  /** 413 Request Entity Too Large (HTTP/1.1 - RFC 2616). */
  public static final Integer REQUEST_TOO_LONG = 413;
  /** 414 Request-URI Too Long (HTTP/1.1 - RFC 2616). */
  public static final Integer REQUEST_URI_TOO_LONG = 414;
  /** 416 Requested Range Not Satisfiable (HTTP/1.1 - RFC 2616). */
  public static final Integer REQUESTED_RANGE_NOT_SATISFIABLE = 416;
  /** 205 Reset Content (HTTP/1.1 - RFC 2616). */
  public static final Integer RESET_CONTENT = 205;
  /** 303 See Other (HTTP/1.1 - RFC 2616). */
  public static final Integer SEE_OTHER = 303;
  /** 503 Service Unavailable (HTTP/1.0 - RFC 1945). */
  public static final Integer SERVICE_UNAVAILABLE = 503;
  /** 307 Temporary Redirect (HTTP/1.1 - RFC 2616). */
  public static final Integer TEMPORARY_REDIRECT = 307;
  /** 429 Too Many Requests. */
  public static final Integer TOO_MANY_REQUESTS = 429;
  /** 401 Unauthorized (HTTP/1.0 - RFC 1945). */
  public static final Integer UNAUTHORIZED = 401;
  /** 422 Unprocessable Entity (WebDAV - RFC 2518). */
  public static final Integer UNPROCESSABLE_ENTITY = 422;
  /** 415 Unsupported Media Type (HTTP/1.1 - RFC 2616). */
  public static final Integer UNSUPPORTED_MEDIA_TYPE = 415;
  /** 305 Use Proxy (HTTP/1.1 - RFC 2616). */
  public static final Integer USE_PROXY = 305;
}