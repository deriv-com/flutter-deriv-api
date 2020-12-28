/// Tnc approval send model class
abstract class TncApprovalSendModel {
  /// Initializes
  TncApprovalSendModel({
    @required this.tncApproval,
    this.ukgcFundsProtection,
  });

  /// Must be `1`
  final double tncApproval;

  /// [Optional] For `ASK_UK_FUNDS_PROTECTION` in `cashier`.
  final int ukgcFundsProtection;
}

/// Tnc approval send class
class TncApprovalSend extends TncApprovalSendModel {
  /// Initializes
  TncApprovalSend({
    @required double tncApproval,
    int ukgcFundsProtection,
  }) : super(
          tncApproval: tncApproval,
          ukgcFundsProtection: ukgcFundsProtection,
        );

  /// Creates an instance from JSON
  factory TncApprovalSend.fromJson(Map<String, dynamic> json) =>
      TncApprovalSend(
        tncApproval: getDouble(json['tnc_approval']),
        ukgcFundsProtection: json['ukgc_funds_protection'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['tnc_approval'] = tncApproval;
    result['ukgc_funds_protection'] = ukgcFundsProtection;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TncApprovalSend copyWith({
    double tncApproval,
    int ukgcFundsProtection,
  }) =>
      TncApprovalSend(
        tncApproval: tncApproval ?? this.tncApproval,
        ukgcFundsProtection: ukgcFundsProtection ?? this.ukgcFundsProtection,
      );
}
