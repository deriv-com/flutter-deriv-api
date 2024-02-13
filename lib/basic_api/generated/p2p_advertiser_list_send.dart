/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advertiser list request class.
class P2pAdvertiserListRequest extends Request {
  /// Initialize P2pAdvertiserListRequest.
  const P2pAdvertiserListRequest({
    this.advertiserName,
    this.isBlocked,
    this.limit,
    this.loginid,
    this.offset,
    this.p2pAdvertiserList = true,
    this.sortBy,
    this.tradePartners,
    super.msgType = 'p2p_advertiser_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserListRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserListRequest(
        advertiserName: json['advertiser_name'] as String?,
        isBlocked: json['is_blocked'] == null ? null : json['is_blocked'] == 1,
        limit: json['limit'] as int?,
        loginid: json['loginid'] as String?,
        offset: json['offset'] as int?,
        p2pAdvertiserList: json['p2p_advertiser_list'] == null
            ? null
            : json['p2p_advertiser_list'] == 1,
        sortBy: json['sort_by'] as String?,
        tradePartners:
            json['trade_partners'] == null ? null : json['trade_partners'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Search for advertiser by name. Partial matches will be returned.
  final String? advertiserName;

  /// [Optional] Used to return only blocked or unblocked partners
  final bool? isBlocked;

  /// [Optional] Used for paging.
  final int? limit;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Used for paging.
  final int? offset;

  /// Must be `true`
  final bool? p2pAdvertiserList;

  /// [Optional] How the results are sorted.
  final String? sortBy;

  /// [Optional] Get all advertisers has/had trade.
  final bool? tradePartners;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'advertiser_name': advertiserName,
        'is_blocked': isBlocked == null
            ? null
            : isBlocked!
                ? 1
                : 0,
        'limit': limit,
        'loginid': loginid,
        'offset': offset,
        'p2p_advertiser_list': p2pAdvertiserList == null
            ? null
            : p2pAdvertiserList!
                ? 1
                : 0,
        'sort_by': sortBy,
        'trade_partners': tradePartners == null
            ? null
            : tradePartners!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserListRequest copyWith({
    String? advertiserName,
    bool? isBlocked,
    int? limit,
    String? loginid,
    int? offset,
    bool? p2pAdvertiserList,
    String? sortBy,
    bool? tradePartners,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertiserListRequest(
        advertiserName: advertiserName ?? this.advertiserName,
        isBlocked: isBlocked ?? this.isBlocked,
        limit: limit ?? this.limit,
        loginid: loginid ?? this.loginid,
        offset: offset ?? this.offset,
        p2pAdvertiserList: p2pAdvertiserList ?? this.p2pAdvertiserList,
        sortBy: sortBy ?? this.sortBy,
        tradePartners: tradePartners ?? this.tradePartners,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
