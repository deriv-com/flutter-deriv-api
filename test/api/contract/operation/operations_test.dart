import 'package:flutter_deriv_api/api/response/cancel_response_result.dart';
import 'package:flutter_deriv_api/api/response/contract_update_history_response_result.dart';
import 'package:flutter_deriv_api/api/response/proposal_response_result.dart';
import 'package:flutter_deriv_api/api/response/sell_expired_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/buy_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/cancel_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/contract_update_history_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/contract_update_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_open_contract_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/sell_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/buy_response_result.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/api/response/proposal_open_contract_response_result.dart';
import 'package:flutter_deriv_api/api/response/sell_response_result.dart';
import 'package:flutter_deriv_api/api/response/contract_update_response_result.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Contract Operations Group ->', () {
    test('Fetch Price Proposal Test', () async {
      final ProposalResponse priceProposal =
          await ProposalResponse.fetchPriceForContract(
        // ignore: missing_required_param
        const ProposalRequest(
          symbol: 'frxUSDJPY',
          durationUnit: 'm',
          duration: 2,
          barrier: '+0.1',
          amount: 100,
          basis: 'payout',
          contractType: 'MULTDOWN',
          currency: 'USD',
          limitOrder: null,
          cancellation: null,
        ),
      );

      expect(priceProposal.proposal?.askPrice, 10);
      expect(
          priceProposal.proposal?.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
      expect(priceProposal.proposal?.dateStart, getDateTime(1586335719));
      expect(priceProposal.proposal?.spotTime, getDateTime(1586335713));
      expect(priceProposal.proposal?.spot, 9392.5);
      expect(priceProposal.proposal?.payout, 20.33);
    });

    test('Price Proposal Subscription Test', () async {
      ProposalResponse.subscribePriceForContract(
        // ignore: missing_required_param
        const ProposalRequest(
          symbol: 'frxUSDJPY',
          durationUnit: 'm',
          duration: 2,
          barrier: '+0.1',
          amount: 100,
          basis: 'payout',
          contractType: 'MULTDOWN',
          currency: 'USD',
          limitOrder: null,
          cancellation: null,
        ),
      ).listen(expectAsync1((ProposalResponse? priceProposal) {
        expect(priceProposal?.proposal?.askPrice, 10);
        expect(priceProposal?.proposal?.id,
            '042922fe-5664-09e4-c3bf-b3bbe98f31db');
        expect(priceProposal?.proposal?.dateStart, getDateTime(1586335719));
        expect(priceProposal?.proposal?.spotTime, getDateTime(1586335713));
        expect(priceProposal?.proposal?.spot, 9392.5);
        expect(priceProposal?.proposal?.payout, 20.33);
      }));
    });

    test('Buy Contract Test', () async {
      final BuyResponse buyContract = await BuyResponse.buyMethod(
        const BuyRequest(
          buy: '042922fe-5664-09e4-c3bf-b3bbe98f31db',
          price: 100.0,
        ),
      );
      expect(buyContract.buy?.contractId, 79939279308);
      expect(buyContract.buy?.purchaseTime, getDateTime(1587528886));
      expect(buyContract.buy?.startTime, getDateTime(1587528886));
      expect(
        buyContract.buy?.shortcode,
        'MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00',
      );
      expect(buyContract.buy?.buyPrice, 49.12);
      expect(buyContract.buy?.transactionId, 159779308968);

      final ProposalOpenContractResponse openContract =
          await buyContract.fetchState();
      expect(openContract.proposalOpenContract?.contractId, 79944933588);
      expect(openContract.proposalOpenContract?.payout, 50.0);
      expect(openContract.proposalOpenContract?.profit, 25.45);
      expect(openContract.proposalOpenContract?.profitPercentage, 103.67);
      expect(openContract.proposalOpenContract?.purchaseTime,
          getDateTime(1587533920));
      expect(openContract.proposalOpenContract?.dateStart,
          getDateTime(1587533920));
      // expect(openContract.proposalOpenContract.contractType, ContractType.multDown);
      expect(openContract.proposalOpenContract?.currency, 'USD');
      expect(
          openContract
              .proposalOpenContract?.auditDetails?.contractEnd?.first.tick,
          1419.96);
      expect(
        openContract
            .proposalOpenContract?.auditDetails?.contractEnd?.first.epoch,
        getDateTime(1587533976),
      );
      expect(openContract.proposalOpenContract?.underlying, 'frxUSDJPY');
      expect(openContract.proposalOpenContract?.barrier, '1417.75');
      expect(openContract.proposalOpenContract?.barrierCount, 1.0);
      expect(openContract.proposalOpenContract?.bidPrice, 50.0);
      expect(openContract.proposalOpenContract?.currentSpot, 1419.53);
      expect(openContract.proposalOpenContract?.displayName, 'USD/JPY');
      expect(openContract.proposalOpenContract?.exitTick, 1419.53);
      expect(openContract.proposalOpenContract?.isExpired, true);
      expect(openContract.proposalOpenContract?.isForwardStarting, false);
      expect(openContract.proposalOpenContract?.isIntraday, true);
      expect(openContract.proposalOpenContract?.isSold, false);
      expect(openContract.proposalOpenContract?.multiplier, 100);
      expect(
        openContract.proposalOpenContract?.shortcode,
        'MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00',
      );
      expect(openContract.proposalOpenContract?.status, StatusEnum.open);

      buyContract
          .subscribeState()
          .listen(expectAsync1((ProposalOpenContractResponse? openContract) {
        expect(openContract?.proposalOpenContract?.contractId, 79944933588);
        expect(openContract?.proposalOpenContract?.payout, 50.0);
        expect(openContract?.proposalOpenContract?.profit, 25.45);
        expect(openContract?.proposalOpenContract?.profitPercentage, 103.67);
        expect(openContract?.proposalOpenContract?.purchaseTime,
            getDateTime(1587533920));
        expect(openContract?.proposalOpenContract?.dateStart,
            getDateTime(1587533920));
        //expect(openContract.proposalOpenContract.contractType, ContractType.multDown);
        expect(openContract?.proposalOpenContract?.currency, 'USD');
        expect(
            openContract
                ?.proposalOpenContract?.auditDetails?.contractEnd?.first.tick,
            1419.96);
        expect(
          openContract
              ?.proposalOpenContract?.auditDetails?.contractEnd?.first.epoch,
          getDateTime(1587533976),
        );
        expect(openContract?.proposalOpenContract?.underlying, 'frxUSDJPY');
        expect(openContract?.proposalOpenContract?.barrier, '1417.75');
        expect(openContract?.proposalOpenContract?.barrierCount, 1.0);
        expect(openContract?.proposalOpenContract?.bidPrice, 50.0);
        expect(openContract?.proposalOpenContract?.currentSpot, 1419.53);
        expect(openContract?.proposalOpenContract?.displayName, 'USD/JPY');
        expect(openContract?.proposalOpenContract?.exitTick, 1419.53);
        expect(openContract?.proposalOpenContract?.isExpired, true);
        expect(openContract?.proposalOpenContract?.isForwardStarting, false);
        expect(openContract?.proposalOpenContract?.isIntraday, true);
        expect(openContract?.proposalOpenContract?.isSold, false);
        expect(openContract?.proposalOpenContract?.multiplier, 100);
        expect(
          openContract?.proposalOpenContract?.shortcode,
          'MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00',
        );
        expect(openContract?.proposalOpenContract?.status, StatusEnum.open);

        expect(
          openContract?.subscription?.id,
          '042922fe-5664-09e4-c3bf-b3bbcf8f31db',
        );
      }));
    });

    test('Sell Contract Test', () async {
      final SellResponse sellContract = await SellResponse.sellContract(
        const SellRequest(
          sell: 79939279308,
          price: 100.0,
        ),
      );

      expect(sellContract.sell?.balanceAfter, 9706.5);
      expect(sellContract.sell?.contractId, 79939279308);
      expect(sellContract.sell?.referenceId, 2165326767);
      expect(sellContract.sell?.soldFor, 1200);
      expect(sellContract.sell?.transactionId, 159779308968);
    });

    test('Update Contract Test', () async {
      final ContractUpdateResponse updateContract =
          await ContractUpdateResponse.updateContract(
        const ContractUpdateRequest(
          contractId: 79939279308,
          limitOrder: <String, dynamic>{'stop_loss': 120, 'take_profit': 100.0},
        ),
      );

      expect(updateContract.contractUpdate?.stopLoss?.displayName,
          'localized display name');
      expect(updateContract.contractUpdate?.stopLoss?.orderAmount, 530.0);
      expect(updateContract.contractUpdate?.stopLoss?.orderDate,
          getDateTime(1587544006));
      expect(updateContract.contractUpdate?.stopLoss?.value, '120.0');

      expect(updateContract.contractUpdate?.takeProfit?.displayName,
          'localized display name');
      expect(updateContract.contractUpdate?.takeProfit?.orderAmount, 430.0);
      expect(updateContract.contractUpdate?.takeProfit?.orderDate,
          getDateTime(1587744006));
      expect(updateContract.contractUpdate?.takeProfit?.value, '100.0');
    });

    test('Fetch Contract Update History Test', () async {
      final ContractUpdateHistoryResponse updateHistory =
          await ContractUpdateHistoryResponse.fetchContractUpdateHistory(
        const ContractUpdateHistoryRequest(
          contractId: 79939279308,
        ),
      );

      final ContractUpdateHistoryItem firstUpdate =
          updateHistory.contractUpdateHistory!.first;

      expect(firstUpdate.displayName, 'localized display name');
      expect(firstUpdate.orderAmount, '430.0');
      expect(firstUpdate.orderDate, getDateTime(1587744006));
      expect(firstUpdate.orderType, 'stop loss');
      expect(firstUpdate.value, '100.0');
    });

    test('Cancel Contract Test', () async {
      final CancelResponse cancelContract = await CancelResponse.cancelContract(
        const CancelRequest(
          cancel: 79939279308,
        ),
      );

      expect(cancelContract.cancel?.balanceAfter, 1200.0);
      expect(cancelContract.cancel?.contractId, 2340843);
      expect(cancelContract.cancel?.referenceId, 7323042);
      expect(cancelContract.cancel?.soldFor, 1150.0);
      expect(cancelContract.cancel?.transactionId, 453476);
    });

    test('Buy Proposal Scenario Test', () async {
      final ProposalResponse priceProposal =
          await ProposalResponse.fetchPriceForContract(
        // ignore: missing_required_param
        const ProposalRequest(
          limitOrder: <String, dynamic>{},
          symbol: 'frxUSDJPY',
          durationUnit: 'm',
          duration: 2,
          barrier: '+0.1',
          amount: 100,
          basis: 'payout',
          contractType: 'MULTDOWM',
          currency: 'USD',
          cancellation: 'MULTUP',
        ),
      );
      expect(priceProposal.proposal?.askPrice, 10);
      expect(
          priceProposal.proposal?.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
      expect(priceProposal.proposal?.dateStart, getDateTime(1586335719));
      expect(priceProposal.proposal?.spotTime, getDateTime(1586335713));
      expect(priceProposal.proposal?.spot, 9392.5);

      final BuyResponse boughtContract = await priceProposal.buy(price: 100);
      expect(boughtContract.buy?.contractId, 79939279308);
      expect(boughtContract.buy?.purchaseTime, getDateTime(1587528886));
      expect(boughtContract.buy?.startTime, getDateTime(1587528886));
      expect(
        boughtContract.buy?.shortcode,
        'MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00',
      );
      expect(boughtContract.buy?.buyPrice, 49.12);
      expect(boughtContract.buy?.transactionId, 159779308968);

      final ContractUpdateResponse updateContract =
          await boughtContract.update();
      expect(updateContract.contractUpdate?.stopLoss?.displayName,
          'localized display name');
      expect(updateContract.contractUpdate?.stopLoss?.orderAmount, 530.0);
      expect(updateContract.contractUpdate?.stopLoss?.orderDate,
          getDateTime(1587544006));
      expect(updateContract.contractUpdate?.stopLoss?.value, '120.0');

      expect(updateContract.contractUpdate?.takeProfit?.displayName,
          'localized display name');
      expect(updateContract.contractUpdate?.takeProfit?.orderAmount, 430.0);
      expect(updateContract.contractUpdate?.takeProfit?.orderDate,
          getDateTime(1587744006));
      expect(updateContract.contractUpdate?.takeProfit?.value, '100.0');

      final SellResponse sellContract = await boughtContract.sell();
      expect(sellContract.sell?.balanceAfter, 9706.5);
      expect(sellContract.sell?.contractId, 79939279308);
      expect(sellContract.sell?.referenceId, 2165326767);
      expect(sellContract.sell?.soldFor, 1200);
      expect(sellContract.sell?.transactionId, 159779308968);

      final CancelResponse cancelContract = await boughtContract.cancel();
      expect(cancelContract.cancel?.balanceAfter, 1200.0);
      expect(cancelContract.cancel?.contractId, 2340843);
      expect(cancelContract.cancel?.referenceId, 7323042);
      expect(cancelContract.cancel?.soldFor, 1150.0);
      expect(cancelContract.cancel?.transactionId, 453476);

      final ProposalOpenContractResponse openContract =
          await boughtContract.fetchState();
      expect(openContract.proposalOpenContract?.contractId, 79944933588);
      expect(openContract.proposalOpenContract?.payout, 50.0);
      expect(openContract.proposalOpenContract?.profit, 25.45);
      expect(openContract.proposalOpenContract?.profitPercentage, 103.67);
      expect(openContract.proposalOpenContract?.purchaseTime,
          getDateTime(1587533920));
      // expect(openContract.proposalOpenContract.contractType, ContractType.multDown);
      expect(openContract.proposalOpenContract?.currency, 'USD');
      expect(
          openContract
              .proposalOpenContract?.auditDetails?.contractEnd?.first.tick,
          1419.96);
      expect(
        openContract
            .proposalOpenContract?.auditDetails?.contractEnd?.first.epoch,
        getDateTime(1587533976),
      );
      expect(openContract.proposalOpenContract?.underlying, 'frxUSDJPY');
      expect(openContract.proposalOpenContract?.barrier, '1417.75');
      expect(openContract.proposalOpenContract?.barrierCount, 1.0);
      expect(openContract.proposalOpenContract?.bidPrice, 50.0);
      expect(openContract.proposalOpenContract?.currentSpot, 1419.53);
      expect(openContract.proposalOpenContract?.displayName, 'USD/JPY');
      expect(openContract.proposalOpenContract?.exitTick, 1419.53);
      expect(openContract.proposalOpenContract?.isExpired, true);
      expect(openContract.proposalOpenContract?.isForwardStarting, false);
      expect(openContract.proposalOpenContract?.isIntraday, true);
      expect(openContract.proposalOpenContract?.isSold, false);
      expect(openContract.proposalOpenContract?.multiplier, 100);
      expect(
        openContract.proposalOpenContract?.shortcode,
        'MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00',
      );
      expect(openContract.proposalOpenContract?.status, StatusEnum.open);
    });

    test('Open Contract Subscription Test', () {
      ProposalOpenContractResponse.subscribeContractState(
        const ProposalOpenContractRequest(contractId: 79944933588),
      ).listen(
        expectAsync1((ProposalOpenContractResponse? openContract) {
          expect(openContract?.proposalOpenContract?.contractId, 79944933588);
          expect(openContract?.proposalOpenContract?.payout, 50.0);
          expect(openContract?.proposalOpenContract?.profit, 25.45);
          expect(openContract?.proposalOpenContract?.profitPercentage, 103.67);
          expect(
            openContract?.proposalOpenContract?.purchaseTime,
            getDateTime(1587533920),
          );
          // expect(openContract.proposalOpenContract.contractType, ContractType.multDown);
          expect(openContract?.proposalOpenContract?.currency, 'USD');
          expect(
              openContract
                  ?.proposalOpenContract?.auditDetails?.contractEnd?.first.tick,
              1419.96);
          expect(
            openContract
                ?.proposalOpenContract?.auditDetails?.contractEnd?.first.epoch,
            getDateTime(1587533976),
          );
          expect(openContract?.proposalOpenContract?.underlying, 'frxUSDJPY');
          expect(openContract?.proposalOpenContract?.barrier, '1417.75');
          expect(openContract?.proposalOpenContract?.barrierCount, 1.0);
          expect(openContract?.proposalOpenContract?.bidPrice, 50.0);
          expect(openContract?.proposalOpenContract?.currentSpot, 1419.53);
          expect(openContract?.proposalOpenContract?.displayName, 'USD/JPY');
          expect(openContract?.proposalOpenContract?.exitTick, 1419.53);
          expect(openContract?.proposalOpenContract?.isExpired, true);
          expect(openContract?.proposalOpenContract?.isForwardStarting, false);
          expect(openContract?.proposalOpenContract?.isIntraday, true);
          expect(openContract?.proposalOpenContract?.isSold, false);
          expect(openContract?.proposalOpenContract?.multiplier, 100);
          expect(
            openContract?.proposalOpenContract?.shortcode,
            'MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00',
          );
          expect(openContract?.proposalOpenContract?.status, StatusEnum.open);
        }),
      );
    });

    test('Sell Expired Contracts Test', () async {
      final SellExpiredResponse sellExpiredContract =
          await SellResponse.sellExpiredContracts();

      expect(sellExpiredContract.sellExpired?.count, 2);
    });
  });
}
