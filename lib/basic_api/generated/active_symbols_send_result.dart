/// Active symbols send model class
abstract class ActiveSymbolsSendModel {
  /// Initializes
  ActiveSymbolsSendModel({
    @required this.activeSymbols,
    this.landingCompany,
    this.productType,
  });

  /// If you use `brief`, only a subset of fields will be returned.
  final ActiveSymbolsEnum activeSymbols;

  /// [Optional] If you specify this field, only symbols available for trading by that landing company will be returned. If you are logged in, only symbols available for trading by your landing company will be returned regardless of what you specify in this field.
  final LandingCompanyEnum landingCompany;

  /// [Optional] If you specify this field, only symbols that can be traded through that product type will be returned.
  final ProductTypeEnum productType;
}

/// Active symbols send class
class ActiveSymbolsSend extends ActiveSymbolsSendModel {
  /// Initializes
  ActiveSymbolsSend({
    @required String activeSymbols,
    String landingCompany,
    String productType,
  }) : super(
          activeSymbols: activeSymbols,
          landingCompany: landingCompany,
          productType: productType,
        );

  /// Creates an instance from JSON
  factory ActiveSymbolsSend.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsSend(
        activeSymbols: json['active_symbols'] == null
            ? null
            : activeSymbolsEnumMapper.entries
                .firstWhere((entry) => entry.value == json['active_symbols'],
                    orElse: () => null)
                ?.key,
        landingCompany: json['landing_company'] == null
            ? null
            : landingCompanyEnumMapper.entries
                .firstWhere((entry) => entry.value == json['landing_company'],
                    orElse: () => null)
                ?.key,
        productType: json['product_type'] == null
            ? null
            : productTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['product_type'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['active_symbols'] = activeSymbolsEnumMapper[activeSymbols];
    result['landing_company'] = landingCompanyEnumMapper[landingCompany];
    result['product_type'] = productTypeEnumMapper[productType];

    return result;
  }

  /// Creates a copy of instance with given parameters
  ActiveSymbolsSend copyWith({
    String activeSymbols,
    String landingCompany,
    String productType,
  }) =>
      ActiveSymbolsSend(
        activeSymbols: activeSymbols ?? this.activeSymbols,
        landingCompany: landingCompany ?? this.landingCompany,
        productType: productType ?? this.productType,
      );
  // Creating Enum Mappers
  static final Map<ActiveSymbolsEnum, String> activeSymbolsEnumMapper = {
    ActiveSymbolsEnum.brief: 'brief',
    ActiveSymbolsEnum.full: 'full',
  };

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

  static final Map<ProductTypeEnum, String> productTypeEnumMapper = {
    ProductTypeEnum.basic: 'basic',
  };
}

// Creating Enums
enum ActiveSymbolsEnum {
  brief,
  full,
}

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

enum ProductTypeEnum {
  basic,
}
