# Innkeeper 🎲

A native iOS app to track your board game collection, log your plays, and see stats on what you play most.

I built it because I own 40+ board games and wanted a proper way to keep track of my collection and game nights — the name comes from the idea of an innkeeper keeping a ledger of everyone who passes through.

> ⚠️ Work in progress — built as a portfolio project to showcase modern iOS development.

## Tech stack

- **Swift** & **SwiftUI**
- **SwiftData** for persistence
- **Swift Charts** for statistics
- **MVVM** architecture
- **XCTest** for unit testing
- **BoardGameGeek API** integration (planned)

## Features

- [x] Add, edit and delete games in your collection
- [x] Log plays and link them to games (one-to-many relationship)
- [ ] Statistics dashboard (most played, plays per month, win rates)
- [ ] Players and match results
- [ ] Autocomplete game data and cover art via the BoardGameGeek API
- [ ] Accessibility (VoiceOver, Dynamic Type) and polish

## Screenshots

_Coming soon._

<!--
Once you have the app running, drop screenshots in a /screenshots folder and embed them:
![Game list](screenshots/game-list.png)
![Statistics](screenshots/stats.png)
-->

## Architecture

The app follows an MVVM structure, keeping statistics logic out of the views so it can be unit-tested independently:

```
Innkeeper/
├── Models/        // SwiftData @Model classes (Game, Match, ...)
├── ViewModels/    // Business logic, e.g. statistics calculations
├── Views/         // SwiftUI views
├── Services/      // API and other external integrations
└── Tests/         // Unit tests
```

## Requirements

- iOS 17.0+
- Xcode 15+

## Author

Jesús Ortega — [LinkedIn](https://www.linkedin.com/in/jortegaa/)
