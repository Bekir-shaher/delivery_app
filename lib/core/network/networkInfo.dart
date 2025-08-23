import 'package:connectivity_plus/connectivity_plus.dart';

abstract class Networkinfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements Networkinfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final resuilt = await connectivity.checkConnectivity();
    return resuilt != ConnectivityResult.none;//إذا كانت النتيجة ليست ConnectivityResult.none (أي يوجد اتصال)، يرجع true.

  }
}
