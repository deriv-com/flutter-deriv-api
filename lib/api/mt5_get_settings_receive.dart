/// generated automatically from flutter_deriv_api|lib/api/mt5_get_settings_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_get_settings_receive.g.dart';

/// JSON conversion for 'mt5_get_settings_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5GetSettingsResponse extends Response {
  /// Initialize Mt5GetSettingsResponse
  const Mt5GetSettingsResponse({
    this.mt5GetSettings,
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
  factory Mt5GetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5GetSettingsResponseFromJson(json);

  // Properties
  /// MT5 user account details
  final Map<String, dynamic> mt5GetSettings;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5GetSettingsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5GetSettingsResponse copyWith({
    Map<String, dynamic> mt5GetSettings,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
