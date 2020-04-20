import 'package:flutter_deriv_api/models/base_model.dart';

/// Forget model class
abstract class ForgetModel extends BaseModel {
  /// Class constructor
  ForgetModel({
    this.forget,
  });

  /// If set to true, stream exited and stopped. If set to false, stream did not exist.
  final bool forget;
}
