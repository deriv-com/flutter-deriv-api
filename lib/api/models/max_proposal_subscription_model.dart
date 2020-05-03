import 'base_model.dart';

/// Maximum subscription to proposal calls.
class MaxProposalSubscriptionModel extends BaseModel {
  /// Initializes
  MaxProposalSubscriptionModel({this.appliesTo, this.max});

  /// From Json
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

  /// Clones a new instance
  MaxProposalSubscriptionModel copyWith({
    String appliesTo,
    int max,
  }) =>
      MaxProposalSubscriptionModel(
        appliesTo: appliesTo ?? this.appliesTo,
        max: max ?? this.max,
      );
}
