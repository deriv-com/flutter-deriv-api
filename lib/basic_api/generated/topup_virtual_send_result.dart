/// Topup virtual send model class
abstract class TopupVirtualSendModel {
  /// Initializes
  TopupVirtualSendModel({
    @required this.topupVirtual,
  });

  /// Must be `1`
  final int topupVirtual;
}

/// Topup virtual send class
class TopupVirtualSend extends TopupVirtualSendModel {
  /// Initializes
  TopupVirtualSend({
    @required int topupVirtual,
  }) : super(
          topupVirtual: topupVirtual,
        );

  /// Creates an instance from JSON
  factory TopupVirtualSend.fromJson(Map<String, dynamic> json) =>
      TopupVirtualSend(
        topupVirtual: json['topup_virtual'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['topup_virtual'] = topupVirtual;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TopupVirtualSend copyWith({
    int topupVirtual,
  }) =>
      TopupVirtualSend(
        topupVirtual: topupVirtual ?? this.topupVirtual,
      );
}
