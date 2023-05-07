import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flame_game/actors/ember.dart';
import 'package:my_first_flame_game/managers/segment_manager.dart';
import 'package:my_first_flame_game/objects/ground_block.dart';
import 'package:my_first_flame_game/objects/platform_block.dart';
import 'package:my_first_flame_game/objects/water_enemy.dart';
import 'package:my_first_flame_game/objects/star.dart';

class EmberQuestGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection {
  late EmberPlayer _ember;
  double objectSpeed = 0;
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  void loadGameSegments(int segmentIndex, double xPosition) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
          add(GroundBlock(gridPosition: block.gridPosition, xOffset: xPosition));
          break;
        case PlatformBlock:
          add(PlatformBlock(gridPosition: block.gridPosition, xOffset: xPosition));
          break;
        case Star:
          add(Star(gridPosition: block.gridPosition, xOffset: xPosition));
          break;
        case WaterEnemy:
          add(WaterEnemy(gridPosition: block.gridPosition, xOffset: xPosition));
          break;
      }
    }
  }

  initGame() {
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);
    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }
    _ember = EmberPlayer(
      position: Vector2(128, canvasSize.y - 128),
    );
    add(_ember);
  }

  @override
  Color backgroundColor() => const Color.fromARGB(255, 96, 181, 239);

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
    ]);
    initGame();
  }
}
