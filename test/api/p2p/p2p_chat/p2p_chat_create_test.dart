import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_chat/p2p_chat_create.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Create P2P Chat Test', () async {
    final P2PChatCreate createChat = await P2PChatCreate.createChat(
      const P2pChatCreateRequest(orderId: '1234'),
    );

    expect(createChat.channelUrl, 'channel_url');
    expect(createChat.orderId, '1234');
  });
}
