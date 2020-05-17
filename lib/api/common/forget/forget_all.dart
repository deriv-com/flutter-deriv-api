import 'package:flutter_deriv_api/api/common/models/forget_all_model.dart';

/// Forget All class
class ForgetAll extends ForgetAllModel {
  /// Initializes
  ForgetAll({
    List<String> cancelledStreams,
  }) : super(
          cancelledStreams: cancelledStreams,
        );

  /// Creates an instance from response
  factory ForgetAll.fromResponse(List<dynamic> result) => ForgetAll(
        cancelledStreams:
            result.map((dynamic item) => item.toString()).toList(),
      );

  /// Creates a copy of instance with given parameters
  ForgetAll copyWith({
    List<String> cancelledStreams,
  }) =>
      ForgetAll(
        cancelledStreams: cancelledStreams ?? this.cancelledStreams,
      );
}
