import 'package:meta/meta.dart';

import '../../api/exceptions/exceptions.dart';
import '../../api/models/base_exception_model.dart';
import '../../basic_api/generated/oauth_apps_receive.dart';
import '../../basic_api/generated/oauth_apps_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';

/// Oauth apps response model class
abstract class OauthAppsResponseModel {
  /// Initializes
  OauthAppsResponseModel({
    @required this.oauthApps,
  });

  /// List of OAuth applications that used for the authorized account.
  final List<OauthAppsItem> oauthApps;
}

/// Oauth apps response class
class OauthAppsResponse extends OauthAppsResponseModel {
  /// Initializes
  OauthAppsResponse({
    @required List<OauthAppsItem> oauthApps,
  }) : super(
          oauthApps: oauthApps,
        );

  /// Creates an instance from JSON
  factory OauthAppsResponse.fromJson(
    dynamic oauthAppsJson,
  ) =>
      OauthAppsResponse(
        oauthApps: oauthAppsJson == null
            ? null
            : List<OauthAppsItem>.from(oauthAppsJson
                .map((dynamic item) => OauthAppsItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (oauthApps != null) {
      resultMap['oauth_apps'] = oauthApps
          .map<dynamic>((OauthAppsItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets oauth application that used for the authorized account.
  ///
  /// Throws an [AppException] if API response contains an error
  static Future<OauthAppsResponse> fetchOauthApps([
    OauthAppsSend request,
  ]) async {
    final OauthAppsReceive response = await _api.call(
      request: request ?? const OauthAppsSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return OauthAppsResponse.fromJson(response.oauthApps);
  }

  /// Creates a copy of instance with given parameters
  OauthAppsResponse copyWith({
    List<OauthAppsItem> oauthApps,
  }) =>
      OauthAppsResponse(
        oauthApps: oauthApps ?? this.oauthApps,
      );
}
/// Oauth apps item model class
abstract class OauthAppsItemModel {
  /// Initializes
  OauthAppsItemModel({
    @required this.appId,
    @required this.appMarkupPercentage,
    this.lastUsed,
    @required this.name,
    @required this.scopes,
  });

  /// Application ID.
  final int appId;

  /// Markup added to contract prices (as a percentage of contract payout)
  final double appMarkupPercentage;

  /// The last date which the application has been used.
  final String lastUsed;

  /// Application name
  final String name;

  /// The list of permission scopes grant for each app.
  final List<String> scopes;
}

/// Oauth apps item class
class OauthAppsItem extends OauthAppsItemModel {
  /// Initializes
  OauthAppsItem({
    @required int appId,
    @required double appMarkupPercentage,
    String lastUsed,
    @required String name,
    @required List<String> scopes,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          lastUsed: lastUsed,
          name: name,
          scopes: scopes,
        );

  /// Creates an instance from JSON
  factory OauthAppsItem.fromJson(Map<String, dynamic> json) => OauthAppsItem(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage']),
        lastUsed: json['last_used'],
        name: json['name'],
        scopes: json['scopes'] == null
            ? null
            : List<String>.from(json['scopes'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['app_markup_percentage'] = appMarkupPercentage;
    resultMap['last_used'] = lastUsed;
    resultMap['name'] = name;
    if (scopes != null) {
      resultMap['scopes'] = scopes.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  OauthAppsItem copyWith({
    int appId,
    double appMarkupPercentage,
    String lastUsed,
    String name,
    List<String> scopes,
  }) =>
      OauthAppsItem(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        scopes: scopes ?? this.scopes,
      );
}
