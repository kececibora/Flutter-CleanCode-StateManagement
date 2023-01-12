import 'package:flutter/material.dart';
import 'package:state_management/feature/onboard/on_board_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Const yaptık çünkü içeri bir data çekmiyoruz durağanız.
    return MaterialApp(
      title: 'Material App',
      home: const OnBoardView(),
      theme: ThemeData.light().copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.amber)),
    );
  }
}
