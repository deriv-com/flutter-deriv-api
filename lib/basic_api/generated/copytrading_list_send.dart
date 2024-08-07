/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Copytrading list request class.
class CopytradingListRequest extends Request {
  /// Initialize CopytradingListRequest.
  const CopytradingListRequest({
    this.copytradingList = true,
    this.loginid,
    super.msgType = 'copytrading_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CopytradingListRequest.fromJson(Map<String, dynamic> json) =>
      CopytradingListRequest(
        copytradingList: json['copytrading_list'] == null
            ? null
            : json['copytrading_list'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? copytradingList;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_list': copytradingList == null
            ? null
            : copytradingList!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopytradingListRequest copyWith({
    bool? copytradingList,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CopytradingListRequest(
        copytradingList: copytradingList ?? this.copytradingList,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
