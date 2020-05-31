/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/states_list_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'states_list_send.g.dart';

/// JSON conversion for 'states_list_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class StatesListRequest extends Request {
  /// Initialize StatesListRequest
  const StatesListRequest({
    this.statesList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'states_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory StatesListRequest.fromJson(Map<String, dynamic> json) =>
      _$StatesListRequestFromJson(json);

  /// Client's 2-letter country code (obtained from `residence_list` call)
  final String statesList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$StatesListRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  StatesListRequest copyWith({
    String statesList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      StatesListRequest(
        statesList: statesList ?? this.statesList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
