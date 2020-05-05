import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advertiser_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// P2P advertise class
class P2PAdvertiser extends P2PAdvertiserModel {
  /// Initializes
  P2PAdvertiser({
    String chatToken,
    String chatUserId,
    String contactInfo,
    DateTime createdTime,
    String defaultAdvertDescription,
    String id,
    bool isApproved,
    bool isListed,
    String name,
    String paymentInfo,
  }) : super(
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          createdTime: createdTime,
          defaultAdvertDescription: defaultAdvertDescription,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          name: name,
          paymentInfo: paymentInfo,
        );

  /// Generate an instance from json
  factory P2PAdvertiser.fromJson(Map<String, dynamic> json) => P2PAdvertiser(
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time']),
        defaultAdvertDescription: json['default_advert_description'],
        id: json['id'],
        isApproved: getBool(json['is_approved']),
        isListed: getBool(json['is_listed']),
        name: json['name'],
        paymentInfo: json['payment_info'],
      );

  /// Generate a copy of instance with given parameters
  P2PAdvertiser copyWith({
    String chatToken,
    String chatUserId,
    String contactInfo,
    DateTime createdTime,
    String defaultAdvertDescription,
    String id,
    bool isApproved,
    bool isListed,
    String name,
    String paymentInfo,
    SubscriptionModel subscription,
  }) =>
      P2PAdvertiser(
        chatToken: chatToken ?? this.chatToken,
        chatUserId: chatUserId ?? this.chatUserId,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isListed: isListed ?? this.isListed,
        name: name ?? this.name,
        paymentInfo: paymentInfo ?? this.paymentInfo,
      );
}
