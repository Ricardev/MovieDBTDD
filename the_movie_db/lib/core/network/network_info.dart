import 'package:connectivity/connectivity.dart';

abstract class INetworkInfo {
  Future<ConnectivityResult> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity connectivity;
  NetworkInfo({required this.connectivity});
  @override
  // TODO: implement isConnected
  Future<ConnectivityResult> get isConnected =>
      connectivity.checkConnectivity();
}
