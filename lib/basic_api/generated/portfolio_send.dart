/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/portfolio_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// Portfolio request class
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
        portfolio: json['portfolio'] == null ? null : json['portfolio'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool portfolio;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'portfolio': portfolio == null ? null : portfolio ? 1 : 0,
        'passthrough': passthrough,
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
