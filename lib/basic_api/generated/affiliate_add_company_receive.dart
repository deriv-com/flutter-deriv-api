/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/affiliate_add_company_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Affiliate add company receive class.
class AffiliateAddCompanyReceive extends Response {
  /// Initialize AffiliateAddCompanyReceive.
  const AffiliateAddCompanyReceive({
    this.affiliateAddCompany,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AffiliateAddCompanyReceive.fromJson(Map<String, dynamic> json) =>
      AffiliateAddCompanyReceive(
        affiliateAddCompany:
            json['affiliate_add_company'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information of the affiliate user trying to register.
  final Map<String, dynamic>? affiliateAddCompany;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'affiliate_add_company': affiliateAddCompany,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AffiliateAddCompanyReceive copyWith({
    Map<String, dynamic>? affiliateAddCompany,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AffiliateAddCompanyReceive(
        affiliateAddCompany: affiliateAddCompany ?? this.affiliateAddCompany,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
