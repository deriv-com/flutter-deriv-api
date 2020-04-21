import 'package:flutter_deriv_api/api/models/base_model.dart';

/// App delete response model class
abstract class AppDeleteModel extends BaseModel {
  /// Class constructor
  AppDeleteModel({
    this.appDelete,
  });

  /// 1 on success
  final int appDelete;
}
