import 'package:affirmation_helper/controllers/user_http.dart';
import 'package:affirmation_helper/views/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();

    Future<void> _login() async {
      try {
        httpGetUser(
                Client(),
                context,
                usernameEditingController.text.toLowerCase(),
                passwordEditingController.text)
            .then((value) {
          print(value);
          Navigator.of(context).pushNamed('/LandingScreen');
        });
      } catch (e) {
        print("This threew");
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: Column(
        children: [
      CustomTextField(
        title: "Username",
        textEditingController: usernameEditingController,
      ),
      CustomTextField(
        title: "Password",
        textEditingController: passwordEditingController,
      ),
      ElevatedButton(
        onPressed: _login,
        child: const Text('login'),
      ),
        ],
      ),
    );
  }
}
