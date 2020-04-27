// Payment agent
/// Payment result
enum PaymentResult {
  /// Noun, this value is not a valid value
  noun,

  /// Transfer success
  success,

  /// dry-run success
  dryrunSuccess,
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
