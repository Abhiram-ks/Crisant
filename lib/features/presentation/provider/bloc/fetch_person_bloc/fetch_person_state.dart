part of 'fetch_person_bloc.dart';

@immutable
abstract class FetchPersonState {}

final class FetchPersonInitial extends FetchPersonState {}

class PersonLoading extends FetchPersonState {}

class PersonLoaded extends FetchPersonState {
  final PersonModel person;
  PersonLoaded(this.person);
}

class PersonEmpty extends FetchPersonState {}

class PersonError extends FetchPersonState {
  final String message;
  PersonError(this.message);
}