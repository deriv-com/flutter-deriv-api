/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_create_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// P2pAdvertiserCreateRequest class
class P2pAdvertiserCreateRequest extends Request {
  /// Initialize P2pAdvertiserCreateRequest
  const P2pAdvertiserCreateRequest({
    this.contactInfo,
    this.defaultAdvertDescription,
    @required this.name,
    this.p2pAdvertiserCreate = true,
    this.paymentInfo,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advertiser_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserCreateRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserCreateRequest(
        // ignore: avoid_as
        contactInfo: json['contact_info'] as String,
        // ignore: avoid_as
        defaultAdvertDescription: json['default_advert_description'] as String,
        // ignore: avoid_as
        name: json['name'] as String,
        p2pAdvertiserCreate: json['p2p_advertiser_create'] == null
            ? null
            : json['p2p_advertiser_create'] == 1,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        paymentInfo: json['payment_info'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
      );

  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// The advertiser's displayed name.
  final String name;

  /// Must be `true`
  final bool p2pAdvertiserCreate;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String paymentInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to advertiser
  final bool subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contact_info': contactInfo,
        'default_advert_description': defaultAdvertDescription,
        'name': name,
        'p2p_advertiser_create':
            p2pAdvertiserCreate == null ? null : p2pAdvertiserCreate ? 1 : 0,
        'passthrough': passthrough,
        'payment_info': paymentInfo,
        'req_id': reqId,
        'subscribe': subscribe == null ? null : subscribe ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserCreateRequest copyWith({
    String contactInfo,
    String defaultAdvertDescription,
    String name,
    bool p2pAdvertiserCreate,
    String paymentInfo,
    bool subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertiserCreateRequest(
        contactInfo: contactInfo ?? this.contactInfo,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        name: name ?? this.name,
        p2pAdvertiserCreate: p2pAdvertiserCreate ?? this.p2pAdvertiserCreate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
