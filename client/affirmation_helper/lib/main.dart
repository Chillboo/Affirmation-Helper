import 'package:affirmation_helper/models/connection.dart';
import 'package:affirmation_helper/views/screens/landing_screen.dart';
import 'package:affirmation_helper/views/screens/login_screen.dart';
import 'package:affirmation_helper/views/screens/register_screen.dart';
import 'package:affirmation_helper/views/widgets/text_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/moods.dart';
import 'models/user.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Moods()),
        ChangeNotifierProvider(create: (_) => ApiConnection()),
        ChangeNotifierProvider(create: (_) => User.noValues()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Affirmation helper'),
      routes: {
        '/LoginScreen': (context) => const LoginScreen(),
        '/RegisterScreen': (context) => const RegisterScreen(),
        '/LandingScreen': (context) => const LandingScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage('assets/images/home_image.png'),
              ),
            ),
          ),
          InkWell(
            child: CustomTextWindow(width: 250, height: 50, text: 'Login'),
            onTap: () => Navigator.of(context).pushNamed('/LoginScreen'),
          ),
          InkWell(
            child: CustomTextWindow(width: 250, height: 50, text: 'Register'),
            onTap: () => Navigator.of(context).pushNamed('/RegisterScreen'),
          ),
        ],
      ),
    ));
  }
}
