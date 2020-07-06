/// Connection information class
class ConnectionInformation {
  /// Initializes
  ConnectionInformation({
    this.appId = '1089',
    this.brand = 'deriv',
    this.endpoint = 'frontend.binaryws.com',
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
