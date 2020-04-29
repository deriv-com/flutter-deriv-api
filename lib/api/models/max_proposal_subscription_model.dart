import 'base_model.dart';

/// Maximum subscription to proposal calls.
class MaxProposalSubscriptionModel extends BaseModel {
  /// Initializes
  MaxProposalSubscriptionModel(this.appliesTo, this.max);

  /// From Json
  factory MaxProposalSubscriptionModel.fromMap(
    Map<String, dynamic> json,
  ) =>
      MaxProposalSubscriptionModel(
        json['applies_to'],
        json['max'],
      );

  /// Describes which calls this limit applies to.
  final String appliesTo;

  /// Maximum number of allowed calls.
  final int max;

  /// Clones a new instance
  MaxProposalSubscriptionModel copyWith({
    String appliesTo,
    int max,
  }) =>
      MaxProposalSubscriptionModel(
        appliesTo ?? this.appliesTo,
        max ?? this.max,
      );
}
