/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_dispute_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p order dispute request class.
class P2pOrderDisputeRequest extends Request {
  /// Initialize P2pOrderDisputeRequest.
  const P2pOrderDisputeRequest({
    required this.disputeReason,
    required this.id,
    this.loginid,
    this.p2pOrderDispute = true,
    super.msgType = 'p2p_order_dispute',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pOrderDisputeRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderDisputeRequest(
        disputeReason: json['dispute_reason'] as String?,
        id: json['id'] as String?,
        loginid: json['loginid'] as String?,
        p2pOrderDispute: json['p2p_order_dispute'] == null
            ? null
            : json['p2p_order_dispute'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The predefined dispute reason
  final String? disputeReason;

  /// The unique identifier for this order.
  final String? id;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pOrderDispute;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'dispute_reason': disputeReason,
        'id': id,
        'loginid': loginid,
        'p2p_order_dispute': p2pOrderDispute == null
            ? null
            : p2pOrderDispute!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderDisputeRequest copyWith({
    String? disputeReason,
    String? id,
    String? loginid,
    bool? p2pOrderDispute,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pOrderDisputeRequest(
        disputeReason: disputeReason ?? this.disputeReason,
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        p2pOrderDispute: p2pOrderDispute ?? this.p2pOrderDispute,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
