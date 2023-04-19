import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';

import 'package:package_info_plus/package_info_plus.dart';

/// Parses the [url] and gets the endpoint out of it
String? parseWebSocketUrl(String? url, {bool isAuthUrl = false}) {
  if (url == null) {
    return null;
  }

  String result = url;
  final RegExp qaRegx = RegExp('^(qa[0-9]{2})\$', caseSensitive: false);
  final RegExp derivRegx =
      RegExp('((binary|deriv)ws\.(com|app))\$', caseSensitive: false);

  if (qaRegx.hasMatch(result)) {
    result = 'www.binary$result.com';
  }

  if (isAuthUrl && derivRegx.hasMatch(result)) {
    result = derivRegx.stringMatch(result)!;
  }

  return result;
}

/// Checks for existence of error in [response] and throws exception created by [exceptionCreator]
void checkException({
  Response? response,
  APIBaseException Function({BaseExceptionModel? baseExceptionModel})?
      exceptionCreator,
}) {
  if (response?.error != null) {
    throw exceptionCreator!(
      baseExceptionModel: BaseExceptionModel(
        code: response?.error!['code'],
        message: response?.error!['message'],
        details: response?.error!['details'],
      ),
    );
  }
}

/// Generates device specific user agent.
Future<String> getUserAgent() async {
  String userAgent = '';

  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    userAgent =
        'Mozilla/5.0 (Linux; U; Android ${androidInfo.version.release}; ${androidInfo.model} '
        'Build/${androidInfo.id}) '
        '${packageInfo.appName}/${packageInfo.version}+${packageInfo.buildNumber}';
  } else if (Platform.isIOS) {
    final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    userAgent = 'Mozilla/5.0 (${iosInfo.utsname.machine} '
        '${iosInfo.systemName}/${iosInfo.systemVersion} '
        'Darwin/${iosInfo.utsname.release}) '
        '${packageInfo.appName}/${packageInfo.version}+${packageInfo.buildNumber}';
  }

  return userAgent;
}
