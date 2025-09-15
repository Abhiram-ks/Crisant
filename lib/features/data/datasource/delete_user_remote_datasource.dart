
import 'package:crisent_pannel/core/service/api_service.dart';
import 'package:dio/dio.dart';

class DeleteUserRemoteDatasource {
  final ApiClient apiClient;
  DeleteUserRemoteDatasource({required this.apiClient});

  Future<bool> deleteUser(int id) async {
    try {
      final response = await apiClient.dio.delete(
        "api/users/$id",
      );

      if (response.statusCode == 204) {
        return true; 
      } else {
        throw Exception(
          "Failed to delete user. Status: ${response.statusCode}, Response: ${response.data}",
        );
      }
    } on DioException catch (dioError) {
      throw Exception(
        "Request failed with status: ${dioError.response?.statusCode}. "
        "Message: ${dioError.message}",
      );
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
