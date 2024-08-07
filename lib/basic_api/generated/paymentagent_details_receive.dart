/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_details_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Paymentagent details receive class.
class PaymentagentDetailsReceive extends Response {
  /// Initialize PaymentagentDetailsReceive.
  const PaymentagentDetailsReceive({
    this.paymentagentDetails,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentagentDetailsReceive.fromJson(Map<String, dynamic> json) =>
      PaymentagentDetailsReceive(
        paymentagentDetails:
            json['paymentagent_details'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The payment agent details.
  final Map<String, dynamic>? paymentagentDetails;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'paymentagent_details': paymentagentDetails,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentDetailsReceive copyWith({
    Map<String, dynamic>? paymentagentDetails,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PaymentagentDetailsReceive(
        paymentagentDetails: paymentagentDetails ?? this.paymentagentDetails,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
