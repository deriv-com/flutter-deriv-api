/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_markup_details_send.json

import '../request.dart';

/// App markup details request class
class AppMarkupDetailsRequest extends Request {
  /// Initialize AppMarkupDetailsRequest
  const AppMarkupDetailsRequest({
    this.appId,
    this.appMarkupDetails = true,
    this.clientLoginid,
    @required this.dateFrom,
    @required this.dateTo,
    this.description,
    this.limit,
    this.offset,
    this.sort,
    this.sortFields,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'app_markup_details',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppMarkupDetailsRequest.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetailsRequest(
        appId: json['app_id'] as int?,
        appMarkupDetails: json['app_markup_details'] == null
            ? null
            : json['app_markup_details'] == 1,
        clientLoginid: json['client_loginid'] as String?,
        dateFrom: json['date_from'] as String?,
        dateTo: json['date_to'] as String?,
        description:
            json['description'] == null ? null : json['description'] == 1,
        limit: json['limit'] as num?,
        offset: json['offset'] as num?,
        sort: json['sort'] as String?,
        sortFields: (json['sort_fields'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Specific application `app_id` to report on.
  final int? appId;

  /// Must be `true`
  final bool? appMarkupDetails;

  /// [Optional] Specific client loginid to report on, like CR12345
  final String? clientLoginid;

  /// Start date (epoch or YYYY-MM-DD HH:MM:SS). Results are inclusive of this time.
  final String? dateFrom;

  /// End date (epoch or YYYY-MM-DD HH::MM::SS). Results are inclusive of this time.
  final String? dateTo;

  /// [Optional] If set to `true`, will return `app_markup` transaction details.
  final bool? description;

  /// [Optional] Apply upper limit to count of transactions received.
  final num? limit;

  /// [Optional] Number of transactions to skip.
  final num? offset;

  /// [Optional] Sort direction on `transaction_time`. Other fields sort order is ASC.
  final String? sort;

  /// [Optional] One or more of the specified fields to sort on. Default sort field is by `transaction_time`.
  final List<String>? sortFields;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'app_markup_details': appMarkupDetails == null
            ? null
            : appMarkupDetails!
                ? 1
                : 0,
        'client_loginid': clientLoginid,
        'date_from': dateFrom,
        'date_to': dateTo,
        'description': description == null
            ? null
            : description!
                ? 1
                : 0,
        'limit': limit,
        'offset': offset,
        'sort': sort,
        'sort_fields': sortFields,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppMarkupDetailsRequest copyWith({
    int? appId,
    bool? appMarkupDetails,
    String? clientLoginid,
    String? dateFrom,
    String? dateTo,
    bool? description,
    num? limit,
    num? offset,
    String? sort,
    List<String>? sortFields,
    Map<String, dynamic>? passthrough,
    int? reqId,
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
  List<Object> get props => <Object>[];
}
