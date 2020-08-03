/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// P2p advert info request class
class P2pAdvertInfoRequest extends Request {
  /// Initialize P2pAdvertInfoRequest
  const P2pAdvertInfoRequest({
    @required this.id,
    this.p2pAdvertInfo = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advert_info',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertInfoRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertInfoRequest(
        id: json['id'] as String,
        p2pAdvertInfo: json['p2p_advert_info'] == null
            ? null
            : json['p2p_advert_info'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// The unique identifier for this advert.
  final String id;

  /// Must be `true`
  final bool p2pAdvertInfo;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_advert_info': p2pAdvertInfo == null ? null : p2pAdvertInfo ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertInfoRequest copyWith({
    String id,
    bool p2pAdvertInfo,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertInfoRequest(
        id: id ?? this.id,
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
