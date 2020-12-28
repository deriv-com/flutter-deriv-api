/// Tnc approval receive model class
abstract class TncApprovalReceiveModel {
  /// Initializes
  TncApprovalReceiveModel({
    @required this.tncApproval,
  });

  /// Set terms and conditions 1: success
  final int tncApproval;
}

/// Tnc approval receive class
class TncApprovalReceive extends TncApprovalReceiveModel {
  /// Initializes
  TncApprovalReceive({
    @required int tncApproval,
  }) : super(
          tncApproval: tncApproval,
        );

  /// Creates an instance from JSON
  factory TncApprovalReceive.fromJson(Map<String, dynamic> json) =>
      TncApprovalReceive(
        tncApproval: json['tnc_approval'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['tnc_approval'] = tncApproval;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TncApprovalReceive copyWith({
    int tncApproval,
  }) =>
      TncApprovalReceive(
        tncApproval: tncApproval ?? this.tncApproval,
      );
}
