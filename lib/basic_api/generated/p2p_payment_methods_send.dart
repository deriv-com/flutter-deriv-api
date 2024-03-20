/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_payment_methods_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p payment methods request class.
class P2pPaymentMethodsRequest extends Request {
  /// Initialize P2pPaymentMethodsRequest.
  const P2pPaymentMethodsRequest({
    this.loginid,
    this.p2pPaymentMethods = true,
    super.msgType = 'p2p_payment_methods',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pPaymentMethodsRequest.fromJson(Map<String, dynamic> json) =>
      P2pPaymentMethodsRequest(
        loginid: json['loginid'] as String?,
        p2pPaymentMethods: json['p2p_payment_methods'] == null
            ? null
            : json['p2p_payment_methods'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pPaymentMethods;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'p2p_payment_methods': p2pPaymentMethods == null
            ? null
            : p2pPaymentMethods!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pPaymentMethodsRequest copyWith({
    String? loginid,
    bool? p2pPaymentMethods,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pPaymentMethodsRequest(
        loginid: loginid ?? this.loginid,
        p2pPaymentMethods: p2pPaymentMethods ?? this.p2pPaymentMethods,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
