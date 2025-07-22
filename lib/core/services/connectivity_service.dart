import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityService {
  static bool isConnected = false;

  static void listenConnectionStatus() async {
    StreamSubscription<List<ConnectivityResult>> subscription = Connectivity().onConnectivityChanged.listen(
          (List<ConnectivityResult> result) async {
        ConnectivityResult connection = result.first;
        if (connection == ConnectivityResult.mobile ||
            connection== ConnectivityResult.wifi ||
            connection == ConnectivityResult.ethernet ||
            connection == ConnectivityResult.vpn) {
          isConnected = await _callMyServer();
        } else {
          isConnected = false;
        }
      },
    );
  }

  static Future<bool> _callMyServer() async {
    return true;
  }
}