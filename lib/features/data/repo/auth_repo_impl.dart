import 'package:crisent_pannel/core/error/firebase_exception.dart';
import 'package:crisent_pannel/features/data/datasource/auth_remote_datasource.dart';
import 'package:crisent_pannel/features/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({required this.remote});

  @override
  Future<bool> signInWithGoogle() async {
    try {
      return await remote.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionCustom(
        'Authentication failed: ${e.message ?? "An unexpected error occurred. Please try again."}',
      );
    } on GoogleSignInException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error occurred: $e. Please try again.');
    }
  }
}
