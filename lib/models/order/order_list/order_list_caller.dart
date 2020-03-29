import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/models/order/order_list/order_list.dart';
import 'package:flutter_deriv_api/services/api_caller.dart';

///
class OrderListCaller with ApiCaller<OrderList> {
  @override
  OrderList responseToModel(Response response) {
    if (response.error == null) {
      switch (response.msgType) {
        case 'p2p_order_list':
          return OrderList();
          break;
      }
      return null;
    } else {
      return null;
    }
  }
}
