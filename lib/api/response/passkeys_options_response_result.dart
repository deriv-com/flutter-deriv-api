// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_options_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_options_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Passkeys options response model class.
abstract class PasskeysOptionsResponseModel {
  /// Initializes Passkeys options response model class .
  const PasskeysOptionsResponseModel({
    this.passkeysOptions,
  });

  /// Wrapper of the response.
  final PasskeysOptions? passkeysOptions;
}

/// Passkeys options response class.
class PasskeysOptionsResponse extends PasskeysOptionsResponseModel {
  /// Initializes Passkeys options response class.
  const PasskeysOptionsResponse({
    super.passkeysOptions,
  });

  /// Creates an instance from JSON.
  factory PasskeysOptionsResponse.fromJson(
    dynamic passkeysOptionsJson,
  ) =>
      PasskeysOptionsResponse(
        passkeysOptions: passkeysOptionsJson == null
            ? null
            : PasskeysOptions.fromJson(passkeysOptionsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (passkeysOptions != null) {
      resultMap['passkeys_options'] = passkeysOptions!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysOptionsResponse copyWith({
    PasskeysOptions? passkeysOptions,
  }) =>
      PasskeysOptionsResponse(
        passkeysOptions: passkeysOptions ?? this.passkeysOptions,
      );
}

/// TransportsItemEnum mapper.
final Map<String, TransportsItemEnum> transportsItemEnumMapper =
    <String, TransportsItemEnum>{
  "usb": TransportsItemEnum.usb,
  "nfc": TransportsItemEnum.nfc,
  "ble": TransportsItemEnum.ble,
  "internal": TransportsItemEnum.internal,
};

/// TransportsItem Enum.
enum TransportsItemEnum {
  /// usb.
  usb,

  /// nfc.
  nfc,

  /// ble.
  ble,

  /// internal.
  internal,
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "public-key": TypeEnum.publicKey,
};

/// Type Enum.
enum TypeEnum {
  /// public-key.
  publicKey,
}

/// UserVerificationEnum mapper.
final Map<String, UserVerificationEnum> userVerificationEnumMapper =
    <String, UserVerificationEnum>{
  "required": UserVerificationEnum.required,
  "preferred": UserVerificationEnum.preferred,
  "discouraged": UserVerificationEnum.discouraged,
};

/// UserVerification Enum.
enum UserVerificationEnum {
  /// required.
  required,

  /// preferred.
  preferred,

  /// discouraged.
  discouraged,
}

/// Passkeys options model class.
abstract class PasskeysOptionsModel {
  /// Initializes Passkeys options model class .
  const PasskeysOptionsModel({
    this.publicKey,
  });

  /// Wrapper of the options.
  final PublicKey? publicKey;
}

/// Passkeys options class.
class PasskeysOptions extends PasskeysOptionsModel {
  /// Initializes Passkeys options class.
  const PasskeysOptions({
    super.publicKey,
  });

  /// Creates an instance from JSON.
  factory PasskeysOptions.fromJson(Map<String, dynamic> json) =>
      PasskeysOptions(
        publicKey: json['publicKey'] == null
            ? null
            : PublicKey.fromJson(json['publicKey']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (publicKey != null) {
      resultMap['publicKey'] = publicKey!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysOptions copyWith({
    PublicKey? publicKey,
  }) =>
      PasskeysOptions(
        publicKey: publicKey ?? this.publicKey,
      );
}

/// Public key model class.
abstract class PublicKeyModel {
  /// Initializes Public key model class .
  const PublicKeyModel({
    this.allowCredentials,
    this.challenge,
    this.extensions,
    this.rpId,
    this.timeout,
    this.userVerification,
  });

  /// List of credentials that are already registered. Only listed credentials are allowed to authenticate.
  final List<AllowCredentialsItem>? allowCredentials;

  /// Random string to be signed by the authenticator. will be byte array base64 encoded.
  final String? challenge;

  /// Empty for now
  final Extensions? extensions;

  /// Relying party id.
  final String? rpId;

  /// Time before expiring the cermony in milliseconds.
  final DateTime? timeout;

  /// Ask the user to enter thier authentication method (PIN, fingerprint, etc). Default is discouraged.
  final UserVerificationEnum? userVerification;
}

/// Public key class.
class PublicKey extends PublicKeyModel {
  /// Initializes Public key class.
  const PublicKey({
    super.allowCredentials,
    super.challenge,
    super.extensions,
    super.rpId,
    super.timeout,
    super.userVerification,
  });

  /// Creates an instance from JSON.
  factory PublicKey.fromJson(Map<String, dynamic> json) => PublicKey(
        allowCredentials: json['allowCredentials'] == null
            ? null
            : List<AllowCredentialsItem>.from(
                json['allowCredentials']?.map(
                  (dynamic item) => AllowCredentialsItem.fromJson(item),
                ),
              ),
        challenge: json['challenge'],
        extensions: json['extensions'] == null
            ? null
            : Extensions.fromJson(json['extensions']),
        rpId: json['rpId'],
        timeout: getDateTime(json['timeout']),
        userVerification: json['userVerification'] == null
            ? null
            : userVerificationEnumMapper[json['userVerification']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (allowCredentials != null) {
      resultMap['allowCredentials'] = allowCredentials!
          .map<dynamic>(
            (AllowCredentialsItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['challenge'] = challenge;
    if (extensions != null) {
      resultMap['extensions'] = extensions!.toJson();
    }
    resultMap['rpId'] = rpId;
    resultMap['timeout'] = getSecondsSinceEpochDateTime(timeout);
    resultMap['userVerification'] = userVerificationEnumMapper.entries
        .firstWhere((MapEntry<String, UserVerificationEnum> entry) =>
            entry.value == userVerification)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PublicKey copyWith({
    List<AllowCredentialsItem>? allowCredentials,
    String? challenge,
    Extensions? extensions,
    String? rpId,
    DateTime? timeout,
    UserVerificationEnum? userVerification,
  }) =>
      PublicKey(
        allowCredentials: allowCredentials ?? this.allowCredentials,
        challenge: challenge ?? this.challenge,
        extensions: extensions ?? this.extensions,
        rpId: rpId ?? this.rpId,
        timeout: timeout ?? this.timeout,
        userVerification: userVerification ?? this.userVerification,
      );
}

/// Allow credentials item model class.
abstract class AllowCredentialsItemModel {
  /// Initializes Allow credentials item model class .
  const AllowCredentialsItemModel({
    this.id,
    this.transports,
    this.type,
  });

  /// The credential id. base64 encoded.
  final String? id;

  /// The transports supported by the authenticator.
  final List<TransportsItemEnum>? transports;

  /// Will be always public-key.
  final TypeEnum? type;
}

/// Allow credentials item class.
class AllowCredentialsItem extends AllowCredentialsItemModel {
  /// Initializes Allow credentials item class.
  const AllowCredentialsItem({
    super.id,
    super.transports,
    super.type,
  });

  /// Creates an instance from JSON.
  factory AllowCredentialsItem.fromJson(Map<String, dynamic> json) =>
      AllowCredentialsItem(
        id: json['id'],
        transports: json['transports'] == null
            ? null
            : List<TransportsItemEnum>.from(
                json['transports']?.map(
                  (dynamic item) =>
                      item == null ? null : transportsItemEnumMapper[item],
                ),
              ),
        type: json['type'] == null ? null : typeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    if (transports != null) {
      resultMap['transports'] = transports!
          .map<dynamic>(
            (TransportsItemEnum item) => transportsItemEnumMapper.entries
                .firstWhere((MapEntry<String, TransportsItemEnum> entry) =>
                    entry.value == item)
                .key,
          )
          .toList();
    }
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AllowCredentialsItem copyWith({
    String? id,
    List<TransportsItemEnum>? transports,
    TypeEnum? type,
  }) =>
      AllowCredentialsItem(
        id: id ?? this.id,
        transports: transports ?? this.transports,
        type: type ?? this.type,
      );
}

/// Extensions model class.
abstract class ExtensionsModel {
  /// Initializes Extensions model class .
  const ExtensionsModel({
    this.exts,
    this.loc,
    this.txAuthGeneric,
    this.txAuthSimple,
    this.uvi,
  });

  /// The exts.
  final bool? exts;

  /// The loc.
  final bool? loc;

  /// The txAuthGeneric.
  final TxAuthGeneric? txAuthGeneric;

  /// The txAuthSimple.
  final String? txAuthSimple;

  /// The uvi.
  final bool? uvi;
}

/// Extensions class.
class Extensions extends ExtensionsModel {
  /// Initializes Extensions class.
  const Extensions({
    super.exts,
    super.loc,
    super.txAuthGeneric,
    super.txAuthSimple,
    super.uvi,
  });

  /// Creates an instance from JSON.
  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
        exts: getBool(json['exts']),
        loc: getBool(json['loc']),
        txAuthGeneric: json['txAuthGeneric'] == null
            ? null
            : TxAuthGeneric.fromJson(json['txAuthGeneric']),
        txAuthSimple: json['txAuthSimple'],
        uvi: getBool(json['uvi']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['exts'] = exts;
    resultMap['loc'] = loc;
    if (txAuthGeneric != null) {
      resultMap['txAuthGeneric'] = txAuthGeneric!.toJson();
    }
    resultMap['txAuthSimple'] = txAuthSimple;
    resultMap['uvi'] = uvi;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Extensions copyWith({
    bool? exts,
    bool? loc,
    TxAuthGeneric? txAuthGeneric,
    String? txAuthSimple,
    bool? uvi,
  }) =>
      Extensions(
        exts: exts ?? this.exts,
        loc: loc ?? this.loc,
        txAuthGeneric: txAuthGeneric ?? this.txAuthGeneric,
        txAuthSimple: txAuthSimple ?? this.txAuthSimple,
        uvi: uvi ?? this.uvi,
      );
}

/// Tx auth generic model class.
abstract class TxAuthGenericModel {
  /// Initializes Tx auth generic model class .
  const TxAuthGenericModel({
    this.content,
    this.contentType,
  });

  /// The content.
  final String? content;

  /// The contentType.
  final String? contentType;
}

/// Tx auth generic class.
class TxAuthGeneric extends TxAuthGenericModel {
  /// Initializes Tx auth generic class.
  const TxAuthGeneric({
    super.content,
    super.contentType,
  });

  /// Creates an instance from JSON.
  factory TxAuthGeneric.fromJson(Map<String, dynamic> json) => TxAuthGeneric(
        content: json['content'],
        contentType: json['contentType'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['content'] = content;
    resultMap['contentType'] = contentType;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TxAuthGeneric copyWith({
    String? content,
    String? contentType,
  }) =>
      TxAuthGeneric(
        content: content ?? this.content,
        contentType: contentType ?? this.contentType,
      );
}
