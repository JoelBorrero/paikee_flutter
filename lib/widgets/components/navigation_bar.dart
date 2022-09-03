import 'package:flutter/material.dart';
import 'package:paikee/utils/constants.dart';

class CustomNavigationBar extends StatefulWidget {
  final PageController controller;
  final Function setAppBarDark;
  const CustomNavigationBar(
      {Key? key, required this.controller, required this.setAppBarDark})
      : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

int _page = 2;

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  void goToPage(int page) {
    if (_page == 3) {
      widget.setAppBarDark(false);
    }
    setState(() {
      _page = page;
      widget.controller.animateToPage(_page, duration: duration, curve: curve);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ClipPath(
      clipper: CustomNavigationBarClipper(),
      child: Container(
          decoration: BoxDecoration(color: theme.primaryColorDark),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => goToPage(0),
                icon: const Icon(Icons.groups),
                color: _page == 0
                    ? theme.primaryColor
                    : theme.scaffoldBackgroundColor,
              ),
              IconButton(
                onPressed: () => goToPage(1),
                icon: const Icon(Icons.forum),
                color: _page == 1
                    ? theme.primaryColor
                    : theme.scaffoldBackgroundColor,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: IconButton(
                  onPressed: () => goToPage(2),
                  icon: const Icon(Icons.home),
                  color: _page == 2
                      ? theme.primaryColor
                      : theme.scaffoldBackgroundColor,
                ),
              ),
              IconButton(
                onPressed: () => goToPage(3),
                icon: const Icon(Icons.menu_book),
                color: _page == 3
                    ? theme.primaryColor
                    : theme.scaffoldBackgroundColor,
              ),
              IconButton(
                onPressed: () => goToPage(4),
                icon: const Icon(Icons.person),
                color: _page == 4
                    ? theme.primaryColor
                    : theme.scaffoldBackgroundColor,
              ),
            ],
          )),
    );
  }
}

class CustomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width, h = size.height;
    // Scale factors
    const double factorBarTop = 0.322807,
        factorPoint1X = 0.3891667,
        factorPoint2X = 0.4,
        factorPoint3X = 0.475;
    // Reference points
    double barTop = h * factorBarTop,
        point1X = w * factorPoint1X,
        point2X = w * factorPoint2X,
        point2Y = h * 0.42807,
        point3X = w * factorPoint3X,
        point3Y = h * 0.750877,
        point4X = w * (1 - factorPoint3X),
        point5X = w * (1 - factorPoint2X),
        point6X = w * (1 - factorPoint1X);
    // Curve points
    double curve1Y1 = h * 0.3605, curve1Y2 = h * 0.383, curve3Y = h * 0.807;

    // Big bottom area
    Path path = Path();
    path.moveTo(0, barTop);
    path.lineTo(point1X, barTop);
    path.cubicTo(point1X, curve1Y1, point1X, curve1Y2, point2X, point2Y);
    path.lineTo(point3X, point3Y);
    path.cubicTo(w * 0.495, curve3Y, w * 0.505, curve3Y, point4X, point3Y);
    path.lineTo(point5X, point2Y);
    path.cubicTo(point6X, curve1Y2, point6X, curve1Y1, point6X, barTop);
    path.lineTo(w, barTop);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, barTop);

    double axisPointDistanceShort = w * 0.017,
        axisPointDistanceLong = w * 0.0666667,
        axisCurveDistanceX = w * 0.009,
        axisCurveDistanceY = h * 0.0354035;
    point1X = w * 0.5 - axisPointDistanceShort;
    point2X = w * 0.5 + axisPointDistanceShort;
    point3X = w * 0.5 + axisPointDistanceLong;
    point3Y = barTop - axisPointDistanceShort;
    double point1Y = axisCurveDistanceY,
        point4Y = barTop + axisPointDistanceShort,
        point5Y = 2 * barTop - point1Y,
        point7X = w * 0.5 - axisPointDistanceLong;
    // Floating square
    path.moveTo(point1X, point1Y);
    path.cubicTo(point1X + axisCurveDistanceX, 0, point2X - axisCurveDistanceX,
        0, point2X, point1Y);
    path.lineTo(point3X, point3Y);

    path.cubicTo(
        point3X + axisCurveDistanceX,
        point3Y + axisCurveDistanceY,
        point3X + axisCurveDistanceX,
        point4Y - axisCurveDistanceY,
        point3X,
        point4Y);
    path.lineTo(point2X, point5Y);
    path.cubicTo(
        point2X - axisCurveDistanceX,
        point5Y + axisCurveDistanceY,
        point1X + axisCurveDistanceX,
        point5Y + axisCurveDistanceY,
        point1X,
        point5Y);
    path.lineTo(point7X, point4Y);
    path.cubicTo(
        point7X - axisCurveDistanceX,
        point4Y - axisCurveDistanceY,
        point7X - axisCurveDistanceX,
        point3Y + axisCurveDistanceY,
        point7X,
        point3Y);
    path.lineTo(point1X, point1Y);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
