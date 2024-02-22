/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_get_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// App get request class.
class AppGetRequest extends Request {
  /// Initialize AppGetRequest.
  const AppGetRequest({
    required this.appGet,
    this.loginid,
    super.msgType = 'app_get',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AppGetRequest.fromJson(Map<String, dynamic> json) => AppGetRequest(
        appGet: json['app_get'] as int?,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Application app_id
  final int? appGet;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_get': appGet,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppGetRequest copyWith({
    int? appGet,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AppGetRequest(
        appGet: appGet ?? this.appGet,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
