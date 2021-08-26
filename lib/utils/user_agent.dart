import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

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
