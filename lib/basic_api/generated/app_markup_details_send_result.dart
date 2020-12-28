/// App markup details send model class
abstract class AppMarkupDetailsSendModel {
  /// Initializes
  AppMarkupDetailsSendModel({
    @required this.appMarkupDetails,
    this.appId,
    this.clientLoginid,
    @required this.dateFrom,
    @required this.dateTo,
    this.description,
    this.limit,
    this.offset,
    this.sort,
    this.sortFields,
  });

  /// Must be `1`
  final int appMarkupDetails;

  /// [Optional] Specific application `app_id` to report on.
  final int appId;

  /// [Optional] Specific client loginid to report on, like CR12345
  final String clientLoginid;

  /// Start date (epoch or YYYY-MM-DD HH:MM:SS). Results are inclusive of this time.
  final String dateFrom;

  /// End date (epoch or YYYY-MM-DD HH::MM::SS). Results are inclusive of this time.
  final String dateTo;

  /// [Optional] If set to `true`, will return `app_markup` transaction details.
  final bool description;

  /// [Optional] Apply upper limit to count of transactions received.
  final double limit;

  /// [Optional] Number of transactions to skip.
  final double offset;

  /// [Optional] Sort direction on `transaction_time`. Other fields sort order is ASC.
  final SortEnum sort;

  /// [Optional] One or more of the specified fields to sort on. Default sort field is by `transaction_time`.
  final List<SortFieldsEnum> sortFields;
}

/// App markup details send class
class AppMarkupDetailsSend extends AppMarkupDetailsSendModel {
  /// Initializes
  AppMarkupDetailsSend({
    @required int appMarkupDetails,
    int appId,
    String clientLoginid,
    @required String dateFrom,
    @required String dateTo,
    bool description,
    double limit,
    double offset,
    String sort,
    List<SortFieldsEnum> sortFields,
  }) : super(
          appMarkupDetails: appMarkupDetails,
          appId: appId,
          clientLoginid: clientLoginid,
          dateFrom: dateFrom,
          dateTo: dateTo,
          description: description,
          limit: limit,
          offset: offset,
          sort: sort,
          sortFields: sortFields,
        );

  /// Creates an instance from JSON
  factory AppMarkupDetailsSend.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetailsSend(
        appMarkupDetails: json['app_markup_details'],
        appId: json['app_id'],
        clientLoginid: json['client_loginid'],
        dateFrom: json['date_from'],
        dateTo: json['date_to'],
        description: getBool(json['description']),
        limit: getDouble(json['limit']),
        offset: getDouble(json['offset']),
        sort: json['sort'] == null
            ? null
            : sortEnumMapper.entries
                .firstWhere((entry) => entry.value == json['sort'],
                    orElse: () => null)
                ?.key,
        sortFields: List<SortFieldsEnum>.from(json['sort_fields'].map((x) =>
            sortFieldsEnumMapper.entries
                .firstWhere((entry) => entry.value == x, orElse: () => null)
                ?.key)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_markup_details'] = appMarkupDetails;
    result['app_id'] = appId;
    result['client_loginid'] = clientLoginid;
    result['date_from'] = dateFrom;
    result['date_to'] = dateTo;
    result['description'] = description;
    result['limit'] = limit;
    result['offset'] = offset;
    result['sort'] = sortEnumMapper[sort];
    if (sortFields != null) {
      result['sort_fields'] =
          sortFields.map((item) => sortFieldsEnumMapper[item]).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppMarkupDetailsSend copyWith({
    int appMarkupDetails,
    int appId,
    String clientLoginid,
    String dateFrom,
    String dateTo,
    bool description,
    double limit,
    double offset,
    String sort,
    List<SortFieldsEnum> sortFields,
  }) =>
      AppMarkupDetailsSend(
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
        appId: appId ?? this.appId,
        clientLoginid: clientLoginid ?? this.clientLoginid,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        sort: sort ?? this.sort,
        sortFields: sortFields ?? this.sortFields,
      );
  // Creating Enum Mappers

  static final Map<SortEnum, String> sortEnumMapper = {
    SortEnum.ASC: 'ASC',
    SortEnum.DESC: 'DESC',
  };

  static final Map<SortFieldsEnum, String> sortFieldsEnumMapper = {
    SortFieldsEnum.app_id: 'app_id',
    SortFieldsEnum.client_loginid: 'client_loginid',
    SortFieldsEnum.transaction_time: 'transaction_time',
  };
}

// Creating Enums

enum SortEnum {
  ASC,
  DESC,
}

enum SortFieldsEnum {
  app_id,
  client_loginid,
  transaction_time,
}
