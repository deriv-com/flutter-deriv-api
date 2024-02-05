/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_cancel_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p order cancel request class.
class P2pOrderCancelRequest extends Request {
  /// Initialize P2pOrderCancelRequest.
  const P2pOrderCancelRequest({
    required this.id,
    this.loginid,
    this.p2pOrderCancel = true,
    super.msgType = 'p2p_order_cancel',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pOrderCancelRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderCancelRequest(
        id: json['id'] as String?,
        loginid: json['loginid'] as String?,
        p2pOrderCancel: json['p2p_order_cancel'] == null
            ? null
            : json['p2p_order_cancel'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The unique identifier for this order.
  final String? id;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pOrderCancel;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'loginid': loginid,
        'p2p_order_cancel': p2pOrderCancel == null
            ? null
            : p2pOrderCancel!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCancelRequest copyWith({
    String? id,
    String? loginid,
    bool? p2pOrderCancel,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pOrderCancelRequest(
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
