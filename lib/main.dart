import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xFF94B1F9, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffce5641), //10%
      100: const Color(0xffb74c3a), //20%
      200: const Color(0xffa04332), //30%
      300: const Color(0xff89392b), //40%
      400: const Color(0xff733024), //50%
      500: const Color(0xff5c261d), //60%
      600: const Color(0xff451c16), //70%
      700: const Color(0xff2e130e), //80%
      800: const Color(0xff170907), //90%
      900: const Color(0xff000000), //100%
    },
  );
}

Future<void> main() async {
  //hive
  await Hive.initFlutter();
  //open box
  var box = await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
    );
  }
}
