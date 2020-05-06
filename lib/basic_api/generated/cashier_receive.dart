/// generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'cashier_receive.g.dart';

/// JSON conversion for 'cashier_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CashierResponse extends Response {
  /// Initialize CashierResponse
  const CashierResponse({
    this.cashier,
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
  factory CashierResponse.fromJson(Map<String, dynamic> json) =>
      _$CashierResponseFromJson(json);

  // Properties
  /// Cashier URL.
  /// **Note:** possible error codes are:
  /// - `ASK_TNC_APPROVAL`: API call `tnc_approval`
  /// - `ASK_AUTHENTICATE`
  /// - `ASK_UK_FUNDS_PROTECTION`: API call `tnc_approval`
  /// - `ASK_CURRENCY`: API call `set_account_currency`
  /// - `ASK_EMAIL_VERIFY`: API call `verify_email`
  /// - `ASK_FIX_DETAILS`: API call `set_settings`
  final String cashier;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$CashierResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  CashierResponse copyWith({
    String cashier,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CashierResponse(
        cashier: cashier ?? this.cashier,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
