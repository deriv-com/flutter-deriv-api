/// generated automatically from flutter_deriv_api|lib/api/balance_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'balance_receive.g.dart';

/// JSON conversion for 'balance_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BalanceResponse extends Response {
  /// Initialize BalanceResponse
  BalanceResponse({
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
}
