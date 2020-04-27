import 'package:flutter_deriv_api/api/models/residence_model.dart';

/// Country with account opening
class Residence extends ResidenceModel {
  /// Initializes
  Residence({
    String phoneIdd,
    String countryName,
    String countryCode,
  }) : super(
          phoneIdd: phoneIdd,
          countryName: countryName,
          countryCode: countryCode,
        );

  /// Instance from JSON
  factory Residence.fromJson(
    Map<String, dynamic> json,
  ) =>
      Residence(
        phoneIdd: json['phone_idd'],
        countryName: json['text'],
        countryCode: json['value'],
      );

  /// Clones a new instance
  Residence copyWith({
    String phoneIdd,
    String countryName,
    String countryCode,
  }) =>
      Residence(
        phoneIdd: phoneIdd ?? this.phoneIdd,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
      );
}
