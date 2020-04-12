/// generated automatically from flutter_deriv_api|lib/api/website_status_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'website_status_receive.g.dart';

/// JSON conversion for 'website_status_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class WebsiteStatusResponse extends Response {
  /// Initialize WebsiteStatusResponse
  const WebsiteStatusResponse({
    this.subscription,
    this.websiteStatus,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory WebsiteStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$WebsiteStatusResponseFromJson(json);

  // Properties
  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Server status and other information regarding general settings
  final Map<String, dynamic> websiteStatus;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$WebsiteStatusResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  WebsiteStatusResponse copyWith({
    Map<String, dynamic> subscription,
    Map<String, dynamic> websiteStatus,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      WebsiteStatusResponse(
        subscription: subscription ?? this.subscription,
        websiteStatus: websiteStatus ?? this.websiteStatus,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
