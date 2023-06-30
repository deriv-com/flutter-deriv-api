import 'package:web_socket_client/web_socket_client.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/enums.dart';

/// An extension on [ConnectionState].
extension ConnectionStatusExtension on ConnectionState {
  /// Gets the [APIStatus] from [ConnectionState].
  APIStatus get apiStatus {
    if (this is Connecting || this is Reconnecting) {
      return APIStatus.connecting;
    }

    if (this is Connected || this is Reconnected) {
      return APIStatus.connected;
    }

    if (this is Disconnected || this is Disconnecting) {
      return APIStatus.disconnected;
    }

    throw Exception('ConnectionStatusExtension unknown connection status.');
  }
}
