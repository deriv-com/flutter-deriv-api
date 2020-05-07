import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/basic_api/generated/api.helper.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/exceptions/api_manager_exception.dart';

import 'mock_data/active_symbols_response_mock_data.dart';
import 'mock_data/authorize_response_mock_data.dart';
import 'mock_data/buy_response_mock_data.dart';
import 'mock_data/contract_for_response_mock_data.dart';
import 'mock_data/proposal_response_mock_data.dart';

/// Handle mock api call
class MockAPI implements BaseAPI {
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
  Future<void> close() async => true;

  Future<Response> _getFutureResponse(Request request) async =>
      Future<Response>.delayed(
        const Duration(milliseconds: 500),
        () => getResponseByMsgType(_getResponseByMethod(request.msgType)),
      );

  Stream<Response> _getStreamResponse(Request request) async* {
    await _getFutureResponse(request);
  }

  Map<String, dynamic> _getResponseByMethod(String messageType) {
    switch (messageType) {
      case 'active_symbols':
        return jsonDecode(activeSymbolsResponse);
      // case 'api_token':
      // case 'app_delete':
      // case 'app_get':
      // case 'app_list':
      // case 'app_markup_details':
      // case 'app_register':
      // case 'app_update':
      // case 'asset_index':
      case 'authorize':
        return jsonDecode(authorizeResponse);
      // case 'balance':
      // case 'buy_contract_for_multiple_accounts':
      case 'buy':
        return jsonDecode(buyResponse);
      // case 'cancel':
      // case 'cashier':
      // case 'contract_update_history':
      // case 'contract_update':
      case 'contracts_for':
        return jsonDecode(contractForResponse);
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
      // case 'proposal_open_contract':
      case 'proposal':
        return jsonDecode(proposalResponse);
      // case 'reality_check':
      // case 'residence_list':
      // case 'revoke_oauth_app':
      // case 'sell_contract_for_multiple_accounts':
      // case 'sell_expired':
      // case 'sell':
      // case 'set_account_currency':
      // case 'set_financial_assessment':
      // case 'set_self_exclusion':
      // case 'set_settings':
      // case 'statement':
      // case 'states_list':
      // case 'history':
      // case 'tick':
      // case 'time':
      // case 'tnc_approval':
      // case 'topup_virtual':
      // case 'trading_durations':
      // case 'trading_times':
      // case 'transaction':
      // case 'transfer_between_accounts':
      // case 'verify_email':
      // case 'website_status':

      default:
        throw APIManagerException(
          message: 'message type \'$messageType\' not found',
        );
    }
  }
}
