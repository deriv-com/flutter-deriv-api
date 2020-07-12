/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_new_account_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// Mt5NewAccountRequest class
class Mt5NewAccountRequest extends Request {
  /// Initialize Mt5NewAccountRequest
  const Mt5NewAccountRequest({
    @required this.accountType,
    this.address,
    this.city,
    this.company,
    this.country,
    this.dryRun,
    @required this.email,
    this.investPassword,
    @required this.leverage,
    @required this.mainPassword,
    this.mt5AccountType,
    this.mt5NewAccount = true,
    @required this.name,
    this.phone,
    this.phonePassword,
    this.state,
    this.zipCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'mt5_new_account',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5NewAccountRequest.fromJson(Map<String, dynamic> json) =>
      Mt5NewAccountRequest(
        // ignore: avoid_as
        accountType: json['account_type'] as String,
        // ignore: avoid_as
        address: json['address'] as String,
        // ignore: avoid_as
        city: json['city'] as String,
        // ignore: avoid_as
        company: json['company'] as String,
        // ignore: avoid_as
        country: json['country'] as String,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        // ignore: avoid_as
        email: json['email'] as String,
        // ignore: avoid_as
        investPassword: json['investPassword'] as String,
        // ignore: avoid_as
        leverage: json['leverage'] as num,
        // ignore: avoid_as
        mainPassword: json['mainPassword'] as String,
        // ignore: avoid_as
        mt5AccountType: json['mt5_account_type'] as String,
        mt5NewAccount: json['mt5_new_account'] == null
            ? null
            : json['mt5_new_account'] == 1,
        // ignore: avoid_as
        name: json['name'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        phone: json['phone'] as String,
        // ignore: avoid_as
        phonePassword: json['phonePassword'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        state: json['state'] as String,
        // ignore: avoid_as
        zipCode: json['zipCode'] as String,
      );

  /// Account type
  final String accountType;

  /// [Optional] The address of the user. The maximum length of this address field is 128 characters.
  final String address;

  /// [Optional] User's city of residence.
  final String city;

  /// [Optional] Name of the client's company. The maximum length of the company name is 64 characters.
  final String company;

  /// [Optional] 2-letter country code (value received from `residence_list` call).
  final String country;

  /// [Optional] If set to 1, only validation is performed.
  final bool dryRun;

  /// Email address
  final String email;

  /// [Optional] The investor password of the account. For validation (length within 8-25 chars, accepts at least 2 out of the following 3 types of characters: uppercase letters, lowercase letters, and numbers).
  final String investPassword;

  /// Client leverage (from 1 to 1000).
  final num leverage;

  /// The master password of the account. For validation (length within 8-25 chars, accepts at least 2 out of the following 3 types of characters: uppercase letters, lowercase letters, and numbers). This field is required.
  final String mainPassword;

  /// [Optional] Financial: Variable spreads, High leverage. Financial STP: Variable spreads, Medium Leverage, more products.
  final String mt5AccountType;

  /// Must be `true`
  final bool mt5NewAccount;

  /// Client's name. The maximum length here is 101 characters.
  final String name;

  /// [Optional] User's phone number.
  final String phone;

  /// [Optional] The user's phone password.
  final String phonePassword;

  /// [Optional] User's state (region) of residence.
  final String state;

  /// [Optional] User's zip code.
  final String zipCode;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_type': accountType,
        'address': address,
        'city': city,
        'company': company,
        'country': country,
        'dry_run': dryRun == null ? null : dryRun ? 1 : 0,
        'email': email,
        'investPassword': investPassword,
        'leverage': leverage,
        'mainPassword': mainPassword,
        'mt5_account_type': mt5AccountType,
        'mt5_new_account': mt5NewAccount == null ? null : mt5NewAccount ? 1 : 0,
        'name': name,
        'passthrough': passthrough,
        'phone': phone,
        'phonePassword': phonePassword,
        'req_id': reqId,
        'state': state,
        'zipCode': zipCode,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5NewAccountRequest copyWith({
    String accountType,
    String address,
    String city,
    String company,
    String country,
    bool dryRun,
    String email,
    String investPassword,
    num leverage,
    String mainPassword,
    String mt5AccountType,
    bool mt5NewAccount,
    String name,
    String phone,
    String phonePassword,
    String state,
    String zipCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5NewAccountRequest(
        accountType: accountType ?? this.accountType,
        address: address ?? this.address,
        city: city ?? this.city,
        company: company ?? this.company,
        country: country ?? this.country,
        dryRun: dryRun ?? this.dryRun,
        email: email ?? this.email,
        investPassword: investPassword ?? this.investPassword,
        leverage: leverage ?? this.leverage,
        mainPassword: mainPassword ?? this.mainPassword,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        phonePassword: phonePassword ?? this.phonePassword,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
