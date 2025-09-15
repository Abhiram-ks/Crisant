part of 'logout_bloc.dart';

@immutable
abstract class LogoutEvent {}
final class LogoutRequestTrigger extends LogoutEvent {}
final class LogoutResponseEvent extends LogoutEvent {}