import 'package:badges/badges.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant/color.dart';
import '../../constant/style.dart';

import '../cart_view/view.dart';
import '../home_view/view.dart';
import '../profile_view/view.dart';

class MyHomePage extends StatefulWidget {
  int i;
  static const routName = "/MyHomePage";

   MyHomePage(this.i);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> screens = [
     Profile(),
    const HomeView(),
    const Cartview(),
  ];

  @override
  Widget build(BuildContext context) {
    String search = '';
    return Scaffold(
      backgroundColor: kbACKground,
      extendBody: true,
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          style: TabStyle.flip,
          items: const [TabItem(
            title: "Profile",
            icon: FaIcon(FontAwesomeIcons.userCircle,color: kPrimaryColor,),
          ),

            TabItem(title: "Home", icon: FaIcon(FontAwesomeIcons.home,color: kPrimaryColor)),
            TabItem(title: "Cart", icon: FaIcon(FontAwesomeIcons.shoppingCart,color: kPrimaryColor)),
          ],
          elevation: 0,
          activeColor: kPrimaryColor,
          backgroundColor: Colors.white.withOpacity(0.5),
          initialActiveIndex: widget.i,
          onTap: (value) {
            setState(() {
              widget.i = value;
            });
          },
        ),
      ),
      body: screens[widget.i],
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 35;

  @override
  double get activeIconMargin => 20;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(
      fontSize: 15,
      color: color,
    );
  }
}
