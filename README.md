# Asky - Flutter App

Beauty & grooming booking app for Niger, Africa.

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── router.dart                  # Navigation (go_router)
├── theme/
│   └── asky_theme.dart         # Colors, typography, decorations
├── widgets/
│   └── bottom_nav.dart         # Bottom navigation bar
└── screens/
    ├── onboarding_screen.dart  # Language + Role + Category selection
    ├── home_screen.dart        # Browse providers
    ├── bookings_screen.dart    # Manage appointments
    ├── wallet_screen.dart      # Balance & payments
    └── profile_screen.dart     # User profile
```

## Setup in VSCode

### 1. Prerequisites
Make sure you have Flutter installed:
```bash
flutter --version
```
If not, install from https://flutter.dev/docs/get-started/install

### 2. Open in VSCode
```bash
code asky/
```

### 3. Install dependencies
```bash
flutter pub get
```

### 4. Run the app
```bash
# On connected Android/iOS device
flutter run

# On Android emulator
flutter run -d emulator-5554

# On iOS simulator (Mac only)
flutter run -d iPhone

# As web app
flutter run -d chrome
```

## Dependencies

| Package | Purpose |
|---|---|
| `go_router` | Navigation between screens |
| `google_fonts` | Nunito font family |
| `cached_network_image` | Efficient image loading |
| `phosphor_flutter` | Icon set |

## Screens

- **Onboarding** — Language selection (French, Hausa, Arabic, English, Swahili, Zarma, Amharic, Yoruba, Igbo) + Role (Client / Provider) + Category
- **Home** — Browse barbers & beauty providers near Niamey
- **Bookings** — Upcoming, Past, Canceled appointments
- **Wallet** — Balance (CFA), Mobile Money, Cash, Card, Bank Transfer
- **Profile** — User info, stats, Switch to Provider mode

## Design System

- **Primary color**: Terracotta `#C4714A`
- **Background**: Warm off-white `#F5F2EE`
- **Dark**: Charcoal `#1C1A17`
- **Currency**: CFA Franc (West African)
# Aski
