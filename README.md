# UI for health/fitness bluetooth wearable

UI built using Flutter.
<!-- This UI will receive data from a bluetooth wearable device (Raspberry Pi) and sync with the data with the cloud. -->
<!-- Backend is in a separate repository. -->

### Dependencies
To start the project, do the instalation of iOS and Android SDK, open this repo code in VS Code then install Flutter extensions for VS code and start the project by pressing F5 (Or from the Run > Start Debugging menu).

Copy the .env variable
`cp .env.dev .env`

- **State Management** by [Riverpod](https://pub.dev/packages/riverpod)
- **Data classes** by [Freezed](https://pub.dev/packages/freezed)
- **Routing** by [GoRouter](https://pub.dev/packages/go_router)
- **Translations** by [Slang](https://pub.dev/packages/slang)
- **Network by** [Dio](https://pub.dev/packages/dio)
- **Logging by** [Logger](https://pub.dev/packages/logger)
- **ENV variables by** [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

### Useful commands

`flutter pub get`

In a majority of those dependencies, code generation is used, so your best friend will be `dart run build_runner watch -d` which will run in background during all the dev phase of the project

`dart run build_runner watch -d`
`flutter pub run build_runner build --delete-conflicting-outputs`

`flutter pub upgrade && flutter clean && flutter pub cache clean`

`pod update PurchasesHybridCommon`

Widgetbook commands:

`cd widgetbook && dart run build_runner build -d`

To start Widgetbook:

`cd widgetbook && flutter run`

Generate translations strings:

`dart run slang`

### Starting the backend

`cd backend && go run main.go`

### Recommended VSCode extensions

1. https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
2. https://marketplace.visualstudio.com/items?itemName=blaxou.freezed&ssr=false#overview
3. https://marketplace.visualstudio.com/items?itemName=GaetSchwartz.build-runner

#### Lib

[**lib**](./lib/) has all our code.


- [lib/main.dart](./lib/main.dart) is the main file everyone knows, it init the app with the device's locale and init the router with go router
- [lib/router.dart](./lib/router.dart) contains the routes for our screens, it is provided so it can be accessed without any context ! By default, the app will run the [SplashScreen](./lib/views/splash/splash.screen.dart) at startup

And the folders

- [**extensions**](./lib/extensions) contains extensions classes that are useful. In flutter extensions are a very powerful system that makes it easy to add method to classes without breaking their contracts, so use them as much as you can
- [**gen**](./lib/gen/) contains generated translations from [Slang](https://pub.dev/packages/slang)
- [**models**](./lib/models/) contains data classes, almost all of them are [Freezed](https://pub.dev/packages/freezed) classes (or enums)
- [**providers**](./lib/providers/) contains app wide providers, like current user or theme data, all of them are [Riverpod](https://pub.dev/packages/riverpod) providers.
- [**views**](./lib/views/) contains widgets and screens ! Folders are screens splited elements and widget are atomic elements that can be used anywhere in the app
