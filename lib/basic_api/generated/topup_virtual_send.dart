/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Topup virtual send class.
class TopupVirtualSend extends Request {
  /// Initialize TopupVirtualSend.
  const TopupVirtualSend({
    this.topupVirtual = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'topup_virtual',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TopupVirtualSend.fromJson(Map<String, dynamic> json) =>
      TopupVirtualSend(
        topupVirtual:
            json['topup_virtual'] == null ? null : json['topup_virtual'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? topupVirtual;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'topup_virtual': topupVirtual == null
            ? null
            : topupVirtual!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TopupVirtualSend copyWith({
    bool? topupVirtual,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TopupVirtualSend(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
