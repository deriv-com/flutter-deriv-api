/// Residence list receive model class
abstract class ResidenceListReceiveModel {
  /// Initializes
  ResidenceListReceiveModel({
    @required this.residenceList,
  });

  /// List of countries for account opening
  final List<ResidenceList> residenceList;
}

/// Residence list receive class
class ResidenceListReceive extends ResidenceListReceiveModel {
  /// Initializes
  ResidenceListReceive({
    @required List<ResidenceList> residenceList,
  }) : super(
          residenceList: residenceList,
        );

  /// Creates an instance from JSON
  factory ResidenceListReceive.fromJson(Map<String, dynamic> json) =>
      ResidenceListReceive(
        residenceList: json['residence_list'] == null
            ? null
            : json['residence_list']
                .map<ResidenceList>(
                    (dynamic item) => ResidenceList.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (residenceList != null) {
      result['residence_list'] =
          residenceList.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ResidenceListReceive copyWith({
    List<ResidenceList> residenceList,
  }) =>
      ResidenceListReceive(
        residenceList: residenceList ?? this.residenceList,
      );
}
/// Residence list model class
abstract class ResidenceListModel {
  /// Initializes
  ResidenceListModel({
    this.phoneIdd,
    @required this.text,
    @required this.tinFormat,
    @required this.value,
  });

  /// IDD code of country
  final UNKNOWN_TYPE phoneIdd;

  /// Country full name
  final String text;

  /// Country tax identifier format
  final List<String> tinFormat;

  /// 2-letter country code
  final String value;
}

/// Residence list class
class ResidenceList extends ResidenceListModel {
  /// Initializes
  ResidenceList({
    UNKNOWN_TYPE phoneIdd,
    @required String text,
    @required List<String> tinFormat,
    @required String value,
  }) : super(
          phoneIdd: phoneIdd,
          text: text,
          tinFormat: tinFormat,
          value: value,
        );

  /// Creates an instance from JSON
  factory ResidenceList.fromJson(Map<String, dynamic> json) => ResidenceList(
        phoneIdd: json['phone_idd'],
        text: json['text'],
        tinFormat: List<String>.from(json['tin_format'].map((x) => x)),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['phone_idd'] = phoneIdd;
    result['text'] = text;
    result['tin_format'] = tinFormat;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ResidenceList copyWith({
    UNKNOWN_TYPE phoneIdd,
    String text,
    List<String> tinFormat,
    String value,
  }) =>
      ResidenceList(
        phoneIdd: phoneIdd ?? this.phoneIdd,
        text: text ?? this.text,
        tinFormat: tinFormat ?? this.tinFormat,
        value: value ?? this.value,
      );
}
