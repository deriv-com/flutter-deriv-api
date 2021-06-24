/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/portfolio_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Portfolio request class
class PortfolioRequest extends Request {
  /// Initialize PortfolioRequest
  const PortfolioRequest({
    @required this.contractType,
    this.portfolio = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'portfolio',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PortfolioRequest.fromJson(Map<String, dynamic> json) =>
      PortfolioRequest(
        contractType: (json['contract_type'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        portfolio: json['portfolio'] == null ? null : json['portfolio'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Return only contracts of the specified types
  final List<String>? contractType;

  /// Must be `true`
  final bool? portfolio;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_type': contractType,
        'portfolio': portfolio == null
            ? null
            : portfolio!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PortfolioRequest copyWith({
    List<String>? contractType,
    bool? portfolio,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PortfolioRequest(
        contractType: contractType ?? this.contractType,
        portfolio: portfolio ?? this.portfolio,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
