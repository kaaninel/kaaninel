import 'package:flutter/material.dart';

class LogoAnimated extends StatefulWidget {
  final double size;
  final Color color;
  final bool filled;
  final Duration duration;
  const LogoAnimated({
    super.key,
    this.size = 24,
    this.filled = true,
    this.duration = const Duration(milliseconds: 400),
    this.color = const Color.fromARGB(255, 255, 122, 13),
  });

  @override
  State<LogoAnimated> createState() => _LogoAnimatedState();
}

class _LogoAnimatedState extends State<LogoAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: widget.duration, vsync: this);

  @override
  void initState() {
    super.initState();
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: controller,
      builder: (context, child) => CustomPaint(
          painter: LogoPainter(
              color: widget.color,
              filled: widget.filled,
              progress: controller.value),
          size: Size(widget.size, widget.size)));
}

class Logo extends StatelessWidget {
  final double size;
  final Color color;
  final bool filled;
  const Logo({
    super.key,
    this.size = 24,
    this.filled = true,
    this.color = const Color.fromARGB(255, 255, 122, 13),
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
      painter: LogoPainter(color: color, filled: filled),
      size: Size(size, size));
}

class LogoPainter extends CustomPainter {
  final Color color;
  final bool filled;
  final double? progress;
  late final Paint brush = Paint()
    ..color = color
    ..strokeWidth = 2
    ..style = PaintingStyle.fill;

  late final Paint flubbertjeBrush = Paint()
    ..color = color
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  LogoPainter({
    required this.color,
    required this.filled,
    this.progress,
  });

  final upArm = Path()
    ..moveTo(24, 54.3)
    ..lineTo(24, 70.3)
    ..lineTo(88, 8)
    ..lineTo(72, 8)
    ..lineTo(24, 54.3);
  final downArm = Path()
    ..moveTo(45.5, 56.4)
    ..lineTo(54, 48)
    ..lineTo(88, 88)
    ..lineTo(72, 88)
    ..lineTo(45.5, 56.4);
  final upFlubbertje = Path()
    ..moveTo(24, 16.9)
    ..lineTo(24, 33.5)
    ..lineTo(31, 41)
    ..lineTo(39.6, 32.5)
    ..lineTo(24.3, 17.6);

  @override
  void paint(Canvas canvas, Size size) {
    brush.style = filled ? PaintingStyle.fill : PaintingStyle.stroke;
    canvas.scale(size.width / 96);
    canvas.drawRect(const Offset(8, 8) & const Size(12, 80), brush);
    canvas.drawPath(upArm, brush);
    canvas.drawPath(downArm, brush);
    if (progress != null) {
      canvas.drawPath(
          upFlubbertje, Paint()..color = color.withOpacity(progress!));
    }
    if (progress == null) {
      canvas.drawPath(upFlubbertje, flubbertjeBrush);
    }
  }

  @override
  bool shouldRepaint(LogoPainter oldDelegate) {
    return color != oldDelegate.color ||
        filled != oldDelegate.filled ||
        progress != oldDelegate.progress;
  }
}
