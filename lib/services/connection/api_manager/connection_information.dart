import 'package:meta/meta.dart';

/// Connection information for a single connection.
@immutable
class ConnectionInformation {
  /// Initializes a new instance of the [ConnectionInformation] class.
  const ConnectionInformation({
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectionInformation &&
          runtimeType == other.runtimeType &&
          appId == other.appId &&
          brand == other.brand &&
          endpoint == other.endpoint &&
          authEndpoint == other.authEndpoint &&
          language == other.language;

  @override
  int get hashCode =>
      appId.hashCode ^
      brand.hashCode ^
      endpoint.hashCode ^
      authEndpoint.hashCode ^
      language.hashCode;
}
