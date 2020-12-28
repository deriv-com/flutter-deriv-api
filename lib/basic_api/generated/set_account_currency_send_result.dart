/// Set account currency send model class
abstract class SetAccountCurrencySendModel {
  /// Initializes
  SetAccountCurrencySendModel({
    @required this.setAccountCurrency,
  });

  /// Currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String setAccountCurrency;
}

/// Set account currency send class
class SetAccountCurrencySend extends SetAccountCurrencySendModel {
  /// Initializes
  SetAccountCurrencySend({
    @required String setAccountCurrency,
  }) : super(
          setAccountCurrency: setAccountCurrency,
        );

  /// Creates an instance from JSON
  factory SetAccountCurrencySend.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencySend(
        setAccountCurrency: json['set_account_currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_account_currency'] = setAccountCurrency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SetAccountCurrencySend copyWith({
    String setAccountCurrency,
  }) =>
      SetAccountCurrencySend(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
      );
}
