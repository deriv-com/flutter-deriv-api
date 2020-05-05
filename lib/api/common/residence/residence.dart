import 'package:flutter_deriv_api/api/common/models/residence_model.dart';

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

  /// Generate an instance from json
  factory Residence.fromJson(
    Map<String, dynamic> json,
  ) =>
      Residence(
        phoneIdd: json['phone_idd'],
        countryName: json['text'],
        countryCode: json['value'],
      );

  /// Generate a copy of instance with given parameters
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
