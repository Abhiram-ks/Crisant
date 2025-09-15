part of 'createuser_bloc.dart';

@immutable
abstract class CreateuserEvent {}

final class CreateuserInitial extends CreateuserEvent {}

final class CreateUserRequest extends CreateuserEvent {
  final String image;
  final String firstname;
  final String lastname;
  final String emill;

  CreateUserRequest({required this.emill, required this.firstname, required this.lastname, required this.image});
}

final class CreateUserProced extends CreateuserEvent {}