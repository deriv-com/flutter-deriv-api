import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// App model class
abstract class AppDetailsModel extends APIBaseModel {
  /// Initializes
  AppDetailsModel({
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
