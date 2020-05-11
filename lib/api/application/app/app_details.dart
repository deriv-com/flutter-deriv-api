import 'package:flutter_deriv_api/api/application/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/application/models/app_details_model.dart';
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

  /// Fetch application details
  /// For parameters information refer to [AppGetRequest]
  static Future<AppDetails> fetchApplicationDetails({
    AppGetRequest request,
  }) async {
    final AppGetResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(message: response.error['message']);
    }

    return AppDetails.fromJson(response.appGet);
  }

  /// Fetch application list
  /// For parameters information refer to [AppListRequest]
  static Future<List<AppDetails>> fetchApplicationList({
    AppListRequest request,
  }) async {
    final AppListResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(message: response.error['message']);
    }

    return getListFromMap(
      response.appList,
      itemToTypeCallback: (dynamic item) => AppDetails.fromJson(item),
    );
  }
}
