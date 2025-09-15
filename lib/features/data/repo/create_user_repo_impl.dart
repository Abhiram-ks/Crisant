import 'package:crisent_pannel/features/data/datasource/createuser_remote_datasource.dart';
import 'package:crisent_pannel/features/domain/entity/createuser_entity.dart';
import 'package:crisent_pannel/features/domain/repo/create_user_repo.dart';

class CreateuserRepositoryImpl implements CreateuserRepository {
  final CreateuserRemoteDatasource remoteDatasource;

  CreateuserRepositoryImpl({required this.remoteDatasource});

  @override
  Future<bool> createUser(CreateuserEntity user) async {
    return await remoteDatasource.createUser(user);
  }
}