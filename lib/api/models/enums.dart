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
enum AccountStatusType {
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

  /// client has not completed financial information.
  financialInformationNotComplete,

  /// this client has opted for a professional account.
  professional,

  /// Trading experience not completed
  tradingExperienceNotComplete,

  /// client has acknowledged UKGC funds protection notice.
  ukgcFundsProtection,

  /// client cannot deposit or buy contracts, but can withdraw or sell contracts.
  unwelcome,

  /// deposits allowed but withdrawals locked.
  withdrawalLocked,
}

/// Payment result
enum PaymentResult {
  /// Noun, this value is not a valid value
  noun,

  /// Transfer success
  success,

  /// dry-run success
  dryrunSuccess,
}

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

/// Transaction action type
enum TransactionActionType {
  /// Buy
  buy,

  /// Sell
  sell,

  /// Deposit
  deposit,

  /// Withdrawal
  withdrawal,

  /// Escrow
  escrow,
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

/// Type of the account for transfer.
enum TransferAccountType {
  /// Binary account
  binary,

  /// MT5 account
  mt5,
}

/// Type of login action.
enum LoginAction {
  /// Login
  login,

  /// Logout
  logout,
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

/// Contract status
enum ContractStatus {
  /// Open contract
  open,

  /// Sold contract
  sold,

  /// Won contract
  won,

  /// Lost contract
  lost,

  /// Cancelled contract
  cancelled,
}
