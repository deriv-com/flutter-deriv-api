import 'package:flutter_deriv_api/api/common/models/landing_company_config_model.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_detail_model.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_model.dart';
import 'package:flutter_deriv_api/api/common/models/mt_landing_company_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

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

  /// Creates an instance from json
  factory LandingCompany.fromJson(Map<String, dynamic> json) => LandingCompany(
        config: getItemFromMap(
          json['config'],
          itemToTypeCallback: (dynamic item) =>
              LandingCompanyConfigModel.fromJson(item),
        ),
        financialCompany: getItemFromMap(
          json['financial_company'],
          itemToTypeCallback: (dynamic item) =>
              LandingCompanyDetailModel.fromJson(item),
        ),
        gamingCompany: getItemFromMap(
          json['gaming_company'],
          itemToTypeCallback: (dynamic item) =>
              LandingCompanyDetailModel.fromJson(item),
        ),
        id: json['id'],
        minimumAge: json['minimum_age'],
        mtFinancialCompany: getItemFromMap(
          json['mt_financial_company'],
          itemToTypeCallback: (dynamic item) =>
              MTLandingCompanyModel.fromJson(item),
        ),
        mtGamingCompany: getItemFromMap(
          json['mt_gaming_company'],
          itemToTypeCallback: (dynamic item) =>
              MTLandingCompanyModel.fromJson(item),
        ),
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
