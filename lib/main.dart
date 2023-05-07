import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flame_game/ember_quest.dart';

void main() {
  runApp(
    const GameWidget<EmberQuestGame>.controlled(
      gameFactory: EmberQuestGame.new,
    ),
  );
}
