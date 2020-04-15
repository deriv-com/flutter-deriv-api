/// generated automatically from flutter_deriv_api|lib/api/account_closure_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'account_closure_send.g.dart';

/// JSON conversion for 'account_closure_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AccountClosureRequest extends Request {
  /// Initialize AccountClosureRequest
  const AccountClosureRequest({
    this.accountClosure = 1,
    this.reason,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory AccountClosureRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountClosureRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int accountClosure;

  /// Reason for closing off accounts.
  final String reason;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AccountClosureRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AccountClosureRequest copyWith({
    int accountClosure,
    String reason,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AccountClosureRequest(
        accountClosure: accountClosure ?? this.accountClosure,
        reason: reason ?? this.reason,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
