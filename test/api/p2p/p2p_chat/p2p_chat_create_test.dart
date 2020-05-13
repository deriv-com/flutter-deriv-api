import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/p2p/p2p_chat/p2p_chat_create.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('p2p create chat', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final P2PChatCreate p2pCreateChat = await P2PChatCreate.createChat(
      const P2pChatCreateRequest(orderId: '1234'),
    );

    expect(p2pCreateChat.channelUrl, 'channel_url');
    expect(p2pCreateChat.orderId, '1234');
  });
}
