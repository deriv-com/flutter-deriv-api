/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/crypto_estimations_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Crypto estimations receive class.
class CryptoEstimationsReceive extends Response {
  /// Initialize CryptoEstimationsReceive.
  const CryptoEstimationsReceive({
    this.cryptoEstimations,
    this.subscription,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CryptoEstimationsReceive.fromJson(Map<String, dynamic> json) =>
      CryptoEstimationsReceive(
        cryptoEstimations: json['crypto_estimations'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Cryptocurrency estimations. E.g. Withdrawal fee estimations.
  final Map<String, dynamic>? cryptoEstimations;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'crypto_estimations': cryptoEstimations,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CryptoEstimationsReceive copyWith({
    Map<String, dynamic>? cryptoEstimations,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CryptoEstimationsReceive(
        cryptoEstimations: cryptoEstimations ?? this.cryptoEstimations,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
