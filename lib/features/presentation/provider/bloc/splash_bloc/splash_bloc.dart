import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBlocBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBlocBloc() : super(SplashBlocInitial()) {
    on<SplashEventRequest>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(SplashBlocGoToLogin());
      
    });
  }

}
