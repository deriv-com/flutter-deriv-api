/// Connection information for a single connection.
class ConnectionInformation {
  /// Initializes a new instance of the [ConnectionInformation] class.
  ConnectionInformation({
    required this.appId,
    required this.brand,
    required this.endpoint,
    required this.authEndpoint,
    this.language = 'en',
  });

  /// Application id.
  final String appId;

  /// Application brand.
  final String brand;

  /// API endpoint.
  final String endpoint;

  /// Auth endpoint.
  final String authEndpoint;

  /// API language.
  final String language;
}
