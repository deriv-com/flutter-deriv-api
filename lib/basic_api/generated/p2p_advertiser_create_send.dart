/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_create_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advertiser create send class.
class P2pAdvertiserCreateSend extends Request {
  /// Initialize P2pAdvertiserCreateSend.
  const P2pAdvertiserCreateSend({
    this.contactInfo,
    this.defaultAdvertDescription,
    required this.name,
    this.p2pAdvertiserCreate = true,
    this.paymentInfo,
    this.subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'p2p_advertiser_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserCreateSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserCreateSend(
        contactInfo: json['contact_info'] as String?,
        defaultAdvertDescription: json['default_advert_description'] as String?,
        name: json['name'] as String?,
        p2pAdvertiserCreate: json['p2p_advertiser_create'] == null
            ? null
            : json['p2p_advertiser_create'] == 1,
        paymentInfo: json['payment_info'] as String?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String? contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String? defaultAdvertDescription;

  /// The advertiser's displayed name.
  final String? name;

  /// Must be `true`
  final bool? p2pAdvertiserCreate;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String? paymentInfo;

  /// [Optional] If set to `true`, will send updates whenever there is an update to advertiser
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contact_info': contactInfo,
        'default_advert_description': defaultAdvertDescription,
        'name': name,
        'p2p_advertiser_create': p2pAdvertiserCreate == null
            ? null
            : p2pAdvertiserCreate!
                ? 1
                : 0,
        'payment_info': paymentInfo,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserCreateSend copyWith({
    String? contactInfo,
    String? defaultAdvertDescription,
    String? name,
    bool? p2pAdvertiserCreate,
    String? paymentInfo,
    bool? subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertiserCreateSend(
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

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
