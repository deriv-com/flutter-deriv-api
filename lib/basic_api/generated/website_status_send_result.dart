/// Website status send model class
abstract class WebsiteStatusSendModel {
  /// Initializes
  WebsiteStatusSendModel({
    @required this.websiteStatus,
    this.subscribe,
  });

  /// Must be `1`
  final int websiteStatus;

  /// [Optional] `true` to stream the server/website status updates.
  final bool subscribe;
}

/// Website status send class
class WebsiteStatusSend extends WebsiteStatusSendModel {
  /// Initializes
  WebsiteStatusSend({
    @required int websiteStatus,
    bool subscribe,
  }) : super(
          websiteStatus: websiteStatus,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory WebsiteStatusSend.fromJson(Map<String, dynamic> json) =>
      WebsiteStatusSend(
        websiteStatus: json['website_status'],
        subscribe: getBool(json['subscribe']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['website_status'] = websiteStatus;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  WebsiteStatusSend copyWith({
    int websiteStatus,
    bool subscribe,
  }) =>
      WebsiteStatusSend(
        websiteStatus: websiteStatus ?? this.websiteStatus,
        subscribe: subscribe ?? this.subscribe,
      );
}
