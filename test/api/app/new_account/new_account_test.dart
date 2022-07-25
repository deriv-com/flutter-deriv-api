import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/new_account_real_response_result.dart';
import 'package:flutter_deriv_api/api/response/new_account_virtual_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_real_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_virtual_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('New Account Group ->', () {
    test('Open New Account Real Test', () async {
      final NewAccountRealResponse newAccountReal =
          await NewAccountRealResponse.openNewRealAccount(
        const NewAccountRealRequest(
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

      expect(newAccountReal.newAccountReal?.clientId, 'CR0000');
      expect(newAccountReal.newAccountReal?.landingCompany, 'landing_company');
      expect(newAccountReal.newAccountReal?.landingCompanyShort,
          'landing_company_short');
      expect(newAccountReal.newAccountReal?.oauthToken, 'sample_token');
    });

    test('Open New Account Virtual Test', () async {
      final NewAccountVirtualResponse newAccountVirtual =
          await NewAccountVirtualResponse.openNewVirtualAccount(
        const NewAccountVirtualRequest(
          clientPassword: 'Abc123de',
          residence: 'id',
          type: 'trading',
          verificationCode: 'uoJvVuQ6',
        ),
      );

      expect(newAccountVirtual.newAccountVirtual?.balance, 250.0);
      expect(newAccountVirtual.newAccountVirtual?.clientId, 'VRTC0000');
      expect(newAccountVirtual.newAccountVirtual?.currency, 'USD');
      expect(newAccountVirtual.newAccountVirtual?.email, 'test@email.com');
      expect(newAccountVirtual.newAccountVirtual?.oauthToken, 'sample_token');
    });
  });
}
