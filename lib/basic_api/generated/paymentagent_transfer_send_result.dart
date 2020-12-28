/// Paymentagent transfer send model class
abstract class PaymentagentTransferSendModel {
  /// Initializes
  PaymentagentTransferSendModel({
    @required this.paymentagentTransfer,
    @required this.amount,
    @required this.currency,
    this.description,
    this.dryRun,
    @required this.transferTo,
  });

  /// Must be `1`
  final int paymentagentTransfer;

  /// The amount to transfer.
  final double amount;

  /// Currency code.
  final String currency;

  /// [Optional] Remarks about the transfer.
  final String description;

  /// [Optional] If set to `true`, just do validation.
  final bool dryRun;

  /// The loginid of the recipient account.
  final String transferTo;
}

/// Paymentagent transfer send class
class PaymentagentTransferSend extends PaymentagentTransferSendModel {
  /// Initializes
  PaymentagentTransferSend({
    @required int paymentagentTransfer,
    @required double amount,
    @required String currency,
    String description,
    bool dryRun,
    @required String transferTo,
  }) : super(
          paymentagentTransfer: paymentagentTransfer,
          amount: amount,
          currency: currency,
          description: description,
          dryRun: dryRun,
          transferTo: transferTo,
        );

  /// Creates an instance from JSON
  factory PaymentagentTransferSend.fromJson(Map<String, dynamic> json) =>
      PaymentagentTransferSend(
        paymentagentTransfer: json['paymentagent_transfer'],
        amount: getDouble(json['amount']),
        currency: json['currency'],
        description: json['description'],
        dryRun: getBool(json['dry_run']),
        transferTo: json['transfer_to'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['paymentagent_transfer'] = paymentagentTransfer;
    result['amount'] = amount;
    result['currency'] = currency;
    result['description'] = description;
    result['dry_run'] = dryRun;
    result['transfer_to'] = transferTo;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PaymentagentTransferSend copyWith({
    int paymentagentTransfer,
    double amount,
    String currency,
    String description,
    bool dryRun,
    String transferTo,
  }) =>
      PaymentagentTransferSend(
        paymentagentTransfer: paymentagentTransfer ?? this.paymentagentTransfer,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        dryRun: dryRun ?? this.dryRun,
        transferTo: transferTo ?? this.transferTo,
      );
}
