import 'package:flutter_deriv_api/helpers/helpers.dart';


/// Paymentagent details response model class.
abstract class PaymentagentDetailsResponseModel {
  /// Initializes.
  PaymentagentDetailsResponseModel({
    this.paymentagentDetails,
  });

  /// The payment agent details.
  final PaymentagentDetails? paymentagentDetails;
}

/// Paymentagent details response class.
class PaymentagentDetailsResponse extends PaymentagentDetailsResponseModel {
  /// Initializes
  PaymentagentDetailsResponse({
    PaymentagentDetails? paymentagentDetails,
  }) : super(
          paymentagentDetails: paymentagentDetails,
        );

  /// Creates an instance from JSON
  factory PaymentagentDetailsResponse.fromJson(
    dynamic paymentagentDetailsJson,
  ) =>
      PaymentagentDetailsResponse(
        paymentagentDetails: paymentagentDetailsJson == null
            ? null
            : PaymentagentDetails.fromJson(paymentagentDetailsJson),
      );

  /// Converts an instance to JSON
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
  /// Initializes.
  PaymentagentDetailsModel({
    this.affiliateId,
    this.codeOfConductApproval,
    this.commissionDeposit,
    this.commissionWithdrawal,
    this.currencyCode,
    this.email,
    this.information,
    this.isAuthenticated,
    this.isListed,
    this.maxWithdrawal,
    this.minWithdrawal,
    this.paymentAgentName,
    this.phone,
    this.supportedPaymentMethods,
    this.targetCountry,
    this.url,
  });

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

  /// Payment agent's email address.
  final String? email;

  /// Information about payment agent and their proposed service.
  final String? information;

  /// Indicates if client is authenticated by Deriv.
  final bool? isAuthenticated;

  /// Wether or not the client should be listed among available agents in the FE.
  final bool? isListed;

  /// Maximum amount allowed for withdrawals
  final double? maxWithdrawal;

  /// Minimum amount allowed for withdrawals
  final double? minWithdrawal;

  /// The name with which the payment agent is going to be identified.
  final String? paymentAgentName;

  /// Payment agent's phone number with country code.
  final String? phone;

  /// A list of supported payment methods.
  final List<String>? supportedPaymentMethods;

  /// Client's target country.
  final String? targetCountry;

  /// The URL of payment agent's website.
  final String? url;
}

/// Paymentagent details class.
class PaymentagentDetails extends PaymentagentDetailsModel {
  /// Initializes
  PaymentagentDetails({
    String? affiliateId,
    bool? codeOfConductApproval,
    double? commissionDeposit,
    double? commissionWithdrawal,
    String? currencyCode,
    String? email,
    String? information,
    bool? isAuthenticated,
    bool? isListed,
    double? maxWithdrawal,
    double? minWithdrawal,
    String? paymentAgentName,
    String? phone,
    List<String>? supportedPaymentMethods,
    String? targetCountry,
    String? url,
  }) : super(
          affiliateId: affiliateId,
          codeOfConductApproval: codeOfConductApproval,
          commissionDeposit: commissionDeposit,
          commissionWithdrawal: commissionWithdrawal,
          currencyCode: currencyCode,
          email: email,
          information: information,
          isAuthenticated: isAuthenticated,
          isListed: isListed,
          maxWithdrawal: maxWithdrawal,
          minWithdrawal: minWithdrawal,
          paymentAgentName: paymentAgentName,
          phone: phone,
          supportedPaymentMethods: supportedPaymentMethods,
          targetCountry: targetCountry,
          url: url,
        );

  /// Creates an instance from JSON
  factory PaymentagentDetails.fromJson(Map<String, dynamic> json) =>
      PaymentagentDetails(
        affiliateId: json['affiliate_id'],
        codeOfConductApproval: getBool(json['code_of_conduct_approval']),
        commissionDeposit: getDouble(json['commission_deposit']),
        commissionWithdrawal: getDouble(json['commission_withdrawal']),
        currencyCode: json['currency_code'],
        email: json['email'],
        information: json['information'],
        isAuthenticated: getBool(json['is_authenticated']),
        isListed: getBool(json['is_listed']),
        maxWithdrawal: getDouble(json['max_withdrawal']),
        minWithdrawal: getDouble(json['min_withdrawal']),
        paymentAgentName: json['payment_agent_name'],
        phone: json['phone'],
        supportedPaymentMethods: json['supported_payment_methods'] == null
            ? null
            : List<String>.from(
                json['supported_payment_methods']?.map(
                  (dynamic item) => item,
                ),
              ),
        targetCountry: json['target_country'],
        url: json['url'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['affiliate_id'] = affiliateId;
    resultMap['code_of_conduct_approval'] = codeOfConductApproval;
    resultMap['commission_deposit'] = commissionDeposit;
    resultMap['commission_withdrawal'] = commissionWithdrawal;
    resultMap['currency_code'] = currencyCode;
    resultMap['email'] = email;
    resultMap['information'] = information;
    resultMap['is_authenticated'] = isAuthenticated;
    resultMap['is_listed'] = isListed;
    resultMap['max_withdrawal'] = maxWithdrawal;
    resultMap['min_withdrawal'] = minWithdrawal;
    resultMap['payment_agent_name'] = paymentAgentName;
    resultMap['phone'] = phone;
    if (supportedPaymentMethods != null) {
      resultMap['supported_payment_methods'] = supportedPaymentMethods!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['target_country'] = targetCountry;
    resultMap['url'] = url;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentagentDetails copyWith({
    String? affiliateId,
    bool? codeOfConductApproval,
    double? commissionDeposit,
    double? commissionWithdrawal,
    String? currencyCode,
    String? email,
    String? information,
    bool? isAuthenticated,
    bool? isListed,
    double? maxWithdrawal,
    double? minWithdrawal,
    String? paymentAgentName,
    String? phone,
    List<String>? supportedPaymentMethods,
    String? targetCountry,
    String? url,
  }) =>
      PaymentagentDetails(
        affiliateId: affiliateId ?? this.affiliateId,
        codeOfConductApproval:
            codeOfConductApproval ?? this.codeOfConductApproval,
        commissionDeposit: commissionDeposit ?? this.commissionDeposit,
        commissionWithdrawal: commissionWithdrawal ?? this.commissionWithdrawal,
        currencyCode: currencyCode ?? this.currencyCode,
        email: email ?? this.email,
        information: information ?? this.information,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        isListed: isListed ?? this.isListed,
        maxWithdrawal: maxWithdrawal ?? this.maxWithdrawal,
        minWithdrawal: minWithdrawal ?? this.minWithdrawal,
        paymentAgentName: paymentAgentName ?? this.paymentAgentName,
        phone: phone ?? this.phone,
        supportedPaymentMethods:
            supportedPaymentMethods ?? this.supportedPaymentMethods,
        targetCountry: targetCountry ?? this.targetCountry,
        url: url ?? this.url,
      );
}
