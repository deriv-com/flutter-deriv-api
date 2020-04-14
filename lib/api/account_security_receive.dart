/// generated automatically from flutter_deriv_api|lib/api/account_security_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'account_security_receive.g.dart';

/// JSON conversion for 'account_security_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AccountSecurityResponse extends Response {
  /// Initialize AccountSecurityResponse
  const AccountSecurityResponse({
    this.accountSecurity,
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
  factory AccountSecurityResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountSecurityResponseFromJson(json);

  // Properties
  /// The information of 2-Factor authentication.
  final Map<String, dynamic> accountSecurity;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AccountSecurityResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AccountSecurityResponse copyWith({
    Map<String, dynamic> accountSecurity,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AccountSecurityResponse(
        accountSecurity: accountSecurity ?? this.accountSecurity,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
