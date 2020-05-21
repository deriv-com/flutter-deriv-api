/// Callbacks for websocket connection
typedef ConnectionCallback = void Function();

/// Connection information class
class ConnectionInformation {
  /// Initializes
  ConnectionInformation({
    this.appId = '1408',
    this.brand = 'deriv',
    this.endpoint = 'www.binaryqa10.com',
    this.language = 'en',
    this.onDone,
    this.onOpen,
  });

  /// Application id
  final String appId;

  /// Application brand
  final String brand;

  /// API endpoint
  final String endpoint;

  /// API language
  final String language;

  /// [onDone] callback for websocket
  final ConnectionCallback onDone;

  /// [onOpen] callback for websocket
  final ConnectionCallback onOpen;
}
