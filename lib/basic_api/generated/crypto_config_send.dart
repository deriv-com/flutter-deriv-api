/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/crypto_config_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Crypto config request class.
class CryptoConfigRequest extends Request {
  /// Initialize CryptoConfigRequest.
  const CryptoConfigRequest({
    this.cryptoConfig = true,
    this.currencyCode,
    super.msgType = 'crypto_config',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CryptoConfigRequest.fromJson(Map<String, dynamic> json) =>
      CryptoConfigRequest(
        cryptoConfig:
            json['crypto_config'] == null ? null : json['crypto_config'] == 1,
        currencyCode: json['currency_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? cryptoConfig;

  /// [Optional] Cryptocurrency code. Sending request with currency_code provides crypto config for the sent cryptocurrency code only.
  final String? currencyCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'crypto_config': cryptoConfig == null
            ? null
            : cryptoConfig!
                ? 1
                : 0,
        'currency_code': currencyCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CryptoConfigRequest copyWith({
    bool? cryptoConfig,
    String? currencyCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CryptoConfigRequest(
        cryptoConfig: cryptoConfig ?? this.cryptoConfig,
        currencyCode: currencyCode ?? this.currencyCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
