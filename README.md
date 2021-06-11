# Flutter Architecture Blueprints

Flutter Architecture Blueprint is a project that follows Clean Architecture principles and MVVM pattern to develop Flutter apps.

[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart)

## Documentation

- [Install Flutter](https://flutter.dev/get-started/)
- [Flutter documentation](https://flutter.dev/docs)
- [The Clean Architecture (Uncle Bob)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [MVVM pattern](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)
- [Riverpod (State Management)](https://riverpod.dev/)
- [get_it (Dependency Injection)](https://pub.dev/packages/get_it)
- [mockito (Unit testing)](https://pub.dev/packages/mockito)
- [code style (Effective Dart)](https://dart.dev/guides/language/effective-dart)
- [data model (Freezed)](https://pub.dev/packages/freezed)
- [StatefullWidget replacement (Flutter Hooks)](https://pub.dev/packages/flutter_hooks)

## Requirements

- [Flutter 2.2+](https://flutter.dev/docs/development/tools/sdk/releases)

## Environment


**iOS**
- iOS 13+

**Android**
- Android 5.1+
    - minSdkVersion 22
- targetSdkVersion 30

## App architecture

There are 3 main modules to help separate the code. They are Data, Domain, and Presentation.
   
- **Data**: contains Local/Remote Data Source, APIs, Data objects (Request/Response object, DB objects), and the repository implementation.
   
- **Domain**: contains UseCases, Domain Objects/Models, and Repository Interfaces
   
- **Presentation**: contains UI, app style, app configurations, View Model (hold view state and presentation logic), etc.

# Entities
 - Enterprise-wide business rules
 - Made up of classes that can contain methods
 - Business objects of the application
 - Used application-wide
 - Least likely to change when something in the application changes
# Repository
 - Bridge between Data layer and Domain layer
 - Connects to data sources and returns mapped data
 - Data sources include DB, Api etc...
# UseCase
 - Responsible for connecting to repository to retrieve necessary data. 
 - This is where the business logic takes place.
 - Returns data downstream.
 - Single responsibility.
# ViewModel
 - Organizes data and holds View state.
 - Communicate with use cases.
 - Using [Riverpod](https://riverpod.dev/) for state management.
# View
 - Observes changes from ViewModel.
 - Updates UI.
# Data Sources
 - Fetch data from json files.
```
    assets/data/cards.json
    assets/data/components.json
```

<h3 align="center">Architecture</h3>
<img src="./architecture.png" style="display: block; margin-left: auto; margin-right: auto; width: 50%;"/>

## Getting Started

### Setup

```shell script
make setup
make build-runner
```

### Run

```shell script
make run
```

### Build APK

```shell script
make build-apk
```

### Test

- [Mockito](https://pub.dev/packages/mockito)
- [Unit testing](https://flutter.dev/docs/cookbook/testing/unit/introduction)
- [Widget testing](https://flutter.dev/docs/cookbook/testing/widget/introduction)
- Write unit test for ViewModel (**CardsViewModel** & **ComponentsViewModel**).
- Able to write particular unit test for **data** module and **domain** module.

```shell script
make test
```
