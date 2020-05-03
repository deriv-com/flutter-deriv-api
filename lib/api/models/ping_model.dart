import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Ping model class
abstract class PingModel extends BaseModel {
  /// Initializes
  PingModel({
    this.ping,
  });

  /// Will return 'pong'
  final String ping;
}
