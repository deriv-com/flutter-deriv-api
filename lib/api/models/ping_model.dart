import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Ping model class
class PingModel extends APIBaseModel {
  /// Initializes
  PingModel({
    this.succeeded,
  });

  /// Generate an instance from json
  factory PingModel.fromJson(Map<String, dynamic> json) => PingModel(
        succeeded: json['ping'] == 'pong',
      );

  /// Will return 'pong'
  final bool succeeded;

  /// Generate a copy of instance with given parameters
  PingModel copyWith({
    bool succeeded,
  }) =>
      PingModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
