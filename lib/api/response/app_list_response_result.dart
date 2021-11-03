// ignore_for_file: prefer_single_quotes

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// App list response model class.
abstract class AppListResponseModel extends Equatable {
  /// Initializes App list response model class .
  const AppListResponseModel({
    this.appList,
  });

  /// List of created applications for the authorized account.
  final List<AppListItem>? appList;
}

/// App list response class.
class AppListResponse extends AppListResponseModel {
  /// Initializes App list response class.
  const AppListResponse({
    List<AppListItem>? appList,
  }) : super(
          appList: appList,
        );

  /// Creates an instance from JSON.
  factory AppListResponse.fromJson(
    dynamic appListJson,
  ) =>
      AppListResponse(
        appList: appListJson == null
            ? null
            : List<AppListItem>.from(
                appListJson?.map(
                  (dynamic item) => AppListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (appList != null) {
      resultMap['app_list'] = appList!
          .map<dynamic>(
            (AppListItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets all of the account's OAuth applications.
  ///
  /// For parameters information refer to [AppListRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<AppListResponse> fetchApplicationList(
    AppListRequest request,
  ) async {
    final AppListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return AppListResponse.fromJson(response.appList);
  }

  /// Creates a copy of instance with given parameters.
  AppListResponse copyWith({
    List<AppListItem>? appList,
  }) =>
      AppListResponse(
        appList: appList ?? this.appList,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// App list item model class.
abstract class AppListItemModel extends Equatable {
  /// Initializes App list item model class .
  const AppListItemModel({
    required this.redirectUri,
    required this.name,
    required this.appMarkupPercentage,
    required this.appId,
    this.active,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    this.scopes,
    this.verificationUri,
  });

  /// The URL to redirect to after a successful login.
  final String redirectUri;

  /// Application name.
  final String name;

  /// Markup added to contract prices (as a percentage of contract payout).
  final double appMarkupPercentage;

  /// Application ID.
  final int appId;

  /// Active.
  final int? active;

  /// Application's App Store URL.
  final String? appstore;

  /// Application's GitHub page. (for open-source projects)
  final String? github;

  /// Application's Google Play URL.
  final String? googleplay;

  /// Application's homepage URL.
  final String? homepage;

  /// Scope Details.
  final List<String>? scopes;

  /// Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final String? verificationUri;
}

/// App list item class.
class AppListItem extends AppListItemModel {
  /// Initializes App list item class.
  const AppListItem({
    required int appId,
    required double appMarkupPercentage,
    required String name,
    required String redirectUri,
    int? active,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    List<String>? scopes,
    String? verificationUri,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          name: name,
          redirectUri: redirectUri,
          active: active,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          scopes: scopes,
          verificationUri: verificationUri,
        );

  /// Creates an instance from JSON.
  factory AppListItem.fromJson(Map<String, dynamic> json) => AppListItem(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage'])!,
        name: json['name'],
        redirectUri: json['redirect_uri'],
        active: json['active'],
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        scopes: json['scopes'] == null
            ? null
            : List<String>.from(
                json['scopes']?.map(
                  (dynamic item) => item,
                ),
              ),
        verificationUri: json['verification_uri'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['app_markup_percentage'] = appMarkupPercentage;
    resultMap['name'] = name;
    resultMap['redirect_uri'] = redirectUri;
    resultMap['active'] = active;
    resultMap['appstore'] = appstore;
    resultMap['github'] = github;
    resultMap['googleplay'] = googleplay;
    resultMap['homepage'] = homepage;
    if (scopes != null) {
      resultMap['scopes'] = scopes!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['verification_uri'] = verificationUri;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AppListItem copyWith({
    required int appId,
    required double appMarkupPercentage,
    required String name,
    required String redirectUri,
    int? active,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    List<String>? scopes,
    String? verificationUri,
  }) =>
      AppListItem(
        appId: appId,
        appMarkupPercentage: appMarkupPercentage,
        name: name,
        redirectUri: redirectUri,
        active: active ?? this.active,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        scopes: scopes ?? this.scopes,
        verificationUri: verificationUri ?? this.verificationUri,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
