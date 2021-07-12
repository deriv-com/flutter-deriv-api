import '../../basic_api/generated/tnc_approval_receive.dart';
import '../../basic_api/generated/tnc_approval_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Tnc approval response model class.
abstract class TncApprovalResponseModel {
  /// Initializes.
  TncApprovalResponseModel({
    this.tncApproval,
  });

  /// Set terms and conditions 1: success
  final int? tncApproval;
}

/// Tnc approval response class.
class TncApprovalResponse extends TncApprovalResponseModel {
  /// Initializes
  TncApprovalResponse({
    int? tncApproval,
  }) : super(
          tncApproval: tncApproval,
        );

  /// Creates an instance from JSON
  factory TncApprovalResponse.fromJson(
    dynamic tncApprovalJson,
  ) =>
      TncApprovalResponse(
        tncApproval: tncApprovalJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['tnc_approval'] = tncApproval;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Approve the latest version of terms and conditions.
  ///
  /// For parameters information refer to [TncApprovalRequest].
  /// Throws a [UserException] if API response contains an error
  static Future<TncApprovalResponse> verify(
    TncApprovalSend request,
  ) async {
    final TncApprovalReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          UserException(baseExceptionModel: baseExceptionModel),
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
