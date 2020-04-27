import 'package:flutter_deriv_api/utils/helpers.dart';

import 'account_onfido_model.dart';
import 'base_model.dart';

/// This shows the information about the authentication services implemented
class AuthenticationServicesModel extends BaseModel {
  /// Constructor
  AuthenticationServicesModel({
    this.onfido,
  });

  /// Instance from JSON
  factory AuthenticationServicesModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AuthenticationServicesModel(
        onfido: getFromMap(
          json['onfido'],
          (dynamic map) => AccountOnfidoModel.fromJson(map),
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
