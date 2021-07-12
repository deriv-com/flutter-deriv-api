import '../../api/exceptions/exceptions.dart';
import '../../api/models/base_exception_model.dart';
import '../../basic_api/generated/asset_index_receive.dart';
import '../../basic_api/generated/asset_index_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';

/// Asset index response model class.
abstract class AssetIndexResponseModel {
  /// Initializes.
  AssetIndexResponseModel({
    this.assetIndex,
  });

  /// List of underlyings by their display name and symbol followed by their available contract types and duration boundaries.
  final List<dynamic>? assetIndex;
}

/// Asset index response class.
class AssetIndexResponse extends AssetIndexResponseModel {
  /// Initializes
  AssetIndexResponse({
    List<dynamic>? assetIndex,
  }) : super(
          assetIndex: assetIndex,
        );

  /// Creates an instance from JSON
  factory AssetIndexResponse.fromJson(
    dynamic assetIndexJson,
  ) =>
      AssetIndexResponse(
        assetIndex: assetIndexJson == null
            ? null
            : List<dynamic>.from(
                assetIndexJson?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (assetIndex != null) {
      resultMap['asset_index'] = assetIndex!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves a list of all available underlyings and the corresponding contract types and duration boundaries.
  ///
  /// If the user is logged in, only the assets available for that user's landing company will be returned.
  /// Throws an [AssetIndexException] if API response contains an error
  static Future<AssetIndexResponse> fetchAssetIndices(
    AssetIndexSend request,
  ) async {
    final AssetIndexReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AssetIndexException(baseExceptionModel: baseExceptionModel),
    );

    return AssetIndexResponse.fromJson(response.assetIndex);
  }

  /// Creates a copy of instance with given parameters.
  AssetIndexResponse copyWith({
    List<dynamic>? assetIndex,
  }) =>
      AssetIndexResponse(
        assetIndex: assetIndex ?? this.assetIndex,
      );
}
