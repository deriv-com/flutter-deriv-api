import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Copy trading start model class
abstract class CopyTradingStartModel extends APIBaseModel {
  /// Initializes
  CopyTradingStartModel({
    this.succeeded,
  });

  /// Copy start confirmation. Returns `true` is success.
  final bool succeeded;
}
