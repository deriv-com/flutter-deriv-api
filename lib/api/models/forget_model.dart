import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Forget model class
abstract class ForgetModel extends APIBaseModel {
  /// Initializes
  ForgetModel({
    this.forget,
  });

  /// If set to true, stream exited and stopped. If set to false, stream did not exist.
  final bool forget;
}
