/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/balance_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Balance receive class
class BalanceReceive extends Response {
  /// Initialize BalanceReceive
  const BalanceReceive({
    this.balance,
    this.subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory BalanceReceive.fromJson(Map<String, dynamic> json) => BalanceReceive(
        balance: json['balance'] as Map<String, dynamic>,
        subscription: json['subscription'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Current balance of one or more accounts.
  final Map<String, dynamic> balance;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'balance': balance,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  BalanceReceive copyWith({
    Map<String, dynamic> balance,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      BalanceReceive(
        balance: balance ?? this.balance,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
