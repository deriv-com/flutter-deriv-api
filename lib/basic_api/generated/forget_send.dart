/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Forget request class.
class ForgetRequest extends Request {
  /// Initialize ForgetRequest.
  const ForgetRequest({
    required this.forget,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'forget',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory ForgetRequest.fromJson(Map<String, dynamic> json) => ForgetRequest(
        forget: json['forget'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// ID of the real-time stream of messages to cancel.
  final String? forget;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'forget': forget,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetRequest copyWith({
    String? forget,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ForgetRequest(
        forget: forget ?? this.forget,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
