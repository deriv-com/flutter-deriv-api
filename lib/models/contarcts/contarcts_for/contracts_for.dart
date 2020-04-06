import 'package:flutter_deriv_api/api/contracts_for_receive.dart';
import 'package:flutter_deriv_api/api/contracts_for_send.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

part 'contracts_for_model.dart';

part 'available.dart';

/// available contracts. Note: if the user is authenticated,
/// then only contracts allowed under his account will be returned.
class ContractsFor extends ContractsForModel {
  /// Initializes
  ContractsFor({
    List<Available> available,
    int close,
    String feedLicense,
    int hitCount,
    int open,
    double spot,
  }) : super(
          available: available,
          close: close,
          feedLicense: feedLicense,
          hitCount: hitCount,
          open: open,
          spot: spot,
        );

  /// Factory constructor from Json
  factory ContractsFor.fromJson(Map<String, dynamic> json) => ContractsFor(
        available: json['available']
            ?.map<Available>((dynamic entry) =>
                entry == null ? null : Available.fromJson(entry))
            ?.toList(),
        close: json['close'],
        feedLicense: json['feed_license'],
        hitCount: json['hit_count'],
        open: json['open'],
        spot: json['spot'],
      );

  /// Fetch contracts from given [symbol]
  static Future<ContractsFor> fetch(
      {String symbol, String currency, String landingCompany}) async {
    // TODO(Ramin): call to the actual Api class when its ready
    final ContractsForResponse contractsForResponse = ContractsForResponse();
    return ContractsFor.fromJson(contractsForResponse.contractsFor);
  }
}
