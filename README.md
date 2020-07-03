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


## Navigation and Routes

This Flutter Starter Kit uses [Fluro package](https://pub.dev/packages/fluro) which makes routing easier especially with wildcard paths.

Example:

```
router.navigateTo(context,'profile/12345',)
```

For each page, you would need to add routeName and routeHandler. Then add it to the Routes class in order for it to be added to list of routes.

## Themes

Themes are created using [PanacheWeb](https://rxlabz.github.io/panache_web)