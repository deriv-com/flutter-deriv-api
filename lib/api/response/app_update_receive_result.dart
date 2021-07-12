import '../../basic_api/generated/app_update_receive.dart';
import '../../basic_api/generated/app_update_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// App update response model class.
abstract class AppUpdateResponseModel {
  /// Initializes.
  AppUpdateResponseModel({
    this.appUpdate,
  });

  /// Information of the updated application.
  final AppUpdate? appUpdate;
}

/// App update response class.
class AppUpdateResponse extends AppUpdateResponseModel {
  /// Initializes
  AppUpdateResponse({
    AppUpdate? appUpdate,
  }) : super(
          appUpdate: appUpdate,
        );

  /// Creates an instance from JSON
  factory AppUpdateResponse.fromJson(
    dynamic appUpdateJson,
  ) =>
      AppUpdateResponse(
        appUpdate:
            appUpdateJson == null ? null : AppUpdate.fromJson(appUpdateJson),
      );

  /// Converts an instance to JSON
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
      AppUpdateSend request) async {
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
}
/// App update model class.
abstract class AppUpdateModel {
  /// Initializes.
  AppUpdateModel({
    this.appId,
    this.appMarkupPercentage,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    this.name,
    this.redirectUri,
    this.verificationUri,
  });

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

  /// Used when `verify_email` called. If available, a URL containing the verification token will be sent to the client's email, otherwise only the token will be sent.
  final String? verificationUri;
}

/// App update class.
class AppUpdate extends AppUpdateModel {
  /// Initializes
  AppUpdate({
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
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
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

  /// Creates a copy of instance with given parameters.
  AppUpdate copyWith({
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
      AppUpdate(
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
