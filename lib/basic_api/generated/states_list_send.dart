/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/states_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// States list send class.
class StatesListSend extends Request {
  /// Initialize StatesListSend.
  const StatesListSend({
    required this.statesList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'states_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory StatesListSend.fromJson(Map<String, dynamic> json) => StatesListSend(
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
  StatesListSend copyWith({
    String? statesList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      StatesListSend(
        statesList: statesList ?? this.statesList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
