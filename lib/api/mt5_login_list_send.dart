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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5LoginListRequest(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
