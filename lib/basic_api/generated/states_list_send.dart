/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/states_list_send.json.

import '../request.dart';

/// States list request class.
class StatesListRequest extends Request {
  /// Initialize StatesListRequest.
  const StatesListRequest({
    required this.statesList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'states_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory StatesListRequest.fromJson(Map<String, dynamic> json) =>
      StatesListRequest(
        statesList: json['states_list'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Client's 2-letter country code (obtained from `residence_list` call)
  final String? statesList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'states_list': statesList,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  StatesListRequest copyWith({
    String? statesList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      StatesListRequest(
        statesList: statesList ?? this.statesList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
