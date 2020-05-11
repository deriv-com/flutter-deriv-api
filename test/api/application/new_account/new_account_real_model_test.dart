import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/new_account/new_account_real.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('new account real test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final NewAccountReal newAccountReal =
        await NewAccountReal.openNewRealAccount(
      request: const NewAccountRealRequest(
        accountOpeningReason: 'Speculative',
        accountTurnover: 'Less than \$25,000',
        addressCity: 'Melbourne',
        addressLine1: '20 Broadway Av',
        addressLine2: 'East Melbourne VIC',
        addressPostcode: '3002',
        addressState: 'Victoria',
        dateOfBirth: '1980-01-31',
        firstName: 'Peter',
        lastName: 'Pan',
        newAccountReal: 1,
        nonPepDeclaration: 1,
        phone: '+6123456789',
        placeOfBirth: 'id',
        residence: 'au',
        salutation: 'Mr',
        secretAnswer: 'Jones',
        secretQuestion: 'Mothers maiden name',
        taxIdentificationNumber: '012142545',
        taxResidence: 'ar,sg',
      ),
    );

    expect(newAccountReal.clientId, 'CR0000');
    expect(newAccountReal.landingCompany, 'landing_company');
    expect(newAccountReal.landingCompanyShort, 'landing_company_short');
    expect(newAccountReal.oauthToken, 'sample_token');
  });
}
