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
    this.freshworksAuthJwt,
    this.freshworksUserJwt,
    this.intercom,
    this.onfido,
    this.sendbird,
    this.smileid,
    this.supabase,
  });

  /// Banxa order data.
  final Banxa? banxa;

  /// CTrader data.
  final Ctrader? ctrader;

  /// Deriv X data.
  final Dxtrade? dxtrade;

  /// Freshchat data.
  final FreshworksAuthJwt? freshworksAuthJwt;

  /// Freshchat data.
  final FreshworksUserJwt? freshworksUserJwt;

  /// Intercom data.
  final Intercom? intercom;

  /// Onfido data.
  final Onfido? onfido;

  /// Sendbird data.
  final Sendbird? sendbird;

  /// SmileID data.
  final Smileid? smileid;

  /// Supabase token.
  final Supabase? supabase;
}

/// Service token class.
class ServiceToken extends ServiceTokenModel {
  /// Initializes Service token class.
  const ServiceToken({
    super.banxa,
    super.ctrader,
    super.dxtrade,
    super.freshworksAuthJwt,
    super.freshworksUserJwt,
    super.intercom,
    super.onfido,
    super.sendbird,
    super.smileid,
    super.supabase,
  });

  /// Creates an instance from JSON.
  factory ServiceToken.fromJson(Map<String, dynamic> json) => ServiceToken(
        banxa: json['banxa'] == null ? null : Banxa.fromJson(json['banxa']),
        ctrader:
            json['ctrader'] == null ? null : Ctrader.fromJson(json['ctrader']),
        dxtrade:
            json['dxtrade'] == null ? null : Dxtrade.fromJson(json['dxtrade']),
        freshworksAuthJwt: json['freshworks_auth_jwt'] == null
            ? null
            : FreshworksAuthJwt.fromJson(json['freshworks_auth_jwt']),
        freshworksUserJwt: json['freshworks_user_jwt'] == null
            ? null
            : FreshworksUserJwt.fromJson(json['freshworks_user_jwt']),
        intercom: json['intercom'] == null
            ? null
            : Intercom.fromJson(json['intercom']),
        onfido: json['onfido'] == null ? null : Onfido.fromJson(json['onfido']),
        sendbird: json['sendbird'] == null
            ? null
            : Sendbird.fromJson(json['sendbird']),
        smileid:
            json['smileid'] == null ? null : Smileid.fromJson(json['smileid']),
        supabase: json['supabase'] == null
            ? null
            : Supabase.fromJson(json['supabase']),
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
    if (freshworksAuthJwt != null) {
      resultMap['freshworks_auth_jwt'] = freshworksAuthJwt!.toJson();
    }
    if (freshworksUserJwt != null) {
      resultMap['freshworks_user_jwt'] = freshworksUserJwt!.toJson();
    }
    if (intercom != null) {
      resultMap['intercom'] = intercom!.toJson();
    }
    if (onfido != null) {
      resultMap['onfido'] = onfido!.toJson();
    }
    if (sendbird != null) {
      resultMap['sendbird'] = sendbird!.toJson();
    }
    if (smileid != null) {
      resultMap['smileid'] = smileid!.toJson();
    }
    if (supabase != null) {
      resultMap['supabase'] = supabase!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ServiceToken copyWith({
    Banxa? banxa,
    Ctrader? ctrader,
    Dxtrade? dxtrade,
    FreshworksAuthJwt? freshworksAuthJwt,
    FreshworksUserJwt? freshworksUserJwt,
    Intercom? intercom,
    Onfido? onfido,
    Sendbird? sendbird,
    Smileid? smileid,
    Supabase? supabase,
  }) =>
      ServiceToken(
        banxa: banxa ?? this.banxa,
        ctrader: ctrader ?? this.ctrader,
        dxtrade: dxtrade ?? this.dxtrade,
        freshworksAuthJwt: freshworksAuthJwt ?? this.freshworksAuthJwt,
        freshworksUserJwt: freshworksUserJwt ?? this.freshworksUserJwt,
        intercom: intercom ?? this.intercom,
        onfido: onfido ?? this.onfido,
        sendbird: sendbird ?? this.sendbird,
        smileid: smileid ?? this.smileid,
        supabase: supabase ?? this.supabase,
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
/// Freshworks auth jwt model class.
abstract class FreshworksAuthJwtModel {
  /// Initializes Freshworks auth jwt model class .
  const FreshworksAuthJwtModel({
    this.token,
  });

  /// Freshchat auth JWT token.
  final String? token;
}

/// Freshworks auth jwt class.
class FreshworksAuthJwt extends FreshworksAuthJwtModel {
  /// Initializes Freshworks auth jwt class.
  const FreshworksAuthJwt({
    super.token,
  });

  /// Creates an instance from JSON.
  factory FreshworksAuthJwt.fromJson(Map<String, dynamic> json) =>
      FreshworksAuthJwt(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FreshworksAuthJwt copyWith({
    String? token,
  }) =>
      FreshworksAuthJwt(
        token: token ?? this.token,
      );
}
/// Freshworks user jwt model class.
abstract class FreshworksUserJwtModel {
  /// Initializes Freshworks user jwt model class .
  const FreshworksUserJwtModel({
    this.token,
  });

  /// Freshchat user JWT token.
  final String? token;
}

/// Freshworks user jwt class.
class FreshworksUserJwt extends FreshworksUserJwtModel {
  /// Initializes Freshworks user jwt class.
  const FreshworksUserJwt({
    super.token,
  });

  /// Creates an instance from JSON.
  factory FreshworksUserJwt.fromJson(Map<String, dynamic> json) =>
      FreshworksUserJwt(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FreshworksUserJwt copyWith({
    String? token,
  }) =>
      FreshworksUserJwt(
        token: token ?? this.token,
      );
}
/// Intercom model class.
abstract class IntercomModel {
  /// Initializes Intercom model class .
  const IntercomModel({
    this.email,
    this.name,
    this.phone,
    this.signature,
    this.userId,
  });

  /// Email address of the user
  final String? email;

  /// Name of the user
  final String? name;

  /// Phone number of the user
  final String? phone;

  /// Intercom signature.
  final String? signature;

  /// Deriv User ID.
  final String? userId;
}

/// Intercom class.
class Intercom extends IntercomModel {
  /// Initializes Intercom class.
  const Intercom({
    super.email,
    super.name,
    super.phone,
    super.signature,
    super.userId,
  });

  /// Creates an instance from JSON.
  factory Intercom.fromJson(Map<String, dynamic> json) => Intercom(
        email: json['email'],
        name: json['name'],
        phone: json['phone'],
        signature: json['signature'],
        userId: json['user_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['email'] = email;
    resultMap['name'] = name;
    resultMap['phone'] = phone;
    resultMap['signature'] = signature;
    resultMap['user_id'] = userId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Intercom copyWith({
    String? email,
    String? name,
    String? phone,
    String? signature,
    String? userId,
  }) =>
      Intercom(
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        signature: signature ?? this.signature,
        userId: userId ?? this.userId,
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
/// Smileid model class.
abstract class SmileidModel {
  /// Initializes Smileid model class .
  const SmileidModel({
    this.token,
  });

  /// SmileID web token.
  final String? token;
}

/// Smileid class.
class Smileid extends SmileidModel {
  /// Initializes Smileid class.
  const Smileid({
    super.token,
  });

  /// Creates an instance from JSON.
  factory Smileid.fromJson(Map<String, dynamic> json) => Smileid(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Smileid copyWith({
    String? token,
  }) =>
      Smileid(
        token: token ?? this.token,
      );
}
/// Supabase model class.
abstract class SupabaseModel {
  /// Initializes Supabase model class .
  const SupabaseModel({
    this.token,
  });

  /// JWT for Supabase.
  final String? token;
}

/// Supabase class.
class Supabase extends SupabaseModel {
  /// Initializes Supabase class.
  const Supabase({
    super.token,
  });

  /// Creates an instance from JSON.
  factory Supabase.fromJson(Map<String, dynamic> json) => Supabase(
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Supabase copyWith({
    String? token,
  }) =>
      Supabase(
        token: token ?? this.token,
      );
}
