/// Mt5 password reset send model class
abstract class Mt5PasswordResetSendModel {
  /// Initializes
  Mt5PasswordResetSendModel({
    @required this.mt5PasswordReset,
    @required this.login,
    @required this.newPassword,
    this.passwordType,
    @required this.verificationCode,
  });

  /// Must be `1`
  final int mt5PasswordReset;

  /// MT5 user login
  final String login;

  /// New password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String newPassword;

  /// [Optional] Type of the password to reset.
  final PasswordTypeEnum passwordType;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;
}

/// Mt5 password reset send class
class Mt5PasswordResetSend extends Mt5PasswordResetSendModel {
  /// Initializes
  Mt5PasswordResetSend({
    @required int mt5PasswordReset,
    @required String login,
    @required String newPassword,
    String passwordType,
    @required String verificationCode,
  }) : super(
          mt5PasswordReset: mt5PasswordReset,
          login: login,
          newPassword: newPassword,
          passwordType: passwordType,
          verificationCode: verificationCode,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordResetSend.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordResetSend(
        mt5PasswordReset: json['mt5_password_reset'],
        login: json['login'],
        newPassword: json['new_password'],
        passwordType: json['password_type'] == null
            ? null
            : passwordTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['password_type'],
                    orElse: () => null)
                ?.key,
        verificationCode: json['verification_code'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_password_reset'] = mt5PasswordReset;
    result['login'] = login;
    result['new_password'] = newPassword;
    result['password_type'] = passwordTypeEnumMapper[passwordType];
    result['verification_code'] = verificationCode;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5PasswordResetSend copyWith({
    int mt5PasswordReset,
    String login,
    String newPassword,
    String passwordType,
    String verificationCode,
  }) =>
      Mt5PasswordResetSend(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
        login: login ?? this.login,
        newPassword: newPassword ?? this.newPassword,
        passwordType: passwordType ?? this.passwordType,
        verificationCode: verificationCode ?? this.verificationCode,
      );
  // Creating Enum Mappers

  static final Map<PasswordTypeEnum, String> passwordTypeEnumMapper = {
    PasswordTypeEnum.main: 'main',
    PasswordTypeEnum.investor: 'investor',
  };
}

// Creating Enums

enum PasswordTypeEnum {
  main,
  investor,
}
