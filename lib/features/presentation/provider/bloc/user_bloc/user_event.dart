part of 'user_bloc.dart';

@immutable

abstract class UserEvent  {
}

class LoadUsersEvent extends UserEvent {
  final int page;
  LoadUsersEvent({required this.page});
}
