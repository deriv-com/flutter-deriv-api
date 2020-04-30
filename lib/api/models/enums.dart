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

/// Currency types
enum CurrencyType {
  /// Fiat currencies
  fiat,

  /// Crypto Currencies
  crypto,
}

/// Indicates site's status
enum SiteStatus {
  /// Site is up
  up,

  /// Site is down
  down,
}
