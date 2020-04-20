import 'package:flutter_deriv_api/logic/app/app_get.dart';
import 'package:flutter_deriv_api/models/app/app_list.dart';

/// App list model class
class AppList extends AppListModel {
  /// Class constructor
  AppList({
    List<AppGet> appList,
  }) : super(
          appList: appList,
        );

  /// Creates instance from json
  factory AppList.fromJson(Map<String, dynamic> json) => AppList(
        appList: json['app_list'] == null
            ? null
            : json['app_list']
                .map<AppGet>(
                    (Map<String, dynamic> item) => AppGet.fromJson(item))
                .toList(),
      );

  /// Creates copy of instance with given parameters
  AppList copyWith({
    List<AppGet> appList,
  }) =>
      AppList(
        appList: appList ?? this.appList,
      );
}
