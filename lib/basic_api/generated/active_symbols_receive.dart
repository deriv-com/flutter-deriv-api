/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/active_symbols_receive.json.

import '../response.dart';

/// Active symbols response class.
class ActiveSymbolsResponse extends Response {
  /// Initialize ActiveSymbolsResponse.
  const ActiveSymbolsResponse({
    this.activeSymbols,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory ActiveSymbolsResponse.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsResponse(
        activeSymbols: (json['active_symbols'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of active symbols.
  final List<Map<String, dynamic>>? activeSymbols;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'active_symbols': activeSymbols,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ActiveSymbolsResponse copyWith({
    List<Map<String, dynamic>>? activeSymbols,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ActiveSymbolsResponse(
        activeSymbols: activeSymbols ?? this.activeSymbols,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
