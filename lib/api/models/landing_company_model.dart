import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/landing_company_detail_model.dart';

/// Model class for landing company
abstract class LandingCompanyModel extends BaseModel {
  /// Initializes
  LandingCompanyModel({
    this.financialCompany,
    this.gamingCompany,
    this.id,
    this.mtFinancialCompany,
    this.mtGamingCompany,
    this.name,
  });

  /// Landing Company for financial contracts (all except Synthetic Indices)
  final LandingCompanyDetailModel financialCompany;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final LandingCompanyDetailModel gamingCompany;

  /// Country code
  final String id;

  /// Landing Company for MT5 financial contracts (all except Synthetic Indices),
  /// currently divided into advanced and standard as subtypes.
  final MTLandingCompanyModel mtFinancialCompany;

  /// Landing Company for MT5 gaming contracts (Synthetic Indices)
  final MTLandingCompanyModel mtGamingCompany;

  /// Country name
  final String name;
}

/// MTFinancialCompanyModel model class
class MTLandingCompanyModel extends BaseModel {
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
        advanced: json['advanced'] == null
            ? null
            : LandingCompanyDetailModel.fromJson(json['advanced']),
        standard: json['standard'] == null
            ? null
            : LandingCompanyDetailModel.fromJson(json['standard']),
      );

  /// Contain details for landing company for advanced subtype.
  /// The Advanced account provides you with tight spreads, higher ticket size
  /// and offers a variety of FX pairs from majors to exotics. It is a straight
  /// through processing (STP) account with direct access to FX liquidity from various providers.
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
