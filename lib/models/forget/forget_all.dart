import 'package:flutter_deriv_api/models/base_model.dart';

/// Forget all model class
abstract class ForgetAllModel extends BaseModel {
  /// Class constructor
  ForgetAllModel({
    this.forgetAll,
  });

  /// IDs of the cancelled streams
  final List<String> forgetAll;
}
