/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_login_list_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Mt5LoginListResponse class
class Mt5LoginListResponse extends Response {
  /// Initialize Mt5LoginListResponse
  const Mt5LoginListResponse({
    this.mt5LoginList,
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
  factory Mt5LoginListResponse.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        mt5LoginList: (json['mt5_login_list'] as List)
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        reqId: json['req_id'] as int,
      );

  /// Array containing MT5 account objects.
  final List<Map<String, dynamic>> mt5LoginList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'mt5_login_list': mt5LoginList,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5LoginListResponse copyWith({
    List<Map<String, dynamic>> mt5LoginList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
