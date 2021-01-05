import 'package:flutter_deriv_api/api/common/models/max_proposal_subscription_model.dart';
import 'package:flutter_deriv_api/api/common/models/max_request_allowed_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Maximum number of API calls during specified period of time.
class ApiCallLimitModel extends APIBaseModel {
  /// Initializes
  ApiCallLimitModel({
    this.maxProposalSubscription,
    this.maxRequestsGeneral,
    this.maxRequestsOutcome,
    this.maxRequestsPricing,
  });

  /// Generate an instance from JSON
  factory ApiCallLimitModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ApiCallLimitModel(
        maxProposalSubscription: getItemFromMap(
          json['max_proposal_subscription'],
          itemToTypeCallback: (dynamic item) =>
              MaxProposalSubscriptionModel.fromJson(item),
        ),
        maxRequestsGeneral: getItemFromMap(
          json['max_requestes_general'],
          itemToTypeCallback: (dynamic item) =>
              MaxRequestAllowedModel.fromJson(item),
        ),
        maxRequestsOutcome: getItemFromMap(
          json['max_requests_outcome'],
          itemToTypeCallback: (dynamic item) =>
              MaxRequestAllowedModel.fromJson(item),
        ),
        maxRequestsPricing: getItemFromMap(
          json['max_requests_pricing'],
          itemToTypeCallback: (dynamic item) =>
              MaxRequestAllowedModel.fromJson(item),
        ),
      );

  /// Maximum subscription to proposal calls.
  final MaxProposalSubscriptionModel maxProposalSubscription;

  /// Maximum number of general requests allowed during specified period of time.
  final MaxRequestAllowedModel maxRequestsGeneral;

  /// Maximum number of outcome requests allowed during specified period of time.
  final MaxRequestAllowedModel maxRequestsOutcome;

  /// Maximum number of pricing requests allowed during specified period of time.
  final MaxRequestAllowedModel maxRequestsPricing;

  /// Generate a copy of instance with given parameters
  ApiCallLimitModel copyWith({
    MaxProposalSubscriptionModel maxProposalSubscription,
    MaxRequestAllowedModel maxRequestsGeneral,
    MaxRequestAllowedModel maxRequestsOutcome,
    MaxRequestAllowedModel maxRequestsPricing,
  }) =>
      ApiCallLimitModel(
        maxProposalSubscription:
            maxProposalSubscription ?? this.maxProposalSubscription,
        maxRequestsGeneral: maxRequestsGeneral ?? this.maxRequestsGeneral,
        maxRequestsOutcome: maxRequestsOutcome ?? this.maxRequestsOutcome,
        maxRequestsPricing: maxRequestsPricing ?? this.maxRequestsPricing,
      );
}
