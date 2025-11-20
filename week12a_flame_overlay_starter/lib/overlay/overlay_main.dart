import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../game_provider.dart';

Widget mainOverlay(BuildContext context, game) {
  final gameProvider = Provider.of<GameProvider>(context, listen: true);

  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      color: Color.fromARGB(48, 245, 154, 50), // Semi-transparent orange
      width: double.infinity, // Full width
      height: 50,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Score: ${gameProvider.score}",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          IconButton(
            onPressed: () {
              //game.overlays.remove('main');
              game.overlays.add('pause');
              game.paused = true;
            },
            icon: Icon(Icons.pause),
          ),
          IconButton(
            onPressed: () {
              game.paused = true;
              game.overlays.add('settings');
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              game.paused = true;
              game.overlays.add('info');
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
    ),
  );
}
