/// Transfer between accounts send model class
abstract class TransferBetweenAccountsSendModel {
  /// Initializes
  TransferBetweenAccountsSendModel({
    @required this.transferBetweenAccounts,
    this.accountFrom,
    this.accountTo,
    this.accounts,
    this.amount,
    this.currency,
  });

  /// If `account_from` or `account_to` is not provided, it just returns the available accounts.
  final int transferBetweenAccounts;

  /// [Optional] The loginid of the account to transfer funds from.
  final String accountFrom;

  /// [Optional] The loginid of the account to transfer funds to.
  final String accountTo;

  /// [Optional] To control the list of accounts returned when `account_from` or `account_to` is not provided. `brief` will only include financial trading accounts with account_type equal to `binary` and can be faster. `all` will include accounts with both `mt5` and `binary` account_type
  final AccountsEnum accounts;

  /// [Optional] The amount to transfer.
  final double amount;

  /// [Optional] Currency code.
  final String currency;
}

/// Transfer between accounts send class
class TransferBetweenAccountsSend extends TransferBetweenAccountsSendModel {
  /// Initializes
  TransferBetweenAccountsSend({
    @required int transferBetweenAccounts,
    String accountFrom,
    String accountTo,
    String accounts,
    double amount,
    String currency,
  }) : super(
          transferBetweenAccounts: transferBetweenAccounts,
          accountFrom: accountFrom,
          accountTo: accountTo,
          accounts: accounts,
          amount: amount,
          currency: currency,
        );

  /// Creates an instance from JSON
  factory TransferBetweenAccountsSend.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccountsSend(
        transferBetweenAccounts: json['transfer_between_accounts'],
        accountFrom: json['account_from'],
        accountTo: json['account_to'],
        accounts: json['accounts'] == null
            ? null
            : accountsEnumMapper.entries
                .firstWhere((entry) => entry.value == json['accounts'],
                    orElse: () => null)
                ?.key,
        amount: getDouble(json['amount']),
        currency: json['currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['transfer_between_accounts'] = transferBetweenAccounts;
    result['account_from'] = accountFrom;
    result['account_to'] = accountTo;
    result['accounts'] = accountsEnumMapper[accounts];
    result['amount'] = amount;
    result['currency'] = currency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TransferBetweenAccountsSend copyWith({
    int transferBetweenAccounts,
    String accountFrom,
    String accountTo,
    String accounts,
    double amount,
    String currency,
  }) =>
      TransferBetweenAccountsSend(
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        accountFrom: accountFrom ?? this.accountFrom,
        accountTo: accountTo ?? this.accountTo,
        accounts: accounts ?? this.accounts,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
  // Creating Enum Mappers

  static final Map<AccountsEnum, String> accountsEnumMapper = {
    AccountsEnum.all: 'all',
    AccountsEnum.brief: 'brief',
  };
}

// Creating Enums

enum AccountsEnum {
  all,
  brief,
}
