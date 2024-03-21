// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Passkeys register options response model class.
abstract class PasskeysRegisterOptionsResponseModel {
  /// Initializes Passkeys register options response model class .
  const PasskeysRegisterOptionsResponseModel({
    this.passkeysRegisterOptions,
  });

  /// Wrapper of the response.
  final PasskeysRegisterOptions? passkeysRegisterOptions;
}

/// Passkeys register options response class.
class PasskeysRegisterOptionsResponse
    extends PasskeysRegisterOptionsResponseModel {
  /// Initializes Passkeys register options response class.
  const PasskeysRegisterOptionsResponse({
    super.passkeysRegisterOptions,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegisterOptionsResponse.fromJson(
    dynamic passkeysRegisterOptionsJson,
  ) =>
      PasskeysRegisterOptionsResponse(
        passkeysRegisterOptions: passkeysRegisterOptionsJson == null
            ? null
            : PasskeysRegisterOptions.fromJson(passkeysRegisterOptionsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (passkeysRegisterOptions != null) {
      resultMap['passkeys_register_options'] =
          passkeysRegisterOptions!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysRegisterOptionsResponse copyWith({
    PasskeysRegisterOptions? passkeysRegisterOptions,
  }) =>
      PasskeysRegisterOptionsResponse(
        passkeysRegisterOptions:
            passkeysRegisterOptions ?? this.passkeysRegisterOptions,
      );
}

/// AttestationEnum mapper.
final Map<String, AttestationEnum> attestationEnumMapper =
    <String, AttestationEnum>{
  "none": AttestationEnum.none,
  "indirect": AttestationEnum.indirect,
  "direct": AttestationEnum.direct,
};

/// Attestation Enum.
enum AttestationEnum {
  /// none.
  none,

  /// indirect.
  indirect,

  /// direct.
  direct,
}

/// AuthenticatorAttachmentEnum mapper.
final Map<String, AuthenticatorAttachmentEnum>
    authenticatorAttachmentEnumMapper = <String, AuthenticatorAttachmentEnum>{
  "platform": AuthenticatorAttachmentEnum.platform,
  "cross-platform": AuthenticatorAttachmentEnum.crossPlatform,
};

/// AuthenticatorAttachment Enum.
enum AuthenticatorAttachmentEnum {
  /// platform.
  platform,

  /// cross-platform.
  crossPlatform,
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

/// TransportsItemEnum mapper.
final Map<String, TransportsItemEnum> transportsItemEnumMapper =
    <String, TransportsItemEnum>{
  "usb": TransportsItemEnum.usb,
  "nfc": TransportsItemEnum.nfc,
  "ble": TransportsItemEnum.ble,
  "smart-card": TransportsItemEnum.smartCard,
  "hybrid": TransportsItemEnum.hybrid,
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

  /// smart-card.
  smartCard,

  /// hybrid.
  hybrid,

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
/// Passkeys register options model class.
abstract class PasskeysRegisterOptionsModel {
  /// Initializes Passkeys register options model class .
  const PasskeysRegisterOptionsModel({
    this.publicKey,
  });

  /// Wrapper of the options.
  final PublicKey? publicKey;
}

/// Passkeys register options class.
class PasskeysRegisterOptions extends PasskeysRegisterOptionsModel {
  /// Initializes Passkeys register options class.
  const PasskeysRegisterOptions({
    super.publicKey,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegisterOptions.fromJson(Map<String, dynamic> json) =>
      PasskeysRegisterOptions(
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
  PasskeysRegisterOptions copyWith({
    PublicKey? publicKey,
  }) =>
      PasskeysRegisterOptions(
        publicKey: publicKey ?? this.publicKey,
      );
}
/// Public key model class.
abstract class PublicKeyModel {
  /// Initializes Public key model class .
  const PublicKeyModel({
    this.attestation,
    this.authenticatorSelection,
    this.challenge,
    this.excludeCredentials,
    this.extensions,
    this.pubKeyCredParams,
    this.rp,
    this.timeout,
    this.user,
  });

  /// The attestation settings, weather the authenticator will attest the respone on no. Default is direct.
  final AttestationEnum? attestation;

  /// Settings to control authenticator behavior and selection.
  final AuthenticatorSelection? authenticatorSelection;

  /// Random string to be signed by the authenticator. will be byte array base64 encoded.
  final String? challenge;

  /// List of already registered credentials to avoid re-registering.
  final List<ExcludeCredentialsItem>? excludeCredentials;

  /// Empty for now
  final Map<String, dynamic>? extensions;

  /// Supported public key algorithms.
  final List<PubKeyCredParamsItem>? pubKeyCredParams;

  /// The relying party info.
  final Rp? rp;

  /// Time before expiring the cermony in milliseconds.
  final DateTime? timeout;

  /// The user info
  final User? user;
}

/// Public key class.
class PublicKey extends PublicKeyModel {
  /// Initializes Public key class.
  const PublicKey({
    super.attestation,
    super.authenticatorSelection,
    super.challenge,
    super.excludeCredentials,
    super.extensions,
    super.pubKeyCredParams,
    super.rp,
    super.timeout,
    super.user,
  });

  /// Creates an instance from JSON.
  factory PublicKey.fromJson(Map<String, dynamic> json) => PublicKey(
        attestation: json['attestation'] == null
            ? null
            : attestationEnumMapper[json['attestation']],
        authenticatorSelection: json['authenticatorSelection'] == null
            ? null
            : AuthenticatorSelection.fromJson(json['authenticatorSelection']),
        challenge: json['challenge'],
        excludeCredentials: json['excludeCredentials'] == null
            ? null
            : List<ExcludeCredentialsItem>.from(
                json['excludeCredentials']?.map(
                  (dynamic item) => ExcludeCredentialsItem.fromJson(item),
                ),
              ),
        extensions: json['extensions'],
        pubKeyCredParams: json['pubKeyCredParams'] == null
            ? null
            : List<PubKeyCredParamsItem>.from(
                json['pubKeyCredParams']?.map(
                  (dynamic item) => PubKeyCredParamsItem.fromJson(item),
                ),
              ),
        rp: json['rp'] == null ? null : Rp.fromJson(json['rp']),
        timeout: getDateTime(json['timeout']),
        user: json['user'] == null ? null : User.fromJson(json['user']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['attestation'] = attestationEnumMapper.entries
        .firstWhere((MapEntry<String, AttestationEnum> entry) =>
            entry.value == attestation)
        .key;
    if (authenticatorSelection != null) {
      resultMap['authenticatorSelection'] = authenticatorSelection!.toJson();
    }
    resultMap['challenge'] = challenge;
    if (excludeCredentials != null) {
      resultMap['excludeCredentials'] = excludeCredentials!
          .map<dynamic>(
            (ExcludeCredentialsItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['extensions'] = extensions;
    if (pubKeyCredParams != null) {
      resultMap['pubKeyCredParams'] = pubKeyCredParams!
          .map<dynamic>(
            (PubKeyCredParamsItem item) => item.toJson(),
          )
          .toList();
    }
    if (rp != null) {
      resultMap['rp'] = rp!.toJson();
    }
    resultMap['timeout'] = getSecondsSinceEpochDateTime(timeout);
    if (user != null) {
      resultMap['user'] = user!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PublicKey copyWith({
    AttestationEnum? attestation,
    AuthenticatorSelection? authenticatorSelection,
    String? challenge,
    List<ExcludeCredentialsItem>? excludeCredentials,
    Map<String, dynamic>? extensions,
    List<PubKeyCredParamsItem>? pubKeyCredParams,
    Rp? rp,
    DateTime? timeout,
    User? user,
  }) =>
      PublicKey(
        attestation: attestation ?? this.attestation,
        authenticatorSelection:
            authenticatorSelection ?? this.authenticatorSelection,
        challenge: challenge ?? this.challenge,
        excludeCredentials: excludeCredentials ?? this.excludeCredentials,
        extensions: extensions ?? this.extensions,
        pubKeyCredParams: pubKeyCredParams ?? this.pubKeyCredParams,
        rp: rp ?? this.rp,
        timeout: timeout ?? this.timeout,
        user: user ?? this.user,
      );
}
/// Authenticator selection model class.
abstract class AuthenticatorSelectionModel {
  /// Initializes Authenticator selection model class .
  const AuthenticatorSelectionModel({
    this.authenticatorAttachment,
    this.requireResidentKey,
    this.userVerification,
  });

  /// Whether to allow cross platform authenticators (QR) or only the ones installed on the device itself.
  final AuthenticatorAttachmentEnum? authenticatorAttachment;

  /// Ask the auth to save the passkey on the device. this will allow seamless login without the need to enter the user name. will be true always
  final bool? requireResidentKey;

  /// Ask the user to enter thier authentication method (PIN, fingerprint, etc). Default is required.
  final UserVerificationEnum? userVerification;
}

/// Authenticator selection class.
class AuthenticatorSelection extends AuthenticatorSelectionModel {
  /// Initializes Authenticator selection class.
  const AuthenticatorSelection({
    super.authenticatorAttachment,
    super.requireResidentKey,
    super.userVerification,
  });

  /// Creates an instance from JSON.
  factory AuthenticatorSelection.fromJson(Map<String, dynamic> json) =>
      AuthenticatorSelection(
        authenticatorAttachment: json['authenticatorAttachment'] == null
            ? null
            : authenticatorAttachmentEnumMapper[
                json['authenticatorAttachment']],
        requireResidentKey: getBool(json['requireResidentKey']),
        userVerification: json['userVerification'] == null
            ? null
            : userVerificationEnumMapper[json['userVerification']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['authenticatorAttachment'] = authenticatorAttachmentEnumMapper
        .entries
        .firstWhere((MapEntry<String, AuthenticatorAttachmentEnum> entry) =>
            entry.value == authenticatorAttachment)
        .key;
    resultMap['requireResidentKey'] = requireResidentKey;
    resultMap['userVerification'] = userVerificationEnumMapper.entries
        .firstWhere((MapEntry<String, UserVerificationEnum> entry) =>
            entry.value == userVerification)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AuthenticatorSelection copyWith({
    AuthenticatorAttachmentEnum? authenticatorAttachment,
    bool? requireResidentKey,
    UserVerificationEnum? userVerification,
  }) =>
      AuthenticatorSelection(
        authenticatorAttachment:
            authenticatorAttachment ?? this.authenticatorAttachment,
        requireResidentKey: requireResidentKey ?? this.requireResidentKey,
        userVerification: userVerification ?? this.userVerification,
      );
}
/// Exclude credentials item model class.
abstract class ExcludeCredentialsItemModel {
  /// Initializes Exclude credentials item model class .
  const ExcludeCredentialsItemModel({
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

/// Exclude credentials item class.
class ExcludeCredentialsItem extends ExcludeCredentialsItemModel {
  /// Initializes Exclude credentials item class.
  const ExcludeCredentialsItem({
    super.id,
    super.transports,
    super.type,
  });

  /// Creates an instance from JSON.
  factory ExcludeCredentialsItem.fromJson(Map<String, dynamic> json) =>
      ExcludeCredentialsItem(
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
  ExcludeCredentialsItem copyWith({
    String? id,
    List<TransportsItemEnum>? transports,
    TypeEnum? type,
  }) =>
      ExcludeCredentialsItem(
        id: id ?? this.id,
        transports: transports ?? this.transports,
        type: type ?? this.type,
      );
}
/// Pub key cred params item model class.
abstract class PubKeyCredParamsItemModel {
  /// Initializes Pub key cred params item model class .
  const PubKeyCredParamsItemModel({
    this.alg,
    this.type,
  });

  /// Algorithm
  final String? alg;

  /// Type
  final String? type;
}

/// Pub key cred params item class.
class PubKeyCredParamsItem extends PubKeyCredParamsItemModel {
  /// Initializes Pub key cred params item class.
  const PubKeyCredParamsItem({
    super.alg,
    super.type,
  });

  /// Creates an instance from JSON.
  factory PubKeyCredParamsItem.fromJson(Map<String, dynamic> json) =>
      PubKeyCredParamsItem(
        alg: json['alg'],
        type: json['type'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['alg'] = alg;
    resultMap['type'] = type;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PubKeyCredParamsItem copyWith({
    String? alg,
    String? type,
  }) =>
      PubKeyCredParamsItem(
        alg: alg ?? this.alg,
        type: type ?? this.type,
      );
}
/// Rp model class.
abstract class RpModel {
  /// Initializes Rp model class .
  const RpModel({
    this.id,
    this.name,
  });

  /// Relying party id.
  final String? id;

  /// Relying party name.
  final String? name;
}

/// Rp class.
class Rp extends RpModel {
  /// Initializes Rp class.
  const Rp({
    super.id,
    super.name,
  });

  /// Creates an instance from JSON.
  factory Rp.fromJson(Map<String, dynamic> json) => Rp(
        id: json['id'],
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Rp copyWith({
    String? id,
    String? name,
  }) =>
      Rp(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
/// User model class.
abstract class UserModel {
  /// Initializes User model class .
  const UserModel({
    this.displayName,
    this.id,
    this.name,
  });

  /// Display name of the user. will be email
  final String? displayName;

  /// Binary user id
  final int? id;

  /// Name of the user, will be email
  final String? name;
}

/// User class.
class User extends UserModel {
  /// Initializes User class.
  const User({
    super.displayName,
    super.id,
    super.name,
  });

  /// Creates an instance from JSON.
  factory User.fromJson(Map<String, dynamic> json) => User(
        displayName: json['displayName'],
        id: json['id'],
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['displayName'] = displayName;
    resultMap['id'] = id;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  User copyWith({
    String? displayName,
    int? id,
    String? name,
  }) =>
      User(
        displayName: displayName ?? this.displayName,
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
