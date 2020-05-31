/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_create_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_advertiser_create_send.g.dart';

/// JSON conversion for 'p2p_advertiser_create_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class P2pAdvertiserCreateRequest extends Request {
  /// Initialize P2pAdvertiserCreateRequest
  const P2pAdvertiserCreateRequest({
    this.contactInfo,
    this.defaultAdvertDescription,
    this.name,
    this.p2pAdvertiserCreate = 1,
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
      _$P2pAdvertiserCreateRequestFromJson(json);

  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// The advertiser's displayed name.
  final String name;

  /// Must be 1
  final int p2pAdvertiserCreate;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String paymentInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to advertiser
  final int subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserCreateRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserCreateRequest copyWith({
    String contactInfo,
    String defaultAdvertDescription,
    String name,
    int p2pAdvertiserCreate,
    String paymentInfo,
    int subscribe,
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
