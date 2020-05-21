import 'dart:async';

import 'api_base_model.dart';

/// For handling the situations where the response of API subscription might be
/// two different types.
/// When first response is in type [F] (as a [Future]) and the rest are [S] (as a [Stream]).
class EitherResponse<F extends APIBaseModel, S extends APIBaseModel> {
  /// Initializes
  EitherResponse(Stream<APIBaseModel> modelStream)
      : _completer = Completer<F>(),
        _streamController = StreamController<S>() {
    modelStream.listen((APIBaseModel model) {
      if (model is F && !_completer.isCompleted) {
        _completer.complete(model);
      } else if (model is S) {
        _streamController.add(model);
      }
    });
  }

  final Completer<F> _completer;

  final StreamController<S> _streamController;

  /// Call response as [F]
  Future<F> get response => _completer.future;

  /// Response stream of [S]
  Stream<S> get responseStream => _streamController.stream;
}
