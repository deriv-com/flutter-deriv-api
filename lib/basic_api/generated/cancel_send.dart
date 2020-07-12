/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cancel_send.json

import '../request.dart';

/// CancelRequest class
class CancelRequest extends Request {
  /// Initialize CancelRequest
  const CancelRequest({
    this.cancel = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'cancel',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CancelRequest.fromJson(Map<String, dynamic> json) => CancelRequest(
        // ignore: avoid_as
        cancel: json['cancel'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Value should be the `contract_id` which received from the `portfolio` call.
  final int cancel;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cancel': cancel,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CancelRequest copyWith({
    int cancel,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CancelRequest(
        cancel: cancel ?? this.cancel,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
