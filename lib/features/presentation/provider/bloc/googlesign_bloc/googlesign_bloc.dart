import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/core/notification/notification_service.dart';
import 'package:crisent_pannel/core/notification/push_notificaion_service.dart';
import 'package:crisent_pannel/features/data/datasource/person_local_datasource.dart'
    show PersonLocalDatasource;
import 'package:crisent_pannel/features/domain/usecase/auth_usecase.dart';
import 'package:flutter/material.dart';
part 'googlesign_event.dart';
part 'googlesign_state.dart';

class GooglesignBloc extends Bloc<GooglesignEvent, GooglesignState> {
  final GoogleSignInUsecase _usecase;
  final PersonLocalDatasource _local = PersonLocalDatasource();
  GooglesignBloc(this._usecase) : super(GooglesignInitial()) {
    on<GoogleSignUP>(_auth);
  }

  Future<void> _auth(GoogleSignUP event, Emitter<GooglesignState> emit) async {
    emit(GooglesingLoading());
    try {
      final success = await _usecase.call();
      if (success) {
        final person = await _local.getPerson();

        if (person == null || person.fcmToken.isEmpty) {
          await LocalNotificationServices.showNotification(
            title: "Welcome Aboard!",
            body: "Your account is ready. Start exploring endless possibilities today!",
            payload: "google_login_success",
          );
        } else {
          final success = await PushNotificationSender.sendPushNotification(
            title: "Welcome Aboard!",
            body:
                "Your account is ready. Start exploring endless possibilities today!",
            token: person.fcmToken,
          );

          if (!success) {
            await LocalNotificationServices.showNotification(
              title: "Welcome Aboard!",
              body: "Your account is ready. Start exploring endless possibilities today!",
              payload: "google_login_success",
            );
          }
        }

        emit(GooglesingSuccess());
      } else {
        emit(GooglesingFailure(message: 'Sign-In failed. Please try again.'));
      }
    } catch (e) {
      emit(GooglesingFailure(message: e.toString()));
    }
  }
}
