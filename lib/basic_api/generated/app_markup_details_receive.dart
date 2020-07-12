/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_markup_details_receive.json

import '../response.dart';

/// AppMarkupDetailsResponse class
class AppMarkupDetailsResponse extends Response {
  /// Initialize AppMarkupDetailsResponse
  const AppMarkupDetailsResponse({
    this.appMarkupDetails,
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

  /// Creates an instance from JSON
  factory AppMarkupDetailsResponse.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetailsResponse(
        // ignore: avoid_as
        appMarkupDetails: json['app_markup_details'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// App Markup transaction details
  final Map<String, dynamic> appMarkupDetails;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_markup_details': appMarkupDetails,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppMarkupDetailsResponse copyWith({
    Map<String, dynamic> appMarkupDetails,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppMarkupDetailsResponse(
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
