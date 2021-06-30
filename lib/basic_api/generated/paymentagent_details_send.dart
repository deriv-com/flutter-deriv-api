/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_details_send.json

import '../request.dart';

/// Paymentagent details request class
class PaymentagentDetailsRequest extends Request {
  /// Initialize PaymentagentDetailsRequest
  const PaymentagentDetailsRequest({
    this.paymentagentDetails = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'paymentagent_details',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PaymentagentDetailsRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentDetailsRequest(
        paymentagentDetails: json['paymentagent_details'] == null
            ? null
            : json['paymentagent_details'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? paymentagentDetails;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'paymentagent_details': paymentagentDetails == null
            ? null
            : paymentagentDetails!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentDetailsRequest copyWith({
    bool? paymentagentDetails,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentagentDetailsRequest(
        paymentagentDetails: paymentagentDetails ?? this.paymentagentDetails,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
