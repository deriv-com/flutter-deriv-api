/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/residence_list_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// ResidenceListRequest class
class ResidenceListRequest extends Request {
  /// Initialize ResidenceListRequest
  const ResidenceListRequest({
    this.residenceList = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'residence_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ResidenceListRequest.fromJson(Map<String, dynamic> json) =>
      ResidenceListRequest(
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        residenceList:
            json['residence_list'] == null ? null : json['residence_list'] == 1,
      );

  /// Must be `true`
  final bool residenceList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'residence_list': residenceList == null ? null : residenceList ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResidenceListRequest copyWith({
    bool residenceList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ResidenceListRequest(
        residenceList: residenceList ?? this.residenceList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
