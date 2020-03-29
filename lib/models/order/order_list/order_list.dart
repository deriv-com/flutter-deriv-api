import 'package:flutter_deriv_api/api/p2p_order_list_send.dart';
import 'package:flutter_deriv_api/models/order/order_list/order_list_caller.dart';

///
class OrderList {
  static final OrderListCaller _orderListCaller = OrderListCaller();

  ///
  static Future<OrderList> fetch() async =>
      _orderListCaller.modelCall(P2pOrderListRequest());

  ///
  static Stream<OrderList> fetchListUpdate() =>
      _orderListCaller.modelSubscribe(P2pOrderListRequest());
}
