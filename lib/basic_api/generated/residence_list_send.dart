/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/residence_list_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Residence list send class
class ResidenceListSend extends Request {
  /// Initialize ResidenceListSend
  const ResidenceListSend({
    this.residenceList = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'residence_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ResidenceListSend.fromJson(Map<String, dynamic> json) =>
      ResidenceListSend(
        residenceList:
            json['residence_list'] == null ? null : json['residence_list'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool residenceList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'residence_list': residenceList == null
            ? null
            : residenceList
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResidenceListSend copyWith({
    bool residenceList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ResidenceListSend(
        residenceList: residenceList ?? this.residenceList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
