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
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
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
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      Mt5GetSettingsRequest(
        login: login ?? this.login,
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
