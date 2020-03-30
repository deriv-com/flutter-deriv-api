import '../../api/p2p_order_cancel_send.dart';
import '../../api/p2p_order_confirm_send.dart';
import '../../api/p2p_order_create_send.dart';
import '../../api/p2p_order_info_receive.dart';
import '../../api/p2p_order_info_send.dart';
import '../../enums/generals.dart';
import '../advert/advert.dart';
import '../advertiser/advertiser.dart';
import 'order_caller.dart';

///
class Order {
  ///
  Order({
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

  static final OrderCaller _orderCaller = OrderCaller();

  ///
  final String accountCurrency;

  ///
  final Advert advertDetails;

  ///
  final Advertiser advertiserDetails;

  ///
  final double amount;

  ///
  final String amountDisplay;

  ///
  final int createdTime;

  ///
  final String description;

  ///
  final int expiryTime;

  ///
  final String id;

  /// true for advertiser receiving order
  final bool isIncoming;

  ///
  final String localCurrency;

  ///
  final double price;

  ///
  final String priceDisplay;

  ///
  final double rate;

  ///
  final String rateDisplay;

  ///
  final OrderType type;

  ///
  final String paymentInfo;

  ///
  final String contactInfo;

  ///
  OrderStatusType status = OrderStatusType.pending;

  ///
  bool get isUserBuying => type == OrderType.buy;

  ///
  bool get isUserSelling => !isUserBuying;

  ///
  bool get isAwaitingBuyer => status == OrderStatusType.pending;

  ///
  bool get isAwaitingSeller => status == OrderStatusType.buyerConfirmed;

  ///
  bool get isAwaitingUserAction =>
      isAwaitingBuyer && isUserBuying || isAwaitingSeller && isUserSelling;

  /// Counterparty - person on the other side of the order
  bool get isAwaitingCounterpartyAction => isOpen && !isAwaitingUserAction;

  ///
  bool get isCompleted => status == OrderStatusType.completed;

  ///
  bool get isExpired =>
      status == OrderStatusType.timedOut ||
      status == OrderStatusType.timedOutBuyerConfirmed;

  ///
  bool get isCancelled => status == OrderStatusType.cancelled;

  ///
  bool get isOpen =>
      status == OrderStatusType.pending ||
      status == OrderStatusType.buyerConfirmed;

  ///
  bool get isOutgoing => !isIncoming;

  /// It is true if the order is not expired.
  bool get isActive =>
      // TODO(api): we have to use server time later instead of the local machine time
      (expiryTime * 1000) > DateTime.now().toUtc().millisecondsSinceEpoch &&
      status != OrderStatusType.completed &&
      status != OrderStatusType.cancelled;

  ///
  static Future<Order> fetchOrder(String id) async =>
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

  ///
  Future<Order> confirm2() async =>
      _orderCaller.modelCall(P2pOrderConfirmRequest(id: id));

  ///
  Stream<Order> orderUpdate() =>
      _orderCaller.modelSubscribe(P2pOrderInfoRequest(id: id));

  ///
  Stream<Order> orderCreateUpdate() =>
      _orderCaller.modelSubscribe(P2pOrderCreateRequest(advertId: id));
}
