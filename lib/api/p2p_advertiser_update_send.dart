/// Autogenerated from flutter_deriv_api|lib/api/p2p_advertiser_update_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'p2p_advertiser_update_send.g.dart';

///
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserUpdateRequest extends Request {
  ///
  P2pAdvertiserUpdateRequest(
      {this.contactInfo,
      this.defaultAdvertDescription,
      this.isListed,
      this.name,
      this.p2pAdvertiserUpdate,
      this.paymentInfo,
      int reqId,
      Map<String, dynamic> passthrough})
      : super(reqId: reqId, passthrough: passthrough);

  /// Instance from JSON
  factory P2pAdvertiserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserUpdateRequestFromJson(json);

  /// Instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserUpdateRequestToJson(this);

  // Properties
  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  String contactInfo;

  /// [Optional] Could be used as a template for general instructions for adverts.
  String defaultAdvertDescription;

  /// [Optional] Used to set if the advertiser's adverts could be listed. When `0`, adverts won't be listed regardless of they are active or not. This doesn't change the `is_active` of each individual advert.
  int isListed;

  /// [Optional] The advertiser's displayed name.
  String name;

  /// Must be 1
  int p2pAdvertiserUpdate;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  String paymentInfo;
}
