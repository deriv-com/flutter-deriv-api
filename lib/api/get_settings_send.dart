/// generated automatically from flutter_deriv_api|lib/api/get_settings_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'get_settings_send.g.dart';

/// JSON conversion for 'get_settings_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetSettingsRequest extends Request {
  /// Initialize GetSettingsRequest
  const GetSettingsRequest({
    this.getSettings = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory GetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSettingsRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int getSettings;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetSettingsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetSettingsRequest copyWith({
    int getSettings,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      GetSettingsRequest(
        getSettings: getSettings ?? this.getSettings,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
