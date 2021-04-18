/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_get_settings_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// Mt5 get settings request class
class Mt5GetSettingsRequest extends Request {
  /// Initialize Mt5GetSettingsRequest
  const Mt5GetSettingsRequest({
    @required this.login,
    this.mt5GetSettings = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'mt5_get_settings',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5GetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      Mt5GetSettingsRequest(
        login: json['login'] as String?,
        mt5GetSettings: json['mt5_get_settings'] == null
            ? null
            : json['mt5_get_settings'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// MT5 user login
  final String? login;

  /// Must be `true`
  final bool? mt5GetSettings;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'mt5_get_settings': mt5GetSettings == null
            ? null
            : mt5GetSettings!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5GetSettingsRequest copyWith({
    String? login,
    bool? mt5GetSettings,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5GetSettingsRequest(
        login: login ?? this.login,
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
