/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/states_list_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// StatesListResponse class
class StatesListResponse extends Response {
  /// Initialize StatesListResponse
  const StatesListResponse({
    this.statesList,
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
  factory StatesListResponse.fromJson(Map<String, dynamic> json) =>
      StatesListResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        statesList: (json['states_list'] as List)
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
      );

  /// List of states.
  final List<Map<String, dynamic>> statesList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'states_list': statesList,
      };

  /// Creates a copy of instance with given parameters
  @override
  StatesListResponse copyWith({
    List<Map<String, dynamic>> statesList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      StatesListResponse(
        statesList: statesList ?? this.statesList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
