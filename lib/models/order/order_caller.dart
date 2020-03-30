import '../../api/p2p_order_cancel_receive.dart';
import '../../api/p2p_order_confirm_receive.dart';
import '../../api/p2p_order_info_receive.dart';
import '../../api/response.dart';
import '../../enums/generals.dart';
import '../../models/advert/advert.dart';
import '../../models/advertiser/advertiser.dart';
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
        return fromJson(infoResponse.p2pOrderInfo);
        break;
      case 'p2p_order_confirm':
        final P2pOrderConfirmResponse confirmResponse = response;
        return fromJson(confirmResponse.p2pOrderConfirm);
        break;
      case 'p2p_order_cancel':
        final P2pOrderCancelResponse cancelResponse = response;
        return fromJson(cancelResponse.p2pOrderCancel);
        break;
    }
    // TODO(api): Maybe returning something else instead of null
    return null;
  }

  /// Extracts [Order] fields from Map
  static Order fromJson(Map<String, dynamic> map) => Order(
      accountCurrency: map['account_currency'],
      advertDetails: Advert.fromMap(map['advert_details']),
      advertiserDetails: Advertiser.fromMap(map['advertiser_details']),
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
      description: map['description'],
      paymentInfo: map['payment_info'],
      contactInfo: map['contact_info'],
      type: map['type'] == 'sell' && map['is_incoming'] == 0 ||
              map['type'] == 'buy' && map['is_incoming'] == 1
          ? OrderType.sell
          : OrderType.buy);

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
