import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// App delete model class
abstract class AppDeleteModel extends APIBaseModel {
  /// Initializes
  AppDeleteModel({
    this.appDelete,
  });

  /// `true` on success
  final bool appDelete;
}
