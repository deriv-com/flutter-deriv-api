import 'api_base_model.dart';
import 'landing_company_config_model.dart';
import 'landing_company_detail_model.dart';
import 'mt_landing_company_model.dart';

/// Model class for landing company
abstract class LandingCompanyModel extends APIBaseModel {
  /// Initializes
  LandingCompanyModel({
    this.config,
    this.financialCompany,
    this.gamingCompany,
    this.id,
    this.minimumAge,
    this.mtFinancialCompany,
    this.mtGamingCompany,
    this.name,
    this.virtualCompany,
  });

  /// Landing companies configs
  final LandingCompanyConfigModel config;

  /// Landing Company for financial contracts (all except Synthetic Indices)
  final LandingCompanyDetailModel financialCompany;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final LandingCompanyDetailModel gamingCompany;

  /// Country code
  final String id;

  /// Minimum age
  final int minimumAge;

  /// Landing Company for MT5 financial contracts (all except Synthetic Indices),
  /// currently divided into advanced and standard as subtypes.
  final MTLandingCompanyModel mtFinancialCompany;

  /// Landing Company for MT5 gaming contracts (Synthetic Indices)
  final MTLandingCompanyModel mtGamingCompany;

  /// Country name
  final String name;

  /// Virtual company
  final String virtualCompany;
}
