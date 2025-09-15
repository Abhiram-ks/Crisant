import 'package:crisent_pannel/features/domain/entity/createuser_entity.dart';

abstract class CreateuserRepository {
  Future<bool> createUser(CreateuserEntity user);
}
