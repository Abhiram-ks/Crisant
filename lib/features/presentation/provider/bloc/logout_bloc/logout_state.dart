part of 'logout_bloc.dart';

@immutable
abstract class LogoutState {}
final class LogoutInitial extends LogoutState {}
final class LogoutConfirmation extends LogoutState {}
final class LogoutSuccess extends LogoutState {}
final class LogoutFailure extends LogoutState {}
