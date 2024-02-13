/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_payment_methods_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advertiser payment methods request class.
class P2pAdvertiserPaymentMethodsRequest extends Request {
  /// Initialize P2pAdvertiserPaymentMethodsRequest.
  const P2pAdvertiserPaymentMethodsRequest({
    required this.create,
    required this.delete,
    this.loginid,
    this.p2pAdvertiserPaymentMethods = true,
    required this.update,
    super.msgType = 'p2p_advertiser_payment_methods',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserPaymentMethodsRequest.fromJson(
          Map<String, dynamic> json) =>
      P2pAdvertiserPaymentMethodsRequest(
        create: (json['create'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        delete: (json['delete'] as List<dynamic>?)
            ?.map<num>((dynamic item) => item as num)
            .toList(),
        loginid: json['loginid'] as String?,
        p2pAdvertiserPaymentMethods:
            json['p2p_advertiser_payment_methods'] == null
                ? null
                : json['p2p_advertiser_payment_methods'] == 1,
        update: json['update'] as Map<String, dynamic>?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Contains new payment method entries.
  final List<Map<String, dynamic>>? create;

  /// Contains payment methods to delete.
  final List<num>? delete;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pAdvertiserPaymentMethods;

  /// Contains payment methods to update.
  final Map<String, dynamic>? update;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'create': create,
        'delete': delete,
        'loginid': loginid,
        'p2p_advertiser_payment_methods': p2pAdvertiserPaymentMethods == null
            ? null
            : p2pAdvertiserPaymentMethods!
                ? 1
                : 0,
        'update': update,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserPaymentMethodsRequest copyWith({
    List<Map<String, dynamic>>? create,
    List<num>? delete,
    String? loginid,
    bool? p2pAdvertiserPaymentMethods,
    Map<String, dynamic>? update,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertiserPaymentMethodsRequest(
        create: create ?? this.create,
        delete: delete ?? this.delete,
        loginid: loginid ?? this.loginid,
        p2pAdvertiserPaymentMethods:
            p2pAdvertiserPaymentMethods ?? this.p2pAdvertiserPaymentMethods,
        update: update ?? this.update,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
