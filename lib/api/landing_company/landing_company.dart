import 'package:flutter_deriv_api/api/models/landing_company_detail_model.dart';
import 'package:flutter_deriv_api/api/models/landing_company_model.dart';
import 'package:flutter_deriv_api/api/models/landing_company_config_model.dart';
import 'package:flutter_deriv_api/api/models/mt_landing_company_model.dart';

/// Landing company info
class LandingCompany extends LandingCompanyModel {
  /// Initializes
  LandingCompany({
    LandingCompanyConfigModel config,
    LandingCompanyDetailModel financialCompany,
    LandingCompanyDetailModel gamingCompany,
    String id,
    int minimumAge,
    MTLandingCompanyModel mtFinancialCompany,
    MTLandingCompanyModel mtGamingCompany,
    String name,
    String virtualCompany,
  }) : super(
          config: config,
          financialCompany: financialCompany,
          gamingCompany: gamingCompany,
          id: id,
          minimumAge: minimumAge,
          mtFinancialCompany: mtFinancialCompany,
          mtGamingCompany: mtGamingCompany,
          name: name,
          virtualCompany: virtualCompany,
        );

  /// Creates instance from JSON
  factory LandingCompany.fromJson(Map<String, dynamic> json) => LandingCompany(
        config:
            json['config'] == null ? null : LandingCompanyConfigModel.fromJson(json['config']),
        financialCompany: json['financial_company'] == null
            ? null
            : LandingCompanyDetailModel.fromJson(json['financial_company']),
        gamingCompany: json['gaming_company'] == null
            ? null
            : LandingCompanyDetailModel.fromJson(json['gaming_company']),
        id: json['id'],
        minimumAge: json['minimum_age'],
        mtFinancialCompany: json['mt_financial_company'] == null
            ? null
            : MTLandingCompanyModel.fromJson(json['mt_financial_company']),
        mtGamingCompany: json['mt_gaming_company'] == null
            ? null
            : MTLandingCompanyModel.fromJson(json['mt_gaming_company']),
        name: json['name'],
        virtualCompany: json['virtual_company'],
      );

  /// Creates a copy of this instance
  LandingCompany copyWith({
    LandingCompanyConfigModel config,
    LandingCompanyDetailModel financialCompany,
    LandingCompanyDetailModel gamingCompany,
    String id,
    int minimumAge,
    MTLandingCompanyModel mtFinancialCompany,
    MTLandingCompanyModel mtGamingCompany,
    String name,
    String virtualCompany,
  }) =>
      LandingCompany(
        config: config ?? this.config,
        financialCompany: financialCompany ?? this.financialCompany,
        gamingCompany: gamingCompany ?? this.gamingCompany,
        id: id ?? this.id,
        minimumAge: minimumAge ?? this.minimumAge,
        mtFinancialCompany: mtFinancialCompany ?? this.mtFinancialCompany,
        mtGamingCompany: mtGamingCompany ?? this.mtGamingCompany,
        name: name ?? this.name,
        virtualCompany: virtualCompany ?? this.virtualCompany,
      );
}
