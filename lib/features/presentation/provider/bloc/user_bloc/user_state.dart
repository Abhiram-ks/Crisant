part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> users;
  final int currentPage;

  UserLoaded(this.users, {required this.currentPage});
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}
