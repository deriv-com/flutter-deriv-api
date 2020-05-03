import 'package:flutter_deriv_api/utils/helpers.dart';

import 'account_onfido_model.dart';
import 'api_base_model.dart';

/// This shows the information about the authentication services implemented
class AuthenticationServicesModel extends APIBaseModel {
  /// Constructor
  AuthenticationServicesModel({
    this.onfido,
  });

  /// Instance from JSON
  factory AuthenticationServicesModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AuthenticationServicesModel(
        onfido: getItemFromMap(
          json['onfido'],
          itemToTypeCallback: (dynamic map) => AccountOnfidoModel.fromJson(map),
        ),
      );

  // Properties
  /// This shows the information related to Onfido supported services
  final AccountOnfidoModel onfido;

  /// ToJson
  AuthenticationServicesModel copyWith({
    AccountOnfidoModel onfido,
  }) =>
      AuthenticationServicesModel(
        onfido: onfido ?? this.onfido,
      );
}
