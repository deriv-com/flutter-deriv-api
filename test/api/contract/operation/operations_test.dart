import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contract/models/history_spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/open_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/buy_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/update_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/cancel_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/api/contract/operation/price_proposal.dart';
import 'package:flutter_deriv_api/api/contract/operation/sell_contract.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  group('Contract operations group', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('Price proposal JSON parsing', () async {
      final PriceProposal priceProposal =
          await PriceProposal.getPriceForContract(
        request: const ProposalRequest(),
      );

      _checkPriceProposal(priceProposal);
    });

    test('Buy contract JSON parsing', () async {
      final BuyContract buyContract = await BuyContract.buy(const BuyRequest());

      _checkBuyContract(buyContract);

      final OpenContractModel openContractModel =
          await buyContract.getCurrentContractState();

      _checkOpenContractModel(openContractModel);
    });

    test('Sell contract JSON parsing', () async {
      final SellContract sellContract =
          await SellContract.sellContract(const SellRequest());

      _checkSellContract(sellContract);
    });

    test('Update contract JSON parsing', () async {
      final UpdateContract updateContract = await UpdateContract.updateContract(
        const ContractUpdateRequest(),
      );

      _checkUpdateContract(updateContract);
    });

    test('Contract update history JSON parsing', () async {
      final List<HistorySpotPriceModel> updateHistory =
          await UpdateContract.getContractUpdateHistory(
              const ContractUpdateHistoryRequest());

      final HistorySpotPriceModel firstUpdate = updateHistory.first;

      expect(firstUpdate.displayName, 'localized display name');
      expect(firstUpdate.orderAmount, 430.0);
      expect(firstUpdate.orderDate, getDateTime(1587744006));
      expect(firstUpdate.orderType, 'stop loss');
      expect(firstUpdate.value, '100.0');
    });

    test('Cancel contract JSON parsing', () async {
      final CancelContract cancelContract =
          await CancelContract.cancelContract(const CancelRequest());

      _checkCancelContract(cancelContract);
    });

    test('Buy proposal scenario', () async {
      try {
        final PriceProposal priceProposal =
            await PriceProposal.getPriceForContract(
          request: const ProposalRequest(
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
        _checkPriceProposal(priceProposal);

        final BuyContract boughtContract = await priceProposal.buy(price: 100);
        _checkBuyContract(boughtContract);

        _checkUpdateContract(await boughtContract.update());

        _checkSellContract(await boughtContract.sell());

        _checkCancelContract(await boughtContract.cancel());

        final OpenContractModel openContractModel =
            await boughtContract.getCurrentContractState();
        _checkOpenContractModel(openContractModel);

        print('buy scenario completed!');
      } on ContractOperationException catch (e) {
        print(e.message);
      }
    });
  });
}

void _checkCancelContract(CancelContract cancelContract) {
  expect(cancelContract.balanceAfter, 1200.0);
  expect(cancelContract.contractId, 2340843);
  expect(cancelContract.referenceId, 7323042);
  expect(cancelContract.soldFor, 1150.0);
  expect(cancelContract.transactionId, 453476);
}

void _checkUpdateContract(UpdateContract updateContract) {
  expect(updateContract.stopLoss.displayName, 'localized display name');
  expect(updateContract.stopLoss.orderAmount, 530.0);
  expect(updateContract.stopLoss.orderDate, getDateTime(1587544006));
  expect(updateContract.stopLoss.value, '120.0');
  
  expect(updateContract.takeProfit.displayName, 'localized display name');
  expect(updateContract.takeProfit.orderAmount, 430.0);
  expect(updateContract.takeProfit.orderDate, getDateTime(1587744006));
  expect(updateContract.takeProfit.value, '100.0');
}

void _checkSellContract(SellContract sellContract) {
  expect(sellContract.balanceAfter, 9706.5);
  expect(sellContract.contractId, 79939279308);
  expect(sellContract.referenceId, 2165326767);
  expect(sellContract.soldFor, 1200);
  expect(sellContract.transactionId, 159779308968);
}

void _checkBuyContract(BuyContract buyContract) {
  expect(buyContract.contractId, 79939279308);
  expect(buyContract.purchaseTime, getDateTime(1587528886));
  expect(
    buyContract.shortCode,
    'CALL_R_100_100_1587528886_1587528946_S10P_0',
  );
  expect(buyContract.buyPrice, 49.12);
}

void _checkPriceProposal(PriceProposal priceProposal) {
  expect(priceProposal.askPrice, 10);
  expect(priceProposal.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
  expect(priceProposal.dateStart, getDateTime(1586335719));
  expect(priceProposal.spotTime, getDateTime(1586335713));
  expect(priceProposal.spot, 9392.5);
}

void _checkOpenContractModel(OpenContractModel openContractModel) {
  expect(openContractModel.contractId, 79944933588);
  expect(openContractModel.payout, 50.0);
  expect(openContractModel.profit, 25.45);
  expect(openContractModel.profitPercentage, 103.67);
  expect(openContractModel.purchaseTime, getDateTime(1587533920));
  expect(openContractModel.contractType, 'CALL');
  expect(openContractModel.currency, 'USD');
  expect(openContractModel.auditDetails.contractEnd.first.tick, 1419.96);
  expect(openContractModel.auditDetails.contractEnd.first.epoch,
      getDateTime(1587533976));
  expect(openContractModel.underlying, 'R_100');
}
