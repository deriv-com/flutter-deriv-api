import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Token model class
class TokenModel extends APIBaseModel {
  /// Initializes
  TokenModel({
    this.displayName,
    this.lastUsed,
    this.scopes,
    this.token,
    this.validForIp,
  });

  /// Creates an instance from JSON
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        displayName: json['display_name'],
        lastUsed: DateTime.parse(json['last_used']),
        scopes: getListFromMap(
          json['scopes'],
          itemToTypeCallback: (dynamic item) => getEnumFromString(
            values: TokenScope.values,
            name: item,
          ),
        ),
        token: json['token'],
        validForIp: json['valid_for_ip'],
      );

  /// The token name specified when creating.
  final String displayName;

  /// The last date which the token has been used.
  final DateTime lastUsed;

  /// List of permission scopes of the token.
  final List<TokenScope> scopes;

  /// The token that can be used to `authorize` with.
  final String token;

  /// The IP restriction for the token. No restriction if empty.
  final String validForIp;
}
