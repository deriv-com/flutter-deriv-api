/// generated automatically from flutter_deriv_api|lib/api/account_closure_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'account_closure_receive.g.dart';

/// JSON conversion for 'account_closure_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AccountClosureResponse extends Response {
  /// Initialize AccountClosureResponse
  const AccountClosureResponse({
    this.accountClosure,
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
  factory AccountClosureResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountClosureResponseFromJson(json);

  // Properties
  /// If set to `1`, all accounts are closed.
  final int accountClosure;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AccountClosureResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AccountClosureResponse copyWith({
    int accountClosure,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AccountClosureResponse(
        accountClosure: accountClosure ?? this.accountClosure,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
