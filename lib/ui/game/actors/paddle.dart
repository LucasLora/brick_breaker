import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Paddle extends BodyComponent<BrickBreakerGame> with DragCallbacks {
  Paddle({required this.size, Vector2? position})
    : super(
        bodyDef: BodyDef(
          type: BodyType.kinematic,
          position: position,
          allowSleep: false,
        ),
        fixtureDefs: [
          FixtureDef(
            PolygonShape()..setAsBoxXY((size.x - size.y) * 0.5, size.y * 0.5),
            restitution: 1,
            friction: 0.25,
          ),
          FixtureDef(
            CircleShape()
              ..radius = size.y * 0.5
              ..position.setValues(-size.x * 0.5 + size.y * 0.5, 0),
            restitution: 1,
            friction: 0.25,
          ),
          FixtureDef(
            CircleShape()
              ..radius = size.y * 0.5
              ..position.setValues(size.x * 0.5 - size.y * 0.5, 0),
            restitution: 1,
            friction: 0.25,
          ),
        ],
      );

  final Vector2 size;

  double _hAxis = 0;
  final double _maxSpeed = 17;
  final double _deadZone = 0.025;

  bool get _isAtLimits =>
      (body.position.x < size.x * 0.75 && _hAxis < 0) ||
      (body.position.x > game.camera.viewport.virtualSize.x - size.x * 0.75 &&
          _hAxis > 0);

  @override
  void update(double dt) {
    super.update(dt);
    body.linearVelocity.setValues(_isAtLimits ? 0.0 : _hAxis * _maxSpeed, 0);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (event.localDelta.x.abs() > _deadZone) {
      if (event.localDelta.x > 0) {
        _hAxis = 1;
      } else {
        _hAxis = -1;
      }
    } else {
      _hAxis = 0;
    }
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    _hAxis = 0;
  }
}
