/// Types of advert
enum AdvertType {
  /// When advertiser creates a [AdvertType.buy] advert it means he/she wants
  /// to buy his account currency
  buy,

  /// When advertiser creates a [AdvertType.sell] advert it means he/she wants
  /// to sell his account currency
  sell,
}

/// Types of Order
enum OrderType {
  /// Order of type buy
  buy,
  /// Order of type sell
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

/// account currency types for P2P cashier exchange
enum CurrencyType {
  /// Normal accounts
  fiat,
  /// crypto accounts
  crypto,
}

/// The status of website
enum SiteStatus {
  /// Website is up
  up,
  /// Website is down
  down,
}

/// Actions that either of client or advertiser could perform during order process
enum OrderActions {
  /// Confirming payment by buyer
  confirmPayment,
  /// releasing cash by seller
  release,
  /// No action, the user needs to wait for other party's action
  none,
}

/// Different methods of payment for buyer to pay to seller
enum PaymentMethod {
  /// Using Bank Transfer
  bankTransfer,
}
