import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Contract error message class
class ContractErrorMessageModel extends BaseModel {
  /// Class constructor
  ContractErrorMessageModel({
    this.code,
    this.messageToClient,
    this.token,
  });

  /// Creates instance from json
  factory ContractErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ContractErrorMessageModel(
        code: json['code'],
        messageToClient: json['message_to_client'],
        token: json['token'],
      );

  /// An error code
  final String code;

  /// An error message localized according to the websocket
  final String messageToClient;

  /// The token designating the account
  final String token;

  /// Creates copy of instance with given parameters
  ContractErrorMessageModel copyWith({
    double code,
    int messageToClient,
    String token,
  }) =>
      ContractErrorMessageModel(
        code: code ?? this.code,
        messageToClient: messageToClient ?? this.messageToClient,
        token: token ?? this.token,
      );
}
