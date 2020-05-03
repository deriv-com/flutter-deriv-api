import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';
import 'landing_company_detail_model.dart';

/// MTFinancialCompanyModel model class
class MTLandingCompanyModel extends APIBaseModel {
  /// Initializes
  MTLandingCompanyModel({
    this.advanced,
    this.standard,
  });

  /// Creates instance from JSON
  factory MTLandingCompanyModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      MTLandingCompanyModel(
        advanced: getItemFromMap(
          json['advanced'],
          itemToTypeCallback: (dynamic item) =>
              LandingCompanyDetailModel.fromJson(item),
        ),
        standard: getItemFromMap(
          json['standard'],
          itemToTypeCallback: (dynamic item) =>
              LandingCompanyDetailModel.fromJson(item),
        ),
      );

  /// Contain details for landing company for advanced subtype.
  /// The Advanced account provides you with tight spreads, higher ticket size
  /// and offers a variety of FX pairs from majors to exotics. It is a straight
  /// through processing (STP) account with direct access to FX liquidity from
  /// various providers.
  final LandingCompanyDetailModel advanced;

  /// Contain details for landing company for standard subtype.
  /// The Standard account is suitable for a wide range of traders,
  /// both new and experienced. It gives you mid-range leverage and variable
  /// spreads that give you a great deal of flexibility for whatever position
  /// you wish to take in the market.
  final LandingCompanyDetailModel standard;

  /// Clones a new instance
  MTLandingCompanyModel copyWith(
    LandingCompanyDetailModel advanced,
    LandingCompanyDetailModel standard,
  ) =>
      MTLandingCompanyModel(
        advanced: advanced ?? this.advanced,
        standard: standard ?? this.standard,
      );
}
