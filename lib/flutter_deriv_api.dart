import 'package:flutter/services.dart';

/// The main class of FlutterDerivApi.
class FlutterDerivApi {
  static const MethodChannel _channel = MethodChannel('flutter_deriv_api');

  /// The version of current platform
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
