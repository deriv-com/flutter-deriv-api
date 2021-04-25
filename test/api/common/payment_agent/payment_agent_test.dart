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

      final List<CountryModel> countries = paymentAgentList.countries;
      final List<PaymentAgentModel> paymentAgents =
          paymentAgentList.paymentAgents;

      expect(countries.length, 2);

      expect(countries.first.code, 'id');
      expect(countries.first.name, 'Indonesia');

      expect(paymentAgents.length, 2);

      expect(paymentAgents.first.currencies, 'USD');
      expect(paymentAgents.first.depositCommission, '2');
      expect(paymentAgents.first.email, 'payme_a@gmail.com');
      expect(paymentAgents.first.furtherInformation, 'Nothing');
      expect(paymentAgents.first.maxWithdrawal, '100');
      expect(paymentAgents.first.minWithdrawal, '10');
      expect(paymentAgents.first.name, 'Bider');
      expect(paymentAgents.first.paymentAgentLoginId, 'CR90000073');
      expect(paymentAgents.first.summary, 'nothgin');
      expect(paymentAgents.first.supportedBanks, 'DiamondBank');
      expect(paymentAgents.first.telephone, '0123456789');
      expect(paymentAgents.first.url, 'http://a.com');
      expect(paymentAgents.first.withdrawalCommission, '5');
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
