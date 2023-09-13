// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/tnc_approval_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/tnc_approval_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Tnc approval response model class.
abstract class TncApprovalResponseModel {
  /// Initializes Tnc approval response model class .
  const TncApprovalResponseModel({
    this.tncApproval,
  });

  /// Set terms and conditions 1: success
  final int? tncApproval;
}

/// Tnc approval response class.
class TncApprovalResponse extends TncApprovalResponseModel {
  /// Initializes Tnc approval response class.
  const TncApprovalResponse({
    int? tncApproval,
  }) : super(
          tncApproval: tncApproval,
        );

  /// Creates an instance from JSON.
  factory TncApprovalResponse.fromJson(
    dynamic tncApprovalJson,
  ) =>
      TncApprovalResponse(
        tncApproval: tncApprovalJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['tnc_approval'] = tncApproval;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Approve the latest version of terms and conditions.
  ///
  /// For parameters information refer to [TncApprovalRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<TncApprovalResponse> verify(
    TncApprovalRequest request,
  ) async {
    final TncApprovalReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TncApprovalResponse.fromJson(response.tncApproval);
  }

  /// Creates a copy of instance with given parameters.
  TncApprovalResponse copyWith({
    int? tncApproval,
  }) =>
      TncApprovalResponse(
        tncApproval: tncApproval ?? this.tncApproval,
      );
}
