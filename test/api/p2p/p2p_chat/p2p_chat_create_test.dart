import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/p2p_chat_create_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_chat_create_send.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Create P2P Chat Test', () async {
    final P2pChatCreateResponse createChat = await P2pChatCreateResponse.createChat(
      const P2pChatCreateRequest(orderId: '1234'),
    );

    expect(createChat.p2pChatCreate?.channelUrl, 'channel_url');
    expect(createChat.p2pChatCreate?.orderId, '1234');
  });
}
