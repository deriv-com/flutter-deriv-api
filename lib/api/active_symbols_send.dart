/// Autogenerated from flutter_deriv_api|lib/api/active_symbols_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'active_symbols_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ActiveSymbolsRequest {
  ActiveSymbolsRequest();
  factory ActiveSymbolsRequest.fromJson(Map<String, dynamic> json) =>
      _$ActiveSymbolsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveSymbolsRequestToJson(this);

  // Properties
  /// If you use 'brief', only a subset of fields will be returned.
  String activeSymbols;

  /// [Optional] If you specify this field, only symbols available for trading by that landing company will be returned. If you are logged in, only symbols available for trading by your landing company will be returned regardless of what you specify in this field.
  String landingCompany;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  Map<String, dynamic> passthrough;

  /// [Optional] If you specify this field, only symbols that can be traded through that product type will be returned.
  String productType;

  /// [Optional] Used to map request to response.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
