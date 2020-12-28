/// The model model class
abstract class TheModelModel {
  /// Initializes
  TheModelModel({
    @required this.setFinancialAssessment,
    this.accountTurnover,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdTradingExperience,
    this.cfdTradingFrequency,
    @required this.educationLevel,
    @required this.employmentIndustry,
    this.employmentStatus,
    @required this.estimatedWorth,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    @required this.incomeSource,
    @required this.netIncome,
    @required this.occupation,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.sourceOfWealth,
  });

  /// Must be `1`
  final int setFinancialAssessment;

  /// [Optional] The anticipated account turnover.
  final AccountTurnoverEnum accountTurnover;

  /// [Optional] Binary options trading experience.
  final BinaryOptionsTradingExperienceEnum binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  final BinaryOptionsTradingFrequencyEnum binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  final CfdTradingExperienceEnum cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  final CfdTradingFrequencyEnum cfdTradingFrequency;

  /// Level of Education.
  final EducationLevelEnum educationLevel;

  /// Industry of Employment.
  final EmploymentIndustryEnum employmentIndustry;

  /// [Optional] Employment Status.
  final EmploymentStatusEnum employmentStatus;

  /// Estimated Net Worth.
  final EstimatedWorthEnum estimatedWorth;

  /// [Optional] Forex trading experience.
  final ForexTradingExperienceEnum forexTradingExperience;

  /// [Optional] Forex trading frequency.
  final ForexTradingFrequencyEnum forexTradingFrequency;

  /// Income Source.
  final IncomeSourceEnum incomeSource;

  /// Net Annual Income.
  final NetIncomeEnum netIncome;

  /// Occupation.
  final OccupationEnum occupation;

  /// [Optional] Trading experience in other financial instruments.
  final OtherInstrumentsTradingExperienceEnum otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  final OtherInstrumentsTradingFrequencyEnum otherInstrumentsTradingFrequency;

  /// [Optional] Source of wealth.
  final SourceOfWealthEnum sourceOfWealth;
}

/// The model class
class TheModel extends TheModelModel {
  /// Initializes
  TheModel({
    @required int setFinancialAssessment,
    String accountTurnover,
    String binaryOptionsTradingExperience,
    String binaryOptionsTradingFrequency,
    String cfdTradingExperience,
    String cfdTradingFrequency,
    @required String educationLevel,
    @required String employmentIndustry,
    String employmentStatus,
    @required String estimatedWorth,
    String forexTradingExperience,
    String forexTradingFrequency,
    @required String incomeSource,
    @required String netIncome,
    @required String occupation,
    String otherInstrumentsTradingExperience,
    String otherInstrumentsTradingFrequency,
    String sourceOfWealth,
  }) : super(
          setFinancialAssessment: setFinancialAssessment,
          accountTurnover: accountTurnover,
          binaryOptionsTradingExperience: binaryOptionsTradingExperience,
          binaryOptionsTradingFrequency: binaryOptionsTradingFrequency,
          cfdTradingExperience: cfdTradingExperience,
          cfdTradingFrequency: cfdTradingFrequency,
          educationLevel: educationLevel,
          employmentIndustry: employmentIndustry,
          employmentStatus: employmentStatus,
          estimatedWorth: estimatedWorth,
          forexTradingExperience: forexTradingExperience,
          forexTradingFrequency: forexTradingFrequency,
          incomeSource: incomeSource,
          netIncome: netIncome,
          occupation: occupation,
          otherInstrumentsTradingExperience: otherInstrumentsTradingExperience,
          otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency,
          sourceOfWealth: sourceOfWealth,
        );

  /// Creates an instance from JSON
  factory TheModel.fromJson(Map<String, dynamic> json) => TheModel(
        setFinancialAssessment: json['set_financial_assessment'],
        accountTurnover: json['account_turnover'] == null
            ? null
            : accountTurnoverEnumMapper.entries
                .firstWhere((entry) => entry.value == json['account_turnover'],
                    orElse: () => null)
                ?.key,
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'] == null
                ? null
                : binaryOptionsTradingExperienceEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['binary_options_trading_experience'],
                        orElse: () => null)
                    ?.key,
        binaryOptionsTradingFrequency:
            json['binary_options_trading_frequency'] == null
                ? null
                : binaryOptionsTradingFrequencyEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['binary_options_trading_frequency'],
                        orElse: () => null)
                    ?.key,
        cfdTradingExperience: json['cfd_trading_experience'] == null
            ? null
            : cfdTradingExperienceEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['cfd_trading_experience'],
                    orElse: () => null)
                ?.key,
        cfdTradingFrequency: json['cfd_trading_frequency'] == null
            ? null
            : cfdTradingFrequencyEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['cfd_trading_frequency'],
                    orElse: () => null)
                ?.key,
        educationLevel: json['education_level'] == null
            ? null
            : educationLevelEnumMapper.entries
                .firstWhere((entry) => entry.value == json['education_level'],
                    orElse: () => null)
                ?.key,
        employmentIndustry: json['employment_industry'] == null
            ? null
            : employmentIndustryEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['employment_industry'],
                    orElse: () => null)
                ?.key,
        employmentStatus: json['employment_status'] == null
            ? null
            : employmentStatusEnumMapper.entries
                .firstWhere((entry) => entry.value == json['employment_status'],
                    orElse: () => null)
                ?.key,
        estimatedWorth: json['estimated_worth'] == null
            ? null
            : estimatedWorthEnumMapper.entries
                .firstWhere((entry) => entry.value == json['estimated_worth'],
                    orElse: () => null)
                ?.key,
        forexTradingExperience: json['forex_trading_experience'] == null
            ? null
            : forexTradingExperienceEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['forex_trading_experience'],
                    orElse: () => null)
                ?.key,
        forexTradingFrequency: json['forex_trading_frequency'] == null
            ? null
            : forexTradingFrequencyEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['forex_trading_frequency'],
                    orElse: () => null)
                ?.key,
        incomeSource: json['income_source'] == null
            ? null
            : incomeSourceEnumMapper.entries
                .firstWhere((entry) => entry.value == json['income_source'],
                    orElse: () => null)
                ?.key,
        netIncome: json['net_income'] == null
            ? null
            : netIncomeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['net_income'],
                    orElse: () => null)
                ?.key,
        occupation: json['occupation'] == null
            ? null
            : occupationEnumMapper.entries
                .firstWhere((entry) => entry.value == json['occupation'],
                    orElse: () => null)
                ?.key,
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'] == null
                ? null
                : otherInstrumentsTradingExperienceEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['other_instruments_trading_experience'],
                        orElse: () => null)
                    ?.key,
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'] == null
                ? null
                : otherInstrumentsTradingFrequencyEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['other_instruments_trading_frequency'],
                        orElse: () => null)
                    ?.key,
        sourceOfWealth: json['source_of_wealth'] == null
            ? null
            : sourceOfWealthEnumMapper.entries
                .firstWhere((entry) => entry.value == json['source_of_wealth'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_financial_assessment'] = setFinancialAssessment;
    result['account_turnover'] = accountTurnoverEnumMapper[accountTurnover];
    result['binary_options_trading_experience'] =
        binaryOptionsTradingExperienceEnumMapper[
            binaryOptionsTradingExperience];
    result['binary_options_trading_frequency'] =
        binaryOptionsTradingFrequencyEnumMapper[binaryOptionsTradingFrequency];
    result['cfd_trading_experience'] =
        cfdTradingExperienceEnumMapper[cfdTradingExperience];
    result['cfd_trading_frequency'] =
        cfdTradingFrequencyEnumMapper[cfdTradingFrequency];
    result['education_level'] = educationLevelEnumMapper[educationLevel];
    result['employment_industry'] =
        employmentIndustryEnumMapper[employmentIndustry];
    result['employment_status'] = employmentStatusEnumMapper[employmentStatus];
    result['estimated_worth'] = estimatedWorthEnumMapper[estimatedWorth];
    result['forex_trading_experience'] =
        forexTradingExperienceEnumMapper[forexTradingExperience];
    result['forex_trading_frequency'] =
        forexTradingFrequencyEnumMapper[forexTradingFrequency];
    result['income_source'] = incomeSourceEnumMapper[incomeSource];
    result['net_income'] = netIncomeEnumMapper[netIncome];
    result['occupation'] = occupationEnumMapper[occupation];
    result['other_instruments_trading_experience'] =
        otherInstrumentsTradingExperienceEnumMapper[
            otherInstrumentsTradingExperience];
    result['other_instruments_trading_frequency'] =
        otherInstrumentsTradingFrequencyEnumMapper[
            otherInstrumentsTradingFrequency];
    result['source_of_wealth'] = sourceOfWealthEnumMapper[sourceOfWealth];

    return result;
  }

  /// Creates a copy of instance with given parameters
  TheModel copyWith({
    int setFinancialAssessment,
    String accountTurnover,
    String binaryOptionsTradingExperience,
    String binaryOptionsTradingFrequency,
    String cfdTradingExperience,
    String cfdTradingFrequency,
    String educationLevel,
    String employmentIndustry,
    String employmentStatus,
    String estimatedWorth,
    String forexTradingExperience,
    String forexTradingFrequency,
    String incomeSource,
    String netIncome,
    String occupation,
    String otherInstrumentsTradingExperience,
    String otherInstrumentsTradingFrequency,
    String sourceOfWealth,
  }) =>
      TheModel(
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
        accountTurnover: accountTurnover ?? this.accountTurnover,
        binaryOptionsTradingExperience: binaryOptionsTradingExperience ??
            this.binaryOptionsTradingExperience,
        binaryOptionsTradingFrequency:
            binaryOptionsTradingFrequency ?? this.binaryOptionsTradingFrequency,
        cfdTradingExperience: cfdTradingExperience ?? this.cfdTradingExperience,
        cfdTradingFrequency: cfdTradingFrequency ?? this.cfdTradingFrequency,
        educationLevel: educationLevel ?? this.educationLevel,
        employmentIndustry: employmentIndustry ?? this.employmentIndustry,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        estimatedWorth: estimatedWorth ?? this.estimatedWorth,
        forexTradingExperience:
            forexTradingExperience ?? this.forexTradingExperience,
        forexTradingFrequency:
            forexTradingFrequency ?? this.forexTradingFrequency,
        incomeSource: incomeSource ?? this.incomeSource,
        netIncome: netIncome ?? this.netIncome,
        occupation: occupation ?? this.occupation,
        otherInstrumentsTradingExperience: otherInstrumentsTradingExperience ??
            this.otherInstrumentsTradingExperience,
        otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency ??
            this.otherInstrumentsTradingFrequency,
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
      );
  // Creating Enum Mappers

  static final Map<AccountTurnoverEnum, String> accountTurnoverEnumMapper = {
    AccountTurnoverEnum.less_than_$25000: r'Less than $25,000',
    AccountTurnoverEnum.$25000_$50000: r'$25,000 - $50,000',
    AccountTurnoverEnum.$50001_$100000: r'$50,001 - $100,000',
    AccountTurnoverEnum.$100001_$500000: r'$100,001 - $500,000',
    AccountTurnoverEnum.over_$500000: r'Over $500,000',
  };

  static final Map<BinaryOptionsTradingExperienceEnum, String>
      binaryOptionsTradingExperienceEnumMapper = {
    BinaryOptionsTradingExperienceEnum.jamshid0_1_year: r'0-1 year',
    BinaryOptionsTradingExperienceEnum.jamshid1_2_years: r'1-2 years',
    BinaryOptionsTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<BinaryOptionsTradingFrequencyEnum, String>
      binaryOptionsTradingFrequencyEnumMapper = {
    BinaryOptionsTradingFrequencyEnum
            .jamshid0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    BinaryOptionsTradingFrequencyEnum
            .jamshid6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    BinaryOptionsTradingFrequencyEnum
            .jamshid11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    BinaryOptionsTradingFrequencyEnum
            .jamshid40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<CfdTradingExperienceEnum, String>
      cfdTradingExperienceEnumMapper = {
    CfdTradingExperienceEnum.jamshid0_1_year: r'0-1 year',
    CfdTradingExperienceEnum.jamshid1_2_years: r'1-2 years',
    CfdTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<CfdTradingFrequencyEnum, String>
      cfdTradingFrequencyEnumMapper = {
    CfdTradingFrequencyEnum.jamshid0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    CfdTradingFrequencyEnum.jamshid6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    CfdTradingFrequencyEnum.jamshid11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    CfdTradingFrequencyEnum
            .jamshid40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<EducationLevelEnum, String> educationLevelEnumMapper = {
    EducationLevelEnum.primary: r'Primary',
    EducationLevelEnum.secondary: r'Secondary',
    EducationLevelEnum.tertiary: r'Tertiary',
  };

  static final Map<EmploymentIndustryEnum, String>
      employmentIndustryEnumMapper = {
    EmploymentIndustryEnum.construction: r'Construction',
    EmploymentIndustryEnum.education: r'Education',
    EmploymentIndustryEnum.finance: r'Finance',
    EmploymentIndustryEnum.health: r'Health',
    EmploymentIndustryEnum.tourism: r'Tourism',
    EmploymentIndustryEnum.information__communications_technology:
        r'Information & Communications Technology',
    EmploymentIndustryEnum.science__engineering: r'Science & Engineering',
    EmploymentIndustryEnum.legal: r'Legal',
    EmploymentIndustryEnum.social__cultural: r'Social & Cultural',
    EmploymentIndustryEnum.agriculture: r'Agriculture',
    EmploymentIndustryEnum.real_estate: r'Real Estate',
    EmploymentIndustryEnum.food_services: r'Food Services',
    EmploymentIndustryEnum.manufacturing: r'Manufacturing',
    EmploymentIndustryEnum.unemployed: r'Unemployed',
  };

  static final Map<EmploymentStatusEnum, String> employmentStatusEnumMapper = {
    EmploymentStatusEnum.employed: r'Employed',
    EmploymentStatusEnum.pensioner: r'Pensioner',
    EmploymentStatusEnum.self_employed: r'Self-Employed',
    EmploymentStatusEnum.student: r'Student',
    EmploymentStatusEnum.unemployed: r'Unemployed',
  };

  static final Map<EstimatedWorthEnum, String> estimatedWorthEnumMapper = {
    EstimatedWorthEnum.less_than_$100000: r'Less than $100,000',
    EstimatedWorthEnum.$100000_$250000: r'$100,000 - $250,000',
    EstimatedWorthEnum.$250001_$500000: r'$250,001 - $500,000',
    EstimatedWorthEnum.$500001_$1000000: r'$500,001 - $1,000,000',
    EstimatedWorthEnum.over_$1000000: r'Over $1,000,000',
  };

  static final Map<ForexTradingExperienceEnum, String>
      forexTradingExperienceEnumMapper = {
    ForexTradingExperienceEnum.jamshid0_1_year: r'0-1 year',
    ForexTradingExperienceEnum.jamshid1_2_years: r'1-2 years',
    ForexTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<ForexTradingFrequencyEnum, String>
      forexTradingFrequencyEnumMapper = {
    ForexTradingFrequencyEnum.jamshid0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    ForexTradingFrequencyEnum.jamshid6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    ForexTradingFrequencyEnum.jamshid11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    ForexTradingFrequencyEnum
            .jamshid40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<IncomeSourceEnum, String> incomeSourceEnumMapper = {
    IncomeSourceEnum.salaried_employee: r'Salaried Employee',
    IncomeSourceEnum.self_employed: r'Self-Employed',
    IncomeSourceEnum.investments__dividends: r'Investments & Dividends',
    IncomeSourceEnum.pension: r'Pension',
    IncomeSourceEnum.state_benefits: r'State Benefits',
    IncomeSourceEnum.savings__inheritance: r'Savings & Inheritance',
  };

  static final Map<NetIncomeEnum, String> netIncomeEnumMapper = {
    NetIncomeEnum.less_than_$25000: r'Less than $25,000',
    NetIncomeEnum.$25000_$50000: r'$25,000 - $50,000',
    NetIncomeEnum.$50001_$100000: r'$50,001 - $100,000',
    NetIncomeEnum.$100001_$500000: r'$100,001 - $500,000',
    NetIncomeEnum.over_$500000: r'Over $500,000',
  };

  static final Map<OccupationEnum, String> occupationEnumMapper = {
    OccupationEnum.chief_executives_senior_officials_and_legislators:
        r'Chief Executives, Senior Officials and Legislators',
    OccupationEnum.managers: r'Managers',
    OccupationEnum.professionals: r'Professionals',
    OccupationEnum.clerks: r'Clerks',
    OccupationEnum.personal_care_sales_and_service_workers:
        r'Personal Care, Sales and Service Workers',
    OccupationEnum.agricultural_forestry_and_fishery_workers:
        r'Agricultural, Forestry and Fishery Workers',
    OccupationEnum.craft_metal_electrical_and_electronics_workers:
        r'Craft, Metal, Electrical and Electronics Workers',
    OccupationEnum.plant_and_machine_operators_and_assemblers:
        r'Plant and Machine Operators and Assemblers',
    OccupationEnum.cleaners_and_helpers: r'Cleaners and Helpers',
    OccupationEnum.mining_construction_manufacturing_and_transport_workers:
        r'Mining, Construction, Manufacturing and Transport Workers',
    OccupationEnum.armed_forces: r'Armed Forces',
    OccupationEnum.government_officers: r'Government Officers',
    OccupationEnum.students: r'Students',
    OccupationEnum.unemployed: r'Unemployed',
  };

  static final Map<OtherInstrumentsTradingExperienceEnum, String>
      otherInstrumentsTradingExperienceEnumMapper = {
    OtherInstrumentsTradingExperienceEnum.jamshid0_1_year: r'0-1 year',
    OtherInstrumentsTradingExperienceEnum.jamshid1_2_years: r'1-2 years',
    OtherInstrumentsTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<OtherInstrumentsTradingFrequencyEnum, String>
      otherInstrumentsTradingFrequencyEnumMapper = {
    OtherInstrumentsTradingFrequencyEnum
            .jamshid0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    OtherInstrumentsTradingFrequencyEnum
            .jamshid6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    OtherInstrumentsTradingFrequencyEnum
            .jamshid11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    OtherInstrumentsTradingFrequencyEnum
            .jamshid40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<SourceOfWealthEnum, String> sourceOfWealthEnumMapper = {
    SourceOfWealthEnum.accumulation_of_income_savings:
        r'Accumulation of Income/Savings',
    SourceOfWealthEnum.cash_business: r'Cash Business',
    SourceOfWealthEnum.company_ownership: r'Company Ownership',
    SourceOfWealthEnum.divorce_settlement: r'Divorce Settlement',
    SourceOfWealthEnum.inheritance: r'Inheritance',
    SourceOfWealthEnum.investment_income: r'Investment Income',
    SourceOfWealthEnum.sale_of_property: r'Sale of Property',
  };
}

// Creating Enums

enum AccountTurnoverEnum {
  less_than_$25000,
  $25000_$50000,
  $50001_$100000,
  $100001_$500000,
  over_$500000,
}

enum BinaryOptionsTradingExperienceEnum {
  jamshid0_1_year,
  jamshid1_2_years,
  over_3_years,
}

enum BinaryOptionsTradingFrequencyEnum {
  jamshid0_5_transactions_in_the_past_12_months,
  jamshid6_10_transactions_in_the_past_12_months,
  jamshid11_39_transactions_in_the_past_12_months,
  jamshid40_transactions_or_more_in_the_past_12_months,
}

enum CfdTradingExperienceEnum {
  jamshid0_1_year,
  jamshid1_2_years,
  over_3_years,
}

enum CfdTradingFrequencyEnum {
  jamshid0_5_transactions_in_the_past_12_months,
  jamshid6_10_transactions_in_the_past_12_months,
  jamshid11_39_transactions_in_the_past_12_months,
  jamshid40_transactions_or_more_in_the_past_12_months,
}

enum EducationLevelEnum {
  primary,
  secondary,
  tertiary,
}

enum EmploymentIndustryEnum {
  construction,
  education,
  finance,
  health,
  tourism,
  information__communications_technology,
  science__engineering,
  legal,
  social__cultural,
  agriculture,
  real_estate,
  food_services,
  manufacturing,
  unemployed,
}

enum EmploymentStatusEnum {
  employed,
  pensioner,
  self_employed,
  student,
  unemployed,
}

enum EstimatedWorthEnum {
  less_than_$100000,
  $100000_$250000,
  $250001_$500000,
  $500001_$1000000,
  over_$1000000,
}

enum ForexTradingExperienceEnum {
  jamshid0_1_year,
  jamshid1_2_years,
  over_3_years,
}

enum ForexTradingFrequencyEnum {
  jamshid0_5_transactions_in_the_past_12_months,
  jamshid6_10_transactions_in_the_past_12_months,
  jamshid11_39_transactions_in_the_past_12_months,
  jamshid40_transactions_or_more_in_the_past_12_months,
}

enum IncomeSourceEnum {
  salaried_employee,
  self_employed,
  investments__dividends,
  pension,
  state_benefits,
  savings__inheritance,
}

enum NetIncomeEnum {
  less_than_$25000,
  $25000_$50000,
  $50001_$100000,
  $100001_$500000,
  over_$500000,
}

enum OccupationEnum {
  chief_executives_senior_officials_and_legislators,
  managers,
  professionals,
  clerks,
  personal_care_sales_and_service_workers,
  agricultural_forestry_and_fishery_workers,
  craft_metal_electrical_and_electronics_workers,
  plant_and_machine_operators_and_assemblers,
  cleaners_and_helpers,
  mining_construction_manufacturing_and_transport_workers,
  armed_forces,
  government_officers,
  students,
  unemployed,
}

enum OtherInstrumentsTradingExperienceEnum {
  jamshid0_1_year,
  jamshid1_2_years,
  over_3_years,
}

enum OtherInstrumentsTradingFrequencyEnum {
  jamshid0_5_transactions_in_the_past_12_months,
  jamshid6_10_transactions_in_the_past_12_months,
  jamshid11_39_transactions_in_the_past_12_months,
  jamshid40_transactions_or_more_in_the_past_12_months,
}

enum SourceOfWealthEnum {
  accumulation_of_income_savings,
  cash_business,
  company_ownership,
  divorce_settlement,
  inheritance,
  investment_income,
  sale_of_property,
}
/// The model model class
abstract class TheModelModel {
  /// Initializes
  TheModelModel({
    @required this.setFinancialAssessment,
    this.accountTurnover,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdTradingExperience,
    this.cfdTradingFrequency,
    @required this.educationLevel,
    @required this.employmentIndustry,
    this.employmentStatus,
    @required this.estimatedWorth,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    @required this.incomeSource,
    @required this.netIncome,
    @required this.occupation,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.sourceOfWealth,
  });

  /// Must be `1`
  final int setFinancialAssessment;

  /// [Optional] The anticipated account turnover.
  final AccountTurnoverEnum accountTurnover;

  /// [Optional] Binary options trading experience.
  final BinaryOptionsTradingExperienceEnum binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  final BinaryOptionsTradingFrequencyEnum binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  final CfdTradingExperienceEnum cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  final CfdTradingFrequencyEnum cfdTradingFrequency;

  /// Level of Education.
  final EducationLevelEnum educationLevel;

  /// Industry of Employment.
  final EmploymentIndustryEnum employmentIndustry;

  /// [Optional] Employment Status.
  final EmploymentStatusEnum employmentStatus;

  /// Estimated Net Worth.
  final EstimatedWorthEnum estimatedWorth;

  /// [Optional] Forex trading experience.
  final ForexTradingExperienceEnum forexTradingExperience;

  /// [Optional] Forex trading frequency.
  final ForexTradingFrequencyEnum forexTradingFrequency;

  /// Income Source.
  final IncomeSourceEnum incomeSource;

  /// Net Annual Income.
  final NetIncomeEnum netIncome;

  /// Occupation.
  final OccupationEnum occupation;

  /// [Optional] Trading experience in other financial instruments.
  final OtherInstrumentsTradingExperienceEnum otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  final OtherInstrumentsTradingFrequencyEnum otherInstrumentsTradingFrequency;

  /// [Optional] Source of wealth.
  final SourceOfWealthEnum sourceOfWealth;
}

/// The model class
class TheModel extends TheModelModel {
  /// Initializes
  TheModel({
    @required int setFinancialAssessment,
    String accountTurnover,
    String binaryOptionsTradingExperience,
    String binaryOptionsTradingFrequency,
    String cfdTradingExperience,
    String cfdTradingFrequency,
    @required String educationLevel,
    @required String employmentIndustry,
    String employmentStatus,
    @required String estimatedWorth,
    String forexTradingExperience,
    String forexTradingFrequency,
    @required String incomeSource,
    @required String netIncome,
    @required String occupation,
    String otherInstrumentsTradingExperience,
    String otherInstrumentsTradingFrequency,
    String sourceOfWealth,
  }) : super(
          setFinancialAssessment: setFinancialAssessment,
          accountTurnover: accountTurnover,
          binaryOptionsTradingExperience: binaryOptionsTradingExperience,
          binaryOptionsTradingFrequency: binaryOptionsTradingFrequency,
          cfdTradingExperience: cfdTradingExperience,
          cfdTradingFrequency: cfdTradingFrequency,
          educationLevel: educationLevel,
          employmentIndustry: employmentIndustry,
          employmentStatus: employmentStatus,
          estimatedWorth: estimatedWorth,
          forexTradingExperience: forexTradingExperience,
          forexTradingFrequency: forexTradingFrequency,
          incomeSource: incomeSource,
          netIncome: netIncome,
          occupation: occupation,
          otherInstrumentsTradingExperience: otherInstrumentsTradingExperience,
          otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency,
          sourceOfWealth: sourceOfWealth,
        );

  /// Creates an instance from JSON
  factory TheModel.fromJson(Map<String, dynamic> json) => TheModel(
        setFinancialAssessment: json['set_financial_assessment'],
        accountTurnover: json['account_turnover'] == null
            ? null
            : accountTurnoverEnumMapper.entries
                .firstWhere((entry) => entry.value == json['account_turnover'],
                    orElse: () => null)
                ?.key,
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'] == null
                ? null
                : binaryOptionsTradingExperienceEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['binary_options_trading_experience'],
                        orElse: () => null)
                    ?.key,
        binaryOptionsTradingFrequency:
            json['binary_options_trading_frequency'] == null
                ? null
                : binaryOptionsTradingFrequencyEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['binary_options_trading_frequency'],
                        orElse: () => null)
                    ?.key,
        cfdTradingExperience: json['cfd_trading_experience'] == null
            ? null
            : cfdTradingExperienceEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['cfd_trading_experience'],
                    orElse: () => null)
                ?.key,
        cfdTradingFrequency: json['cfd_trading_frequency'] == null
            ? null
            : cfdTradingFrequencyEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['cfd_trading_frequency'],
                    orElse: () => null)
                ?.key,
        educationLevel: json['education_level'] == null
            ? null
            : educationLevelEnumMapper.entries
                .firstWhere((entry) => entry.value == json['education_level'],
                    orElse: () => null)
                ?.key,
        employmentIndustry: json['employment_industry'] == null
            ? null
            : employmentIndustryEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['employment_industry'],
                    orElse: () => null)
                ?.key,
        employmentStatus: json['employment_status'] == null
            ? null
            : employmentStatusEnumMapper.entries
                .firstWhere((entry) => entry.value == json['employment_status'],
                    orElse: () => null)
                ?.key,
        estimatedWorth: json['estimated_worth'] == null
            ? null
            : estimatedWorthEnumMapper.entries
                .firstWhere((entry) => entry.value == json['estimated_worth'],
                    orElse: () => null)
                ?.key,
        forexTradingExperience: json['forex_trading_experience'] == null
            ? null
            : forexTradingExperienceEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['forex_trading_experience'],
                    orElse: () => null)
                ?.key,
        forexTradingFrequency: json['forex_trading_frequency'] == null
            ? null
            : forexTradingFrequencyEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['forex_trading_frequency'],
                    orElse: () => null)
                ?.key,
        incomeSource: json['income_source'] == null
            ? null
            : incomeSourceEnumMapper.entries
                .firstWhere((entry) => entry.value == json['income_source'],
                    orElse: () => null)
                ?.key,
        netIncome: json['net_income'] == null
            ? null
            : netIncomeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['net_income'],
                    orElse: () => null)
                ?.key,
        occupation: json['occupation'] == null
            ? null
            : occupationEnumMapper.entries
                .firstWhere((entry) => entry.value == json['occupation'],
                    orElse: () => null)
                ?.key,
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'] == null
                ? null
                : otherInstrumentsTradingExperienceEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['other_instruments_trading_experience'],
                        orElse: () => null)
                    ?.key,
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'] == null
                ? null
                : otherInstrumentsTradingFrequencyEnumMapper.entries
                    .firstWhere(
                        (entry) =>
                            entry.value ==
                            json['other_instruments_trading_frequency'],
                        orElse: () => null)
                    ?.key,
        sourceOfWealth: json['source_of_wealth'] == null
            ? null
            : sourceOfWealthEnumMapper.entries
                .firstWhere((entry) => entry.value == json['source_of_wealth'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_financial_assessment'] = setFinancialAssessment;
    result['account_turnover'] = accountTurnoverEnumMapper[accountTurnover];
    result['binary_options_trading_experience'] =
        binaryOptionsTradingExperienceEnumMapper[
            binaryOptionsTradingExperience];
    result['binary_options_trading_frequency'] =
        binaryOptionsTradingFrequencyEnumMapper[binaryOptionsTradingFrequency];
    result['cfd_trading_experience'] =
        cfdTradingExperienceEnumMapper[cfdTradingExperience];
    result['cfd_trading_frequency'] =
        cfdTradingFrequencyEnumMapper[cfdTradingFrequency];
    result['education_level'] = educationLevelEnumMapper[educationLevel];
    result['employment_industry'] =
        employmentIndustryEnumMapper[employmentIndustry];
    result['employment_status'] = employmentStatusEnumMapper[employmentStatus];
    result['estimated_worth'] = estimatedWorthEnumMapper[estimatedWorth];
    result['forex_trading_experience'] =
        forexTradingExperienceEnumMapper[forexTradingExperience];
    result['forex_trading_frequency'] =
        forexTradingFrequencyEnumMapper[forexTradingFrequency];
    result['income_source'] = incomeSourceEnumMapper[incomeSource];
    result['net_income'] = netIncomeEnumMapper[netIncome];
    result['occupation'] = occupationEnumMapper[occupation];
    result['other_instruments_trading_experience'] =
        otherInstrumentsTradingExperienceEnumMapper[
            otherInstrumentsTradingExperience];
    result['other_instruments_trading_frequency'] =
        otherInstrumentsTradingFrequencyEnumMapper[
            otherInstrumentsTradingFrequency];
    result['source_of_wealth'] = sourceOfWealthEnumMapper[sourceOfWealth];

    return result;
  }

  /// Creates a copy of instance with given parameters
  TheModel copyWith({
    int setFinancialAssessment,
    String accountTurnover,
    String binaryOptionsTradingExperience,
    String binaryOptionsTradingFrequency,
    String cfdTradingExperience,
    String cfdTradingFrequency,
    String educationLevel,
    String employmentIndustry,
    String employmentStatus,
    String estimatedWorth,
    String forexTradingExperience,
    String forexTradingFrequency,
    String incomeSource,
    String netIncome,
    String occupation,
    String otherInstrumentsTradingExperience,
    String otherInstrumentsTradingFrequency,
    String sourceOfWealth,
  }) =>
      TheModel(
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
        accountTurnover: accountTurnover ?? this.accountTurnover,
        binaryOptionsTradingExperience: binaryOptionsTradingExperience ??
            this.binaryOptionsTradingExperience,
        binaryOptionsTradingFrequency:
            binaryOptionsTradingFrequency ?? this.binaryOptionsTradingFrequency,
        cfdTradingExperience: cfdTradingExperience ?? this.cfdTradingExperience,
        cfdTradingFrequency: cfdTradingFrequency ?? this.cfdTradingFrequency,
        educationLevel: educationLevel ?? this.educationLevel,
        employmentIndustry: employmentIndustry ?? this.employmentIndustry,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        estimatedWorth: estimatedWorth ?? this.estimatedWorth,
        forexTradingExperience:
            forexTradingExperience ?? this.forexTradingExperience,
        forexTradingFrequency:
            forexTradingFrequency ?? this.forexTradingFrequency,
        incomeSource: incomeSource ?? this.incomeSource,
        netIncome: netIncome ?? this.netIncome,
        occupation: occupation ?? this.occupation,
        otherInstrumentsTradingExperience: otherInstrumentsTradingExperience ??
            this.otherInstrumentsTradingExperience,
        otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency ??
            this.otherInstrumentsTradingFrequency,
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
      );
  // Creating Enum Mappers

  static final Map<AccountTurnoverEnum, String> accountTurnoverEnumMapper = {
    AccountTurnoverEnum.less_than_$25000: r'Less than $25,000',
    AccountTurnoverEnum.$25000_$50000: r'$25,000 - $50,000',
    AccountTurnoverEnum.$50001_$100000: r'$50,001 - $100,000',
    AccountTurnoverEnum.$100001_$500000: r'$100,001 - $500,000',
    AccountTurnoverEnum.over_$500000: r'Over $500,000',
  };

  static final Map<BinaryOptionsTradingExperienceEnum, String>
      binaryOptionsTradingExperienceEnumMapper = {
    BinaryOptionsTradingExperienceEnum._0_1_year: r'0-1 year',
    BinaryOptionsTradingExperienceEnum._1_2_years: r'1-2 years',
    BinaryOptionsTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<BinaryOptionsTradingFrequencyEnum, String>
      binaryOptionsTradingFrequencyEnumMapper = {
    BinaryOptionsTradingFrequencyEnum._0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    BinaryOptionsTradingFrequencyEnum._6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    BinaryOptionsTradingFrequencyEnum._11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    BinaryOptionsTradingFrequencyEnum
            ._40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<CfdTradingExperienceEnum, String>
      cfdTradingExperienceEnumMapper = {
    CfdTradingExperienceEnum._0_1_year: r'0-1 year',
    CfdTradingExperienceEnum._1_2_years: r'1-2 years',
    CfdTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<CfdTradingFrequencyEnum, String>
      cfdTradingFrequencyEnumMapper = {
    CfdTradingFrequencyEnum._0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    CfdTradingFrequencyEnum._6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    CfdTradingFrequencyEnum._11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    CfdTradingFrequencyEnum._40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<EducationLevelEnum, String> educationLevelEnumMapper = {
    EducationLevelEnum.primary: r'Primary',
    EducationLevelEnum.secondary: r'Secondary',
    EducationLevelEnum.tertiary: r'Tertiary',
  };

  static final Map<EmploymentIndustryEnum, String>
      employmentIndustryEnumMapper = {
    EmploymentIndustryEnum.construction: r'Construction',
    EmploymentIndustryEnum.education: r'Education',
    EmploymentIndustryEnum.finance: r'Finance',
    EmploymentIndustryEnum.health: r'Health',
    EmploymentIndustryEnum.tourism: r'Tourism',
    EmploymentIndustryEnum.information__communications_technology:
        r'Information & Communications Technology',
    EmploymentIndustryEnum.science__engineering: r'Science & Engineering',
    EmploymentIndustryEnum.legal: r'Legal',
    EmploymentIndustryEnum.social__cultural: r'Social & Cultural',
    EmploymentIndustryEnum.agriculture: r'Agriculture',
    EmploymentIndustryEnum.real_estate: r'Real Estate',
    EmploymentIndustryEnum.food_services: r'Food Services',
    EmploymentIndustryEnum.manufacturing: r'Manufacturing',
    EmploymentIndustryEnum.unemployed: r'Unemployed',
  };

  static final Map<EmploymentStatusEnum, String> employmentStatusEnumMapper = {
    EmploymentStatusEnum.employed: r'Employed',
    EmploymentStatusEnum.pensioner: r'Pensioner',
    EmploymentStatusEnum.self_employed: r'Self-Employed',
    EmploymentStatusEnum.student: r'Student',
    EmploymentStatusEnum.unemployed: r'Unemployed',
  };

  static final Map<EstimatedWorthEnum, String> estimatedWorthEnumMapper = {
    EstimatedWorthEnum.less_than_$100000: r'Less than $100,000',
    EstimatedWorthEnum.$100000_$250000: r'$100,000 - $250,000',
    EstimatedWorthEnum.$250001_$500000: r'$250,001 - $500,000',
    EstimatedWorthEnum.$500001_$1000000: r'$500,001 - $1,000,000',
    EstimatedWorthEnum.over_$1000000: r'Over $1,000,000',
  };

  static final Map<ForexTradingExperienceEnum, String>
      forexTradingExperienceEnumMapper = {
    ForexTradingExperienceEnum._0_1_year: r'0-1 year',
    ForexTradingExperienceEnum._1_2_years: r'1-2 years',
    ForexTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<ForexTradingFrequencyEnum, String>
      forexTradingFrequencyEnumMapper = {
    ForexTradingFrequencyEnum._0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    ForexTradingFrequencyEnum._6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    ForexTradingFrequencyEnum._11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    ForexTradingFrequencyEnum._40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<IncomeSourceEnum, String> incomeSourceEnumMapper = {
    IncomeSourceEnum.salaried_employee: r'Salaried Employee',
    IncomeSourceEnum.self_employed: r'Self-Employed',
    IncomeSourceEnum.investments__dividends: r'Investments & Dividends',
    IncomeSourceEnum.pension: r'Pension',
    IncomeSourceEnum.state_benefits: r'State Benefits',
    IncomeSourceEnum.savings__inheritance: r'Savings & Inheritance',
  };

  static final Map<NetIncomeEnum, String> netIncomeEnumMapper = {
    NetIncomeEnum.less_than_$25000: r'Less than $25,000',
    NetIncomeEnum.$25000_$50000: r'$25,000 - $50,000',
    NetIncomeEnum.$50001_$100000: r'$50,001 - $100,000',
    NetIncomeEnum.$100001_$500000: r'$100,001 - $500,000',
    NetIncomeEnum.over_$500000: r'Over $500,000',
  };

  static final Map<OccupationEnum, String> occupationEnumMapper = {
    OccupationEnum.chief_executives_senior_officials_and_legislators:
        r'Chief Executives, Senior Officials and Legislators',
    OccupationEnum.managers: r'Managers',
    OccupationEnum.professionals: r'Professionals',
    OccupationEnum.clerks: r'Clerks',
    OccupationEnum.personal_care_sales_and_service_workers:
        r'Personal Care, Sales and Service Workers',
    OccupationEnum.agricultural_forestry_and_fishery_workers:
        r'Agricultural, Forestry and Fishery Workers',
    OccupationEnum.craft_metal_electrical_and_electronics_workers:
        r'Craft, Metal, Electrical and Electronics Workers',
    OccupationEnum.plant_and_machine_operators_and_assemblers:
        r'Plant and Machine Operators and Assemblers',
    OccupationEnum.cleaners_and_helpers: r'Cleaners and Helpers',
    OccupationEnum.mining_construction_manufacturing_and_transport_workers:
        r'Mining, Construction, Manufacturing and Transport Workers',
    OccupationEnum.armed_forces: r'Armed Forces',
    OccupationEnum.government_officers: r'Government Officers',
    OccupationEnum.students: r'Students',
    OccupationEnum.unemployed: r'Unemployed',
  };

  static final Map<OtherInstrumentsTradingExperienceEnum, String>
      otherInstrumentsTradingExperienceEnumMapper = {
    OtherInstrumentsTradingExperienceEnum._0_1_year: r'0-1 year',
    OtherInstrumentsTradingExperienceEnum._1_2_years: r'1-2 years',
    OtherInstrumentsTradingExperienceEnum.over_3_years: r'Over 3 years',
  };

  static final Map<OtherInstrumentsTradingFrequencyEnum, String>
      otherInstrumentsTradingFrequencyEnumMapper = {
    OtherInstrumentsTradingFrequencyEnum
            ._0_5_transactions_in_the_past_12_months:
        r'0-5 transactions in the past 12 months',
    OtherInstrumentsTradingFrequencyEnum
            ._6_10_transactions_in_the_past_12_months:
        r'6-10 transactions in the past 12 months',
    OtherInstrumentsTradingFrequencyEnum
            ._11_39_transactions_in_the_past_12_months:
        r'11-39 transactions in the past 12 months',
    OtherInstrumentsTradingFrequencyEnum
            ._40_transactions_or_more_in_the_past_12_months:
        r'40 transactions or more in the past 12 months',
  };

  static final Map<SourceOfWealthEnum, String> sourceOfWealthEnumMapper = {
    SourceOfWealthEnum.accumulation_of_income_savings:
        r'Accumulation of Income/Savings',
    SourceOfWealthEnum.cash_business: r'Cash Business',
    SourceOfWealthEnum.company_ownership: r'Company Ownership',
    SourceOfWealthEnum.divorce_settlement: r'Divorce Settlement',
    SourceOfWealthEnum.inheritance: r'Inheritance',
    SourceOfWealthEnum.investment_income: r'Investment Income',
    SourceOfWealthEnum.sale_of_property: r'Sale of Property',
  };
}

// Creating Enums

enum AccountTurnoverEnum {
  less_than_$25000,
  $25000_$50000,
  $50001_$100000,
  $100001_$500000,
  over_$500000,
}

enum BinaryOptionsTradingExperienceEnum {
  _0_1_year,
  _1_2_years,
  over_3_years,
}

enum BinaryOptionsTradingFrequencyEnum {
  _0_5_transactions_in_the_past_12_months,
  _6_10_transactions_in_the_past_12_months,
  _11_39_transactions_in_the_past_12_months,
  _40_transactions_or_more_in_the_past_12_months,
}

enum CfdTradingExperienceEnum {
  _0_1_year,
  _1_2_years,
  over_3_years,
}

enum CfdTradingFrequencyEnum {
  _0_5_transactions_in_the_past_12_months,
  _6_10_transactions_in_the_past_12_months,
  _11_39_transactions_in_the_past_12_months,
  _40_transactions_or_more_in_the_past_12_months,
}

enum EducationLevelEnum {
  primary,
  secondary,
  tertiary,
}

enum EmploymentIndustryEnum {
  construction,
  education,
  finance,
  health,
  tourism,
  information__communications_technology,
  science__engineering,
  legal,
  social__cultural,
  agriculture,
  real_estate,
  food_services,
  manufacturing,
  unemployed,
}

enum EmploymentStatusEnum {
  employed,
  pensioner,
  self_employed,
  student,
  unemployed,
}

enum EstimatedWorthEnum {
  less_than_$100000,
  $100000_$250000,
  $250001_$500000,
  $500001_$1000000,
  over_$1000000,
}

enum ForexTradingExperienceEnum {
  _0_1_year,
  _1_2_years,
  over_3_years,
}

enum ForexTradingFrequencyEnum {
  _0_5_transactions_in_the_past_12_months,
  _6_10_transactions_in_the_past_12_months,
  _11_39_transactions_in_the_past_12_months,
  _40_transactions_or_more_in_the_past_12_months,
}

enum IncomeSourceEnum {
  salaried_employee,
  self_employed,
  investments__dividends,
  pension,
  state_benefits,
  savings__inheritance,
}

enum NetIncomeEnum {
  less_than_$25000,
  $25000_$50000,
  $50001_$100000,
  $100001_$500000,
  over_$500000,
}

enum OccupationEnum {
  chief_executives_senior_officials_and_legislators,
  managers,
  professionals,
  clerks,
  personal_care_sales_and_service_workers,
  agricultural_forestry_and_fishery_workers,
  craft_metal_electrical_and_electronics_workers,
  plant_and_machine_operators_and_assemblers,
  cleaners_and_helpers,
  mining_construction_manufacturing_and_transport_workers,
  armed_forces,
  government_officers,
  students,
  unemployed,
}

enum OtherInstrumentsTradingExperienceEnum {
  _0_1_year,
  _1_2_years,
  over_3_years,
}

enum OtherInstrumentsTradingFrequencyEnum {
  _0_5_transactions_in_the_past_12_months,
  _6_10_transactions_in_the_past_12_months,
  _11_39_transactions_in_the_past_12_months,
  _40_transactions_or_more_in_the_past_12_months,
}

enum SourceOfWealthEnum {
  accumulation_of_income_savings,
  cash_business,
  company_ownership,
  divorce_settlement,
  inheritance,
  investment_income,
  sale_of_property,
}
