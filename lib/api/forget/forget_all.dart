import 'package:flutter_deriv_api/api/models/forget_all_model.dart';

/// Forget All class
class ForgetAll extends ForgetAllModel {
  /// Class constructor
  ForgetAll({
    List<String> forgetAll,
  }) : super(
          forgetAll: forgetAll,
        );

  /// Creates instance from json
  factory ForgetAll.fromJson(Map<String, dynamic> json) => ForgetAll(
        forgetAll: json['forget_all'] == null
            ? null
            : json['forget_all']
                .map<String>((Map<String, dynamic> item) => item)
                .toList(),
      );

  /// Creates copy of instance with given parameters
  ForgetAll copyWith({
    List<String> forgetAll,
  }) =>
      ForgetAll(
        forgetAll: forgetAll ?? this.forgetAll,
      );
}
