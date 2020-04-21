/// generated automatically from flutter_deriv_api|lib/basic_api/generated/get_settings_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'get_settings_send.g.dart';

/// JSON conversion for 'get_settings_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetSettingsRequest extends Request {
  /// Initialize GetSettingsRequest
  const GetSettingsRequest({
    this.getSettings = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetSettingsRequest(
        getSettings: getSettings ?? this.getSettings,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
