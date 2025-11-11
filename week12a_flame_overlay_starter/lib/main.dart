import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:week12a_flame_overlay_starter/overlay/overlay_info.dart';
import 'package:week12a_flame_overlay_starter/overlay/overlay_settings.dart';

import 'game.dart';
import 'overlay/overlay_title.dart';
import 'overlay/overlay_main.dart';
import 'overlay/overlay_pause.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget(
          game: OverlayTutorial(context)..paused = true,
          overlayBuilderMap: {
            'title': (context, game){
              return OverlayTitle(game: game,);
            },
            'main': (context,game){
              return mainOverlay(context,game);
            },
            'pause': (context,game){
              return pauseOverlay(context, game);
            },
            'info': (context,game){
              return InfoOverlay(game: game as OverlayTutorial);
            },
            'settings': (context,game){
              return settingsOverlay(context, game);
            }
          },
          initialActiveOverlays: const ['title'],
        ),
      ),
    );
  }
}
