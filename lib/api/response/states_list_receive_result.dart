import '../../basic_api/generated/states_list_receive.dart';
import '../../basic_api/generated/states_list_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// States list response model class.
abstract class StatesListResponseModel {
  /// Initializes States list response model class .
  StatesListResponseModel({
    this.statesList,
  });

  /// List of states.
  final List<StatesListItem>? statesList;
}

/// States list response class.
class StatesListResponse extends StatesListResponseModel {
  /// Initializes States list response class.
  StatesListResponse({
    List<StatesListItem>? statesList,
  }) : super(
          statesList: statesList,
        );

  /// Creates an instance from JSON.
  factory StatesListResponse.fromJson(
    dynamic statesListJson,
  ) =>
      StatesListResponse(
        statesList: statesListJson == null
            ? null
            : List<StatesListItem>.from(
                statesListJson?.map(
                  (dynamic item) => StatesListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (statesList != null) {
      resultMap['states_list'] = statesList!
          .map<dynamic>(
            (StatesListItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the list of states for the given [StatesListRequest]
  ///
  /// Throws a [StateException] if API response contains an error
  static Future<StatesListResponse> fetchStatesList(
      StatesListRequest request) async {
    final StatesListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          StateException(baseExceptionModel: baseExceptionModel),
    );

    return StatesListResponse.fromJson(response.statesList);
  }

  /// Creates a copy of instance with given parameters.
  StatesListResponse copyWith({
    List<StatesListItem>? statesList,
  }) =>
      StatesListResponse(
        statesList: statesList ?? this.statesList,
      );
}
/// States list item model class.
abstract class StatesListItemModel {
  /// Initializes States list item model class .
  StatesListItemModel({
    this.text,
    this.value,
  });

  /// The state name.
  final String? text;

  /// The state code.
  final String? value;
}

/// States list item class.
class StatesListItem extends StatesListItemModel {
  /// Initializes States list item class.
  StatesListItem({
    String? text,
    String? value,
  }) : super(
          text: text,
          value: value,
        );

  /// Creates an instance from JSON.
  factory StatesListItem.fromJson(Map<String, dynamic> json) => StatesListItem(
        text: json['text'],
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['text'] = text;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  StatesListItem copyWith({
    String? text,
    String? value,
  }) =>
      StatesListItem(
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
