import '../../../api/p2p_order_list_send.dart';
import '../order.dart';
import 'order_list_caller.dart';

/// Handling list of orders
class OrderList {
  /// Initializes
  OrderList(this.orders);

  static final OrderListCaller _orderListCaller = OrderListCaller();

  /// The list of orders
  final List<Order> orders;

  /// Fetch orders
  static Future<OrderList> fetch() async =>
      _orderListCaller.modelCall(P2pOrderListRequest());

  /// To Subscribe to order list
  static Stream<OrderList> fetchListUpdate() =>
      _orderListCaller.modelSubscribe(P2pOrderListRequest());
}
