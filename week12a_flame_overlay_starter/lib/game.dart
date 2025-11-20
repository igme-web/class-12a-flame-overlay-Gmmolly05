import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'asteroid.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';

///
/// The Game!
/// This is just a simple demo FlameGame to allow us to see how
/// we can use Overlays to enhance this game and see how we can
/// control the flow of the game.
///
/// Things to note:
/// - the background color of the game is changed to a ARGB color.
/// - assets are preloaded into cache.
/// - the game spawns 10 asteroids that are unmanaged.
/// - the game uses TapCallbacks to handle tap events. Nothing happens yet.
///

class OverlayTutorial extends FlameGame
    with TapCallbacks, WidgetsBindingObserver {
  final BuildContext context;
  late final GameProvider gameProvider;

  OverlayTutorial(this.context);

  @override
  Color backgroundColor() => const Color.fromARGB(249, 120, 86, 233);

  @override
  void onDispose() {
    // Add This to the onDispose (inside)
    WidgetsBinding.instance.removeObserver(this);

    //existing code, and the super.onDispose() called last!
    gameProvider.dispose();
    super.onDispose();
  }

  @override
  Future<void> onLoad() async {
    // Initialize provider
    gameProvider = Provider.of<GameProvider>(context, listen: true);

    // Play background music
    gameProvider.playBgm("audio/retro_bgm.wav");

    await images.loadAll(["asteroid.png"]);

    for (int i = 0; i < 10; i++) {
      add(Asteroid());
    }
  }

  @override
  void onAttach() {
    super.onAttach();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        // TODO: Print "Resumed"
        print("Resumed");
        // TODO: Resume the game engine
        resumeEngine();
        // TODO: Resume the music player
        gameProvider.musicPlayer.resume();
        break;

      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        // TODO: Print "Paused"
        print("Paused");
        // TODO: Pause the game engine
        pauseEngine();
        // TODO: Pause the music player
        gameProvider.musicPlayer.pause();
        break;
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);

    // Increment score
    gameProvider.incrementScore(1);

    // Play sound effect
    gameProvider.playSfx("audio/shot.wav");
  }
}
