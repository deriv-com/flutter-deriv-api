/// Set account currency receive model class
abstract class SetAccountCurrencyReceiveModel {
  /// Initializes
  SetAccountCurrencyReceiveModel({
    @required this.setAccountCurrency,
  });

  /// `true`: success, `false`: no change
  final bool setAccountCurrency;
}

/// Set account currency receive class
class SetAccountCurrencyReceive extends SetAccountCurrencyReceiveModel {
  /// Initializes
  SetAccountCurrencyReceive({
    @required bool setAccountCurrency,
  }) : super(
          setAccountCurrency: setAccountCurrency,
        );

  /// Creates an instance from JSON
  factory SetAccountCurrencyReceive.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencyReceive(
        setAccountCurrency: getBool(json['set_account_currency']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_account_currency'] = setAccountCurrency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SetAccountCurrencyReceive copyWith({
    bool setAccountCurrency,
  }) =>
      SetAccountCurrencyReceive(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
      );
}
