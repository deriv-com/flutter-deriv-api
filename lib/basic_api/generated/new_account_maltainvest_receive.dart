/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_maltainvest_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// New account maltainvest receive class.
class NewAccountMaltainvestReceive extends Response {
  /// Initialize NewAccountMaltainvestReceive.
  const NewAccountMaltainvestReceive({
    this.newAccountMaltainvest,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory NewAccountMaltainvestReceive.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvestReceive(
        newAccountMaltainvest:
            json['new_account_maltainvest'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// New `maltainvest` account details
  final Map<String, dynamic>? newAccountMaltainvest;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_account_maltainvest': newAccountMaltainvest,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountMaltainvestReceive copyWith({
    Map<String, dynamic>? newAccountMaltainvest,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      NewAccountMaltainvestReceive(
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
