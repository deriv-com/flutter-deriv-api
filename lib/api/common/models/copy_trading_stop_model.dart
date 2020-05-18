import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Copy trading stop model class
abstract class CopyTradingStopModel extends APIBaseModel {
  /// Initializes
  CopyTradingStopModel({
    this.succeeded,
  });

  /// Copy start confirmation. Returns `true` is success.
  final bool succeeded;
}
