/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_review_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p order review request class.
class P2pOrderReviewRequest extends Request {
  /// Initialize P2pOrderReviewRequest.
  const P2pOrderReviewRequest({
    required this.orderId,
    this.p2pOrderReview = true,
    required this.rating,
    this.recommended,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'p2p_order_review',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory P2pOrderReviewRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderReviewRequest(
        orderId: json['order_id'] as String?,
        p2pOrderReview: json['p2p_order_review'] == null
            ? null
            : json['p2p_order_review'] == 1,
        rating: json['rating'] as int?,
        recommended: json['recommended'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The order identification number.
  final String? orderId;

  /// Must be `true`
  final bool? p2pOrderReview;

  /// Rating for the transaction, 1 to 5.
  final int? rating;

  /// [Optional] `1` if the counterparty is recommendable to others, otherwise `0`.
  final int? recommended;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'order_id': orderId,
        'p2p_order_review': p2pOrderReview == null
            ? null
            : p2pOrderReview!
                ? 1
                : 0,
        'rating': rating,
        'recommended': recommended,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderReviewRequest copyWith({
    String? orderId,
    bool? p2pOrderReview,
    int? rating,
    int? recommended,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pOrderReviewRequest(
        orderId: orderId ?? this.orderId,
        p2pOrderReview: p2pOrderReview ?? this.p2pOrderReview,
        rating: rating ?? this.rating,
        recommended: recommended ?? this.recommended,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
