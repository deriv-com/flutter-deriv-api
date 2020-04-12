/// generated automatically from flutter_deriv_api|lib/api/app_delete_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'app_delete_send.g.dart';

/// JSON conversion for 'app_delete_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppDeleteRequest extends Request {
  /// Initialize AppDeleteRequest
  AppDeleteRequest({
    this.appDelete = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory AppDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$AppDeleteRequestFromJson(json);

  // Properties
  /// Application app_id
  final int appDelete;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppDeleteRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppDeleteRequest copyWith({
    int appDelete,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      AppDeleteRequest(
        appDelete: appDelete ?? this.appDelete,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
