import 'package:meta/meta.dart';

import '../../basic_api/generated/residence_list_receive.dart';
import '../../basic_api/generated/residence_list_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Residence list response model class
abstract class ResidenceListResponseModel {
  /// Initializes
  ResidenceListResponseModel({
    @required this.residenceList,
  });

  /// List of countries for account opening
  final List<ResidenceListItem> residenceList;
}

/// Residence list response class
class ResidenceListResponse extends ResidenceListResponseModel {
  /// Initializes
  ResidenceListResponse({
    @required List<ResidenceListItem> residenceList,
  }) : super(
          residenceList: residenceList,
        );

  /// Creates an instance from JSON
  factory ResidenceListResponse.fromJson(
    dynamic residenceListJson,
  ) =>
      ResidenceListResponse(
        residenceList: residenceListJson == null
            ? null
            : List<ResidenceListItem>.from(residenceListJson
                .map((dynamic item) => ResidenceListItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (residenceList != null) {
      resultMap['residence_list'] = residenceList
          .map<dynamic>((ResidenceListItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets Residence list for the given [ResidenceListRequest]
  ///
  /// Throws a [ResidenceException] if API response contains an error
  static Future<ResidenceListResponse> fetchResidenceList([
    ResidenceListSend request,
  ]) async {
    final ResidenceListReceive response = await _api.call(
      request: request ?? const ResidenceListSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ResidenceException(baseExceptionModel: baseExceptionModel),
    );

    return ResidenceListResponse.fromJson(response.residenceList);
  }

  /// Creates a copy of instance with given parameters
  ResidenceListResponse copyWith({
    List<ResidenceListItem> residenceList,
  }) =>
      ResidenceListResponse(
        residenceList: residenceList ?? this.residenceList,
      );
}
/// Residence list item model class
abstract class ResidenceListItemModel {
  /// Initializes
  ResidenceListItemModel({
    @required this.value,
    @required this.tinFormat,
    @required this.text,
    this.phoneIdd,
  });

  /// 2-letter country code
  final String value;

  /// Country tax identifier format
  final List<String> tinFormat;

  /// Country full name
  final String text;

  /// IDD code of country
  final String phoneIdd;
}

/// Residence list item class
class ResidenceListItem extends ResidenceListItemModel {
  /// Initializes
  ResidenceListItem({
    @required String text,
    @required List<String> tinFormat,
    @required String value,
    String phoneIdd,
  }) : super(
          text: text,
          tinFormat: tinFormat,
          value: value,
          phoneIdd: phoneIdd,
        );

  /// Creates an instance from JSON
  factory ResidenceListItem.fromJson(Map<String, dynamic> json) =>
      ResidenceListItem(
        text: json['text'],
        tinFormat: json['tin_format'] == null
            ? null
            : List<String>.from(json['tin_format'].map((dynamic item) => item)),
        value: json['value'],
        phoneIdd: json['phone_idd'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['text'] = text;
    if (tinFormat != null) {
      resultMap['tin_format'] =
          tinFormat.map<dynamic>((String item) => item).toList();
    }
    resultMap['value'] = value;
    resultMap['phone_idd'] = phoneIdd;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ResidenceListItem copyWith({
    String text,
    List<String> tinFormat,
    String value,
    String phoneIdd,
  }) =>
      ResidenceListItem(
        text: text ?? this.text,
        tinFormat: tinFormat ?? this.tinFormat,
        value: value ?? this.value,
        phoneIdd: phoneIdd ?? this.phoneIdd,
      );
}
