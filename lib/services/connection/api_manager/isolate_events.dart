part of 'binary_api.dart';

class _WSConnectConfig {
  _WSConnectConfig({
    this.connectionInformation,
    this.printResponse = false,
  });

  final ConnectionInformation? connectionInformation;

  final bool printResponse;
}

sealed class _IsolateEvent {
  _IsolateEvent({required this.eventId, this.isSubscription = false});

  final int eventId;
  final bool isSubscription;
}

class _AddToChannelEvent extends _IsolateEvent {
  _AddToChannelEvent({required this.request, required super.eventId});

  final Map<String, dynamic> request;
}

class _CallEvent<T> extends _IsolateEvent {
  _CallEvent({required this.request, required super.eventId});

  final Request request;
}

class _SubEvent<T> extends _IsolateEvent {
  _SubEvent({
    required this.request,
    required super.eventId,
  }) : super(isSubscription: true);

  final Request request;
}

class _UnSubEvent extends _IsolateEvent {
  _UnSubEvent({required this.subscriptionId, required super.eventId});

  final String subscriptionId;
}

class _UnSubAllEvent extends _IsolateEvent {
  _UnSubAllEvent({required this.streamType, required super.eventId});

  final ForgetStreamType streamType;
}

class _DisconnectEvent extends _IsolateEvent {
  _DisconnectEvent({required super.eventId});
}

enum ConnectionCallbacks {
  onOpen,
  onDone,
  onError,
}

class ConnectionEventReply {
  ConnectionEventReply({required this.key, required this.callback});

  final String key;
  final ConnectionCallbacks callback;
}

class IsolateResponse<T> {
  IsolateResponse({
    required this.response,
    required this.eventId,
    this.isSubscription = false,
  });

  final T response;
  final int eventId;
  final bool isSubscription;

  @override
  String toString() => 'ResponseEvent: [$eventId]: $response';
}

/// To communicate event and get the response for custom events that in addition
/// to get the BE JSON the deserialization of the JSON response to dart models
/// also happens inside the isolate.
abstract class CustomIsolateEvent<T> extends _IsolateEvent {
  CustomIsolateEvent({
    required super.eventId,
    required this.event,
    required this.request,
    this.data,
  });

  final CustomEvent event;

  final Request request;

  final T? data;
}

enum CustomEvent {
  ping,
  activeSymbols,
  assetIndex,
  balance,
  buy,
  accountList,
  accountClosure,
  cancel,
  cashierPayment,
  changeEmail,
  changePassword,
  confirmEmail,
  contractUpdateHistory,
  contractUpdate,
  contractsFor,
  getAccountStatus,
  getAccountTypes,
  getAvailableAccounts,
  getFinancialAssessment,
  getLimits,
  getSelfExclusion,
  getSettings,
  identityVerification,
  jTokenCreate,
  kycAuthStatus,
}
