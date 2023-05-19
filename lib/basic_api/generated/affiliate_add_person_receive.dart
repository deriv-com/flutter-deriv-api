/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/affiliate_add_person_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Affiliate add person receive class.
class AffiliateAddPersonReceive extends Response {
  /// Initialize AffiliateAddPersonReceive.
  const AffiliateAddPersonReceive({
    this.affiliateAddPerson,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory AffiliateAddPersonReceive.fromJson(Map<String, dynamic> json) =>
      AffiliateAddPersonReceive(
        affiliateAddPerson:
            json['affiliate_add_person'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information of the affiliate user trying to register.
  final Map<String, dynamic>? affiliateAddPerson;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'affiliate_add_person': affiliateAddPerson,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AffiliateAddPersonReceive copyWith({
    Map<String, dynamic>? affiliateAddPerson,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AffiliateAddPersonReceive(
        affiliateAddPerson: affiliateAddPerson ?? this.affiliateAddPerson,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
