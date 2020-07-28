import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/user/tnc_approval.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(true));

  test('Terms and Conditions Approval Test', () async {
    final TNCApproval tncApproval =
        await TNCApproval.verify(const TncApprovalRequest(tncApproval: 1));

    expect(tncApproval.approved, true);
  });
}
