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
        case CustomIsolateEvent():
          _handleCustomEvent(message, binaryAPI, sendPort);
      }
    }
  });
}

void _handleCustomEvent(
  CustomIsolateEvent<dynamic> message,
  BinaryAPI api,
  SendPort sendPort,
) async {
  switch (message.event) {
    case CustomEvent.ping:
    case CustomEvent.activeSymbols:
      final ActiveSymbolsReceive response = await api.call(
        request: message.request,
      );

      checkException(
        response: response,
        exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
            BaseAPIException(baseExceptionModel: baseExceptionModel),
      );

      final asResponse = ActiveSymbolsResponse.fromJson(response.activeSymbols);
      sendPort.send(message.copyWith(data: asResponse));

    case CustomEvent.assetIndex:
    case CustomEvent.balance:
    case CustomEvent.buy:
    case CustomEvent.accountList:
    case CustomEvent.accountClosure:
    case CustomEvent.cancel:
    case CustomEvent.cashierPayment:
    case CustomEvent.changeEmail:
    case CustomEvent.changePassword:
    case CustomEvent.confirmEmail:
    case CustomEvent.contractUpdateHistory:
    case CustomEvent.contractUpdate:
    case CustomEvent.contractsFor:
    case CustomEvent.getAccountStatus:
    case CustomEvent.getAccountTypes:
    case CustomEvent.getAvailableAccounts:
    case CustomEvent.getFinancialAssessment:
    case CustomEvent.getLimits:
    case CustomEvent.getSelfExclusion:
    case CustomEvent.getSettings:
    case CustomEvent.identityVerification:
    case CustomEvent.jTokenCreate:
    case CustomEvent.kycAuthStatus:
  }
}
