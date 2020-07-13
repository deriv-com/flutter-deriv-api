/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_settings_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// Get settings request class
class GetSettingsRequest extends Request {
  /// Initialize GetSettingsRequest
  const GetSettingsRequest({
    this.getSettings = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_settings',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      GetSettingsRequest(
        getSettings:
            json['get_settings'] == null ? null : json['get_settings'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool getSettings;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_settings': getSettings == null ? null : getSettings ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSettingsRequest copyWith({
    bool getSettings,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetSettingsRequest(
        getSettings: getSettings ?? this.getSettings,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
