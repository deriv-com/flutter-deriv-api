
/// Connection information class
class ConnectionInformation {
  /// Initializes
  ConnectionInformation({
    required this.appId,
    required this.brand,
    required this.endpoint,
    this.language = 'en',
  });

  /// Application id
  final String appId;

  /// Application brand
  final String brand;

  /// API endpoint
  final String endpoint;

  /// API language
  final String language;
}
