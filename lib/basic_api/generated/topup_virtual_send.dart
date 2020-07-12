/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_send.json

import '../request.dart';

/// TopupVirtualRequest class
class TopupVirtualRequest extends Request {
  /// Initialize TopupVirtualRequest
  const TopupVirtualRequest({
    this.topupVirtual = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'topup_virtual',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TopupVirtualRequest.fromJson(Map<String, dynamic> json) =>
      TopupVirtualRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        topupVirtual:
            json['topup_virtual'] == null ? null : json['topup_virtual'] == 1,
      );

  /// Must be `true`
  final bool topupVirtual;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'topup_virtual': topupVirtual == null ? null : topupVirtual ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  TopupVirtualRequest copyWith({
    bool topupVirtual,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TopupVirtualRequest(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
