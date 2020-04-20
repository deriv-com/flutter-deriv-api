/// generated automatically from flutter_deriv_api|lib/basic_api/generated/get_settings_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'get_settings_receive.g.dart';

/// JSON conversion for 'get_settings_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetSettingsResponse extends Response {
  /// Initialize GetSettingsResponse
  const GetSettingsResponse({
    this.getSettings,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetSettingsResponse(
        getSettings: getSettings ?? this.getSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
