import 'package:flutter/material.dart';

import 'package:paikee/backend/models/user.dart';
import 'package:paikee/widgets/components/navigation_bar.dart';

import 'home_view/home.dart';
import 'messages/messages_list.dart';
import 'profile.dart';
import 'rooms.dart';
import 'scheduled/scheduled.dart';

PageController _mainController = PageController(initialPage: 2);
bool appBarIsDark = false;

class MainView extends StatefulWidget {
  final User user;
  final Function setAppBarDark;
  const MainView({
    Key? key,
    required this.user,
    required this.setAppBarDark,
  }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _page = 2;

  goToPage(int page) {
    if (_page == 3) {
      widget.setAppBarDark(false);
    }
    _page = page;
    _mainController.animateToPage(
      _page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    setState(() {});
  }

  void setAppBarDark(bool dark) {
    widget.setAppBarDark(dark);
    appBarIsDark = dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: !appBarIsDark,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: appBarIsDark ? 0 : 0),
              child: PageView(
                controller: _mainController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const Rooms(),
                  const Messages(),
                  Home(user: widget.user),
                  Scheduled(setAppBarDark: setAppBarDark),
                  Profile(user: widget.user)
                ],
              ),
            ),

            // Custom Bottom Navigation Bar
            _CustomBottomNavigationBar(
              page: _page,
              goToPage: goToPage,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _FAB(page: _page),

      // bottomNavigationBar: CustomNavigationBar(
      //     controller: _mainController, setAppBarDark: widget.setAppBarDark),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar({
    Key? key,
    required this.page,
    required this.goToPage,
  }) : super(key: key);

  final page;
  final goToPage;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Positioned(
      // width: 400,
      width: MediaQuery.of(context).size.width,
      bottom: 0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.antiAlias,
        children: [
          CustomPaint(
            size: const Size(double.infinity, 62),
            painter: BottomNavigationPainter(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => goToPage(0),
                  icon: const Icon(Icons.groups),
                  color: page == 0
                      ? theme.primaryColor
                      : theme.scaffoldBackgroundColor,
                ),
                IconButton(
                  onPressed: () => goToPage(1),
                  icon: const Icon(Icons.forum),
                  color: page == 1
                      ? theme.primaryColor
                      : theme.scaffoldBackgroundColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 4),
                  child: IconButton(
                    onPressed: () => goToPage(2),
                    icon: const Icon(Icons.home),
                    color: page == 2
                        ? theme.primaryColor
                        : theme.scaffoldBackgroundColor,
                  ),
                ),
                IconButton(
                  onPressed: () => goToPage(3),
                  icon: const Icon(Icons.menu_book),
                  color: page == 3
                      ? theme.primaryColor
                      : theme.scaffoldBackgroundColor,
                ),
                IconButton(
                  onPressed: () => goToPage(4),
                  icon: const Icon(Icons.person),
                  color: page == 4
                      ? theme.primaryColor
                      : theme.scaffoldBackgroundColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB({
    Key? key,
    required int page,
  })  : _page = page,
        super(key: key);

  final int _page;

  @override
  Widget build(BuildContext context) {
    return Transform(
      // rotate this 45 degrees
      transform: Matrix4.rotationZ(45 * 3.1415927 / 180),
      origin: const Offset(50, -20),
      alignment: Alignment.center,
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'home',
        backgroundColor: const Color(0xff2D3548),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(17),
          ),
        ),
        child: Transform(
          transform: Matrix4.rotationZ(-45 * 3.1415927 / 180),
          alignment: Alignment.center,
          child: Icon(
            Icons.home,
            color: _page == 2 ? Colors.blue : Colors.white,
          ),
        ),
      ),
    );
  }
}

class BottomNavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.6469026, 0);
    path_0.cubicTo(
        size.width * 0.6267564,
        0,
        size.width * 0.6074744,
        size.height * 0.05225148,
        size.width * 0.5934667,
        size.height * 0.1447995);
    path_0.lineTo(size.width * 0.5331667, size.height * 0.5431803);
    path_0.cubicTo(
        size.width * 0.5150282,
        size.height * 0.6630148,
        size.width * 0.4849718,
        size.height * 0.6630148,
        size.width * 0.4668333,
        size.height * 0.5431803);
    path_0.lineTo(size.width * 0.4065333, size.height * 0.1447997);
    path_0.cubicTo(size.width * 0.3925256, size.height * 0.05225148,
        size.width * 0.3732436, 0, size.width * 0.3530974, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff2D3548).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
