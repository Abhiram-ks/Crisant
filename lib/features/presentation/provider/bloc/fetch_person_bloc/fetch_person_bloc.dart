import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/features/data/datasource/person_local_datasource.dart';
import 'package:crisent_pannel/features/data/model/person_model.dart';
import 'package:flutter/material.dart';
part 'fetch_person_event.dart';
part 'fetch_person_state.dart';

class FetchPersonBloc extends Bloc<FetchPersonEvent, FetchPersonState> {
  final PersonLocalDatasource _datasource;

  FetchPersonBloc(this._datasource) : super(FetchPersonInitial()) {
      on<FetchPersonEventRequest>(_onFetchPerson);
  }

   Future<void> _onFetchPerson(
      FetchPersonEvent event, Emitter<FetchPersonState> emit) async {
    try {
      emit(PersonLoading());
      final person = await _datasource.getPerson();
      if (person != null) {
        emit(PersonLoaded(person));
      } else {
        emit(PersonEmpty());
      }
    } catch (e) {
      emit(PersonError(e.toString()));
    }
  }

}
