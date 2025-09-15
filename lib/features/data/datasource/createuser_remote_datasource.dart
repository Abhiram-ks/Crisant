import 'dart:developer';

import 'package:crisent_pannel/core/service/api_service.dart';
import 'package:crisent_pannel/features/domain/entity/createuser_entity.dart';
import 'package:dio/dio.dart';

class CreateuserRemoteDatasource {
  final ApiClient apiClient;
  CreateuserRemoteDatasource({required this.apiClient});

  Future<bool> createUser(CreateuserEntity user) async {
    try {
      final response = await apiClient.dio.post(
        "api/users",
        data: user.toJson()
      );


      if (response.statusCode == 201) {
        return true;
      } else {
        log("Failed to create user: ${response.statusCode} - ${response.data}");
        return false;
      }
    } on DioException catch (dioError) {
      log(
        'DioException: ${dioError.response?.statusCode} -> ${dioError.message}',
      );
      return false;
    } catch (e) {
      log('Unexpected error: $e');
      return false;
    }
  }
}
