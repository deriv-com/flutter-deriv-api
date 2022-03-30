/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/residence_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Residence list response class.
class ResidenceListResponse extends Response {
  /// Initialize ResidenceListResponse.
  const ResidenceListResponse({
    this.residenceList,
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
  factory ResidenceListResponse.fromJson(Map<String, dynamic> json) =>
      ResidenceListResponse(
        residenceList: (json['residence_list'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of countries for account opening
  final List<Map<String, dynamic>>? residenceList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'residence_list': residenceList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResidenceListResponse copyWith({
    List<Map<String, dynamic>>? residenceList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ResidenceListResponse(
        residenceList: residenceList ?? this.residenceList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
