import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/top_up_virtual/top_up_virtual.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Top Up Virtual Test', () async {
    final TopUpVirtual topUpVirtual = await TopUpVirtual.topUp();

    expect(topUpVirtual.amount, 30.0);
    expect(topUpVirtual.currency, 'USD');
  });
}
