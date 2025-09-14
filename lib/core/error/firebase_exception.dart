class FirebaseAuthExceptionCustom implements Exception {
  final String message;
  FirebaseAuthExceptionCustom(this.message);

  @override
  String toString() => 'FirebaseAuthException: $message';
}

class GoogleSignInException implements Exception {
  final String message;
  GoogleSignInException(this.message);

  @override
  String toString() => 'GoogleSignInException: $message';
}

class LocalDatabaseException implements Exception {
  final String message;
  LocalDatabaseException(this.message);

  @override
  String toString() => 'LocalDatabaseException: $message';
}
