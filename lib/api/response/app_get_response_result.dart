// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/app_delete_response_result.dart';
import 'package:flutter_deriv_api/api/response/app_markup_details_response_result.dart';
import 'package:flutter_deriv_api/api/response/app_register_response_result.dart';
import 'package:flutter_deriv_api/api/response/app_update_response_result.dart';
import 'package:flutter_deriv_api/api/response/revoke_oauth_app_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_delete_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_get_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_get_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_list_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_markup_details_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_register_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_update_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/revoke_oauth_app_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// App get response model class.
abstract class AppGetResponseModel {
  /// Initializes App get response model class .
  const AppGetResponseModel({
    this.appGet,
  });

  /// The information of the requested application.
  final AppGet? appGet;
}

/// App get response class.
class AppGetResponse extends AppGetResponseModel {
  /// Initializes App get response class.
  const AppGetResponse({
    super.appGet,
  });

  /// Creates an instance from JSON.
  factory AppGetResponse.fromJson(
    dynamic appGetJson,
  ) =>
      AppGetResponse(
        appGet: appGetJson == null ? null : AppGet.fromJson(appGetJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (appGet != null) {
      resultMap['app_get'] = appGet!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the information of the OAuth application specified by [appId] in [request]
  ///
  /// For parameters information refer to [AppGetRequest].
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<AppGetResponse> fetchApplicationDetails(
    AppGetRequest request,
  ) async {
    final AppGetReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return AppGetResponse.fromJson(response.appGet);
  }

  /// Gets all of the account's OAuth applications.
  ///
  /// For parameters information refer to [AppListRequest].
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<List<AppGetResponse?>?> fetchApplicationList(
    AppListRequest request,
  ) async {
    final AppListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.appList,
      itemToTypeCallback: (dynamic item) => AppGetResponse.fromJson(item),
    );
  }

  /// Retrieves details of app markup according to criteria specified.
  Future<AppMarkupDetailsResponse> fetchApplicationMarkupDetails({
    required DateTime dateFrom,
    required DateTime dateTo,
    String? clientLoginId,
    bool? description,
    int? limit,
    int? offset,
    String? sort,
    List<String>? sortFields,
  }) =>
      AppMarkupDetailsResponse.fetchApplicationMarkupDetails(
        AppMarkupDetailsRequest(
          appId: appGet?.appId,
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
  Future<AppDeleteResponse> deleteApplication() =>
      AppDeleteResponse.deleteApplication(
        AppDeleteRequest(appDelete: appGet?.appId),
      );

  /// Register a new Oauth application.
  Future<AppRegisterResponse> registerApplication(
          {required List<TokenScope> scopes}) =>
      AppRegisterResponse.registerApplication(
        AppRegisterRequest(
          appMarkupPercentage: appGet?.appMarkupPercentage,
          appstore: appGet?.appstore,
          github: appGet?.github,
          googleplay: appGet?.googleplay,
          homepage: appGet?.homepage,
          name: appGet?.name,
          redirectUri: appGet?.redirectUri,
          scopes: scopes
              .map((TokenScope scope) => getStringFromEnum(scope))
              .toList(),
          verificationUri: appGet?.verificationUri,
        ),
      );

  /// Update application.
  Future<AppUpdateResponse> updateApplication(
          {required List<TokenScope> scopes}) =>
      AppUpdateResponse.updateApplication(
        AppUpdateRequest(
          appMarkupPercentage: appGet?.appMarkupPercentage,
          appUpdate: appGet?.appId,
          appstore: appGet?.appstore,
          github: appGet?.github,
          googleplay: appGet?.googleplay,
          homepage: appGet?.homepage,
          name: appGet?.name,
          redirectUri: appGet?.redirectUri,
          scopes: scopes
              .map((TokenScope scope) => getStringFromEnum(scope))
              .toList(),
          verificationUri: appGet?.verificationUri,
        ),
      );

  /// Revoke access of particular app.
  Future<RevokeOauthAppResponse> revokeOauthApplication() =>
      RevokeOauthAppResponse.revokeOauthApplication(
        RevokeOauthAppRequest(revokeOauthApp: appGet?.appId),
      );

  /// Creates a copy of instance with given parameters.
  AppGetResponse copyWith({
    AppGet? appGet,
  }) =>
      AppGetResponse(
        appGet: appGet ?? this.appGet,
      );
}
/// App get model class.
abstract class AppGetModel {
  /// Initializes App get model class .
  const AppGetModel({
    required this.verificationUri,
    required this.redirectUri,
    required this.name,
    required this.homepage,
    required this.googleplay,
    required this.github,
    required this.appstore,
    required this.appMarkupPercentage,
    required this.appId,
    this.active,
    this.scopes,
  });

  /// Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final String verificationUri;

  /// The URL to redirect to after a successful login.
  final String redirectUri;

  /// Application name.
  final String name;

  /// Application's homepage URL.
  final String homepage;

  /// Application's Google Play URL.
  final String googleplay;

  /// Application's GitHub page (for open-source projects).
  final String github;

  /// Application's App Store URL.
  final String appstore;

  /// Markup added to contract prices (as a percentage of contract payout).
  final double appMarkupPercentage;

  /// Application ID.
  final int appId;

  /// Active.
  final int? active;

  /// Scope Details.
  final List<String>? scopes;
}

/// App get class.
class AppGet extends AppGetModel {
  /// Initializes App get class.
  const AppGet({
    required super.appId,
    required super.appMarkupPercentage,
    required super.appstore,
    required super.github,
    required super.googleplay,
    required super.homepage,
    required super.name,
    required super.redirectUri,
    required super.verificationUri,
    super.active,
    super.scopes,
  });

  /// Creates an instance from JSON.
  factory AppGet.fromJson(Map<String, dynamic> json) => AppGet(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage'])!,
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        name: json['name'],
        redirectUri: json['redirect_uri'],
        verificationUri: json['verification_uri'],
        active: json['active'],
        scopes: json['scopes'] == null
            ? null
            : List<String>.from(
                json['scopes']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['app_markup_percentage'] = appMarkupPercentage;
    resultMap['appstore'] = appstore;
    resultMap['github'] = github;
    resultMap['googleplay'] = googleplay;
    resultMap['homepage'] = homepage;
    resultMap['name'] = name;
    resultMap['redirect_uri'] = redirectUri;
    resultMap['verification_uri'] = verificationUri;
    resultMap['active'] = active;
    if (scopes != null) {
      resultMap['scopes'] = scopes!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AppGet copyWith({
    int? appId,
    double? appMarkupPercentage,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    String? name,
    String? redirectUri,
    String? verificationUri,
    int? active,
    List<String>? scopes,
  }) =>
      AppGet(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        name: name ?? this.name,
        redirectUri: redirectUri ?? this.redirectUri,
        verificationUri: verificationUri ?? this.verificationUri,
        active: active ?? this.active,
        scopes: scopes ?? this.scopes,
      );
}
