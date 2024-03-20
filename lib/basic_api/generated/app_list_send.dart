/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// App list request class.
class AppListRequest extends Request {
  /// Initialize AppListRequest.
  const AppListRequest({
    this.appList = true,
    this.loginid,
    super.msgType = 'app_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AppListRequest.fromJson(Map<String, dynamic> json) => AppListRequest(
        appList: json['app_list'] == null ? null : json['app_list'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? appList;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_list': appList == null
            ? null
            : appList!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppListRequest copyWith({
    bool? appList,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AppListRequest(
        appList: appList ?? this.appList,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
