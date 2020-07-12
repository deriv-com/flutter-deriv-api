/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/portfolio_receive.json

import '../response.dart';

/// PortfolioResponse class
class PortfolioResponse extends Response {
  /// Initialize PortfolioResponse
  const PortfolioResponse({
    this.portfolio,
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
  factory PortfolioResponse.fromJson(Map<String, dynamic> json) =>
      PortfolioResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        portfolio: json['portfolio'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Current account's open positions.
  final Map<String, dynamic> portfolio;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'portfolio': portfolio,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PortfolioResponse copyWith({
    Map<String, dynamic> portfolio,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PortfolioResponse(
        portfolio: portfolio ?? this.portfolio,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
