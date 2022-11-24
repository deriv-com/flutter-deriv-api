// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Get account types response model class.
abstract class GetAccountTypesResponseModel {
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
}
/// Get account types model class.
abstract class GetAccountTypesModel {
  /// Initializes Get account types model class .
  const GetAccountTypesModel({
    required this.wallet,
    required this.trading,
    this.binary,
    this.derivx,
    this.mt5,
  });

  /// Details of the wallet accounts.
  final Wallet wallet;

  /// Trading accounts can trade in the Deriv website and apps
  final Trading trading;

  /// Traditional accounts of binary.com
  final Binary? binary;

  /// The accuonts created for the DerivX platform
  final Derivx? derivx;

  /// Accounts created for the MT5 platfrom
  final Mt5? mt5;
}

/// Get account types class.
class GetAccountTypes extends GetAccountTypesModel {
  /// Initializes Get account types class.
  const GetAccountTypes({
    required Trading trading,
    required Wallet wallet,
    Binary? binary,
    Derivx? derivx,
    Mt5? mt5,
  }) : super(
          trading: trading,
          wallet: wallet,
          binary: binary,
          derivx: derivx,
          mt5: mt5,
        );

  /// Creates an instance from JSON.
  factory GetAccountTypes.fromJson(Map<String, dynamic> json) =>
      GetAccountTypes(
        trading: Trading.fromJson(json['trading']),
        wallet: Wallet.fromJson(json['wallet']),
        binary: json['binary'] == null ? null : Binary.fromJson(json['binary']),
        derivx: json['derivx'] == null ? null : Derivx.fromJson(json['derivx']),
        mt5: json['mt5'] == null ? null : Mt5.fromJson(json['mt5']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading'] = trading.toJson();

    resultMap['wallet'] = wallet.toJson();

    if (binary != null) {
      resultMap['binary'] = binary!.toJson();
    }
    if (derivx != null) {
      resultMap['derivx'] = derivx!.toJson();
    }
    if (mt5 != null) {
      resultMap['mt5'] = mt5!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAccountTypes copyWith({
    Trading? trading,
    Wallet? wallet,
    Binary? binary,
    Derivx? derivx,
    Mt5? mt5,
  }) =>
      GetAccountTypes(
        trading: trading ?? this.trading,
        wallet: wallet ?? this.wallet,
        binary: binary ?? this.binary,
        derivx: derivx ?? this.derivx,
        mt5: mt5 ?? this.mt5,
      );
}
/// Trading model class.
abstract class TradingModel {
  /// Initializes Trading model class .
  const TradingModel({
    required this.real,
    required this.demo,
  });

  /// Real trading acocounts
  final Map<String, dynamic> real;

  /// Demo trading account
  final Map<String, dynamic> demo;
}

/// Trading class.
class Trading extends TradingModel {
  /// Initializes Trading class.
  const Trading({
    required Map<String, dynamic> demo,
    required Map<String, dynamic> real,
  }) : super(
          demo: demo,
          real: real,
        );

  /// Creates an instance from JSON.
  factory Trading.fromJson(Map<String, dynamic> json) => Trading(
        demo: json['demo'],
        real: json['real'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['demo'] = demo;
    resultMap['real'] = real;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Trading copyWith({
    Map<String, dynamic>? demo,
    Map<String, dynamic>? real,
  }) =>
      Trading(
        demo: demo ?? this.demo,
        real: real ?? this.real,
      );
}
/// Wallet model class.
abstract class WalletModel {
  /// Initializes Wallet model class .
  const WalletModel({
    required this.paymentagentClient,
    required this.paymentagent,
    required this.p2p,
    required this.fiat,
    required this.demo,
    required this.crypto,
    required this.affiliate,
  });

  /// Can receive funds from a payment agent
  final Map<String, dynamic> paymentagentClient;

  /// Can act as a payment agent to other clients
  final Map<String, dynamic> paymentagent;

  /// Can buy/sell using P2P exchanges
  final Map<String, dynamic> p2p;

  /// Can deposit and withdraw through the primary cashier
  final Map<String, dynamic> fiat;

  /// Demo wallets, linkable to demo accounts only
  final Map<String, dynamic> demo;

  /// Can deposit and withdraw through the crypto-cashier
  final Map<String, dynamic> crypto;

  /// Can receive affiliate commissions
  final Map<String, dynamic> affiliate;
}

/// Wallet class.
class Wallet extends WalletModel {
  /// Initializes Wallet class.
  const Wallet({
    required Map<String, dynamic> affiliate,
    required Map<String, dynamic> crypto,
    required Map<String, dynamic> demo,
    required Map<String, dynamic> fiat,
    required Map<String, dynamic> p2p,
    required Map<String, dynamic> paymentagent,
    required Map<String, dynamic> paymentagentClient,
  }) : super(
          affiliate: affiliate,
          crypto: crypto,
          demo: demo,
          fiat: fiat,
          p2p: p2p,
          paymentagent: paymentagent,
          paymentagentClient: paymentagentClient,
        );

  /// Creates an instance from JSON.
  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        affiliate: json['affiliate'],
        crypto: json['crypto'],
        demo: json['demo'],
        fiat: json['fiat'],
        p2p: json['p2p'],
        paymentagent: json['paymentagent'],
        paymentagentClient: json['paymentagent_client'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['affiliate'] = affiliate;
    resultMap['crypto'] = crypto;
    resultMap['demo'] = demo;
    resultMap['fiat'] = fiat;
    resultMap['p2p'] = p2p;
    resultMap['paymentagent'] = paymentagent;
    resultMap['paymentagent_client'] = paymentagentClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Wallet copyWith({
    Map<String, dynamic>? affiliate,
    Map<String, dynamic>? crypto,
    Map<String, dynamic>? demo,
    Map<String, dynamic>? fiat,
    Map<String, dynamic>? p2p,
    Map<String, dynamic>? paymentagent,
    Map<String, dynamic>? paymentagentClient,
  }) =>
      Wallet(
        affiliate: affiliate ?? this.affiliate,
        crypto: crypto ?? this.crypto,
        demo: demo ?? this.demo,
        fiat: fiat ?? this.fiat,
        p2p: p2p ?? this.p2p,
        paymentagent: paymentagent ?? this.paymentagent,
        paymentagentClient: paymentagentClient ?? this.paymentagentClient,
      );
}
/// Binary model class.
abstract class BinaryModel {
  /// Initializes Binary model class .
  const BinaryModel({
    required this.real,
    required this.demo,
  });

  /// Real acocount
  final Map<String, dynamic> real;

  /// Demo account
  final Map<String, dynamic> demo;
}

/// Binary class.
class Binary extends BinaryModel {
  /// Initializes Binary class.
  const Binary({
    required Map<String, dynamic> demo,
    required Map<String, dynamic> real,
  }) : super(
          demo: demo,
          real: real,
        );

  /// Creates an instance from JSON.
  factory Binary.fromJson(Map<String, dynamic> json) => Binary(
        demo: json['demo'],
        real: json['real'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['demo'] = demo;
    resultMap['real'] = real;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Binary copyWith({
    Map<String, dynamic>? demo,
    Map<String, dynamic>? real,
  }) =>
      Binary(
        demo: demo ?? this.demo,
        real: real ?? this.real,
      );
}
/// Derivx model class.
abstract class DerivxModel {
  /// Initializes Derivx model class .
  const DerivxModel({
    required this.real,
    required this.demo,
  });

  /// Real acocount
  final Map<String, dynamic> real;

  /// Demo account
  final Map<String, dynamic> demo;
}

/// Derivx class.
class Derivx extends DerivxModel {
  /// Initializes Derivx class.
  const Derivx({
    required Map<String, dynamic> demo,
    required Map<String, dynamic> real,
  }) : super(
          demo: demo,
          real: real,
        );

  /// Creates an instance from JSON.
  factory Derivx.fromJson(Map<String, dynamic> json) => Derivx(
        demo: json['demo'],
        real: json['real'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['demo'] = demo;
    resultMap['real'] = real;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Derivx copyWith({
    Map<String, dynamic>? demo,
    Map<String, dynamic>? real,
  }) =>
      Derivx(
        demo: demo ?? this.demo,
        real: real ?? this.real,
      );
}
/// Mt5 model class.
abstract class Mt5Model {
  /// Initializes Mt5 model class .
  const Mt5Model({
    required this.gaming,
    required this.financial,
    required this.demo,
  });

  /// MT5 trading with synthetic indices
  final Map<String, dynamic> gaming;

  /// MT5 trading with finacial indices
  final Map<String, dynamic> financial;

  /// Demo account
  final Map<String, dynamic> demo;
}

/// Mt5 class.
class Mt5 extends Mt5Model {
  /// Initializes Mt5 class.
  const Mt5({
    required Map<String, dynamic> demo,
    required Map<String, dynamic> financial,
    required Map<String, dynamic> gaming,
  }) : super(
          demo: demo,
          financial: financial,
          gaming: gaming,
        );

  /// Creates an instance from JSON.
  factory Mt5.fromJson(Map<String, dynamic> json) => Mt5(
        demo: json['demo'],
        financial: json['financial'],
        gaming: json['gaming'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['demo'] = demo;
    resultMap['financial'] = financial;
    resultMap['gaming'] = gaming;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5 copyWith({
    Map<String, dynamic>? demo,
    Map<String, dynamic>? financial,
    Map<String, dynamic>? gaming,
  }) =>
      Mt5(
        demo: demo ?? this.demo,
        financial: financial ?? this.financial,
        gaming: gaming ?? this.gaming,
      );
}
