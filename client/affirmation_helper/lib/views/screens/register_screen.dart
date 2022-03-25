import 'package:affirmation_helper/controllers/user_http.dart';
import 'package:affirmation_helper/views/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  Future<void> _register() async {
    if (_confirmPasswordEditingController.text ==
        _passwordEditingController.text) {
      httpregisterUser(Client(), context, _usernameEditingController.text,
              _passwordEditingController.text)
          .then((value) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Column(
        children: [
          CustomTextField(
              title: 'Username',
              textEditingController: _usernameEditingController),
          CustomTextField(
              title: 'password',
              textEditingController: _passwordEditingController),
          CustomTextField(
              title: 'Confirm Password',
              textEditingController: _confirmPasswordEditingController),
          ElevatedButton(
            onPressed: _register,
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
