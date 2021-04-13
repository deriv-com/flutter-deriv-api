import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Server time model class
abstract class ServerTimeModel extends APIBaseModel {
  /// Initializes
  ServerTimeModel({
    this.time,
  });

  /// Epoch of server time.
  final DateTime? time;
}
