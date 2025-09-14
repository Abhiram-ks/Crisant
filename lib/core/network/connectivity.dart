import 'package:connectivity_plus/connectivity_plus.dart';

class NetWorkChecker {
  Future<bool> isConnected() async {
    try {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
       return false;
      }
      return true;
    } catch (_) {
      return false;
    }
  }
  
  Stream<bool> get connectionStream async* {
    await for (var result in  Connectivity().onConnectivityChanged) {
      yield !result.contains(ConnectivityResult.none);
    }
  }
}