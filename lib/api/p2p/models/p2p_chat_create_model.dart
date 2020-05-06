import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// P2P chat create model class
abstract class P2PChatCreateModel extends APIBaseModel {
  /// Initializes
  P2PChatCreateModel({
    this.channelUrl,
    this.orderId,
  });

  /// The URL to be used to initialise the chat for the requested order.
  final String channelUrl;

  /// The unique identifier for the order that the chat belongs to.
  final String orderId;
}
