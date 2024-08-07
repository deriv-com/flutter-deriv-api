/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advertiser list receive class.
class P2pAdvertiserListReceive extends Response {
  /// Initialize P2pAdvertiserListReceive.
  const P2pAdvertiserListReceive({
    this.p2pAdvertiserList,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserListReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserListReceive(
        p2pAdvertiserList: json['p2p_advertiser_list'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// P2P advertiser list.
  final Map<String, dynamic>? p2pAdvertiserList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advertiser_list': p2pAdvertiserList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserListReceive copyWith({
    Map<String, dynamic>? p2pAdvertiserList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertiserListReceive(
        p2pAdvertiserList: p2pAdvertiserList ?? this.p2pAdvertiserList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
