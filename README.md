[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/7V0OiV0Y)
# Week 12 - Flame Overlays Assignment

## Overview
This week we're learning how to use **Flame overlays** to create UI elements that sit on top of the game canvas. You'll build a simple asteroid demo with multiple overlays including a title screen, HUD, pause menu, info screen with WebView, and settings panel.

All code will be provided in class - you just need to piece it together following along with the lecture. This assignment is about understanding how overlays work and getting hands-on practice with the Flame engine's overlay system.

## Assignment Requirements

**GitHub Submission**: Submit a **working** version of this project to your GitHub repository. Since all code is provided and we'll walk through it together in class, credit requires demonstrating a functional implementation.

## Recommended Setup Method

Due to potential version/dependency conflicts, the **recommended approach** is to create a fresh Flutter project and copy the starter files over:

### Step-by-Step Setup

1. **Create a new Flutter project**
   - In VS Code: `Cmd/Ctrl + Shift + P` → "Flutter: New Project"
   - Choose "Empty Application"
   - Name it something like `flame_overlays` or `week12_overlays`

2. **Add the Flame package**
   ```bash
   flutter pub add flame
   ```

3. **Copy the starter files**
   Copy these 3 files from this repository into your new project's `lib/` folder:
   - `lib/main.dart`
   - `lib/game.dart`
   - `lib/asteroid.dart`

4. **Set up assets**
   - Copy the entire `assets/` folder from this repo to your new project
   - Update your `pubspec.yaml` to include the assets path:
   ```yaml
   flutter:
     uses-material-design: true
     assets:
       - assets/images/
   ```

5. **Verify setup**
   ```bash
   flutter pub get
   flutter run
   ```
   You should see a purple screen with bouncing asteroids.

## Alternative: Clone and Run

If you prefer to clone this repo directly, you're welcome to try:

```bash
git clone <your-repo-url>
cd flame_overlays
flutter pub get
flutter run
```

**Important**: If you encounter build/Gradle errors, check:
- Your Flutter version matches the SDK requirement in `pubspec.yaml` (SDK ^3.9.2)
- Your Flame package version (`flame: ^1.21.0`)
- Android Gradle version (if building for Android)

If issues persist, fall back to the recommended setup method above.

## What You'll Build in Class

During the lecture, we'll create 5 overlay files:
- `lib/overlay_title.dart` - Title screen overlay
- `lib/overlay_main.dart` - Main HUD overlay
- `lib/overlay_pause.dart` - Pause menu overlay
- `lib/overlay_info.dart` - Info screen with WebView
- `lib/overlay_settings.dart` - Settings panel with sliders

We'll also add the WebView package mid-class:
```bash
flutter pub add webview_flutter
```

## Key Concepts

- **Overlay System**: Using `overlayBuilderMap` and managing overlays with `game.overlays.add()` / `game.overlays.remove()`
- **Game Pausing**: Controlling the game loop with `game.paused = true/false`
- **Widget Integration**: Combining Flutter widgets with Flame game components
- **WebView**: Embedding web content in your game
- **Transparent Materials**: Creating see-through overlays that show the game beneath

## Testing Your Work

A working implementation should:
1. Start with a title screen overlay
2. Allow starting the game and seeing a semi-transparent HUD bar at the bottom
3. Support pausing and resuming the game
4. Display an info overlay with a WebView showing HTML content
5. Show a settings overlay with functional sliders

## Submission

Push your working project to GitHub. Make sure:
- The project runs without errors
- All overlays are functional
- Include a brief note in your commit about what you learned

## Resources

- [Weekly Instructions (Week 12A)](https://github.com/jptweb/IGME-340-Shared/blob/main/weekly/12A.md)
- [Flame Documentation - Overlays](https://docs.flame-engine.org/latest/flame/overlays.html)
- Teaching guide included in this repo: `teaching_guide_overlays.md`

## Questions?

If you run into issues during setup or development, reach out during office hours or class time.
