import 'package:flutter_deriv_api/api/p2p_order_create_receive.dart';

import '../../api/p2p_order_cancel_receive.dart';
import '../../api/p2p_order_confirm_receive.dart';
import '../../api/p2p_order_info_receive.dart';
import '../../api/response.dart';
import '../../services/api_caller.dart';
import 'order.dart';

/// Helper mixin to help model classes that deal with API calls related to Order
/// A model class can have multiple of these [ApiCaller] objects for different
/// [T] types. e.g. A class could have two [ApiCaller] for both
/// [Order] and [OrderList] types
class OrderCaller with ApiCaller<Order> {
  @override
  Order responseToModel(Response response) {
    switch (response.msgType) {
      case 'p2p_order_info':
        final P2pOrderInfoResponse infoResponse = response;
        return Order.fromJson(infoResponse.p2pOrderInfo);
        break;
      case 'p2p_order_confirm':
        final P2pOrderConfirmResponse confirmResponse = response;
        return Order.fromJson(confirmResponse.p2pOrderConfirm);
        break;
      case 'p2p_order_cancel':
        final P2pOrderCancelResponse cancelResponse = response;
        return Order.fromJson(cancelResponse.p2pOrderCancel);
        break;
      case 'p2p_order_create':
        final P2pOrderCreateResponse createResponse = response;
        return Order.fromJson(createResponse.p2pOrderCreate);
        break;
    }
    // TODO(api): Maybe returning something else instead of null
    return null;
  }
}
