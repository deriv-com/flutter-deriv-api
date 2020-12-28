/// Paymentagent withdraw receive model class
abstract class PaymentagentWithdrawReceiveModel {
  /// Initializes
  PaymentagentWithdrawReceiveModel({
    @required this.paymentagentWithdraw,
    @required this.paymentagentName,
    @required this.transactionId,
  });

  /// If set to `true`, withdrawal success. If set to `2`, dry-run success.
  final bool paymentagentWithdraw;

  /// Payment agent name.
  final String paymentagentName;

  /// Reference ID of withdrawal performed.
  final int transactionId;
}

/// Paymentagent withdraw receive class
class PaymentagentWithdrawReceive extends PaymentagentWithdrawReceiveModel {
  /// Initializes
  PaymentagentWithdrawReceive({
    @required bool paymentagentWithdraw,
    @required String paymentagentName,
    @required int transactionId,
  }) : super(
          paymentagentWithdraw: paymentagentWithdraw,
          paymentagentName: paymentagentName,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory PaymentagentWithdrawReceive.fromJson(Map<String, dynamic> json) =>
      PaymentagentWithdrawReceive(
        paymentagentWithdraw: getBool(json['paymentagent_withdraw']),
        paymentagentName: json['paymentagent_name'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['paymentagent_withdraw'] = paymentagentWithdraw;
    result['paymentagent_name'] = paymentagentName;
    result['transaction_id'] = transactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PaymentagentWithdrawReceive copyWith({
    bool paymentagentWithdraw,
    String paymentagentName,
    int transactionId,
  }) =>
      PaymentagentWithdrawReceive(
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        paymentagentName: paymentagentName ?? this.paymentagentName,
        transactionId: transactionId ?? this.transactionId,
      );
}
