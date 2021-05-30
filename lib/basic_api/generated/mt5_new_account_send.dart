/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_new_account_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Mt5 new account request class
class Mt5NewAccountRequest extends Request {
  /// Initialize Mt5NewAccountRequest
  const Mt5NewAccountRequest({
    @required this.accountType,
    this.address,
    this.city,
    this.company,
    this.country,
    this.currency,
    this.dryRun,
    @required this.email,
    this.investPassword,
    @required this.leverage,
    @required this.mainPassword,
    this.mt5AccountCategory,
    this.mt5AccountType,
    this.mt5NewAccount = true,
    @required this.name,
    this.phone,
    this.phonePassword,
    this.server,
    this.state,
    this.zipCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'mt5_new_account',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5NewAccountRequest.fromJson(Map<String, dynamic> json) =>
      Mt5NewAccountRequest(
        accountType: json['account_type'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        company: json['company'] as String?,
        country: json['country'] as String?,
        currency: json['currency'] as String?,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        email: json['email'] as String?,
        investPassword: json['investPassword'] as String?,
        leverage: json['leverage'] as num?,
        mainPassword: json['mainPassword'] as String?,
        mt5AccountCategory: json['mt5_account_category'] as String?,
        mt5AccountType: json['mt5_account_type'] as String?,
        mt5NewAccount: json['mt5_new_account'] == null
            ? null
            : json['mt5_new_account'] == 1,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        phonePassword: json['phonePassword'] as String?,
        server: json['server'] as String?,
        state: json['state'] as String?,
        zipCode: json['zipCode'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Account type. If set to 'financial', setting 'mt5_account_type' is also required.
  final String? accountType;

  /// [Optional] The address of the user. The maximum length of this address field is 128 characters.
  final String? address;

  /// [Optional] User's city of residence.
  final String? city;

  /// [Optional] Name of the client's company. The maximum length of the company name is 64 characters.
  final String? company;

  /// [Optional] 2-letter country code (value received from `residence_list` call).
  final String? country;

  /// [Optional] MT5 account currency, the default value will be the qualified account currency.
  final String? currency;

  /// [Optional] If set to `true`, only validation is performed.
  final bool? dryRun;

  /// Email address
  final String? email;

  /// [Optional] The investor password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? investPassword;

  /// Client leverage (from 1 to 1000).
  final num? leverage;

  /// The master password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address). This field is required.
  final String? mainPassword;

  /// [Optional] To choose whether account is conventional or swap_free. Unavailable for financial_stp MT5_account_type
  final String? mt5AccountCategory;

  /// [Optional] Financial: Variable spreads, High leverage. Financial STP: Variable spreads, Medium Leverage, more products. If 'account_type' set to 'financial', setting 'mt5_account_type' is also required.
  final String? mt5AccountType;

  /// Must be `true`
  final bool? mt5NewAccount;

  /// Client's name. The maximum length here is 101 characters.
  final String? name;

  /// [Optional] User's phone number.
  final String? phone;

  /// [Optional] The user's phone password.
  final String? phonePassword;

  /// [Optional] Trade server.
  final String? server;

  /// [Optional] User's state (region) of residence.
  final String? state;

  /// [Optional] User's zip code.
  final String? zipCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_type': accountType,
        'address': address,
        'city': city,
        'company': company,
        'country': country,
        'currency': currency,
        'dry_run': dryRun == null
            ? null
            : dryRun!
                ? 1
                : 0,
        'email': email,
        'investPassword': investPassword,
        'leverage': leverage,
        'mainPassword': mainPassword,
        'mt5_account_category': mt5AccountCategory,
        'mt5_account_type': mt5AccountType,
        'mt5_new_account': mt5NewAccount == null
            ? null
            : mt5NewAccount!
                ? 1
                : 0,
        'name': name,
        'phone': phone,
        'phonePassword': phonePassword,
        'server': server,
        'state': state,
        'zipCode': zipCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5NewAccountRequest copyWith({
    String? accountType,
    String? address,
    String? city,
    String? company,
    String? country,
    String? currency,
    bool? dryRun,
    String? email,
    String? investPassword,
    num? leverage,
    String? mainPassword,
    String? mt5AccountCategory,
    String? mt5AccountType,
    bool? mt5NewAccount,
    String? name,
    String? phone,
    String? phonePassword,
    String? server,
    String? state,
    String? zipCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5NewAccountRequest(
        accountType: accountType ?? this.accountType,
        address: address ?? this.address,
        city: city ?? this.city,
        company: company ?? this.company,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        dryRun: dryRun ?? this.dryRun,
        email: email ?? this.email,
        investPassword: investPassword ?? this.investPassword,
        leverage: leverage ?? this.leverage,
        mainPassword: mainPassword ?? this.mainPassword,
        mt5AccountCategory: mt5AccountCategory ?? this.mt5AccountCategory,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        phonePassword: phonePassword ?? this.phonePassword,
        server: server ?? this.server,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
