/// Landing company send model class
abstract class LandingCompanySendModel {
  /// Initializes
  LandingCompanySendModel({
    @required this.landingCompany,
  });

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String landingCompany;
}

/// Landing company send class
class LandingCompanySend extends LandingCompanySendModel {
  /// Initializes
  LandingCompanySend({
    @required String landingCompany,
  }) : super(
          landingCompany: landingCompany,
        );

  /// Creates an instance from JSON
  factory LandingCompanySend.fromJson(Map<String, dynamic> json) =>
      LandingCompanySend(
        landingCompany: json['landing_company'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['landing_company'] = landingCompany;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LandingCompanySend copyWith({
    String landingCompany,
  }) =>
      LandingCompanySend(
        landingCompany: landingCompany ?? this.landingCompany,
      );
}
