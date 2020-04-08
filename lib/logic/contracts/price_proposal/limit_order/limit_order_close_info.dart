/// Contains information where the contract will be closed automatically
/// at the loss specified by the user.
class LimitOrderCloseInfo {
  /// Initializes
  LimitOrderCloseInfo(
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  );

  /// From Json
  factory LimitOrderCloseInfo.fromJson(Map<String, dynamic> json) =>
      LimitOrderCloseInfo(
        json['display_name'],
        json['order_amount'],
        json['order_date'],
        json['value'],
      );

  /// Localized display name
  final String displayName;

  /// amount
  final double orderAmount;

  /// order epoch
  final int orderDate;

  /// Pip-sized barrier value
  final String value;

  /// Clone a new instance
  LimitOrderCloseInfo copyWith({
    String displayName,
    double orderAmount,
    int orderDate,
    String value,
  }) =>
      LimitOrderCloseInfo(
        displayName ?? this.displayName,
        orderAmount ?? this.orderAmount,
        orderDate ?? this.orderDate,
        value ?? this.value,
      );
}
