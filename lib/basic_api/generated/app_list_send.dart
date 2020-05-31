/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_list_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'app_list_send.g.dart';

/// JSON conversion for 'app_list_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class AppListRequest extends Request {
  /// Initialize AppListRequest
  const AppListRequest({
    this.appList = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'app_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppListRequest.fromJson(Map<String, dynamic> json) =>
      _$AppListRequestFromJson(json);

  /// Must be `1`
  final int appList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$AppListRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AppListRequest copyWith({
    int appList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AppListRequest(
        appList: appList ?? this.appList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
