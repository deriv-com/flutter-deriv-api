/// generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'cashier_send.g.dart';

/// JSON conversion for 'cashier_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CashierRequest extends Request {
  /// Initialize CashierRequest
  const CashierRequest({
    this.cashier,
    this.provider,
    this.verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory CashierRequest.fromJson(Map<String, dynamic> json) =>
      _$CashierRequestFromJson(json);

  // Properties
  /// The cashier type to request the URL for.
  final String cashier;

  /// [Optional] Note: only 'doughflow' is supported currently.
  final String provider;

  /// [Optional] Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CashierRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CashierRequest copyWith({
    String cashier,
    String provider,
    String verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CashierRequest(
        cashier: cashier ?? this.cashier,
        provider: provider ?? this.provider,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
