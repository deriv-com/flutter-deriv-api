/// generated automatically from flutter_deriv_api|lib/api/states_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'states_list_send.g.dart';

/// JSON conversion for 'states_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class StatesListRequest extends Request {
  /// Initialize StatesListRequest
  const StatesListRequest({
    this.statesList,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory StatesListRequest.fromJson(Map<String, dynamic> json) =>
      _$StatesListRequestFromJson(json);

  // Properties
  /// Client's 2-letter country code (obtained from `residence_list` call)
  final String statesList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$StatesListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  StatesListRequest copyWith({
    String statesList,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      StatesListRequest(
        statesList: statesList ?? this.statesList,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
