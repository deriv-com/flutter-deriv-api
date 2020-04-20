import 'package:flutter_deriv_api/models/app/app.dart';
import 'package:flutter_deriv_api/models/base_model.dart';

/// App list model class
abstract class AppListModel extends BaseModel {
  /// Class constructor
  AppListModel({
    this.appList,
  });

  /// List of created applications for the authorized account.
  final List<AppModel> appList;
}
