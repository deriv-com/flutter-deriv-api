/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advert info request class.
class P2pAdvertInfoRequest extends Request {
  /// Initialize P2pAdvertInfoRequest.
  const P2pAdvertInfoRequest({
    this.id,
    this.p2pAdvertInfo = true,
    this.subscribe,
    this.useClientLimits,
    super.msgType = 'p2p_advert_info',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertInfoRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertInfoRequest(
        id: json['id'] as String?,
        p2pAdvertInfo: json['p2p_advert_info'] == null
            ? null
            : json['p2p_advert_info'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        useClientLimits: json['use_client_limits'] == null
            ? null
            : json['use_client_limits'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The unique identifier for this advert. Optional when subscribe is 1. If not provided, all advertiser adverts will be subscribed.
  final String? id;

  /// Must be `true`
  final bool? p2pAdvertInfo;

  /// [Optional] If set to `true`, will send updates when changes occur. Optional when id is provided.
  final bool? subscribe;

  /// [Optional] If set to `true`, the maximum order amount will be adjusted to the current balance and turnover limits of the account.
  final bool? useClientLimits;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_advert_info': p2pAdvertInfo == null
            ? null
            : p2pAdvertInfo!
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'use_client_limits': useClientLimits == null
            ? null
            : useClientLimits!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertInfoRequest copyWith({
    String? id,
    bool? p2pAdvertInfo,
    bool? subscribe,
    bool? useClientLimits,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertInfoRequest(
        id: id ?? this.id,
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        subscribe: subscribe ?? this.subscribe,
        useClientLimits: useClientLimits ?? this.useClientLimits,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
