/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_stop_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Copy stop send class.
class CopyStopSend extends Request {
  /// Initialize CopyStopSend.
  const CopyStopSend({
    required this.copyStop,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'copy_stop',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory CopyStopSend.fromJson(Map<String, dynamic> json) => CopyStopSend(
        copyStop: json['copy_stop'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// API tokens identifying the accounts which needs not to be copied
  final String? copyStop;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copy_stop': copyStop,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStopSend copyWith({
    String? copyStop,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CopyStopSend(
        copyStop: copyStop ?? this.copyStop,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
