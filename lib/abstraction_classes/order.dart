import 'dart:async';

import 'package:flutter_deriv_api/enums.dart';
import 'package:flutter_deriv_api/models/order.dart';
import 'package:flutter_deriv_api/abstraction_classes/advert.dart';
import 'package:flutter_deriv_api/abstraction_classes/advertiser.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Account abstraction class
class Order extends OrderModel {
  /// Class constructor
  Order({
    BinaryAPI api,
    String id,
    String accountCurrency,
    Advert advertDetails,
    Advertiser advertiserDetails,
    double amount,
    String amountDisplay,
    int createdTime,
    String description,
    int expiryTime,
    bool isIncoming,
    String localCurrency,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    OrderStatusType status = OrderStatusType.pending,
    OrderType type,
    String paymentInfo,
    String contactInfo,
  }) : super(
          api: api,
          id: id,
          accountCurrency: accountCurrency,
          advertDetails: advertDetails,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          createdTime: createdTime,
          description: description,
          expiryTime: expiryTime,
          isIncoming: isIncoming,
          localCurrency: localCurrency,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          status: status,
          type: type,
          paymentInfo: paymentInfo,
          contactInfo: contactInfo,
        );

  /// Extract class from a order object
  Order.fromObject(Order order)
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

  /// Extract class from a map object
  factory Order.fromMap(Map<String, dynamic> order) => Order(
        accountCurrency: order['account_currency'],
        advertDetails: Advert.fromMap(order['advert_details']),
        advertiserDetails: Advertiser.fromMap(order['advertiser_details']),
        amount: order['amount'].toDouble(),
        amountDisplay: '',
        // amountDisplay = getFormattedValue(value: order['amount_display']) +
        //     ' ' +
        //     order['account_currency'],
        createdTime: order['created_time'],
        expiryTime: order['expiry_time'],
        id: order['id'],
        isIncoming: order['is_incoming'] == 1,
        localCurrency: order['local_currency'],
        price: order['price'].toDouble(),
        priceDisplay: '',
        // priceDisplay = getFormattedValue(value: order['price_display']) +
        //     ' ' +
        //     order['local_currency'],
        rate: order['rate'].toDouble(),
        rateDisplay: '',
        // rateDisplay = getFormattedValue(value: order['rate_display']) +
        //     ' ' +
        //     order['local_currency'],
        status: _getOrderStatusType(order['status']),
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
            : OrderType.buy,
      );

  String _orderSubscriptionId;
  String _orderListSubscriptionId;

  StreamSubscription<Order> _orderStreamSubscription;
  StreamSubscription<Set<Order>> _orderListStreamSubscription;

  /// Indicates order type is buy or not
  bool get isUserBuying => type == OrderType.buy;

  /// Indicates order type is sell or not
  bool get isUserSelling => !isUserBuying;

  /// Indicates order status is pending
  bool get isAwaitingBuyer => status == OrderStatusType.pending;

  /// Indicates order status is buyer confirmed
  bool get isAwaitingSeller => status == OrderStatusType.buyerConfirmed;

  /// Indicates order status is awaiting for user action
  bool get isAwaitingUserAction =>
      isAwaitingBuyer && isUserBuying || isAwaitingSeller && isUserSelling;

  /// Indicates order status is awaiting for `counterparty` action
  /// Counterparty - person on the other side of the order
  bool get isAwaitingCounterpartyAction => isOpen && !isAwaitingUserAction;

  /// Indicates order status is completed
  bool get isCompleted => status == OrderStatusType.completed;

  /// Indicates order  is expired
  bool get isExpired =>
      status == OrderStatusType.timedOut ||
      status == OrderStatusType.timedOutBuyerConfirmed;

  /// Indicates order status is canceled
  bool get isCancelled => status == OrderStatusType.cancelled;

  /// Indicates order status is open
  bool get isOpen =>
      status == OrderStatusType.pending ||
      status == OrderStatusType.buyerConfirmed;

  /// Indicates order is not created for the advert of the current client
  bool get isOutgoing => !isIncoming;

  /// It is true if the order is not expired.
  bool get isActive =>
      // TODO we have to use server time later instead of the local machine time
      (expiryTime * 1000) > DateTime.now().toUtc().millisecondsSinceEpoch &&
      status != OrderStatusType.completed &&
      status != OrderStatusType.cancelled;

  /// Get buy or sell display amount
  String get title => '${isUserBuying ? 'Buy' : 'Sell'} $amountDisplay';

  // TODO: return client nickname when everyone has to register
  /// Get counterparty name
  String get counterpartyName => isIncoming ? '–' : advertiserDetails.name;

  /// Update desired class fields
  Order copyWith({
    Advert advertDetails,
    double amount,
    String paymentInfo,
    String contactInfo,
  }) =>
      Order(
        advertDetails: advertDetails ?? this.advertDetails,
        amount: amount ?? this.amount,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        contactInfo: contactInfo ?? this.contactInfo,
      );

  /// Fetch order detail
  Future<Order> fetch() async {
    final Map<String, dynamic> response = await api.p2pOrderInfo(id: id);

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    } else {
      return _parseOrderResponse(response);
    }
  }

  /// Confirm order
  Future<void> confirm() async {
    final Map<String, dynamic> response = await api.p2pOrderConfirm(id);

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    }
  }

  /// Cancel order
  Future<void> cancel() async {
    final Map<String, dynamic> response = await api.p2pOrderCancel(id);

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    }
  }

  /// Subscribe to order detail
  Future<void> subscribe({
    Function(Order) onChangeListener,
  }) async {
    if (_orderSubscriptionId != null) {
      await unsubscribe();
    }

    _orderStreamSubscription = _subscribeOrderInfo().listen(
      (Order order) => onChangeListener(order),
    );
  }

  Stream<Order> _subscribeOrderInfo() =>
      api.subscribeOrderInfo(id: id).map<Order>(
        (Map<String, dynamic> response) {
          if (response.containsKey('error')) {
            throw Exception(response['error']['message']);
          } else {
            _orderSubscriptionId = response['subscription']['id'];
            return _parseOrderResponse(response);
          }
        },
      );

  /// Unsubscribe from order detail
  Future<void> unsubscribe() async {
    if (_orderSubscriptionId != null) {
      await _orderStreamSubscription?.cancel();
      await api.unsubscribe(_orderSubscriptionId);

      _orderSubscriptionId = null;
    }
  }

  /// Fetch order list
  Future<Set<Order>> fetchOrders({
    int start,
    int count,
  }) async {
    final Map<String, dynamic> response = await api.p2pOrderList(
      offset: start,
      limit: count,
    );

    return _parseOrdersResponse(response);
  }

  /// Subscribe to order list
  Future<void> subscribeOrders({
    Function(Set<Order>) onChangeListener,
    int limit,
  }) async {
    if (_orderSubscriptionId != null) {
      await unsubscribe();
    }

    _orderListStreamSubscription = _subscribeOrderList(limit: limit).listen(
      (Set<Order> order) => onChangeListener(order),
    );
  }

  /// Subscribe to order list
  Stream<Set<Order>> _subscribeOrderList({
    int limit,
  }) =>
      api.subscribeP2pOrderList(limit: limit).map(
            (Map<String, dynamic> response) =>
                _parseSubscriptionResponse(response),
          );

  /// Unsubscribe from order list
  Future<void> unsubscribeOrders() async {
    if (_orderListSubscriptionId != null) {
      await _orderListStreamSubscription?.cancel();
      await api.unsubscribe(_orderListSubscriptionId);

      _orderListSubscriptionId = null;
    }
  }

  /// Get order status title
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

  Order _parseOrderResponse(Map<String, dynamic> response) =>
      Order.fromMap(response['p2p_order_info']);

  Set<Order> _parseOrdersResponse(Map<String, dynamic> response) {
    final Set<Order> newOrders = <Order>{};

    response['p2p_order_list']['list'].forEach((Map<String, dynamic> item) {
      newOrders.add(Order.fromMap(item));
    });

    return newOrders;
  }

  Set<Order> _parseSubscriptionResponse(Map<String, dynamic> response) {
    Set<Order> result = <Order>{};

    if (response.containsKey('error') &&
        response['error']['code'] != 'AlreadySubscribed') {
      throw Exception(response['error']['message']);
    } else if (response.containsKey('p2p_order_list')) {
      _orderListSubscriptionId = response['subscription']['id'];

      result = _parseOrdersResponse(response);
    } else if (response.containsKey('p2p_order_info')) {
      result = <Order>{_parseOrderResponse(response)};
    }

    return result;
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
}
