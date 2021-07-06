/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cancel_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Cancel send class.
class CancelSend extends Request {
  /// Initialize CancelSend.
  const CancelSend({
    required this.cancel,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'cancel',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory CancelSend.fromJson(Map<String, dynamic> json) => CancelSend(
        cancel: json['cancel'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Value should be the `contract_id` which received from the `portfolio` call.
  final int? cancel;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cancel': cancel,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CancelSend copyWith({
    int? cancel,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CancelSend(
        cancel: cancel ?? this.cancel,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
