/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/portfolio_send.json

import '../request.dart';

/// PortfolioRequest class
class PortfolioRequest extends Request {
  /// Initialize PortfolioRequest
  const PortfolioRequest({
    this.portfolio = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'portfolio',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PortfolioRequest.fromJson(Map<String, dynamic> json) =>
      PortfolioRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        portfolio: json['portfolio'] == null ? null : json['portfolio'] == 1,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool portfolio;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'portfolio': portfolio == null ? null : portfolio ? 1 : 0,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PortfolioRequest copyWith({
    bool portfolio,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PortfolioRequest(
        portfolio: portfolio ?? this.portfolio,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
