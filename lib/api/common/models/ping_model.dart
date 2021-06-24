import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Ping model class
abstract class PingModel extends APIBaseModel {
  /// Initializes
  PingModel({
    this.succeeded,
  });

  /// Will return 'pong'
  final bool? succeeded;
}
