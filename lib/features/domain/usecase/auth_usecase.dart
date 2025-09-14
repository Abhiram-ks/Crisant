
import 'package:crisent_pannel/core/error/firebase_exception.dart';
import 'package:crisent_pannel/features/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInUsecase {
  final AuthRepository _repo;

  GoogleSignInUsecase(this._repo);

  Future<bool> call() async {
    try {
      return _repo.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionCustom( 'Authentication failed: ${e.message ?? "An unexpected error occurred. Please try again."}');
    } on GoogleSignInException catch (_) {
       rethrow;
    } catch (e) {
      throw Exception('Unexpected Error occured due to: $e. Please try again');
    }
  }
}