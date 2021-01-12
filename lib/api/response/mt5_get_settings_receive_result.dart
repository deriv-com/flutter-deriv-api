import 'package:meta/meta.dart';

import '../../basic_api/generated/mt5_get_settings_receive.dart';
import '../../basic_api/generated/mt5_get_settings_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Mt5 get settings response model class
abstract class Mt5GetSettingsResponseModel {
  /// Initializes
  Mt5GetSettingsResponseModel({
    @required this.mt5GetSettings,
  });

  /// MT5 user account details
  final Mt5GetSettings mt5GetSettings;
}

/// Mt5 get settings response class
class Mt5GetSettingsResponse extends Mt5GetSettingsResponseModel {
  /// Initializes
  Mt5GetSettingsResponse({
    @required Mt5GetSettings mt5GetSettings,
  }) : super(
          mt5GetSettings: mt5GetSettings,
        );

  /// Creates an instance from JSON
  factory Mt5GetSettingsResponse.fromJson(
    dynamic mt5GetSettingsJson,
  ) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettingsJson == null
            ? null
            : Mt5GetSettings.fromJson(mt5GetSettingsJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5GetSettings != null) {
      resultMap['mt5_get_settings'] = mt5GetSettings.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets MT5 user account settings.
  ///
  /// For parameters information refer to [Mt5GetSettingsRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5GetSettingsResponse> fetchSettings(
    Mt5GetSettingsSend request,
  ) async {
    final Mt5GetSettingsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5GetSettingsResponse.fromJson(response.mt5GetSettings);
  }

  /// Creates a copy of instance with given parameters
  Mt5GetSettingsResponse copyWith({
    Mt5GetSettings mt5GetSettings,
  }) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
      );
}
/// Mt5 get settings model class
abstract class Mt5GetSettingsModel {
  /// Initializes
  Mt5GetSettingsModel({
    @required this.address,
    @required this.balance,
    @required this.city,
    @required this.company,
    @required this.country,
    @required this.currency,
    @required this.email,
    @required this.group,
    @required this.leverage,
    @required this.login,
    @required this.name,
    @required this.phone,
    @required this.phonePassword,
    @required this.state,
    @required this.zipCode,
  });

  /// The address of the user. The maximum length of the address is 128 characters.
  final String address;

  /// Account balance.
  final String balance;

  /// User's city of residence.
  final String city;

  /// Name of the client's company. The maximum length of the company name is 64 characters.
  final String company;

  /// 2-letter country code.
  final String country;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String currency;

  /// Email address.
  final String email;

  /// The group where account belongs to.
  final String group;

  /// Client leverage (from 1 to 1000).
  final double leverage;

  /// Login ID of the user's MT5 account.
  final String login;

  /// Client's name. The maximum length of a client's symbol name is 128 characters.
  final String name;

  /// User's phone number.
  final String phone;

  /// The user's phone password.
  final String phonePassword;

  /// User's state (region) of residence.
  final String state;

  /// User's zip code.
  final String zipCode;
}

/// Mt5 get settings class
class Mt5GetSettings extends Mt5GetSettingsModel {
  /// Initializes
  Mt5GetSettings({
    @required String address,
    @required String balance,
    @required String city,
    @required String company,
    @required String country,
    @required String currency,
    @required String email,
    @required String group,
    @required double leverage,
    @required String login,
    @required String name,
    @required String phone,
    @required String phonePassword,
    @required String state,
    @required String zipCode,
  }) : super(
          address: address,
          balance: balance,
          city: city,
          company: company,
          country: country,
          currency: currency,
          email: email,
          group: group,
          leverage: leverage,
          login: login,
          name: name,
          phone: phone,
          phonePassword: phonePassword,
          state: state,
          zipCode: zipCode,
        );

  /// Creates an instance from JSON
  factory Mt5GetSettings.fromJson(Map<String, dynamic> json) => Mt5GetSettings(
        address: json['address'],
        balance: json['balance'],
        city: json['city'],
        company: json['company'],
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        group: json['group'],
        leverage: getDouble(json['leverage']),
        login: json['login'],
        name: json['name'],
        phone: json['phone'],
        phonePassword: json['phonePassword'],
        state: json['state'],
        zipCode: json['zipCode'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address'] = address;
    resultMap['balance'] = balance;
    resultMap['city'] = city;
    resultMap['company'] = company;
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['email'] = email;
    resultMap['group'] = group;
    resultMap['leverage'] = leverage;
    resultMap['login'] = login;
    resultMap['name'] = name;
    resultMap['phone'] = phone;
    resultMap['phonePassword'] = phonePassword;
    resultMap['state'] = state;
    resultMap['zipCode'] = zipCode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Mt5GetSettings copyWith({
    String address,
    String balance,
    String city,
    String company,
    String country,
    String currency,
    String email,
    String group,
    double leverage,
    String login,
    String name,
    String phone,
    String phonePassword,
    String state,
    String zipCode,
  }) =>
      Mt5GetSettings(
        address: address ?? this.address,
        balance: balance ?? this.balance,
        city: city ?? this.city,
        company: company ?? this.company,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        group: group ?? this.group,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        phonePassword: phonePassword ?? this.phonePassword,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
      );
}
