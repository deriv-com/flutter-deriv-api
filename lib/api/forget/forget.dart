import 'package:flutter_deriv_api/api/models/forget_model.dart';

/// Forget class
class Forget extends ForgetModel {
  /// Class constructor
  Forget({
    bool forget,
  }) : super(
          forget: forget,
        );

  /// Creates instance from json
  factory Forget.fromJson(Map<String, dynamic> json) => Forget(
        forget: json['forget'] == 1,
      );

  /// Creates copy of instance with given parameters
  Forget copyWith({
    bool forget,
  }) =>
      Forget(
        forget: forget ?? this.forget,
      );
}
