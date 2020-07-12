/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// CashierRequest class
class CashierRequest extends Request {
  /// Initialize CashierRequest
  const CashierRequest({
    @required this.cashier,
    this.provider,
    this.type,
    this.verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'cashier',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CashierRequest.fromJson(Map<String, dynamic> json) => CashierRequest(
        // ignore: avoid_as
        cashier: json['cashier'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        provider: json['provider'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        type: json['type'] as String,
        // ignore: avoid_as
        verificationCode: json['verification_code'] as String,
      );

  /// Operation which needs to be requested from cashier
  final String cashier;

  /// [Optional] Cashier provider. `crypto` will be default option for crypto currency accounts.
  final String provider;

  /// [Optional] Data need to be returned from cashier. `api` is supported only for `crypto` provider with `deposit` operation.
  final String type;

  /// [Optional] Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier': cashier,
        'passthrough': passthrough,
        'provider': provider,
        'req_id': reqId,
        'type': type,
        'verification_code': verificationCode,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierRequest copyWith({
    String cashier,
    String provider,
    String type,
    String verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CashierRequest(
        cashier: cashier ?? this.cashier,
        provider: provider ?? this.provider,
        type: type ?? this.type,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
