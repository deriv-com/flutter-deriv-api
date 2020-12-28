/// Landing company details send model class
abstract class LandingCompanyDetailsSendModel {
  /// Initializes
  LandingCompanyDetailsSendModel({
    @required this.landingCompanyDetails,
  });

  /// Landing company shortcode.
  final LandingCompanyDetailsEnum landingCompanyDetails;
}

/// Landing company details send class
class LandingCompanyDetailsSend extends LandingCompanyDetailsSendModel {
  /// Initializes
  LandingCompanyDetailsSend({
    @required String landingCompanyDetails,
  }) : super(
          landingCompanyDetails: landingCompanyDetails,
        );

  /// Creates an instance from JSON
  factory LandingCompanyDetailsSend.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailsSend(
        landingCompanyDetails: json['landing_company_details'] == null
            ? null
            : landingCompanyDetailsEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['landing_company_details'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['landing_company_details'] =
        landingCompanyDetailsEnumMapper[landingCompanyDetails];

    return result;
  }

  /// Creates a copy of instance with given parameters
  LandingCompanyDetailsSend copyWith({
    String landingCompanyDetails,
  }) =>
      LandingCompanyDetailsSend(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
      );
  // Creating Enum Mappers
  static final Map<LandingCompanyDetailsEnum, String>
      landingCompanyDetailsEnumMapper = {
    LandingCompanyDetailsEnum.iom: 'iom',
    LandingCompanyDetailsEnum.malta: 'malta',
    LandingCompanyDetailsEnum.maltainvest: 'maltainvest',
    LandingCompanyDetailsEnum.svg: 'svg',
    LandingCompanyDetailsEnum.virtual: 'virtual',
    LandingCompanyDetailsEnum.vanuatu: 'vanuatu',
    LandingCompanyDetailsEnum.champion: 'champion',
    LandingCompanyDetailsEnum.champion_virtual: 'champion-virtual',
  };
}

// Creating Enums
enum LandingCompanyDetailsEnum {
  iom,
  malta,
  maltainvest,
  svg,
  virtual,
  vanuatu,
  champion,
  champion_virtual,
}
