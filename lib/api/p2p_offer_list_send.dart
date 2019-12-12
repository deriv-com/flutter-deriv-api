/// Autogenerated from flutter_deriv_api|lib/api/p2p_offer_list_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'p2p_offer_list_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOfferListRequest {
  P2pOfferListRequest(
      {this.agentId,
      this.amount,
      this.country,
      this.currency,
      this.limit,
      this.localCurrency,
      this.offset,
      this.p2pOfferList,
      this.passthrough,
      this.reqId,
      this.type});
  factory P2pOfferListRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pOfferListRequestFromJson(json);
  Map<String, dynamic> toJson() => _$P2pOfferListRequestToJson(this);

  // Properties
  /// Which agent to list offers for.
  String agentId;

  /// How much to buy or sell, used to calculate prices.
  num amount;

  /// Which country to find offers from.
  String country;

  /// Target currency, defaults to client account currency.
  String currency;

  /// Used for paging.
  int limit;

  /// Currency to conduct payment transaction in, defaults to the main currency for the client's country.
  String localCurrency;

  /// Used for paging.
  int offset;

  /// Must be 1
  int p2pOfferList;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Which offers to list - buy or sell.
  String type;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
