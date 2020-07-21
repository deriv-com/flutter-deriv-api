import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/contract/models/history_spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/sell_expired_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/cancel_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/api/contract/operation/open_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/price_proposal.dart';
import 'package:flutter_deriv_api/api/contract/operation/sell_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/update_contract.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(true));

  group('Contract Operations Group ->', () {
    test('Fetch Price Proposal Test', () async {
      final PriceProposal priceProposal =
          await PriceProposal.fetchPriceForContract(
        // ignore: missing_required_param
        const ProposalRequest(
          symbol: 'R_100',
          durationUnit: 'm',
          duration: 2,
          barrier: '+0.1',
          amount: 100,
          basis: 'payout',
          contractType: 'CALL',
          currency: 'USD',
        ),
      );

      expect(priceProposal.askPrice, 10);
      expect(priceProposal.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
      expect(priceProposal.dateStart, getDateTime(1586335719));
      expect(priceProposal.spotTime, getDateTime(1586335713));
      expect(priceProposal.spot, 9392.5);
      expect(priceProposal.payout, 20.33);
    });

    test('Price Proposal Subscription Test', () async {
      PriceProposal.subscribePriceForContract(
        // ignore: missing_required_param
        const ProposalRequest(
          symbol: 'R_100',
          durationUnit: 'm',
          duration: 2,
          barrier: '+0.1',
          amount: 100,
          basis: 'payout',
          contractType: 'CALL',
          currency: 'USD',
        ),
      ).take(1).listen(expectAsync1((PriceProposal priceProposal) {
        expect(priceProposal.askPrice, 10);
        expect(priceProposal.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
        expect(priceProposal.dateStart, getDateTime(1586335719));
        expect(priceProposal.spotTime, getDateTime(1586335713));
        expect(priceProposal.spot, 9392.5);
        expect(priceProposal.payout, 20.33);
      }));
    });

    test('Buy Contract Test', () async {
      final Contract buyContract = await Contract.buy(
        const BuyRequest(
          buy: '042922fe-5664-09e4-c3bf-b3bbe98f31db',
          price: 100.0,
        ),
      );
      expect(buyContract.contractId, 79939279308);
      expect(buyContract.purchaseTime, getDateTime(1587528886));
      expect(buyContract.dateStart, getDateTime(1587528886));
      expect(
        buyContract.shortCode,
        'CALL_R_100_100_1587528886_1587528946_S10P_0',
      );
      expect(buyContract.buyPrice, 49.12);
      expect(buyContract.transactionId, 159779308968);

      final OpenContract openContract = await buyContract.fetchState();
      expect(openContract.contractId, 79944933588);
      expect(openContract.payout, 50.0);
      expect(openContract.profit, 25.45);
      expect(openContract.profitPercentage, 103.67);
      expect(openContract.purchaseTime, getDateTime(1587533920));
      expect(openContract.dateStart, getDateTime(1587533920));
      expect(openContract.contractType, 'CALL');
      expect(openContract.currency, 'USD');
      expect(openContract.auditDetails.contractEnd.first.tick, 1419.96);
      expect(openContract.auditDetails.contractEnd.first.epoch,
          getDateTime(1587533976));
      expect(openContract.underlying, 'R_100');
      expect(openContract.barrier, '1417.75');
      expect(openContract.barrierCount, 1.0);
      expect(openContract.bidPrice, 50.0);
      expect(openContract.currentSpot, 1419.53);
      expect(openContract.displayName, 'Volatility 100 Index');
      expect(openContract.exitTick, 1419.53);
      expect(openContract.isExpired, true);
      expect(openContract.isForwardStarting, false);
      expect(openContract.isIntraday, true);
      expect(openContract.isSold, false);
      expect(
          openContract.shortCode, 'CALL_R_100_50_1587533920_1587533980_S10P_0');
      expect(openContract.status, ContractStatus.open);

      buyContract
          .subscribeState()
          .take(1)
          .listen(expectAsync1((OpenContract openContract) {
        expect(openContract.contractId, 79944933588);
        expect(openContract.payout, 50.0);
        expect(openContract.profit, 25.45);
        expect(openContract.profitPercentage, 103.67);
        expect(openContract.purchaseTime, getDateTime(1587533920));
        expect(openContract.dateStart, getDateTime(1587533920));
        expect(openContract.contractType, 'CALL');
        expect(openContract.currency, 'USD');
        expect(openContract.auditDetails.contractEnd.first.tick, 1419.96);
        expect(openContract.auditDetails.contractEnd.first.epoch,
            getDateTime(1587533976));
        expect(openContract.underlying, 'R_100');
        expect(openContract.barrier, '1417.75');
        expect(openContract.barrierCount, 1.0);
        expect(openContract.bidPrice, 50.0);
        expect(openContract.currentSpot, 1419.53);
        expect(openContract.displayName, 'Volatility 100 Index');
        expect(openContract.exitTick, 1419.53);
        expect(openContract.isExpired, true);
        expect(openContract.isForwardStarting, false);
        expect(openContract.isIntraday, true);
        expect(openContract.isSold, false);
        expect(openContract.shortCode,
            'CALL_R_100_50_1587533920_1587533980_S10P_0');
        expect(openContract.status, ContractStatus.open);

        expect(
          openContract.subscriptionInformation.id,
          '042922fe-5664-09e4-c3bf-b3bbcf8f31db',
        );
      }));
    });

    test('Sell Contract Test', () async {
      final SellContract sellContract = await SellContract.sellContract(
        const SellRequest(
          sell: 79939279308,
          price: 100.0,
        ),
      );

      expect(sellContract.balanceAfter, 9706.5);
      expect(sellContract.contractId, 79939279308);
      expect(sellContract.referenceId, 2165326767);
      expect(sellContract.soldFor, 1200);
      expect(sellContract.transactionId, 159779308968);
    });

    test('Update Contract Test', () async {
      final UpdateContract updateContract = await UpdateContract.updateContract(
        const ContractUpdateRequest(
          contractId: 79939279308,
          limitOrder: <String, dynamic>{'stop_loss': 120, 'take_profit': 100.0},
        ),
      );

      expect(updateContract.stopLoss.displayName, 'localized display name');
      expect(updateContract.stopLoss.orderAmount, 530.0);
      expect(updateContract.stopLoss.orderDate, getDateTime(1587544006));
      expect(updateContract.stopLoss.value, '120.0');

      expect(updateContract.takeProfit.displayName, 'localized display name');
      expect(updateContract.takeProfit.orderAmount, 430.0);
      expect(updateContract.takeProfit.orderDate, getDateTime(1587744006));
      expect(updateContract.takeProfit.value, '100.0');
    });

    test('Fetch Contract Update History Test', () async {
      final List<HistorySpotPriceModel> updateHistory =
          await UpdateContract.fetchContractUpdateHistory(
        const ContractUpdateHistoryRequest(
          contractId: 79939279308,
        ),
      );

      final HistorySpotPriceModel firstUpdate = updateHistory.first;

      expect(firstUpdate.displayName, 'localized display name');
      expect(firstUpdate.orderAmount, 430.0);
      expect(firstUpdate.orderDate, getDateTime(1587744006));
      expect(firstUpdate.orderType, 'stop loss');
      expect(firstUpdate.value, '100.0');
    });

    test('Cancel Contract Test', () async {
      final CancelContract cancelContract = await CancelContract.cancelContract(
        const CancelRequest(
          cancel: 79939279308,
        ),
      );

      expect(cancelContract.balanceAfter, 1200.0);
      expect(cancelContract.contractId, 2340843);
      expect(cancelContract.referenceId, 7323042);
      expect(cancelContract.soldFor, 1150.0);
      expect(cancelContract.transactionId, 453476);
    });

    test('Buy Proposal Scenario Test', () async {
      try {
        final PriceProposal priceProposal =
            await PriceProposal.fetchPriceForContract(
          // ignore: missing_required_param
          const ProposalRequest(
            symbol: 'R_100',
            durationUnit: 'm',
            duration: 2,
            barrier: '+0.1',
            amount: 100,
            basis: 'payout',
            contractType: 'CALL',
            currency: 'USD',
            cancellation: 'MULTUP',
          ),
        );
        expect(priceProposal.askPrice, 10);
        expect(priceProposal.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
        expect(priceProposal.dateStart, getDateTime(1586335719));
        expect(priceProposal.spotTime, getDateTime(1586335713));
        expect(priceProposal.spot, 9392.5);

        final Contract boughtContract = await priceProposal.buy(price: 100);
        expect(boughtContract.contractId, 79939279308);
        expect(boughtContract.purchaseTime, getDateTime(1587528886));
        expect(boughtContract.dateStart, getDateTime(1587528886));
        expect(
          boughtContract.shortCode,
          'CALL_R_100_100_1587528886_1587528946_S10P_0',
        );
        expect(boughtContract.buyPrice, 49.12);
        expect(boughtContract.transactionId, 159779308968);

        final UpdateContract updateContract = await boughtContract.update();
        expect(updateContract.stopLoss.displayName, 'localized display name');
        expect(updateContract.stopLoss.orderAmount, 530.0);
        expect(updateContract.stopLoss.orderDate, getDateTime(1587544006));
        expect(updateContract.stopLoss.value, '120.0');

        expect(updateContract.takeProfit.displayName, 'localized display name');
        expect(updateContract.takeProfit.orderAmount, 430.0);
        expect(updateContract.takeProfit.orderDate, getDateTime(1587744006));
        expect(updateContract.takeProfit.value, '100.0');

        final SellContract sellContract = await boughtContract.sell();
        expect(sellContract.balanceAfter, 9706.5);
        expect(sellContract.contractId, 79939279308);
        expect(sellContract.referenceId, 2165326767);
        expect(sellContract.soldFor, 1200);
        expect(sellContract.transactionId, 159779308968);

        final CancelContract cancelContract = await boughtContract.cancel();
        expect(cancelContract.balanceAfter, 1200.0);
        expect(cancelContract.contractId, 2340843);
        expect(cancelContract.referenceId, 7323042);
        expect(cancelContract.soldFor, 1150.0);
        expect(cancelContract.transactionId, 453476);

        final OpenContract openContract = await boughtContract.fetchState();
        expect(openContract.contractId, 79944933588);
        expect(openContract.payout, 50.0);
        expect(openContract.profit, 25.45);
        expect(openContract.profitPercentage, 103.67);
        expect(openContract.purchaseTime, getDateTime(1587533920));
        expect(openContract.contractType, 'CALL');
        expect(openContract.currency, 'USD');
        expect(openContract.auditDetails.contractEnd.first.tick, 1419.96);
        expect(openContract.auditDetails.contractEnd.first.epoch,
            getDateTime(1587533976));
        expect(openContract.underlying, 'R_100');
        expect(openContract.barrier, '1417.75');
        expect(openContract.barrierCount, 1.0);
        expect(openContract.bidPrice, 50.0);
        expect(openContract.currentSpot, 1419.53);
        expect(openContract.displayName, 'Volatility 100 Index');
        expect(openContract.exitTick, 1419.53);
        expect(openContract.isExpired, true);
        expect(openContract.isForwardStarting, false);
        expect(openContract.isIntraday, true);
        expect(openContract.isSold, false);
        expect(openContract.shortCode,
            'CALL_R_100_50_1587533920_1587533980_S10P_0');
        expect(openContract.status, ContractStatus.open);
      } on ContractOperationException catch (e) {
        print(e.message);
      }
    });

    test('Open Contract Subscription Test', () {
      OpenContract.subscribeContractState(
        const ProposalOpenContractRequest(contractId: 79944933588),
      ).take(1).listen(
        expectAsync1((OpenContract openContract) {
          expect(openContract.contractId, 79944933588);
          expect(openContract.payout, 50.0);
          expect(openContract.profit, 25.45);
          expect(openContract.profitPercentage, 103.67);
          expect(openContract.purchaseTime, getDateTime(1587533920));
          expect(openContract.contractType, 'CALL');
          expect(openContract.currency, 'USD');
          expect(openContract.auditDetails.contractEnd.first.tick, 1419.96);
          expect(openContract.auditDetails.contractEnd.first.epoch,
              getDateTime(1587533976));
          expect(openContract.underlying, 'R_100');
          expect(openContract.barrier, '1417.75');
          expect(openContract.barrierCount, 1.0);
          expect(openContract.bidPrice, 50.0);
          expect(openContract.currentSpot, 1419.53);
          expect(openContract.displayName, 'Volatility 100 Index');
          expect(openContract.exitTick, 1419.53);
          expect(openContract.isExpired, true);
          expect(openContract.isForwardStarting, false);
          expect(openContract.isIntraday, true);
          expect(openContract.isSold, false);
          expect(openContract.shortCode,
              'CALL_R_100_50_1587533920_1587533980_S10P_0');
          expect(openContract.status, ContractStatus.open);

          expect(
            openContract.subscriptionInformation.id,
            '042922fe-5664-09e4-c3bf-b3bbcf8f31db',
          );
        }),
      );
    });

    test('Sell Expired Contracts Test', () async {
      final SellExpiredContractModel sellExpiredContract =
          await SellContract.sellExpiredContracts();

      expect(sellExpiredContract.count, 2);
    });
  });
}
