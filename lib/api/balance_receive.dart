/// generated automatically from flutter_deriv_api|lib/api/balance_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'balance_receive.g.dart';

/// JSON conversion for 'balance_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BalanceResponse extends Response {
  /// Initialize BalanceResponse
  const BalanceResponse({
    this.balance,
    this.subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);

  // Properties
  /// Realtime stream of user balance changes.
  final Map<String, dynamic> balance;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  BalanceResponse copyWith({
    Map<String, dynamic> balance,
    Map<String, dynamic> subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      BalanceResponse(
        balance: balance ?? this.balance,
        subscription: subscription ?? this.subscription,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
