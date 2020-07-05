import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/contract/operation/price_proposal.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

import '../available_contracts/available_contracts_bloc.dart';

part 'price_proposal_event.dart';
part 'price_proposal_state.dart';

/// PriceProposalBloc
class PriceProposalBloc extends Bloc<PriceProposalEvent, PriceProposalState> {
  ///Initializes
  PriceProposalBloc(AvailableContractsBloc availableContractsBloc)
      : super(PriceProposalLoading()) {
    availableContractsBloc.listen((AvailableContractsState state) {
      if (state is AvailableContractsLoaded) {
        add(SubscribeProposal(state.selectedContract));
      }
    });
  }

  @override
  Stream<PriceProposalState> mapEventToState(
    PriceProposalEvent event,
  ) async* {
    if (event is SubscribeProposal) {
      yield PriceProposalLoading();

      await _unsubscribeProposal();

      _subscribeProposal(event)
          .handleError((dynamic error) => error is ContractOperationException
              ? add(YieldError(error.message))
              : add(YieldError(error.toString())))
          .listen(
              (PriceProposal proposal) => add(YieldProposalLoaded(proposal)));
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
          amount: event?.amount,
          durationUnit: event?.durationUnit,
          duration: event?.duration,
          basis: event?.basis,
          currency: 'USD',
          contractType: event?.contract?.contractType,
          symbol: event?.contract?.underlyingSymbol,
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
