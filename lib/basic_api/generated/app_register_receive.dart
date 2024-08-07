/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_register_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// App register receive class.
class AppRegisterReceive extends Response {
  /// Initialize AppRegisterReceive.
  const AppRegisterReceive({
    this.appRegister,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AppRegisterReceive.fromJson(Map<String, dynamic> json) =>
      AppRegisterReceive(
        appRegister: json['app_register'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information of the created application.
  final Map<String, dynamic>? appRegister;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_register': appRegister,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppRegisterReceive copyWith({
    Map<String, dynamic>? appRegister,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AppRegisterReceive(
        appRegister: appRegister ?? this.appRegister,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
