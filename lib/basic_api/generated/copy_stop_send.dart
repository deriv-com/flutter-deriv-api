/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_stop_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// CopyStopRequest class
class CopyStopRequest extends Request {
  /// Initialize CopyStopRequest
  const CopyStopRequest({
    @required this.copyStop,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'copy_stop',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CopyStopRequest.fromJson(Map<String, dynamic> json) =>
      CopyStopRequest(
        // ignore: avoid_as
        copyStop: json['copy_stop'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// API tokens identifying the accounts which needs not to be copied
  final String copyStop;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copy_stop': copyStop,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStopRequest copyWith({
    String copyStop,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CopyStopRequest(
        copyStop: copyStop ?? this.copyStop,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
