import 'package:flutter_deriv_api/api/models/landing_company_detail_model.dart';
import 'package:flutter_deriv_api/api/models/landing_company_model.dart';

/// Landing company infromation
class LandingCompany extends LandingCompanyModel {
  /// Initializes
  LandingCompany({
    LandingCompanyDetailModel financialCompany,
    LandingCompanyDetailModel gamingCompany,
    String id,
    MTLandingCompanyModel mtFinancialCompany,
    MTLandingCompanyModel mtGamingCompany,
    String name,
  }) : super(
          financialCompany: financialCompany,
          gamingCompany: gamingCompany,
          id: id,
          mtFinancialCompany: mtFinancialCompany,
          mtGamingCompany: mtGamingCompany,
          name: name,
        );

  /// Creates instance from JSON
  factory LandingCompany.fromJson(Map<String, dynamic> json) => LandingCompany(
        financialCompany: json['financial_company'] == null
            ? null
            : LandingCompanyDetailModel.fromJson(json['financial_company']),
        gamingCompany: json['gaming_company'] == null
            ? null
            : LandingCompanyDetailModel.fromJson(json['gaming_company']),
        id: json['id'],
        mtFinancialCompany: json['mt_financial_company'] == null
            ? null
            : MTLandingCompanyModel.fromJson(json['mt_financial_company']),
        mtGamingCompany: json['mt_gaming_company'] == null
            ? null
            : MTLandingCompanyModel.fromJson(json['mt_gaming_company']),
        name: json['name'],
      );

  /// Creates a copy of this instance
  LandingCompany copyWith({
    LandingCompanyDetailModel financialCompany,
    LandingCompanyDetailModel gamingCompany,
    String id,
    MTLandingCompanyModel mtFinancialCompany,
    MTLandingCompanyModel mtGamingCompany,
    String name,
  }) =>
      LandingCompany(
        financialCompany: financialCompany ?? this.financialCompany,
        gamingCompany: gamingCompany ?? this.gamingCompany,
        id: id ?? this.id,
        mtFinancialCompany: mtFinancialCompany ?? this.mtFinancialCompany,
        mtGamingCompany: mtGamingCompany ?? this.mtGamingCompany,
        name: name ?? this.name,
      );
}
