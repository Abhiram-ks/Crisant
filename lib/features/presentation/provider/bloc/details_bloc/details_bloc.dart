import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/features/data/datasource/delete_user_remote_datasource.dart';
import 'package:flutter/material.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DeleteUserRemoteDatasource deleteUserRemoteDatasource;

  DetailsBloc(this.deleteUserRemoteDatasource) : super(DetailsInitial()) {
    on<DeleteRequest>(_onDeleteUser);
  }

  Future<void> _onDeleteUser(
    DeleteRequest event,
    Emitter<DetailsState> emit,
  ) async {
    try {
      final result = await deleteUserRemoteDatasource.deleteUser(event.id);
      if (result) {
        emit(DeleteSuccess());
      } else {
        emit(DeleteFailure());
      }
    } catch (e) {
      emit(DeleteFailure());
    }
  }
}