/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/website_status_receive.json.

import '../response.dart';

/// Website status response class.
class WebsiteStatusResponse extends Response {
  /// Initialize WebsiteStatusResponse.
  const WebsiteStatusResponse({
    this.subscription,
    this.websiteStatus,
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
  factory WebsiteStatusResponse.fromJson(Map<String, dynamic> json) =>
      WebsiteStatusResponse(
        subscription: json['subscription'] as Map<String, dynamic>?,
        websiteStatus: json['website_status'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Server status and other information regarding general settings
  final Map<String, dynamic>? websiteStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscription': subscription,
        'website_status': websiteStatus,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WebsiteStatusResponse copyWith({
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? websiteStatus,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      WebsiteStatusResponse(
        subscription: subscription ?? this.subscription,
        websiteStatus: websiteStatus ?? this.websiteStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
