/// Autogenerated from flutter_deriv_api|lib/api/new_account_virtual_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'new_account_virtual_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountVirtualRequest {
  NewAccountVirtualRequest();
  factory NewAccountVirtualRequest.fromJson(Map<String, dynamic> json) =>
      _$NewAccountVirtualRequestFromJson(json);
  Map<String, dynamic> toJson() => _$NewAccountVirtualRequestToJson(this);

  // Properties
  int newAccountVirtual;

  /// Must be 1
  String affiliateToken;

  /// [Optional] Affiliate token, within 32 characters.
  String clientPassword;

  /// Password (length within 6-25 chars, accepts any printable ASCII character).
  String dateFirstContact;

  /// [Optional] Date of first contact, format: yyyy-mm-dd in GMT timezone.
  String gclidUrl;

  /// [Optional] Google Click Identifier to track source.
  String residence;

  /// 2-letter country code (obtained from residence_list call).
  String signupDevice;

  /// [Optional] Show whether user has used mobile or desktop.
  String utmCampaign;

  /// [Optional] Identifies a specific product promotion or strategic campaign such as a spring sale or other promotions.
  String utmMedium;

  /// [Optional] Identifies the medium the link was used upon such as: email, CPC, or other methods of sharing.
  String utmSource;

  /// [Optional] Identifies the source of traffic such as: search engine, newsletter, or other referral.
  String verificationCode;

  /// Email verification code (received from a verify_email call, which must be done first).
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
