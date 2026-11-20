# Offline Posts App (Flutter + Hive)

Posts app that fetches from JSONPlaceholder, caches to **Hive** for offline use,
and lets the user save **favorites** in a separate box.

## Features
- API -> Hive -> ListView (works in airplane mode)
- Pull to refresh
- Favorite / unfavorite posts (filled / outlined star, instant update)
- Favorites screen with "No favorites yet" empty state
- Favorites persist across refreshes and restarts

## Structure
```
lib/
├── main.dart
├── models/post_model.dart (+ generated post_model.g.dart)
├── services/post_service.dart, favorites_service.dart
├── screens/posts_screen.dart, favorites_screen.dart
└── widgets/post_card.dart
```

## Run
```
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Screenshots
| Feature | Screenshot |
|---|---|
| Posts loaded online | _add image_ |
| Posts loaded offline (airplane mode) | _add image_ |
| Favorite toggled (filled star) | _add image_ |
| Favorites screen | _add image_ |
| Empty favorites | _add image_ |
| Favorites after restart in airplane mode | _add image_ |
