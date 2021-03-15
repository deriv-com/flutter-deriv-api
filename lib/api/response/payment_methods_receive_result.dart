import 'package:meta/meta.dart';

import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../../basic_api/generated/payment_methods_receive.dart';
import '../../basic_api/generated/payment_methods_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';


/// Payment methods response model class
abstract class PaymentMethodsResponseModel {
  /// Initializes
  PaymentMethodsResponseModel({
    @required this.paymentMethods,
  });

  /// Available payment methods for a given country. Note: if a user is logged in, the residence country will be considered.
  final List<PaymentMethodsItem> paymentMethods;
}

/// Payment methods response class
class PaymentMethodsResponse extends PaymentMethodsResponseModel {
  /// Initializes
  PaymentMethodsResponse({
    @required List<PaymentMethodsItem> paymentMethods,
  }) : super(
          paymentMethods: paymentMethods,
        );

  /// Creates an instance from JSON
  factory PaymentMethodsResponse.fromJson(
    dynamic paymentmethodsJSON,
  ) =>
      PaymentMethodsResponse(
        paymentMethods: paymentmethodsJSON == null
            ? null
            : List<PaymentMethodsItem>.from(paymentmethodsJSON
                .map((dynamic item) => PaymentMethodsItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (paymentMethods != null) {
      resultMap['payment_methods'] = paymentMethods
          .map<dynamic>((PaymentMethodsItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Get List of available payment methods for a given country.
  ///
  /// For parameters information refer to [PaymentMethodsSend].
  /// Throws an [PaymentException] if API response contains an error
  static Future<PaymentMethodsResponse> fetchList(
      PaymentMethodsSend request) async {
    final PaymentMethodsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          PaymentException(baseExceptionModel: baseExceptionModel),
    );

    return PaymentMethodsResponse.fromJson(response.paymentMethods);
  }

  /// Creates a copy of instance with given parameters
  PaymentMethodsResponse copyWith({
    List<PaymentMethodsItem> paymentMethods,
  }) =>
      PaymentMethodsResponse(
        paymentMethods: paymentMethods ?? this.paymentMethods,
      );
}

/// Payment methods item model class
abstract class PaymentMethodsItemModel {
  /// Initializes
  PaymentMethodsItemModel({
    @required this.withdrawalTime,
    @required this.withdrawLimits,
    @required this.typeDisplayName,
    @required this.type,
    @required this.supportedCurrencies,
    @required this.signupLink,
    @required this.predefinedAmounts,
    @required this.paymentProcessor,
    @required this.id,
    @required this.displayName,
    @required this.description,
    @required this.depositTime,
    @required this.depositLimits,
  });

  /// How much time takes a withdrawal to be processed.
  final String withdrawalTime;

  /// Withdrawal limits per currency.
  final Map<String, WithdrawLimitsProperty> withdrawLimits;

  /// A printable description for type of payment method.
  final String typeDisplayName;

  /// Type of Payment Method.
  final String type;

  /// Currencies supported for this payment method.
  final List<String> supportedCurrencies;

  /// Sign up link for this payment method.
  final String signupLink;

  /// A list of predefined amounts for withdraw or deposit.
  final List<int> predefinedAmounts;

  /// Payment processor for this payment method.
  final String paymentProcessor;

  /// Unique identifier for the payment method.
  final String id;

  /// Common name for the payment method.
  final String displayName;

  /// Short description explaining the payment method.
  final String description;

  /// How much time it takes for a deposit to be processed.
  final String depositTime;

  /// The min and max values for deposits.
  final Map<String, DepositLimitsProperty> depositLimits;
}

/// Payment methods item class
class PaymentMethodsItem extends PaymentMethodsItemModel {
  /// Initializes
  PaymentMethodsItem({
    @required Map<String, DepositLimitsProperty> depositLimits,
    @required String depositTime,
    @required String description,
    @required String displayName,
    @required String id,
    @required String paymentProcessor,
    @required List<int> predefinedAmounts,
    @required String signupLink,
    @required List<String> supportedCurrencies,
    @required String type,
    @required String typeDisplayName,
    @required Map<String, WithdrawLimitsProperty> withdrawLimits,
    @required String withdrawalTime,
  }) : super(
          depositLimits: depositLimits,
          depositTime: depositTime,
          description: description,
          displayName: displayName,
          id: id,
          paymentProcessor: paymentProcessor,
          predefinedAmounts: predefinedAmounts,
          signupLink: signupLink,
          supportedCurrencies: supportedCurrencies,
          type: type,
          typeDisplayName: typeDisplayName,
          withdrawLimits: withdrawLimits,
          withdrawalTime: withdrawalTime,
        );

  /// Creates an instance from JSON
  factory PaymentMethodsItem.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsItem(
        depositLimits: json['deposit_limits'] == null
            ? null
            : Map<String, DepositLimitsProperty>.fromEntries(
                json['deposit_limits']
                    .entries
                    .map<MapEntry<String, DepositLimitsProperty>>(
                        (MapEntry<String, dynamic> entry) =>
                            MapEntry<String, DepositLimitsProperty>(
                                entry.key,
                                entry.value == null
                                    ? null
                                    : DepositLimitsProperty.fromJson(
                                        entry.value)))),
        depositTime: json['deposit_time'],
        description: json['description'],
        displayName: json['display_name'],
        id: json['id'],
        paymentProcessor: json['payment_processor'],
        predefinedAmounts: json['predefined_amounts'] == null
            ? null
            : List<int>.from(
                json['predefined_amounts'].map((dynamic item) => item)),
        signupLink: json['signup_link'],
        supportedCurrencies: json['supported_currencies'] == null
            ? null
            : List<String>.from(
                json['supported_currencies'].map((dynamic item) => item)),
        type: json['type'],
        typeDisplayName: json['type_display_name'],
        withdrawLimits: json['withdraw_limits'] == null
            ? null
            : Map<String, WithdrawLimitsProperty>.fromEntries(
                json['withdraw_limits']
                    .entries
                    .map<MapEntry<String, WithdrawLimitsProperty>>(
                        (MapEntry<String, dynamic> entry) =>
                            MapEntry<String, WithdrawLimitsProperty>(
                                entry.key,
                                entry.value == null
                                    ? null
                                    : WithdrawLimitsProperty.fromJson(
                                        entry.value)))),
        withdrawalTime: json['withdrawal_time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['deposit_limits'] = depositLimits;
    resultMap['deposit_time'] = depositTime;
    resultMap['description'] = description;
    resultMap['display_name'] = displayName;
    resultMap['id'] = id;
    resultMap['payment_processor'] = paymentProcessor;
    if (predefinedAmounts != null) {
      resultMap['predefined_amounts'] =
          predefinedAmounts.map<dynamic>((int item) => item).toList();
    }
    resultMap['signup_link'] = signupLink;
    if (supportedCurrencies != null) {
      resultMap['supported_currencies'] =
          supportedCurrencies.map<dynamic>((String item) => item).toList();
    }
    resultMap['type'] = type;
    resultMap['type_display_name'] = typeDisplayName;
    resultMap['withdraw_limits'] = withdrawLimits;
    resultMap['withdrawal_time'] = withdrawalTime;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  PaymentMethodsItem copyWith({
    Map<String, DepositLimitsProperty> depositLimits,
    String depositTime,
    String description,
    String displayName,
    String id,
    String paymentProcessor,
    List<int> predefinedAmounts,
    String signupLink,
    List<String> supportedCurrencies,
    String type,
    String typeDisplayName,
    Map<String, WithdrawLimitsProperty> withdrawLimits,
    String withdrawalTime,
  }) =>
      PaymentMethodsItem(
        depositLimits: depositLimits ?? this.depositLimits,
        depositTime: depositTime ?? this.depositTime,
        description: description ?? this.description,
        displayName: displayName ?? this.displayName,
        id: id ?? this.id,
        paymentProcessor: paymentProcessor ?? this.paymentProcessor,
        predefinedAmounts: predefinedAmounts ?? this.predefinedAmounts,
        signupLink: signupLink ?? this.signupLink,
        supportedCurrencies: supportedCurrencies ?? this.supportedCurrencies,
        type: type ?? this.type,
        typeDisplayName: typeDisplayName ?? this.typeDisplayName,
        withdrawLimits: withdrawLimits ?? this.withdrawLimits,
        withdrawalTime: withdrawalTime ?? this.withdrawalTime,
      );
}

/// Deposit limits property model class
abstract class DepositLimitsPropertyModel {
  /// Initializes
  DepositLimitsPropertyModel({
    @required this.min,
    @required this.max,
  });

  /// Minimum amount for deposit for this currency.
  final int min;

  /// Maximum amount for deposits for this currency.
  final int max;
}

/// Deposit limits property class
class DepositLimitsProperty extends DepositLimitsPropertyModel {
  /// Initializes
  DepositLimitsProperty({
    @required int max,
    @required int min,
  }) : super(
          max: max,
          min: min,
        );

  /// Creates an instance from JSON
  factory DepositLimitsProperty.fromJson(Map<String, dynamic> json) =>
      DepositLimitsProperty(
        max: json['max'],
        min: json['min'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max'] = max;
    resultMap['min'] = min;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  DepositLimitsProperty copyWith({
    int max,
    int min,
  }) =>
      DepositLimitsProperty(
        max: max ?? this.max,
        min: min ?? this.min,
      );
}

/// Withdraw limits property model class
abstract class WithdrawLimitsPropertyModel {
  /// Initializes
  WithdrawLimitsPropertyModel({
    @required this.min,
    @required this.max,
  });

  /// Minimum amount for withdrawals in this currency.
  final int min;

  /// Maximum amount for wihdrawals in this currency.
  final int max;
}

/// Withdraw limits property class
class WithdrawLimitsProperty extends WithdrawLimitsPropertyModel {
  /// Initializes
  WithdrawLimitsProperty({
    @required int max,
    @required int min,
  }) : super(
          max: max,
          min: min,
        );

  /// Creates an instance from JSON
  factory WithdrawLimitsProperty.fromJson(Map<String, dynamic> json) =>
      WithdrawLimitsProperty(
        max: json['max'],
        min: json['min'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max'] = max;
    resultMap['min'] = min;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  WithdrawLimitsProperty copyWith({
    int max,
    int min,
  }) =>
      WithdrawLimitsProperty(
        max: max ?? this.max,
        min: min ?? this.min,
      );
}
