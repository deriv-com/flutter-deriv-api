/// Asset index send model class
abstract class AssetIndexSendModel {
  /// Initializes
  AssetIndexSendModel({
    @required this.assetIndex,
    this.landingCompany,
  });

  /// Must be `1`
  final int assetIndex;

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final LandingCompanyEnum landingCompany;
}

/// Asset index send class
class AssetIndexSend extends AssetIndexSendModel {
  /// Initializes
  AssetIndexSend({
    @required int assetIndex,
    String landingCompany,
  }) : super(
          assetIndex: assetIndex,
          landingCompany: landingCompany,
        );

  /// Creates an instance from JSON
  factory AssetIndexSend.fromJson(Map<String, dynamic> json) => AssetIndexSend(
        assetIndex: json['asset_index'],
        landingCompany: json['landing_company'] == null
            ? null
            : landingCompanyEnumMapper.entries
                .firstWhere((entry) => entry.value == json['landing_company'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['asset_index'] = assetIndex;
    result['landing_company'] = landingCompanyEnumMapper[landingCompany];

    return result;
  }

  /// Creates a copy of instance with given parameters
  AssetIndexSend copyWith({
    int assetIndex,
    String landingCompany,
  }) =>
      AssetIndexSend(
        assetIndex: assetIndex ?? this.assetIndex,
        landingCompany: landingCompany ?? this.landingCompany,
      );
  // Creating Enum Mappers

  static final Map<LandingCompanyEnum, String> landingCompanyEnumMapper = {
    LandingCompanyEnum.iom: 'iom',
    LandingCompanyEnum.malta: 'malta',
    LandingCompanyEnum.maltainvest: 'maltainvest',
    LandingCompanyEnum.svg: 'svg',
    LandingCompanyEnum.virtual: 'virtual',
    LandingCompanyEnum.vanuatu: 'vanuatu',
    LandingCompanyEnum.champion: 'champion',
    LandingCompanyEnum.champion_virtual: 'champion-virtual',
  };
}

// Creating Enums

enum LandingCompanyEnum {
  iom,
  malta,
  maltainvest,
  svg,
  virtual,
  vanuatu,
  champion,
  champion_virtual,
}
