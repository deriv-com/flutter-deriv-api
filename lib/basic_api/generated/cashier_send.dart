/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// Cashier send class
class CashierSend extends Request {
  /// Initialize CashierSend
  const CashierSend({
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
  factory CashierSend.fromJson(Map<String, dynamic> json) => CashierSend(
        cashier: json['cashier'] as String,
        provider: json['provider'] as String,
        type: json['type'] as String,
        verificationCode: json['verification_code'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Operation which needs to be requested from cashier
  final String cashier;

  /// [Optional] Cashier provider. `crypto` will be default option for crypto currency accounts.
  final String provider;

  /// [Optional] Data need to be returned from cashier. `api` is supported only for `crypto` provider with `deposit` operation.
  final String type;

  /// [Optional] Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier': cashier,
        'provider': provider,
        'type': type,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierSend copyWith({
    String cashier,
    String provider,
    String type,
    String verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CashierSend(
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
