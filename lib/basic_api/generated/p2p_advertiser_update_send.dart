/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_update_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_advertiser_update_send.g.dart';

/// JSON conversion for 'p2p_advertiser_update_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserUpdateRequest extends Request {
  /// Initialize P2pAdvertiserUpdateRequest
  const P2pAdvertiserUpdateRequest({
    this.contactInfo,
    this.defaultAdvertDescription,
    this.isListed,
    this.name,
    this.p2pAdvertiserUpdate = 1,
    this.paymentInfo,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pAdvertiserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserUpdateRequestFromJson(json);

  // Properties
  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// [Optional] Used to set if the advertiser's adverts could be listed. When `0`, adverts won't be listed regardless of they are active or not. This doesn't change the `is_active` of each individual advert.
  final int isListed;

  /// [Optional] The advertiser's displayed name.
  final String name;

  /// Must be 1
  final int p2pAdvertiserUpdate;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String paymentInfo;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserUpdateRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertiserUpdateRequest copyWith({
    String contactInfo,
    String defaultAdvertDescription,
    int isListed,
    String name,
    int p2pAdvertiserUpdate,
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
