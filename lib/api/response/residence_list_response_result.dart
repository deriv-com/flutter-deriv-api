// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/residence_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/residence_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Residence list response model class.
abstract class ResidenceListResponseModel {
  /// Initializes Residence list response model class .
  const ResidenceListResponseModel({
    this.residenceList,
  });

  /// List of countries for account opening
  final List<ResidenceListItem>? residenceList;
}

/// Residence list response class.
class ResidenceListResponse extends ResidenceListResponseModel {
  /// Initializes Residence list response class.
  const ResidenceListResponse({
    super.residenceList,
  });

  /// Creates an instance from JSON.
  factory ResidenceListResponse.fromJson(
    dynamic residenceListJson,
  ) =>
      ResidenceListResponse(
        residenceList: residenceListJson == null
            ? null
            : List<ResidenceListItem>.from(
                residenceListJson?.map(
                  (dynamic item) => ResidenceListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (residenceList != null) {
      resultMap['residence_list'] = residenceList!
          .map<dynamic>(
            (ResidenceListItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets Residence list for the given [ResidenceListRequest]
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<ResidenceListResponse> fetchResidenceList([
    ResidenceListRequest? request,
  ]) async {
    final ResidenceListReceive response = await _api.call(
      request: request ?? const ResidenceListRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ResidenceListResponse.fromJson(response.residenceList);
  }

  /// Creates a copy of instance with given parameters.
  ResidenceListResponse copyWith({
    List<ResidenceListItem>? residenceList,
  }) =>
      ResidenceListResponse(
        residenceList: residenceList ?? this.residenceList,
      );
}
/// Residence list item model class.
abstract class ResidenceListItemModel {
  /// Initializes Residence list item model class .
  const ResidenceListItemModel({
    this.accountOpeningSelfDeclarationRequired,
    this.commonReportingStandard,
    this.disabled,
    this.identity,
    this.jurisdictionRiskAssessment,
    this.partnerSignup,
    this.phoneIdd,
    this.selected,
    this.text,
    this.tinFormat,
    this.value,
    this.walletSignup,
  });

  /// Flag which indicates whether self declaration is required for account opening
  final bool? accountOpeningSelfDeclarationRequired;

  /// Common Reporting Standard
  final CommonReportingStandard? commonReportingStandard;

  /// Disabled.
  final String? disabled;

  /// Information about identity options available
  final Identity? identity;

  /// Jurisdiction Risk Assessment
  final JurisdictionRiskAssessment? jurisdictionRiskAssessment;

  /// Flag which indicates whether partner signup is available in this country
  final bool? partnerSignup;

  /// IDD code of country
  final String? phoneIdd;

  /// Selected.
  final String? selected;

  /// Country full name
  final String? text;

  /// Country tax identifier format
  final List<String>? tinFormat;

  /// 2-letter country code
  final String? value;

  /// Flag which indicates whether wallet signup is available in this country
  final bool? walletSignup;
}

/// Residence list item class.
class ResidenceListItem extends ResidenceListItemModel {
  /// Initializes Residence list item class.
  const ResidenceListItem({
    super.accountOpeningSelfDeclarationRequired,
    super.commonReportingStandard,
    super.disabled,
    super.identity,
    super.jurisdictionRiskAssessment,
    super.partnerSignup,
    super.phoneIdd,
    super.selected,
    super.text,
    super.tinFormat,
    super.value,
    super.walletSignup,
  });

  /// Creates an instance from JSON.
  factory ResidenceListItem.fromJson(Map<String, dynamic> json) =>
      ResidenceListItem(
        accountOpeningSelfDeclarationRequired:
            getBool(json['account_opening_self_declaration_required']),
        commonReportingStandard: json['common_reporting_standard'] == null
            ? null
            : CommonReportingStandard.fromJson(
                json['common_reporting_standard']),
        disabled: json['disabled'],
        identity: json['identity'] == null
            ? null
            : Identity.fromJson(json['identity']),
        jurisdictionRiskAssessment: json['jurisdiction_risk_assessment'] == null
            ? null
            : JurisdictionRiskAssessment.fromJson(
                json['jurisdiction_risk_assessment']),
        partnerSignup: getBool(json['partner_signup']),
        phoneIdd: json['phone_idd'],
        selected: json['selected'],
        text: json['text'],
        tinFormat: json['tin_format'] == null
            ? null
            : List<String>.from(
                json['tin_format']?.map(
                  (dynamic item) => item,
                ),
              ),
        value: json['value'],
        walletSignup: getBool(json['wallet_signup']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_opening_self_declaration_required'] =
        getInt(value: accountOpeningSelfDeclarationRequired);
    if (commonReportingStandard != null) {
      resultMap['common_reporting_standard'] =
          commonReportingStandard!.toJson();
    }
    resultMap['disabled'] = disabled;
    if (identity != null) {
      resultMap['identity'] = identity!.toJson();
    }
    if (jurisdictionRiskAssessment != null) {
      resultMap['jurisdiction_risk_assessment'] =
          jurisdictionRiskAssessment!.toJson();
    }
    resultMap['partner_signup'] = getInt(value: partnerSignup);
    resultMap['phone_idd'] = phoneIdd;
    resultMap['selected'] = selected;
    resultMap['text'] = text;
    if (tinFormat != null) {
      resultMap['tin_format'] = tinFormat!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['value'] = value;
    resultMap['wallet_signup'] = getInt(value: walletSignup);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ResidenceListItem copyWith({
    bool? accountOpeningSelfDeclarationRequired,
    CommonReportingStandard? commonReportingStandard,
    String? disabled,
    Identity? identity,
    JurisdictionRiskAssessment? jurisdictionRiskAssessment,
    bool? partnerSignup,
    String? phoneIdd,
    String? selected,
    String? text,
    List<String>? tinFormat,
    String? value,
    bool? walletSignup,
  }) =>
      ResidenceListItem(
        accountOpeningSelfDeclarationRequired:
            accountOpeningSelfDeclarationRequired ??
                this.accountOpeningSelfDeclarationRequired,
        commonReportingStandard:
            commonReportingStandard ?? this.commonReportingStandard,
        disabled: disabled ?? this.disabled,
        identity: identity ?? this.identity,
        jurisdictionRiskAssessment:
            jurisdictionRiskAssessment ?? this.jurisdictionRiskAssessment,
        partnerSignup: partnerSignup ?? this.partnerSignup,
        phoneIdd: phoneIdd ?? this.phoneIdd,
        selected: selected ?? this.selected,
        text: text ?? this.text,
        tinFormat: tinFormat ?? this.tinFormat,
        value: value ?? this.value,
        walletSignup: walletSignup ?? this.walletSignup,
      );
}
/// Common reporting standard model class.
abstract class CommonReportingStandardModel {
  /// Initializes Common reporting standard model class .
  const CommonReportingStandardModel({
    this.nonParticipatingJurisdictions,
    this.postcode,
    this.tax,
  });

  /// NPJ configuration
  final NonParticipatingJurisdictions? nonParticipatingJurisdictions;

  /// Postcode configuration
  final Postcode? postcode;

  /// Tax configuration
  final Tax? tax;
}

/// Common reporting standard class.
class CommonReportingStandard extends CommonReportingStandardModel {
  /// Initializes Common reporting standard class.
  const CommonReportingStandard({
    super.nonParticipatingJurisdictions,
    super.postcode,
    super.tax,
  });

  /// Creates an instance from JSON.
  factory CommonReportingStandard.fromJson(Map<String, dynamic> json) =>
      CommonReportingStandard(
        nonParticipatingJurisdictions:
            json['non_participating_jurisdictions'] == null
                ? null
                : NonParticipatingJurisdictions.fromJson(
                    json['non_participating_jurisdictions']),
        postcode: json['postcode'] == null
            ? null
            : Postcode.fromJson(json['postcode']),
        tax: json['tax'] == null ? null : Tax.fromJson(json['tax']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (nonParticipatingJurisdictions != null) {
      resultMap['non_participating_jurisdictions'] =
          nonParticipatingJurisdictions!.toJson();
    }
    if (postcode != null) {
      resultMap['postcode'] = postcode!.toJson();
    }
    if (tax != null) {
      resultMap['tax'] = tax!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CommonReportingStandard copyWith({
    NonParticipatingJurisdictions? nonParticipatingJurisdictions,
    Postcode? postcode,
    Tax? tax,
  }) =>
      CommonReportingStandard(
        nonParticipatingJurisdictions:
            nonParticipatingJurisdictions ?? this.nonParticipatingJurisdictions,
        postcode: postcode ?? this.postcode,
        tax: tax ?? this.tax,
      );
}
/// Non participating jurisdictions model class.
abstract class NonParticipatingJurisdictionsModel {
  /// Initializes Non participating jurisdictions model class .
  const NonParticipatingJurisdictionsModel({
    this.nonParticipatingJurisdictionsDefault,
    this.landingCompany,
  });

  /// Default NPJ flag
  final bool? nonParticipatingJurisdictionsDefault;

  /// Flags for specific landing companies
  final Map<String, bool>? landingCompany;
}

/// Non participating jurisdictions class.
class NonParticipatingJurisdictions extends NonParticipatingJurisdictionsModel {
  /// Initializes Non participating jurisdictions class.
  const NonParticipatingJurisdictions({
    super.nonParticipatingJurisdictionsDefault,
    super.landingCompany,
  });

  /// Creates an instance from JSON.
  factory NonParticipatingJurisdictions.fromJson(Map<String, dynamic> json) =>
      NonParticipatingJurisdictions(
        nonParticipatingJurisdictionsDefault:
            getBool(json['default']),
        landingCompany: json['landing_company'] == null
            ? null
            : Map<String, bool>.fromEntries(json['landing_company']
                .entries
                .map<MapEntry<String, bool>>(
                    (MapEntry<String, dynamic> entry) => MapEntry<String, bool>(
                        entry.key, getBool(entry.value)!))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['default'] =
        nonParticipatingJurisdictionsDefault;
    resultMap['landing_company'] = landingCompany?.map(
      (String key, bool value) => MapEntry<String, dynamic>(key, value),
    );

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NonParticipatingJurisdictions copyWith({
    bool? nonParticipatingJurisdictionsDefault,
    Map<String, bool>? landingCompany,
  }) =>
      NonParticipatingJurisdictions(
        nonParticipatingJurisdictionsDefault:
            nonParticipatingJurisdictionsDefault ??
                this.nonParticipatingJurisdictionsDefault,
        landingCompany: landingCompany ?? this.landingCompany,
      );
}
/// Postcode model class.
abstract class PostcodeModel {
  /// Initializes Postcode model class .
  const PostcodeModel({
    this.invalidPattern,
  });

  /// Invalid regex patterns for postcode validation
  final String? invalidPattern;
}

/// Postcode class.
class Postcode extends PostcodeModel {
  /// Initializes Postcode class.
  const Postcode({
    super.invalidPattern,
  });

  /// Creates an instance from JSON.
  factory Postcode.fromJson(Map<String, dynamic> json) => Postcode(
        invalidPattern: json['invalid_pattern'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['invalid_pattern'] = invalidPattern;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Postcode copyWith({
    String? invalidPattern,
  }) =>
      Postcode(
        invalidPattern: invalidPattern ?? this.invalidPattern,
      );
}
/// Tax model class.
abstract class TaxModel {
  /// Initializes Tax model class .
  const TaxModel({
    this.mandatory,
    this.poiEquivalent,
    this.tinCleaner,
    this.tinFormat,
    this.tinFormatDescription,
  });

  /// Mandatory TIN flag
  final bool? mandatory;

  /// POI equivalent flag
  final bool? poiEquivalent;

  /// Cleanup regex
  final String? tinCleaner;

  /// Country tax identifier format
  final List<String>? tinFormat;

  /// Description of the TIN format
  final String? tinFormatDescription;
}

/// Tax class.
class Tax extends TaxModel {
  /// Initializes Tax class.
  const Tax({
    super.mandatory,
    super.poiEquivalent,
    super.tinCleaner,
    super.tinFormat,
    super.tinFormatDescription,
  });

  /// Creates an instance from JSON.
  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        mandatory: getBool(json['mandatory']),
        poiEquivalent: getBool(json['poi_equivalent']),
        tinCleaner: json['tin_cleaner'],
        tinFormat: json['tin_format'] == null
            ? null
            : List<String>.from(
                json['tin_format']?.map(
                  (dynamic item) => item,
                ),
              ),
        tinFormatDescription: json['tin_format_description'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mandatory'] = mandatory;
    resultMap['poi_equivalent'] = poiEquivalent;
    resultMap['tin_cleaner'] = tinCleaner;
    if (tinFormat != null) {
      resultMap['tin_format'] = tinFormat!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['tin_format_description'] = tinFormatDescription;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Tax copyWith({
    bool? mandatory,
    bool? poiEquivalent,
    String? tinCleaner,
    List<String>? tinFormat,
    String? tinFormatDescription,
  }) =>
      Tax(
        mandatory: mandatory ?? this.mandatory,
        poiEquivalent: poiEquivalent ?? this.poiEquivalent,
        tinCleaner: tinCleaner ?? this.tinCleaner,
        tinFormat: tinFormat ?? this.tinFormat,
        tinFormatDescription: tinFormatDescription ?? this.tinFormatDescription,
      );
}
/// Identity model class.
abstract class IdentityModel {
  /// Initializes Identity model class .
  const IdentityModel({
    this.services,
  });

  /// Identity services configuration
  final Services? services;
}

/// Identity class.
class Identity extends IdentityModel {
  /// Initializes Identity class.
  const Identity({
    super.services,
  });

  /// Creates an instance from JSON.
  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        services: json['services'] == null
            ? null
            : Services.fromJson(json['services']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (services != null) {
      resultMap['services'] = services!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Identity copyWith({
    Services? services,
  }) =>
      Identity(
        services: services ?? this.services,
      );
}
/// Services model class.
abstract class ServicesModel {
  /// Initializes Services model class .
  const ServicesModel({
    this.idv,
    this.onfido,
  });

  /// IDV configuration
  final Idv? idv;

  /// Onfido configuration
  final Onfido? onfido;
}

/// Services class.
class Services extends ServicesModel {
  /// Initializes Services class.
  const Services({
    super.idv,
    super.onfido,
  });

  /// Creates an instance from JSON.
  factory Services.fromJson(Map<String, dynamic> json) => Services(
        idv: json['idv'] == null ? null : Idv.fromJson(json['idv']),
        onfido: json['onfido'] == null ? null : Onfido.fromJson(json['onfido']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (idv != null) {
      resultMap['idv'] = idv!.toJson();
    }
    if (onfido != null) {
      resultMap['onfido'] = onfido!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Services copyWith({
    Idv? idv,
    Onfido? onfido,
  }) =>
      Services(
        idv: idv ?? this.idv,
        onfido: onfido ?? this.onfido,
      );
}
/// Idv model class.
abstract class IdvModel {
  /// Initializes Idv model class .
  const IdvModel({
    this.documentsSupported,
    this.hasVisualSample,
    this.isCountrySupported,
  });

  /// Documents supported by the IDV service in this country
  final Map<String, DocumentsSupportedProperty>? documentsSupported;

  /// Flag which indicates whether this country has IDV visual samples
  final bool? hasVisualSample;

  /// Flag which indicates whether IDV is available in this country
  final bool? isCountrySupported;
}

/// Idv class.
class Idv extends IdvModel {
  /// Initializes Idv class.
  const Idv({
    super.documentsSupported,
    super.hasVisualSample,
    super.isCountrySupported,
  });

  /// Creates an instance from JSON.
  factory Idv.fromJson(Map<String, dynamic> json) => Idv(
        documentsSupported: json['documents_supported'] == null
            ? null
            : Map<String, DocumentsSupportedProperty>.fromEntries(json[
                    'documents_supported']
                .entries
                .map<MapEntry<String, DocumentsSupportedProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, DocumentsSupportedProperty>(entry.key,
                            DocumentsSupportedProperty.fromJson(entry.value)))),
        hasVisualSample: getBool(json['has_visual_sample']),
        isCountrySupported: getBool(json['is_country_supported']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['documents_supported'] = documentsSupported?.map(
      (String key, DocumentsSupportedProperty value) =>
          MapEntry<String, dynamic>(key, value.toJson()),
    );
    resultMap['has_visual_sample'] = getInt(value: hasVisualSample);
    resultMap['is_country_supported'] = getInt(value: isCountrySupported);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Idv copyWith({
    Map<String, DocumentsSupportedProperty>? documentsSupported,
    bool? hasVisualSample,
    bool? isCountrySupported,
  }) =>
      Idv(
        documentsSupported: documentsSupported ?? this.documentsSupported,
        hasVisualSample: hasVisualSample ?? this.hasVisualSample,
        isCountrySupported: isCountrySupported ?? this.isCountrySupported,
      );
}
/// Documents supported property model class.
abstract class DocumentsSupportedPropertyModel {
  /// Initializes Documents supported property model class .
  const DocumentsSupportedPropertyModel({
    this.additional,
    this.displayName,
    this.format,
  });

  /// [Optional] Additional input required from the user
  final Additional? additional;

  /// The localized display name
  final String? displayName;

  /// [Optional] Regex pattern to validate documents
  final String? format;
}

/// Documents supported property class.
class DocumentsSupportedProperty extends DocumentsSupportedPropertyModel {
  /// Initializes Documents supported property class.
  const DocumentsSupportedProperty({
    super.additional,
    super.displayName,
    super.format,
  });

  /// Creates an instance from JSON.
  factory DocumentsSupportedProperty.fromJson(Map<String, dynamic> json) =>
      DocumentsSupportedProperty(
        additional: json['additional'] == null
            ? null
            : Additional.fromJson(json['additional']),
        displayName: json['display_name'],
        format: json['format'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (additional != null) {
      resultMap['additional'] = additional!.toJson();
    }
    resultMap['display_name'] = displayName;
    resultMap['format'] = format;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DocumentsSupportedProperty copyWith({
    Additional? additional,
    String? displayName,
    String? format,
  }) =>
      DocumentsSupportedProperty(
        additional: additional ?? this.additional,
        displayName: displayName ?? this.displayName,
        format: format ?? this.format,
      );
}
/// Additional model class.
abstract class AdditionalModel {
  /// Initializes Additional model class .
  const AdditionalModel({
    this.displayName,
    this.format,
  });

  /// The localized display name
  final String? displayName;

  /// [Optional] Regex pattern to validate documents
  final String? format;
}

/// Additional class.
class Additional extends AdditionalModel {
  /// Initializes Additional class.
  const Additional({
    super.displayName,
    super.format,
  });

  /// Creates an instance from JSON.
  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
        displayName: json['display_name'],
        format: json['format'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['format'] = format;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Additional copyWith({
    String? displayName,
    String? format,
  }) =>
      Additional(
        displayName: displayName ?? this.displayName,
        format: format ?? this.format,
      );
}
/// Onfido model class.
abstract class OnfidoModel {
  /// Initializes Onfido model class .
  const OnfidoModel({
    this.documentsSupported,
    this.isCountrySupported,
  });

  /// Documents supported by the IDV service in this country
  final Map<String, DocumentsSupportedDocumentsSupportedProperty>?
      documentsSupported;

  /// Flag which indicates whether Onfido is available in this country
  final bool? isCountrySupported;
}

/// Onfido class.
class Onfido extends OnfidoModel {
  /// Initializes Onfido class.
  const Onfido({
    super.documentsSupported,
    super.isCountrySupported,
  });

  /// Creates an instance from JSON.
  factory Onfido.fromJson(Map<String, dynamic> json) => Onfido(
        documentsSupported: json['documents_supported'] == null
            ? null
            : Map<String, DocumentsSupportedDocumentsSupportedProperty>.fromEntries(
                json['documents_supported']
                    .entries
                    .map<MapEntry<String, DocumentsSupportedDocumentsSupportedProperty>>(
                        (MapEntry<String, dynamic> entry) => MapEntry<String,
                                DocumentsSupportedDocumentsSupportedProperty>(
                            entry.key,
                            DocumentsSupportedDocumentsSupportedProperty
                                .fromJson(entry.value)))),
        isCountrySupported: getBool(json['is_country_supported']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['documents_supported'] = documentsSupported?.map(
      (String key, DocumentsSupportedDocumentsSupportedProperty value) =>
          MapEntry<String, dynamic>(key, value.toJson()),
    );
    resultMap['is_country_supported'] = getInt(value: isCountrySupported);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Onfido copyWith({
    Map<String, DocumentsSupportedDocumentsSupportedProperty>?
        documentsSupported,
    bool? isCountrySupported,
  }) =>
      Onfido(
        documentsSupported: documentsSupported ?? this.documentsSupported,
        isCountrySupported: isCountrySupported ?? this.isCountrySupported,
      );
}
/// Documents supported documents supported property model class.
abstract class DocumentsSupportedDocumentsSupportedPropertyModel {
  /// Initializes Documents supported documents supported property model class .
  const DocumentsSupportedDocumentsSupportedPropertyModel({
    this.displayName,
    this.format,
  });

  /// The localized display name
  final String? displayName;

  /// [Optional] Regex pattern to validate documents
  final String? format;
}

/// Documents supported documents supported property class.
class DocumentsSupportedDocumentsSupportedProperty
    extends DocumentsSupportedDocumentsSupportedPropertyModel {
  /// Initializes Documents supported documents supported property class.
  const DocumentsSupportedDocumentsSupportedProperty({
    super.displayName,
    super.format,
  });

  /// Creates an instance from JSON.
  factory DocumentsSupportedDocumentsSupportedProperty.fromJson(
          Map<String, dynamic> json) =>
      DocumentsSupportedDocumentsSupportedProperty(
        displayName: json['display_name'],
        format: json['format'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['format'] = format;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DocumentsSupportedDocumentsSupportedProperty copyWith({
    String? displayName,
    String? format,
  }) =>
      DocumentsSupportedDocumentsSupportedProperty(
        displayName: displayName ?? this.displayName,
        format: format ?? this.format,
      );
}
/// Jurisdiction risk assessment model class.
abstract class JurisdictionRiskAssessmentModel {
  /// Initializes Jurisdiction risk assessment model class .
  const JurisdictionRiskAssessmentModel({
    this.disclaimer,
    this.riskLevel,
    this.turnover,
  });

  /// Disclaimer configuration
  final Disclaimer? disclaimer;

  /// Risk level configuration
  final RiskLevel? riskLevel;

  /// Turnover configuration
  final Turnover? turnover;
}

/// Jurisdiction risk assessment class.
class JurisdictionRiskAssessment extends JurisdictionRiskAssessmentModel {
  /// Initializes Jurisdiction risk assessment class.
  const JurisdictionRiskAssessment({
    super.disclaimer,
    super.riskLevel,
    super.turnover,
  });

  /// Creates an instance from JSON.
  factory JurisdictionRiskAssessment.fromJson(Map<String, dynamic> json) =>
      JurisdictionRiskAssessment(
        disclaimer: json['disclaimer'] == null
            ? null
            : Disclaimer.fromJson(json['disclaimer']),
        riskLevel: json['risk_level'] == null
            ? null
            : RiskLevel.fromJson(json['risk_level']),
        turnover: json['turnover'] == null
            ? null
            : Turnover.fromJson(json['turnover']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (disclaimer != null) {
      resultMap['disclaimer'] = disclaimer!.toJson();
    }
    if (riskLevel != null) {
      resultMap['risk_level'] = riskLevel!.toJson();
    }
    if (turnover != null) {
      resultMap['turnover'] = turnover!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  JurisdictionRiskAssessment copyWith({
    Disclaimer? disclaimer,
    RiskLevel? riskLevel,
    Turnover? turnover,
  }) =>
      JurisdictionRiskAssessment(
        disclaimer: disclaimer ?? this.disclaimer,
        riskLevel: riskLevel ?? this.riskLevel,
        turnover: turnover ?? this.turnover,
      );
}
/// Disclaimer model class.
abstract class DisclaimerModel {
  /// Initializes Disclaimer model class .
  const DisclaimerModel({
    this.accept,
    this.message,
  });

  /// Disclaimer flag
  final bool? accept;

  /// Disclaimer message
  final String? message;
}

/// Disclaimer class.
class Disclaimer extends DisclaimerModel {
  /// Initializes Disclaimer class.
  const Disclaimer({
    super.accept,
    super.message,
  });

  /// Creates an instance from JSON.
  factory Disclaimer.fromJson(Map<String, dynamic> json) => Disclaimer(
        accept: getBool(json['accept']),
        message: json['message'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['accept'] = accept;
    resultMap['message'] = message;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Disclaimer copyWith({
    bool? accept,
    String? message,
  }) =>
      Disclaimer(
        accept: accept ?? this.accept,
        message: message ?? this.message,
      );
}
/// Risk level model class.
abstract class RiskLevelModel {
  /// Initializes Risk level model class .
  const RiskLevelModel({
    this.riskLevelDefault,
    this.landingCompany,
  });

  /// Default risk level flag
  final String? riskLevelDefault;

  /// Flags for specific landing companies
  final Map<String, String>? landingCompany;
}

/// Risk level class.
class RiskLevel extends RiskLevelModel {
  /// Initializes Risk level class.
  const RiskLevel({
    super.riskLevelDefault,
    super.landingCompany,
  });

  /// Creates an instance from JSON.
  factory RiskLevel.fromJson(Map<String, dynamic> json) => RiskLevel(
        riskLevelDefault: json['default'],
        landingCompany: json['landing_company'] == null
            ? null
            : Map<String, String>.fromEntries(json['landing_company']
                .entries
                .map<MapEntry<String, String>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, String>(entry.key, entry.value))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['default'] = riskLevelDefault;
    resultMap['landing_company'] = landingCompany?.map(
      (String key, String value) => MapEntry<String, dynamic>(key, value),
    );

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RiskLevel copyWith({
    String? riskLevelDefault,
    Map<String, String>? landingCompany,
  }) =>
      RiskLevel(
        riskLevelDefault: riskLevelDefault ?? this.riskLevelDefault,
        landingCompany: landingCompany ?? this.landingCompany,
      );
}
/// Turnover model class.
abstract class TurnoverModel {
  /// Initializes Turnover model class .
  const TurnoverModel({
    this.maxLimit,
  });

  /// Max limit
  final bool? maxLimit;
}

/// Turnover class.
class Turnover extends TurnoverModel {
  /// Initializes Turnover class.
  const Turnover({
    super.maxLimit,
  });

  /// Creates an instance from JSON.
  factory Turnover.fromJson(Map<String, dynamic> json) => Turnover(
        maxLimit: getBool(json['max_limit']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max_limit'] = maxLimit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Turnover copyWith({
    bool? maxLimit,
  }) =>
      Turnover(
        maxLimit: maxLimit ?? this.maxLimit,
      );
}
