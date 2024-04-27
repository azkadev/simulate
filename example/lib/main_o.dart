import 'package:flutter/material.dart';
 
class Iphone15ProMaxFullFrameShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Iphone15ProMaxFullFramePainter(),
    );
  }
}

class Iphone15ProMaxFullFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    // Top edge
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // Right edge
    path.arcToPoint(Offset(size.width, size.height), radius: Radius.circular(size.width * 0.05)); // Adjust curvature as needed

    // Bottom edge
    path.lineTo(size.width, size.height - size.width * 0.1); // Adjust height based on actual notch size

    // Left edge
    path.arcToPoint(Offset(0, size.height - size.width * 0.1), radius: Radius.circular(size.width * 0.05)); // Adjust curvature as needed

    // Close the path
    path.close();

    final paint = Paint()
      ..color = Colors.grey // Or any desired color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
