import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  /*
    ApiInterceptor is an class extends Interceptor and override the (onRequest, onResponse, onError) methods
    that is used to intercept the request and response of the API and add headers to the request
  */
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // headers send with request not within request 
    options.headers["Authorization"] = "Bearer ";
    options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";
    options.headers["Accept-Language"] = "en";
    super.onRequest(options, handler);
  }
}