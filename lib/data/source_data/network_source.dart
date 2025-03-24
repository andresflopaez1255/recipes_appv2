import 'package:dio/dio.dart';

class NetworkSource {
  late final Dio _dio;

  NetworkSource({String? baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
      headers: {
        'Content-Type': 'application/json',
      },
    ));
  }

  /// GET
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// POST
  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// Manejo de errores
  String _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "Conexión agotada";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Tiempo de espera agotado";
    } else if (e.type == DioExceptionType.badResponse) {
      return "Error en la respuesta: ${e.response?.statusCode}";
    } else {
      return "Error de red: ${e.message}";
    }
  }
}
