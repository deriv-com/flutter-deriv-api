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
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
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
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      PortfolioRequest(
        portfolio: portfolio ?? this.portfolio,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
