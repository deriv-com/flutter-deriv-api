/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_info_send.json

import '../request.dart';

/// P2pAdvertiserInfoRequest class
class P2pAdvertiserInfoRequest extends Request {
  /// Initialize P2pAdvertiserInfoRequest
  const P2pAdvertiserInfoRequest({
    this.id,
    this.p2pAdvertiserInfo = 1,
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
        // ignore: avoid_as
        id: json['id'] as String,
        // ignore: avoid_as
        p2pAdvertiserInfo: json['p2p_advertiser_info'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
      );

  /// [Optional] The unique identifier for this advertiser. If not provided, returns advertiser information about the current account.
  final String id;

  /// Must be 1
  final int p2pAdvertiserInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to advertiser
  final int subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_advertiser_info': p2pAdvertiserInfo,
        'passthrough': passthrough,
        'req_id': reqId,
        'subscribe': subscribe,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserInfoRequest copyWith({
    String id,
    int p2pAdvertiserInfo,
    int subscribe,
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
