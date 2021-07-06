import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/topup_virtual_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Top Up Virtual Test', () async {
    final TopupVirtualResponse topUpVirtual = await TopupVirtualResponse.topUp();

    expect(topUpVirtual.topupVirtual?.amount, 30.0);
    expect(topUpVirtual.topupVirtual?.currency, 'USD');
  });
}
