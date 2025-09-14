part of 'connectivity_bloc.dart';

@immutable
abstract class NetworkEvent {}

class WatchConnection extends NetworkEvent {}

final class CheckConnectivity extends NetworkEvent {}
