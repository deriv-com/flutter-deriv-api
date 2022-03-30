import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/models/country_model.dart';
import 'package:flutter_deriv_api/api/common/models/payment_agent_model.dart';
import 'package:flutter_deriv_api/api/common/payment_agent/payment_agent_list.dart';
import 'package:flutter_deriv_api/api/common/payment_agent/payment_agent_transfer.dart';
import 'package:flutter_deriv_api/api/common/payment_agent/payment_agent_withdraw.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Payment Agent Group ->', () {
    test('Fetch Payment Agent List Test', () async {
      final PaymentAgentList paymentAgentList = await PaymentAgentList.fetch(
        const PaymentagentListRequest(paymentagentList: 'id'),
      );

      final List<CountryModel?> countries = paymentAgentList.countries!;
      final List<PaymentAgentModel?> paymentAgents =
          paymentAgentList.paymentAgents!;
      final CountryModel firstCountry = countries.first!;
      final PaymentAgentModel firstPaymentAgent = paymentAgents.first!;

      expect(countries.length, 2);
      expect(firstCountry.code, 'id');
      expect(firstCountry.name, 'Indonesia');

      expect(paymentAgents.length, 2);
      expect(firstPaymentAgent.currencies, 'USD');
      expect(firstPaymentAgent.depositCommission, '2');
      expect(firstPaymentAgent.email, 'payme_a@gmail.com');
      expect(firstPaymentAgent.furtherInformation, 'Nothing');
      expect(firstPaymentAgent.maxWithdrawal, '100');
      expect(firstPaymentAgent.minWithdrawal, '10');
      expect(firstPaymentAgent.name, 'Bider');
      expect(firstPaymentAgent.paymentAgentLoginId, 'CR90000073');
      expect(firstPaymentAgent.summary, 'nothgin');
      expect(firstPaymentAgent.supportedBanks, 'DiamondBank');
      expect(firstPaymentAgent.telephone, '0123456789');
      expect(firstPaymentAgent.url, 'http://a.com');
      expect(firstPaymentAgent.withdrawalCommission, '5');
    });

    test('Payment Agent Transfer Test', () async {
      final PaymentAgentTransfer paymentAgentTransfer =
          await PaymentAgentTransfer.transfer(
        const PaymentagentTransferRequest(
          amount: 1000,
          currency: 'USD',
          transferTo: 'CR100001',
        ),
      );

      expect(
        paymentAgentTransfer.paymentAgentTransfer,
        PaymentResult.dryrun,
      );
      expect(paymentAgentTransfer.clientToFullName, 'John Doe');
      expect(paymentAgentTransfer.clientToLoginId, 'CR100001');
      expect(paymentAgentTransfer.transactionId, 45735309);
    });

    test('Payment Agent Withdraw Test', () async {
      final PaymentAgentWithdraw paymentAgentWithdraw =
          await PaymentAgentWithdraw.withdraw(
        const PaymentagentWithdrawRequest(
          amount: 1000,
          currency: 'USD',
          paymentagentLoginid: 'CR100001',
          verificationCode: 'verification_code',
        ),
      );

      expect(
        paymentAgentWithdraw.paymentAgentWithdraw,
        PaymentResult.withdrawalOrTransfer,
      );
      expect(paymentAgentWithdraw.paymentAgentName, 'John Doe');
      expect(paymentAgentWithdraw.transactionId, 45735309);
    });
  });
}
