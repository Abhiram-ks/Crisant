import 'package:crisent_pannel/features/domain/repo/imagepicker_repo.dart';

class PickImageUseCase {
  final ImagePickerRepository repository;

  PickImageUseCase(this.repository);

  Future<String?> call() async {
    return await repository.pickImage();
  }
}
