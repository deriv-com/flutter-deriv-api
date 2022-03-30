import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// P2P advertiser model class
abstract class P2PAdvertiserModel extends APIBaseModel {
  /// Initializes
  P2PAdvertiserModel({
    this.chatToken,
    this.chatUserId,
    this.contactInfo,
    this.createdTime,
    this.defaultAdvertDescription,
    this.id,
    this.isApproved,
    this.isListed,
    this.name,
    this.paymentInfo,
  });

  /// The token to be used for authenticating the client for chat.
  final String? chatToken;

  /// The unique identifier for the chat user.
  final String? chatUserId;

  /// Advertiser's contact information.
  final String? contactInfo;

  /// The epoch time that the client became an advertiser.
  final DateTime? createdTime;

  /// Default description that can be used every time an advert is created.
  final String? defaultAdvertDescription;

  /// The advertiser's identification number.
  final String? id;

  /// The approval status of the advertiser.
  final bool? isApproved;

  /// Indicates if the advertiser's active adverts are listed. When `0`, adverts won't be listed regardless of they are active or not.
  final bool? isListed;

  /// The advertiser's displayed name.
  final String? name;

  /// Advertiser's payment information.
  final String? paymentInfo;
}
