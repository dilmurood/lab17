import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab17/Login.dart';
import 'package:lab17/MainPage.dart';
import 'package:lab17/SignUp.dart';
import 'package:lab17/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.red, fontSize: 20),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
        ), // TextTheme
      ), // ThemeData
      home: Login(),
      routes: {
        '/Login': (context) => Login(),
        '/SignUp': (context) => const SignUp(),
        '/MainPage': (context) =>  MainPage(),
      },
    );
  }
}
