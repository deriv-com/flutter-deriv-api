import 'package:flutter_deriv_api/models/base_model.dart';
import 'package:flutter_deriv_api/models/mt5/mt5_login.dart';

/// MT5 login list model class
abstract class MT5LoginListModel extends BaseModel {
  /// Class constructor
  MT5LoginListModel({
    this.mt5LoginList,
  });

  /// Array containing MT5 account objects.
  final List<MT5LoginModel> mt5LoginList;
}
