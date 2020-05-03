import 'package:flutter_deriv_api/api/models/base_model.dart';

/// App delete model class
abstract class AppDeleteModel extends BaseModel {
  /// Initializes
  AppDeleteModel({
    this.appDelete,
  });

  /// `true` on success
  final bool appDelete;
}
