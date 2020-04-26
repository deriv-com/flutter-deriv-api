import 'account_onfido_model.dart';

/// This shows the information about the authentication services implemented
class AuthenticationServicesModel {
  /// Constructor
  AuthenticationServicesModel({this.onfido});

  /// Instance from JSON
  factory AuthenticationServicesModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationServicesModel(
        onfido: json['onfido'] != null ? AccountOnfidoModel.fromJson(json) : null,
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