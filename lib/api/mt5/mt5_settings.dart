import 'package:flutter_deriv_api/api/mt5/exceptions/mt5_exception.dart';
import 'package:flutter_deriv_api/api/mt5/models/mt5_settings_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// MT5 settings class
class MT5Settings extends MT5SettingsModel {
  /// Initializes
  MT5Settings({
    String address,
    String balance,
    String city,
    String company,
    String country,
    String currency,
    String email,
    String group,
    int leverage,
    String login,
    String name,
    String phone,
    String phonePassword,
    String state,
    String zipCode,
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
  factory MT5Settings.fromJson(Map<String, dynamic> json) => MT5Settings(
        address: json['address'],
        balance: json['balance'],
        city: json['city'],
        company: json['company'],
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        group: json['group'],
        leverage: json['leverage'],
        login: json['login'],
        name: json['name'],
        phone: json['phone'],
        phonePassword: json['phonePassword'],
        state: json['state'],
        zipCode: json['zipCode'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  MT5Settings copyWith({
    String address,
    String balance,
    String city,
    String company,
    String country,
    String currency,
    String email,
    String group,
    int leverage,
    String login,
    String name,
    String phone,
    String phonePassword,
    String state,
    String zipCode,
  }) =>
      MT5Settings(
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

  /// Get MT5 user account settings
  /// For parameters information refer to [Mt5GetSettingsRequest]
  static Future<MT5Settings> fetchSettings(
    Mt5GetSettingsRequest request,
  ) async {
    final Mt5GetSettingsResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw MT5Exception(message: response.error['message']);
    }

    return MT5Settings.fromJson(response.mt5GetSettings);
  }
}
