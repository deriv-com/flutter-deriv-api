/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/website_config_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Website config request class.
class WebsiteConfigRequest extends Request {
  /// Initialize WebsiteConfigRequest.
  const WebsiteConfigRequest({
    this.websiteConfig = true,
    super.msgType = 'website_config',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory WebsiteConfigRequest.fromJson(Map<String, dynamic> json) =>
      WebsiteConfigRequest(
        websiteConfig:
            json['website_config'] == null ? null : json['website_config'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? websiteConfig;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'website_config': websiteConfig == null
            ? null
            : websiteConfig!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WebsiteConfigRequest copyWith({
    bool? websiteConfig,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      WebsiteConfigRequest(
        websiteConfig: websiteConfig ?? this.websiteConfig,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
