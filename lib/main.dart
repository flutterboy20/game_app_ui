import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:game_app/screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SafeArea(
        child: Scaffold(
          body: HomeScreen(),
          bottomNavigationBar: CurvedNavigationBar(
            index: 2,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.black,
            color: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            items: const [
              Icon(Icons.search_rounded, size: 30, color: Colors.white),
              Icon(Icons.star_outlined, size: 30, color: Colors.white),
              Icon(Icons.home_rounded, size: 30, color: Colors.white),
              Icon(Icons.notifications, size: 30, color: Colors.white),
              Icon(Icons.settings, size: 30, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
