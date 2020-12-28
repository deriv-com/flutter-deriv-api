/// The model model class
abstract class TheModelModel {
  /// Initializes
  TheModelModel({
    @required this.setSettings,
    this.accountOpeningReason,
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.allowCopiers,
    this.citizen,
    this.dateOfBirth,
    this.emailConsent,
    this.firstName,
    this.lastName,
    this.nonPepDeclaration,
    this.phone,
    this.placeOfBirth,
    this.requestProfessionalStatus,
    this.residence,
    this.salutation,
    this.secretAnswer,
    this.secretQuestion,
    this.taxIdentificationNumber,
    this.taxResidence,
  });

  /// Must be `1`
  final int setSettings;

  /// [Optional] Purpose and reason for requesting the account opening. Only applicable for real money account. Required for clients that have not set it yet. Can only be set once.
  final AccountOpeningReasonEnum accountOpeningReason;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account.
  final String addressCity;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account.
  final String addressLine1;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final UNKNOWN_TYPE addressLine2;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String addressPostcode;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String addressState;

  /// [Optional] Boolean value `true` or `false`, indicating permission to allow others to follow your trades. Note: not applicable for Virtual account. Only allow for real money account.
  final bool allowCopiers;

  /// [Optional] Country of legal citizenship, 2-letter country code.
  final UNKNOWN_TYPE citizen;

  /// [Optional] Date of birth format: yyyy-mm-dd (can only be changed on unauthenticated svg accounts).
  final String dateOfBirth;

  /// [Optional] Boolean value `true` or `false`, indicating permission to use email address for any contact which may include marketing
  final bool emailConsent;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes (can only be changed on unauthenticated svg accounts).
  final String firstName;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes (can only be changed on unauthenticated svg accounts).
  final String lastName;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates). Effective for real accounts only.
  final int nonPepDeclaration;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account. Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String phone;

  /// [Optional] Place of birth, 2-letter country code.
  final String placeOfBirth;

  /// [Optional] Required when client wants to be treated as professional. Applicable for financial accounts only.
  final int requestProfessionalStatus;

  /// [Optional] 2-letter country code. Note: not applicable for real money account. Only allow for Virtual account without residence set.
  final UNKNOWN_TYPE residence;

  /// [Optional] Accept any value in enum list (can only be changed on unauthenticated svg accounts).
  final SalutationEnum salutation;

  /// [Optional] Answer to secret question, within 4-50 characters. Required for new account and existing client details will be used if client opens another account.
  final String secretAnswer;

  /// [Optional] Accept any value in enum list. Required for new account and existing client details will be used if client opens another account.
  final SecretQuestionEnum secretQuestion;

  /// [Optional] Tax identification number. Only applicable for real money account. Required for maltainvest landing company.
  final String taxIdentificationNumber;

  /// [Optional] Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for maltainvest landing company.
  final String taxResidence;
}

/// The model class
class TheModel extends TheModelModel {
  /// Initializes
  TheModel({
    @required int setSettings,
    String accountOpeningReason,
    String addressCity,
    String addressLine1,
    UNKNOWN_TYPE addressLine2,
    String addressPostcode,
    String addressState,
    bool allowCopiers,
    UNKNOWN_TYPE citizen,
    String dateOfBirth,
    bool emailConsent,
    String firstName,
    String lastName,
    int nonPepDeclaration,
    String phone,
    String placeOfBirth,
    int requestProfessionalStatus,
    UNKNOWN_TYPE residence,
    String salutation,
    String secretAnswer,
    String secretQuestion,
    String taxIdentificationNumber,
    String taxResidence,
  }) : super(
          setSettings: setSettings,
          accountOpeningReason: accountOpeningReason,
          addressCity: addressCity,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          addressPostcode: addressPostcode,
          addressState: addressState,
          allowCopiers: allowCopiers,
          citizen: citizen,
          dateOfBirth: dateOfBirth,
          emailConsent: emailConsent,
          firstName: firstName,
          lastName: lastName,
          nonPepDeclaration: nonPepDeclaration,
          phone: phone,
          placeOfBirth: placeOfBirth,
          requestProfessionalStatus: requestProfessionalStatus,
          residence: residence,
          salutation: salutation,
          secretAnswer: secretAnswer,
          secretQuestion: secretQuestion,
          taxIdentificationNumber: taxIdentificationNumber,
          taxResidence: taxResidence,
        );

  /// Creates an instance from JSON
  factory TheModel.fromJson(Map<String, dynamic> json) => TheModel(
        setSettings: json['set_settings'],
        accountOpeningReason: json['account_opening_reason'] == null
            ? null
            : accountOpeningReasonEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['account_opening_reason'],
                    orElse: () => null)
                ?.key,
        addressCity: json['address_city'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        allowCopiers: getBool(json['allow_copiers']),
        citizen: json['citizen'],
        dateOfBirth: json['date_of_birth'],
        emailConsent: getBool(json['email_consent']),
        firstName: json['first_name'],
        lastName: json['last_name'],
        nonPepDeclaration: json['non_pep_declaration'],
        phone: json['phone'],
        placeOfBirth: json['place_of_birth'],
        requestProfessionalStatus: json['request_professional_status'],
        residence: json['residence'],
        salutation: json['salutation'] == null
            ? null
            : salutationEnumMapper.entries
                .firstWhere((entry) => entry.value == json['salutation'],
                    orElse: () => null)
                ?.key,
        secretAnswer: json['secret_answer'],
        secretQuestion: json['secret_question'] == null
            ? null
            : secretQuestionEnumMapper.entries
                .firstWhere((entry) => entry.value == json['secret_question'],
                    orElse: () => null)
                ?.key,
        taxIdentificationNumber: json['tax_identification_number'],
        taxResidence: json['tax_residence'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_settings'] = setSettings;
    result['account_opening_reason'] =
        accountOpeningReasonEnumMapper[accountOpeningReason];
    result['address_city'] = addressCity;
    result['address_line_1'] = addressLine1;
    result['address_line_2'] = addressLine2;
    result['address_postcode'] = addressPostcode;
    result['address_state'] = addressState;
    result['allow_copiers'] = allowCopiers;
    result['citizen'] = citizen;
    result['date_of_birth'] = dateOfBirth;
    result['email_consent'] = emailConsent;
    result['first_name'] = firstName;
    result['last_name'] = lastName;
    result['non_pep_declaration'] = nonPepDeclaration;
    result['phone'] = phone;
    result['place_of_birth'] = placeOfBirth;
    result['request_professional_status'] = requestProfessionalStatus;
    result['residence'] = residence;
    result['salutation'] = salutationEnumMapper[salutation];
    result['secret_answer'] = secretAnswer;
    result['secret_question'] = secretQuestionEnumMapper[secretQuestion];
    result['tax_identification_number'] = taxIdentificationNumber;
    result['tax_residence'] = taxResidence;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TheModel copyWith({
    int setSettings,
    String accountOpeningReason,
    String addressCity,
    String addressLine1,
    UNKNOWN_TYPE addressLine2,
    String addressPostcode,
    String addressState,
    bool allowCopiers,
    UNKNOWN_TYPE citizen,
    String dateOfBirth,
    bool emailConsent,
    String firstName,
    String lastName,
    int nonPepDeclaration,
    String phone,
    String placeOfBirth,
    int requestProfessionalStatus,
    UNKNOWN_TYPE residence,
    String salutation,
    String secretAnswer,
    String secretQuestion,
    String taxIdentificationNumber,
    String taxResidence,
  }) =>
      TheModel(
        setSettings: setSettings ?? this.setSettings,
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        allowCopiers: allowCopiers ?? this.allowCopiers,
        citizen: citizen ?? this.citizen,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailConsent: emailConsent ?? this.emailConsent,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        requestProfessionalStatus:
            requestProfessionalStatus ?? this.requestProfessionalStatus,
        residence: residence ?? this.residence,
        salutation: salutation ?? this.salutation,
        secretAnswer: secretAnswer ?? this.secretAnswer,
        secretQuestion: secretQuestion ?? this.secretQuestion,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
      );
  // Creating Enum Mappers

  static final Map<AccountOpeningReasonEnum, String>
      accountOpeningReasonEnumMapper = {
    AccountOpeningReasonEnum.speculative: 'Speculative',
    AccountOpeningReasonEnum.income_earning: 'Income Earning',
    AccountOpeningReasonEnum.hedging: 'Hedging',
    AccountOpeningReasonEnum.peer_to_peer_exchange: 'Peer-to-peer exchange',
  };

  static final Map<SalutationEnum, String> salutationEnumMapper = {
    SalutationEnum.mr: 'Mr',
    SalutationEnum.mrs: 'Mrs',
    SalutationEnum.ms: 'Ms',
    SalutationEnum.miss: 'Miss',
  };

  static final Map<SecretQuestionEnum, String> secretQuestionEnumMapper = {
    SecretQuestionEnum.mothers_maiden_name: 'Mother\'s maiden name',
    SecretQuestionEnum.name_of_your_pet: 'Name of your pet',
    SecretQuestionEnum.name_of_first_love: 'Name of first love',
    SecretQuestionEnum.memorable_town_city: 'Memorable town/city',
    SecretQuestionEnum.memorable_date: 'Memorable date',
    SecretQuestionEnum.favourite_dish: 'Favourite dish',
    SecretQuestionEnum.brand_of_first_car: 'Brand of first car',
    SecretQuestionEnum.favourite_artist: 'Favourite artist',
  };
}

// Creating Enums

enum AccountOpeningReasonEnum {
  speculative,
  income_earning,
  hedging,
  peer_to_peer_exchange,
}

enum SalutationEnum {
  mr,
  mrs,
  ms,
  miss,
}

enum SecretQuestionEnum {
  mothers_maiden_name,
  name_of_your_pet,
  name_of_first_love,
  memorable_town_city,
  memorable_date,
  favourite_dish,
  brand_of_first_car,
  favourite_artist,
}
