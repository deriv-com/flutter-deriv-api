/// generated automatically from flutter_deriv_api|lib/api/active_symbols_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'active_symbols_send.g.dart';

/// JSON conversion for 'active_symbols_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ActiveSymbolsRequest extends Request {
  /// Initialize ActiveSymbolsRequest
  const ActiveSymbolsRequest({
    this.activeSymbols,
    this.landingCompany,
    this.productType,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ActiveSymbolsRequest.fromJson(Map<String, dynamic> json) =>
      _$ActiveSymbolsRequestFromJson(json);

  // Properties
  /// If you use `brief`, only a subset of fields will be returned.
  final String activeSymbols;

  /// [Optional] If you specify this field, only symbols available for trading by that landing company will be returned. If you are logged in, only symbols available for trading by your landing company will be returned regardless of what you specify in this field.
  final String landingCompany;

  /// [Optional] If you specify this field, only symbols that can be traded through that product type will be returned.
  final String productType;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ActiveSymbolsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ActiveSymbolsRequest copyWith({
    String activeSymbols,
    String landingCompany,
    String productType,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ActiveSymbolsRequest(
        activeSymbols: activeSymbols ?? this.activeSymbols,
        landingCompany: landingCompany ?? this.landingCompany,
        productType: productType ?? this.productType,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
