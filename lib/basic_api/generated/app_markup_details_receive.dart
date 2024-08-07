/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_markup_details_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// App markup details receive class.
class AppMarkupDetailsReceive extends Response {
  /// Initialize AppMarkupDetailsReceive.
  const AppMarkupDetailsReceive({
    this.appMarkupDetails,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AppMarkupDetailsReceive.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetailsReceive(
        appMarkupDetails: json['app_markup_details'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// App Markup transaction details
  final Map<String, dynamic>? appMarkupDetails;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_markup_details': appMarkupDetails,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppMarkupDetailsReceive copyWith({
    Map<String, dynamic>? appMarkupDetails,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AppMarkupDetailsReceive(
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
