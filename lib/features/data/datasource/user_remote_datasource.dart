import 'dart:developer';

import 'package:crisent_pannel/core/service/api_service.dart';
import 'package:crisent_pannel/features/data/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSource {
  final ApiClient apiClient;
  UserRemoteDataSource({required this.apiClient});

  Future<List<UserModel>> fetchUsers(int page) async {
    try {
      final response = await apiClient.dio.get(
        "api/users",
        queryParameters: {"page": page},
      );

      if (response.statusCode == 200 && response.data != null) {
        final List data = response.data['data'];
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load users, status: ${response.statusCode}");
      }
    } on DioException catch (dioError) {
      log('DioException: ${dioError.response?.statusCode} -> ${dioError.message}');
      throw Exception("Request error: ${dioError.message}. Please try again");
    } catch (e) {
      log(' Unexpected error: $e');
      throw Exception("Unexpected error: $e. Please try again");
    }
  }
}
