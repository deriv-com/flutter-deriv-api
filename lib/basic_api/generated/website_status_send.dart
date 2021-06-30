/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/website_status_send.json.

import '../request.dart';

/// Website status request class.
class WebsiteStatusRequest extends Request {
  /// Initialize WebsiteStatusRequest.
  const WebsiteStatusRequest({
    this.subscribe,
    this.websiteStatus = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'website_status',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory WebsiteStatusRequest.fromJson(Map<String, dynamic> json) =>
      WebsiteStatusRequest(
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        websiteStatus:
            json['website_status'] == null ? null : json['website_status'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] `true` to stream the server/website status updates.
  final bool? subscribe;

  /// Must be `true`
  final bool? websiteStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'website_status': websiteStatus == null
            ? null
            : websiteStatus!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WebsiteStatusRequest copyWith({
    bool? subscribe,
    bool? websiteStatus,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      WebsiteStatusRequest(
        subscribe: subscribe ?? this.subscribe,
        websiteStatus: websiteStatus ?? this.websiteStatus,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
