import 'package:crisent_pannel/core/service/api_service.dart';
import 'package:crisent_pannel/features/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'dart:async';


class SingleUserRemoteDataSource {
  final ApiClient apiClient;
  SingleUserRemoteDataSource({required this.apiClient});

  Future<UserModel> fetchUserById(String id) async {
    try {
      final response = await apiClient.dio.get("api/users/$id");

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300 &&
          response.data != null) {
        final json = response.data['data'] ?? response.data;
        return UserModel.fromJson(json);
      } else {
        throw Exception("Failed to load user, status: ${response.statusCode}");
      }
    } on DioException catch (dioError) {
      throw Exception("Request error: ${dioError.message}. Please try again");
    } catch (e) {
      throw Exception("Unexpected error: $e. Please try again");
    }
  }
}
