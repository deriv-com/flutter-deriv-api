/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_transfer_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// Paymentagent transfer request class
class PaymentagentTransferRequest extends Request {
  /// Initialize PaymentagentTransferRequest
  const PaymentagentTransferRequest({
    @required this.amount,
    @required this.currency,
    this.description,
    this.dryRun,
    this.paymentagentTransfer = true,
    @required this.transferTo,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'paymentagent_transfer',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PaymentagentTransferRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentTransferRequest(
        amount: json['amount'] as num,
        currency: json['currency'] as String,
        description: json['description'] as String,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        paymentagentTransfer: json['paymentagent_transfer'] == null
            ? null
            : json['paymentagent_transfer'] == 1,
        transferTo: json['transfer_to'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// The amount to transfer.
  final num amount;

  /// Currency code.
  final String currency;

  /// [Optional] Remarks about the transfer.
  final String description;

  /// [Optional] If set to `true`, just do validation.
  final bool dryRun;

  /// Must be `true`
  final bool paymentagentTransfer;

  /// The loginid of the recipient account.
  final String transferTo;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'currency': currency,
        'description': description,
        'dry_run': dryRun == null ? null : dryRun ? 1 : 0,
        'paymentagent_transfer':
            paymentagentTransfer == null ? null : paymentagentTransfer ? 1 : 0,
        'transfer_to': transferTo,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentTransferRequest copyWith({
    num amount,
    String currency,
    String description,
    bool dryRun,
    bool paymentagentTransfer,
    String transferTo,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PaymentagentTransferRequest(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        dryRun: dryRun ?? this.dryRun,
        paymentagentTransfer: paymentagentTransfer ?? this.paymentagentTransfer,
        transferTo: transferTo ?? this.transferTo,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
