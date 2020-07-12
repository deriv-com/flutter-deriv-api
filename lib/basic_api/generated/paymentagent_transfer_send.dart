/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_transfer_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// PaymentagentTransferRequest class
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
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as
        currency: json['currency'] as String,
        // ignore: avoid_as
        description: json['description'] as String,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        paymentagentTransfer: json['paymentagent_transfer'] == null
            ? null
            : json['paymentagent_transfer'] == 1,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        transferTo: json['transfer_to'] as String,
      );

  /// The amount to transfer.
  final num amount;

  /// Currency code.
  final String currency;

  /// [Optional] Remarks about the transfer.
  final String description;

  /// [Optional] If set to `1`, just do validation.
  final bool dryRun;

  /// Must be `true`
  final bool paymentagentTransfer;

  /// The loginid of the recipient account.
  final String transferTo;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'currency': currency,
        'description': description,
        'dry_run': dryRun == null ? null : dryRun ? 1 : 0,
        'passthrough': passthrough,
        'paymentagent_transfer':
            paymentagentTransfer == null ? null : paymentagentTransfer ? 1 : 0,
        'req_id': reqId,
        'transfer_to': transferTo,
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
