// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_rename_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_rename_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Passkeys rename response model class.
abstract class PasskeysRenameResponseModel {
  /// Initializes Passkeys rename response model class .
  const PasskeysRenameResponseModel({
    this.passkeysRename,
  });

  /// 1 on success
  final int? passkeysRename;
}

/// Passkeys rename response class.
class PasskeysRenameResponse extends PasskeysRenameResponseModel {
  /// Initializes Passkeys rename response class.
  const PasskeysRenameResponse({
    super.passkeysRename,
  });

  /// Creates an instance from JSON.
  factory PasskeysRenameResponse.fromJson(
    dynamic passkeysRenameJson,
  ) =>
      PasskeysRenameResponse(
        passkeysRename: passkeysRenameJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['passkeys_rename'] = passkeysRename;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// rename a passkey.
  static Future<PasskeysRenameResponse> fetch(
    PasskeysRenameRequest request,
  ) async {
    final PasskeysRenameReceive response = await fetchRaw(request);

    return PasskeysRenameResponse.fromJson(response.toJson());
  }

  /// Fetches raw passkeys rename response.
  static Future<PasskeysRenameReceive> fetchRaw(
    PasskeysRenameRequest request,
  ) async {
    final PasskeysRenameReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysRenameResponse copyWith({
    int? passkeysRename,
  }) =>
      PasskeysRenameResponse(
        passkeysRename: passkeysRename ?? this.passkeysRename,
      );
}
