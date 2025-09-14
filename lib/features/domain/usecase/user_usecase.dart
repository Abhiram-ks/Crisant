import 'package:crisent_pannel/features/domain/entity/user_entity.dart';
import 'package:crisent_pannel/features/domain/repo/user_repo.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call(int page) {
    return repository.getUsers(page);
  }
}
