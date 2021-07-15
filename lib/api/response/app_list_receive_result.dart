import '../../basic_api/generated/app_list_receive.dart';
import '../../basic_api/generated/app_list_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// App list response model class.
abstract class AppListResponseModel {
  /// Initializes App list response model class .
  AppListResponseModel({
    this.appList,
  });

  /// List of created applications for the authorized account.
  final List<AppListItem>? appList;
}

/// App list response class.
class AppListResponse extends AppListResponseModel {
  /// Initializes App list response class.
  AppListResponse({
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
}
/// App list item model class.
abstract class AppListItemModel {
  /// Initializes App list item model class .
  AppListItemModel({
    required this.redirectUri,
    required this.name,
    required this.appMarkupPercentage,
    required this.appId,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
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

  /// Application's App Store URL.
  final String? appstore;

  /// Application's GitHub page. (for open-source projects)
  final String? github;

  /// Application's Google Play URL.
  final String? googleplay;

  /// Application's homepage URL.
  final String? homepage;

  /// Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final String? verificationUri;
}

/// App list item class.
class AppListItem extends AppListItemModel {
  /// Initializes App list item class.
  AppListItem({
    required int appId,
    required double appMarkupPercentage,
    required String name,
    required String redirectUri,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    String? verificationUri,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          name: name,
          redirectUri: redirectUri,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          verificationUri: verificationUri,
        );

  /// Creates an instance from JSON.
  factory AppListItem.fromJson(Map<String, dynamic> json) => AppListItem(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage'])!,
        name: json['name'],
        redirectUri: json['redirect_uri'],
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        verificationUri: json['verification_uri'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['app_markup_percentage'] = appMarkupPercentage;
    resultMap['name'] = name;
    resultMap['redirect_uri'] = redirectUri;
    resultMap['appstore'] = appstore;
    resultMap['github'] = github;
    resultMap['googleplay'] = googleplay;
    resultMap['homepage'] = homepage;
    resultMap['verification_uri'] = verificationUri;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AppListItem copyWith({
    required int appId,
    required double appMarkupPercentage,
    required String name,
    required String redirectUri,
    String? appstore,
    String? github,
    String? googleplay,
    String? homepage,
    String? verificationUri,
  }) =>
      AppListItem(
        appId: appId,
        appMarkupPercentage: appMarkupPercentage,
        name: name,
        redirectUri: redirectUri,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        verificationUri: verificationUri ?? this.verificationUri,
      );
}
