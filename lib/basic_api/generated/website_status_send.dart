/// generated automatically from flutter_deriv_api|lib/basic_api/generated/website_status_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'website_status_send.g.dart';

/// JSON conversion for 'website_status_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class WebsiteStatusRequest extends Request {
  /// Initialize WebsiteStatusRequest
  const WebsiteStatusRequest({
    this.subscribe,
    this.websiteStatus = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'website_status',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory WebsiteStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$WebsiteStatusRequestFromJson(json);

  // Properties
  /// [Optional] `1` to stream the server/website status updates.
  final int subscribe;

  /// Must be `1`
  final int websiteStatus;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$WebsiteStatusRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  WebsiteStatusRequest copyWith({
    int subscribe,
    int websiteStatus,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      WebsiteStatusRequest(
        subscribe: subscribe ?? this.subscribe,
        websiteStatus: websiteStatus ?? this.websiteStatus,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
