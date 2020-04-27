/// This represent the current status for proof of identity document
/// submitted for authentication.
enum AccountIdentityStatus {
  /// None
  none,

  /// Document proof is pending
  pending,

  /// Document rejected
  rejected,

  /// Document verified
  verified,

  /// Document expired
  expired,

  /// Suspected document
  suspected,
}

/// This represent the current status for proof of identity document
/// submitted for authentication.
enum AccountRiskClassification {
  /// Low
  low,

  /// Standard
  standard,

  /// High
  high,
}

/// Account status
enum AccountStatus {
  /// client is age-verified.
  ageVerification,

  /// client is fully authenticated.
  authenticated,

  /// cashier is locked.
  cashierLocked,

  /// client has updated tax related information.
  crsTinInformation,

  /// account is disabled.
  disabled,

  /// client's submitted proof-of-identity documents have expired.
  documentExpired,

  /// client's submitted proof-of-identity documents are expiring within a month.
  documentExpiringSoon,

  /// client has not completed financial assessment.
  financialAssessmentNotComplete,

  /// this client has opted for a professional account.
  professional,

  /// client has acknowledged UKGC funds protection notice.
  ukgcFundsProtection,

  /// client cannot deposit or buy contracts, but can withdraw or sell contracts.
  unwelcome,

  /// deposits allowed but withdrawals locked.
  withdrawalLocked,
}
