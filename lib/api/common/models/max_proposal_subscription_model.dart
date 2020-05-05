import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Maximum subscription to proposal calls.
class MaxProposalSubscriptionModel extends APIBaseModel {
  /// Initializes
  MaxProposalSubscriptionModel({this.appliesTo, this.max});

  /// Generates an instance from json
  factory MaxProposalSubscriptionModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      MaxProposalSubscriptionModel(
        appliesTo: json['applies_to'],
        max: json['max'],
      );

  /// Describes which calls this limit applies to.
  final String appliesTo;

  /// Maximum number of allowed calls.
  final int max;

  /// Generates a copy of instance with given parameters
  MaxProposalSubscriptionModel copyWith({
    String appliesTo,
    int max,
  }) =>
      MaxProposalSubscriptionModel(
        appliesTo: appliesTo ?? this.appliesTo,
        max: max ?? this.max,
      );
}
