
import 'package:bloc/bloc.dart';
import 'package:crisent_pannel/core/network/connectivity.dart';
import 'package:flutter/material.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final NetWorkChecker networkCheck;

  NetworkBloc(this.networkCheck) : super(NetworkInitial()) {
    on<CheckConnectivity>((event, emit) async {
      try {
        final connected = await networkCheck.isConnected();
        if (connected) {
          emit(NetworkGood());
        } else {
          emit(NetworkBad(error: "Internet connection lost"));
        }

        await emit.forEach<bool>(
          networkCheck.connectionStream,
          onData: (connected) {
            if (connected) {
              return NetworkGood();
            } else {
              return NetworkBad(error: "Internet connection lost");
            }
          },
          onError: (_, __) => NetworkBad(error: "Stream error"),
        );
      } catch (e) {
        emit(NetworkBad(error: e.toString()));
      }
    });
  }
}