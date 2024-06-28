/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/website_config_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Website config receive class.
class WebsiteConfigReceive extends Response {
  /// Initialize WebsiteConfigReceive.
  const WebsiteConfigReceive({
    this.subscription,
    this.websiteConfig,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory WebsiteConfigReceive.fromJson(Map<String, dynamic> json) =>
      WebsiteConfigReceive(
        subscription: json['subscription'] as Map<String, dynamic>?,
        websiteConfig: json['website_config'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Server status and other information regarding general settings
  final Map<String, dynamic>? websiteConfig;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscription': subscription,
        'website_config': websiteConfig,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WebsiteConfigReceive copyWith({
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? websiteConfig,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      WebsiteConfigReceive(
        subscription: subscription ?? this.subscription,
        websiteConfig: websiteConfig ?? this.websiteConfig,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
