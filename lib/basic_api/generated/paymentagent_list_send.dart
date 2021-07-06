/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Paymentagent list send class.
class PaymentagentListSend extends Request {
  /// Initialize PaymentagentListSend.
  const PaymentagentListSend({
    this.currency,
    required this.paymentagentList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'paymentagent_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory PaymentagentListSend.fromJson(Map<String, dynamic> json) =>
      PaymentagentListSend(
        currency: json['currency'] as String?,
        paymentagentList: json['paymentagent_list'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] If specified, only payment agents that supports that currency will be returned (obtained from `payout_currencies` call).
  final String? currency;

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String? paymentagentList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'currency': currency,
        'paymentagent_list': paymentagentList,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentListSend copyWith({
    String? currency,
    String? paymentagentList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentagentListSend(
        currency: currency ?? this.currency,
        paymentagentList: paymentagentList ?? this.paymentagentList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
