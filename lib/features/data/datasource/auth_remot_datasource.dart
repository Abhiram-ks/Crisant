

import 'dart:developer';

import 'package:crisent_pannel/core/error/firebase_exception.dart';
import 'package:crisent_pannel/features/data/datasource/person_local_datasource.dart';
import 'package:crisent_pannel/features/data/model/person_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final PersonLocalDatasource _localDatasource = PersonLocalDatasource();

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw GoogleSignInException('Sign-In cancelled by user. Please try again if you wish to continue.');
      final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =  await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) throw FirebaseAuthExceptionCustom('Authentication failed. No user information was returned. Please try signing in again.');
        String? fcmToken = await FirebaseMessaging.instance.getToken();
        log("FCM TOKEN: $fcmToken");
          final newUser = PersonModel(
            uid: user.uid,
            userName: user.displayName ?? '',
            email: user.email ?? '',
            image: user.photoURL ?? '',
            fcmToken: fcmToken ?? '',
          );
          try {
            await _localDatasource.insertPerson(newUser);
          } catch (e) {
            throw LocalDatabaseException('Failed to save user data locally. Please try again. $e');
          }
          return true;
      
    } on FirebaseAuthException catch (e) {
        throw FirebaseAuthExceptionCustom( 'Authentication failed: ${e.message ?? "An unexpected error occurred. Please try again."}');
    } on GoogleSignInException catch (_)  {
         rethrow;
    } catch (e) {
      throw Exception('Unexpected Error occured due to: $e. Please try again');
    }
  }
}
