import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/paymentagent_list_response_result.dart';
import 'package:flutter_deriv_api/api/response/paymentagent_transfer_response_result.dart';
import 'package:flutter_deriv_api/api/response/paymentagent_withdraw_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/paymentagent_list_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/paymentagent_transfer_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/paymentagent_withdraw_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('Payment Agent Group ->', () {
    test('Fetch Payment Agent List Test', () async {
      final PaymentagentListResponse paymentAgentList =
          await PaymentagentListResponse.fetch(
        const PaymentagentListRequest(paymentagentList: 'id'),
      );

      final List<List<String>> countries =
          paymentAgentList.paymentagentList!.availableCountries!;
      final List<ListItem> paymentAgents =
          paymentAgentList.paymentagentList!.list;

      expect(countries.length, 2);

      expect(countries.first[0], 'id');
      expect(countries.first[1], 'Indonesia');

      expect(paymentAgents.length, 2);

      expect(paymentAgents.first.currencies, 'USD');
      expect(paymentAgents.first.depositCommission, '2');
      expect(paymentAgents.first.email, 'payme_a@gmail.com');
      expect(paymentAgents.first.furtherInformation, 'Nothing');
      expect(paymentAgents.first.maxWithdrawal, '100');
      expect(paymentAgents.first.minWithdrawal, '10');
      expect(paymentAgents.first.name, 'Bider');
      expect(paymentAgents.first.paymentagentLoginid, 'CR90000073');
      expect(paymentAgents.first.summary, 'nothgin');
      expect(paymentAgents.first.withdrawalCommission, '5');
    });

    test('Payment Agent Transfer Test', () async {
      final PaymentagentTransferResponse paymentAgentTransfer =
          await PaymentagentTransferResponse.transfer(
        const PaymentagentTransferRequest(
          amount: 1000,
          currency: 'USD',
          transferTo: 'CR100001',
        ),
      );

      // expect(
      //   paymentAgentTransfer.paymentagentTransfer,
      //   PaymentResult.dryrun,
      // );
      expect(paymentAgentTransfer.clientToFullName, 'John Doe');
      expect(paymentAgentTransfer.clientToLoginid, 'CR100001');
      expect(paymentAgentTransfer.transactionId, 45735309);
    });

    test('Payment Agent Withdraw Test', () async {
      final PaymentagentWithdrawResponse paymentAgentWithdraw =
          await PaymentagentWithdrawResponse.withdraw(
        const PaymentagentWithdrawRequest(
          amount: 1000,
          currency: 'USD',
          paymentagentLoginid: 'CR100001',
          verificationCode: 'verification_code',
        ),
      );

      // expect(
      //   paymentAgentWithdraw.paymentagentWithdraw,
      //   PaymentResult.withdrawalOrTransfer,
      // );
      expect(paymentAgentWithdraw.paymentagentName, 'John Doe');
      expect(paymentAgentWithdraw.transactionId, 45735309);
    });
  });
}
