/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_details_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Paymentagent details request class.
class PaymentagentDetailsRequest extends Request {
  /// Initialize PaymentagentDetailsRequest.
  const PaymentagentDetailsRequest({
    this.loginid,
    this.paymentagentDetails = true,
    super.msgType = 'paymentagent_details',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentagentDetailsRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentDetailsRequest(
        loginid: json['loginid'] as String?,
        paymentagentDetails: json['paymentagent_details'] == null
            ? null
            : json['paymentagent_details'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? paymentagentDetails;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
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
    String? loginid,
    bool? paymentagentDetails,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentagentDetailsRequest(
        loginid: loginid ?? this.loginid,
        paymentagentDetails: paymentagentDetails ?? this.paymentagentDetails,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
