/// P2p advertiser update send model class
abstract class P2pAdvertiserUpdateSendModel {
  /// Initializes
  P2pAdvertiserUpdateSendModel({
    @required this.p2pAdvertiserUpdate,
    this.contactInfo,
    this.defaultAdvertDescription,
    this.isListed,
    this.paymentInfo,
    this.showName,
  });

  /// Must be 1
  final int p2pAdvertiserUpdate;

  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// [Optional] Used to set if the advertiser's adverts could be listed. When `false`, adverts won't be listed regardless of they are active or not. This doesn't change the `is_active` of each individual advert.
  final bool isListed;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String paymentInfo;

  /// [Optional] When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
  final bool showName;
}

/// P2p advertiser update send class
class P2pAdvertiserUpdateSend extends P2pAdvertiserUpdateSendModel {
  /// Initializes
  P2pAdvertiserUpdateSend({
    @required int p2pAdvertiserUpdate,
    String contactInfo,
    String defaultAdvertDescription,
    bool isListed,
    String paymentInfo,
    bool showName,
  }) : super(
          p2pAdvertiserUpdate: p2pAdvertiserUpdate,
          contactInfo: contactInfo,
          defaultAdvertDescription: defaultAdvertDescription,
          isListed: isListed,
          paymentInfo: paymentInfo,
          showName: showName,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserUpdateSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdateSend(
        p2pAdvertiserUpdate: json['p2p_advertiser_update'],
        contactInfo: json['contact_info'],
        defaultAdvertDescription: json['default_advert_description'],
        isListed: getBool(json['is_listed']),
        paymentInfo: json['payment_info'],
        showName: getBool(json['show_name']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advertiser_update'] = p2pAdvertiserUpdate;
    result['contact_info'] = contactInfo;
    result['default_advert_description'] = defaultAdvertDescription;
    result['is_listed'] = isListed;
    result['payment_info'] = paymentInfo;
    result['show_name'] = showName;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserUpdateSend copyWith({
    int p2pAdvertiserUpdate,
    String contactInfo,
    String defaultAdvertDescription,
    bool isListed,
    String paymentInfo,
    bool showName,
  }) =>
      P2pAdvertiserUpdateSend(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
        contactInfo: contactInfo ?? this.contactInfo,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        isListed: isListed ?? this.isListed,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        showName: showName ?? this.showName,
      );
}
