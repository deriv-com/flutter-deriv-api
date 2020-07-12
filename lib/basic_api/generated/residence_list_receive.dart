/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/residence_list_receive.json

import '../response.dart';

/// ResidenceListResponse class
class ResidenceListResponse extends Response {
  /// Initialize ResidenceListResponse
  const ResidenceListResponse({
    this.residenceList,
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
  factory ResidenceListResponse.fromJson(Map<String, dynamic> json) =>
      ResidenceListResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as, always_specify_types
        residenceList: (json['residence_list'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
      );

  /// List of countries for account opening
  final List<Map<String, dynamic>> residenceList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'residence_list': residenceList,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResidenceListResponse copyWith({
    List<Map<String, dynamic>> residenceList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ResidenceListResponse(
        residenceList: residenceList ?? this.residenceList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
