/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_info_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// P2p advertiser info request class
class P2pAdvertiserInfoRequest extends Request {
  /// Initialize P2pAdvertiserInfoRequest
  const P2pAdvertiserInfoRequest({
    this.id,
    this.p2pAdvertiserInfo = true,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advertiser_info',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserInfoRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserInfoRequest(
        id: json['id'] as String,
        p2pAdvertiserInfo: json['p2p_advertiser_info'] == null
            ? null
            : json['p2p_advertiser_info'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] The unique identifier for this advertiser. If not provided, returns advertiser information about the current account.
  final String? id;

  /// Must be `true`
  final bool? p2pAdvertiserInfo;

  /// [Optional] If set to `true`, will send updates whenever there is an update to advertiser
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_advertiser_info': p2pAdvertiserInfo == null
            ? null
            : p2pAdvertiserInfo!
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserInfoRequest copyWith({
    String? id,
    bool? p2pAdvertiserInfo,
    bool? subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertiserInfoRequest(
        id: id ?? this.id,
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[id];
}
