/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// ForgetRequest class
class ForgetRequest extends Request {
  /// Initialize ForgetRequest
  const ForgetRequest({
    @required this.forget,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'forget',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ForgetRequest.fromJson(Map<String, dynamic> json) => ForgetRequest(
        // ignore: avoid_as
        forget: json['forget'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// ID of the real-time stream of messages to cancel.
  final String forget;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'forget': forget,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetRequest copyWith({
    String forget,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ForgetRequest(
        forget: forget ?? this.forget,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
