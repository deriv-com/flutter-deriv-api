// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Link wallet response model class.
abstract class LinkWalletResponseModel {
  /// Initializes Link wallet response model class .
  const LinkWalletResponseModel({
    this.linkWallet,
  });

  /// 1 on success
  final int? linkWallet;
}

/// Link wallet response class.
class LinkWalletResponse extends LinkWalletResponseModel {
  /// Initializes Link wallet response class.
  const LinkWalletResponse({
    int? linkWallet,
  }) : super(
          linkWallet: linkWallet,
        );

  /// Creates an instance from JSON.
  factory LinkWalletResponse.fromJson(
    dynamic linkWalletJson,
  ) =>
      LinkWalletResponse(
        linkWallet: linkWalletJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['link_wallet'] = linkWallet;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LinkWalletResponse copyWith({
    int? linkWallet,
  }) =>
      LinkWalletResponse(
        linkWallet: linkWallet ?? this.linkWallet,
      );
}
