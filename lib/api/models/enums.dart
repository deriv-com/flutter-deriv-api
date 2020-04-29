// MT5 enums
/// Account type
enum AccountType {
  /// Demo
  demo,

  /// Gaming
  gaming,

  /// Financial
  financial,
}

/// Sub account type, present only when account type is either `demo` or `financial`.
enum MT5AccountType {
  /// Standard
  standard,

  /// advanced
  advanced,
}

// Api token
/// Api token scopes
enum TokenScope {
  /// Read Access
  read,

  /// Trade Access
  trade,

  /// Trading Information Access
  tradingInformation,

  /// Payments Access
  payments,

  /// Admin Access
  admin,
}

/// Type of transaction from the opposite party perspective
enum TransactionType {
  /// Buy
  buy,

  /// Sell
  sell,
}

/// The payment method
enum PaymentMethod {
  /// Bank Transfer
  bankTransfer,
}
