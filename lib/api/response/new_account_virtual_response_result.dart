// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_virtual_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_virtual_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// New account virtual response model class.
abstract class NewAccountVirtualResponseModel {
  /// Initializes New account virtual response model class .
  const NewAccountVirtualResponseModel({
    this.newAccountVirtual,
  });

  /// New virtual-money account details
  final NewAccountVirtual? newAccountVirtual;
}

/// New account virtual response class.
class NewAccountVirtualResponse extends NewAccountVirtualResponseModel {
  /// Initializes New account virtual response class.
  const NewAccountVirtualResponse({
    super.newAccountVirtual,
  });

  /// Creates an instance from JSON.
  factory NewAccountVirtualResponse.fromJson(
    dynamic newAccountVirtualJson,
  ) =>
      NewAccountVirtualResponse(
        newAccountVirtual: newAccountVirtualJson == null
            ? null
            : NewAccountVirtual.fromJson(newAccountVirtualJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (newAccountVirtual != null) {
      resultMap['new_account_virtual'] = newAccountVirtual!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Opens a new virtual account.
  ///
  /// For parameters information refer to [NewAccountVirtualRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<NewAccountVirtualResponse> openNewVirtualAccount(
    NewAccountVirtualRequest request,
  ) async {
    final NewAccountVirtualReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return NewAccountVirtualResponse.fromJson(response.newAccountVirtual);
  }

  /// Creates a copy of instance with given parameters.
  NewAccountVirtualResponse copyWith({
    NewAccountVirtual? newAccountVirtual,
  }) =>
      NewAccountVirtualResponse(
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
      );
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "trading": TypeEnum.trading,
  "wallet": TypeEnum.wallet,
};

/// Type Enum.
enum TypeEnum {
  /// trading.
  trading,

  /// wallet.
  wallet,
}

/// New account virtual model class.
abstract class NewAccountVirtualModel {
  /// Initializes New account virtual model class .
  const NewAccountVirtualModel({
    required this.oauthToken,
    required this.email,
    required this.currency,
    required this.clientId,
    required this.balance,
    this.refreshToken,
    this.type,
  });

  /// Oauth token for the client's login session (so that the user may be logged in immediately)
  final String oauthToken;

  /// Email of the new virtual-money account
  final String email;

  /// Account currency
  final String currency;

  /// ID of the new virtual-money account
  final String clientId;

  /// Account balance
  final double balance;

  /// Refresh token to perform PTA, only for the first ever created account
  final String? refreshToken;

  /// Account type
  final TypeEnum? type;
}

/// New account virtual class.
class NewAccountVirtual extends NewAccountVirtualModel {
  /// Initializes New account virtual class.
  const NewAccountVirtual({
    required super.balance,
    required super.clientId,
    required super.currency,
    required super.email,
    required super.oauthToken,
    super.refreshToken,
    super.type,
  });

  /// Creates an instance from JSON.
  factory NewAccountVirtual.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtual(
        balance: getDouble(json['balance'])!,
        clientId: json['client_id'],
        currency: json['currency'],
        email: json['email'],
        oauthToken: json['oauth_token'],
        refreshToken: json['refresh_token'],
        type: json['type'] == null ? null : typeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance'] = balance;
    resultMap['client_id'] = clientId;
    resultMap['currency'] = currency;
    resultMap['email'] = email;
    resultMap['oauth_token'] = oauthToken;
    resultMap['refresh_token'] = refreshToken;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountVirtual copyWith({
    double? balance,
    String? clientId,
    String? currency,
    String? email,
    String? oauthToken,
    String? refreshToken,
    TypeEnum? type,
  }) =>
      NewAccountVirtual(
        balance: balance ?? this.balance,
        clientId: clientId ?? this.clientId,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        oauthToken: oauthToken ?? this.oauthToken,
        refreshToken: refreshToken ?? this.refreshToken,
        type: type ?? this.type,
      );
}
