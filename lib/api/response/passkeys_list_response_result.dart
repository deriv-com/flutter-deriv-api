// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_list_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

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
    this.createdOn,
    this.id,
    this.lastUsed,
    this.name,
    this.passkey,
    this.userId,
  });

  /// The date of the passkey creation
  final String? createdOn;

  /// The system id of the passkey
  final String? id;

  /// The date of the last passkey usage
  final String? lastUsed;

  /// The name of the passkey
  final String? name;

  /// The id of the credential. for mock only
  final Map<String, dynamic>? passkey;

  /// The id of the user. for mock only
  final String? userId;
}

/// Passkeys list item class.
class PasskeysListItem extends PasskeysListItemModel {
  /// Initializes Passkeys list item class.
  const PasskeysListItem({
    super.createdOn,
    super.id,
    super.lastUsed,
    super.name,
    super.passkey,
    super.userId,
  });

  /// Creates an instance from JSON.
  factory PasskeysListItem.fromJson(Map<String, dynamic> json) =>
      PasskeysListItem(
        createdOn: json['created_on'],
        id: json['id'],
        lastUsed: json['last_used'],
        name: json['name'],
        passkey: json['passkey'],
        userId: json['user_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['created_on'] = createdOn;
    resultMap['id'] = id;
    resultMap['last_used'] = lastUsed;
    resultMap['name'] = name;
    resultMap['passkey'] = passkey;
    resultMap['user_id'] = userId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysListItem copyWith({
    String? createdOn,
    String? id,
    String? lastUsed,
    String? name,
    Map<String, dynamic>? passkey,
    String? userId,
  }) =>
      PasskeysListItem(
        createdOn: createdOn ?? this.createdOn,
        id: id ?? this.id,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        passkey: passkey ?? this.passkey,
        userId: userId ?? this.userId,
      );
}
