/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/states_list_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// StatesListRequest class
class StatesListRequest extends Request {
  /// Initialize StatesListRequest
  const StatesListRequest({
    @required this.statesList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'states_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory StatesListRequest.fromJson(Map<String, dynamic> json) =>
      StatesListRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        statesList: json['states_list'] as String,
      );

  /// Client's 2-letter country code (obtained from `residence_list` call)
  final String statesList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'states_list': statesList,
      };

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
