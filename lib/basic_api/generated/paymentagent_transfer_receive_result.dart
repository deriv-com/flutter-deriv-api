/// Paymentagent transfer receive model class
abstract class PaymentagentTransferReceiveModel {
  /// Initializes
  PaymentagentTransferReceiveModel({
    @required this.paymentagentTransfer,
    @required this.clientToFullName,
    @required this.clientToLoginid,
    @required this.transactionId,
  });

  /// If set to `true`, transfer success. If set to `2`, dry-run success.
  final bool paymentagentTransfer;

  /// The `transfer_to` client full name
  final String clientToFullName;

  /// The `transfer_to` client loginid
  final String clientToLoginid;

  /// Reference ID of transfer performed
  final int transactionId;
}

/// Paymentagent transfer receive class
class PaymentagentTransferReceive extends PaymentagentTransferReceiveModel {
  /// Initializes
  PaymentagentTransferReceive({
    @required bool paymentagentTransfer,
    @required String clientToFullName,
    @required String clientToLoginid,
    @required int transactionId,
  }) : super(
          paymentagentTransfer: paymentagentTransfer,
          clientToFullName: clientToFullName,
          clientToLoginid: clientToLoginid,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory PaymentagentTransferReceive.fromJson(Map<String, dynamic> json) =>
      PaymentagentTransferReceive(
        paymentagentTransfer: getBool(json['paymentagent_transfer']),
        clientToFullName: json['client_to_full_name'],
        clientToLoginid: json['client_to_loginid'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['paymentagent_transfer'] = paymentagentTransfer;
    result['client_to_full_name'] = clientToFullName;
    result['client_to_loginid'] = clientToLoginid;
    result['transaction_id'] = transactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PaymentagentTransferReceive copyWith({
    bool paymentagentTransfer,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
  }) =>
      PaymentagentTransferReceive(
        paymentagentTransfer: paymentagentTransfer ?? this.paymentagentTransfer,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        transactionId: transactionId ?? this.transactionId,
      );
}
