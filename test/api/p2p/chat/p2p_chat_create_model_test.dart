import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/p2p/chat/p2p_chat_create.dart';

import 'p2p_chat_create_model_mock_data.dart';

void main() {
  test('p2p create chat json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(p2pChatCreateModelMockData);
    final P2PChatCreate p2pCreateChat =
        P2PChatCreate.fromJson(mapData['p2p_chat_create']);

    expect(p2pCreateChat.channelUrl, 'channel_url');
    expect(p2pCreateChat.orderId, '1234');
  });
}
