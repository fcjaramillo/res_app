import 'package:dio/dio.dart';
import 'package:res_app/core/models/result.dart';

enum Method {
  get,
  post,
}

class ApiUtils{

  final Dio _client;
  final String _host;

  ApiUtils({
    required Dio client,
    required String host,
  }) : _client = client,
       _host = host;

  Future<Result<dynamic, BackError>> makeRequest({
    dynamic data,
    Map<String, dynamic>? headers,
    required Method method,
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {

    Map<String, dynamic> _headers = <String, dynamic>{};

    //Additional headers
    _headers.addAll(headers ?? {});

    Uri uri = Uri.https(_host, path, queryParameters);

    final Response response;

    final Options options = Options(
      headers: _headers,
    );

    try {
      switch (method) {
        case Method.get:
          response = await _client.getUri(
            uri,
            options: options,
          );
          break;
        case Method.post:
          response = await _client.postUri(
            uri,
            data: data,
            options: options,
          );
          break;
      }
      return Result.success(response.data);
    } on DioError catch (error) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return Result.fail(
            BackError(
              statusCode: 408,
              description: error.error,
              err: 'TimeOut',
            ),
          );
        default:
          return Result.fail(
            BackError(
              data: error.response?.data is String
                  ? {"message": ''}
                  : (error.response!.data as Map),
              description: error.message,
              err: error.error.toString(),
              statusCode: error.response?.statusCode ?? -1,
            ),
          );
      }
    }
  }
}