import 'package:flutter_deriv_api/logic/mt5/mt5_login.dart';
import 'package:flutter_deriv_api/models/mt5/mt5_login_list.dart';

/// MT5 login list class
class Mt5LoginListResponse extends MT5LoginListModel {
  /// Class constructor
  Mt5LoginListResponse({
    List<MT5Login> mt5LoginList,
  }) : super(
          mt5LoginList: mt5LoginList,
        );

  /// Creates instance from json
  factory Mt5LoginListResponse.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListResponse(
        mt5LoginList: json['mt5_login_list'] == null
            ? null
            : json['mt5_login_list']
                .map<MT5Login>(
                    (Map<String, dynamic> item) => MT5Login.fromJson(item))
                .toList(),
      );

  /// Creates copy of instance with given parameters
  Mt5LoginListResponse copyWith({
    List<MT5Login> mt5LoginList,
  }) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
      );
}
