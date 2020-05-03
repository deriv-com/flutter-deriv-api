import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';

/// Change account setting confirmation
class SetAccountSettingModel extends APIBaseModel {
  /// Initializes
  SetAccountSettingModel({this.succeeded});

  /// Creates instance from JSON
  factory SetAccountSettingModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      SetAccountSettingModel(
        succeeded: getBool(json['set_settings']),
      );

  /// true on success
  final bool succeeded;

  /// Clones a new instance
  SetAccountSettingModel copyWith({
    bool succeeded,
  }) =>
      SetAccountSettingModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
