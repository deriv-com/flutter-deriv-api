/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'p2p_advert_list_send.g.dart';

/// JSON conversion for 'p2p_advert_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertListRequest extends Request {
  /// Initialize P2pAdvertListRequest
  P2pAdvertListRequest({
    this.advertiserId,
    this.amount,
    this.counterpartyType,
    this.country,
    this.limit,
    this.localCurrency,
    this.offset,
    this.p2pAdvertList = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
}
