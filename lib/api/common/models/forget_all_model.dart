import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Forget all model class
abstract class ForgetAllModel extends APIBaseModel {
  /// Initializes
  ForgetAllModel({
    this.cancelledStreams,
  });

  /// IDs of the cancelled streams
  final List<String>? cancelledStreams;
}
