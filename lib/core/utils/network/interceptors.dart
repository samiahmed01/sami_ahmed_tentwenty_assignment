import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {

  @override
  void onError( DioException err, ErrorInterceptorHandler handler) {

    if (err.response?.statusCode == 401) {

    }
    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      //Ensure the token is valid before making the request
      options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzZlYmU4YmQxMTc0N2Y4MDRlMjc2ZDU4ZGI0NDc4ZCIsIm5iZiI6MTcyOTk2Mzg0NS40MDIsInN1YiI6IjY3MWQyNzQ1NmU0MjEwNzgwZjc5MmQwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.e3X6XWnrZP37bIs33twwogSnxSRHcrJVVgfUACGJ6TU',
        'Content-Type': 'application/json',
      };
    } catch (e) {
        debugPrint('Error ensuring token validity: $e');
    }
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response); // continue with the Response
  }
}