import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/api/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/models/buy_contract_model.dart';
import 'package:flutter_deriv_api/api/models/price_proposal_model.dart';
import 'package:flutter_deriv_api/api/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/api/contracts/operations/buy_contract.dart';
import 'package:flutter_deriv_api/api/contracts/operations/exceptions/contract_operations_exception.dart';

/// Implementation of [PriceProposalModel]
class PriceProposal extends PriceProposalModel {
  /// Initializes
  PriceProposal({
    double askPrice,
    CancellationInfoModel cancellation,
    double commission,
    DateTime dateStart,
    String displayValue,
    String id,
    LimitOrderModel limitOrder,
    String longcode,
    int multiplier,
    double payout,
    double spot,
    DateTime spotTime,
  }) : super(
          askPrice,
          cancellation,
          commission,
          dateStart,
          displayValue,
          id,
          limitOrder,
          longcode,
          multiplier,
          payout,
          spot,
          spotTime,
        );

  /// From Json
  factory PriceProposal.fromJson(Map<String, dynamic> json) => PriceProposal(
        askPrice:
            json['ask_price'] == null ? null : json['ask_price'].toDouble(),
        cancellation: json['cancellation'] == null
            ? null
            : CancellationInfoModel.fromJson(json['cancellation']),
        commission: json['commission'],
        dateStart:
            json['date_start'] == null ? null : getDateTime(json['date_start']),
        displayValue: json['display_value'],
        id: json['id'],
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrderModel.fromJson(json['limit_order']),
        longcode: json['longcode'],
        multiplier: json['multiplier'],
        payout: json['payout'].toDouble(),
        spot: json['spot'],
        spotTime:
            json['spot_time'] == null ? null : getDateTime(json['spot_time']),
      );

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Gets the price proposal for contract
  /// For parameters information refer to [ProposalRequest]
  static Future<PriceProposal> getPriceForContract({
    double amount = 100,
    String barrier,
    String basis = 'payout',
    String contractType = 'CALL',
    String currency = 'USD',
    String symbol,
    DateTime dateExpiry,
    String durationUnit = 's',
    int duration = 60,
  }) async {
    final ProposalResponse proposalResponse = await _api.call(
      request: ProposalRequest(
        amount: amount,
        barrier: barrier,
        basis: basis,
        currency: currency,
        contractType: contractType,
        symbol: symbol,
        dateExpiry: dateExpiry == null
            ? null
            : dateExpiry.millisecondsSinceEpoch ~/ 1000,
        durationUnit: durationUnit,
        duration: duration,
      ),
    );

    if (proposalResponse.error != null) {
      throw ContractOperationException(
          message: proposalResponse.error['message']);
    }

    return PriceProposal.fromJson(proposalResponse.proposal);
  }

  /// Buy this proposal contract
  Future<BuyContractModel> buy({double price}) async {
    final BuyResponse buyResponse = await _api.call(
      request: BuyRequest(
        buy: id,
        price: price,
      ),
    );

    if (buyResponse.error != null) {
      throw ContractOperationException(message: buyResponse.error['message']);
    }

    return BuyContract.fromJson(buyResponse.buy);
  }

  /// Clone a new instance
  PriceProposal copyWith({
    double askPrice,
    CancellationInfoModel cancellation,
    double commission,
    int dateStart,
    String displayValue,
    String id,
    LimitOrderModel limitOrder,
    String longcode,
    int multiplier,
    double payout,
    double spot,
    DateTime spotTime,
  }) =>
      PriceProposal(
        askPrice: askPrice ?? this.askPrice,
        cancellation: cancellation ?? this.cancellation,
        commission: commission ?? this.commission,
        dateStart: dateStart ?? this.dateStart,
        displayValue: displayValue ?? this.displayValue,
        id: id ?? this.id,
        limitOrder: limitOrder ?? this.limitOrder,
        longcode: longcode ?? this.longcode,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        spot: spot ?? this.spot,
        spotTime: spotTime ?? this.spotTime,
      );
}
