/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_get_settings_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Mt5 get settings send class.
class Mt5GetSettingsSend extends Request {
  /// Initialize Mt5GetSettingsSend.
  const Mt5GetSettingsSend({
    required this.login,
    this.mt5GetSettings = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'mt5_get_settings',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory Mt5GetSettingsSend.fromJson(Map<String, dynamic> json) =>
      Mt5GetSettingsSend(
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
  Mt5GetSettingsSend copyWith({
    String? login,
    bool? mt5GetSettings,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5GetSettingsSend(
        login: login ?? this.login,
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
