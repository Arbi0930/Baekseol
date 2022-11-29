import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: "http://202.70.34.26/",
            receiveTimeout: 30000,
            sendTimeout: 30000,
          ),
        );

  Future<Response> getRequest(String path) async {
    return dio.get(path);
  }
}
