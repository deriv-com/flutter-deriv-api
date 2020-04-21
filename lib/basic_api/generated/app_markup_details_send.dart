/// generated automatically from flutter_deriv_api|lib/basic_api/generated/app_markup_details_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'app_markup_details_send.g.dart';

/// JSON conversion for 'app_markup_details_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppMarkupDetailsRequest extends Request {
  /// Initialize AppMarkupDetailsRequest
  const AppMarkupDetailsRequest({
    this.appId,
    this.appMarkupDetails = 1,
    this.clientLoginid,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.offset,
    this.sort,
    this.sortFields,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory AppMarkupDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$AppMarkupDetailsRequestFromJson(json);

  // Properties
  /// [Optional] Specific application `app_id` to report on.
  final int appId;

  /// Must be `1`
  final int appMarkupDetails;

  /// [Optional] Specific client loginid to report on, like CR12345
  final String clientLoginid;

  /// Start date (epoch or YYYY-MM-DD HH:MM:SS). Results are inclusive of this time.
  final String dateFrom;

  /// End date (epoch or YYYY-MM-DD HH::MM::SS). Results are inclusive of this time.
  final String dateTo;

  /// [Optional] If set to 1, will return `app_markup` transaction details.
  final int description;

  /// [Optional] Apply upper limit to count of transactions received.
  final num limit;

  /// [Optional] Number of transactions to skip.
  final num offset;

  /// [Optional] Sort direction on `transaction_time`. Other fields sort order is ASC.
  final String sort;

  /// [Optional] One or more of the specified fields to sort on. Default sort field is by `transaction_time`.
  final List<String> sortFields;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppMarkupDetailsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppMarkupDetailsRequest copyWith({
    int appId,
    int appMarkupDetails,
    String clientLoginid,
    String dateFrom,
    String dateTo,
    int description,
    num limit,
    num offset,
    String sort,
    List<String> sortFields,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AppMarkupDetailsRequest(
        appId: appId ?? this.appId,
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
        clientLoginid: clientLoginid ?? this.clientLoginid,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        sort: sort ?? this.sort,
        sortFields: sortFields ?? this.sortFields,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
