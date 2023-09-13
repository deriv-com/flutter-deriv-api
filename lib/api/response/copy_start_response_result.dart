// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/copy_start_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/copy_start_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Copy start response model class.
abstract class CopyStartResponseModel {
  /// Initializes Copy start response model class .
  const CopyStartResponseModel({
    this.copyStart,
  });

  /// Copy start confirmation. Returns 1 is success.
  final int? copyStart;
}

/// Copy start response class.
class CopyStartResponse extends CopyStartResponseModel {
  /// Initializes Copy start response class.
  const CopyStartResponse({
    super.copyStart,
  });

  /// Creates an instance from JSON.
  factory CopyStartResponse.fromJson(
    dynamic copyStartJson,
  ) =>
      CopyStartResponse(
        copyStart: copyStartJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['copy_start'] = copyStart;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Starts copy trader bets.
  ///
  /// For parameters information refer to [CopyStartRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<CopyStartResponse> start(CopyStartRequest request) async {
    final CopyStartReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return CopyStartResponse.fromJson(response.copyStart);
  }

  /// Creates a copy of instance with given parameters.
  CopyStartResponse copyWith({
    int? copyStart,
  }) =>
      CopyStartResponse(
        copyStart: copyStart ?? this.copyStart,
      );
}
