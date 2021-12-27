/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/crypto_config_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Crypto config response class.
class CryptoConfigResponse extends Response {
  /// Initialize CryptoConfigResponse.
  const CryptoConfigResponse({
    this.cryptoConfig,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory CryptoConfigResponse.fromJson(Map<String, dynamic> json) =>
      CryptoConfigResponse(
        cryptoConfig: json['crypto_config'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Provides cryptocurrencies configuration.
  final Map<String, dynamic>? cryptoConfig;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'crypto_config': cryptoConfig,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CryptoConfigResponse copyWith({
    Map<String, dynamic>? cryptoConfig,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CryptoConfigResponse(
        cryptoConfig: cryptoConfig ?? this.cryptoConfig,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
