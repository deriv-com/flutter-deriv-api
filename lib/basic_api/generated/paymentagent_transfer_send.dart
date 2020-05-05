/// generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_transfer_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'paymentagent_transfer_send.g.dart';

/// JSON conversion for 'paymentagent_transfer_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentTransferRequest extends Request {
  /// Initialize PaymentagentTransferRequest
  const PaymentagentTransferRequest({
    this.amount,
    this.currency,
    this.description,
    this.dryRun,
    this.paymentagentTransfer = 1,
    this.transferTo,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory PaymentagentTransferRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentTransferRequestFromJson(json);

  // Properties
  /// The amount to transfer.
  final num amount;

  /// Currency code.
  final String currency;

  /// [Optional] Remarks about the transfer.
  final String description;

  /// [Optional] If set to `1`, just do validation.
  final int dryRun;

  /// Must be `1`
  final int paymentagentTransfer;

  /// The loginid of the recipient account.
  final String transferTo;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$PaymentagentTransferRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentTransferRequest copyWith({
    num amount,
    String currency,
    String description,
    int dryRun,
    int paymentagentTransfer,
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
