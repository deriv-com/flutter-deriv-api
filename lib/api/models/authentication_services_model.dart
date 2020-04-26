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
        onfido: json['onfido'] == null
            ? null
            : AccountOnfidoModel.fromJson(json['onfido']),
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
