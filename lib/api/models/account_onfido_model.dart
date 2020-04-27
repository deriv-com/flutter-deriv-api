import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// This shows the information related to Onfido supported services
class AccountOnfidoModel extends BaseModel {
  /// Constructor
  AccountOnfidoModel({
    this.documents,
    this.isCountrySupported,
  });

  /// Instance from JSON
  factory AccountOnfidoModel.fromJson(Map<String, dynamic> json) =>
      AccountOnfidoModel(
        documents: getListFromMap(
          json['documents'],
          (dynamic item) => item.toString(),
        ),
        isCountrySupported: getBool(json['is_country_supported']),
      );

  /// This shows the list of documents types supported by Onfido
  final List<String> documents;

  /// This shows the information if the country is supported by Onfido
  final bool isCountrySupported;

  /// ToJson
  AccountOnfidoModel copyWith({
    List<String> documents,
    bool isCountrySupported,
  }) =>
      AccountOnfidoModel(
        documents: documents ?? this.documents,
        isCountrySupported: isCountrySupported ?? this.isCountrySupported,
      );
}
