/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_get_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'app_get_send.g.dart';

/// JSON conversion for 'app_get_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class AppGetRequest extends Request {
  /// Initialize AppGetRequest
  const AppGetRequest({
    this.appGet = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'app_get',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppGetRequest.fromJson(Map<String, dynamic> json) =>
      _$AppGetRequestFromJson(json);

  /// Application app_id
  final int appGet;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$AppGetRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AppGetRequest copyWith({
    int appGet,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AppGetRequest(
        appGet: appGet ?? this.appGet,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
