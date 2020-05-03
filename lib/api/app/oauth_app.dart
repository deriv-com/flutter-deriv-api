import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/oauth_app_model.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';

/// OAuth application that used for the authorized account
class OAuthApp extends OauthAppModel {
  /// Initializes
  OAuthApp({
    int appId,
    double appMarkupPercentage,
    DateTime lastUsed,
    String name,
    List<TokenScope> scopes,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          lastUsed: lastUsed,
          name: name,
          scopes: scopes,
        );

  /// Instance from JSON
  factory OAuthApp.fromJson(Map<String, dynamic> json) => OAuthApp(
        appId: json['app_id'],
        appMarkupPercentage: json['app_markup_percentage']?.toDouble(),
        lastUsed: json['last_used'] == null
            ? null
            : DateTime.parse(json['last_used']),
        name: json['name'],
        scopes: json['scopes'] == null
            ? null
            : json['scopes']
                .map<TokenScope>((dynamic entry) =>
                    EnumHelper.getEnum(values: TokenScope.values, name: entry))
                .toList(),
      );

  /// Clones a new instance
  OAuthApp copyWith({
    int appId,
    double appMarkupPercentage,
    DateTime lastUsed,
    String name,
    List<TokenScope> scopes,
  }) =>
      OAuthApp(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        scopes: scopes ?? this.scopes,
      );
}
