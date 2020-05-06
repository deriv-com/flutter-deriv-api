/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_list_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_advert_list_send.g.dart';

/// JSON conversion for 'p2p_advert_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
      _$P2pAdvertListRequestFromJson(json);

  // Properties
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
  Map<String, dynamic> toJson() => _$P2pAdvertListRequestToJson(this);

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
