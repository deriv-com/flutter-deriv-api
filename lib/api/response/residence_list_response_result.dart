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
    this.disabled,
    this.identity,
    this.phoneIdd,
    this.selected,
    this.text,
    this.tinFormat,
    this.value,
  });

  /// Disabled.
  final String? disabled;

  /// Information about identity options available
  final Identity? identity;

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
}

/// Residence list item class.
class ResidenceListItem extends ResidenceListItemModel {
  /// Initializes Residence list item class.
  const ResidenceListItem({
    super.disabled,
    super.identity,
    super.phoneIdd,
    super.selected,
    super.text,
    super.tinFormat,
    super.value,
  });

  /// Creates an instance from JSON.
  factory ResidenceListItem.fromJson(Map<String, dynamic> json) =>
      ResidenceListItem(
        disabled: json['disabled'],
        identity: json['identity'] == null
            ? null
            : Identity.fromJson(json['identity']),
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
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['disabled'] = disabled;
    if (identity != null) {
      resultMap['identity'] = identity!.toJson();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ResidenceListItem copyWith({
    String? disabled,
    Identity? identity,
    String? phoneIdd,
    String? selected,
    String? text,
    List<String>? tinFormat,
    String? value,
  }) =>
      ResidenceListItem(
        disabled: disabled ?? this.disabled,
        identity: identity ?? this.identity,
        phoneIdd: phoneIdd ?? this.phoneIdd,
        selected: selected ?? this.selected,
        text: text ?? this.text,
        tinFormat: tinFormat ?? this.tinFormat,
        value: value ?? this.value,
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
