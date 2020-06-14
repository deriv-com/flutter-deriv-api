# Flutter Deriv API

Flutter Deriv API is an abstraction layer over `Binary Websocket` (_https://github.com/binary-com/websockets_).

You can use this package with either using classes in the abstraction layer like `Ping, Order, Advert, etc...` or directly with API calls from `Base API`.

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

### Calling Method by Abstraction Layer

```dart
final Ping ping = await Ping.ping();

print(ping.succeeded);
```

### Calling Method Directly from API

```dart
final PingResponse response = await api.call(
    request: const PingRequest(),
);

print(response.ping);
```

##### Note: For more detail refer to documents and examples.

---

## Documentation

### API Architecture

<br/>
<p align="center">
    <img src="deriv_api_architecture.png" alt="API Architecture" width="70%"/>
</p>

### API Reference

The complete API reference is [here](#).

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

### Json Schema Parser

`JsonSchemaParser` class is a tool for extracting main and nested classes from model schema contents. for using this tool:

- Call `getModel(...)` method and pass decoded schema as `Map<String, dynamic> schema`.
- Pass the result as `models` parameter to `getClasses(...)` method.

The final result is a `string` that contains the main class and all related classes of that schema file including `Model Classes`, `Constructors`, `Properties`, `To JSON Method`, `From JSON Method`, and `Copy With Method`.

### Usage

```
flutter pub run lib/tools/parser.dart <json_schema_path> <main_class_name>
```

### Example

```
flutter pub run lib/tools/parser.dart active_symbols_receive.json ActiveSymbols
```

##### Note: The result file will be created in the same path of `json schema` file.
