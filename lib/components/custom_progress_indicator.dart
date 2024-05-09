import 'package:flutter/material.dart';
import 'dart:math';

class CustomProgressIndicator extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double radius;
  final int duration;
  final double stroke;

  const CustomProgressIndicator({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.radius,
    required this.duration,
    required this.stroke,
  });

  @override
  MyCustomProgressIndicator createState() => MyCustomProgressIndicator();
}

class MyCustomProgressIndicator extends State<CustomProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat();
    _animation =
        Tween<double>(begin: 0.0, end: 360.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(_animationController),
      child: CustomPaint(
        painter: CirclePainter(
          primaryColor: widget.primaryColor,
          secondaryColor: widget.secondaryColor,
          strokeWidth: widget.stroke,
        ),
        size: Size(
          widget.radius,
          widget.radius,
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color primaryColor;
  final double strokeWidth;
  final Color secondaryColor;

  double _degToRad(double deg) => deg * (pi / 180);

  CirclePainter({
    required this.primaryColor,
    required this.secondaryColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double center = size.height / 2;

    Paint paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [
        secondaryColor,
        primaryColor,
      ],
      tileMode: TileMode.repeated,
      startAngle: _degToRad(270),
      endAngle: _degToRad(270 + 340.0),
    ).createShader(
      Rect.fromCircle(center: Offset(center, center), radius: 0),
    );

    double scap = strokeWidth * 0.70;
    double scapDeg = scap / center;

    double start = _degToRad(270) + scapDeg;
    double end = _degToRad(360) - (2 * scapDeg);

    canvas.drawArc(
      const Offset(0.0, 0.0) & Size(size.width, size.width),
      start,
      end - 0.05,
      false,
      paint..color = primaryColor,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
