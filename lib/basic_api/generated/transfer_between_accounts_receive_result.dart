/// Transfer between accounts receive model class
abstract class TransferBetweenAccountsReceiveModel {
  /// Initializes
  TransferBetweenAccountsReceiveModel({
    @required this.transferBetweenAccounts,
    @required this.accounts,
    @required this.clientToFullName,
    @required this.clientToLoginid,
    @required this.transactionId,
  });

  /// If set to `true`, transfer succeeded.
  final bool transferBetweenAccounts;

  /// The available accounts to transfer, or the accounts affected by a successful transfer.
  final List<Account> accounts;

  /// The account to client full name
  final String clientToFullName;

  /// The account to client loginid
  final String clientToLoginid;

  /// Reference ID of transfer performed
  final int transactionId;
}

/// Transfer between accounts receive class
class TransferBetweenAccountsReceive
    extends TransferBetweenAccountsReceiveModel {
  /// Initializes
  TransferBetweenAccountsReceive({
    @required bool transferBetweenAccounts,
    @required List<Account> accounts,
    @required String clientToFullName,
    @required String clientToLoginid,
    @required int transactionId,
  }) : super(
          transferBetweenAccounts: transferBetweenAccounts,
          accounts: accounts,
          clientToFullName: clientToFullName,
          clientToLoginid: clientToLoginid,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory TransferBetweenAccountsReceive.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccountsReceive(
        transferBetweenAccounts: getBool(json['transfer_between_accounts']),
        accounts: json['accounts'] == null
            ? null
            : json['accounts']
                .map<Account>((dynamic item) => Account.fromJson(item))
                .toList(),
        clientToFullName: json['client_to_full_name'],
        clientToLoginid: json['client_to_loginid'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['transfer_between_accounts'] = transferBetweenAccounts;
    if (accounts != null) {
      result['accounts'] = accounts.map((item) => item.toJson()).toList();
    }
    result['client_to_full_name'] = clientToFullName;
    result['client_to_loginid'] = clientToLoginid;
    result['transaction_id'] = transactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TransferBetweenAccountsReceive copyWith({
    bool transferBetweenAccounts,
    List<Account> accounts,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
  }) =>
      TransferBetweenAccountsReceive(
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        accounts: accounts ?? this.accounts,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        transactionId: transactionId ?? this.transactionId,
      );
}
/// Account model class
abstract class AccountModel {
  /// Initializes
  AccountModel({
    @required this.accountType,
    @required this.balance,
    @required this.currency,
    @required this.loginid,
    @required this.mt5Group,
  });

  /// Type of the account.
  final AccountTypeEnum accountType;

  /// Account balance.
  final String balance;

  /// Default account currency.
  final String currency;

  /// Client loginid.
  final String loginid;

  /// The group of mt5 account.
  final String mt5Group;
}

/// Account class
class Account extends AccountModel {
  /// Initializes
  Account({
    @required String accountType,
    @required String balance,
    @required String currency,
    @required String loginid,
    @required String mt5Group,
  }) : super(
          accountType: accountType,
          balance: balance,
          currency: currency,
          loginid: loginid,
          mt5Group: mt5Group,
        );

  /// Creates an instance from JSON
  factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['account_type'],
                    orElse: () => null)
                ?.key,
        balance: json['balance'],
        currency: json['currency'],
        loginid: json['loginid'],
        mt5Group: json['mt5_group'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['account_type'] = accountTypeEnumMapper[accountType];
    result['balance'] = balance;
    result['currency'] = currency;
    result['loginid'] = loginid;
    result['mt5_group'] = mt5Group;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Account copyWith({
    String accountType,
    String balance,
    String currency,
    String loginid,
    String mt5Group,
  }) =>
      Account(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        mt5Group: mt5Group ?? this.mt5Group,
      );
  // Creating Enum Mappers
  static final Map<AccountTypeEnum, String> accountTypeEnumMapper = {
    AccountTypeEnum.binary: 'binary',
    AccountTypeEnum.mt5: 'mt5',
  };
}

// Creating Enums
enum AccountTypeEnum {
  binary,
  mt5,
}
