import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// This shows the information related to Onfido supported services
class AccountOnfidoModel extends APIBaseModel {
  /// Initializes
  AccountOnfidoModel({
    this.documents,
    this.isCountrySupported,
  });

  /// Generate an instance from JSON
  factory AccountOnfidoModel.fromJson(Map<String, dynamic> json) =>
      AccountOnfidoModel(
        documents: getListFromMap(json['documents']),
        isCountrySupported: getBool(json['is_country_supported']),
      );

  /// This shows the list of documents types supported by Onfido
  final List<String?>? documents;

  /// This shows the information if the country is supported by Onfido
  final bool? isCountrySupported;

  /// Generate a copy of instance with given parameters
  AccountOnfidoModel copyWith({
    List<String>? documents,
    bool? isCountrySupported,
  }) =>
      AccountOnfidoModel(
        documents: documents ?? this.documents,
        isCountrySupported: isCountrySupported ?? this.isCountrySupported,
      );
}
