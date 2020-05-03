import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Server time model class
abstract class ServerTimeModel extends BaseModel {
  /// Initializes
  ServerTimeModel({
    this.time,
  });

  /// Epoch of server time.
  final DateTime time;
}
