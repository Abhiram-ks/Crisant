import 'package:crisent_pannel/features/data/datasource/user_remote_datasource.dart';
import 'package:crisent_pannel/features/domain/entity/user_entity.dart';
import 'package:crisent_pannel/features/domain/repo/user_repo.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl({required this.remoteDataSource});
  @override
  Stream<List<UserEntity>> getUsers(int page) async* {
    try {
      final users = await remoteDataSource.fetchUsers(page);
      yield users;
    } catch (e) {
      throw Exception("Repository error: $e");
    }
  }
}
