import 'package:meta/meta.dart';

import '../../basic_api/generated/app_delete_send.dart';
import '../../basic_api/generated/app_get_receive.dart';
import '../../basic_api/generated/app_get_send.dart';
import '../../basic_api/generated/app_list_receive.dart';
import '../../basic_api/generated/app_list_send.dart';
import '../../basic_api/generated/app_markup_details_send.dart';
import '../../basic_api/generated/app_register_send.dart';
import '../../basic_api/generated/app_update_send.dart';
import '../../basic_api/generated/revoke_oauth_app_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/enums.dart';
import 'app_delete_receive_result.dart';
import 'app_markup_details_receive_result.dart';
import 'app_register_receive_result.dart';
import 'app_update_receive_result.dart';
import 'revoke_oauth_app_receive_result.dart';

/// App get response model class
abstract class AppGetResponseModel {
  /// Initializes
  AppGetResponseModel({
    @required this.appGet,
  });

  /// The information of the requested application.
  final AppGet appGet;
}

/// App get response class
class AppGetResponse extends AppGetResponseModel {
  /// Initializes
  AppGetResponse({
    @required AppGet appGet,
  }) : super(
          appGet: appGet,
        );

  /// Creates an instance from JSON
  factory AppGetResponse.fromJson(
    dynamic appGetJson,
  ) =>
      AppGetResponse(
        appGet: appGetJson == null ? null : AppGet.fromJson(appGetJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (appGet != null) {
      resultMap['app_get'] = appGet.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the information of the OAuth application specified by [appId] in [request]
  ///
  /// For parameters information refer to [AppGetRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<AppGetResponse> fetchApplicationDetails(
    AppGetSend request,
  ) async {
    final AppGetReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return AppGetResponse.fromJson(response.appGet);
  }

  /// Gets all of the account's OAuth applications.
  ///
  /// For parameters information refer to [AppListRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<List<AppGetResponse>> fetchApplicationList(
    AppListSend request,
  ) async {
    final AppListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.appList,
      itemToTypeCallback: (dynamic item) => AppGetResponse.fromJson(item),
    );
  }

  /// Retrieves details of app markup according to criteria specified.
  Future<AppMarkupDetailsResponse> fetchApplicationMarkupDetails({
    String clientLoginId,
    DateTime dateFrom,
    DateTime dateTo,
    bool description,
    int limit,
    int offset,
    String sort,
    List<String> sortFields,
  }) =>
      AppMarkupDetailsResponse.fetchApplicationMarkupDetails(
        AppMarkupDetailsSend(
          appId: appGet.appId,
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
        AppDeleteSend(appDelete: appGet.appId),
      );

  /// Register a new Oauth application.
  Future<AppRegisterResponse> registerApplication({List<TokenScope> scopes}) =>
      AppRegisterResponse.registerApplication(
        AppRegisterSend(
          appMarkupPercentage: appGet.appMarkupPercentage,
          appstore: appGet.appstore,
          github: appGet.github,
          googleplay: appGet.googleplay,
          homepage: appGet.homepage,
          name: appGet.name,
          redirectUri: appGet.redirectUri,
          scopes: scopes
              .map((TokenScope scope) => getStringFromEnum(scope))
              .toList(),
          verificationUri: appGet.verificationUri,
        ),
      );

  /// Update application.
  Future<AppUpdateResponse> updateApplication({List<TokenScope> scopes}) =>
      AppUpdateResponse.updateApplication(
        AppUpdateSend(
          appMarkupPercentage: appGet.appMarkupPercentage,
          appUpdate: appGet.appId,
          appstore: appGet.appstore,
          github: appGet.github,
          googleplay: appGet.googleplay,
          homepage: appGet.homepage,
          name: appGet.name,
          redirectUri: appGet.redirectUri,
          scopes: scopes
              .map((TokenScope scope) => getStringFromEnum(scope))
              .toList(),
          verificationUri: appGet.verificationUri,
        ),
      );

  /// Revoke access of particular app.
  Future<RevokeOauthAppResponse> revokeOauthApplication() =>
      RevokeOauthAppResponse.revokeOauthApplication(
        RevokeOauthAppSend(revokeOauthApp: appGet.appId),
      );

  /// Creates a copy of instance with given parameters
  AppGetResponse copyWith({
    AppGet appGet,
  }) =>
      AppGetResponse(
        appGet: appGet ?? this.appGet,
      );
}
/// App get model class
abstract class AppGetModel {
  /// Initializes
  AppGetModel({
    @required this.appId,
    @required this.appMarkupPercentage,
    @required this.appstore,
    @required this.github,
    @required this.googleplay,
    @required this.homepage,
    @required this.name,
    @required this.redirectUri,
    @required this.verificationUri,
  });

  /// Application ID.
  final int appId;

  /// Markup added to contract prices (as a percentage of contract payout).
  final double appMarkupPercentage;

  /// Application's App Store URL.
  final String appstore;

  /// Application's GitHub page (for open-source projects).
  final String github;

  /// Application's Google Play URL.
  final String googleplay;

  /// Application's homepage URL.
  final String homepage;

  /// Application name.
  final String name;

  /// The URL to redirect to after a successful login.
  final String redirectUri;

  /// Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final String verificationUri;
}

/// App get class
class AppGet extends AppGetModel {
  /// Initializes
  AppGet({
    @required int appId,
    @required double appMarkupPercentage,
    @required String appstore,
    @required String github,
    @required String googleplay,
    @required String homepage,
    @required String name,
    @required String redirectUri,
    @required String verificationUri,
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
  factory AppGet.fromJson(Map<String, dynamic> json) => AppGet(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage']),
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        name: json['name'],
        redirectUri: json['redirect_uri'],
        verificationUri: json['verification_uri'],
      );

  /// Converts an instance to JSON
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AppGet copyWith({
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
      );
}
