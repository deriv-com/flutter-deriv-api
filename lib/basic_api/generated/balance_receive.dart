/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/balance_receive.json

import '../response.dart';

/// BalanceResponse class
class BalanceResponse extends Response {
  /// Initialize BalanceResponse
  const BalanceResponse({
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
  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      BalanceResponse(
        // ignore: avoid_as
        balance: json['balance'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscription: json['subscription'] as Map<String, dynamic>,
      );

  /// Current balance of one or more accounts.
  final Map<String, dynamic> balance;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'balance': balance,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'subscription': subscription,
      };

  /// Creates a copy of instance with given parameters
  @override
  BalanceResponse copyWith({
    Map<String, dynamic> balance,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      BalanceResponse(
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
