/// generated automatically from flutter_deriv_api|lib/api/states_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'states_list_send.g.dart';

/// JSON conversion for 'states_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class StatesListRequest extends Request {
  /// Initialize StatesListRequest
  StatesListRequest({
    this.statesList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
}
