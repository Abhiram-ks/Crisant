part of 'single_user_bloc.dart';


@immutable

abstract class SingleUserEvent {}

class FetchUserByIdEvent extends SingleUserEvent {
  final String userId;

   FetchUserByIdEvent(this.userId);
}
