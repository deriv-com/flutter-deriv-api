/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'p2p_advert_list_send.g.dart';

/// JSON conversion for 'p2p_advert_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertListRequest extends Request {
  /// Initialize P2pAdvertListRequest
  const P2pAdvertListRequest({
    this.advertiserId,
    this.amount,
    this.counterpartyType,
    this.country,
    this.limit,
    this.localCurrency,
    this.offset,
    this.p2pAdvertList = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory P2pAdvertListRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertListRequestFromJson(json);

  // Properties
  /// [Optional] Which advertiser to list adverts for.
  final String advertiserId;

  /// [Optional] How much to buy or sell, used to calculate prices.
  final num amount;

  /// [Optional] Filter the adverts by `counterparty_type`.
  final String counterpartyType;

  /// [Optional] Which country to find adverts from.
  final String country;

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Currency to conduct payment transaction in, defaults to the main currency for the client's country.
  final String localCurrency;

  /// [Optional] Used for paging.
  final int offset;

  /// Must be 1
  final int p2pAdvertList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertListRequest copyWith({
    String advertiserId,
    num amount,
    String counterpartyType,
    String country,
    int limit,
    String localCurrency,
    int offset,
    int p2pAdvertList,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      P2pAdvertListRequest(
        advertiserId: advertiserId ?? this.advertiserId,
        amount: amount ?? this.amount,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        country: country ?? this.country,
        limit: limit ?? this.limit,
        localCurrency: localCurrency ?? this.localCurrency,
        offset: offset ?? this.offset,
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
