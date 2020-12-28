/// Trading durations send model class
abstract class TradingDurationsSendModel {
  /// Initializes
  TradingDurationsSendModel({
    @required this.tradingDurations,
    this.landingCompany,
  });

  /// Must be `1`
  final int tradingDurations;

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final LandingCompanyEnum landingCompany;
}

/// Trading durations send class
class TradingDurationsSend extends TradingDurationsSendModel {
  /// Initializes
  TradingDurationsSend({
    @required int tradingDurations,
    String landingCompany,
  }) : super(
          tradingDurations: tradingDurations,
          landingCompany: landingCompany,
        );

  /// Creates an instance from JSON
  factory TradingDurationsSend.fromJson(Map<String, dynamic> json) =>
      TradingDurationsSend(
        tradingDurations: json['trading_durations'],
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

    result['trading_durations'] = tradingDurations;
    result['landing_company'] = landingCompanyEnumMapper[landingCompany];

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradingDurationsSend copyWith({
    int tradingDurations,
    String landingCompany,
  }) =>
      TradingDurationsSend(
        tradingDurations: tradingDurations ?? this.tradingDurations,
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
