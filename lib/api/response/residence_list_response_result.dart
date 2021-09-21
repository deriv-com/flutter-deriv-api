// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/residence_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/residence_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Residence list response model class.
abstract class ResidenceListResponseModel {
  /// Initializes Residence list response model class .
  ResidenceListResponseModel({
    this.residenceList,
  });

  /// List of countries for account opening
  final List<ResidenceListItem>? residenceList;
}

/// Residence list response class.
class ResidenceListResponse extends ResidenceListResponseModel {
  /// Initializes Residence list response class.
  ResidenceListResponse({
    List<ResidenceListItem>? residenceList,
  }) : super(
          residenceList: residenceList,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets Residence list for the given [ResidenceListRequest]
  ///
  /// Throws a [ResidenceException] if API response contains an error
  static Future<ResidenceListResponse> fetchResidenceList([
    ResidenceListRequest? request,
  ]) async {
    final ResidenceListReceive response = await _api.call(
      request: request ?? const ResidenceListRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ResidenceException(baseExceptionModel: baseExceptionModel),
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
  ResidenceListItemModel({
    this.identity,
    this.phoneIdd,
    this.text,
    this.tinFormat,
    this.value,
  });

  /// Information about identity options available
  final Identity? identity;

  /// IDD code of country
  final String? phoneIdd;

  /// Country full name
  final String? text;

  /// Country tax identifier format
  final List<String>? tinFormat;

  /// 2-letter country code
  final String? value;
}

/// Residence list item class.
class ResidenceListItem extends ResidenceListItemModel {
  /// Initializes Residence list item class.
  ResidenceListItem({
    Identity? identity,
    String? phoneIdd,
    String? text,
    List<String>? tinFormat,
    String? value,
  }) : super(
          identity: identity,
          phoneIdd: phoneIdd,
          text: text,
          tinFormat: tinFormat,
          value: value,
        );

  /// Creates an instance from JSON.
  factory ResidenceListItem.fromJson(Map<String, dynamic> json) =>
      ResidenceListItem(
        identity: json['identity'] == null
            ? null
            : Identity.fromJson(json['identity']),
        phoneIdd: json['phone_idd'],
        text: json['text'],
        tinFormat: json['tin_format'] == null
            ? null
            : List<String>.from(
                json['tin_format']?.map(
                  (dynamic item) => item,
                ),
              ),
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (identity != null) {
      resultMap['identity'] = identity!.toJson();
    }
    resultMap['phone_idd'] = phoneIdd;
    resultMap['text'] = text;
    if (tinFormat != null) {
      resultMap['tin_format'] = tinFormat!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ResidenceListItem copyWith({
    Identity? identity,
    String? phoneIdd,
    String? text,
    List<String>? tinFormat,
    String? value,
  }) =>
      ResidenceListItem(
        identity: identity ?? this.identity,
        phoneIdd: phoneIdd ?? this.phoneIdd,
        text: text ?? this.text,
        tinFormat: tinFormat ?? this.tinFormat,
        value: value ?? this.value,
      );
}
/// Identity model class.
abstract class IdentityModel {
  /// Initializes Identity model class .
  IdentityModel({
    this.services,
  });

  /// Identity services configuration
  final Services? services;
}

/// Identity class.
class Identity extends IdentityModel {
  /// Initializes Identity class.
  Identity({
    Services? services,
  }) : super(
          services: services,
        );

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
  ServicesModel({
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
  Services({
    Idv? idv,
    Onfido? onfido,
  }) : super(
          idv: idv,
          onfido: onfido,
        );

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
  IdvModel({
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
  Idv({
    Map<String, DocumentsSupportedProperty>? documentsSupported,
    bool? hasVisualSample,
    bool? isCountrySupported,
  }) : super(
          documentsSupported: documentsSupported,
          hasVisualSample: hasVisualSample,
          isCountrySupported: isCountrySupported,
        );

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

    resultMap['documents_supported'] = documentsSupported;
    resultMap['has_visual_sample'] = hasVisualSample;
    resultMap['is_country_supported'] = isCountrySupported;

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
  DocumentsSupportedPropertyModel({
    this.displayName,
    this.format,
  });

  /// The localized display name
  final String? displayName;

  /// [Optional] Regex pattern to validate documents
  final String? format;
}

/// Documents supported property class.
class DocumentsSupportedProperty extends DocumentsSupportedPropertyModel {
  /// Initializes Documents supported property class.
  DocumentsSupportedProperty({
    String? displayName,
    String? format,
  }) : super(
          displayName: displayName,
          format: format,
        );

  /// Creates an instance from JSON.
  factory DocumentsSupportedProperty.fromJson(Map<String, dynamic> json) =>
      DocumentsSupportedProperty(
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
  DocumentsSupportedProperty copyWith({
    String? displayName,
    String? format,
  }) =>
      DocumentsSupportedProperty(
        displayName: displayName ?? this.displayName,
        format: format ?? this.format,
      );
}
/// Onfido model class.
abstract class OnfidoModel {
  /// Initializes Onfido model class .
  OnfidoModel({
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
  Onfido({
    Map<String, DocumentsSupportedDocumentsSupportedProperty>?
        documentsSupported,
    bool? isCountrySupported,
  }) : super(
          documentsSupported: documentsSupported,
          isCountrySupported: isCountrySupported,
        );

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

    resultMap['documents_supported'] = documentsSupported;
    resultMap['is_country_supported'] = isCountrySupported;

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
  DocumentsSupportedDocumentsSupportedPropertyModel({
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
  DocumentsSupportedDocumentsSupportedProperty({
    String? displayName,
    String? format,
  }) : super(
          displayName: displayName,
          format: format,
        );

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
