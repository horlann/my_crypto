import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class ConnectionChecker {
  ConnectionChecker() {
    _globalConnectionStream = BehaviorSubject<bool>();
    _connectionStream = Connectivity().onConnectivityChanged;
    _initStatus();
  }

  static const Duration defaultTimeout = Duration(seconds: 10);
  static const int defaultPort = 53;
  late BehaviorSubject<bool> _globalConnectionStream;

  Stream<bool> get globalConnectionStream => _globalConnectionStream.stream.distinct((a, b) => a == b);
  late Stream<ConnectivityResult> _connectionStream;
  StreamSubscription<InternetConnectionStatus>? _wifiConnectionStream;

  ConnectivityResult get currentConnectivityState => _currentConnectivityState;
  ConnectivityResult _currentConnectivityState = ConnectivityResult.none;

  bool get isConnected => _isConnected;
  bool _isConnected = false;

  Future<void> _initStatus() async {
    InternetConnectionChecker().addresses = _ourServerAddress;
    InternetConnectionChecker().checkInterval = const Duration(seconds: 10);
    _globalConnectionStream.sink.add(await isConnectedCheck);
    await _connectionStream.transform(_transformer()).pipe(_globalConnectionStream);
  }

  Future<bool> get isConnectedVsHttpCheck async {
    if (await InternetConnectionChecker().hasConnection) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> get isConnectedCheck async {
    final ConnectivityResult status = await Connectivity().checkConnectivity();

    switch (status) {
      case ConnectivityResult.ethernet:
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.none:
        return false;
    }
  }

  StreamTransformer<ConnectivityResult, bool> _transformer() =>
      StreamTransformer<ConnectivityResult, bool>.fromHandlers(handleData: (status, sink) async {
        _currentConnectivityState = status;
        if (status != ConnectivityResult.none) {
          _wifiConnectionStream = InternetConnectionChecker().onStatusChange.listen((event) async {
            switch (event) {
              case InternetConnectionStatus.disconnected:
                _isConnected = false;

                sink.add(false);
                break;
              case InternetConnectionStatus.connected:
                _isConnected = true;
                sink.add(true);
                break;
            }
          });
        } else {
          await _wifiConnectionStream?.cancel();
          sink.add(await isConnectedVsHttpCheck);
        }
      });
  final List<AddressCheckOptions> _ourServerAddress = List<AddressCheckOptions>.unmodifiable([
    AddressCheckOptions(
      InternetAddress(
        '1.1.1.1', // CloudFlare
        type: InternetAddressType.IPv4,
      ),
      port: defaultPort,
      timeout: defaultTimeout,
    ),
    AddressCheckOptions(
      InternetAddress(
        '2606:4700:4700::1111', // CloudFlare
        type: InternetAddressType.IPv6,
      ),
      port: defaultPort,
      timeout: defaultTimeout,
    ),
    AddressCheckOptions(
      InternetAddress(
        '8.8.4.4', // Google
        type: InternetAddressType.IPv4,
      ),
      port: defaultPort,
      timeout: defaultTimeout,
    ),
    AddressCheckOptions(
      InternetAddress(
        '2001:4860:4860::8888', // Google
        type: InternetAddressType.IPv6,
      ),
      port: defaultPort,
      timeout: defaultTimeout,
    ),
    AddressCheckOptions(
      InternetAddress(
        '208.67.222.222', // OpenDNS
        type: InternetAddressType.IPv4,
      ), // OpenDNS
      port: defaultPort,
      timeout: defaultTimeout,
    ),
    AddressCheckOptions(
      InternetAddress(
        '2620:0:ccc::2', // OpenDNS
        type: InternetAddressType.IPv6,
      ), // OpenDNS
      port: defaultPort,
      timeout: defaultTimeout,
    ),
  ]);

  Future<void> dispose() async {
    await _wifiConnectionStream?.cancel();
    await _globalConnectionStream.close();
  }
}
