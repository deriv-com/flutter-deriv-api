/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// P2p advert info send class
class P2pAdvertInfoSend extends Request {
  /// Initialize P2pAdvertInfoSend
  const P2pAdvertInfoSend({
    @required this.id,
    this.p2pAdvertInfo = true,
    this.useClientLimits,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advert_info',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertInfoSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertInfoSend(
        id: json['id'] as String,
        p2pAdvertInfo: json['p2p_advert_info'] == null
            ? null
            : json['p2p_advert_info'] == 1,
        useClientLimits: json['use_client_limits'] == null
            ? null
            : json['use_client_limits'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// The unique identifier for this advert.
  final String id;

  /// Must be `true`
  final bool p2pAdvertInfo;

  /// [Optional] If set to `true`, the maximum order amount will be adjusted to the current balance and turnover limits of the account.
  final bool useClientLimits;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_advert_info': p2pAdvertInfo == null
            ? null
            : p2pAdvertInfo
                ? 1
                : 0,
        'use_client_limits': useClientLimits == null
            ? null
            : useClientLimits
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertInfoSend copyWith({
    String id,
    bool p2pAdvertInfo,
    bool useClientLimits,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertInfoSend(
        id: id ?? this.id,
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        useClientLimits: useClientLimits ?? this.useClientLimits,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
