/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_review_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p order review receive class.
class P2pOrderReviewReceive extends Response {
  /// Initialize P2pOrderReviewReceive.
  const P2pOrderReviewReceive({
    this.p2pOrderReview,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pOrderReviewReceive.fromJson(Map<String, dynamic> json) =>
      P2pOrderReviewReceive(
        p2pOrderReview: json['p2p_order_review'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Details of the created order review.
  final Map<String, dynamic>? p2pOrderReview;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_order_review': p2pOrderReview,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderReviewReceive copyWith({
    Map<String, dynamic>? p2pOrderReview,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pOrderReviewReceive(
        p2pOrderReview: p2pOrderReview ?? this.p2pOrderReview,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
