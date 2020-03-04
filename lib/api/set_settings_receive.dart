/// Autogenerated from flutter_deriv_api|lib/api/set_settings_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'set_settings_receive.g.dart';

///
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetSettingsResponse extends Response {
  ///
  SetSettingsResponse(
      {this.setSettings,
      int reqId,
      Map<String, dynamic> echoReq,
      String msgType,
      Map<String, dynamic> error})
      : super(reqId: reqId, echoReq: echoReq, msgType: msgType, error: error);

  /// Instance from JSON
  factory SetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SetSettingsResponseFromJson(json);

  /// Instance to JSON
  @override
  Map<String, dynamic> toJson() => _$SetSettingsResponseToJson(this);

  // Properties
  /// 1 on success
  int setSettings;
}
