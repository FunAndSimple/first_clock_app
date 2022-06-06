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
  spawnMinSpeed: 50.0,
  spawnMaxSpeed: 70.0,
  spawnMinRadius: 7.0,
  spawnMaxRadius: 15.0,
  particleCount: random.nextInt(4) + 1,
  // particleCount: 3,
);

class ShootingStarsBehaviour extends RacingLinesBehaviour {
  ShootingStarsBehaviour({
    super.direction = LineDirection.Ltr,
    int numLines = 2,
  }) : assert(numLines >= 0) {
    _numLines = numLines;
  }
  int? _numLines;
  @override
  int? get numLines => _numLines;
  // @override
  // List<Line> generateLines(int numLines) => List<Line>.generate(numLines, (i) {
  //       final Line line = Line();
  //       initLine(line);
  //       return line;
  //     });
  @override
  List<Line> generateLines(int numLines) => List<Line>.generate(numLines, (i) {
        final Line line = Line();
        initLine(line);
        return line;
      });

  @override
  void initLine(Line line) {
    line.speed = random.nextDouble() * 300 + 300;
    // line.speed = random.nextDouble() * 400 + 200;

    final bool axisHorizontal =
        (direction == LineDirection.Ltr || direction == LineDirection.Rtl);
    final bool normalDirection =
        (direction == LineDirection.Ltr || direction == LineDirection.Ttb);
    final double sizeCrossAxis = axisHorizontal ? size!.height : size!.width;
    final double sizeMainAxis = axisHorizontal ? size!.width : size!.height;
    final double spawnCrossAxis = random.nextInt(100) * (sizeCrossAxis / 100);
    double spawnMainAxis = 0.0;

    if (line.position == null) {
      spawnMainAxis = random.nextDouble() * sizeMainAxis;
    } else {
      spawnMainAxis = normalDirection
          ? (-line.speed / 2.0)
          : (sizeMainAxis + line.speed / 2.0);
    }

    line.position = axisHorizontal
        ? Offset(spawnMainAxis, spawnCrossAxis)
        : Offset(spawnCrossAxis, spawnMainAxis);
    line.thickness = random.nextInt(2) + 2;
    line.color = Colors.white;
  }
}

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
// int lineCount = particleOptions.particleCount;
int lineCount = random.nextInt(2) + 1;

// Racing Lines Behaviour
Behaviour shootingStarBehaviour = ShootingStarsBehaviour(
  numLines: lineCount,
  direction: lineDirection,
);

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
