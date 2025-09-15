import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'splash_event.dart';
part 'splash_state.dart';


class SplashBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SplashBloc() : super(SplashBlocInitial()) {
    on<SplashEventRequest>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2)); 
      try {
        final User? currentUser = _auth.currentUser;
        if (currentUser != null) {
          emit(SplashBlocGoToDashBord());
        } else {
          emit(SplashBlocGoToLogin());
        }
      } catch (e) {
        emit(SplashBlocGoToLogin());
      }
    });
  }
}
