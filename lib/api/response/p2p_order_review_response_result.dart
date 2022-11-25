// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';


import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_review_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_review_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p order review response model class.
abstract class P2pOrderReviewResponseModel {
  /// Initializes P2p order review response model class .
  const P2pOrderReviewResponseModel({
    this.p2pOrderReview,
  });

  /// Details of the created order review.
  final P2pOrderReview? p2pOrderReview;
}

/// P2p order review response class.
class P2pOrderReviewResponse extends P2pOrderReviewResponseModel {
  /// Initializes P2p order review response class.
  const P2pOrderReviewResponse({
    P2pOrderReview? p2pOrderReview,
  }) : super(
          p2pOrderReview: p2pOrderReview,
        );

  /// Creates an instance from JSON.
  factory P2pOrderReviewResponse.fromJson(
    dynamic p2pOrderReviewJson,
  ) =>
      P2pOrderReviewResponse(
        p2pOrderReview: p2pOrderReviewJson == null
            ? null
            : P2pOrderReview.fromJson(p2pOrderReviewJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderReview != null) {
      resultMap['p2p_order_review'] = p2pOrderReview!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a review for the specified order.
  Future<P2pOrderReviewResponse> reviewOrder(
    P2pOrderReviewRequest request,
  ) async {
    final P2pOrderReviewReceive response = await reviewOrderRaw(request);

    return P2pOrderReviewResponse.fromJson(response.p2pOrderReview);
  }

  /// Creates a review for the specified order.
  Future<P2pOrderReviewReceive> reviewOrderRaw(
    P2pOrderReviewRequest request,
  ) async {
    final P2pOrderReviewReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderReviewResponse copyWith({
    P2pOrderReview? p2pOrderReview,
  }) =>
      P2pOrderReviewResponse(
        p2pOrderReview: p2pOrderReview ?? this.p2pOrderReview,
      );
}
/// P2p order review model class.
abstract class P2pOrderReviewModel {
  /// Initializes P2p order review model class .
  const P2pOrderReviewModel({
    required this.rating,
    required this.orderId,
    required this.createdTime,
    required this.advertiserId,
    this.recommended,
  });

  /// Rating for the transaction, 1 to 5.
  final int rating;

  /// The order identification number.
  final String orderId;

  /// The epoch time of the review.
  final DateTime createdTime;

  /// The reviewed advertiser's identification number.
  final String advertiserId;

  /// `1` if the advertiser is recommended, `0` if not recommended.
  final int? recommended;
}

/// P2p order review class.
class P2pOrderReview extends P2pOrderReviewModel {
  /// Initializes P2p order review class.
  const P2pOrderReview({
    required String advertiserId,
    required DateTime createdTime,
    required String orderId,
    required int rating,
    int? recommended,
  }) : super(
          advertiserId: advertiserId,
          createdTime: createdTime,
          orderId: orderId,
          rating: rating,
          recommended: recommended,
        );

  /// Creates an instance from JSON.
  factory P2pOrderReview.fromJson(Map<String, dynamic> json) => P2pOrderReview(
        advertiserId: json['advertiser_id'],
        createdTime: getDateTime(json['created_time'])!,
        orderId: json['order_id'],
        rating: json['rating'],
        recommended: json['recommended'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['advertiser_id'] = advertiserId;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['order_id'] = orderId;
    resultMap['rating'] = rating;
    resultMap['recommended'] = recommended;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderReview copyWith({
    String? advertiserId,
    DateTime? createdTime,
    String? orderId,
    int? rating,
    int? recommended,
  }) =>
      P2pOrderReview(
        advertiserId: advertiserId ?? this.advertiserId,
        createdTime: createdTime ?? this.createdTime,
        orderId: orderId ?? this.orderId,
        rating: rating ?? this.rating,
        recommended: recommended ?? this.recommended,
      );
}
