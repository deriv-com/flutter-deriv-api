import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Base class for abstraction layer implementation
abstract class BaseModel {
  /// Class constructor
  BaseModel({
    this.api,
  });

  /// Api instance
  final BinaryAPI api;
}
