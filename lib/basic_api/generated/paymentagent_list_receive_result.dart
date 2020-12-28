/// The model model class
abstract class TheModelModel {
  /// Initializes
  TheModelModel({
    @required this.paymentagentList,
  });

  /// Payment Agent List
  final PaymentagentList paymentagentList;
}

/// The model class
class TheModel extends TheModelModel {
  /// Initializes
  TheModel({
    @required PaymentagentList paymentagentList,
  }) : super(
          paymentagentList: paymentagentList,
        );

  /// Creates an instance from JSON
  factory TheModel.fromJson(Map<String, dynamic> json) => TheModel(
        paymentagentList: json['paymentagent_list'] == null
            ? null
            : PaymentagentList.fromJson(json['paymentagent_list']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (paymentagentList != null) {
      result['paymentagent_list'] = paymentagentList.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TheModel copyWith({
    PaymentagentList paymentagentList,
  }) =>
      TheModel(
        paymentagentList: paymentagentList ?? this.paymentagentList,
      );
}
/// Paymentagent list model class
abstract class PaymentagentListModel {
  /// Initializes
  PaymentagentListModel({
    @required this.availableCountries,
    @required this.list,
  });

  /// The list of countries in which payment agent is available.
  final List<List<dynamic>> availableCountries;

  /// List of payment agents available in the requested country.
  final List<List> list;
}

/// Paymentagent list class
class PaymentagentList extends PaymentagentListModel {
  /// Initializes
  PaymentagentList({
    @required List<List<dynamic>> availableCountries,
    @required List<List> list,
  }) : super(
          availableCountries: availableCountries,
          list: list,
        );

  /// Creates an instance from JSON
  factory PaymentagentList.fromJson(Map<String, dynamic> json) =>
      PaymentagentList(
        list: json['list'] == null
            ? null
            : json['list']
                .map<List>((dynamic item) => List.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['available_countries'] = availableCountries;
    if (list != null) {
      result['list'] = list.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  PaymentagentList copyWith({
    List<List<dynamic>> availableCountries,
    List<List> list,
  }) =>
      PaymentagentList(
        availableCountries: availableCountries ?? this.availableCountries,
        list: list ?? this.list,
      );
}
/// List model class
abstract class ListModel {
  /// Initializes
  ListModel({
    @required this.currencies,
    @required this.depositCommission,
    @required this.email,
    @required this.furtherInformation,
    this.maxWithdrawal,
    this.minWithdrawal,
    @required this.name,
    @required this.paymentagentLoginid,
    @required this.summary,
    this.supportedBanks,
    @required this.telephone,
    @required this.url,
    @required this.withdrawalCommission,
  });

  /// Currencies that are accepted by this payment agent.
  final String currencies;

  /// Commission amount applied on deposits made through this payment agent.
  final String depositCommission;

  /// Payment agent's email address.
  final String email;

  /// More descriptions about this payment agent.
  final String furtherInformation;

  /// Maximum withdrawal allowed for transactions through this payment agent.
  final dynamic maxWithdrawal;

  /// Minimum withdrawal allowed for transactions through this payment agent.
  final dynamic minWithdrawal;

  /// Payment agent's name.
  final String name;

  /// Payment agent's loginid.
  final String paymentagentLoginid;

  /// A summary about payment agent.
  final String summary;

  /// Comma separated list of supported banks.
  final dynamic supportedBanks;

  /// Payment agent's phone number.
  final String telephone;

  /// Payment agent's website URL.
  final String url;

  /// Commission amount applied on withdrawals made through this payment agent.
  final String withdrawalCommission;
}

/// List class
class List extends ListModel {
  /// Initializes
  List({
    @required String currencies,
    @required String depositCommission,
    @required String email,
    @required String furtherInformation,
    dynamic maxWithdrawal,
    dynamic minWithdrawal,
    @required String name,
    @required String paymentagentLoginid,
    @required String summary,
    dynamic supportedBanks,
    @required String telephone,
    @required String url,
    @required String withdrawalCommission,
  }) : super(
          currencies: currencies,
          depositCommission: depositCommission,
          email: email,
          furtherInformation: furtherInformation,
          maxWithdrawal: maxWithdrawal,
          minWithdrawal: minWithdrawal,
          name: name,
          paymentagentLoginid: paymentagentLoginid,
          summary: summary,
          supportedBanks: supportedBanks,
          telephone: telephone,
          url: url,
          withdrawalCommission: withdrawalCommission,
        );

  /// Creates an instance from JSON
  factory List.fromJson(Map<String, dynamic> json) => List(
        currencies: json['currencies'],
        depositCommission: json['deposit_commission'],
        email: json['email'],
        furtherInformation: json['further_information'],
        maxWithdrawal: json['max_withdrawal'],
        minWithdrawal: json['min_withdrawal'],
        name: json['name'],
        paymentagentLoginid: json['paymentagent_loginid'],
        summary: json['summary'],
        supportedBanks: json['supported_banks'],
        telephone: json['telephone'],
        url: json['url'],
        withdrawalCommission: json['withdrawal_commission'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['currencies'] = currencies;
    result['deposit_commission'] = depositCommission;
    result['email'] = email;
    result['further_information'] = furtherInformation;
    result['max_withdrawal'] = maxWithdrawal;
    result['min_withdrawal'] = minWithdrawal;
    result['name'] = name;
    result['paymentagent_loginid'] = paymentagentLoginid;
    result['summary'] = summary;
    result['supported_banks'] = supportedBanks;
    result['telephone'] = telephone;
    result['url'] = url;
    result['withdrawal_commission'] = withdrawalCommission;

    return result;
  }

  /// Creates a copy of instance with given parameters
  List copyWith({
    String currencies,
    String depositCommission,
    String email,
    String furtherInformation,
    dynamic maxWithdrawal,
    dynamic minWithdrawal,
    String name,
    String paymentagentLoginid,
    String summary,
    dynamic supportedBanks,
    String telephone,
    String url,
    String withdrawalCommission,
  }) =>
      List(
        currencies: currencies ?? this.currencies,
        depositCommission: depositCommission ?? this.depositCommission,
        email: email ?? this.email,
        furtherInformation: furtherInformation ?? this.furtherInformation,
        maxWithdrawal: maxWithdrawal ?? this.maxWithdrawal,
        minWithdrawal: minWithdrawal ?? this.minWithdrawal,
        name: name ?? this.name,
        paymentagentLoginid: paymentagentLoginid ?? this.paymentagentLoginid,
        summary: summary ?? this.summary,
        supportedBanks: supportedBanks ?? this.supportedBanks,
        telephone: telephone ?? this.telephone,
        url: url ?? this.url,
        withdrawalCommission: withdrawalCommission ?? this.withdrawalCommission,
      );
}
