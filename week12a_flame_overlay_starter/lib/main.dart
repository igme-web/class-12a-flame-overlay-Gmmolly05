import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week12a_flame_overlay_starter/game_provider.dart';
import 'package:week12a_flame_overlay_starter/overlay/overlay_info.dart';
import 'package:week12a_flame_overlay_starter/overlay/overlay_settings.dart';

import 'game.dart';
import 'overlay/overlay_title.dart';
import 'overlay/overlay_main.dart';
import 'overlay/overlay_pause.dart';
import 'highscore_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentNavScreen = 0;

  final List<Widget> _bottomNavScreens = [
    const MainGame(),
    const HighscorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flame Demo"),
          backgroundColor: Colors.red,
        ),
        body: _bottomNavScreens[_currentNavScreen],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentNavScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "High Scores",
            ),
          ],
          onTap: (value) {
            setState(() {
              _currentNavScreen = value;
            });
          },
        ),
      ),
    );
  }
}

class MainGame extends StatefulWidget {
  const MainGame({super.key});

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  @override
  Widget build(BuildContext context) {
    return GameWidget.controlled(
      gameFactory: () => OverlayTutorial(context)..paused = true,
      overlayBuilderMap: {
        'title': (context, game) => OverlayTitle(game: game),
        'main': (context, game) => mainOverlay(context, game),
        'pause': (context, game) => pauseOverlay(context, game),
        'info': (context, game) => InfoOverlay(game: game as OverlayTutorial),
        'settings': (context, game) => settingsOverlay(context, game),
      },
      initialActiveOverlays: const ['title'],
    );
  }
}
