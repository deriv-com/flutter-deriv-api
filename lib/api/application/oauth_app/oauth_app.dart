import 'package:flutter_deriv_api/api/application/models/oauth_app_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Oauth application that used for the authorized account
class OauthApp extends OauthAppModel {
  /// Initializes
  OauthApp({
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

  /// Generate an instance from JSON
  factory OauthApp.fromJson(Map<String, dynamic> json) => OauthApp(
        appId: json['app_id'],
        appMarkupPercentage: json['app_markup_percentage']?.toDouble(),
        lastUsed: DateTime.parse(json['last_used']),
        name: json['name'],
        scopes: getListFromMap(
          json['scopes'],
          itemToTypeCallback: (dynamic item) =>
              getEnumFromString(values: TokenScope.values, name: item),
        ),
      );

  /// Generate a copy of instance with given parameters
  OauthApp copyWith({
    int appId,
    double appMarkupPercentage,
    DateTime lastUsed,
    String name,
    List<TokenScope> scopes,
  }) =>
      OauthApp(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        scopes: scopes ?? this.scopes,
      );
}
