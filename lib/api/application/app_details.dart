import 'package:flutter_deriv_api/api/application/app_delete.dart';
import 'package:flutter_deriv_api/api/application/app_markup_details.dart';
import 'package:flutter_deriv_api/api/application/app_register.dart';
import 'package:flutter_deriv_api/api/application/app_update.dart';
import 'package:flutter_deriv_api/api/application/exceptions/application_exception.dart';
import 'package:flutter_deriv_api/api/application/models/app_details_model.dart';
import 'package:flutter_deriv_api/api/application/revoke_oauth_app.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App detail class
class AppDetails extends AppDetailsModel {
  /// Initializes
  AppDetails({
    int appId,
    double appMarkupPercentage,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    String name,
    String redirectUri,
    String verificationUri,
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
  factory AppDetails.fromJson(Map<String, dynamic> json) => AppDetails(
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  AppDetails copyWith({
    int appId,
    double appMarkupPercentage,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    String name,
    String redirectUri,
    String verificationUri,
  }) =>
      AppDetails(
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

  /// Fetch the information of the OAuth application specified by [appId]
  /// For parameters information refer to [AppGetRequest]
  static Future<AppDetails> fetchApplicationDetails(
    AppGetRequest request,
  ) async {
    final AppGetResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ApplicationException(message: response.error['message']);
    }

    return AppDetails.fromJson(response.appGet);
  }

  /// List all of the account's OAuth applications
  /// For parameters information refer to [AppListRequest]
  static Future<List<AppDetails>> fetchApplicationList(
    AppListRequest request,
  ) async {
    final AppListResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ApplicationException(message: response.error['message']);
    }

    return getListFromMap(
      response.appList,
      itemToTypeCallback: (dynamic item) => AppDetails.fromJson(item),
    );
  }

  /// Retrieve details of app markup according to criteria specified
  Future<AppMarkupDetails> fetchApplicationMarkupDetails({
    String clientLoginId,
    DateTime dateFrom,
    DateTime dateTo,
    bool description,
    int limit,
    int offset,
    String sort,
    List<String> sortFields,
  }) =>
      AppMarkupDetails.fetchApplicationMarkupDetails(
        AppMarkupDetailsRequest(
          appId: appId,
          clientLoginid: clientLoginId,
          dateFrom: dateFrom.toString(),
          dateTo: dateTo.toString(),
          description: getInt(description),
          limit: limit,
          offset: offset,
          sort: sort,
          sortFields: sortFields,
        ),
      );

  /// The request for deleting an application
  Future<AppDelete> deleteApplication() => AppDelete.deleteApplication(
        AppDeleteRequest(appDelete: appId),
      );

  /// Register a new Oauth application
  Future<AppRegister> registerApplication({List<TokenScope> scopes}) =>
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
              .map((TokenScope scope) => getStringFromEnum(value: scope))
              .toList(),
          verificationUri: verificationUri,
        ),
      );

  /// Update application
  Future<AppUpdate> updateApplication({List<TokenScope> scopes}) =>
      AppUpdate.updateApplication(
        AppUpdateRequest(
          appMarkupPercentage: appMarkupPercentage,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          name: name,
          redirectUri: redirectUri,
          scopes: scopes
              .map((TokenScope scope) => getStringFromEnum(value: scope))
              .toList(),
          verificationUri: verificationUri,
        ),
      );

  /// Revoke access of particular app
  Future<RevokeOauthApp> revokeOauthApplication() =>
      RevokeOauthApp.revokeOauthApplication(
        RevokeOauthAppRequest(revokeOauthApp: appId),
      );
}
