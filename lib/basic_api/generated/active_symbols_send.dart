/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/active_symbols_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Active symbols request class
class ActiveSymbolsRequest extends Request {
  /// Initialize ActiveSymbolsRequest
  const ActiveSymbolsRequest({
    @required this.activeSymbols,
    this.landingCompany,
    this.productType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'active_symbols',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ActiveSymbolsRequest.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsRequest(
        activeSymbols: json['active_symbols'] as String?,
        landingCompany: json['landing_company'] as String?,
        productType: json['product_type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// If you use `brief`, only a subset of fields will be returned.
  final String? activeSymbols;

  /// [Optional] If you specify this field, only symbols available for trading by that landing company will be returned. If you are logged in, only symbols available for trading by your landing company will be returned regardless of what you specify in this field.
  final String? landingCompany;

  /// [Optional] If you specify this field, only symbols that can be traded through that product type will be returned.
  final String? productType;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'active_symbols': activeSymbols,
        'landing_company': landingCompany,
        'product_type': productType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ActiveSymbolsRequest copyWith({
    String? activeSymbols,
    String? landingCompany,
    String? productType,
    Map<String, dynamic>? passthrough,
    int? reqId,
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
  List<Object> get props => <Object>[];
}
