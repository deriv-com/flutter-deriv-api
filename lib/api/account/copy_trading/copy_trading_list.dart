import 'package:flutter_deriv_api/api/account/copy_trading/exceptions/copy_trading_exception.dart';
import 'package:flutter_deriv_api/api/account/models/copier_model.dart';
import 'package:flutter_deriv_api/api/account/models/copy_trading_list_model.dart';
import 'package:flutter_deriv_api/api/account/models/trader_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Copy trading list class
class CopyTradingList extends CopyTradingListModel {
  /// Initializes
  CopyTradingList({
    List<CopierModel> copiers,
    List<TraderModel> traders,
  }) : super(
          copiers: copiers,
          traders: traders,
        );

  /// Creates an instance from JSON
  factory CopyTradingList.fromJson(Map<String, dynamic> json) =>
      CopyTradingList(
        copiers: getListFromMap(
          json['copiers'],
          itemToTypeCallback: (dynamic item) => CopierModel.fromJson(item),
        ),
        traders: getListFromMap(
          json['traders'],
          itemToTypeCallback: (dynamic item) => TraderModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of active copiers and/or traders for Copy Trading
  ///
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopyTradingList> fetchList([
    CopytradingListRequest request,
  ]) async {
    final CopytradingListResponse response = await _api.call(
      request: request ?? const CopytradingListRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          CopyTradingException(baseExceptionModel: baseExceptionModel),
    );

    return CopyTradingList.fromJson(response.copytradingList);
  }

  /// Generates a copy of instance with given parameters
  CopyTradingList copyWith({
    List<CopierModel> copiers,
    List<TraderModel> traders,
  }) =>
      CopyTradingList(
        copiers: copiers ?? this.copiers,
        traders: traders ?? this.traders,
      );
}
