/// generated automatically from flutter_deriv_api|lib/api/payout_currencies_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'payout_currencies_send.g.dart';

/// JSON conversion for 'payout_currencies_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PayoutCurrenciesRequest extends Request {
  /// Initialize PayoutCurrenciesRequest
  PayoutCurrenciesRequest({
    this.payoutCurrencies = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory PayoutCurrenciesRequest.fromJson(Map<String, dynamic> json) =>
      _$PayoutCurrenciesRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int payoutCurrencies;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PayoutCurrenciesRequestToJson(this);
}
