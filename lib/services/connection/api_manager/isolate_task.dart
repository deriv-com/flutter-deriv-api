part of 'binary_api.dart';

class IsolateConfig {
  IsolateConfig({
    required this.sendPort,
    required this.rootIsolateToken,
    required this.apiInstanceKey,
  });

  final SendPort sendPort;
  final ui.RootIsolateToken? rootIsolateToken;

  final String apiInstanceKey;
}

void _isolateTask(IsolateConfig isolateConfig) {
  if (isolateConfig.rootIsolateToken != null) {
    ui.PlatformDispatcher.instance
        .registerBackgroundIsolate(isolateConfig.rootIsolateToken!);
    BackgroundIsolateBinaryMessenger.ensureInitialized(
        isolateConfig.rootIsolateToken!);
  }
  final sendPort = isolateConfig.sendPort;

  final ReceivePort receivePort = ReceivePort();

  final BinaryAPI binaryAPI = BinaryAPI(key: isolateConfig.apiInstanceKey);

  sendPort.send(receivePort.sendPort);
  receivePort.listen((message) async {
    if (message is _WSConnectConfig) {
      await binaryAPI.connect(
        message.connectionInformation,
        onOpen: (key) => sendPort.send(ConnectionEventReply(
            key: key, callback: ConnectionCallbacks.onOpen)),
        onDone: (key) => sendPort.send(ConnectionEventReply(
            key: key, callback: ConnectionCallbacks.onDone)),
        onError: (key) => sendPort.send(ConnectionEventReply(
            key: key, callback: ConnectionCallbacks.onError)),
      );
    }

    if (message is _IsolateEvent) {
      switch (message) {
        case _AddToChannelEvent():
          binaryAPI.addToChannel(message.request);
          break;
        case _CallEvent():
          final response = await binaryAPI.call(request: message.request);
          sendPort.send(
            IsolateResponse(response: response, eventId: message.eventId),
          );
          break;

        case _SubEvent():
          final stream = binaryAPI.subscribe(request: message.request);
          stream?.listen((event) {
            sendPort.send(
              IsolateResponse(
                response: event,
                eventId: message.eventId,
                isSubscription: true,
              ),
            );
          });
          break;
        case _UnSubEvent():
          final response = await binaryAPI.unsubscribe(
            subscriptionId: message.subscriptionId,
          );
          sendPort.send(
            IsolateResponse(response: response, eventId: message.eventId),
          );
          break;
        case _UnSubAllEvent():
          final response =
              await binaryAPI.unsubscribeAll(method: message.streamType);
          sendPort.send(
              IsolateResponse(response: response, eventId: message.eventId));
          break;
        case _DisconnectEvent():
          final response = await binaryAPI.disconnect();

          break;
      }
    }
  });
}
