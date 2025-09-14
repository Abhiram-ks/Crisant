import 'package:crisent_pannel/features/domain/entity/user_entity.dart';

abstract class UserRepository {
  Stream<List<UserEntity>> getUsers(int page);
}
