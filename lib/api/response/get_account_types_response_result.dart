// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Get account types response model class.
abstract class GetAccountTypesResponseModel extends Equatable {
  /// Initializes Get account types response model class .
  const GetAccountTypesResponseModel({
    this.getAccountTypes,
  });

  /// Returns accounts that are available to create or link to
  final GetAccountTypes? getAccountTypes;
}

/// Get account types response class.
class GetAccountTypesResponse extends GetAccountTypesResponseModel {
  /// Initializes Get account types response class.
  const GetAccountTypesResponse({
    GetAccountTypes? getAccountTypes,
  }) : super(
          getAccountTypes: getAccountTypes,
        );

  /// Creates an instance from JSON.
  factory GetAccountTypesResponse.fromJson(
    dynamic getAccountTypesJson,
  ) =>
      GetAccountTypesResponse(
        getAccountTypes: getAccountTypesJson == null
            ? null
            : GetAccountTypes.fromJson(getAccountTypesJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getAccountTypes != null) {
      resultMap['get_account_types'] = getAccountTypes!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAccountTypesResponse copyWith({
    GetAccountTypes? getAccountTypes,
  }) =>
      GetAccountTypesResponse(
        getAccountTypes: getAccountTypes ?? this.getAccountTypes,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// LinkableWalletTypesItemEnum mapper.
final Map<String, LinkableWalletTypesItemEnum>
    linkableWalletTypesItemEnumMapper = <String, LinkableWalletTypesItemEnum>{
  "fiat": LinkableWalletTypesItemEnum.fiat,
  "crypto": LinkableWalletTypesItemEnum.crypto,
  "p2p": LinkableWalletTypesItemEnum.p2p,
  "pa": LinkableWalletTypesItemEnum.pa,
  "pa_client": LinkableWalletTypesItemEnum.paClient,
};

/// LinkableWalletTypesItem Enum.
enum LinkableWalletTypesItemEnum {
  /// fiat.
  fiat,

  /// crypto.
  crypto,

  /// p2p.
  p2p,

  /// pa.
  pa,

  /// pa_client.
  paClient,
}

/// DerivxLinkableWalletTypesItemEnum mapper.
final Map<String, DerivxLinkableWalletTypesItemEnum>
    derivxLinkableWalletTypesItemEnumMapper =
    <String, DerivxLinkableWalletTypesItemEnum>{
  "fiat": DerivxLinkableWalletTypesItemEnum.fiat,
  "p2p": DerivxLinkableWalletTypesItemEnum.p2p,
};

/// LinkableWalletTypesItem Enum.
enum DerivxLinkableWalletTypesItemEnum {
  /// fiat.
  fiat,

  /// p2p.
  p2p,
}

/// Mt5LinkableWalletTypesItemEnum mapper.
final Map<String, Mt5LinkableWalletTypesItemEnum>
    mt5LinkableWalletTypesItemEnumMapper =
    <String, Mt5LinkableWalletTypesItemEnum>{
  "fiat": Mt5LinkableWalletTypesItemEnum.fiat,
};

/// LinkableWalletTypesItem Enum.
enum Mt5LinkableWalletTypesItemEnum {
  /// fiat.
  fiat,
}
/// Get account types model class.
abstract class GetAccountTypesModel extends Equatable {
  /// Initializes Get account types model class .
  const GetAccountTypesModel({
    required this.wallet,
    required this.trading,
  });

  /// Details of the wallet accounts.
  final Wallet wallet;

  /// Details of the trading accounts.
  final Trading trading;
}

/// Get account types class.
class GetAccountTypes extends GetAccountTypesModel {
  /// Initializes Get account types class.
  const GetAccountTypes({
    required Trading trading,
    required Wallet wallet,
  }) : super(
          trading: trading,
          wallet: wallet,
        );

  /// Creates an instance from JSON.
  factory GetAccountTypes.fromJson(Map<String, dynamic> json) =>
      GetAccountTypes(
        trading: Trading.fromJson(json['trading']),
        wallet: Wallet.fromJson(json['wallet']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading'] = trading.toJson();

    resultMap['wallet'] = wallet.toJson();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAccountTypes copyWith({
    Trading? trading,
    Wallet? wallet,
  }) =>
      GetAccountTypes(
        trading: trading ?? this.trading,
        wallet: wallet ?? this.wallet,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Trading model class.
abstract class TradingModel extends Equatable {
  /// Initializes Trading model class .
  const TradingModel({
    required this.mt5,
    required this.derivx,
    required this.deriv,
  });

  /// Mt5 trading account
  final Mt5 mt5;

  /// Derivx trading account
  final Derivx derivx;

  /// Deriv trading account
  final Deriv deriv;
}

/// Trading class.
class Trading extends TradingModel {
  /// Initializes Trading class.
  const Trading({
    required Deriv deriv,
    required Derivx derivx,
    required Mt5 mt5,
  }) : super(
          deriv: deriv,
          derivx: derivx,
          mt5: mt5,
        );

  /// Creates an instance from JSON.
  factory Trading.fromJson(Map<String, dynamic> json) => Trading(
        deriv: Deriv.fromJson(json['deriv']),
        derivx: Derivx.fromJson(json['derivx']),
        mt5: Mt5.fromJson(json['mt5']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['deriv'] = deriv.toJson();

    resultMap['derivx'] = derivx.toJson();

    resultMap['mt5'] = mt5.toJson();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Trading copyWith({
    Deriv? deriv,
    Derivx? derivx,
    Mt5? mt5,
  }) =>
      Trading(
        deriv: deriv ?? this.deriv,
        derivx: derivx ?? this.derivx,
        mt5: mt5 ?? this.mt5,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Deriv model class.
abstract class DerivModel extends Equatable {
  /// Initializes Deriv model class .
  const DerivModel({
    required this.linkableWalletTypes,
    required this.linkableWalletCurrencies,
    required this.linkableToDifferentCurrency,
    required this.currenciesAvailable,
  });

  /// Linkable wallets types available.
  final List<LinkableWalletTypesItemEnum> linkableWalletTypes;

  /// Allowed wallet currencies for linking.
  final List<dynamic> linkableWalletCurrencies;

  /// If the currency of trading account is the same as wallet
  final bool linkableToDifferentCurrency;

  /// Allowed currencies for creating this trading account type, used currencies or disallowed currencies are not listed.
  final List<dynamic> currenciesAvailable;
}

/// Deriv class.
class Deriv extends DerivModel {
  /// Initializes Deriv class.
  const Deriv({
    required List<dynamic> currenciesAvailable,
    required bool linkableToDifferentCurrency,
    required List<dynamic> linkableWalletCurrencies,
    required List<LinkableWalletTypesItemEnum> linkableWalletTypes,
  }) : super(
          currenciesAvailable: currenciesAvailable,
          linkableToDifferentCurrency: linkableToDifferentCurrency,
          linkableWalletCurrencies: linkableWalletCurrencies,
          linkableWalletTypes: linkableWalletTypes,
        );

  /// Creates an instance from JSON.
  factory Deriv.fromJson(Map<String, dynamic> json) => Deriv(
        currenciesAvailable: List<dynamic>.from(
          json['currencies_available'].map(
            (dynamic item) => item,
          ),
        ),
        linkableToDifferentCurrency:
            getBool(json['linkable_to_different_currency'])!,
        linkableWalletCurrencies: List<dynamic>.from(
          json['linkable_wallet_currencies'].map(
            (dynamic item) => item,
          ),
        ),
        linkableWalletTypes: List<LinkableWalletTypesItemEnum>.from(
          json['linkable_wallet_types'].map(
            (dynamic item) =>
                item == null ? null : linkableWalletTypesItemEnumMapper[item],
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies_available'] = currenciesAvailable
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    resultMap['linkable_to_different_currency'] = linkableToDifferentCurrency;
    resultMap['linkable_wallet_currencies'] = linkableWalletCurrencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    resultMap['linkable_wallet_types'] = linkableWalletTypes
        .map<dynamic>(
          (LinkableWalletTypesItemEnum item) =>
              linkableWalletTypesItemEnumMapper.entries
                  .firstWhere(
                      (MapEntry<String, LinkableWalletTypesItemEnum> entry) =>
                          entry.value == item)
                  .key,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Deriv copyWith({
    List<dynamic>? currenciesAvailable,
    bool? linkableToDifferentCurrency,
    List<dynamic>? linkableWalletCurrencies,
    List<LinkableWalletTypesItemEnum>? linkableWalletTypes,
  }) =>
      Deriv(
        currenciesAvailable: currenciesAvailable ?? this.currenciesAvailable,
        linkableToDifferentCurrency:
            linkableToDifferentCurrency ?? this.linkableToDifferentCurrency,
        linkableWalletCurrencies:
            linkableWalletCurrencies ?? this.linkableWalletCurrencies,
        linkableWalletTypes: linkableWalletTypes ?? this.linkableWalletTypes,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Derivx model class.
abstract class DerivxModel extends Equatable {
  /// Initializes Derivx model class .
  const DerivxModel({
    required this.linkableWalletTypes,
    required this.linkableWalletCurrencies,
    required this.linkableToDifferentCurrency,
    required this.currenciesAvailable,
  });

  /// Linkable wallets types available.
  final List<DerivxLinkableWalletTypesItemEnum> linkableWalletTypes;

  /// Allowed wallet currencies.
  final List<dynamic> linkableWalletCurrencies;

  /// If the currency of trading account is the same as wallet
  final bool linkableToDifferentCurrency;

  /// Allowed currencies for creating this trading account type, used currencies or disallowed currencies are not listed.
  final List<dynamic> currenciesAvailable;
}

/// Derivx class.
class Derivx extends DerivxModel {
  /// Initializes Derivx class.
  const Derivx({
    required List<dynamic> currenciesAvailable,
    required bool linkableToDifferentCurrency,
    required List<dynamic> linkableWalletCurrencies,
    required List<DerivxLinkableWalletTypesItemEnum> linkableWalletTypes,
  }) : super(
          currenciesAvailable: currenciesAvailable,
          linkableToDifferentCurrency: linkableToDifferentCurrency,
          linkableWalletCurrencies: linkableWalletCurrencies,
          linkableWalletTypes: linkableWalletTypes,
        );

  /// Creates an instance from JSON.
  factory Derivx.fromJson(Map<String, dynamic> json) => Derivx(
        currenciesAvailable: List<dynamic>.from(
          json['currencies_available'].map(
            (dynamic item) => item,
          ),
        ),
        linkableToDifferentCurrency:
            getBool(json['linkable_to_different_currency'])!,
        linkableWalletCurrencies: List<dynamic>.from(
          json['linkable_wallet_currencies'].map(
            (dynamic item) => item,
          ),
        ),
        linkableWalletTypes: List<DerivxLinkableWalletTypesItemEnum>.from(
          json['linkable_wallet_types'].map(
            (dynamic item) => item == null
                ? null
                : derivxLinkableWalletTypesItemEnumMapper[item],
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies_available'] = currenciesAvailable
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    resultMap['linkable_to_different_currency'] = linkableToDifferentCurrency;
    resultMap['linkable_wallet_currencies'] = linkableWalletCurrencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    resultMap['linkable_wallet_types'] = linkableWalletTypes
        .map<dynamic>(
          (DerivxLinkableWalletTypesItemEnum item) =>
              derivxLinkableWalletTypesItemEnumMapper.entries
                  .firstWhere(
                      (MapEntry<String, DerivxLinkableWalletTypesItemEnum>
                              entry) =>
                          entry.value == item)
                  .key,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Derivx copyWith({
    List<dynamic>? currenciesAvailable,
    bool? linkableToDifferentCurrency,
    List<dynamic>? linkableWalletCurrencies,
    List<DerivxLinkableWalletTypesItemEnum>? linkableWalletTypes,
  }) =>
      Derivx(
        currenciesAvailable: currenciesAvailable ?? this.currenciesAvailable,
        linkableToDifferentCurrency:
            linkableToDifferentCurrency ?? this.linkableToDifferentCurrency,
        linkableWalletCurrencies:
            linkableWalletCurrencies ?? this.linkableWalletCurrencies,
        linkableWalletTypes: linkableWalletTypes ?? this.linkableWalletTypes,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Mt5 model class.
abstract class Mt5Model extends Equatable {
  /// Initializes Mt5 model class .
  const Mt5Model({
    required this.linkableWalletTypes,
    required this.linkableWalletCurrencies,
    required this.linkableToDifferentCurrency,
    required this.currenciesAvailable,
  });

  /// Linkable wallets types available.
  final List<Mt5LinkableWalletTypesItemEnum> linkableWalletTypes;

  /// Allowed wallet currencies.
  final List<dynamic> linkableWalletCurrencies;

  /// If the currency of trading account is the same as wallet
  final bool linkableToDifferentCurrency;

  /// Allowed currencies for creating this trading account type, used currencies or disallowed currencies are not listed.
  final List<dynamic> currenciesAvailable;
}

/// Mt5 class.
class Mt5 extends Mt5Model {
  /// Initializes Mt5 class.
  const Mt5({
    required List<dynamic> currenciesAvailable,
    required bool linkableToDifferentCurrency,
    required List<dynamic> linkableWalletCurrencies,
    required List<Mt5LinkableWalletTypesItemEnum> linkableWalletTypes,
  }) : super(
          currenciesAvailable: currenciesAvailable,
          linkableToDifferentCurrency: linkableToDifferentCurrency,
          linkableWalletCurrencies: linkableWalletCurrencies,
          linkableWalletTypes: linkableWalletTypes,
        );

  /// Creates an instance from JSON.
  factory Mt5.fromJson(Map<String, dynamic> json) => Mt5(
        currenciesAvailable: List<dynamic>.from(
          json['currencies_available'].map(
            (dynamic item) => item,
          ),
        ),
        linkableToDifferentCurrency:
            getBool(json['linkable_to_different_currency'])!,
        linkableWalletCurrencies: List<dynamic>.from(
          json['linkable_wallet_currencies'].map(
            (dynamic item) => item,
          ),
        ),
        linkableWalletTypes: List<Mt5LinkableWalletTypesItemEnum>.from(
          json['linkable_wallet_types'].map(
            (dynamic item) => item == null
                ? null
                : mt5LinkableWalletTypesItemEnumMapper[item],
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies_available'] = currenciesAvailable
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    resultMap['linkable_to_different_currency'] = linkableToDifferentCurrency;
    resultMap['linkable_wallet_currencies'] = linkableWalletCurrencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    resultMap['linkable_wallet_types'] = linkableWalletTypes
        .map<dynamic>(
          (Mt5LinkableWalletTypesItemEnum item) =>
              mt5LinkableWalletTypesItemEnumMapper.entries
                  .firstWhere((MapEntry<String, Mt5LinkableWalletTypesItemEnum>
                          entry) =>
                      entry.value == item)
                  .key,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5 copyWith({
    List<dynamic>? currenciesAvailable,
    bool? linkableToDifferentCurrency,
    List<dynamic>? linkableWalletCurrencies,
    List<Mt5LinkableWalletTypesItemEnum>? linkableWalletTypes,
  }) =>
      Mt5(
        currenciesAvailable: currenciesAvailable ?? this.currenciesAvailable,
        linkableToDifferentCurrency:
            linkableToDifferentCurrency ?? this.linkableToDifferentCurrency,
        linkableWalletCurrencies:
            linkableWalletCurrencies ?? this.linkableWalletCurrencies,
        linkableWalletTypes: linkableWalletTypes ?? this.linkableWalletTypes,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Wallet model class.
abstract class WalletModel extends Equatable {
  /// Initializes Wallet model class .
  const WalletModel({
    required this.paClient,
    required this.pa,
    required this.p2p,
    required this.fiat,
    required this.crypto,
  });

  /// Details of the pa_client wallets.
  final PaClient paClient;

  /// Details of the pa wallets.
  final Pa pa;

  /// Details of the p2p wallets.
  final P2p p2p;

  /// Details of the fiat wallets.
  final Fiat fiat;

  /// Details of the crypto wallets.
  final Crypto crypto;
}

/// Wallet class.
class Wallet extends WalletModel {
  /// Initializes Wallet class.
  const Wallet({
    required Crypto crypto,
    required Fiat fiat,
    required P2p p2p,
    required Pa pa,
    required PaClient paClient,
  }) : super(
          crypto: crypto,
          fiat: fiat,
          p2p: p2p,
          pa: pa,
          paClient: paClient,
        );

  /// Creates an instance from JSON.
  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        crypto: Crypto.fromJson(json['crypto']),
        fiat: Fiat.fromJson(json['fiat']),
        p2p: P2p.fromJson(json['p2p']),
        pa: Pa.fromJson(json['pa']),
        paClient: PaClient.fromJson(json['pa_client']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['crypto'] = crypto.toJson();

    resultMap['fiat'] = fiat.toJson();

    resultMap['p2p'] = p2p.toJson();

    resultMap['pa'] = pa.toJson();

    resultMap['pa_client'] = paClient.toJson();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Wallet copyWith({
    Crypto? crypto,
    Fiat? fiat,
    P2p? p2p,
    Pa? pa,
    PaClient? paClient,
  }) =>
      Wallet(
        crypto: crypto ?? this.crypto,
        fiat: fiat ?? this.fiat,
        p2p: p2p ?? this.p2p,
        pa: pa ?? this.pa,
        paClient: paClient ?? this.paClient,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Crypto model class.
abstract class CryptoModel extends Equatable {
  /// Initializes Crypto model class .
  const CryptoModel({
    required this.currencies,
  });

  /// Currencies that are available
  final List<dynamic> currencies;
}

/// Crypto class.
class Crypto extends CryptoModel {
  /// Initializes Crypto class.
  const Crypto({
    required List<dynamic> currencies,
  }) : super(
          currencies: currencies,
        );

  /// Creates an instance from JSON.
  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        currencies: List<dynamic>.from(
          json['currencies'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies'] = currencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Crypto copyWith({
    List<dynamic>? currencies,
  }) =>
      Crypto(
        currencies: currencies ?? this.currencies,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Fiat model class.
abstract class FiatModel extends Equatable {
  /// Initializes Fiat model class .
  const FiatModel({
    required this.currencies,
  });

  /// Currencies that are available
  final List<dynamic> currencies;
}

/// Fiat class.
class Fiat extends FiatModel {
  /// Initializes Fiat class.
  const Fiat({
    required List<dynamic> currencies,
  }) : super(
          currencies: currencies,
        );

  /// Creates an instance from JSON.
  factory Fiat.fromJson(Map<String, dynamic> json) => Fiat(
        currencies: List<dynamic>.from(
          json['currencies'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies'] = currencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Fiat copyWith({
    List<dynamic>? currencies,
  }) =>
      Fiat(
        currencies: currencies ?? this.currencies,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// P2p model class.
abstract class P2pModel extends Equatable {
  /// Initializes P2p model class .
  const P2pModel({
    required this.currencies,
  });

  /// Currencies that are available
  final List<dynamic> currencies;
}

/// P2p class.
class P2p extends P2pModel {
  /// Initializes P2p class.
  const P2p({
    required List<dynamic> currencies,
  }) : super(
          currencies: currencies,
        );

  /// Creates an instance from JSON.
  factory P2p.fromJson(Map<String, dynamic> json) => P2p(
        currencies: List<dynamic>.from(
          json['currencies'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies'] = currencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2p copyWith({
    List<dynamic>? currencies,
  }) =>
      P2p(
        currencies: currencies ?? this.currencies,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Pa model class.
abstract class PaModel extends Equatable {
  /// Initializes Pa model class .
  const PaModel({
    required this.currencies,
  });

  /// Currencies that are available
  final List<dynamic> currencies;
}

/// Pa class.
class Pa extends PaModel {
  /// Initializes Pa class.
  const Pa({
    required List<dynamic> currencies,
  }) : super(
          currencies: currencies,
        );

  /// Creates an instance from JSON.
  factory Pa.fromJson(Map<String, dynamic> json) => Pa(
        currencies: List<dynamic>.from(
          json['currencies'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies'] = currencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Pa copyWith({
    List<dynamic>? currencies,
  }) =>
      Pa(
        currencies: currencies ?? this.currencies,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Pa client model class.
abstract class PaClientModel extends Equatable {
  /// Initializes Pa client model class .
  const PaClientModel({
    required this.currencies,
  });

  /// Currencies that are available
  final List<dynamic> currencies;
}

/// Pa client class.
class PaClient extends PaClientModel {
  /// Initializes Pa client class.
  const PaClient({
    required List<dynamic> currencies,
  }) : super(
          currencies: currencies,
        );

  /// Creates an instance from JSON.
  factory PaClient.fromJson(Map<String, dynamic> json) => PaClient(
        currencies: List<dynamic>.from(
          json['currencies'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies'] = currencies
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaClient copyWith({
    List<dynamic>? currencies,
  }) =>
      PaClient(
        currencies: currencies ?? this.currencies,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
