/// generated automatically from flutter_deriv_api|lib/api/portfolio_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'portfolio_send.g.dart';

/// JSON conversion for 'portfolio_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PortfolioRequest extends Request {
  /// Initialize PortfolioRequest
  const PortfolioRequest({
    this.portfolio = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory PortfolioRequest.fromJson(Map<String, dynamic> json) =>
      _$PortfolioRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int portfolio;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PortfolioRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  PortfolioRequest copyWith({
    int portfolio,
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
