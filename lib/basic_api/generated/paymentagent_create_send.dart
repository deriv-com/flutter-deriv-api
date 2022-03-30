/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_create_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Paymentagent create request class.
class PaymentagentCreateRequest extends Request {
  /// Initialize PaymentagentCreateRequest.
  const PaymentagentCreateRequest({
    this.affiliateId,
    required this.codeOfConductApproval,
    required this.commissionDeposit,
    required this.commissionWithdrawal,
    required this.email,
    this.information,
    required this.paymentAgentName,
    this.paymentagentCreate = true,
    required this.phoneNumbers,
    required this.supportedPaymentMethods,
    required this.urls,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'paymentagent_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory PaymentagentCreateRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentCreateRequest(
        affiliateId: json['affiliate_id'] as String?,
        codeOfConductApproval: json['code_of_conduct_approval'] as int?,
        commissionDeposit: json['commission_deposit'] as num?,
        commissionWithdrawal: json['commission_withdrawal'] as num?,
        email: json['email'] as String?,
        information: json['information'] as String?,
        paymentAgentName: json['payment_agent_name'] as String?,
        paymentagentCreate: json['paymentagent_create'] == null
            ? null
            : json['paymentagent_create'] == 1,
        phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        supportedPaymentMethods:
            (json['supported_payment_methods'] as List<dynamic>?)
                ?.map<Map<String, dynamic>>(
                    (dynamic item) => item as Map<String, dynamic>)
                .toList(),
        urls: (json['urls'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Client's My Affiliate id, if exists.
  final String? affiliateId;

  /// Indicates client's agreement with the Code of Conduct.
  final int? codeOfConductApproval;

  /// Commission  (%) the agent wants to take on deposits
  final num? commissionDeposit;

  /// Commission  (%) the agent wants to take on withdrawals
  final num? commissionWithdrawal;

  /// Payment agent's email address.
  final String? email;

  /// [Optional] Information about payment agent and their proposed service.
  final String? information;

  /// The name with which the payment agent is going to be identified.
  final String? paymentAgentName;

  /// Must be `true`
  final bool? paymentagentCreate;

  /// Payment agent's phone number(s) with country code.
  final List<Map<String, dynamic>>? phoneNumbers;

  /// A list of supported payment methods.
  final List<Map<String, dynamic>>? supportedPaymentMethods;

  /// The URL(s) of payment agent's website(s).
  final List<Map<String, dynamic>>? urls;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'affiliate_id': affiliateId,
        'code_of_conduct_approval': codeOfConductApproval,
        'commission_deposit': commissionDeposit,
        'commission_withdrawal': commissionWithdrawal,
        'email': email,
        'information': information,
        'payment_agent_name': paymentAgentName,
        'paymentagent_create': paymentagentCreate == null
            ? null
            : paymentagentCreate!
                ? 1
                : 0,
        'phone_numbers': phoneNumbers,
        'supported_payment_methods': supportedPaymentMethods,
        'urls': urls,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentCreateRequest copyWith({
    String? affiliateId,
    int? codeOfConductApproval,
    num? commissionDeposit,
    num? commissionWithdrawal,
    String? email,
    String? information,
    String? paymentAgentName,
    bool? paymentagentCreate,
    List<Map<String, dynamic>>? phoneNumbers,
    List<Map<String, dynamic>>? supportedPaymentMethods,
    List<Map<String, dynamic>>? urls,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentagentCreateRequest(
        affiliateId: affiliateId ?? this.affiliateId,
        codeOfConductApproval:
            codeOfConductApproval ?? this.codeOfConductApproval,
        commissionDeposit: commissionDeposit ?? this.commissionDeposit,
        commissionWithdrawal: commissionWithdrawal ?? this.commissionWithdrawal,
        email: email ?? this.email,
        information: information ?? this.information,
        paymentAgentName: paymentAgentName ?? this.paymentAgentName,
        paymentagentCreate: paymentagentCreate ?? this.paymentagentCreate,
        phoneNumbers: phoneNumbers ?? this.phoneNumbers,
        supportedPaymentMethods:
            supportedPaymentMethods ?? this.supportedPaymentMethods,
        urls: urls ?? this.urls,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
