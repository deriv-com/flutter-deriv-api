/// Cashier send model class
abstract class CashierSendModel {
  /// Initializes
  CashierSendModel({
    @required this.cashier,
    this.provider,
    this.type,
    this.verificationCode,
  });

  /// Operation which needs to be requested from cashier
  final CashierEnum cashier;

  /// [Optional] Cashier provider. `crypto` will be default option for crypto currency accounts.
  final ProviderEnum provider;

  /// [Optional] Data need to be returned from cashier. `api` is supported only for `crypto` provider with `deposit` operation.
  final TypeEnum type;

  /// [Optional] Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;
}

/// Cashier send class
class CashierSend extends CashierSendModel {
  /// Initializes
  CashierSend({
    @required String cashier,
    String provider,
    String type,
    String verificationCode,
  }) : super(
          cashier: cashier,
          provider: provider,
          type: type,
          verificationCode: verificationCode,
        );

  /// Creates an instance from JSON
  factory CashierSend.fromJson(Map<String, dynamic> json) => CashierSend(
        cashier: json['cashier'] == null
            ? null
            : cashierEnumMapper.entries
                .firstWhere((entry) => entry.value == json['cashier'],
                    orElse: () => null)
                ?.key,
        provider: json['provider'] == null
            ? null
            : providerEnumMapper.entries
                .firstWhere((entry) => entry.value == json['provider'],
                    orElse: () => null)
                ?.key,
        type: json['type'] == null
            ? null
            : typeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['type'],
                    orElse: () => null)
                ?.key,
        verificationCode: json['verification_code'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['cashier'] = cashierEnumMapper[cashier];
    result['provider'] = providerEnumMapper[provider];
    result['type'] = typeEnumMapper[type];
    result['verification_code'] = verificationCode;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CashierSend copyWith({
    String cashier,
    String provider,
    String type,
    String verificationCode,
  }) =>
      CashierSend(
        cashier: cashier ?? this.cashier,
        provider: provider ?? this.provider,
        type: type ?? this.type,
        verificationCode: verificationCode ?? this.verificationCode,
      );
  // Creating Enum Mappers
  static final Map<CashierEnum, String> cashierEnumMapper = {
    CashierEnum.deposit: 'deposit',
    CashierEnum.withdraw: 'withdraw',
  };

  static final Map<ProviderEnum, String> providerEnumMapper = {
    ProviderEnum.doughflow: 'doughflow',
    ProviderEnum.crypto: 'crypto',
  };

  static final Map<TypeEnum, String> typeEnumMapper = {
    TypeEnum.url: 'url',
    TypeEnum.api: 'api',
  };
}

// Creating Enums
enum CashierEnum {
  deposit,
  withdraw,
}

enum ProviderEnum {
  doughflow,
  crypto,
}

enum TypeEnum {
  url,
  api,
}
