/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advert list request class.
class P2pAdvertListRequest extends Request {
  /// Initialize P2pAdvertListRequest.
  const P2pAdvertListRequest({
    this.advertiserId,
    this.advertiserName,
    this.amount,
    this.blockTrade,
    this.counterpartyType,
    this.favouritesOnly,
    this.hideClientScheduleUnavailable,
    this.hideIneligible,
    this.limit,
    this.localCurrency,
    this.loginid,
    this.offset,
    this.p2pAdvertList = true,
    this.paymentMethod,
    this.sortBy,
    this.useClientLimits,
    super.msgType = 'p2p_advert_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertListRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertListRequest(
        advertiserId: json['advertiser_id'] as String?,
        advertiserName: json['advertiser_name'] as String?,
        amount: json['amount'] as num?,
        blockTrade:
            json['block_trade'] == null ? null : json['block_trade'] == 1,
        counterpartyType: json['counterparty_type'] as String?,
        favouritesOnly: json['favourites_only'] == null
            ? null
            : json['favourites_only'] == 1,
        hideClientScheduleUnavailable:
            json['hide_client_schedule_unavailable'] == null
                ? null
                : json['hide_client_schedule_unavailable'] == 1,
        hideIneligible: json['hide_ineligible'] == null
            ? null
            : json['hide_ineligible'] == 1,
        limit: json['limit'] as int?,
        localCurrency: json['local_currency'] as String?,
        loginid: json['loginid'] as String?,
        offset: json['offset'] as int?,
        p2pAdvertList: json['p2p_advert_list'] == null
            ? null
            : json['p2p_advert_list'] == 1,
        paymentMethod: (json['payment_method'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        sortBy: json['sort_by'] as String?,
        useClientLimits: json['use_client_limits'] == null
            ? null
            : json['use_client_limits'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] ID of the advertiser to list adverts for.
  final String? advertiserId;

  /// [Optional] Search for advertiser by name. Partial matches will be returned.
  final String? advertiserName;

  /// [Optional] How much to buy or sell, used to calculate prices.
  final num? amount;

  /// [Optional] Return block trade adverts when `true`, non-block trade adverts when `false` (default).
  final bool? blockTrade;

  /// [Optional] Filter the adverts by `counterparty_type`.
  final String? counterpartyType;

  /// [Optional] Only show adverts from favourite advertisers. Default is `false`.
  final bool? favouritesOnly;

  /// [Optional] If set to `true`, adverts for which the current user's shcedule does not have availability from now until the full possible order expiry are not returned.
  final bool? hideClientScheduleUnavailable;

  /// [Optional] If set to `true`, adverts for which the current user does not meet counteryparty terms are not returned.
  final bool? hideIneligible;

  /// [Optional] Used for paging.
  final int? limit;

  /// [Optional] Currency to conduct payment transaction in. If not provided, only ads from country of residence will be returned.
  final String? localCurrency;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// [Optional] Used for paging.
  final int? offset;

  /// Must be `true`
  final bool? p2pAdvertList;

  /// [Optional] Search by supported payment methods.
  final List<String>? paymentMethod;

  /// [Optional] How the results are sorted.
  final String? sortBy;

  /// [Optional] If set to `true`, ads that exceed this account's balance or turnover limits will not be shown.
  final bool? useClientLimits;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'advertiser_id': advertiserId,
        'advertiser_name': advertiserName,
        'amount': amount,
        'block_trade': blockTrade == null
            ? null
            : blockTrade!
                ? 1
                : 0,
        'counterparty_type': counterpartyType,
        'favourites_only': favouritesOnly == null
            ? null
            : favouritesOnly!
                ? 1
                : 0,
        'hide_client_schedule_unavailable':
            hideClientScheduleUnavailable == null
                ? null
                : hideClientScheduleUnavailable!
                    ? 1
                    : 0,
        'hide_ineligible': hideIneligible == null
            ? null
            : hideIneligible!
                ? 1
                : 0,
        'limit': limit,
        'local_currency': localCurrency,
        'loginid': loginid,
        'offset': offset,
        'p2p_advert_list': p2pAdvertList == null
            ? null
            : p2pAdvertList!
                ? 1
                : 0,
        'payment_method': paymentMethod,
        'sort_by': sortBy,
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
  P2pAdvertListRequest copyWith({
    String? advertiserId,
    String? advertiserName,
    num? amount,
    bool? blockTrade,
    String? counterpartyType,
    bool? favouritesOnly,
    bool? hideClientScheduleUnavailable,
    bool? hideIneligible,
    int? limit,
    String? localCurrency,
    String? loginid,
    int? offset,
    bool? p2pAdvertList,
    List<String>? paymentMethod,
    String? sortBy,
    bool? useClientLimits,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertListRequest(
        advertiserId: advertiserId ?? this.advertiserId,
        advertiserName: advertiserName ?? this.advertiserName,
        amount: amount ?? this.amount,
        blockTrade: blockTrade ?? this.blockTrade,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        favouritesOnly: favouritesOnly ?? this.favouritesOnly,
        hideClientScheduleUnavailable:
            hideClientScheduleUnavailable ?? this.hideClientScheduleUnavailable,
        hideIneligible: hideIneligible ?? this.hideIneligible,
        limit: limit ?? this.limit,
        localCurrency: localCurrency ?? this.localCurrency,
        loginid: loginid ?? this.loginid,
        offset: offset ?? this.offset,
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        sortBy: sortBy ?? this.sortBy,
        useClientLimits: useClientLimits ?? this.useClientLimits,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
