/// generated automatically from flutter_deriv_api|lib/api/mt5_get_settings_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'mt5_get_settings_send.g.dart';

/// JSON conversion for 'mt5_get_settings_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5GetSettingsRequest extends Request {
  /// Initialize Mt5GetSettingsRequest
  const Mt5GetSettingsRequest({
    this.login,
    this.mt5GetSettings = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory Mt5GetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5GetSettingsRequestFromJson(json);

  // Properties
  /// MT5 user login
  final String login;

  /// Must be `1`
  final int mt5GetSettings;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5GetSettingsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5GetSettingsRequest copyWith({
    String login,
    int mt5GetSettings,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5GetSettingsRequest(
        login: login ?? this.login,
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
