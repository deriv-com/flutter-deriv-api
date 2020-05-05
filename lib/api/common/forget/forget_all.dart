import 'package:flutter_deriv_api/api/common/models/forget_all_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Forget All class
class ForgetAll extends ForgetAllModel {
  /// Initializes
  ForgetAll({
    List<String> forgetAll,
  }) : super(
          forgetAll: forgetAll,
        );

  /// Creates an instance from json
  factory ForgetAll.fromJson(Map<String, dynamic> json) => ForgetAll(
        forgetAll: getListFromMap(json['forget_all']),
      );

  /// Creates a copy of instance with given parameters
  ForgetAll copyWith({
    List<String> forgetAll,
  }) =>
      ForgetAll(
        forgetAll: forgetAll ?? this.forgetAll,
      );
}
