import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:deriv_web_socket_client/deriv_web_socket_client.dart' as ws;

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/helper/response_mapper.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/exceptions/api_manager_exception.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/exceptions/call_manager_exception.dart';

import 'mock_data/account/api_token_response.dart';
import 'mock_data/account/authorize_response.dart';
import 'mock_data/account/balance_response.dart';
import 'mock_data/account/copy_trading_list_response.dart';
import 'mock_data/account/copy_trading_statistics_response.dart';
import 'mock_data/account/get_account_status_response.dart';
import 'mock_data/account/get_limits_response.dart';
import 'mock_data/account/get_self_exclusion_response.dart';
import 'mock_data/account/get_settings_response.dart';
import 'mock_data/account/login_history_response.dart';
import 'mock_data/account/logout_response.dart';
import 'mock_data/account/portfolio_response.dart';
import 'mock_data/account/profit_table_response.dart';
import 'mock_data/account/reality_check_response.dart';
import 'mock_data/account/set_account_currency_response.dart';
import 'mock_data/account/set_self_exclusion_response.dart';
import 'mock_data/account/set_settings_response.dart';
import 'mock_data/account/statement_response.dart';
import 'mock_data/account/top_up_virtual_response.dart';
import 'mock_data/app/app_delete_response.dart';
import 'mock_data/app/app_details_response.dart';
import 'mock_data/app/app_list_response.dart';
import 'mock_data/app/app_markup_details_response.dart';
import 'mock_data/app/app_register_response.dart';
import 'mock_data/app/app_update_response.dart';
import 'mock_data/app/new_account_real_response.dart';
import 'mock_data/app/new_account_virtual_response.dart';
import 'mock_data/app/oauth_apps_response.dart';
import 'mock_data/app/revoke_oauth_app_response.dart';
import 'mock_data/cashier/cashier_information_response.dart';
import 'mock_data/common/active_symbols_response.dart';
import 'mock_data/common/asset_index_response.dart';
import 'mock_data/common/copy_start_response.dart';
import 'mock_data/common/copy_stop_response.dart';
import 'mock_data/common/exchange_rates_response.dart';
import 'mock_data/common/forget_all_response.dart';
import 'mock_data/common/forget_response.dart';
import 'mock_data/common/landing_company_details_response.dart';
import 'mock_data/common/landing_company_response.dart';
import 'mock_data/common/payment_agent_list_response.dart';
import 'mock_data/common/payment_agent_transfer_response.dart';
import 'mock_data/common/payment_agent_withdraw_response.dart';
import 'mock_data/common/payment_methods_response.dart';
import 'mock_data/common/payout_currencies_response.dart';
import 'mock_data/common/ping_response.dart';
import 'mock_data/common/residence_list_response.dart';
import 'mock_data/common/server_time_response.dart';
import 'mock_data/common/states_list_response.dart';
import 'mock_data/common/tick_history_response.dart';
import 'mock_data/common/tick_response.dart';
import 'mock_data/common/trading_durations_response.dart';
import 'mock_data/common/trading_times_response.dart';
import 'mock_data/common/website_status_response.dart';
import 'mock_data/contract/buy_contract_response.dart';
import 'mock_data/contract/cancel_response.dart';
import 'mock_data/contract/contract_for_response.dart';
import 'mock_data/contract/contract_update_history_response.dart';
import 'mock_data/contract/contract_update_response.dart';
import 'mock_data/contract/proposal_open_contract_response.dart';
import 'mock_data/contract/proposal_response.dart';
import 'mock_data/contract/sell_expired_response.dart';
import 'mock_data/contract/sell_response.dart';
import 'mock_data/contract/transaction_response.dart';
import 'mock_data/mt5/mt5_deposit_response.dart';
import 'mock_data/mt5/mt5_login_list_response.dart';
import 'mock_data/mt5/mt5_new_account_response.dart';
import 'mock_data/mt5/mt5_password_change_response.dart';
import 'mock_data/mt5/mt5_password_check_response.dart';
import 'mock_data/mt5/mt5_password_reset_response.dart';
import 'mock_data/mt5/mt5_settings_response.dart';
import 'mock_data/mt5/mt5_withdrawal_response.dart';
import 'mock_data/p2p/p2p_advert_create_response.dart';
import 'mock_data/p2p/p2p_advert_info_response.dart';
import 'mock_data/p2p/p2p_advert_list_response.dart';
import 'mock_data/p2p/p2p_advert_update_response.dart';
import 'mock_data/p2p/p2p_advertiser_adverts_response.dart';
import 'mock_data/p2p/p2p_advertiser_create_response.dart';
import 'mock_data/p2p/p2p_advertiser_info_response.dart';
import 'mock_data/p2p/p2p_advertiser_stats_response.dart';
import 'mock_data/p2p/p2p_advertiser_update_response.dart';
import 'mock_data/p2p/p2p_chat_create_response.dart';
import 'mock_data/p2p/p2p_order_cancel_response.dart';
import 'mock_data/p2p/p2p_order_confirm_response.dart';
import 'mock_data/p2p/p2p_order_create_response.dart';
import 'mock_data/p2p/p2p_order_info_response.dart';
import 'mock_data/p2p/p2p_order_list_response.dart';
import 'mock_data/user/get_financial_assessment_response.dart';
import 'mock_data/user/set_financial_assessment_response.dart';
import 'mock_data/user/tnc_approval_response.dart';
import 'mock_data/user/transfer_between_accounts_response.dart';
import 'mock_data/user/verify_email_response.dart';

/// This class is for handling mock API connection and calling mock APIs
class MockAPI extends BaseAPI {
  /// Initializes
  MockAPI({String? key}) : super(key: key ?? '${UniqueKey()}');

  @override
  Stream<ws.ConnectionState> get connectionStatus =>
      Stream<ws.ConnectionState>.value(const ws.ConnectedState());

  @override
  Future<void> connect(
    ConnectionInformation? connectionInformation, {
    ConnectionCallback? onDone,
    ConnectionCallback? onOpen,
    ConnectionCallback? onError,
    bool printResponse = false,
  }) async =>
      true;

  @override
  void addToChannel(Map<String, dynamic> request) {}

  @override
  Future<T> call<T>({required Request request}) =>
      _getFutureResponse<T>(request);

  @override
  Stream<Response> subscribe({
    required Request request,
    RequestCompareFunction? comparePredicate,
  }) =>
      _getStreamResponse(request);

  @override
  Future<ForgetReceive> unsubscribe({required String? subscriptionId}) async =>
      const ForgetReceive(forget: true);

  @override
  Future<ForgetAllReceive> unsubscribeAll({
    required ForgetStreamType method,
  }) async =>
      const ForgetAllReceive();

  @override
  Future<void> disconnect() async => true;

  Future<T> _getFutureResponse<T>(Request request) async => Future<T>.delayed(
        const Duration(),
        () async {
          final Response response = getResponseByMsgType(
            jsonDecode(_getResponse(request.msgType!)),
          );

          if (response is T) {
            return response as T;
          }

          throw CallManagerException(message: 'Unexpected response');
        },
      );

  Stream<Response> _getStreamResponse(Request request) =>
      Stream<Response>.periodic(
        const Duration(),
        (int computationCount) => getResponseByMsgType(
          jsonDecode(_getResponse(request.msgType!)),
        ),
      ).take(1);

  String _getResponse(String method) {
    switch (method) {
      case 'active_symbols':
        return activeSymbolsResponse;
      case 'api_token':
        return apiTokenResponse;
      case 'app_delete':
        return appDeleteResponse;
      case 'app_get':
        return appDetailsResponse;
      case 'app_list':
        return appListResponse;
      case 'app_markup_details':
        return appMarkupDetailsResponse;
      case 'app_register':
        return appRegisterResponse;
      case 'app_update':
        return appUpdateResponse;
      case 'asset_index':
        return assetIndexResponse;
      case 'authorize':
        return authorizeResponse;
      case 'balance':
        return balanceResponse;
      case 'buy':
        return buyContractResponse;
      // case 'buy_contract_for_multiple_accounts':
      case 'cancel':
        return cancelResponse;
      case 'cashier':
        return cashierInformationResponse;
      case 'contract_update':
        return contractUpdateResponse;
      case 'contract_update_history':
        return contractUpdateHistoryResponse;
      case 'contracts_for':
        return contractForResponse;
      case 'copy_start':
        return copyStartResponse;
      case 'copy_stop':
        return copyStopResponse;
      case 'copytrading_list':
        return copyTradingListResponse;
      case 'copytrading_statistics':
        return copyTradingStatisticsResponse;
      // case 'document_upload':
      case 'exchange_rates':
        return exchangeRatesResponse;
      case 'forget':
        return forgetResponse;
      case 'forget_all':
        return forgetAllResponse;
      case 'get_account_status':
        return getAccountStatusResponse;
      case 'get_financial_assessment':
        return getFinancialAssessmentResponse;
      case 'get_limits':
        return getLimitsResponse;
      case 'get_self_exclusion':
        return getSelfExclusiveResponse;
      case 'get_settings':
        return getSettingsResponse;
      case 'landing_company':
        return landingCompanyResponse;
      case 'landing_company_details':
        return landingCompanyDetailsResponse;
      case 'login_history':
        return loginHistoryResponse;
      case 'logout':
        return logoutResponse;
      case 'mt5_deposit':
        return mt5DepositResponse;
      case 'mt5_get_settings':
        return mt5SettingsResponse;
      case 'mt5_login_list':
        return mt5LoginListResponse;
      case 'mt5_new_account':
        return mt5NewAccountResponse;
      case 'mt5_password_change':
        return mt5PasswordChangeResponse;
      case 'mt5_password_check':
        return mt5PasswordCheckResponse;
      case 'mt5_password_reset':
        return mt5PasswordResetResponse;
      case 'mt5_withdrawal':
        return mt5WithdrawalResponse;
      case 'new_account_maltainvest':
      case 'new_account_real':
        return newAccountRealResponse;
      case 'new_account_virtual':
        return newAccountVirtualResponse;
      case 'oauth_apps':
        return oauthAppsResponse;
      case 'p2p_advert_create':
        return p2pAdvertCreateResponse;
      case 'p2p_advert_info':
        return p2pAdvertInfoResponse;
      case 'p2p_advert_list':
        return p2pAdvertListResponse;
      case 'p2p_advert_update':
        return p2pAdvertUpdateResponse;
      case 'p2p_advertiser_adverts':
        return p2pAdvertiserAdvertsResponse;
      case 'p2p_advertiser_create':
        return p2pAdvertiserCreateResponse;
      case 'p2p_advertiser_info':
        return p2pAdvertiserInfoResponse;
      case 'p2p_advertiser_stats':
        return p2pAdvertiserStatsResponse;
      case 'p2p_advertiser_update':
        return p2pAdvertiserUpdateResponse;
      case 'p2p_chat_create':
        return p2pChatCreateResponse;
      case 'p2p_order_cancel':
        return p2pOrderCancelResponse;
      case 'p2p_order_confirm':
        return p2pOrderConfirmResponse;
      case 'p2p_order_create':
        return p2pOrderCreateResponse;
      case 'p2p_order_info':
        return p2pOrderInfoResponse;
      case 'p2p_order_list':
        return p2pOrderListResponse;
      case 'paymentagent_list':
        return paymentAgentListResponse;
      case 'paymentagent_transfer':
        return paymentAgentTransferResponse;
      case 'paymentagent_withdraw':
        return paymentAgentWithdrawResponse;
      case 'payout_currencies':
        return payoutCurrenciesResponse;
      case 'payment_methods':
        return paymentMethodsResponse;
      case 'ping':
        return pingResponse;
      case 'portfolio':
        return portfolioResponse;
      case 'profit_table':
        return profitTableResponse;
      // case 'proposal_array':
      case 'proposal':
        return proposalResponse;
      case 'proposal_open_contract':
        return proposalOpenContractResponse;
      case 'reality_check':
        return realityCheckResponse;
      case 'residence_list':
        return residenceListResponse;
      case 'revoke_oauth_app':
        return revokeOauthAppResponse;
      // case 'sell_contract_for_multiple_accounts':
      case 'sell':
        return sellResponse;
      case 'sell_expired':
        return sellExpiredResponse;
      case 'set_account_currency':
        return setAccountCurrencyResponse;
      case 'set_financial_assessment':
        return setFinancialAssessmentResponse;
      case 'set_self_exclusion':
        return setSelfExclusiveResponse;
      case 'set_settings':
        return setSettingsResponse;
      case 'statement':
        return statementResponse;
      case 'states_list':
        return statesListResponse;
      case 'ticks':
        return tickResponse;
      case 'ticks_history':
        return tickHistoryResponse;
      case 'time':
        return serverTimeResponse;
      case 'tnc_approval':
        return tncApprovalResponse;
      case 'topup_virtual':
        return topUpVirtualResponse;
      case 'trading_durations':
        return tradingDurationsResponse;
      case 'trading_times':
        return tradingTimesResponse;
      case 'transaction':
        return transactionResponse;
      case 'transfer_between_accounts':
        return transferBetweenAccountsResponse;
      case 'verify_email':
        return verifyEmailResponse;
      case 'website_status':
        return websiteStatusResponse;

      default:
        throw APIManagerException(
          message: 'message type \'$method\' not found.',
        );
    }
  }
}
