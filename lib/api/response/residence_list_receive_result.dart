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
    this.phoneIdd,
    @required this.text,
    @required this.tinFormat,
    @required this.value,
  });

  /// IDD code of country
  final String phoneIdd;

  /// Country full name
  final String text;

  /// Country tax identifier format
  final List<String> tinFormat;

  /// 2-letter country code
  final String value;
}

/// Residence list item class
class ResidenceListItem extends ResidenceListItemModel {
  /// Initializes
  ResidenceListItem({
    String phoneIdd,
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
  factory ResidenceListItem.fromJson(Map<String, dynamic> json) =>
      ResidenceListItem(
        phoneIdd: json['phone_idd'],
        text: json['text'],
        tinFormat: json['tin_format'] == null
            ? null
            : List<String>.from(json['tin_format'].map((dynamic item) => item)),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['phone_idd'] = phoneIdd;
    resultMap['text'] = text;
    if (tinFormat != null) {
      resultMap['tin_format'] =
          tinFormat.map<dynamic>((String item) => item).toList();
    }
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ResidenceListItem copyWith({
    String phoneIdd,
    String text,
    List<String> tinFormat,
    String value,
  }) =>
      ResidenceListItem(
        phoneIdd: phoneIdd ?? this.phoneIdd,
        text: text ?? this.text,
        tinFormat: tinFormat ?? this.tinFormat,
        value: value ?? this.value,
      );
}
