/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/available_accounts_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Available accounts receive class.
class AvailableAccountsReceive extends Response {
  /// Initialize AvailableAccountsReceive.
  const AvailableAccountsReceive({
    this.availableAccounts,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AvailableAccountsReceive.fromJson(Map<String, dynamic> json) =>
      AvailableAccountsReceive(
        availableAccounts: json['available_accounts'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Returns list of accounts that are available to be created - limited to wallets and can be extended
  final Map<String, dynamic>? availableAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'available_accounts': availableAccounts,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AvailableAccountsReceive copyWith({
    Map<String, dynamic>? availableAccounts,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AvailableAccountsReceive(
        availableAccounts: availableAccounts ?? this.availableAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
