/// generated automatically from flutter_deriv_api|lib/basic_api/generated/app_delete_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'app_delete_send.g.dart';

/// JSON conversion for 'app_delete_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppDeleteRequest extends Request {
  /// Initialize AppDeleteRequest
  const AppDeleteRequest({
    this.appDelete = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory AppDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$AppDeleteRequestFromJson(json);

  // Properties
  /// Application app_id
  final int appDelete;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$AppDeleteRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AppDeleteRequest copyWith({
    int appDelete,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AppDeleteRequest(
        appDelete: appDelete ?? this.appDelete,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
