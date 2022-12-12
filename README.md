# Flutter Fast Start
#
A fast start flutter project to make apps faster and skip setup on every application. I am personally using this structure while creating a new project

# Concept
- ##### MVMM Architecture
- ##### Feature-based foldering
- ##### Dependency Injected Services
- ##### Localization & Theme Support

# Tech
- ##### [Riverpod](https://pub.dev/packages/riverpod) for state management
- ##### [Isar](https://pub.dev/packages/isar) for caching
- ##### [Auto Route](https://pub.dev/packages/auto_route) for routing (no BuildContext!)
- ##### [Get.it](https://pub.dev/packages/get_it) for singleton & dependency injection
- ##### [Dio](https://pub.dev/packages/dio) for network requests
- ##### [intl](https://pub.dev/packages/intl) for internalization & localization
- ##### Notification service with [Awesome Snackbar](https://pub.dev/packages/awesome_snackbar_content) (no BuildContext!)
- ##### Asset Generator with [FlutterGen](https://pub.dev/packages/flutter_gen)
- ##### [Very Good Analysis](https://pub.dev/packages/very_good_analysis) for lints
- ##### Useful Tools & Classes and Pages

###### Others
- Flutter SVG
- JSON Serializer
- Lottie
- Google Fonts
- Url Launcher
- Splash Screen
- Onboarding Screen

# Folder Structure
```
lib
├── const
│   ├── globals.dart
│   ├── project_paddings.dart
│   └── project_values.dart
├── core
│   ├── cache
│   │   ├── abstract
│   │   │   └── cache_repository.dart
│   │   ├── app_settings_model.dart
│   │   ├── app_settings_model.g.dart
│   │   └── isar_cache_repository.dart
│   ├── extensions
│   │   └── list_extension.dart
│   ├── injection
│   │   └── locator.dart
│   ├── l10n
│   │   ├── app_en.arb
│   │   └── app_tr.arb
│   ├── network
│   │   ├── abstract
│   │   │   └── networt_service.dart
│   │   ├── dio_network_service.dart
│   │   └── network_paths.dart
│   ├── routing
│   │   ├── abstract
│   │   │   └── router_service.dart
│   │   ├── auto_route.dart
│   │   ├── auto_route.gr.dart
│   │   ├── auto_route_service.dart
│   │   └── model
│   │       └── routes.dart
│   ├── theme
│   │   ├── project_colors.dart
│   │   └── project_theme.dart
│   └── utils
│       ├── helper_widgets
│       │   ├── apply_color.dart
│       │   ├── form_input_base.dart
│       │   └── paddings.dart
│       ├── regex_validators.dart
│       └── snackbar
│           ├── abstract
│           │   └── snackbar_service.dart
│           └── top_snackbar_service.dart
├── feature
│   ├── onboard
│   │   └── presentation
│   │       └── onboard_view.dart
│   └── splash
│       ├── presentation
│       │   └── splash_view.dart
│       └── service
│           └── init_service.dart
└── main.dart
```

# Pre-prepared Services

### Get_it and Locator Variable
I am using Get.it as a service locator package. All services and repositories which not require `BuildContext` or `WidgetRef` should be called from Get.it package. Also, all services are dependency injected. You can create your services & repositories and edit from `lib/core/injection/locator.dart`

> You may think also think to make your dependency injections via Riverpod. I personally preferred to make a separation between the service locator and state packages.
### Isar Service
###### Why Isar?
Simon Leiser (Producer of both Isar and Hive packages) stated Isar is the future of Hive on the Isar documentation. So I decided to use Isar in my projects.
##### Isar Service Repository and AppSettingsModel
My Isar service comes with AppSettingsModel which is useful for caching app settings (user token or theme mode etc.). In IsarRepository has getAppsettings() and putAppSettings() methods which return AppSettingsModel.

`locator<CacheRepository>().getAppsettings();`

`locator<CacheRepository>().putAppsettings();`


AppSettingsModel has a bool type predefined value of `isFirstLaunch`

### AutoRoute Service

Auto Route service class has routing methods and also has Routes.dart class to store route names.

`locator<RouterService>().pushNamed(Routes.onboard);`

`locator<RouterService>().pushNamedRemoveStack(Routes.home);`

`locator<RouterService>().pop();`

`locator<RouterService>().popUntil(Routes.home);`

`locator<RouterService>().popUntilRoot();`

`final route = locator<RouterService>().currentRouteName();`

##### Auto Route Service not requires BuildContext but has some limitations.
From the AutoRoute documentation:
> Note: navigating without context is not recommended in nested navigation unless you use navigate instead of push and you provide a full hierarchy. e.g router.navigate(SecondRoute(children: [SubChild2Route()]))
### Dio Network Service 
Network service consists of only one method that asks NetworkPaths class as a parameter. It pushes all the error messages automatically via the notification service.

If you have an API request you should insert your API endpoints to NetworkPaths class and use this:
`var data = locator<NetworkService>().execute(NetworkPaths.getUserById);`

### Snackbar Notification Service 
Easy-to-use notification service without `BuildContext` requirement. It uses `ScaffoldMessengerKey` from **globals.dart**. To use:
```
locator<SnackbarService>().showSnackbar(
type: SnackBarType.error,
title: title,
message: message
);
```
### Paddings
It provides an easy and standardized way to apply paddings. Also, it has useful ListView, Colum, and Row methods.

##### Measurements
Measurements can be changed from **lib/const/project_paddings.dart**
- Small (.s) gives **8px** of padding(s)
- Medium (.m) gives **16px** of padding(s)
- Large (.l) gives **32px** of padding(s)
- XLarge (.xl) gives **64px** of padding(s)

**Every Padding widget has child property and named constructors as measurement**

##### Example:
To give **8px** of top padding
```
PaddingTop.s(child: Container());
```

##### Directions
- `PaddingAll`
- `PaddingTop`
- `PaddingRight`
- `PaddingHorizontal`
- `PaddingVertical`
- `PaddingTopLeft`

##### ListView, Column, and Row children spacing's
Paddings.dart has also some widgets which help gives padding to each child

- `ListViewWithSpacing` ==> Gives padding between each child of ListView
- `ColumnWithSpacing` ==> Gives padding between each child of Column
- `RowWithSpacing` ==> Gives padding between each child of Row

##### Example:
To give **8px** of top padding to each child of ListView
```
ListViewWithSpacing.s(
    children: [
        Center(), 
        Container()
    ]);
```

### Other Services and Notes
- `ApplyColor` widget changes all text colors of the child which uses theme style (Theme.of(context).textTheme...). **It is mandatory to extract its child or use builder**
- `TextFormFieldBase`, `PasswordFieldBase` and `MailFieldBase` are form fields that provide some easy pre-defined methods like Regex validators, obscuring text, or comparing passwords.
- OnBoard and Splash screens are defined as features. A splash screen is called initService and if the application launches for the first time, redirects to the OnBoard screen.

### All Contributions are Welcome!
I am completely open to improvements and fixes. Please open an issue or make a pull request to contribute to this. Thanks in advance!
