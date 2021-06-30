/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_create_send.json

import '../request.dart';

/// Paymentagent create request class
class PaymentagentCreateRequest extends Request {
  /// Initialize PaymentagentCreateRequest
  const PaymentagentCreateRequest({
    this.affiliateId,
    @required this.codeOfConductApproval,
    @required this.commissionDeposit,
    @required this.commissionWithdrawal,
    @required this.email,
    this.information,
    @required this.paymentAgentName,
    this.paymentagentCreate = true,
    @required this.phone,
    @required this.supportedPaymentMethods,
    @required this.url,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'paymentagent_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
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
        phone: json['phone'] as String?,
        supportedPaymentMethods:
            (json['supported_payment_methods'] as List<dynamic>?)
                ?.map<String>((dynamic item) => item as String)
                .toList(),
        url: json['url'] as String?,
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

  /// Payment agent's phone number with coutry code.
  final String? phone;

  /// A list of supported payment methods.
  final List<String>? supportedPaymentMethods;

  /// The URL of payment agent's website.
  final String? url;

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
        'phone': phone,
        'supported_payment_methods': supportedPaymentMethods,
        'url': url,
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
    String? phone,
    List<String>? supportedPaymentMethods,
    String? url,
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
        phone: phone ?? this.phone,
        supportedPaymentMethods:
            supportedPaymentMethods ?? this.supportedPaymentMethods,
        url: url ?? this.url,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
