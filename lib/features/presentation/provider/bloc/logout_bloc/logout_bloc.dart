import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/features/data/datasource/auth_remote_datasource.dart';
import 'package:flutter/material.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataSource authRemoteDataSource;
  LogoutBloc(this.authRemoteDataSource) : super(LogoutInitial()) {
    on<LogoutRequestTrigger>((event, emit) {
      emit(LogoutConfirmation());
    });
    on<LogoutResponseEvent>(_onLogout);
  }

  Future<void> _onLogout(
    LogoutResponseEvent event,
    Emitter<LogoutState> emit,
  ) async {
    try {
      await authRemoteDataSource.signOutWithGoogle();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure());
    }
  }
}
