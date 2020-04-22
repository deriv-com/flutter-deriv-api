/// generated automatically from flutter_deriv_api|lib/basic_api/generated/active_symbols_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'active_symbols_send.g.dart';

/// JSON conversion for 'active_symbols_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ActiveSymbolsRequest extends Request {
  /// Initialize ActiveSymbolsRequest
  const ActiveSymbolsRequest({
    this.activeSymbols,
    this.landingCompany,
    this.productType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ActiveSymbolsRequest(
        activeSymbols: activeSymbols ?? this.activeSymbols,
        landingCompany: landingCompany ?? this.landingCompany,
        productType: productType ?? this.productType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
