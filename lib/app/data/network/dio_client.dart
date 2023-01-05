import 'package:dio/dio.dart';
import 'package:pokedex/app/data/network/network_exceptions.dart';

class DioClient {
  // dio instance
  final Dio _dio;

  // injecring dio instance
  DioClient(this._dio);

  // Get: ----------------------------------------------------------------------------------------------
  Future<T> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data as T;
    } on DioError catch (e) {
      final Exception? networkError = _buildError(e);

      if (networkError != null) {
        throw networkError;
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Exception? _buildError(DioError error) {
    if (error.response != null &&
        error.response!.data != null &&
        (error.response!.data! as Map<String, dynamic>)["error"] != null &&
        (error.response!.data as Map<String, dynamic>)["statusCode"] == 400) {
      return NetworkException(
        message:
            (error.response!.data as Map<String, dynamic>)["error"] as String?,
        statusCode: (error.response!.data as Map<String, dynamic>)["statusCode"]
            as int?,
      );
    }

    return null;
  }
}
