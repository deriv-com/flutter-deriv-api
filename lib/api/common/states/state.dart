import 'package:flutter_deriv_api/api/common/models/state_model.dart';
import 'package:flutter_deriv_api/api/common/states/exceptions/state_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// States list response class
class State extends StateModel {
  /// Initializes
  State({
    String text,
    String value,
  }) : super(
          text: text,
          value: value,
        );

  /// Creates an instance from JSON
  factory State.fromJson(Map<String, dynamic> json) => State(
        text: json['text'],
        value: json['value'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of states for the given [StatesListRequest]
  ///
  /// Throws a [StateException] if API response contains an error
  static Future<List<State>> fetchStatesList(StatesListRequest request) async {
    final StatesListResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          StateException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.statesList,
      itemToTypeCallback: (dynamic item) => State.fromJson(item),
    );
  }

  /// Generates a copy of instance with given parameters
  State copyWith({
    String text,
    String value,
  }) =>
      State(
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
