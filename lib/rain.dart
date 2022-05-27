import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'dart:math' as math;

final math.Random random = math.Random();

Image image = Image.asset('assets/images/star_stroke.png');

ParticleOptions particleOptions = ParticleOptions(
  image: Image.asset('assets/images/star_stroke.png'),
  baseColor: Colors.blue,
  spawnOpacity: 0.0,
  opacityChangeRate: 0.25,
  minOpacity: 0.1,
  maxOpacity: 0.4,
  spawnMinSpeed: 30.0,
  spawnMaxSpeed: 70.0,
  spawnMinRadius: 7.0,
  spawnMaxRadius: 15.0,
  particleCount: 40,
);

// Paint
var particlePaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 1.0;

// Random particle
Behaviour randomParticleBehaviour = RandomParticleBehaviour(
  options: particleOptions,
  paint: particlePaint,
);

// Lines
var lineDirection = LineDirection.Rtl;
// int lineCount = 1;
int lineCount = random.nextInt(4) + 1;

// Racing Lines Behaviour
Behaviour racingLinesBehaviour =
    RacingLinesBehaviour(direction: lineDirection, numLines: lineCount);

// Bubbles
BubbleOptions _bubbleOptions = const BubbleOptions();

// Bubbles Behaviour
Behaviour bubblesBehaviour = BubblesBehaviour(
  options: _bubbleOptions,
);

// Space Behaviour
Behaviour spaceBehaviour = SpaceBehaviour();

// Rain Behaviour
Behaviour rainBehaviour = RainParticleBehaviour();

// Rain Behaviour class
class RainParticleBehaviour extends RandomParticleBehaviour {
  static math.Random random = math.Random();

  bool enabled;

  RainParticleBehaviour({
    ParticleOptions options = const ParticleOptions(),
    Paint? paint,
    this.enabled = true,
  }) : super(options: options, paint: paint);

  @override
  void initPosition(Particle p) {
    p.cx = random.nextDouble() * size!.width;
    if (p.cy == 0.0) {
      p.cy = random.nextDouble() * size!.height;
    } else {
      p.cy = random.nextDouble() * size!.width * 0.2;
    }
  }

  @override
  void initDirection(Particle p, double speed) {
    double dirX = (random.nextDouble() - 0.5);
    double dirY = random.nextDouble() * 0.5 + 0.5;
    double magSq = dirX * dirX + dirY * dirY;
    double mag = magSq <= 0 ? 1 : math.sqrt(magSq);

    p.dx = dirX / mag * speed;
    p.dy = dirY / mag * speed;
  }

  @override
  Widget builder(
      BuildContext context, BoxConstraints constraints, Widget child) {
    return GestureDetector(
      onPanUpdate: enabled
          ? (details) => _updateParticles(context, details.globalPosition)
          : null,
      onTapDown: enabled
          ? (details) => _updateParticles(context, details.globalPosition)
          : null,
      child: ConstrainedBox(
        // necessary to force gesture detector to cover screen
        constraints: const BoxConstraints(
            minHeight: double.infinity, minWidth: double.infinity),
        child: super.builder(context, constraints, child),
      ),
    );
  }

  void _updateParticles(BuildContext context, Offset offsetGlobal) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.globalToLocal(offsetGlobal);
    for (var particle in particles!) {
      var delta = (Offset(particle.cx, particle.cy) - offset);
      if (delta.distanceSquared < 70 * 70) {
        var speed = particle.speed;
        var mag = delta.distance;
        speed *= (70 - mag) / 70.0 * 2.0 + 0.5;
        speed = math.max(
            options.spawnMinSpeed, math.min(options.spawnMaxSpeed, speed));
        particle.dx = delta.dx / mag * speed;
        particle.dy = delta.dy / mag * speed;
      }
    }
  }
}
