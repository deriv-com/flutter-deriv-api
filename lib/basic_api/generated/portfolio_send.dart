/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/portfolio_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// Portfolio send class
class PortfolioSend extends Request {
  /// Initialize PortfolioSend
  const PortfolioSend({
    @required this.contractType,
    this.portfolio = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'portfolio',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PortfolioSend.fromJson(Map<String, dynamic> json) => PortfolioSend(
        contractType: (json['contract_type'] as List<dynamic>)
            ?.map<String>((dynamic item) => item as String)
            ?.toList(),
        portfolio: json['portfolio'] == null ? null : json['portfolio'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Return only contracts of the specified types
  final List<String> contractType;

  /// Must be `true`
  final bool portfolio;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_type': contractType,
        'portfolio': portfolio == null
            ? null
            : portfolio
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PortfolioSend copyWith({
    List<String> contractType,
    bool portfolio,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PortfolioSend(
        contractType: contractType ?? this.contractType,
        portfolio: portfolio ?? this.portfolio,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
