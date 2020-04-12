/// generated automatically from flutter_deriv_api|lib/api/mt5_new_account_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_new_account_receive.g.dart';

/// JSON conversion for 'mt5_new_account_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5NewAccountResponse extends Response {
  /// Initialize Mt5NewAccountResponse
  const Mt5NewAccountResponse({
    this.mt5NewAccount,
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
  factory Mt5NewAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5NewAccountResponseFromJson(json);

  // Properties
  /// New MT5 account details
  final Map<String, dynamic> mt5NewAccount;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5NewAccountResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5NewAccountResponse copyWith({
    Map<String, dynamic> mt5NewAccount,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Mt5NewAccountResponse(
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
