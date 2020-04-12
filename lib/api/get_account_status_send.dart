/// generated automatically from flutter_deriv_api|lib/api/get_account_status_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'get_account_status_send.g.dart';

/// JSON conversion for 'get_account_status_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetAccountStatusRequest extends Request {
  /// Initialize GetAccountStatusRequest
  GetAccountStatusRequest({
    this.getAccountStatus = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory GetAccountStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAccountStatusRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int getAccountStatus;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetAccountStatusRequestToJson(this);
}
