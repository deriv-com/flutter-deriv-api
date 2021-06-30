/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transaction_receive.json

import '../response.dart';

/// Transaction response class
class TransactionResponse extends Response {
  /// Initialize TransactionResponse
  const TransactionResponse({
    this.subscription,
    this.transaction,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        subscription: json['subscription'] as Map<String, dynamic>?,
        transaction: json['transaction'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Realtime stream of user transaction updates.
  final Map<String, dynamic>? transaction;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscription': subscription,
        'transaction': transaction,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TransactionResponse copyWith({
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? transaction,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TransactionResponse(
        subscription: subscription ?? this.subscription,
        transaction: transaction ?? this.transaction,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
