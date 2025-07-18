import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../config/environment.dart';

class DioClient extends DioForNative {
  Environment _environment;

  String? _authToken;

  void setToken(String token) {
    this._authToken = token;
  }

  DioClient({required Environment environment}) : _environment = environment {
    options = BaseOptions(
      baseUrl: _environment.baseUrl,
      responseType: ResponseType.json,
    );
    interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) {
        if (_authToken != null) {
          options.headers
              .putIfAbsent('Authorization', () => 'Bearer $_authToken');
        }
        return handler.next(options);
      }),
    );
    interceptors.add(LogInterceptor(
      request: false,
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
    ));
  }
}
