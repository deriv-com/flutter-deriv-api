import 'package:flutter_deriv_api/api/p2p_order_list_receive.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/models/order/order.dart';
import 'package:flutter_deriv_api/models/order/order_list/order_list.dart';
import 'package:flutter_deriv_api/services/api_caller.dart';

/// [OrderList] ApiCaller to get model from API calls
class OrderListCaller with ApiCaller<OrderList> {
  @override
  OrderList responseToModel(Response response) {
    if (response.error == null) {
      switch (response.msgType) {
        case 'p2p_order_list':
          final P2pOrderListResponse orderListResponse = response;
          print(orderListResponse.p2pOrderList['list']);
          final List<dynamic> mapList =
              orderListResponse.p2pOrderList['list'];
          return _extractListFromMap(mapList);
          break;
      }
    }
    return null;
  }

  OrderList _extractListFromMap(List<dynamic> mapList) {
    final List<Order> orders = <Order>[];
    for (Map<String, dynamic> map in mapList) {
      orders.add(Order.fromJson(map));
    }
    return OrderList(orders);
  }
}
