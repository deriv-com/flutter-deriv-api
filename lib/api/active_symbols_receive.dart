/// generated automatically from flutter_deriv_api|lib/api/active_symbols_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'active_symbols_receive.g.dart';

/// JSON conversion for 'active_symbols_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ActiveSymbolsResponse extends Response {
  /// Initialize ActiveSymbolsResponse
  ActiveSymbolsResponse({
    this.activeSymbols,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory ActiveSymbolsResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveSymbolsResponseFromJson(json);

  // Properties
  /// List of active symbols.
  final List<Map<String, dynamic>> activeSymbols;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ActiveSymbolsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ActiveSymbolsResponse copyWith({
    List<Map<String, dynamic>> activeSymbols,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ActiveSymbolsResponse(
        activeSymbols: activeSymbols ?? this.activeSymbols,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
