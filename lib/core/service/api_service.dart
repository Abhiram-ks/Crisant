import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({String baseUrl = "https://reqres.in/"})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
             headers: {
              "Accept": "application/json",
            },
          ),
        );
}
