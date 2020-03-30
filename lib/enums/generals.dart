enum AdvertType {
  buy,
  sell,
}

enum OrderType {
  buy,
  sell,
}

enum OrderStatusType {
  pending,
  buyerConfirmed,
  cancelled,
  timedOut,
  timedOutBuyerConfirmed,
  completed,
}

enum CurrencyType {
  fiat,
  crypto,
}

enum SiteStatus {
  up,
  down,
}

enum OrderActions {
  confirmPayment,
  release,
  none,
}

enum PaymentMethod {
  bankTransfer,
}
