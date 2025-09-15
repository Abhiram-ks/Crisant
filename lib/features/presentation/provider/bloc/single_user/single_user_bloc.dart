import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/features/data/datasource/singleuser_remote_datasource.dart';
import 'package:crisent_pannel/features/data/model/user_model.dart';
import 'package:flutter/material.dart';
part 'single_user_event.dart';
part 'single_user_state.dart';

class SingleUserBloc extends Bloc<SingleUserEvent, SingleUserState> {
  final SingleUserRemoteDataSource remoteDataSource;

  SingleUserBloc({required this.remoteDataSource}) : super(SingleUserInitial()) {
    on<FetchUserByIdEvent>(_onFetchUserById);
  }

  Future<void> _onFetchUserById(
    FetchUserByIdEvent event,
    Emitter<SingleUserState> emit,
  ) async {
    emit(SingleUserLoading());
    try {
      final user = await remoteDataSource.fetchUserById(event.userId);
      emit(SingleUserLoaded(user));
    } catch (e) {
      emit(SingleUserError(e.toString()));
    }
  }
}
