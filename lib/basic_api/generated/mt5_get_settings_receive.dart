/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_get_settings_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'mt5_get_settings_receive.g.dart';

/// JSON conversion for 'mt5_get_settings_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5GetSettingsResponse extends Response {
  /// Initialize Mt5GetSettingsResponse
  const Mt5GetSettingsResponse({
    this.mt5GetSettings,
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

  /// Creates an instance from JSON
  factory Mt5GetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5GetSettingsResponseFromJson(json);

  /// MT5 user account details
  final Map<String, dynamic> mt5GetSettings;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5GetSettingsResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5GetSettingsResponse copyWith({
    Map<String, dynamic> mt5GetSettings,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
