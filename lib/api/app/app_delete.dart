import 'package:flutter_deriv_api/api/models/app_delete_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App delete class
class AppDelete extends AppDeleteModel {
  /// Initializes
  AppDelete({
    bool appDelete,
  }) : super(
          appDelete: appDelete,
        );

  /// Creates instance from json
  factory AppDelete.fromJson(Map<String, dynamic> json) => AppDelete(
        appDelete: getBool(json['app_delete']),
      );

  /// Creates copy of instance with given parameters
  AppDelete copyWith({
    bool appDelete,
  }) =>
      AppDelete(
        appDelete: appDelete ?? this.appDelete,
      );
}
