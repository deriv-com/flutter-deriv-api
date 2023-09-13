// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
/// Paymentagent details response model class.
abstract class PaymentagentDetailsResponseModel {
  /// Initializes Paymentagent details response model class .
  const PaymentagentDetailsResponseModel({
    this.paymentagentDetails,
  });

  /// The payment agent details.
  final PaymentagentDetails? paymentagentDetails;
}

/// Paymentagent details response class.
class PaymentagentDetailsResponse extends PaymentagentDetailsResponseModel {
  /// Initializes Paymentagent details response class.
  const PaymentagentDetailsResponse({
    super.paymentagentDetails,
  });

  /// Creates an instance from JSON.
  factory PaymentagentDetailsResponse.fromJson(
    dynamic paymentagentDetailsJson,
  ) =>
      PaymentagentDetailsResponse(
        paymentagentDetails: paymentagentDetailsJson == null
            ? null
            : PaymentagentDetails.fromJson(paymentagentDetailsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (paymentagentDetails != null) {
      resultMap['paymentagent_details'] = paymentagentDetails!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentagentDetailsResponse copyWith({
    PaymentagentDetails? paymentagentDetails,
  }) =>
      PaymentagentDetailsResponse(
        paymentagentDetails: paymentagentDetails ?? this.paymentagentDetails,
      );
}
/// Paymentagent details model class.
abstract class PaymentagentDetailsModel {
  /// Initializes Paymentagent details model class .
  const PaymentagentDetailsModel({
    required this.canApply,
    this.affiliateId,
    this.codeOfConductApproval,
    this.commissionDeposit,
    this.commissionWithdrawal,
    this.currencyCode,
    this.eligibiltyValidation,
    this.email,
    this.information,
    this.maxWithdrawal,
    this.minWithdrawal,
    this.newlyAuthorized,
    this.paymentAgentName,
    this.phoneNumbers,
    this.status,
    this.supportedPaymentMethods,
    this.targetCountry,
    this.urls,
  });

  /// If `true`, the client may apply using paymentagent_create.
  final bool canApply;

  /// Client's My Affiliate id, if exists.
  final String? affiliateId;

  /// Indicates client's agreement with the Code of Conduct document.
  final bool? codeOfConductApproval;

  /// Commission (%) the agent want to take on deposits
  final double? commissionDeposit;

  /// Commission (%) the agent want to take on withdrawals
  final double? commissionWithdrawal;

  /// Currency supported by the payment agent. It's usually the same as agent's Deriv account currency.
  final String? currencyCode;

  /// Contains a list of error codes that would prevent a successful payment agent application.
  final List<String>? eligibiltyValidation;

  /// Payment agent's email address.
  final String? email;

  /// Information about payment agent and their proposed service.
  final String? information;

  /// Maximum amount allowed for withdrawals
  final double? maxWithdrawal;

  /// Minimum amount allowed for withdrawals
  final double? minWithdrawal;

  /// Indicates if the payment agent was recently approved with no transactions yet.
  final bool? newlyAuthorized;

  /// The name with which the payment agent is going to be identified.
  final String? paymentAgentName;

  /// Payment agent's phone number(s) with country code.
  final List<PhoneNumbersItem>? phoneNumbers;

  /// Indicates the status of the Payment Agent.
  final Map<String, dynamic>? status;

  /// A list of supported payment methods.
  final List<SupportedPaymentMethodsItem>? supportedPaymentMethods;

  /// Client's target country.
  final String? targetCountry;

  /// The URL(s) of payment agent's website(s).
  final List<UrlsItem>? urls;
}

/// Paymentagent details class.
class PaymentagentDetails extends PaymentagentDetailsModel {
  /// Initializes Paymentagent details class.
  const PaymentagentDetails({
    required super.canApply,
    super.affiliateId,
    super.codeOfConductApproval,
    super.commissionDeposit,
    super.commissionWithdrawal,
    super.currencyCode,
    super.eligibiltyValidation,
    super.email,
    super.information,
    super.maxWithdrawal,
    super.minWithdrawal,
    super.newlyAuthorized,
    super.paymentAgentName,
    super.phoneNumbers,
    super.status,
    super.supportedPaymentMethods,
    super.targetCountry,
    super.urls,
  });

  /// Creates an instance from JSON.
  factory PaymentagentDetails.fromJson(Map<String, dynamic> json) =>
      PaymentagentDetails(
        canApply: getBool(json['can_apply'])!,
        affiliateId: json['affiliate_id'],
        codeOfConductApproval: getBool(json['code_of_conduct_approval']),
        commissionDeposit: getDouble(json['commission_deposit']),
        commissionWithdrawal: getDouble(json['commission_withdrawal']),
        currencyCode: json['currency_code'],
        eligibiltyValidation: json['eligibilty_validation'] == null
            ? null
            : List<String>.from(
                json['eligibilty_validation']?.map(
                  (dynamic item) => item,
                ),
              ),
        email: json['email'],
        information: json['information'],
        maxWithdrawal: getDouble(json['max_withdrawal']),
        minWithdrawal: getDouble(json['min_withdrawal']),
        newlyAuthorized: getBool(json['newly_authorized']),
        paymentAgentName: json['payment_agent_name'],
        phoneNumbers: json['phone_numbers'] == null
            ? null
            : List<PhoneNumbersItem>.from(
                json['phone_numbers']?.map(
                  (dynamic item) => PhoneNumbersItem.fromJson(item),
                ),
              ),
        status: json['status'],
        supportedPaymentMethods: json['supported_payment_methods'] == null
            ? null
            : List<SupportedPaymentMethodsItem>.from(
                json['supported_payment_methods']?.map(
                  (dynamic item) => SupportedPaymentMethodsItem.fromJson(item),
                ),
              ),
        targetCountry: json['target_country'],
        urls: json['urls'] == null
            ? null
            : List<UrlsItem>.from(
                json['urls']?.map(
                  (dynamic item) => UrlsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['can_apply'] = canApply;
    resultMap['affiliate_id'] = affiliateId;
    resultMap['code_of_conduct_approval'] = codeOfConductApproval;
    resultMap['commission_deposit'] = commissionDeposit;
    resultMap['commission_withdrawal'] = commissionWithdrawal;
    resultMap['currency_code'] = currencyCode;
    if (eligibiltyValidation != null) {
      resultMap['eligibilty_validation'] = eligibiltyValidation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['email'] = email;
    resultMap['information'] = information;
    resultMap['max_withdrawal'] = maxWithdrawal;
    resultMap['min_withdrawal'] = minWithdrawal;
    resultMap['newly_authorized'] = newlyAuthorized;
    resultMap['payment_agent_name'] = paymentAgentName;
    if (phoneNumbers != null) {
      resultMap['phone_numbers'] = phoneNumbers!
          .map<dynamic>(
            (PhoneNumbersItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['status'] = status;
    if (supportedPaymentMethods != null) {
      resultMap['supported_payment_methods'] = supportedPaymentMethods!
          .map<dynamic>(
            (SupportedPaymentMethodsItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['target_country'] = targetCountry;
    if (urls != null) {
      resultMap['urls'] = urls!
          .map<dynamic>(
            (UrlsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentagentDetails copyWith({
    bool? canApply,
    String? affiliateId,
    bool? codeOfConductApproval,
    double? commissionDeposit,
    double? commissionWithdrawal,
    String? currencyCode,
    List<String>? eligibiltyValidation,
    String? email,
    String? information,
    double? maxWithdrawal,
    double? minWithdrawal,
    bool? newlyAuthorized,
    String? paymentAgentName,
    List<PhoneNumbersItem>? phoneNumbers,
    Map<String, dynamic>? status,
    List<SupportedPaymentMethodsItem>? supportedPaymentMethods,
    String? targetCountry,
    List<UrlsItem>? urls,
  }) =>
      PaymentagentDetails(
        canApply: canApply ?? this.canApply,
        affiliateId: affiliateId ?? this.affiliateId,
        codeOfConductApproval:
            codeOfConductApproval ?? this.codeOfConductApproval,
        commissionDeposit: commissionDeposit ?? this.commissionDeposit,
        commissionWithdrawal: commissionWithdrawal ?? this.commissionWithdrawal,
        currencyCode: currencyCode ?? this.currencyCode,
        eligibiltyValidation: eligibiltyValidation ?? this.eligibiltyValidation,
        email: email ?? this.email,
        information: information ?? this.information,
        maxWithdrawal: maxWithdrawal ?? this.maxWithdrawal,
        minWithdrawal: minWithdrawal ?? this.minWithdrawal,
        newlyAuthorized: newlyAuthorized ?? this.newlyAuthorized,
        paymentAgentName: paymentAgentName ?? this.paymentAgentName,
        phoneNumbers: phoneNumbers ?? this.phoneNumbers,
        status: status ?? this.status,
        supportedPaymentMethods:
            supportedPaymentMethods ?? this.supportedPaymentMethods,
        targetCountry: targetCountry ?? this.targetCountry,
        urls: urls ?? this.urls,
      );
}
/// Phone numbers item model class.
abstract class PhoneNumbersItemModel {
  /// Initializes Phone numbers item model class .
  const PhoneNumbersItemModel({
    this.phoneNumber,
  });

  /// A phone number.
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

  /// A website url.
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
