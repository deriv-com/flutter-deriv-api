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
class CustomIsolateEvent<T> extends _IsolateEvent {
  CustomIsolateEvent({
    required super.eventId,
    required this.event,
    required this.request,
    this.data,
    this.isSubscription = false,
  });

  final CustomEvent event;

  final Request request;

  final bool isSubscription;

  final T? data;

  CustomIsolateEvent<T> copyWith({
    CustomEvent? event,
    Request? request,
    T? data,
    bool? isSubscription,
  }) =>
      CustomIsolateEvent<T>(
        eventId: eventId,
        event: event ?? this.event,
        request: request ?? this.request,
        data: data ?? this.data,
        isSubscription: isSubscription ?? this.isSubscription,
      );
}

class TicksHistoryEvent<TickHistorySubscription> extends CustomIsolateEvent {
  TicksHistoryEvent({
    required super.eventId,
    required super.event,
    required super.request,
    super.data,
    super.isSubscription,
    this.tickStreamItem,
    this.tickHistory,
  });

  /// The history of tick
  final TicksHistoryResponse? tickHistory;

  /// The stream of the tick
  final TickBase? tickStreamItem;

  @override
  TicksHistoryEvent<TickHistorySubscription> copyWith({
    CustomEvent? event,
    Request? request,
    data,
    bool? isSubscription,
    TicksHistoryResponse? tickHistory,
    TickBase? tickStreamItem,
  }) =>
      TicksHistoryEvent(
        eventId: eventId,
        event: event ?? super.event,
        request: request ?? super.request,
        data: data ?? super.data,
        tickHistory: tickHistory ?? this.tickHistory,
        tickStreamItem: tickStreamItem ?? this.tickStreamItem,
      );
}

enum CustomEvent {
  ping,
  authorize,
  landingCompany,
  activeSymbols,
  statesList,
  residenceList,
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
  ticks,
  ticksHistory,
  proposalOpenContract,
  proposal,
}
