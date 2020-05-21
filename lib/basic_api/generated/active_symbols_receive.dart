/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/active_symbols_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'active_symbols_receive.g.dart';

/// JSON conversion for 'active_symbols_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ActiveSymbolsResponse extends Response {
  /// Initialize ActiveSymbolsResponse
  const ActiveSymbolsResponse({
    this.activeSymbols,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ActiveSymbolsResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveSymbolsResponseFromJson(json);

  /// List of active symbols.
  final List<Map<String, dynamic>> activeSymbols;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ActiveSymbolsResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ActiveSymbolsResponse copyWith({
    List<Map<String, dynamic>> activeSymbols,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ActiveSymbolsResponse(
        activeSymbols: activeSymbols ?? this.activeSymbols,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
