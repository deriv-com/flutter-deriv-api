import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/app/models/oauth_app_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Oauth application that used for the authorized account
class OauthApp extends OauthAppModel {
  /// Initializes
  OauthApp({
    int? appId,
    double? appMarkupPercentage,
    DateTime? lastUsed,
    String? name,
    List<TokenScope?>? scopes,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          lastUsed: lastUsed,
          name: name,
          scopes: scopes,
        );

  /// Generates an instance from JSON
  factory OauthApp.fromJson(Map<String, dynamic> json) => OauthApp(
        appId: json['app_id'],
        appMarkupPercentage: json['app_markup_percentage']?.toDouble(),
        lastUsed: DateTime.tryParse(json['last_used']),
        name: json['name'],
        scopes: getListFromMap(
          json['scopes'],
          itemToTypeCallback: (dynamic item) =>
              getEnumFromString(values: TokenScope.values, name: item)!,
        ),
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  OauthApp copyWith({
    int? appId,
    double? appMarkupPercentage,
    DateTime? lastUsed,
    String? name,
    List<TokenScope>? scopes,
  }) =>
      OauthApp(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        scopes: scopes ?? this.scopes,
      );

  /// Gets oauth application that used for the authorized account.
  ///
  /// Throws an [AppException] if API response contains an error
  static Future<List<OauthApp?>?> fetchOauthApps([
    OauthAppsRequest? request,
  ]) async {
    final OauthAppsResponse response = await _api!.call<OauthAppsResponse>(
      request: request ?? const OauthAppsRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.oauthApps,
      itemToTypeCallback: (dynamic item) => OauthApp.fromJson(item),
    );
  }
}
