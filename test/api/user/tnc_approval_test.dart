import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/tnc_approval_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/tnc_approval_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Terms and Conditions Approval Test', () async {
    final TncApprovalResponse tncApproval =
        await TncApprovalResponse.verify(const TncApprovalRequest());

    expect(tncApproval.tncApproval, 1);
  });
}
