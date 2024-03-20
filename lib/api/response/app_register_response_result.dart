// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_register_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_register_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// App register response model class.
abstract class AppRegisterResponseModel {
  /// Initializes App register response model class .
  const AppRegisterResponseModel({
    this.appRegister,
  });

  /// The information of the created application.
  final AppRegister? appRegister;
}

/// App register response class.
class AppRegisterResponse extends AppRegisterResponseModel {
  /// Initializes App register response class.
  const AppRegisterResponse({
    super.appRegister,
  });

  /// Creates an instance from JSON.
  factory AppRegisterResponse.fromJson(
    dynamic appRegisterJson,
  ) =>
      AppRegisterResponse(
        appRegister: appRegisterJson == null
            ? null
            : AppRegister.fromJson(appRegisterJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (appRegister != null) {
      resultMap['app_register'] = appRegister!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Registers a new OAuth application.
  ///
  /// For parameters information refer to [AppRegisterRequest].
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<AppRegisterResponse> registerApplication(
    AppRegisterRequest request,
  ) async {
    final AppRegisterReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return AppRegisterResponse.fromJson(response.appRegister);
  }

  /// Creates a copy of instance with given parameters.
  AppRegisterResponse copyWith({
    AppRegister? appRegister,
  }) =>
      AppRegisterResponse(
        appRegister: appRegister ?? this.appRegister,
      );
}
/// App register model class.
abstract class AppRegisterModel {
  /// Initializes App register model class .
  const AppRegisterModel({
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

/// App register class.
class AppRegister extends AppRegisterModel {
  /// Initializes App register class.
  const AppRegister({
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
  factory AppRegister.fromJson(Map<String, dynamic> json) => AppRegister(
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
  AppRegister copyWith({
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
      AppRegister(
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
