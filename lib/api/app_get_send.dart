/// generated automatically from flutter_deriv_api|lib/api/app_get_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'app_get_send.g.dart';

/// JSON conversion for 'app_get_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppGetRequest extends Request {
  /// Initialize AppGetRequest
  const AppGetRequest({
    this.appGet = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory AppGetRequest.fromJson(Map<String, dynamic> json) =>
      _$AppGetRequestFromJson(json);

  // Properties
  /// Application app_id
  final int appGet;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppGetRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppGetRequest copyWith({
    int appGet,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      AppGetRequest(
        appGet: appGet ?? this.appGet,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
