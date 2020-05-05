import 'package:flutter_deriv_api/api/common/models/state_model.dart';

/// States list response class
class State extends StateModel {
  /// Initializes
  State({
    String text,
    String value,
  }) : super(
          text: text,
          value: value,
        );

  /// Generates an instance from json
  factory State.fromJson(Map<String, dynamic> json) => State(
        text: json['text'],
        value: json['value'],
      );

  /// Generates a copy of instance with given parameters
  State copyWith({
    String text,
    String value,
  }) =>
      State(
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
