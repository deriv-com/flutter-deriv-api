/// generated automatically from flutter_deriv_api|lib/api/set_settings_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'set_settings_receive.g.dart';

/// JSON conversion for 'set_settings_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetSettingsResponse extends Response {
  /// Initialize SetSettingsResponse
  const SetSettingsResponse({
    this.setSettings,
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
  factory SetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SetSettingsResponseFromJson(json);

  // Properties
  /// 1 on success
  final int setSettings;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SetSettingsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SetSettingsResponse copyWith({
    int setSettings,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      SetSettingsResponse(
        setSettings: setSettings ?? this.setSettings,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
