/// Autogenerated from flutter_deriv_api|lib/api/app_register_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'app_register_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppRegisterRequest {
  AppRegisterRequest();
  factory AppRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$AppRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AppRegisterRequestToJson(this);

  // Properties
  int appRegister;

  /// Must be 1
  num appMarkupPercentage;

  /// Markup to be added to contract prices (as a percentage of contract payout). Min: 0, Max: 5
  String appstore;

  /// Application's App Store URL (if applicable)
  String github;

  /// Application's GitHub page (for open-source projects)
  String googleplay;

  /// Application's Google Play URL (if applicable)
  String homepage;

  /// Application's homepage
  String name;

  /// Application name
  String redirectUri;

  /// Application redirect_uri
  List<String> scopes;

  /// List of permission scopes to grant the application.
  String verificationUri;

  /// Application verification_uri
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
