/// generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_transfer_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'paymentagent_transfer_receive.g.dart';

/// JSON conversion for 'paymentagent_transfer_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentTransferResponse extends Response {
  /// Initialize PaymentagentTransferResponse
  const PaymentagentTransferResponse({
    this.clientToFullName,
    this.clientToLoginid,
    this.paymentagentTransfer,
    this.transactionId,
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

  /// Creates an instance from JSON
  factory PaymentagentTransferResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentTransferResponseFromJson(json);

  // Properties
  /// The `transfer_to` client full name
  final String clientToFullName;

  /// The `transfer_to` client loginid
  final String clientToLoginid;

  /// If set to `1`, transfer success. If set to `2`, dry-run success.
  final int paymentagentTransfer;

  /// Reference ID of transfer performed
  final int transactionId;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentTransferResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentTransferResponse copyWith({
    String clientToFullName,
    String clientToLoginid,
    int paymentagentTransfer,
    int transactionId,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PaymentagentTransferResponse(
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        paymentagentTransfer: paymentagentTransfer ?? this.paymentagentTransfer,
        transactionId: transactionId ?? this.transactionId,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
