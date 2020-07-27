/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_new_account_send.json
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../request.dart';

part 'mt5_new_account_send.g.dart';

/// JSON conversion for 'mt5_new_account_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
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
    this.mt5NewAccount = 1,
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
      _$Mt5NewAccountRequestFromJson(json);

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
  final int dryRun;

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

  /// Must be `1`
  final int mt5NewAccount;

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
  Map<String, dynamic> toJson() => _$Mt5NewAccountRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5NewAccountRequest copyWith({
    String accountType,
    String address,
    String city,
    String company,
    String country,
    int dryRun,
    String email,
    String investPassword,
    num leverage,
    String mainPassword,
    String mt5AccountType,
    int mt5NewAccount,
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
