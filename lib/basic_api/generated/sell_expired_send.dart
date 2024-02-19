/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_expired_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Sell expired request class.
class SellExpiredRequest extends Request {
  /// Initialize SellExpiredRequest.
  const SellExpiredRequest({
    this.loginid,
    this.sellExpired = true,
    super.msgType = 'sell_expired',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory SellExpiredRequest.fromJson(Map<String, dynamic> json) =>
      SellExpiredRequest(
        loginid: json['loginid'] as String?,
        sellExpired:
            json['sell_expired'] == null ? null : json['sell_expired'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? sellExpired;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'sell_expired': sellExpired == null
            ? null
            : sellExpired!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellExpiredRequest copyWith({
    String? loginid,
    bool? sellExpired,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SellExpiredRequest(
        loginid: loginid ?? this.loginid,
        sellExpired: sellExpired ?? this.sellExpired,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
