# appsolutely

A Flutter Starter Kit

## Getting Started

This project is a starting point for a Flutter application.

Directory Structure:
- config
- routes using fluro
- models
- data
    - repository
    - services (API, Firebase, or sqlite)
- ui
    - pages
    - widgets
    - theme
- utilities
    - logging

## Core Concepts

Located in  ```./lib/core``` directory

### Flavors

In order to start the app, you will need to create a class that extends Flavor. Flavors are basically different versions of the app configured for different environments. You can even extend this to other classifications (i.e. full or free).

```
class Development extends Flavor {
  @override
  FlavorType flavorType = FlavorType.DEVELOPMENT;
  String baseUrl = 'http://localhost:3000/api/';
}
```

Upon creation, this class will initialize an App object and use this as a parameter for ```InitApp``` obj.

Flavor values are accessible via ```Flavor.instance```

### Application Class

Application class will initialize common objects or methods needed to run the app smoothly. This includes Router, SharedPreferences and more.

## State Management

This project uses Provider as the main state management for the entire app.

## Navigation and Routes

This Flutter Starter Kit uses [Fluro package](https://pub.dev/packages/fluro) which makes routing easier especially with wildcard paths.

Example:

```
router.navigateTo(context,'profile/12345',)
```

For each page, you would need to add routeName and routeHandler. Then add it to the Routes class in order for it to be added to list of routes.

## Themes

Themes are created using [PanacheWeb](https://rxlabz.github.io/panache_web).

## Translations

This project uses [Flutter Intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) to handle managing the translations. It automatically generates code from the .arb files that are located in the ```/lib/l10n/``` directory.

Don't forget to update ```ios/Runner/Info.plist``` when adding a new locale.


