// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/oauth_apps_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/oauth_apps_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Oauth apps response model class.
abstract class OauthAppsResponseModel {
  /// Initializes Oauth apps response model class .
  const OauthAppsResponseModel({
    this.oauthApps,
  });

  /// List of 3rd party OAuth applications that used for the authorized account.
  final List<OauthAppsItem>? oauthApps;
}

/// Oauth apps response class.
class OauthAppsResponse extends OauthAppsResponseModel {
  /// Initializes Oauth apps response class.
  const OauthAppsResponse({
    super.oauthApps,
  });

  /// Creates an instance from JSON.
  factory OauthAppsResponse.fromJson(
    dynamic oauthAppsJson,
  ) =>
      OauthAppsResponse(
        oauthApps: oauthAppsJson == null
            ? null
            : List<OauthAppsItem>.from(
                oauthAppsJson?.map(
                  (dynamic item) => OauthAppsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (oauthApps != null) {
      resultMap['oauth_apps'] = oauthApps!
          .map<dynamic>(
            (OauthAppsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets oauth application that used for the authorized account.
  ///
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<OauthAppsResponse> fetchOauthApps([
    OauthAppsRequest? request,
  ]) async {
    final OauthAppsReceive response = await _api.call(
      request: request ?? const OauthAppsRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return OauthAppsResponse.fromJson(response.oauthApps);
  }

  /// Creates a copy of instance with given parameters.
  OauthAppsResponse copyWith({
    List<OauthAppsItem>? oauthApps,
  }) =>
      OauthAppsResponse(
        oauthApps: oauthApps ?? this.oauthApps,
      );
}

/// Oauth apps item model class.
abstract class OauthAppsItemModel {
  /// Initializes Oauth apps item model class .
  const OauthAppsItemModel({
    required this.scopes,
    required this.official,
    required this.name,
    required this.appMarkupPercentage,
    required this.appId,
    this.lastUsed,
  });

  /// The list of permission scopes grant for each app.
  final List<String> scopes;

  /// Boolean value: `true` or `false`, indicating `true` if app is an official app and `false` incase of unofficial app
  final bool official;

  /// Application name
  final String name;

  /// Markup added to contract prices (as a percentage of contract payout)
  final double appMarkupPercentage;

  /// Application ID.
  final int appId;

  /// The last date which the application has been used.
  final String? lastUsed;
}

/// Oauth apps item class.
class OauthAppsItem extends OauthAppsItemModel {
  /// Initializes Oauth apps item class.
  const OauthAppsItem({
    required super.appId,
    required super.appMarkupPercentage,
    required super.name,
    required super.official,
    required super.scopes,
    super.lastUsed,
  });

  /// Creates an instance from JSON.
  factory OauthAppsItem.fromJson(Map<String, dynamic> json) => OauthAppsItem(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage'])!,
        name: json['name'],
        official: getBool(json['official'])!,
        scopes: List<String>.from(
          json['scopes'].map(
            (dynamic item) => item,
          ),
        ),
        lastUsed: json['last_used'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['app_markup_percentage'] = appMarkupPercentage;
    resultMap['name'] = name;
    resultMap['official'] = official;
    resultMap['scopes'] = scopes
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    resultMap['last_used'] = lastUsed;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  OauthAppsItem copyWith({
    int? appId,
    double? appMarkupPercentage,
    String? name,
    bool? official,
    List<String>? scopes,
    String? lastUsed,
  }) =>
      OauthAppsItem(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        name: name ?? this.name,
        official: official ?? this.official,
        scopes: scopes ?? this.scopes,
        lastUsed: lastUsed ?? this.lastUsed,
      );
}
