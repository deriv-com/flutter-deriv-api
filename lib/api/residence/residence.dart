import 'package:flutter_deriv_api/api/models/residence_list_model.dart';

/// Country with account opening
class Residence extends ResidenceModel {
  /// Initializes
  Residence({
    String phoneIdd,
    String text,
    String value,
  }) : super(
          phoneIdd: phoneIdd,
          text: text,
          value: value,
        );

  /// Instance from JSON
  factory Residence.fromJson(
    Map<String, dynamic> json,
  ) =>
      Residence(
        phoneIdd: json['phone_idd'],
        text: json['text'],
        value: json['value'],
      );

  /// Clones a new instance
  Residence copyWith({
    String phoneIdd,
    String text,
    String value,
  }) =>
      Residence(
        phoneIdd: phoneIdd ?? this.phoneIdd,
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
