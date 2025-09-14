import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/features/domain/entity/user_entity.dart';
import 'package:crisent_pannel/features/domain/usecase/user_usecase.dart';
import 'package:flutter/material.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;

  UserBloc({required this.getUsersUseCase}) : super(UserInitial()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(UserLoading());
      try {
        await emit.forEach<List<UserEntity>>(
          getUsersUseCase(event.page),
          onData: (users) => UserLoaded(users,currentPage: event.page),
          onError: (_, __) => UserError("Failed to fetch users"),
        );
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}