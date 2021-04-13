import 'package:flutter_deriv_api/api/common/landing_company/exceptions/landing_company_exception.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_config_model.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_detail_model.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_model.dart';
import 'package:flutter_deriv_api/api/common/models/mt_landing_company_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Landing company info
class LandingCompany extends LandingCompanyModel {
  /// Initializes
  LandingCompany({
    LandingCompanyConfigModel? config,
    LandingCompanyDetailModel? financialCompany,
    LandingCompanyDetailModel? gamingCompany,
    String? id,
    int? minimumAge,
    MTLandingCompanyModel? mtFinancialCompany,
    MTLandingCompanyModel? mtGamingCompany,
    String? name,
    String? virtualCompany,
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

  /// Creates an instance from JSON
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

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Gets landing companies for given [LandingCompanyRequest]
  ///
  /// Throws a [LandingCompanyException] if API response contains an error
  static Future<LandingCompany> fetchLandingCompanies(
    LandingCompanyRequest request,
  ) async {
    final LandingCompanyResponse response =
        await _api!.call<LandingCompanyResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          LandingCompanyException(baseExceptionModel: baseExceptionModel),
    );

    return LandingCompany.fromJson(response.landingCompany);
  }

  /// Gets details of a landing company specified in [LandingCompanyDetailsRequest]
  ///
  /// Throws a [LandingCompanyException] if API response contains an error
  static Future<LandingCompanyDetailModel> fetchLandingCompanyDetails(
    LandingCompanyDetailsRequest request,
  ) async {
    final LandingCompanyDetailsResponse response =
        await _api!.call<LandingCompanyDetailsResponse>(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          LandingCompanyException(baseExceptionModel: baseExceptionModel),
    );

    return LandingCompanyDetailModel.fromJson(response.landingCompanyDetails);
  }

  /// Creates a copy of this instance
  LandingCompany copyWith({
    LandingCompanyConfigModel? config,
    LandingCompanyDetailModel? financialCompany,
    LandingCompanyDetailModel? gamingCompany,
    String? id,
    int? minimumAge,
    MTLandingCompanyModel? mtFinancialCompany,
    MTLandingCompanyModel? mtGamingCompany,
    String? name,
    String? virtualCompany,
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
