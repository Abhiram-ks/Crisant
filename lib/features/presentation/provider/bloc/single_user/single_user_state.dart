part of 'single_user_bloc.dart';



@immutable

abstract class SingleUserState {}

class SingleUserInitial extends SingleUserState {}

class SingleUserLoading extends SingleUserState {}

class SingleUserLoaded extends SingleUserState {
  final UserModel user;

   SingleUserLoaded(this.user);

}

class SingleUserError extends SingleUserState {
  final String message;

   SingleUserError(this.message);
}
