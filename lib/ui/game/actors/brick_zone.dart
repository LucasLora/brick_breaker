import 'dart:math';

import 'package:brick_breaker/models/enums/generation_type.dart';
import 'package:brick_breaker/ui/game/actors/brick.dart';
import 'package:brick_breaker/ui/game/world.dart';
import 'package:flame/components.dart';

class BrickZone extends PositionComponent with ParentIsA<BrickBreakerWorld> {
  BrickZone({
    required super.position,
    required super.size,
    required this.numBricksX,
    required this.numBricksY,
    required this.spacingX,
    required this.spacingY,
  }) {
    brickSize = Vector2(
      (size.x - (numBricksX - 1) * spacingX) / numBricksX,
      (size.y - (numBricksY - 1) * spacingY) / numBricksY,
    );
  }

  final int numBricksX;
  final int numBricksY;
  final double spacingX;
  final double spacingY;
  late final Vector2 brickSize;
  final _random = Random();

  @override
  void onMount() {
    super.onMount();
    _generateBricks();
  }

  void _generateBricks() {
    switch (parent.gameViewModel.generationType) {
      case GenerationType.manual:
        _generateManualBricks();
        break;
      case GenerationType.semiRandom:
        _generateSemiRandomBricks();
        break;
      case GenerationType.random:
        _generateRandomBricks();
        break;
    }
  }

  /// Gera todos os tijolos, preenchendo toda a zona.
  void _generateManualBricks() {
    for (var row = 0; row < numBricksY; row++) {
      for (var col = 0; col < numBricksX; col++) {
        _createBrick(row, col);
      }
    }
  }

  /// Gera tijolos em um padrão semi-aleatório (ex: metade superior aleatória, metade inferior fixa).
  void _generateSemiRandomBricks() {
    final semiRandomThreshold = numBricksY ~/ 2;

    for (var row = 0; row < numBricksY; row++) {
      for (var col = 0; col < numBricksX; col++) {
        if (row > semiRandomThreshold) {
          if (_random.nextDouble() > 0.30) {
            _createBrick(row, col);
          }
        } else {
          _createBrick(row, col);
        }
      }
    }
  }

  /// Gera tijolos de forma totalmente aleatória.
  void _generateRandomBricks() {
    for (var row = 0; row < numBricksY; row++) {
      for (var col = 0; col < numBricksX; col++) {
        if (_random.nextDouble() > 0.30) {
          _createBrick(row, col);
        }
      }
    }
  }

  void _createBrick(int row, int col) {
    final brickPosition =
        position +
        Vector2(
          brickSize.x * 0.5 + col * (brickSize.x + spacingX),
          brickSize.y * 0.5 + row * (brickSize.y + spacingY),
        );
    final brick = Brick(position: brickPosition, size: brickSize);
    parent.add(brick);
  }
}
