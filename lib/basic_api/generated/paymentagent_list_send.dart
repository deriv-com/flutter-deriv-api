/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Paymentagent list request class.
class PaymentagentListRequest extends Request {
  /// Initialize PaymentagentListRequest.
  const PaymentagentListRequest({
    this.currency,
    this.loginid,
    required this.paymentagentList,
    super.msgType = 'paymentagent_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentagentListRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentListRequest(
        currency: json['currency'] as String?,
        loginid: json['loginid'] as String?,
        paymentagentList: json['paymentagent_list'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] If specified, only payment agents that supports that currency will be returned (obtained from `payout_currencies` call).
  final String? currency;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String? paymentagentList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'currency': currency,
        'loginid': loginid,
        'paymentagent_list': paymentagentList,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentListRequest copyWith({
    String? currency,
    String? loginid,
    String? paymentagentList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentagentListRequest(
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        paymentagentList: paymentagentList ?? this.paymentagentList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
