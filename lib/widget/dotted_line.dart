import 'package:flutter/cupertino.dart';

import '../res/color.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = MyColors.buttonTextColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.miter;

    double dashWidth = 0.5;
    double dashSpace = 5.0;

    double startX = size.width / 2;
    double startY = 0.0;
    double endY = size.height;

    while (startY < endY) {
      canvas.drawLine(Offset(startX, startY), Offset(startX, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
