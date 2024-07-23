/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/crypto_estimations_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Crypto estimations request class.
class CryptoEstimationsRequest extends Request {
  /// Initialize CryptoEstimationsRequest.
  const CryptoEstimationsRequest({
    this.cryptoEstimations = true,
    required this.currencyCode,
    this.loginid,
    this.subscribe,
    super.msgType = 'crypto_estimations',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CryptoEstimationsRequest.fromJson(Map<String, dynamic> json) =>
      CryptoEstimationsRequest(
        cryptoEstimations: json['crypto_estimations'] == null
            ? null
            : json['crypto_estimations'] == 1,
        currencyCode: json['currency_code'] as String?,
        loginid: json['loginid'] as String?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? cryptoEstimations;

  /// Cryptocurrency code for which fee estimation is provided.
  final String? currencyCode;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] If set to `true`, will send updates whenever there is an update to crypto estimations.
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'crypto_estimations': cryptoEstimations == null
            ? null
            : cryptoEstimations!
                ? 1
                : 0,
        'currency_code': currencyCode,
        'loginid': loginid,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CryptoEstimationsRequest copyWith({
    bool? cryptoEstimations,
    String? currencyCode,
    String? loginid,
    bool? subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CryptoEstimationsRequest(
        cryptoEstimations: cryptoEstimations ?? this.cryptoEstimations,
        currencyCode: currencyCode ?? this.currencyCode,
        loginid: loginid ?? this.loginid,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
