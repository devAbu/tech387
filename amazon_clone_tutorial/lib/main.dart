import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_tutorial/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const AuthScreen(),
      /* Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('Amazon Clone Page'),
            ),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AuthScreen.routeName);
                },
                child: const Text('Click'),
              );
            })
          ],
        ),
      ), */
    );
  }
}
