/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// Forget send class
class ForgetSend extends Request {
  /// Initialize ForgetSend
  const ForgetSend({
    @required this.forget,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'forget',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ForgetSend.fromJson(Map<String, dynamic> json) => ForgetSend(
        forget: json['forget'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// ID of the real-time stream of messages to cancel.
  final String forget;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'forget': forget,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetSend copyWith({
    String forget,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ForgetSend(
        forget: forget ?? this.forget,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
