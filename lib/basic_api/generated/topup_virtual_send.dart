/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_send.json.

import '../request.dart';

/// Topup virtual request class.
class TopupVirtualRequest extends Request {
  /// Initialize TopupVirtualRequest.
  const TopupVirtualRequest({
    this.topupVirtual = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'topup_virtual',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TopupVirtualRequest.fromJson(Map<String, dynamic> json) =>
      TopupVirtualRequest(
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
  TopupVirtualRequest copyWith({
    bool? topupVirtual,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TopupVirtualRequest(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
