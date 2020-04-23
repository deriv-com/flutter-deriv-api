import 'package:flutter_deriv_api/api/models/state_info_model.dart';
import 'package:flutter_deriv_api/api/models/states_list_model.dart';

/// States list response class
class StatesList extends StatesListModel {
  /// Class constructor
  StatesList({
    List<StatesInfoModel> states,
  }) : super(
          states: states
        );

  /// Creates instance from json
  factory StatesList.fromJson(Map<String, dynamic> json) => StatesList(
        states: json['states_list'] == null
            ? null
            : json['states_list']
                .map<StatesInfoModel>(
                    (dynamic item) => StatesInfoModel.fromJson(item))
                .toList(),
      );

  /// Creates copy of instance with given parameters
  StatesList copyWith({
    List<StatesInfoModel> states,
  }) =>
      StatesList(
        states: states ?? this.states,
      );
}
