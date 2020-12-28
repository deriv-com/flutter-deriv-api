/// Mt5 password change send model class
abstract class Mt5PasswordChangeSendModel {
  /// Initializes
  Mt5PasswordChangeSendModel({
    @required this.mt5PasswordChange,
    @required this.login,
    @required this.newPassword,
    @required this.oldPassword,
    this.passwordType,
  });

  /// Must be `1`
  final int mt5PasswordChange;

  /// MT5 user login
  final String login;

  /// New password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String newPassword;

  /// Old password for validation (non-empty string, accepts any printable ASCII character)
  final String oldPassword;

  /// [Optional] Type of the password to change.
  final PasswordTypeEnum passwordType;
}

/// Mt5 password change send class
class Mt5PasswordChangeSend extends Mt5PasswordChangeSendModel {
  /// Initializes
  Mt5PasswordChangeSend({
    @required int mt5PasswordChange,
    @required String login,
    @required String newPassword,
    @required String oldPassword,
    String passwordType,
  }) : super(
          mt5PasswordChange: mt5PasswordChange,
          login: login,
          newPassword: newPassword,
          oldPassword: oldPassword,
          passwordType: passwordType,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordChangeSend.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordChangeSend(
        mt5PasswordChange: json['mt5_password_change'],
        login: json['login'],
        newPassword: json['new_password'],
        oldPassword: json['old_password'],
        passwordType: json['password_type'] == null
            ? null
            : passwordTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['password_type'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_password_change'] = mt5PasswordChange;
    result['login'] = login;
    result['new_password'] = newPassword;
    result['old_password'] = oldPassword;
    result['password_type'] = passwordTypeEnumMapper[passwordType];

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5PasswordChangeSend copyWith({
    int mt5PasswordChange,
    String login,
    String newPassword,
    String oldPassword,
    String passwordType,
  }) =>
      Mt5PasswordChangeSend(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        login: login ?? this.login,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        passwordType: passwordType ?? this.passwordType,
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
