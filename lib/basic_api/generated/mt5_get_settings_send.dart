/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_get_settings_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// Mt5GetSettingsRequest class
class Mt5GetSettingsRequest extends Request {
  /// Initialize Mt5GetSettingsRequest
  const Mt5GetSettingsRequest({
    @required this.login,
    this.mt5GetSettings = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'mt5_get_settings',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5GetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      Mt5GetSettingsRequest(
        // ignore: avoid_as
        login: json['login'] as String,
        // ignore: avoid_as
        mt5GetSettings: json['mt5_get_settings'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// MT5 user login
  final String login;

  /// Must be `1`
  final int mt5GetSettings;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'mt5_get_settings': mt5GetSettings,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5GetSettingsRequest copyWith({
    String login,
    int mt5GetSettings,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5GetSettingsRequest(
        login: login ?? this.login,
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
