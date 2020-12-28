/// Mt5 password check send model class
abstract class Mt5PasswordCheckSendModel {
  /// Initializes
  Mt5PasswordCheckSendModel({
    @required this.mt5PasswordCheck,
    @required this.login,
    @required this.password,
    this.passwordType,
  });

  /// Must be `1`
  final int mt5PasswordCheck;

  /// MT5 user login
  final String login;

  /// The password of the account.
  final String password;

  /// [Optional] Type of the password to check.
  final PasswordTypeEnum passwordType;
}

/// Mt5 password check send class
class Mt5PasswordCheckSend extends Mt5PasswordCheckSendModel {
  /// Initializes
  Mt5PasswordCheckSend({
    @required int mt5PasswordCheck,
    @required String login,
    @required String password,
    String passwordType,
  }) : super(
          mt5PasswordCheck: mt5PasswordCheck,
          login: login,
          password: password,
          passwordType: passwordType,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordCheckSend.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordCheckSend(
        mt5PasswordCheck: json['mt5_password_check'],
        login: json['login'],
        password: json['password'],
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

    result['mt5_password_check'] = mt5PasswordCheck;
    result['login'] = login;
    result['password'] = password;
    result['password_type'] = passwordTypeEnumMapper[passwordType];

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5PasswordCheckSend copyWith({
    int mt5PasswordCheck,
    String login,
    String password,
    String passwordType,
  }) =>
      Mt5PasswordCheckSend(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        login: login ?? this.login,
        password: password ?? this.password,
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
