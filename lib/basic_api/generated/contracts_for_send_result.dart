/// Contracts for send model class
abstract class ContractsForSendModel {
  /// Initializes
  ContractsForSendModel({
    @required this.contractsFor,
    this.currency,
    this.landingCompany,
    this.productType,
  });

  /// The short symbol name (obtained from `active_symbols` call).
  final String contractsFor;

  /// [Optional] Currency of the contract's stake and payout (obtained from `payout_currencies` call).
  final String currency;

  /// [Optional] Indicates which landing company to get a list of contracts for. If you are logged in, your account's landing company will override this field.
  final LandingCompanyEnum landingCompany;

  /// [Optional] If you specify this field, only contracts tradable through that contract type will be returned.
  final ProductTypeEnum productType;
}

/// Contracts for send class
class ContractsForSend extends ContractsForSendModel {
  /// Initializes
  ContractsForSend({
    @required String contractsFor,
    String currency,
    String landingCompany,
    String productType,
  }) : super(
          contractsFor: contractsFor,
          currency: currency,
          landingCompany: landingCompany,
          productType: productType,
        );

  /// Creates an instance from JSON
  factory ContractsForSend.fromJson(Map<String, dynamic> json) =>
      ContractsForSend(
        contractsFor: json['contracts_for'],
        currency: json['currency'],
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

    result['contracts_for'] = contractsFor;
    result['currency'] = currency;
    result['landing_company'] = landingCompanyEnumMapper[landingCompany];
    result['product_type'] = productTypeEnumMapper[productType];

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractsForSend copyWith({
    String contractsFor,
    String currency,
    String landingCompany,
    String productType,
  }) =>
      ContractsForSend(
        contractsFor: contractsFor ?? this.contractsFor,
        currency: currency ?? this.currency,
        landingCompany: landingCompany ?? this.landingCompany,
        productType: productType ?? this.productType,
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

  static final Map<ProductTypeEnum, String> productTypeEnumMapper = {
    ProductTypeEnum.basic: 'basic',
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

enum ProductTypeEnum {
  basic,
}
