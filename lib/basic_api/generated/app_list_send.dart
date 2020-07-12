/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_list_send.json

import '../request.dart';

/// AppListRequest class
class AppListRequest extends Request {
  /// Initialize AppListRequest
  const AppListRequest({
    this.appList = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'app_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppListRequest.fromJson(Map<String, dynamic> json) => AppListRequest(
        appList: json['app_list'] == null ? null : json['app_list'] == 1,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool appList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_list': appList == null ? null : appList ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppListRequest copyWith({
    bool appList,
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
