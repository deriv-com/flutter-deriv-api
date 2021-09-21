import 'package:flutter_deriv_api/basic_api/generated/tnc_approval_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/response/tnc_approval_response_result.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Terms and Conditions Approval Test', () async {
    final TncApprovalResponse tncApproval =
        await TncApprovalResponse.verify(const TncApprovalRequest());

    expect(tncApproval.tncApproval, 1);
  });
}
