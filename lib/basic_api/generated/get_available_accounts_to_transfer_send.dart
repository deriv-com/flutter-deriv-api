/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_available_accounts_to_transfer_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get available accounts to transfer request class.
class GetAvailableAccountsToTransferRequest extends Request {
  /// Initialize GetAvailableAccountsToTransferRequest.
  const GetAvailableAccountsToTransferRequest({
    this.getAvailableAccountsToTransfer = true,
    required this.loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'get_available_accounts_to_transfer',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory GetAvailableAccountsToTransferRequest.fromJson(
          Map<String, dynamic> json) =>
      GetAvailableAccountsToTransferRequest(
        getAvailableAccountsToTransfer:
            json['get_available_accounts_to_transfer'] == null
                ? null
                : json['get_available_accounts_to_transfer'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? getAvailableAccountsToTransfer;

  /// The unique identifier for this trading/wallet account.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_available_accounts_to_transfer':
            getAvailableAccountsToTransfer == null
                ? null
                : getAvailableAccountsToTransfer!
                    ? 1
                    : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAvailableAccountsToTransferRequest copyWith({
    bool? getAvailableAccountsToTransfer,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetAvailableAccountsToTransferRequest(
        getAvailableAccountsToTransfer: getAvailableAccountsToTransfer ??
            this.getAvailableAccountsToTransfer,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
