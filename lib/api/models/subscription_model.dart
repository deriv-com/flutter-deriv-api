import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Subscription model class
class SubscriptionModel extends APIBaseModel {
  /// Initializes
  SubscriptionModel({
    this.id,
  });

  /// Generates an instance from json
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json == null ? null : json['id'],
      );

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Generates a copy of instance with given parameters
  SubscriptionModel copyWith({
    String id,
  }) =>
      SubscriptionModel(
        id: id ?? this.id,
      );
}
