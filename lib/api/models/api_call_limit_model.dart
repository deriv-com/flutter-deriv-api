import 'base_model.dart';
import 'max_proposal_subscription_model.dart';
import 'max_request_allowed_model.dart';

/// Maximum number of API calls during specified period of time.
class ApiCallLimitModel extends BaseModel{
  /// Initializes
  ApiCallLimitModel(
    this.maxProposalSubscription,
    this.maxRequestsGeneral,
    this.maxRequestsOutcome,
    this.maxRequestsPricing,
  );

  /// From Json
  factory ApiCallLimitModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ApiCallLimitModel(
        MaxProposalSubscriptionModel.fromMap(json['max_proposal_subscription']),
        MaxRequestAllowedModel.fromJson(json['max_requestes_general']),
        MaxRequestAllowedModel.fromJson(json['max_requests_outcome']),
        MaxRequestAllowedModel.fromJson(json['max_requests_pricing']),
      );

  /// Maximum subscription to proposal calls.
  final MaxProposalSubscriptionModel maxProposalSubscription;

  /// Maximum number of general requests allowed during specified period of time.
  final MaxRequestAllowedModel maxRequestsGeneral;

  /// Maximum number of outcome requests allowed during specified period of time.
  final MaxRequestAllowedModel maxRequestsOutcome;

  /// Maximum number of pricing requests allowed during specified period of time.
  final MaxRequestAllowedModel maxRequestsPricing;

  /// Clones a new instance
  ApiCallLimitModel copyWith({
    MaxProposalSubscriptionModel maxProposalSubscription,
    MaxRequestAllowedModel maxRequestsGeneral,
    MaxRequestAllowedModel maxRequestsOutcome,
    MaxRequestAllowedModel maxRequestsPricing,
  }) =>
      ApiCallLimitModel(
        maxProposalSubscription ?? this.maxProposalSubscription,
        maxRequestsGeneral ?? this.maxRequestsGeneral,
        maxRequestsOutcome ?? this.maxRequestsOutcome,
        maxRequestsPricing ?? this.maxRequestsPricing,
      );
}
