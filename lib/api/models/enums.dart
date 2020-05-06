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

/// Order type
enum OrderType {
  /// Order is buy type
  buy,

  /// Order is sell type
  sell,
}

/// Status of an order
/// Initial status is [OrderStatusType.pending]
enum OrderStatusType {
  /// Buyer of account has not yet transferred the equivalent amount of local
  /// currency to advert has not yet confirmed this order
  pending,

  /// After the buyer of account currency confirmed his/her payment
  buyerConfirmed,

  /// Order is cancelled by client or advertiser
  /// cancel action has some restrictions that is based on order's current status
  cancelled,

  /// When both buyer and seller do not confirm the order during
  /// [Order.expiryTime] period, the order will go to [OrderStatusType.timedOut]
  timedOut,

  /// When order is in [OrderStatusType.buyerConfirmed] status and seller doesn't
  /// release the cash before [Order.expiryTime]
  timedOutBuyerConfirmed,

  /// Order process completed
  completed,
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

/// Contract basis Indicates type of the contract amount
enum ContractBasis {
  /// Defining the payout that user wants from contract. Stake will be calculated
  /// based on the defined payout
  payout,

  /// User will define how much stake he/she is going to put for this contarct
  stake,
}
