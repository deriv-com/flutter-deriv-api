/// generated automatically from flutter_deriv_api|lib/api/get_settings_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'get_settings_receive.g.dart';

/// JSON conversion for 'get_settings_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetSettingsResponse extends Response {
  /// Initialize GetSettingsResponse
  const GetSettingsResponse({
    this.getSettings,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory GetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSettingsResponseFromJson(json);

  // Properties
  /// User information and settings.
  final Map<String, dynamic> getSettings;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetSettingsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetSettingsResponse copyWith({
    Map<String, dynamic> getSettings,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      GetSettingsResponse(
        getSettings: getSettings ?? this.getSettings,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
