/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/active_symbols_receive.json

import '../response.dart';

/// ActiveSymbolsResponse class
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
      ActiveSymbolsResponse(
        // ignore: avoid_as, always_specify_types
        activeSymbols: (json['active_symbols'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// List of active symbols.
  final List<Map<String, dynamic>> activeSymbols;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'active_symbols': activeSymbols,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

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
