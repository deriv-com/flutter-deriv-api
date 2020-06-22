# Flutter Deriv API

Flutter Deriv API is an abstraction layer over `Binary WebSocket` (_https://github.com/binary-com/websockets_) for `Dart` and `Flutter` developers.

## Using Flutter Deriv API

### A. Creating a websocket connection

Initialize `ModuleContainer` for prepare API instance for dependency injection, you can pass `true` to `isMock` parameter for testing purposes.
To establish a connection to websocket you need an instance of `ConnectionInformation` class for initializing API connection.

```dart
ModuleContainer().initialize(Injector.getInjector(), isMock: false);

Injector.getInjector().get<BaseAPI>()
    .connect(
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

### B. Calling API methods

You can invoke API calls with either using classes in the abstraction layer (`Ping, Order, Advert, ...`) or directly with API calls from `Base API` class.

#### Calling method by abstraction layer

```dart
final Ping ping = await Ping.ping();

print(ping.succeeded);
```

#### Calling method directly with `Base API`

```dart
final PingResponse response =
    await Injector.getInjector().get<BaseAPI>().call(
        request: const PingRequest(),
    );

print(response.ping);
```

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

### Clone repository

```
$ git clone https://github.com/regentmarkets/flutter-deriv-api.git

$ cd flutter-deriv-api
$ flutter pub get
```

### Use this package as a library

Add this to your package's `pubspec.yaml` file:

```
dependencies:
    ...
    flutter-deriv-api:
        git:
            url: https://github.com/regentmarkets/flutter-deriv-api.git
            ref: master
```

### Use this package as a submodule

```
$ git submodule add https://github.com/regentmarkets/flutter-deriv-api.git
```

Add this to your package's `pubspec.yaml` file:

```
dependencies:
    ...
    flutter_deriv_api:
        path: ./flutter-deriv-api/
```

### Initialize and update submodule

```
$ git submodule init
$ git submodule update --remote
```

### Run the tests

```
$ flutter test
```

### Generate documentations

```
$ dartdoc
```

---

## Tools

### JSON Schema Parser

`JsonSchemaParser` class is a tool for extracting main and nested classes from model schema contents. for using this tool:

- Call `getModel(...)` method and pass decoded schema as `Map<String, dynamic> schema`.
- Pass the result as `models` parameter to `getClasses(...)` method.

The final result is a `string` that contains the main class and all related classes of that schema file including `Model Classes`, `Constructors`, `Properties`, `To JSON Method`, `From JSON Method`, and `Copy With Method`.

#### Usage

```
$ flutter pub run lib/tools/parser.dart <json_schema_path> <main_class_name>
```

#### Example

```
$ flutter pub run lib/tools/parser.dart active_symbols_receive.json ActiveSymbols
```

#### Notes

1. This tool is for helping developers to convert JSON Schema easier, you may require some adjustments to the result file according to your needs.
2. The resulting file will be generated in the same path as the JSON schema file.
3. Some JSON schemas are not standard and this tool may not convert them properly.
