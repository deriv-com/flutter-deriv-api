/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/website_status_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Website status send class
class WebsiteStatusSend extends Request {
  /// Initialize WebsiteStatusSend
  const WebsiteStatusSend({
    this.subscribe,
    this.websiteStatus = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'website_status',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory WebsiteStatusSend.fromJson(Map<String, dynamic> json) =>
      WebsiteStatusSend(
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        websiteStatus:
            json['website_status'] == null ? null : json['website_status'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] `true` to stream the server/website status updates.
  final bool subscribe;

  /// Must be `true`
  final bool websiteStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscribe': subscribe == null
            ? null
            : subscribe
                ? 1
                : 0,
        'website_status': websiteStatus == null
            ? null
            : websiteStatus
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WebsiteStatusSend copyWith({
    bool subscribe,
    bool websiteStatus,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      WebsiteStatusSend(
        subscribe: subscribe ?? this.subscribe,
        websiteStatus: websiteStatus ?? this.websiteStatus,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
