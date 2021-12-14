import 'package:connectivity/connectivity.dart';

class ConnectivityUtil {
  static Future<bool> hasInternetConnection() async {
    var isConnected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnected = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    }
    return isConnected;
  }
}
