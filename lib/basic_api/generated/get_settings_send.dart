/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_settings_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get settings request class.
class GetSettingsRequest extends Request {
  /// Initialize GetSettingsRequest.
  const GetSettingsRequest({
    this.getSettings = true,
    this.loginid,
    super.msgType = 'get_settings',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory GetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      GetSettingsRequest(
        getSettings:
            json['get_settings'] == null ? null : json['get_settings'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? getSettings;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_settings': getSettings == null
            ? null
            : getSettings!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSettingsRequest copyWith({
    bool? getSettings,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetSettingsRequest(
        getSettings: getSettings ?? this.getSettings,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
