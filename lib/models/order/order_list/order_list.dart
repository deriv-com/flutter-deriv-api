import '../../../api/p2p_order_list_send.dart';
import '../order.dart';
import 'order_list_caller.dart';

///
class OrderList {
  ///
  OrderList(this.orders);

  static final OrderListCaller _orderListCaller = OrderListCaller();

  ///
  final List<Order> orders;

  ///
  static Future<OrderList> fetch() async =>
      _orderListCaller.modelCall(P2pOrderListRequest());

  ///
  static Stream<OrderList> fetchListUpdate() =>
      _orderListCaller.modelSubscribe(P2pOrderListRequest());
}
