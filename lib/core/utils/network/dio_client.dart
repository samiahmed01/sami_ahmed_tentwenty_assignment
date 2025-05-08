import 'package:dio/dio.dart';

import 'interceptors.dart';

class DioClient {

  late final Dio _dio;

  DioClient(String url): _dio = Dio(

    BaseOptions(
      baseUrl: url,
        headers: {
          'Accept': 'application/json; charset=utf-8',
          'Content-Type': 'application/json; charset=utf-8',
        },
        // responseType: ResponseType.json,
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)
    ),
  )..interceptors.addAll([LoggerInterceptor()]);

// GET METHOD
  Future < dynamic > get(
      String url, {
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        CancelToken ? cancelToken,
        ProgressCallback ? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    }
    on DioException {
      rethrow;
    }
  }

  // POST METHOD
  Future < dynamic > post(
      String url, {
        data,
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        ProgressCallback ? onSendProgress,
        ProgressCallback ? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future < dynamic > put(
      String url, {
        dynamic data,
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        CancelToken ? cancelToken,
        ProgressCallback ? onSendProgress,
        ProgressCallback ? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future < dynamic > delete(
      String url, {
        data,
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        CancelToken ? cancelToken,
      }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}