import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/contract/operation/price_proposal.dart';
import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';

part 'price_proposal_event.dart';

part 'price_proposal_state.dart';

class PriceProposalBloc extends Bloc<PriceProposalEvent, PriceProposalState> {
  PriceProposalBloc(this.availableContractsBloc) {
    availableContractsBloc.listen((AvailableContractsState state) {
      if (state is AvailableContractsLoaded) {
        add(SubscribeProposal(state.selectedContract));
      }
    });
  }

  AvailableContractsBloc availableContractsBloc;

  @override
  PriceProposalState get initialState => PriceProposalLoading();

  @override
  Stream<PriceProposalState> mapEventToState(
    PriceProposalEvent event,
  ) async* {
    if (event is SubscribeProposal) {
      yield PriceProposalLoading();

      await _unsubscribeProposal();

      _subscribeProposal(event).handleError((dynamic e) {
        if (e is ContractOperationException) {
          add(YieldError(e.message));
        } else {
          add(YieldError(e.toString()));
        }
      }).listen((PriceProposal proposal) {
        add(YieldProposalLoaded(proposal));
      });
    } else if (event is YieldProposalLoaded) {
      yield PriceProposalLoaded(event.proposal);
    } else if (event is YieldError) {
      yield PriceProposalError(event.message);
    }
  }

  Stream<PriceProposal> _subscribeProposal(SubscribeProposal event) =>
      PriceProposal.subscribePriceForContract(
        // ignore: missing_required_param
        ProposalRequest(
          amount: event.amount ?? 100,
          durationUnit: event.durationUnit ?? 's',
          duration: event?.duration ?? 10,
          basis: event?.basis ?? 'payout',
          currency: 'USD',
          contractType: event.contract.contractType,
          symbol: event.contract.underlyingSymbol,
        ),
      );

  Future<ForgetAll> _unsubscribeProposal() =>
      PriceProposal.unsubscribeAllProposal();

  @override
  Future<void> close() async {
    await _unsubscribeProposal();
    await super.close();
  }
}
