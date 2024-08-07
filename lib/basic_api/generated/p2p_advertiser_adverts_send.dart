/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_adverts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advertiser adverts request class.
class P2pAdvertiserAdvertsRequest extends Request {
  /// Initialize P2pAdvertiserAdvertsRequest.
  const P2pAdvertiserAdvertsRequest({
    this.limit,
    this.loginid,
    this.offset,
    this.p2pAdvertiserAdverts = true,
    super.msgType = 'p2p_advertiser_adverts',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserAdvertsRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserAdvertsRequest(
        limit: json['limit'] as int?,
        loginid: json['loginid'] as String?,
        offset: json['offset'] as int?,
        p2pAdvertiserAdverts: json['p2p_advertiser_adverts'] == null
            ? null
            : json['p2p_advertiser_adverts'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Used for paging. This value will also apply to subsription responses.
  final int? limit;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Used for paging. This value will also apply to subsription responses.
  final int? offset;

  /// Must be `true`
  final bool? p2pAdvertiserAdverts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'limit': limit,
        'loginid': loginid,
        'offset': offset,
        'p2p_advertiser_adverts': p2pAdvertiserAdverts == null
            ? null
            : p2pAdvertiserAdverts!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserAdvertsRequest copyWith({
    int? limit,
    String? loginid,
    int? offset,
    bool? p2pAdvertiserAdverts,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertiserAdvertsRequest(
        limit: limit ?? this.limit,
        loginid: loginid ?? this.loginid,
        offset: offset ?? this.offset,
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
