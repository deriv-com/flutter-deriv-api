// ignore_for_file: prefer_single_quotes

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Service token response model class.
abstract class ServiceTokenResponseModel extends Equatable {
  /// Initializes Service token response model class .
  const ServiceTokenResponseModel({
    this.serviceToken,
  });

  /// Service specific tokens and data.
  final ServiceToken? serviceToken;
}

/// Service token response class.
class ServiceTokenResponse extends ServiceTokenResponseModel {
  /// Initializes Service token response class.
  const ServiceTokenResponse({
    ServiceToken? serviceToken,
  }) : super(
          serviceToken: serviceToken,
        );

  /// Creates an instance from JSON.
  factory ServiceTokenResponse.fromJson(
    dynamic serviceTokenJson,
  ) =>
      ServiceTokenResponse(
        serviceToken: serviceTokenJson == null
            ? null
            : ServiceToken.fromJson(serviceTokenJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (serviceToken != null) {
      resultMap['service_token'] = serviceToken!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ServiceTokenResponse copyWith({
    ServiceToken? serviceToken,
  }) =>
      ServiceTokenResponse(
        serviceToken: serviceToken ?? this.serviceToken,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Service token model class.
abstract class ServiceTokenModel extends Equatable {
  /// Initializes Service token model class .
  const ServiceTokenModel({
    this.banxa,
    this.dxtrade,
    this.onfido,
    this.sendbird,
    this.wyre,
  });

  /// Banxa order data.
  final Banxa? banxa;

  /// Deriv X data.
  final Dxtrade? dxtrade;

  /// Onfido data.
  final Onfido? onfido;

  /// Sendbird data.
  final Sendbird? sendbird;

  /// Wyre reservation data.
  final Wyre? wyre;
}

/// Service token class.
class ServiceToken extends ServiceTokenModel {
  /// Initializes Service token class.
  const ServiceToken({
    Banxa? banxa,
    Dxtrade? dxtrade,
    Onfido? onfido,
    Sendbird? sendbird,
    Wyre? wyre,
  }) : super(
          banxa: banxa,
          dxtrade: dxtrade,
          onfido: onfido,
          sendbird: sendbird,
          wyre: wyre,
        );

  /// Creates an instance from JSON.
  factory ServiceToken.fromJson(Map<String, dynamic> json) => ServiceToken(
        banxa: json['banxa'] == null ? null : Banxa.fromJson(json['banxa']),
        dxtrade:
            json['dxtrade'] == null ? null : Dxtrade.fromJson(json['dxtrade']),
        onfido: json['onfido'] == null ? null : Onfido.fromJson(json['onfido']),
        sendbird: json['sendbird'] == null
            ? null
            : Sendbird.fromJson(json['sendbird']),
        wyre: json['wyre'] == null ? null : Wyre.fromJson(json['wyre']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (banxa != null) {
      resultMap['banxa'] = banxa!.toJson();
    }
    if (dxtrade != null) {
      resultMap['dxtrade'] = dxtrade!.toJson();
    }
    if (onfido != null) {
      resultMap['onfido'] = onfido!.toJson();
    }
    if (sendbird != null) {
      resultMap['sendbird'] = sendbird!.toJson();
    }
    if (wyre != null) {
      resultMap['wyre'] = wyre!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ServiceToken copyWith({
    Banxa? banxa,
    Dxtrade? dxtrade,
    Onfido? onfido,
    Sendbird? sendbird,
    Wyre? wyre,
  }) =>
      ServiceToken(
        banxa: banxa ?? this.banxa,
        dxtrade: dxtrade ?? this.dxtrade,
        onfido: onfido ?? this.onfido,
        sendbird: sendbird ?? this.sendbird,
        wyre: wyre ?? this.wyre,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Banxa model class.
abstract class BanxaModel extends Equatable {
  /// Initializes Banxa model class .
  const BanxaModel({
    this.token,
    this.url,
    this.urlIframe,
  });

  /// Created order id reference token.
  final String? token;

  /// Banxa order checkout url.
  final String? url;

  /// Banxa order checkout iframe url.
  final String? urlIframe;
}

/// Banxa class.
class Banxa extends BanxaModel {
  /// Initializes Banxa class.
  const Banxa({
    String? token,
    String? url,
    String? urlIframe,
  }) : super(
          token: token,
          url: url,
          urlIframe: urlIframe,
        );

  /// Creates an instance from JSON.
  factory Banxa.fromJson(Map<String, dynamic> json) => Banxa(
        token: json['token'],
        url: json['url'],
        urlIframe: json['url_iframe'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;
    resultMap['url'] = url;
    resultMap['url_iframe'] = urlIframe;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Banxa copyWith({
    String? token,
    String? url,
    String? urlIframe,
  }) =>
      Banxa(
        token: token ?? this.token,
        url: url ?? this.url,
        urlIframe: urlIframe ?? this.urlIframe,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Dxtrade model class.
abstract class DxtradeModel extends Equatable {
  /// Initializes Dxtrade model class .
  const DxtradeModel({
    this.token,
  });

  /// Deriv X login token.
  final String? token;
}

/// Dxtrade class.
class Dxtrade extends DxtradeModel {
  /// Initializes Dxtrade class.
  const Dxtrade({
    String? token,
  }) : super(
          token: token,
        );

  /// Creates an instance from JSON.
  factory Dxtrade.fromJson(Map<String, dynamic> json) => Dxtrade(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Dxtrade copyWith({
    String? token,
  }) =>
      Dxtrade(
        token: token ?? this.token,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Onfido model class.
abstract class OnfidoModel extends Equatable {
  /// Initializes Onfido model class .
  const OnfidoModel({
    this.token,
  });

  /// Onfido token.
  final String? token;
}

/// Onfido class.
class Onfido extends OnfidoModel {
  /// Initializes Onfido class.
  const Onfido({
    String? token,
  }) : super(
          token: token,
        );

  /// Creates an instance from JSON.
  factory Onfido.fromJson(Map<String, dynamic> json) => Onfido(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Onfido copyWith({
    String? token,
  }) =>
      Onfido(
        token: token ?? this.token,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Sendbird model class.
abstract class SendbirdModel extends Equatable {
  /// Initializes Sendbird model class .
  const SendbirdModel({
    this.appId,
    this.expiryTime,
    this.token,
  });

  /// Sendbird application ID.
  final String? appId;

  /// The epoch time in which the token will be expired. Note: the token could be expired sooner than this, due to different reasons.
  final DateTime? expiryTime;

  /// Sendbird token.
  final String? token;
}

/// Sendbird class.
class Sendbird extends SendbirdModel {
  /// Initializes Sendbird class.
  const Sendbird({
    String? appId,
    DateTime? expiryTime,
    String? token,
  }) : super(
          appId: appId,
          expiryTime: expiryTime,
          token: token,
        );

  /// Creates an instance from JSON.
  factory Sendbird.fromJson(Map<String, dynamic> json) => Sendbird(
        appId: json['app_id'],
        expiryTime: getDateTime(json['expiry_time']),
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['expiry_time'] = getSecondsSinceEpochDateTime(expiryTime);
    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Sendbird copyWith({
    String? appId,
    DateTime? expiryTime,
    String? token,
  }) =>
      Sendbird(
        appId: appId ?? this.appId,
        expiryTime: expiryTime ?? this.expiryTime,
        token: token ?? this.token,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Wyre model class.
abstract class WyreModel extends Equatable {
  /// Initializes Wyre model class .
  const WyreModel({
    this.token,
    this.url,
  });

  /// Wyre reservation id token
  final String? token;

  /// Wyre reservation URL
  final String? url;
}

/// Wyre class.
class Wyre extends WyreModel {
  /// Initializes Wyre class.
  const Wyre({
    String? token,
    String? url,
  }) : super(
          token: token,
          url: url,
        );

  /// Creates an instance from JSON.
  factory Wyre.fromJson(Map<String, dynamic> json) => Wyre(
        token: json['token'],
        url: json['url'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;
    resultMap['url'] = url;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Wyre copyWith({
    String? token,
    String? url,
  }) =>
      Wyre(
        token: token ?? this.token,
        url: url ?? this.url,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
