import 'package:flutter_deriv_api/api/account/models/account_onfido_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// This shows the information about the authentication services implemented
class AuthenticationServicesModel extends APIBaseModel {
  /// Initializes
  AuthenticationServicesModel({
    this.onfido,
  });

  /// Generate an instance from JSON
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

  /// Generate a copy of instance with given parameters
  AuthenticationServicesModel copyWith({
    AccountOnfidoModel onfido,
  }) =>
      AuthenticationServicesModel(
        onfido: onfido ?? this.onfido,
      );
}
