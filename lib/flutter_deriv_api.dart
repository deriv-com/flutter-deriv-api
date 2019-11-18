import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_deriv_api/api/api.dart';

class FlutterDerivApi {
  static const MethodChannel _channel = MethodChannel('flutter_deriv_api');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
