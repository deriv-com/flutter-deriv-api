/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_list_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// PaymentagentListRequest class
class PaymentagentListRequest extends Request {
  /// Initialize PaymentagentListRequest
  const PaymentagentListRequest({
    this.currency,
    @required this.paymentagentList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'paymentagent_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PaymentagentListRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentListRequest(
        // ignore: avoid_as
        currency: json['currency'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        paymentagentList: json['paymentagent_list'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// [Optional] If specified, only payment agents that supports that currency will be returned (obtained from `payout_currencies` call).
  final String currency;

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String paymentagentList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'currency': currency,
        'passthrough': passthrough,
        'paymentagent_list': paymentagentList,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentListRequest copyWith({
    String currency,
    String paymentagentList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PaymentagentListRequest(
        currency: currency ?? this.currency,
        paymentagentList: paymentagentList ?? this.paymentagentList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
