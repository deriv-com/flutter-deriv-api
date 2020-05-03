import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';
import 'enums.dart';

/// Order information model class
class P2POrderModel extends Equatable {
  /// Initializes
  const P2POrderModel({
    this.accountCurrency,
    this.advertDetails,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.createdTime,
    this.description,
    this.expiryTime,
    this.id,
    this.isIncoming,
    this.localCurrency,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.status,
    this.type,
    this.paymentInfo,
    this.contactInfo,
  });

  /// Creates instance from JSON
  factory P2POrderModel.fromJson(Map<String, dynamic> order) => P2POrderModel(
      accountCurrency: order['account_currency'],
      advertDetails: Advert.fromMap(order['advert_details']),
      advertiserDetails: Advertiser.fromMap(order['advertiser_details']),
      amount: order['amount'].toDouble(),
      amountDisplay: NumberValidator.isNumber(order['amount_display'])
          ? '''${getFormattedValue(value: order['amount_display'])} ${order['account_currency']}'''
          : order['amount_display'],
      createdTime: order['created_time'],
      expiryTime: order['expiry_time'],
      id: order['id'],
      isIncoming: order['is_incoming'] == 1,
      localCurrency: order['local_currency'],
      price: order['price'].toDouble(),
      priceDisplay: NumberValidator.isNumber(order['price_display'])
          ? '''${getFormattedValue(value: order['price_display'])} ${order['local_currency']}'''
          : order['price_display'],
      rate: order['rate'].toDouble(),
      rateDisplay: NumberValidator.isNumber(order['rate_display'])
          ? '''${getFormattedValue(value: order['rate_display'])} ${order['local_currency']}'''
          : order['rate_display'],
      status: EnumHelper.getEnum(
        values: OrderStatusType.values,
        name: order['status'],
      ),
      description: order['description'],
      paymentInfo: order['payment_info'],
      contactInfo: order['contact_info'],
      // API returns type "Buy" when order is created by buyer
      // API returns type "Sell" when order is created by seller
      // here we change to type from user perspective
      // type "Buy" if user is buying
      // type "Sell" if user is selling
      type: order['type'] == 'sell' && order['is_incoming'] == 0 ||
              order['type'] == 'buy' && order['is_incoming'] == 1
          ? OrderType.sell
          : OrderType.buy);

  /// The currency of order.
  final String accountCurrency;

  /// Details of the advert for this order.
  final Advert advertDetails;

  /// Details of the advertiser for this order.
  final Advertiser advertiserDetails;

  /// The amount of the order.
  final double amount;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The epoch time of the order creation.
  final DateTime createdTime;

  /// Order's description
  final String description;

  /// The epoch time in which the order will be expired.
  final DateTime expiryTime;

  /// The unique identifier for this order.
  final String id;

  /// `true` if the order is created for the advert of the current client, otherwise `false`.
  /// (true for advertiser receiving order)
  final bool isIncoming;

  /// Local currency for this order.
  final String localCurrency;

  /// Cost in local currency.
  final double price;

  /// Cost in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Conversion rate of the order.
  final double rate;

  /// Conversion rate of the order, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Whether this is a buy or a sell.
  final OrderType type;

  /// Payment instructions.
  final String paymentInfo;

  /// Seller contact information.
  final String contactInfo;

  /// Status of order
  final OrderStatusType status;

  /// Is current user is a buyer in this order
  bool get isUserBuying => type == OrderType.buy;

  /// Is current user is a seller in this order
  bool get isUserSelling => !isUserBuying;

  /// Is the order is awaiting for buyer's confirmation
  bool get isAwaitingBuyer => status == OrderStatusType.pending;

  /// Is the order is awaiting for seller's confirmation
  bool get isAwaitingSeller => status == OrderStatusType.buyerConfirmed;

  /// Is the order is awaiting for current user's confirmation
  bool get isAwaitingUserAction =>
      isAwaitingBuyer && isUserBuying || isAwaitingSeller && isUserSelling;

  /// Counterparty - person on the other side of the order
  bool get isAwaitingCounterpartyAction => isOpen && !isAwaitingUserAction;

  /// Is order completed successfully
  bool get isCompleted => status == OrderStatusType.completed;

  /// Is order expired
  bool get isExpired =>
      status == OrderStatusType.timedOut ||
      status == OrderStatusType.timedOutBuyerConfirmed;

  /// Is order cancelled by any of the parties during its lifetime
  bool get isCancelled => status == OrderStatusType.cancelled;

  /// Is order open
  bool get isOpen =>
      status == OrderStatusType.pending ||
      status == OrderStatusType.buyerConfirmed;

  /// Not [isIncoming]
  bool get isOutgoing => !isIncoming;

  // TODO(unknown): we have to use server time later instead of the local machine time
  /// It is true if the order is not expired.
  bool get isActive =>
      expiryTime.isAfter(DateTime.now()) &&
      status != OrderStatusType.completed &&
      status != OrderStatusType.cancelled;

  P2POrderModel.from(P2POrderModel order)
      : this(
          accountCurrency: order.accountCurrency,
          advertDetails: order.advertDetails,
          advertiserDetails: order.advertiserDetails,
          amount: order.amount,
          amountDisplay: order.amountDisplay,
          createdTime: order.createdTime,
          description: order.description,
          expiryTime: order.expiryTime,
          id: order.id,
          isIncoming: order.isIncoming,
          localCurrency: order.localCurrency,
          price: order.price,
          priceDisplay: order.priceDisplay,
          rate: order.rate,
          rateDisplay: order.rateDisplay,
          status: order.status,
          type: order.type,
          paymentInfo: order.paymentInfo,
          contactInfo: order.contactInfo,
        );

  /// Title of this order
  String get title => '${isUserBuying ? 'Buy' : 'Sell'} $amountDisplay';

  // TODO(unknown): return client nickname when everyone has to register
  ///
  String get counterpartyName => isIncoming ? '–' : advertiserDetails.name;

  /// Get appropriate status title or action to be performed for this order
  String get statusTitle {
    switch (status) {
      case OrderStatusType.pending:
        return isUserBuying ? 'Pay now' : 'Wait for payment';
      case OrderStatusType.buyerConfirmed:
        return isUserBuying ? 'Wait for release' : 'Confirm payment';
      case OrderStatusType.completed:
        return 'Completed';
      case OrderStatusType.cancelled:
        return 'Cancelled';
      case OrderStatusType.timedOut:
      case OrderStatusType.timedOutBuyerConfirmed:
        return 'Expired';
      default:
        return '---';
    }
  }

  static OrderStatusType _getOrderStatusType(String status) {
    switch (status) {
      case 'pending':
        return OrderStatusType.pending;
      case 'buyer-confirmed':
        return OrderStatusType.buyerConfirmed;
      case 'cancelled':
        return OrderStatusType.cancelled;
      case 'timed-out':
        return OrderStatusType.timedOut;
      case 'refunded': // expired after buyerConfirmed
        return OrderStatusType.timedOutBuyerConfirmed;
      case 'completed':
        return OrderStatusType.completed;
      default:
        return null;
    }
  }

  @override
  List<Object> get props => <Object>[id];

  P2POrderModel copyWith({
    Advert advertDetails,
    double amount,
    String paymentInfo,
    String contactInfo,
  }) =>
      P2POrderModel(
        advertDetails: advertDetails ?? this.advertDetails,
        amount: amount ?? this.amount,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        contactInfo: contactInfo ?? this.contactInfo,
      );
}
