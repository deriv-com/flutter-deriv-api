// ignore_for_file: deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/contracts_for_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/proposal_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

import '../available_contracts/available_contracts_bloc.dart';

part 'price_proposal_event.dart';
part 'price_proposal_state.dart';

/// PriceProposalBloc
class PriceProposalBloc extends Bloc<PriceProposalEvent, PriceProposalState> {
  ///Initializes
  PriceProposalBloc(AvailableContractsBloc availableContractsBloc)
      : super(PriceProposalLoading()) {
    availableContractsBloc.stream.listen((AvailableContractsState state) {
      if (state is AvailableContractsLoaded) {
        add(SubscribeProposal(state.selectedContract));
      }
    });

    on<SubscribeProposal>(
        (SubscribeProposal event, Emitter<PriceProposalState> emit) =>
            _handleSubscribeProposal(event, emit));

    on<YieldProposalLoaded>(
        (YieldProposalLoaded event, Emitter<PriceProposalState> emit) =>
            emit(PriceProposalLoaded(event.proposal.proposal)));

    on<YieldError>((YieldError event, Emitter<PriceProposalState> emit) =>
        emit(PriceProposalError(event.message)));
  }

  Future<void> _handleSubscribeProposal(
    SubscribeProposal event,
    Emitter<PriceProposalState> emit,
  ) async {
    emit(PriceProposalLoading());

    await _unsubscribeProposal();

    _subscribeProposal(event)
        .handleError((dynamic error) => error is ContractOperationException
            ? add(YieldError(error.message))
            : add(YieldError(error.toString())))
        .listen((ProposalResponse? proposal) =>
            add(YieldProposalLoaded(proposal!)));
  }

  Stream<ProposalResponse?> _subscribeProposal(SubscribeProposal event) =>
      ProposalResponse.subscribePriceForContract(
        // ignore: missing_required_param
        ProposalRequest(
          amount: event.amount,
          durationUnit: event.durationUnit,
          duration: event.duration,
          basis: event.basis,
          currency: 'USD',
          contractType: event.contract?.contractType,
          symbol: event.contract?.underlyingSymbol,
          limitOrder: null,
          cancellation: null,
        ),
      );

  Future<ForgetAllResponse> _unsubscribeProposal() =>
      ProposalResponse.unsubscribeAllProposal();

  @override
  Future<void> close() async {
    await _unsubscribeProposal();

    await super.close();
  }
}
