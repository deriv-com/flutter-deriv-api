import 'package:flutter_deriv_api/api/models/state_model.dart';

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

  /// Creates instance from json
  factory State.fromJson(Map<String, dynamic> json) => State(
        text: json['text'],
        value: json['value'],
      );

  /// Clones a new instance
  State copyWith({
    String text,
    String value,
  }) =>
      State(
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
