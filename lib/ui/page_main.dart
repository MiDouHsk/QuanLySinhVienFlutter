import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mainviewmodel.dart';
import '../providers/menubarviewmodel.dart';
import 'AppConstant.dart';

class PageMain extends StatelessWidget {
  static String routename = '/home';
  PageMain({super.key});
  final List<String> menuTitles = [
    "Tin Tức",
    "Profile",
    "Điểm Danh",
    "Danh Sách Lớp",
    "Danh Sách Học Phần",
  ];

  final menuBar = MenuItemlist();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewmodel = Provider.of<MainViewModel>(context);
    menuBar.initialize(menuTitles);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: GestureDetector(
          onTap: () => viewmodel.toggleMenu(),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Consumer<MenuBarViewModel>(
            builder: (context, menuBarModel, child) {
              return GestureDetector(
                onTap: () {
                  viewmodel.closeMenu();
                },
                child: Container(
                  color: Colors.deepPurple[300],
                  child: Center(
                    child: Text("body"),
                  ),
                ),
              );
            },
          ),
          viewmodel.menustatus == 1
              ? Consumer<MenuBarViewModel>(
                  builder: (context, menuBarModel, child) {
                    return GestureDetector(
                        onPanUpdate: (details) {
                          menuBarModel.setOffset(details.localPosition);
                        },
                        onPanEnd: (details) {
                          menuBarModel.setOffset(Offset(0, 0));
                        },
                        child: Stack(
                          children: [
                            CustomeMenuSizeBar(size: size),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: menuBar,
                            )
                          ],
                        ));
                  },
                )
              : Container(),
        ],
      )),
    );
  }
}

class MenuItemlist extends StatelessWidget {
  MenuItemlist({
    super.key,
  });

  final List<MenuBarItem> menuBarItems = [];
  void initialize(List<String> menuTitles) {
    for (int i = 0; i < menuTitles.length; i++) {
      menuBarItems.add(MenuBarItem(
        containnerkey: GlobalKey(),
        titles: menuTitles[i],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuBarItems.length,
      itemBuilder: (content, index) {
        return menuBarItems[index];
      },
    );
  }
}

class MenuBarItem extends StatelessWidget {
  MenuBarItem({
    super.key,
    required this.titles,
    required this.containnerkey,
  });

  final String titles;
  final GlobalKey containnerkey;
  TextStyle style = AppConstant.textbody;

  void onPanmove(Offset offset) {
    if (offset.dy == 0) {
      style = AppConstant.textbody;
    }
    if (containnerkey.currentContext != null) {
      RenderBox box =
          containnerkey.currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      if (offset.dy < position.dy - 40 && offset.dy > position.dy - 80) {
        style = AppConstant.textbodyfocus;
      } else {
        style = AppConstant.textbody;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuBarModel = Provider.of<MenuBarViewModel>(context);
    onPanmove(menuBarModel.offset);

    return Container(
      key: containnerkey,
      alignment: Alignment.centerLeft,
      height: 40,
      child: Text(
        titles,
        style: style,
      ),
    );
  }
}

class CustomeMenuSizeBar extends StatelessWidget {
  const CustomeMenuSizeBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final sizeBarModel = Provider.of<MenuBarViewModel>(context);
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      size: Size(size.width * .65, size.height),
      painter: DrawerCustomPaint(offset: sizeBarModel.offset),
    );
  }
}

class DrawerCustomPaint extends CustomPainter {
  final Offset offset;

  DrawerCustomPaint({super.repaint, required this.offset});
  double generatePointX(double width) {
    double kq = 0;
    if (offset.dx == 0) {
      kq = width;
    } else if (offset.dx < width) {
      kq = width + 75;
    } else {
      kq = offset.dx;
    }
    return kq;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        generatePointX(size.width), offset.dy, size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
