/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_settings_send.json

import '../request.dart';

/// GetSettingsRequest class
class GetSettingsRequest extends Request {
  /// Initialize GetSettingsRequest
  const GetSettingsRequest({
    this.getSettings = 1,
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
        // ignore: avoid_as
        getSettings: json['get_settings'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int getSettings;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_settings': getSettings,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSettingsRequest copyWith({
    int getSettings,
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
