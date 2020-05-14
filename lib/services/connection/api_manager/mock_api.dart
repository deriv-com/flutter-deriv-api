import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/basic_api/generated/api.helper.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/exceptions/api_manager_exception.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

import 'mock_data/account/authorize_response.dart';
import 'mock_data/account/set_account_currency_response.dart';
import 'mock_data/common/active_symbols_response.dart';
import 'mock_data/common/tick_response.dart';
import 'mock_data/contract/buy_contract_response.dart';
import 'mock_data/contract/cancel_response.dart';
import 'mock_data/contract/contract_for_response.dart';
import 'mock_data/contract/contract_update_history_response.dart';
import 'mock_data/contract/contract_update_response.dart';
import 'mock_data/contract/proposal_open_contract_response.dart';
import 'mock_data/contract/proposal_response.dart';
import 'mock_data/contract/sell_response.dart';
import 'mock_data/contract/transaction_response.dart';

/// Handle mock API calls
class MockAPI implements BaseAPI {
  static const int _responseDelayMilliseconds = 500;

  @override
  Future<Response> call({
    @required Request request,
  }) =>
      _getFutureResponse(request);

  @override
  Stream<Response> subscribe({
    @required Request request,
    RequestCompareFunction comparePredicate,
  }) =>
      _getStreamResponse(request);

  @override
  void addToChannel({Map<String, dynamic> request}) {}

  @override
  Future<void> close() async => true;

  Future<Response> _getFutureResponse(Request request) async =>
      Future<Response>.delayed(
        const Duration(milliseconds: _responseDelayMilliseconds),
        () => getResponseByMsgType(
          jsonDecode(_getResponse(request.msgType)),
        ),
      );

  Stream<Response> _getStreamResponse(Request request) =>
      Stream<Response>.periodic(
        const Duration(milliseconds: _responseDelayMilliseconds),
        (int computationCount) => getResponseByMsgType(
          jsonDecode(_getResponse(request.msgType)),
        ),
      );

  String _getResponse(String method) {
    switch (method) {
      case 'active_symbols':
        return activeSymbolsResponse;
      // case 'api_token':
      // case 'app_delete':
      // case 'app_get':
      // case 'app_list':
      // case 'app_markup_details':
      // case 'app_register':
      // case 'app_update':
      // case 'asset_index':
      case 'authorize':
        return authorizeResponse;
      // case 'balance':
      // case 'buy_contract_for_multiple_accounts':
      case 'buy':
        return buyContractResponse;
      case 'cancel':
        return cancelResponse;
      // case 'cashier':
      case 'contract_update_history':
        return contractUpdateHistoryResponse;
      case 'contract_update':
        return contractUpdateResponse;
      case 'contracts_for':
        return contractForResponse;
      // case 'copy_start':
      // case 'copy_stop':
      // case 'copytrading_list':
      // case 'copytrading_statistics':
      // case 'document_upload':
      // case 'exchange_rates':
      // case 'forget_all':
      // case 'forget':
      // case 'get_account_status':
      // case 'get_financial_assessment':
      // case 'get_limits':
      // case 'get_self_exclusion':
      // case 'get_settings':
      // case 'landing_company_details':
      // case 'landing_company':
      // case 'login_history':
      // case 'logout':
      // case 'mt5_deposit':
      // case 'mt5_get_settings':
      // case 'mt5_login_list':
      // case 'mt5_new_account':
      // case 'mt5_password_change':
      // case 'mt5_password_check':
      // case 'mt5_password_reset':
      // case 'mt5_withdrawal':
      // case 'new_account_maltainvest':
      // case 'new_account_real':
      // case 'new_account_virtual':
      // case 'oauth_apps':
      // case 'p2p_advert_create':
      // case 'p2p_advert_info':
      // case 'p2p_advert_list':
      // case 'p2p_advert_update':
      // case 'p2p_advertiser_adverts':
      // case 'p2p_advertiser_create':
      // case 'p2p_advertiser_info':
      // case 'p2p_advertiser_update':
      // case 'p2p_chat_create':
      // case 'p2p_order_cancel':
      // case 'p2p_order_confirm':
      // case 'p2p_order_create':
      // case 'p2p_order_info':
      // case 'p2p_order_list':
      // case 'paymentagent_list':
      // case 'paymentagent_transfer':
      // case 'paymentagent_withdraw':
      // case 'payout_currencies':
      // case 'ping':
      // case 'portfolio':
      // case 'profit_table':
      // case 'proposal_array':
      case 'proposal_open_contract':
        return proposalOpenContractResponse;
      case 'proposal':
        return proposalResponse;
      // case 'reality_check':
      // case 'residence_list':
      // case 'revoke_oauth_app':
      // case 'sell_contract_for_multiple_accounts':
      // case 'sell_expired':
      case 'sell':
        return sellResponse;
      case 'set_account_currency':
        return setAccountCurrencyResponse;
      // case 'set_financial_assessment':
      // case 'set_self_exclusion':
      // case 'set_settings':
      // case 'statement':
      // case 'states_list':
      // case 'history':
      case 'ticks':
        return tickResponse;
      // case 'time':
      // case 'tnc_approval':
      // case 'topup_virtual':
      // case 'trading_durations':
      // case 'trading_times':
      case 'transaction':
        return transactionResponse;
      // case 'transfer_between_accounts':
      // case 'verify_email':
      // case 'website_status':

      default:
        throw APIManagerException(
          message: 'message type \'$method\' not found.',
        );
    }
  }
}
