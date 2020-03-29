/// Advert type
enum AdvertType {
  /// Buy advert type
  buy,

  /// Sell advert type
  sell,
}

/// Payment method
enum PaymentMethod {
  /// Bank transfer payment method
  bankTransfer,
}

/// Order type
enum OrderType {
  /// Buy order type
  buy,

  /// Sell order type
  sell,
}

/// Order status type
enum OrderStatusType {
  /// Pending status order type
  pending,

  /// Buyer Confirmed status order type
  buyerConfirmed,

  /// cancelled status order type
  cancelled,

  /// Timeout status order type
  timedOut,

  /// Timeout buyer confirmed status order type
  timedOutBuyerConfirmed,

  /// Completed status order type
  completed,
}
