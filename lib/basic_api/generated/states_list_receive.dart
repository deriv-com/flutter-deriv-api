/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/states_list_receive.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// States list response class.
class StatesListResponse extends Response {
  /// Initialize StatesListResponse.
  const StatesListResponse({
    this.statesList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory StatesListResponse.fromJson(Map<String, dynamic> json) =>
      StatesListResponse(
        statesList: (json['states_list'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of states.
  final List<Map<String, dynamic>>? statesList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'states_list': statesList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  StatesListResponse copyWith({
    List<Map<String, dynamic>>? statesList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      StatesListResponse(
        statesList: statesList ?? this.statesList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
