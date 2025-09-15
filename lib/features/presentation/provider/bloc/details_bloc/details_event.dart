part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}
final class DeleteRequest extends DetailsEvent {
  final int id;
  DeleteRequest({required this.id});
}
