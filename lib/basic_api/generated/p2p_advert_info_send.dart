/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// P2pAdvertInfoRequest class
class P2pAdvertInfoRequest extends Request {
  /// Initialize P2pAdvertInfoRequest
  const P2pAdvertInfoRequest({
    @required this.id,
    this.p2pAdvertInfo = 1,
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
        // ignore: avoid_as
        id: json['id'] as String,
        // ignore: avoid_as
        p2pAdvertInfo: json['p2p_advert_info'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// The unique identifier for this advert.
  final String id;

  /// Must be 1
  final int p2pAdvertInfo;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_advert_info': p2pAdvertInfo,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertInfoRequest copyWith({
    String id,
    int p2pAdvertInfo,
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
