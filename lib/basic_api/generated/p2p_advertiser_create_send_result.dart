/// P2p advertiser create send model class
abstract class P2pAdvertiserCreateSendModel {
  /// Initializes
  P2pAdvertiserCreateSendModel({
    @required this.p2pAdvertiserCreate,
    this.contactInfo,
    this.defaultAdvertDescription,
    @required this.name,
    this.paymentInfo,
    this.subscribe,
  });

  /// Must be 1
  final int p2pAdvertiserCreate;

  /// [Optional] Advertiser's contact information, to be used as a default for new sell adverts.
  final String contactInfo;

  /// [Optional] Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// The advertiser's displayed name.
  final String name;

  /// [Optional] Advertiser's payment information, to be used as a default for new sell adverts.
  final String paymentInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to advertiser
  final int subscribe;
}

/// P2p advertiser create send class
class P2pAdvertiserCreateSend extends P2pAdvertiserCreateSendModel {
  /// Initializes
  P2pAdvertiserCreateSend({
    @required int p2pAdvertiserCreate,
    String contactInfo,
    String defaultAdvertDescription,
    @required String name,
    String paymentInfo,
    int subscribe,
  }) : super(
          p2pAdvertiserCreate: p2pAdvertiserCreate,
          contactInfo: contactInfo,
          defaultAdvertDescription: defaultAdvertDescription,
          name: name,
          paymentInfo: paymentInfo,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserCreateSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserCreateSend(
        p2pAdvertiserCreate: json['p2p_advertiser_create'],
        contactInfo: json['contact_info'],
        defaultAdvertDescription: json['default_advert_description'],
        name: json['name'],
        paymentInfo: json['payment_info'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advertiser_create'] = p2pAdvertiserCreate;
    result['contact_info'] = contactInfo;
    result['default_advert_description'] = defaultAdvertDescription;
    result['name'] = name;
    result['payment_info'] = paymentInfo;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserCreateSend copyWith({
    int p2pAdvertiserCreate,
    String contactInfo,
    String defaultAdvertDescription,
    String name,
    String paymentInfo,
    int subscribe,
  }) =>
      P2pAdvertiserCreateSend(
        p2pAdvertiserCreate: p2pAdvertiserCreate ?? this.p2pAdvertiserCreate,
        contactInfo: contactInfo ?? this.contactInfo,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        name: name ?? this.name,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        subscribe: subscribe ?? this.subscribe,
      );
}
