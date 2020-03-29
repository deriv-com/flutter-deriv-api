import 'package:flutter/material.dart';
import '../api/p2p_order_cancel_send.dart';
import '../api/p2p_order_confirm_send.dart';
import '../api/p2p_order_create_send.dart';
import '../api/p2p_order_info_receive.dart';
import '../api/p2p_order_info_send.dart';
import '../api/response.dart';
import '../services/api_caller.dart';

///
class Order with ApiCaller<Order> {

  ///
  Order({this.email, this.id, this.amount, this.status});

  ///
  String email;

  ///
  final String id;

  ///
  final String amount;

  ///
  String status;

  ///
  static Future<Order> initOrder(String orderId) async {
    final Order order = Order(id: '');
    return order._fetchOrder();
  }

  Future<Order> _fetchOrder() async => modelCall(P2pOrderInfoRequest(id: ''));

  /// Returns true if cancel is successful
  Future<bool> cancel() async {
    final P2pOrderInfoResponse response =
    await callApi(P2pOrderCancelRequest(id: id));
    return response.error != null;
  }

  /// Returns true if confirm is successful
  Future<bool> confirm() async {
    final P2pOrderInfoResponse response =
    await callApi(P2pOrderConfirmRequest(id: id));
    return response.error != null;
  }

  ///
  Future<Order> confirm2() async => modelCall(P2pOrderConfirmRequest(id: id));

  ///
  Stream<Order> orderUpdate() => modelSubscribe(P2pOrderInfoRequest(id: id));

  ///
  Stream<Order> orderCreateUpdate() =>
      modelSubscribe(P2pOrderCreateRequest(advertId: id));

  @override
  Order responseToModel(Response response) {
    switch (response.msgType) {
      case 'p2p_order_info':
        if (response.error != null) {
          throw FlutterError('');
        }
        return Order();
      case 'p2p_order_cancel':
        return this..status = '';
      default:
        return this..status = '';
    }
  }
}