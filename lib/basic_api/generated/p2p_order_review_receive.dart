/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_review_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p order review response class.
class P2pOrderReviewResponse extends Response {
  /// Initialize P2pOrderReviewResponse.
  const P2pOrderReviewResponse({
    this.p2pOrderReview,
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
  factory P2pOrderReviewResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderReviewResponse(
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
  P2pOrderReviewResponse copyWith({
    Map<String, dynamic>? p2pOrderReview,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pOrderReviewResponse(
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
