/// generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_new_account_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'mt5_new_account_receive.g.dart';

/// JSON conversion for 'mt5_new_account_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5NewAccountResponse extends Response {
  /// Initialize Mt5NewAccountResponse
  const Mt5NewAccountResponse({
    this.mt5NewAccount,
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

  /// Creates an instance from json
  factory Mt5NewAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5NewAccountResponseFromJson(json);

  // Properties
  /// New MT5 account details
  final Map<String, dynamic> mt5NewAccount;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$Mt5NewAccountResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5NewAccountResponse copyWith({
    Map<String, dynamic> mt5NewAccount,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5NewAccountResponse(
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
