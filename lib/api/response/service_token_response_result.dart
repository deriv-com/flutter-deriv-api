// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_times_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_times_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Service token response model class.
abstract class ServiceTokenResponseModel {
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
    super.serviceToken,
  });

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

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Service Token.
  ///
  /// Retrieves the authorization token for the specified service.
  /// For parameters information refer to [ServiceTokenRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<ServiceTokenReceive> getServiceTokenRaw(
    ServiceTokenRequest request,
  ) async {
    final ServiceTokenReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Service Token.
  ///
  /// Retrieves the authorization token for the specified service.
  /// For parameters information refer to [ServiceTokenRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<ServiceTokenResponse> getServiceToken(
    ServiceTokenRequest request,
  ) async {
    final ServiceTokenReceive response = await getServiceTokenRaw(request);

    return ServiceTokenResponse.fromJson(response.serviceToken);
  }

  /// Creates a copy of instance with given parameters.
  ServiceTokenResponse copyWith({
    ServiceToken? serviceToken,
  }) =>
      ServiceTokenResponse(
        serviceToken: serviceToken ?? this.serviceToken,
      );
}
/// Service token model class.
abstract class ServiceTokenModel {
  /// Initializes Service token model class .
  const ServiceTokenModel({
    this.banxa,
    this.ctrader,
    this.dxtrade,
    this.onfido,
    this.pandats,
    this.sendbird,
    this.wyre,
  });

  /// Banxa order data.
  final Banxa? banxa;

  /// CTrader data.
  final Ctrader? ctrader;

  /// Deriv X data.
  final Dxtrade? dxtrade;

  /// Onfido data.
  final Onfido? onfido;

  /// Deriv EZ data.
  final Pandats? pandats;

  /// Sendbird data.
  final Sendbird? sendbird;

  /// Wyre reservation data.
  final Wyre? wyre;
}

/// Service token class.
class ServiceToken extends ServiceTokenModel {
  /// Initializes Service token class.
  const ServiceToken({
    super.banxa,
    super.ctrader,
    super.dxtrade,
    super.onfido,
    super.pandats,
    super.sendbird,
    super.wyre,
  });

  /// Creates an instance from JSON.
  factory ServiceToken.fromJson(Map<String, dynamic> json) => ServiceToken(
        banxa: json['banxa'] == null ? null : Banxa.fromJson(json['banxa']),
        ctrader:
            json['ctrader'] == null ? null : Ctrader.fromJson(json['ctrader']),
        dxtrade:
            json['dxtrade'] == null ? null : Dxtrade.fromJson(json['dxtrade']),
        onfido: json['onfido'] == null ? null : Onfido.fromJson(json['onfido']),
        pandats:
            json['pandats'] == null ? null : Pandats.fromJson(json['pandats']),
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
    if (ctrader != null) {
      resultMap['ctrader'] = ctrader!.toJson();
    }
    if (dxtrade != null) {
      resultMap['dxtrade'] = dxtrade!.toJson();
    }
    if (onfido != null) {
      resultMap['onfido'] = onfido!.toJson();
    }
    if (pandats != null) {
      resultMap['pandats'] = pandats!.toJson();
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
    Ctrader? ctrader,
    Dxtrade? dxtrade,
    Onfido? onfido,
    Pandats? pandats,
    Sendbird? sendbird,
    Wyre? wyre,
  }) =>
      ServiceToken(
        banxa: banxa ?? this.banxa,
        ctrader: ctrader ?? this.ctrader,
        dxtrade: dxtrade ?? this.dxtrade,
        onfido: onfido ?? this.onfido,
        pandats: pandats ?? this.pandats,
        sendbird: sendbird ?? this.sendbird,
        wyre: wyre ?? this.wyre,
      );
}
/// Banxa model class.
abstract class BanxaModel {
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
    super.token,
    super.url,
    super.urlIframe,
  });

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
}
/// Ctrader model class.
abstract class CtraderModel {
  /// Initializes Ctrader model class .
  const CtraderModel({
    this.token,
  });

  /// CTrader One Time token
  final String? token;
}

/// Ctrader class.
class Ctrader extends CtraderModel {
  /// Initializes Ctrader class.
  const Ctrader({
    super.token,
  });

  /// Creates an instance from JSON.
  factory Ctrader.fromJson(Map<String, dynamic> json) => Ctrader(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Ctrader copyWith({
    String? token,
  }) =>
      Ctrader(
        token: token ?? this.token,
      );
}
/// Dxtrade model class.
abstract class DxtradeModel {
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
    super.token,
  });

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
}
/// Onfido model class.
abstract class OnfidoModel {
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
    super.token,
  });

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
}
/// Pandats model class.
abstract class PandatsModel {
  /// Initializes Pandats model class .
  const PandatsModel({
    this.token,
  });

  /// Deriv EZ SSO token
  final String? token;
}

/// Pandats class.
class Pandats extends PandatsModel {
  /// Initializes Pandats class.
  const Pandats({
    super.token,
  });

  /// Creates an instance from JSON.
  factory Pandats.fromJson(Map<String, dynamic> json) => Pandats(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Pandats copyWith({
    String? token,
  }) =>
      Pandats(
        token: token ?? this.token,
      );
}
/// Sendbird model class.
abstract class SendbirdModel {
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
    super.appId,
    super.expiryTime,
    super.token,
  });

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
}
/// Wyre model class.
abstract class WyreModel {
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
    super.token,
    super.url,
  });

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
}
