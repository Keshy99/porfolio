import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'utils/router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Stephen Kings',
      routerConfig: router,
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
              thickness: MaterialStateProperty.all(5),
              radius: const Radius.circular(10),
              thumbColor: MaterialStateProperty.all(Colors.black),
              trackColor: MaterialStateProperty.all(Colors.white),
              trackVisibility: MaterialStateProperty.all(true)),
          primaryColor: const Color(0xFF000000),
          textTheme: GoogleFonts.kuraleTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF000000))),
    );
  }
}
