import 'package:flutter/material.dart';

Widget pauseOverlay(BuildContext context, game) {
  return Center(
    child: Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 150, 200, 220), // Different color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Game Paused",
            style: TextStyle(color: Colors.black, fontSize: 48),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.paused = false;
              game.overlays.remove('pause');
              //game.overlays.add('main');
            },
            child: const Text("Resume"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.overlays.add('settings');
            },
            child: const Text("Settings"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Quit functionality
            },
            child: const Text("Quit"),
          ),
        ],
      ),
    ),
  );
}
