/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_update_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advertiser update request class.
class P2pAdvertiserUpdateRequest extends Request {
  /// Initialize P2pAdvertiserUpdateRequest.
  const P2pAdvertiserUpdateRequest({
    this.contactInfo,
    this.defaultAdvertDescription,
    this.isListed,
    this.loginid,
    this.p2pAdvertiserUpdate = true,
    this.paymentInfo,
    this.showName,
    this.upgradeLimits,
    super.msgType = 'p2p_advertiser_update',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdateRequest(
        contactInfo: json['contact_info'] as String?,
        defaultAdvertDescription: json['default_advert_description'] as String?,
        isListed: json['is_listed'] == null ? null : json['is_listed'] == 1,
        loginid: json['loginid'] as String?,
        p2pAdvertiserUpdate: json['p2p_advertiser_update'] == null
            ? null
            : json['p2p_advertiser_update'] == 1,
        paymentInfo: json['payment_info'] as String?,
        showName: json['show_name'] == null ? null : json['show_name'] == 1,
        upgradeLimits: json['upgrade_limits'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String? contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String? defaultAdvertDescription;

  /// [Optional] Used to set if the advertiser's adverts could be listed. When `false`, adverts won't be listed regardless of they are active or not. This doesn't change the `is_active` of each individual advert.
  final bool? isListed;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pAdvertiserUpdate;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String? paymentInfo;

  /// [Optional] When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
  final bool? showName;

  /// [Optional] Used to upgrade daily limits of eligible advertiser.
  final int? upgradeLimits;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contact_info': contactInfo,
        'default_advert_description': defaultAdvertDescription,
        'is_listed': isListed == null
            ? null
            : isListed!
                ? 1
                : 0,
        'loginid': loginid,
        'p2p_advertiser_update': p2pAdvertiserUpdate == null
            ? null
            : p2pAdvertiserUpdate!
                ? 1
                : 0,
        'payment_info': paymentInfo,
        'show_name': showName == null
            ? null
            : showName!
                ? 1
                : 0,
        'upgrade_limits': upgradeLimits,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserUpdateRequest copyWith({
    String? contactInfo,
    String? defaultAdvertDescription,
    bool? isListed,
    String? loginid,
    bool? p2pAdvertiserUpdate,
    String? paymentInfo,
    bool? showName,
    int? upgradeLimits,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertiserUpdateRequest(
        contactInfo: contactInfo ?? this.contactInfo,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        isListed: isListed ?? this.isListed,
        loginid: loginid ?? this.loginid,
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        showName: showName ?? this.showName,
        upgradeLimits: upgradeLimits ?? this.upgradeLimits,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
