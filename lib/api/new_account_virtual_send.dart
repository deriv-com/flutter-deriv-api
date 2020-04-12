/// generated automatically from flutter_deriv_api|lib/api/new_account_virtual_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'new_account_virtual_send.g.dart';

/// JSON conversion for 'new_account_virtual_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountVirtualRequest extends Request {
  /// Initialize NewAccountVirtualRequest
  const NewAccountVirtualRequest({
    this.affiliateToken,
    this.clientPassword,
    this.dateFirstContact,
    this.gclidUrl,
    this.newAccountVirtual = 1,
    this.residence,
    this.signupDevice,
    this.utmCampaign,
    this.utmMedium,
    this.utmSource,
    this.verificationCode,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory NewAccountVirtualRequest.fromJson(Map<String, dynamic> json) =>
      _$NewAccountVirtualRequestFromJson(json);

  // Properties
  /// [Optional] Affiliate token, within 32 characters.
  final String affiliateToken;

  /// Password (length within 6-25 chars, accepts any printable ASCII character).
  final String clientPassword;

  /// [Optional] Date of first contact, format: `yyyy-mm-dd` in GMT timezone.
  final String dateFirstContact;

  /// [Optional] Google Click Identifier to track source.
  final String gclidUrl;

  /// Must be `1`
  final int newAccountVirtual;

  /// 2-letter country code (obtained from `residence_list` call).
  final String residence;

  /// [Optional] Show whether user has used mobile or desktop.
  final String signupDevice;

  /// [Optional] Identifies a specific product promotion or strategic campaign such as a spring sale or other promotions.
  final String utmCampaign;

  /// [Optional] Identifies the medium the link was used upon such as: email, CPC, or other methods of sharing.
  final String utmMedium;

  /// [Optional] Identifies the source of traffic such as: search engine, newsletter, or other referral.
  final String utmSource;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String verificationCode;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountVirtualRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  NewAccountVirtualRequest copyWith({
    String affiliateToken,
    String clientPassword,
    String dateFirstContact,
    String gclidUrl,
    int newAccountVirtual,
    String residence,
    String signupDevice,
    String utmCampaign,
    String utmMedium,
    String utmSource,
    String verificationCode,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      NewAccountVirtualRequest(
        affiliateToken: affiliateToken ?? this.affiliateToken,
        clientPassword: clientPassword ?? this.clientPassword,
        dateFirstContact: dateFirstContact ?? this.dateFirstContact,
        gclidUrl: gclidUrl ?? this.gclidUrl,
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
        residence: residence ?? this.residence,
        signupDevice: signupDevice ?? this.signupDevice,
        utmCampaign: utmCampaign ?? this.utmCampaign,
        utmMedium: utmMedium ?? this.utmMedium,
        utmSource: utmSource ?? this.utmSource,
        verificationCode: verificationCode ?? this.verificationCode,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
