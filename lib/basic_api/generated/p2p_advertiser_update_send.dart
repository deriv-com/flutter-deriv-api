/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_update_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// P2p advertiser update request class
class P2pAdvertiserUpdateRequest extends Request {
  /// Initialize P2pAdvertiserUpdateRequest
  const P2pAdvertiserUpdateRequest({
    this.contactInfo,
    this.defaultAdvertDescription,
    this.isListed,
    this.name,
    this.p2pAdvertiserUpdate = true,
    this.paymentInfo,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advertiser_update',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdateRequest(
        contactInfo: json['contact_info'] as String,
        defaultAdvertDescription: json['default_advert_description'] as String,
        isListed: json['is_listed'] == null ? null : json['is_listed'] == 1,
        name: json['name'] as String,
        p2pAdvertiserUpdate: json['p2p_advertiser_update'] == null
            ? null
            : json['p2p_advertiser_update'] == 1,
        paymentInfo: json['payment_info'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// [Optional] Used to set if the advertiser's adverts could be listed. When `0`, adverts won't be listed regardless of they are active or not. This doesn't change the `is_active` of each individual advert.
  final bool isListed;

  /// [Optional] The advertiser's displayed name.
  final String name;

  /// Must be `true`
  final bool p2pAdvertiserUpdate;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String paymentInfo;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contact_info': contactInfo,
        'default_advert_description': defaultAdvertDescription,
        'is_listed': isListed == null ? null : isListed ? 1 : 0,
        'name': name,
        'p2p_advertiser_update':
            p2pAdvertiserUpdate == null ? null : p2pAdvertiserUpdate ? 1 : 0,
        'payment_info': paymentInfo,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserUpdateRequest copyWith({
    String contactInfo,
    String defaultAdvertDescription,
    bool isListed,
    String name,
    bool p2pAdvertiserUpdate,
    String paymentInfo,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertiserUpdateRequest(
        contactInfo: contactInfo ?? this.contactInfo,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        isListed: isListed ?? this.isListed,
        name: name ?? this.name,
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
