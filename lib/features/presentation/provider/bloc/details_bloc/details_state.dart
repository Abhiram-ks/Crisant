part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DeleteSuccess extends DetailsState {}
final class DeleteFailure extends DetailsState {}