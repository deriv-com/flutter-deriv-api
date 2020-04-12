/// generated automatically from flutter_deriv_api|lib/api/app_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'app_list_send.g.dart';

/// JSON conversion for 'app_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppListRequest extends Request {
  /// Initialize AppListRequest
  AppListRequest({
    this.appList = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory AppListRequest.fromJson(Map<String, dynamic> json) =>
      _$AppListRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int appList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppListRequest copyWith({
    int appList,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      AppListRequest(
        appList: appList ?? this.appList,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
