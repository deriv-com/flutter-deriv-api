import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/user/tnc_approval.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUp(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  test('Terms and Conditions Approval Test', () async {
    final TNCApproval tncApproval =
        await TNCApproval.verify(const TncApprovalRequest());

    expect(tncApproval.approved, true);
  });
}
