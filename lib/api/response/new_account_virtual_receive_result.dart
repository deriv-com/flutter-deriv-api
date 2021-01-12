import 'package:meta/meta.dart';

import '../../api/exceptions/exceptions.dart';
import '../../api/models/base_exception_model.dart';
import '../../basic_api/generated/new_account_virtual_receive.dart';
import '../../basic_api/generated/new_account_virtual_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';

/// New account virtual response model class
abstract class NewAccountVirtualResponseModel {
  /// Initializes
  NewAccountVirtualResponseModel({
    @required this.newAccountVirtual,
  });

  /// New virtual-money account details
  final NewAccountVirtual newAccountVirtual;
}

/// New account virtual response class
class NewAccountVirtualResponse extends NewAccountVirtualResponseModel {
  /// Initializes
  NewAccountVirtualResponse({
    @required NewAccountVirtual newAccountVirtual,
  }) : super(
          newAccountVirtual: newAccountVirtual,
        );

  /// Creates an instance from JSON
  factory NewAccountVirtualResponse.fromJson(
    dynamic newAccountVirtualJson,
  ) =>
      NewAccountVirtualResponse(
        newAccountVirtual: newAccountVirtualJson == null
            ? null
            : NewAccountVirtual.fromJson(newAccountVirtualJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (newAccountVirtual != null) {
      resultMap['new_account_virtual'] = newAccountVirtual.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Opens a new virtual account.
  ///
  /// For parameters information refer to [NewAccountVirtualRequest].
  /// Throws a [NewAccountException] if API response contains an error
  static Future<NewAccountVirtualResponse> openNewVirtualAccount(
    NewAccountVirtualSend request,
  ) async {
    final NewAccountVirtualReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          NewAccountException(baseExceptionModel: baseExceptionModel),
    );

    return NewAccountVirtualResponse.fromJson(response.newAccountVirtual);
  }

  /// Creates a copy of instance with given parameters
  NewAccountVirtualResponse copyWith({
    NewAccountVirtual newAccountVirtual,
  }) =>
      NewAccountVirtualResponse(
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
      );
}
/// New account virtual model class
abstract class NewAccountVirtualModel {
  /// Initializes
  NewAccountVirtualModel({
    @required this.balance,
    @required this.clientId,
    @required this.currency,
    @required this.email,
    @required this.oauthToken,
  });

  /// Account balance
  final double balance;

  /// Client ID of the new virtual-money account
  final String clientId;

  /// Account currency
  final String currency;

  /// Email of the new virtual-money account
  final String email;

  /// Oauth token for the client's login session (so that the user may be logged in immediately)
  final String oauthToken;
}

/// New account virtual class
class NewAccountVirtual extends NewAccountVirtualModel {
  /// Initializes
  NewAccountVirtual({
    @required double balance,
    @required String clientId,
    @required String currency,
    @required String email,
    @required String oauthToken,
  }) : super(
          balance: balance,
          clientId: clientId,
          currency: currency,
          email: email,
          oauthToken: oauthToken,
        );

  /// Creates an instance from JSON
  factory NewAccountVirtual.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtual(
        balance: getDouble(json['balance']),
        clientId: json['client_id'],
        currency: json['currency'],
        email: json['email'],
        oauthToken: json['oauth_token'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance'] = balance;
    resultMap['client_id'] = clientId;
    resultMap['currency'] = currency;
    resultMap['email'] = email;
    resultMap['oauth_token'] = oauthToken;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  NewAccountVirtual copyWith({
    double balance,
    String clientId,
    String currency,
    String email,
    String oauthToken,
  }) =>
      NewAccountVirtual(
        balance: balance ?? this.balance,
        clientId: clientId ?? this.clientId,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        oauthToken: oauthToken ?? this.oauthToken,
      );
}
