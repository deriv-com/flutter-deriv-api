/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_list_send.json

import '../request.dart';

/// P2pAdvertListRequest class
class P2pAdvertListRequest extends Request {
  /// Initialize P2pAdvertListRequest
  const P2pAdvertListRequest({
    this.advertiserId,
    this.amount,
    this.counterpartyType,
    this.limit,
    this.localCurrency,
    this.offset,
    this.p2pAdvertList = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advert_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertListRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertListRequest(
        // ignore: avoid_as
        advertiserId: json['advertiser_id'] as String,
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as
        counterpartyType: json['counterparty_type'] as String,
        // ignore: avoid_as
        limit: json['limit'] as int,
        // ignore: avoid_as
        localCurrency: json['local_currency'] as String,
        // ignore: avoid_as
        offset: json['offset'] as int,
        // ignore: avoid_as
        p2pAdvertList: json['p2p_advert_list'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// [Optional] Which advertiser to list adverts for.
  final String advertiserId;

  /// [Optional] How much to buy or sell, used to calculate prices.
  final num amount;

  /// [Optional] Filter the adverts by `counterparty_type`.
  final String counterpartyType;

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Currency to conduct payment transaction in, defaults to the main currency for the client's country.
  final String localCurrency;

  /// [Optional] Used for paging.
  final int offset;

  /// Must be 1
  final int p2pAdvertList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'advertiser_id': advertiserId,
        'amount': amount,
        'counterparty_type': counterpartyType,
        'limit': limit,
        'local_currency': localCurrency,
        'offset': offset,
        'p2p_advert_list': p2pAdvertList,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertListRequest copyWith({
    String advertiserId,
    num amount,
    String counterpartyType,
    int limit,
    String localCurrency,
    int offset,
    int p2pAdvertList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertListRequest(
        advertiserId: advertiserId ?? this.advertiserId,
        amount: amount ?? this.amount,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        limit: limit ?? this.limit,
        localCurrency: localCurrency ?? this.localCurrency,
        offset: offset ?? this.offset,
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
