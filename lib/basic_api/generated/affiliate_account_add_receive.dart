/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/affiliate_account_add_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Affiliate account add receive class.
class AffiliateAccountAddReceive extends Response {
  /// Initialize AffiliateAccountAddReceive.
  const AffiliateAccountAddReceive({
    this.affiliateAccountAdd,
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
  factory AffiliateAccountAddReceive.fromJson(Map<String, dynamic> json) =>
      AffiliateAccountAddReceive(
        affiliateAccountAdd:
            json['affiliate_account_add'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information of the affiliate user trying to register.
  final Map<String, dynamic>? affiliateAccountAdd;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'affiliate_account_add': affiliateAccountAdd,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AffiliateAccountAddReceive copyWith({
    Map<String, dynamic>? affiliateAccountAdd,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AffiliateAccountAddReceive(
        affiliateAccountAdd: affiliateAccountAdd ?? this.affiliateAccountAdd,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
