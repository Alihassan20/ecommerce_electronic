import 'package:ecommerce_electronic/constant/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/new_route.dart';
import 'featue/home_page/view.dart';
import 'featue/intro_screen/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      return MyHomePage.routName;
    } else {
      await prefs.setBool('seen', true);
      return IntroScreen.routName;
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              onGenerateRoute: onGenerateRoute,
              theme: ThemeData(
                scrollbarTheme: const ScrollbarThemeData().copyWith(
                  thumbColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                primarySwatch: Colors.blue,
              ),
              initialRoute: snapshot.data  as String,
              routes: {
                IntroScreen.routName: (context) => IntroScreen(),
                MyHomePage.routName: (context) => MyHomePage(1),
              },
            );
          }
        });
  }
}