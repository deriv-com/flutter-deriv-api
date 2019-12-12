import "account_closure_send.dart";
import "account_closure_receive.dart";
import "account_security_send.dart";
import "account_security_receive.dart";
import "account_statistics_send.dart";
import "account_statistics_receive.dart";
import "active_symbols_send.dart";
import "active_symbols_receive.dart";
import "api_token_send.dart";
import "api_token_receive.dart";
import "app_delete_send.dart";
import "app_delete_receive.dart";
import "app_get_send.dart";
import "app_get_receive.dart";
import "app_list_send.dart";
import "app_list_receive.dart";
import "app_markup_details_send.dart";
import "app_markup_details_receive.dart";
import "app_register_send.dart";
import "app_register_receive.dart";
import "app_update_send.dart";
import "app_update_receive.dart";
import "asset_index_send.dart";
import "asset_index_receive.dart";
import "authorize_send.dart";
import "authorize_receive.dart";
import "balance_send.dart";
import "balance_receive.dart";
import "buy_send.dart";
import "buy_receive.dart";
import "buy_contract_for_multiple_accounts_send.dart";
import "buy_contract_for_multiple_accounts_receive.dart";
import "cashier_send.dart";
import "cashier_receive.dart";
import "change_password_send.dart";
import "change_password_receive.dart";
import "contracts_for_send.dart";
import "contracts_for_receive.dart";
import "contract_update_send.dart";
import "contract_update_receive.dart";
import "copy_start_send.dart";
import "copy_start_receive.dart";
import "copy_stop_send.dart";
import "copy_stop_receive.dart";
import "copytrading_list_send.dart";
import "copytrading_list_receive.dart";
import "copytrading_statistics_send.dart";
import "copytrading_statistics_receive.dart";
import "document_upload_send.dart";
import "document_upload_receive.dart";
import "exchange_rates_send.dart";
import "exchange_rates_receive.dart";
import "forget_send.dart";
import "forget_receive.dart";
import "forget_all_send.dart";
import "forget_all_receive.dart";
import "get_account_status_send.dart";
import "get_account_status_receive.dart";
import "get_financial_assessment_send.dart";
import "get_financial_assessment_receive.dart";
import "get_limits_send.dart";
import "get_limits_receive.dart";
import "get_self_exclusion_send.dart";
import "get_self_exclusion_receive.dart";
import "get_settings_send.dart";
import "get_settings_receive.dart";
import "landing_company_send.dart";
import "landing_company_receive.dart";
import "landing_company_details_send.dart";
import "landing_company_details_receive.dart";
import "login_history_send.dart";
import "login_history_receive.dart";
import "logout_send.dart";
import "logout_receive.dart";
import "mt5_deposit_send.dart";
import "mt5_deposit_receive.dart";
import "mt5_get_settings_send.dart";
import "mt5_get_settings_receive.dart";
import "mt5_login_list_send.dart";
import "mt5_login_list_receive.dart";
import "mt5_new_account_send.dart";
import "mt5_new_account_receive.dart";
import "mt5_password_change_send.dart";
import "mt5_password_change_receive.dart";
import "mt5_password_check_send.dart";
import "mt5_password_check_receive.dart";
import "mt5_password_reset_send.dart";
import "mt5_password_reset_receive.dart";
import "mt5_withdrawal_send.dart";
import "mt5_withdrawal_receive.dart";
import "new_account_maltainvest_send.dart";
import "new_account_maltainvest_receive.dart";
import "new_account_real_send.dart";
import "new_account_real_receive.dart";
import "new_account_virtual_send.dart";
import "new_account_virtual_receive.dart";
import "notification_event_send.dart";
import "notification_event_receive.dart";
import "oauth_apps_send.dart";
import "oauth_apps_receive.dart";
import "p2p_agent_info_send.dart";
import "p2p_agent_info_receive.dart";
import "p2p_offer_info_send.dart";
import "p2p_offer_info_receive.dart";
import "p2p_offer_list_send.dart";
import "p2p_offer_list_receive.dart";
import "p2p_order_cancel_send.dart";
import "p2p_order_cancel_receive.dart";
import "p2p_order_confirm_send.dart";
import "p2p_order_confirm_receive.dart";
import "p2p_order_create_send.dart";
import "p2p_order_create_receive.dart";
import "p2p_order_info_send.dart";
import "p2p_order_info_receive.dart";
import "p2p_order_list_send.dart";
import "p2p_order_list_receive.dart";
import "p2p_order_update_send.dart";
import "p2p_order_update_receive.dart";
import "paymentagent_list_send.dart";
import "paymentagent_list_receive.dart";
import "paymentagent_transfer_send.dart";
import "paymentagent_transfer_receive.dart";
import "paymentagent_withdraw_send.dart";
import "paymentagent_withdraw_receive.dart";
import "payout_currencies_send.dart";
import "payout_currencies_receive.dart";
import "ping_send.dart";
import "ping_receive.dart";
import "portfolio_send.dart";
import "portfolio_receive.dart";
import "profit_table_send.dart";
import "profit_table_receive.dart";
import "proposal_send.dart";
import "proposal_receive.dart";
import "proposal_array_send.dart";
import "proposal_array_receive.dart";
import "proposal_open_contract_send.dart";
import "proposal_open_contract_receive.dart";
import "reality_check_send.dart";
import "reality_check_receive.dart";
import "request_report_send.dart";
import "request_report_receive.dart";
import "reset_password_send.dart";
import "reset_password_receive.dart";
import "residence_list_send.dart";
import "residence_list_receive.dart";
import "revoke_oauth_app_send.dart";
import "revoke_oauth_app_receive.dart";
import "sell_send.dart";
import "sell_receive.dart";
import "sell_contract_for_multiple_accounts_send.dart";
import "sell_contract_for_multiple_accounts_receive.dart";
import "sell_expired_send.dart";
import "sell_expired_receive.dart";
import "service_token_send.dart";
import "service_token_receive.dart";
import "set_account_currency_send.dart";
import "set_account_currency_receive.dart";
import "set_financial_assessment_send.dart";
import "set_financial_assessment_receive.dart";
import "set_self_exclusion_send.dart";
import "set_self_exclusion_receive.dart";
import "set_settings_send.dart";
import "set_settings_receive.dart";
import "statement_send.dart";
import "statement_receive.dart";
import "states_list_send.dart";
import "states_list_receive.dart";
import "ticks_send.dart";
import "ticks_receive.dart";
import "ticks_history_send.dart";
import "ticks_history_receive.dart";
import "time_send.dart";
import "time_receive.dart";
import "tnc_approval_send.dart";
import "tnc_approval_receive.dart";
import "topup_virtual_send.dart";
import "topup_virtual_receive.dart";
import "trading_durations_send.dart";
import "trading_durations_receive.dart";
import "trading_times_send.dart";
import "trading_times_receive.dart";
import "transaction_send.dart";
import "transaction_receive.dart";
import "transfer_between_accounts_send.dart";
import "transfer_between_accounts_receive.dart";
import "verify_email_send.dart";
import "verify_email_receive.dart";
import "website_status_send.dart";
import "website_status_receive.dart";
