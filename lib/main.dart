import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_management/feature/login/view/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Const yaptık çünkü içeri bir data çekmiyoruz durağanız.
    return MaterialApp(
      title: 'Material App',
      home: LoginView(key: ValueKey("MyUniqueId")),
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark),
          scaffoldBackgroundColor: Colors.grey[300],
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.amber)),
    );
  }
}
