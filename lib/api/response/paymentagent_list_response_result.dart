// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/paymentagent_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/paymentagent_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Paymentagent list response model class.
abstract class PaymentagentListResponseModel {
  /// Initializes Paymentagent list response model class .
  const PaymentagentListResponseModel({
    this.paymentagentList,
  });

  /// Payment Agent List
  final PaymentagentList? paymentagentList;
}

/// Paymentagent list response class.
class PaymentagentListResponse extends PaymentagentListResponseModel {
  /// Initializes Paymentagent list response class.
  const PaymentagentListResponse({
    super.paymentagentList,
  });

  /// Creates an instance from JSON.
  factory PaymentagentListResponse.fromJson(
    dynamic paymentagentListJson,
  ) =>
      PaymentagentListResponse(
        paymentagentList: paymentagentListJson == null
            ? null
            : PaymentagentList.fromJson(paymentagentListJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (paymentagentList != null) {
      resultMap['paymentagent_list'] = paymentagentList!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Returns a list of Payment Agents for a given country for a given currency.
  ///
  /// For parameters information refer to [PaymentagentListRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<PaymentagentListResponse> fetch(
    PaymentagentListRequest request,
  ) async {
    final PaymentagentListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return PaymentagentListResponse.fromJson(response.paymentagentList);
  }

  /// Creates a copy of instance with given parameters.
  PaymentagentListResponse copyWith({
    PaymentagentList? paymentagentList,
  }) =>
      PaymentagentListResponse(
        paymentagentList: paymentagentList ?? this.paymentagentList,
      );
}

/// Paymentagent list model class.
abstract class PaymentagentListModel {
  /// Initializes Paymentagent list model class .
  const PaymentagentListModel({
    required this.list,
    this.availableCountries,
  });

  /// List of payment agents available in the requested country.
  final List<ListItem> list;

  /// The list of countries in which payment agent is available.
  final List<List<String>>? availableCountries;
}

/// Paymentagent list class.
class PaymentagentList extends PaymentagentListModel {
  /// Initializes Paymentagent list class.
  const PaymentagentList({
    required super.list,
    super.availableCountries,
  });

  /// Creates an instance from JSON.
  factory PaymentagentList.fromJson(Map<String, dynamic> json) =>
      PaymentagentList(
        list: List<ListItem>.from(
          json['list'].map(
            (dynamic item) => ListItem.fromJson(item),
          ),
        ),
        availableCountries: json['available_countries'] == null
            ? null
            : List<List<String>>.from(
                json['available_countries']?.map(
                  (dynamic item) => List<String>.from(
                    item?.map(
                      (dynamic item) => item,
                    ),
                  ),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['list'] = list
        .map<dynamic>(
          (ListItem item) => item.toJson(),
        )
        .toList();

    if (availableCountries != null) {
      resultMap['available_countries'] = availableCountries!
          .map<dynamic>(
            (List<String> item) => item
                .map(
                  (String item) => item,
                )
                .toList(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentagentList copyWith({
    List<ListItem>? list,
    List<List<String>>? availableCountries,
  }) =>
      PaymentagentList(
        list: list ?? this.list,
        availableCountries: availableCountries ?? this.availableCountries,
      );
}

/// List item model class.
abstract class ListItemModel {
  /// Initializes List item model class .
  const ListItemModel({
    required this.withdrawalCommission,
    required this.urls,
    required this.supportedPaymentMethods,
    required this.summary,
    required this.phoneNumbers,
    required this.paymentagentLoginid,
    required this.name,
    required this.furtherInformation,
    required this.email,
    required this.depositCommission,
    required this.currencies,
    this.maxWithdrawal,
    this.minWithdrawal,
  });

  /// Commission amount applied on withdrawals made through this payment agent.
  final String withdrawalCommission;

  /// The URL(s) of payment agent's website(s).
  final List<UrlsItem> urls;

  /// A list of supported payment methods.
  final List<SupportedPaymentMethodsItem> supportedPaymentMethods;

  /// A summary about payment agent.
  final String summary;

  /// Payment agent's phone number(s) with country code.
  final List<PhoneNumbersItem> phoneNumbers;

  /// Payment agent's loginid.
  final String paymentagentLoginid;

  /// Payment agent's name.
  final String name;

  /// More descriptions about this payment agent.
  final String furtherInformation;

  /// Payment agent's email address.
  final String email;

  /// Commission amount applied on deposits made through this payment agent.
  final String depositCommission;

  /// Currencies that are accepted by this payment agent.
  final String currencies;

  /// Maximum withdrawal allowed for transactions through this payment agent.
  final String? maxWithdrawal;

  /// Minimum withdrawal allowed for transactions through this payment agent.
  final String? minWithdrawal;
}

/// List item class.
class ListItem extends ListItemModel {
  /// Initializes List item class.
  const ListItem({
    required super.currencies,
    required super.depositCommission,
    required super.email,
    required super.furtherInformation,
    required super.name,
    required super.paymentagentLoginid,
    required super.phoneNumbers,
    required super.summary,
    required super.supportedPaymentMethods,
    required super.urls,
    required super.withdrawalCommission,
    super.maxWithdrawal,
    super.minWithdrawal,
  });

  /// Creates an instance from JSON.
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        currencies: json['currencies'],
        depositCommission: json['deposit_commission'],
        email: json['email'],
        furtherInformation: json['further_information'],
        name: json['name'],
        paymentagentLoginid: json['paymentagent_loginid'],
        phoneNumbers: List<PhoneNumbersItem>.from(
          json['phone_numbers'].map(
            (dynamic item) => PhoneNumbersItem.fromJson(item),
          ),
        ),
        summary: json['summary'],
        supportedPaymentMethods: List<SupportedPaymentMethodsItem>.from(
          json['supported_payment_methods'].map(
            (dynamic item) => SupportedPaymentMethodsItem.fromJson(item),
          ),
        ),
        urls: List<UrlsItem>.from(
          json['urls'].map(
            (dynamic item) => UrlsItem.fromJson(item),
          ),
        ),
        withdrawalCommission: json['withdrawal_commission'],
        maxWithdrawal: json['max_withdrawal'],
        minWithdrawal: json['min_withdrawal'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies'] = currencies;
    resultMap['deposit_commission'] = depositCommission;
    resultMap['email'] = email;
    resultMap['further_information'] = furtherInformation;
    resultMap['name'] = name;
    resultMap['paymentagent_loginid'] = paymentagentLoginid;
    resultMap['phone_numbers'] = phoneNumbers
        .map<dynamic>(
          (PhoneNumbersItem item) => item.toJson(),
        )
        .toList();

    resultMap['summary'] = summary;
    resultMap['supported_payment_methods'] = supportedPaymentMethods
        .map<dynamic>(
          (SupportedPaymentMethodsItem item) => item.toJson(),
        )
        .toList();

    resultMap['urls'] = urls
        .map<dynamic>(
          (UrlsItem item) => item.toJson(),
        )
        .toList();

    resultMap['withdrawal_commission'] = withdrawalCommission;
    resultMap['max_withdrawal'] = maxWithdrawal;
    resultMap['min_withdrawal'] = minWithdrawal;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ListItem copyWith({
    String? currencies,
    String? depositCommission,
    String? email,
    String? furtherInformation,
    String? name,
    String? paymentagentLoginid,
    List<PhoneNumbersItem>? phoneNumbers,
    String? summary,
    List<SupportedPaymentMethodsItem>? supportedPaymentMethods,
    List<UrlsItem>? urls,
    String? withdrawalCommission,
    String? maxWithdrawal,
    String? minWithdrawal,
  }) =>
      ListItem(
        currencies: currencies ?? this.currencies,
        depositCommission: depositCommission ?? this.depositCommission,
        email: email ?? this.email,
        furtherInformation: furtherInformation ?? this.furtherInformation,
        name: name ?? this.name,
        paymentagentLoginid: paymentagentLoginid ?? this.paymentagentLoginid,
        phoneNumbers: phoneNumbers ?? this.phoneNumbers,
        summary: summary ?? this.summary,
        supportedPaymentMethods:
            supportedPaymentMethods ?? this.supportedPaymentMethods,
        urls: urls ?? this.urls,
        withdrawalCommission: withdrawalCommission ?? this.withdrawalCommission,
        maxWithdrawal: maxWithdrawal ?? this.maxWithdrawal,
        minWithdrawal: minWithdrawal ?? this.minWithdrawal,
      );
}

/// Phone numbers item model class.
abstract class PhoneNumbersItemModel {
  /// Initializes Phone numbers item model class .
  const PhoneNumbersItemModel({
    this.phoneNumber,
  });

  /// A phone number
  final String? phoneNumber;
}

/// Phone numbers item class.
class PhoneNumbersItem extends PhoneNumbersItemModel {
  /// Initializes Phone numbers item class.
  const PhoneNumbersItem({
    super.phoneNumber,
  });

  /// Creates an instance from JSON.
  factory PhoneNumbersItem.fromJson(Map<String, dynamic> json) =>
      PhoneNumbersItem(
        phoneNumber: json['phone_number'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['phone_number'] = phoneNumber;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PhoneNumbersItem copyWith({
    String? phoneNumber,
  }) =>
      PhoneNumbersItem(
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
}

/// Supported payment methods item model class.
abstract class SupportedPaymentMethodsItemModel {
  /// Initializes Supported payment methods item model class .
  const SupportedPaymentMethodsItemModel({
    this.paymentMethod,
  });

  /// A payment method's name
  final String? paymentMethod;
}

/// Supported payment methods item class.
class SupportedPaymentMethodsItem extends SupportedPaymentMethodsItemModel {
  /// Initializes Supported payment methods item class.
  const SupportedPaymentMethodsItem({
    super.paymentMethod,
  });

  /// Creates an instance from JSON.
  factory SupportedPaymentMethodsItem.fromJson(Map<String, dynamic> json) =>
      SupportedPaymentMethodsItem(
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SupportedPaymentMethodsItem copyWith({
    String? paymentMethod,
  }) =>
      SupportedPaymentMethodsItem(
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}

/// Urls item model class.
abstract class UrlsItemModel {
  /// Initializes Urls item model class .
  const UrlsItemModel({
    this.url,
  });

  /// A webpage or website's URL.
  final String? url;
}

/// Urls item class.
class UrlsItem extends UrlsItemModel {
  /// Initializes Urls item class.
  const UrlsItem({
    super.url,
  });

  /// Creates an instance from JSON.
  factory UrlsItem.fromJson(Map<String, dynamic> json) => UrlsItem(
        url: json['url'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['url'] = url;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  UrlsItem copyWith({
    String? url,
  }) =>
      UrlsItem(
        url: url ?? this.url,
      );
}
