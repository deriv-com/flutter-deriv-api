import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';

/// Token model class
class TokenModel extends BaseModel {
  /// Class constructor
  TokenModel({
    this.displayName,
    this.lastUsed,
    this.scopes,
    this.token,
    this.validForIp,
  });

  /// Creates instance from json
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        displayName: json['display_name'],
        lastUsed: DateTime.parse(
          json['last_used'],
        ), // TODO(hamed): change format to `yyyy-MM-dd` after adding intl package
        scopes: json['scopes'] == null
            ? null
            : json['scopes']
                .map<TokenScope>(
                  (dynamic item) => EnumHelper.getEnum(
                    values: TokenScope.values,
                    name: item,
                  ),
                )
                .toList(),
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
