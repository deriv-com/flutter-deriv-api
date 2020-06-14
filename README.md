# Flutter Deriv API

Flutter Deriv API is an abstraction layer over `Binary Websocket` (_https://github.com/binary-com/websockets_).

You can use this library with either using classes in the abstraction layer like `Ping, Order, Advert, etc...` or directly with API calls and subscription methods.

## Creating a WebSocket Connection

Initialize `ModuleContainer` for prepare API instance for dependency injection, you can pass `true` to `isMock` parameter for testing purposes.
To establish a connection to WebSocket you need an instance of `ConnectionInformation` class for initializing API connection.

```dart
ModuleContainer().initialize(Injector.getInjector(), isMock: false);
BaseAPI api = Injector.getInjector().get<BaseAPI>();

api.connect(
    ConnectionInformation(
        appId: ...,
        brand: ...,
        endpoint: ...,
        language: ...,
    ),
    onDone: () async { ... },
    onOpen: () async { ... },
);
```

## Usage

#### 1. Using Abstraction Layer

```dart
final Ping ping = await Ping.ping();

print(ping.succeeded);
```

#### 2. Calling Method Directly from API

```dart
final PingResponse response = await _api.call(
    request: const PingRequest(),
);

final Ping ping =  Ping.fromResponse(response);

print(ping.succeeded);
```

##### Note: For more detail refer to documents and examples.

---

## Documentation

### API reference

The complete API reference is [here](#).

### Flutter Deriv API Architecture

![Flutter Deriv API Architecture](deriv_api_architecture.png)

---

## Development

### Clone Repository

```
$ git clone https://github.com/regentmarkets/flutter-deriv-api.git

$ cd flutter-deriv-api
$ flutter pub get
```

### Run the Tests

```
$ flutter test
```

### Generate Documentations

```
$ dartdoc
```

---

## Tools

### Json Schema Parser Utility

`JsonSchemaParser` class is a utility for extracting main and nested classes from model schema contents. for using this utility:

- call `getModel(...)` method and pass decoded schema as `Map<String, dynamic> schema`.
- pass the result as `models` parameter to `getClasses(...)` method.

The final result is a `string` that contains the main class and all related classes of that schema file including:

> ###### Model Classes
>
> ###### Constructors
>
> ###### Properties
>
> ###### To JSON Method
>
> ###### From JSON Method
>
> ###### Copy With Method

#### Usage

```
flutter pub run lib/tools/parser.dart <json_schema_path> <main_class_name>
```

#### Example

```
flutter pub run lib/tools/parser.dart /Users/hamed/Documents/GitHub/flutter-deriv-api/lib/basic_api/generated/active_symbols_receive.json sample
```

##### Note: The resulting file will be created in the same path of `json schema` file.

> ###### schema file name: `active_symbols_receive.json`
>
> ###### result file name: `active_symbols_receive_result.dart`
