import 'package:flutter_deriv_api/logic/app/app.dart';
import 'package:flutter_deriv_api/models/app/app_list.dart';

/// App list model class
class AppList extends AppListModel {
  /// Class constructor
  AppList({
    List<App> appList,
  }) : super(
          appList: appList,
        );

  /// Creates instance from json
  factory AppList.fromJson(Map<String, dynamic> json) => AppList(
        appList: json['app_list'] == null
            ? null
            : json['app_list']
                .map<App>((Map<String, dynamic> item) => App.fromJson(item))
                .toList(),
      );

  /// Creates copy of instance with given parameters
  AppList copyWith({
    List<App> appList,
  }) =>
      AppList(
        appList: appList ?? this.appList,
      );
}
