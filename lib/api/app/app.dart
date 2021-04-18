import 'package:flutter_deriv_api/api/app/app_delete.dart';
import 'package:flutter_deriv_api/api/app/app_markup_details.dart';
import 'package:flutter_deriv_api/api/app/app_register.dart';
import 'package:flutter_deriv_api/api/app/app_update.dart';
import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/app/models/app_model.dart';
import 'package:flutter_deriv_api/api/app/revoke_oauth_app.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// App class
class App extends AppModel {
  /// Initializes
  App({
    int? appId,
    double? appMarkupPercentage,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    String? name,
    String? redirectUri,
    String? verificationUri,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          name: name,
          redirectUri: redirectUri,
          verificationUri: verificationUri,
        );

  /// Creates an instance from JSON
  factory App.fromJson(Map<String, dynamic> json) => App(
        appId: json['app_id'],
        appMarkupPercentage: json['app_markup_percentage'],
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        name: json['name'],
        redirectUri: json['redirect_uri'],
        verificationUri: json['verification_uri'],
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  App copyWith({
    int? appId,
    double? appMarkupPercentage,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    String? name,
    String? redirectUri,
    String? verificationUri,
  }) =>
      App(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        name: name ?? this.name,
        redirectUri: redirectUri ?? this.redirectUri,
        verificationUri: verificationUri ?? this.verificationUri,
      );

  /// Gets the information of the OAuth application specified by [appId] in [request]
  ///
  /// For parameters information refer to [AppGetRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<App> fetchApplicationDetails(
    AppGetRequest request,
  ) async {
    final AppGetResponse response =
        await _api!.call<AppGetResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return App.fromJson(response.appGet!);
  }

  /// Gets all of the account's OAuth applications.
  ///
  /// For parameters information refer to [AppListRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<List<App?>?> fetchApplicationList(
    AppListRequest request,
  ) async {
    final AppListResponse response =
        await _api!.call<AppListResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.appList,
      itemToTypeCallback: (dynamic item) => App.fromJson(item),
    );
  }

  /// Retrieves details of app markup according to criteria specified.
  Future<AppMarkupDetails> fetchApplicationMarkupDetails({
    required String clientLoginId,
    required bool description,
    required int limit,
    required int offset,
    required String sort,
    required List<String> sortFields,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) =>
      AppMarkupDetails.fetchApplicationMarkupDetails(
        AppMarkupDetailsRequest(
          appId: appId,
          clientLoginid: clientLoginId,
          dateFrom: dateFrom.toString(),
          dateTo: dateTo.toString(),
          description: description,
          limit: limit,
          offset: offset,
          sort: sort,
          sortFields: sortFields,
        ),
      );

  /// The request for deleting an application.
  Future<AppDelete> deleteApplication() => AppDelete.deleteApplication(
        AppDeleteRequest(appDelete: appId!),
      );

  /// Register a new Oauth application.
  Future<AppRegister> registerApplication({required List<TokenScope> scopes}) =>
      AppRegister.registerApplication(
        AppRegisterRequest(
          appMarkupPercentage: appMarkupPercentage,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          name: name,
          redirectUri: redirectUri,
          scopes: scopes
              .map((TokenScope scope) => getStringFromEnum(scope))
              .toList(),
          verificationUri: verificationUri,
        ),
      );

  /// Update application.
  Future<AppUpdate> updateApplication({required List<TokenScope> scopes}) =>
      AppUpdate.updateApplication(
        AppUpdateRequest(
          appMarkupPercentage: appMarkupPercentage,
          appUpdate: appId,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          name: name,
          redirectUri: redirectUri!,
          scopes: scopes
              .map((TokenScope scope) => getStringFromEnum(scope))
              .toList(),
          verificationUri: verificationUri,
        ),
      );

  /// Revoke access of particular app.
  Future<RevokeOauthApp> revokeOauthApplication() =>
      RevokeOauthApp.revokeOauthApplication(
        RevokeOauthAppRequest(revokeOauthApp: appId!),
      );
}
