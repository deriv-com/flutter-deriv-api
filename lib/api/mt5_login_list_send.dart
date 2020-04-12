/// generated automatically from flutter_deriv_api|lib/api/mt5_login_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'mt5_login_list_send.g.dart';

/// JSON conversion for 'mt5_login_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5LoginListRequest extends Request {
  /// Initialize Mt5LoginListRequest
  const Mt5LoginListRequest({
    this.mt5LoginList = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory Mt5LoginListRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5LoginListRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int mt5LoginList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5LoginListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5LoginListRequest copyWith({
    int mt5LoginList,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      Mt5LoginListRequest(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
