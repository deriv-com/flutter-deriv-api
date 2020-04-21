/// generated automatically from flutter_deriv_api|lib/basic_api/generated/set_settings_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'set_settings_receive.g.dart';

/// JSON conversion for 'set_settings_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetSettingsResponse extends Response {
  /// Initialize SetSettingsResponse
  const SetSettingsResponse({
    this.setSettings,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SetSettingsResponse(
        setSettings: setSettings ?? this.setSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
