// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_update_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_update_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// App update response model class.
abstract class AppUpdateResponseModel extends Equatable {
  /// Initializes App update response model class .
  const AppUpdateResponseModel({
    this.appUpdate,
  });

  /// Information of the updated application.
  final AppUpdate? appUpdate;
}

/// App update response class.
class AppUpdateResponse extends AppUpdateResponseModel {
  /// Initializes App update response class.
  const AppUpdateResponse({
    AppUpdate? appUpdate,
  }) : super(
          appUpdate: appUpdate,
        );

  /// Creates an instance from JSON.
  factory AppUpdateResponse.fromJson(
    dynamic appUpdateJson,
  ) =>
      AppUpdateResponse(
        appUpdate:
            appUpdateJson == null ? null : AppUpdate.fromJson(appUpdateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (appUpdate != null) {
      resultMap['app_update'] = appUpdate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Updates the application specified in [request].
  ///
  /// For parameters information refer to [AppUpdateRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<AppUpdateResponse> updateApplication(
      AppUpdateRequest request) async {
    final AppUpdateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return AppUpdateResponse.fromJson(response.appUpdate);
  }

  /// Creates a copy of instance with given parameters.
  AppUpdateResponse copyWith({
    AppUpdate? appUpdate,
  }) =>
      AppUpdateResponse(
        appUpdate: appUpdate ?? this.appUpdate,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// App update model class.
abstract class AppUpdateModel extends Equatable {
  /// Initializes App update model class .
  const AppUpdateModel({
    this.active,
    this.appId,
    this.appMarkupPercentage,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    this.name,
    this.redirectUri,
    this.scopes,
    this.verificationUri,
  });

  /// Active.
  final int? active;

  /// Application ID.
  final int? appId;

  /// Markup added to contract prices (as a percentage of contract payout).
  final double? appMarkupPercentage;

  /// Application's App Store URL.
  final String? appstore;

  /// Application's GitHub page (for open-source projects).
  final String? github;

  /// Application's Google Play URL.
  final String? googleplay;

  /// Application's homepage URL.
  final String? homepage;

  /// Application name.
  final String? name;

  /// The URL to redirect to after a successful login.
  final String? redirectUri;

  /// Scope Details.
  final List<String>? scopes;

  /// Used when `verify_email` called. If available, a URL containing the verification token will be sent to the client's email, otherwise only the token will be sent.
  final String? verificationUri;
}

/// App update class.
class AppUpdate extends AppUpdateModel {
  /// Initializes App update class.
  const AppUpdate({
    int? active,
    int? appId,
    double? appMarkupPercentage,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    String? name,
    String? redirectUri,
    List<String>? scopes,
    String? verificationUri,
  }) : super(
          active: active,
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          name: name,
          redirectUri: redirectUri,
          scopes: scopes,
          verificationUri: verificationUri,
        );

  /// Creates an instance from JSON.
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        active: json['active'],
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage']),
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        name: json['name'],
        redirectUri: json['redirect_uri'],
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

    resultMap['active'] = active;
    resultMap['app_id'] = appId;
    resultMap['app_markup_percentage'] = appMarkupPercentage;
    resultMap['appstore'] = appstore;
    resultMap['github'] = github;
    resultMap['googleplay'] = googleplay;
    resultMap['homepage'] = homepage;
    resultMap['name'] = name;
    resultMap['redirect_uri'] = redirectUri;
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
  AppUpdate copyWith({
    int? active,
    int? appId,
    double? appMarkupPercentage,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    String? name,
    String? redirectUri,
    List<String>? scopes,
    String? verificationUri,
  }) =>
      AppUpdate(
        active: active ?? this.active,
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        name: name ?? this.name,
        redirectUri: redirectUri ?? this.redirectUri,
        scopes: scopes ?? this.scopes,
        verificationUri: verificationUri ?? this.verificationUri,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
