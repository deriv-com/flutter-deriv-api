/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_delete_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// App delete request class.
class AppDeleteRequest extends Request {
  /// Initialize AppDeleteRequest.
  const AppDeleteRequest({
    required this.appDelete,
    this.loginid,
    super.msgType = 'app_delete',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AppDeleteRequest.fromJson(Map<String, dynamic> json) =>
      AppDeleteRequest(
        appDelete: json['app_delete'] as int?,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Application app_id
  final int? appDelete;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_delete': appDelete,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppDeleteRequest copyWith({
    int? appDelete,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AppDeleteRequest(
        appDelete: appDelete ?? this.appDelete,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
