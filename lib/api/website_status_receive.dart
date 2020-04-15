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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      WebsiteStatusResponse(
        subscription: subscription ?? this.subscription,
        websiteStatus: websiteStatus ?? this.websiteStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
