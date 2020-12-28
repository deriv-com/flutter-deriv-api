/// Get settings receive model class
abstract class GetSettingsReceiveModel {
  /// Initializes
  GetSettingsReceiveModel({
    @required this.getSettings,
  });

  /// User information and settings.
  final GetSettings getSettings;
}

/// Get settings receive class
class GetSettingsReceive extends GetSettingsReceiveModel {
  /// Initializes
  GetSettingsReceive({
    @required GetSettings getSettings,
  }) : super(
          getSettings: getSettings,
        );

  /// Creates an instance from JSON
  factory GetSettingsReceive.fromJson(Map<String, dynamic> json) =>
      GetSettingsReceive(
        getSettings: json['get_settings'] == null
            ? null
            : GetSettings.fromJson(json['get_settings']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (getSettings != null) {
      result['get_settings'] = getSettings.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetSettingsReceive copyWith({
    GetSettings getSettings,
  }) =>
      GetSettingsReceive(
        getSettings: getSettings ?? this.getSettings,
      );
}
/// Get settings model class
abstract class GetSettingsModel {
  /// Initializes
  GetSettingsModel({
    this.accountOpeningReason,
    @required this.addressCity,
    @required this.addressLine1,
    @required this.addressLine2,
    @required this.addressPostcode,
    @required this.addressState,
    @required this.allowCopiers,
    @required this.citizen,
    this.clientTncStatus,
    this.country,
    this.countryCode,
    this.dateOfBirth,
    @required this.email,
    @required this.emailConsent,
    @required this.firstName,
    @required this.hasSecretAnswer,
    @required this.immutableFields,
    @required this.isAuthenticatedPaymentAgent,
    @required this.lastName,
    @required this.nonPepDeclaration,
    @required this.phone,
    this.placeOfBirth,
    @required this.requestProfessionalStatus,
    this.residence,
    @required this.salutation,
    this.taxIdentificationNumber,
    this.taxResidence,
    this.userHash,
  });

  /// Purpose and reason for requesting the account opening. Only applicable for real money account.
  final UNKNOWN_TYPE accountOpeningReason;

  /// City (note: Only available for users who have at least one real account)
  final String addressCity;

  /// Address line 1 (note: Only available for users who have at least one real account)
  final String addressLine1;

  /// Address line 2 (note: Only available for users who have at least one real account)
  final String addressLine2;

  /// Post Code (note: Only available for users who have at least one real account)
  final String addressPostcode;

  /// State (note: Only available for users who have at least one real account)
  final String addressState;

  /// Boolean value `true` or `false`, indicating permission to allow others to follow your trades. Note: not applicable for Virtual account. Only allow for real money account.
  final bool allowCopiers;

  /// Country of legal citizenship, 2-letter country code.
  final String citizen;

  /// Latest terms and conditions version accepted by client
  final UNKNOWN_TYPE clientTncStatus;

  /// User Country (same as residence field) - deprecated
  final UNKNOWN_TYPE country;

  /// 2-letter country code ISO standard
  final UNKNOWN_TYPE countryCode;

  /// Epoch of user's birthday (note: Only available for users who have at least one real account)
  final double dateOfBirth;

  /// User Email
  final String email;

  /// Boolean value `true` or `false`, indicating permission to use email address for any contact which may include marketing
  final bool emailConsent;

  /// First name (note: Only available for users who have at least one real account)
  final String firstName;

  /// Returns `true` if the client has a secret answer, `false` otherwise.
  final bool hasSecretAnswer;

  /// A list of profile fields which are immutable (read-only unless they are not set yet) due to landing company regulations and the current status of the account.
  final List<String> immutableFields;

  /// Boolean value `true` or `false`, indicating whether is payment agent (note: not applicable for virtual money accounts)
  final bool isAuthenticatedPaymentAgent;

  /// Last name (note: Only available for users who have at least one real account)
  final String lastName;

  /// Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates). Note: returned for real accounts only.
  final bool nonPepDeclaration;

  /// Telephone (note: Only available for users who have at least one real account)
  final String phone;

  /// Place of birth, 2-letter country code.
  final UNKNOWN_TYPE placeOfBirth;

  /// Boolean value `true` or `false`, indicating if client has requested professional status.
  final bool requestProfessionalStatus;

  /// User Country
  final UNKNOWN_TYPE residence;

  /// Salutation (note: Only available for users who have at least one real account)
  final String salutation;

  /// Tax identification number. Only applicable for real money account.
  final UNKNOWN_TYPE taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account.
  final UNKNOWN_TYPE taxResidence;

  /// Hash generated using user details to verify whether the user is legitimate for our customer support system.
  final UNKNOWN_TYPE userHash;
}

/// Get settings class
class GetSettings extends GetSettingsModel {
  /// Initializes
  GetSettings({
    UNKNOWN_TYPE accountOpeningReason,
    @required String addressCity,
    @required String addressLine1,
    @required String addressLine2,
    @required String addressPostcode,
    @required String addressState,
    @required bool allowCopiers,
    @required String citizen,
    UNKNOWN_TYPE clientTncStatus,
    UNKNOWN_TYPE country,
    UNKNOWN_TYPE countryCode,
    double dateOfBirth,
    @required String email,
    @required bool emailConsent,
    @required String firstName,
    @required bool hasSecretAnswer,
    @required List<String> immutableFields,
    @required bool isAuthenticatedPaymentAgent,
    @required String lastName,
    @required bool nonPepDeclaration,
    @required String phone,
    UNKNOWN_TYPE placeOfBirth,
    @required bool requestProfessionalStatus,
    UNKNOWN_TYPE residence,
    @required String salutation,
    UNKNOWN_TYPE taxIdentificationNumber,
    UNKNOWN_TYPE taxResidence,
    UNKNOWN_TYPE userHash,
  }) : super(
          accountOpeningReason: accountOpeningReason,
          addressCity: addressCity,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          addressPostcode: addressPostcode,
          addressState: addressState,
          allowCopiers: allowCopiers,
          citizen: citizen,
          clientTncStatus: clientTncStatus,
          country: country,
          countryCode: countryCode,
          dateOfBirth: dateOfBirth,
          email: email,
          emailConsent: emailConsent,
          firstName: firstName,
          hasSecretAnswer: hasSecretAnswer,
          immutableFields: immutableFields,
          isAuthenticatedPaymentAgent: isAuthenticatedPaymentAgent,
          lastName: lastName,
          nonPepDeclaration: nonPepDeclaration,
          phone: phone,
          placeOfBirth: placeOfBirth,
          requestProfessionalStatus: requestProfessionalStatus,
          residence: residence,
          salutation: salutation,
          taxIdentificationNumber: taxIdentificationNumber,
          taxResidence: taxResidence,
          userHash: userHash,
        );

  /// Creates an instance from JSON
  factory GetSettings.fromJson(Map<String, dynamic> json) => GetSettings(
        accountOpeningReason: json['account_opening_reason'],
        addressCity: json['address_city'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        allowCopiers: getBool(json['allow_copiers']),
        citizen: json['citizen'],
        clientTncStatus: json['client_tnc_status'],
        country: json['country'],
        countryCode: json['country_code'],
        dateOfBirth: getDouble(json['date_of_birth']),
        email: json['email'],
        emailConsent: getBool(json['email_consent']),
        firstName: json['first_name'],
        hasSecretAnswer: getBool(json['has_secret_answer']),
        immutableFields:
            List<String>.from(json['immutable_fields'].map((x) => x)),
        isAuthenticatedPaymentAgent:
            getBool(json['is_authenticated_payment_agent']),
        lastName: json['last_name'],
        nonPepDeclaration: getBool(json['non_pep_declaration']),
        phone: json['phone'],
        placeOfBirth: json['place_of_birth'],
        requestProfessionalStatus: getBool(json['request_professional_status']),
        residence: json['residence'],
        salutation: json['salutation'],
        taxIdentificationNumber: json['tax_identification_number'],
        taxResidence: json['tax_residence'],
        userHash: json['user_hash'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['account_opening_reason'] = accountOpeningReason;
    result['address_city'] = addressCity;
    result['address_line_1'] = addressLine1;
    result['address_line_2'] = addressLine2;
    result['address_postcode'] = addressPostcode;
    result['address_state'] = addressState;
    result['allow_copiers'] = allowCopiers;
    result['citizen'] = citizen;
    result['client_tnc_status'] = clientTncStatus;
    result['country'] = country;
    result['country_code'] = countryCode;
    result['date_of_birth'] = dateOfBirth;
    result['email'] = email;
    result['email_consent'] = emailConsent;
    result['first_name'] = firstName;
    result['has_secret_answer'] = hasSecretAnswer;
    result['immutable_fields'] = immutableFields;
    result['is_authenticated_payment_agent'] = isAuthenticatedPaymentAgent;
    result['last_name'] = lastName;
    result['non_pep_declaration'] = nonPepDeclaration;
    result['phone'] = phone;
    result['place_of_birth'] = placeOfBirth;
    result['request_professional_status'] = requestProfessionalStatus;
    result['residence'] = residence;
    result['salutation'] = salutation;
    result['tax_identification_number'] = taxIdentificationNumber;
    result['tax_residence'] = taxResidence;
    result['user_hash'] = userHash;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetSettings copyWith({
    UNKNOWN_TYPE accountOpeningReason,
    String addressCity,
    String addressLine1,
    String addressLine2,
    String addressPostcode,
    String addressState,
    bool allowCopiers,
    String citizen,
    UNKNOWN_TYPE clientTncStatus,
    UNKNOWN_TYPE country,
    UNKNOWN_TYPE countryCode,
    double dateOfBirth,
    String email,
    bool emailConsent,
    String firstName,
    bool hasSecretAnswer,
    List<String> immutableFields,
    bool isAuthenticatedPaymentAgent,
    String lastName,
    bool nonPepDeclaration,
    String phone,
    UNKNOWN_TYPE placeOfBirth,
    bool requestProfessionalStatus,
    UNKNOWN_TYPE residence,
    String salutation,
    UNKNOWN_TYPE taxIdentificationNumber,
    UNKNOWN_TYPE taxResidence,
    UNKNOWN_TYPE userHash,
  }) =>
      GetSettings(
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        allowCopiers: allowCopiers ?? this.allowCopiers,
        citizen: citizen ?? this.citizen,
        clientTncStatus: clientTncStatus ?? this.clientTncStatus,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        email: email ?? this.email,
        emailConsent: emailConsent ?? this.emailConsent,
        firstName: firstName ?? this.firstName,
        hasSecretAnswer: hasSecretAnswer ?? this.hasSecretAnswer,
        immutableFields: immutableFields ?? this.immutableFields,
        isAuthenticatedPaymentAgent:
            isAuthenticatedPaymentAgent ?? this.isAuthenticatedPaymentAgent,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        requestProfessionalStatus:
            requestProfessionalStatus ?? this.requestProfessionalStatus,
        residence: residence ?? this.residence,
        salutation: salutation ?? this.salutation,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        userHash: userHash ?? this.userHash,
      );
}
