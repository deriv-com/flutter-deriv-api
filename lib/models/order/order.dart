import '../../api/p2p_order_cancel_send.dart';
import '../../api/p2p_order_confirm_send.dart';
import '../../api/p2p_order_create_send.dart';
import '../../api/p2p_order_info_send.dart';
import '../../enums/generals.dart';
import '../advert/advert.dart';
import '../advertiser/advertiser.dart';
import 'order_caller.dart';

/// Order information class
class Order {
  /// Initializes
  Order({
    this.accountCurrency,
    this.advertDetails,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.createdTime,
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

  /// Extracts [Order] fields from Map
  factory Order.fromJson(Map<String, dynamic> map) => Order(
      accountCurrency: map['account_currency'],
      advertDetails: Advert.fromJson(map['advert_details']),
      advertiserDetails: Advertiser.fromJson(map['advertiser_details']),
      amount: map['amount'].toDouble(),
      amountDisplay: '${map['amount_display']} ${map['account_currency']}',
      createdTime: map['created_time'],
      expiryTime: map['expiry_time'],
      id: map['id'],
      isIncoming: map['is_incoming'] == 1,
      localCurrency: map['local_currency'],
      price: map['price'].toDouble(),
      priceDisplay: '${map['price_display']} ${map['local_currency']}',
      rate: map['rate'].toDouble(),
      rateDisplay: '${map['rate_display']} ${map['local_currency']}',
      status: _getOrderStatusType(map['status']),
      paymentInfo: map['payment_info'],
      contactInfo: map['contact_info'],
      type: map['type'] == 'sell' && map['is_incoming'] == 0 ||
              map['type'] == 'buy' && map['is_incoming'] == 1
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
  final int createdTime;

  /// The epoch time in which the order will be expired.
  final int expiryTime;

  /// The unique identifier for this order.
  final String id;

  /// `1` if the order is created for the advert of the current client, otherwise `0`.
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
  OrderStatusType status = OrderStatusType.pending;

  /// Is current user buying
  bool get isUserBuying => type == OrderType.buy;

  /// Is current user selling
  bool get isUserSelling => !isUserBuying;

  /// Awaiting for buyer's action
  bool get isAwaitingBuyer => status == OrderStatusType.pending;

  /// Awaiting for seller's action
  bool get isAwaitingSeller => status == OrderStatusType.buyerConfirmed;

  /// Is it awaits for any action
  bool get isAwaitingUserAction =>
      isAwaitingBuyer && isUserBuying || isAwaitingSeller && isUserSelling;

  /// Counterparty - person on the other side of the order
  bool get isAwaitingCounterpartyAction => isOpen && !isAwaitingUserAction;

  /// Is it completed
  bool get isCompleted => status == OrderStatusType.completed;

  /// Is it expired
  bool get isExpired =>
      status == OrderStatusType.timedOut ||
      status == OrderStatusType.timedOutBuyerConfirmed;

  /// Is it cancelled
  bool get isCancelled => status == OrderStatusType.cancelled;

  /// Whether its open or not
  bool get isOpen =>
      status == OrderStatusType.pending ||
      status == OrderStatusType.buyerConfirmed;

  /// Is this my order on someones [Advert]
  bool get isOutgoing => !isIncoming;

  /// It is true if the order is not expired.
  bool get isActive =>
      // TODO(api): we have to use server time later instead of the local machine time
      (expiryTime * 1000) > DateTime.now().toUtc().millisecondsSinceEpoch &&
      status != OrderStatusType.completed &&
      status != OrderStatusType.cancelled;

  static final OrderCaller _orderCaller = OrderCaller();

  /// Fetch order with this [id]
  static Future<Order> fetch(String id) async =>
      _orderCaller.modelCall(P2pOrderInfoRequest(id: id));

  /// Returns true if cancel is successful
  Future<bool> cancel() async {
    final Order order =
        await _orderCaller.modelCall(P2pOrderCancelRequest(id: id));
    return order != null;
  }

  /// Returns true if confirm is successful
  Future<bool> confirm() async {
    final Order order =
        await _orderCaller.modelCall(P2pOrderConfirmRequest(id: id));
    return order != null;
  }

  /// Subscribe to order info
  Stream<Order> orderUpdate() =>
      _orderCaller.modelSubscribe(P2pOrderInfoRequest(id: id));

  /// Subscribe to Order creation
  Stream<Order> orderCreateUpdate(String advertId) =>
      _orderCaller.modelSubscribe(P2pOrderCreateRequest(advertId: advertId));

  ///
  static Future<Order> create(String advertId, double amount,
          {String contactInfo}) =>
      _orderCaller.modelCall(P2pOrderCreateRequest(
        advertId: advertId,
        amount: amount,
        contactInfo: contactInfo,
      ));

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
  String toString() =>
      'Order{accountCurrency: $accountCurrency, amount: $amount, id: $id, localCurrency: $localCurrency, type: $type, status: $status}';
}
