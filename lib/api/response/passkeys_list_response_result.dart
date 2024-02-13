// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Passkeys list response model class.
abstract class PasskeysListResponseModel {
  /// Initializes Passkeys list response model class .
  const PasskeysListResponseModel({
    this.passkeysList,
  });

  /// The list of passkeys.
  final List<PasskeysListItem>? passkeysList;
}

/// Passkeys list response class.
class PasskeysListResponse extends PasskeysListResponseModel {
  /// Initializes Passkeys list response class.
  const PasskeysListResponse({
    super.passkeysList,
  });

  /// Creates an instance from JSON.
  factory PasskeysListResponse.fromJson(
    dynamic passkeysListJson,
  ) =>
      PasskeysListResponse(
        passkeysList: passkeysListJson == null
            ? null
            : List<PasskeysListItem>.from(
                passkeysListJson?.map(
                  (dynamic item) => PasskeysListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (passkeysList != null) {
      resultMap['passkeys_list'] = passkeysList!
          .map<dynamic>(
            (PasskeysListItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysListResponse copyWith({
    List<PasskeysListItem>? passkeysList,
  }) =>
      PasskeysListResponse(
        passkeysList: passkeysList ?? this.passkeysList,
      );
}
/// Passkeys list item model class.
abstract class PasskeysListItemModel {
  /// Initializes Passkeys list item model class .
  const PasskeysListItemModel({
    this.createdAt,
    this.id,
    this.lastUsed,
    this.name,
    this.passkeyId,
    this.storedOn,
  });

  /// The epoch date when the passkey was created.
  final DateTime? createdAt;

  /// The system id of the stored passkey.
  final int? id;

  /// The epoch timestamp that the key was last used to authenticate the user.
  final DateTime? lastUsed;

  /// The descriptive name of the passkey.
  final String? name;

  /// The id of the passkey credential.
  final String? passkeyId;

  /// The name of the device where the credential is stored on.
  final String? storedOn;
}

/// Passkeys list item class.
class PasskeysListItem extends PasskeysListItemModel {
  /// Initializes Passkeys list item class.
  const PasskeysListItem({
    super.createdAt,
    super.id,
    super.lastUsed,
    super.name,
    super.passkeyId,
    super.storedOn,
  });

  /// Creates an instance from JSON.
  factory PasskeysListItem.fromJson(Map<String, dynamic> json) =>
      PasskeysListItem(
        createdAt: getDateTime(json['created_at']),
        id: json['id'],
        lastUsed: getDateTime(json['last_used']),
        name: json['name'],
        passkeyId: json['passkey_id'],
        storedOn: json['stored_on'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['created_at'] = getSecondsSinceEpochDateTime(createdAt);
    resultMap['id'] = id;
    resultMap['last_used'] = getSecondsSinceEpochDateTime(lastUsed);
    resultMap['name'] = name;
    resultMap['passkey_id'] = passkeyId;
    resultMap['stored_on'] = storedOn;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysListItem copyWith({
    DateTime? createdAt,
    int? id,
    DateTime? lastUsed,
    String? name,
    String? passkeyId,
    String? storedOn,
  }) =>
      PasskeysListItem(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        passkeyId: passkeyId ?? this.passkeyId,
        storedOn: storedOn ?? this.storedOn,
      );
}
