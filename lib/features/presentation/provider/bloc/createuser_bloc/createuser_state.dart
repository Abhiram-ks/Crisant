part of 'createuser_bloc.dart';

@immutable
sealed class CreateuserState {}

final class CreateuserInitiaState extends CreateuserState {}
final class ShowInformationAlert extends CreateuserState {}
final class CreateUserloaidngState extends CreateuserState {}
final class CreateUSerSuccessState extends CreateuserState {}
final class CrateUSerFailureState extends CreateuserState {
  final String error;
  CrateUSerFailureState({required this.error});
}
