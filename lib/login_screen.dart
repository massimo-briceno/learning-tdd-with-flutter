import 'package:flutter/material.dart';
import 'package:test_learning/home_sreen.dart';
import 'package:test_learning/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const _routeName = "/login";
  static get routeName => _routeName;

  @override
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Center(
          child: Text('Login'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                key: const Key('email'),
                validator: (value) => Validator.validateMail(value ?? ""),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                key: const Key('password'),
                validator: (value) => Validator.validatePassword(value ?? ""),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() == true) {
                    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  }
                },
                child: const Text('SignIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
