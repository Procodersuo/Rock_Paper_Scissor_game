import 'package:flutter/material.dart';
import 'package:rock_ppr_szr/MainScreen.dart';
import 'package:rock_ppr_szr/winnerscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
initialRoute: MainScreen.id,
      routes: {
  MainScreen.id:(context)=>const MainScreen(),
        WinnerScreen.id:(context)=>const WinnerScreen(),
      },
    );
  }
}

