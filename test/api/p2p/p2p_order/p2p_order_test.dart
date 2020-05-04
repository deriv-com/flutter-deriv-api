import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/p2p/p2p_order/p2p_order.dart';
import 'p2p_order_mock_data.dart';

void main() {
  test('P2P order JSON parsing', () {
    final Map<String, dynamic> orderMap = jsonDecode(p2pOrderJSON);

    final P2POrder order = P2POrder.fromJson(orderMap['p2p_order_info']);

    print('object');
  });
}
