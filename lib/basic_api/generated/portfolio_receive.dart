/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/portfolio_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'portfolio_receive.g.dart';

/// JSON conversion for 'portfolio_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
      _$PortfolioResponseFromJson(json);

  /// Current account's open positions.
  final Map<String, dynamic> portfolio;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$PortfolioResponseToJson(this);

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
