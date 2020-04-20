import 'package:flutter_deriv_api/models/app/app.dart';

/// App list model class
abstract class AppListModel {
  /// Class constructor
  AppListModel({
    this.appList,
  });

  /// List of created applications for the authorized account.
  final List<AppModel> appList;
}
